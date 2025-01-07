Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006E1F8904
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269891; cv=none; b=NbNO97k0Zx08/q+v9uYwTFRPLJsEiLLGv8E0OAPYtGu9a6QH3XsUsr1Xtr2Fh9+FAqyyEupTYZp13dSDOy4QQYuKynKqmjnqQRrQvN+YFGKL2bvOXfmgXqrDg4b8CbH8B0Y7OJSuX9G6C33BC4V/WTyVoiwbXUGJmf6/PehOfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269891; c=relaxed/simple;
	bh=RHcGOwFj6Jj9rNjb5pyQYkYxU2y0c/tWEc9adntSoQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qH+uYjxO5bWAscPe3AEFy5TcY353tuxW5ve9DJhzNJtWrku5nqBuI6Nzub/WPgigu7kPnc/U0wz/k/xjLsUO3IJvcn3zEtu8j2jWRtIQobX6hbscEJGaEnCOAoVrx6S4/gVpxN5TUL4RdQhOoL0+xKcHtjXrIBKylTSCoeCQUsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jm892v4p; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jm892v4p"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-721d213e2aeso467431a34.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736269886; x=1736874686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGDpKNIDhwHgkRrd8foDUC41Tml+wnuDNu94VoXOc5M=;
        b=jm892v4p5CCeyFm+Yp3ki/xQPoH7OX+ZmJ/U516C95xXt1Q1hUgDLda6ZI/ArZ7raQ
         K807yDxkARZXp9VEC3wy+KXCTxAJmKpASyz0NR0wSVa6MihLs/t7Cg3vMWor5I+OvD+A
         SizNvGWtsRdD1lMmmgFFoBXS41OwcZibtu3rWJtLuIz7EUy2NnPQYsRwk6ZKSfkGiby4
         m1AZvWxCkWpEec8tC/CvsbGXbqmqw3P5aojT65eAMPYMRXRnV7+wX+1NZqPWUHP8vpLs
         5BqgAk8yft1JlBJqb8HOMkvy9Mz+hI7UnutM9H/ijI6M7Fp//URzlzUX9NmLvzLs+xMZ
         wb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269886; x=1736874686;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGDpKNIDhwHgkRrd8foDUC41Tml+wnuDNu94VoXOc5M=;
        b=LolUBbBOQ+JNulbCRkp9hq9+QopaFO4OwAk3NykNRObdqrMQMnrxXWyBvYvTcWUT6s
         2eorYl7bO3g32ONZ4kEAsQDCzykdc14ubwpMmDzcVn124J/Xms5fBKJPYGDmlw5Px1BM
         cGvcp1oe4tofYrrZX0r67D8aUUgibu1CjmDd7lvQ0IPbMMysmtizasBd0bVY+Z9kpRuj
         VlwTtaJM/nj/rOdyB/UFuJaw2lFaxlraLwIxA660iXAZric6KVhDy3lrYyYTB62jHvqM
         hIyTjzvQO262QbkkEQwmeHHOFw7jJYlEl/AzuywaxFGFwY5qhq3IgY4oJNx6TG/mfHqw
         Lpxw==
X-Forwarded-Encrypted: i=1; AJvYcCUHuMwuZ8tj6laAS5B3R0bq5b69kYALmur1DuQjjJ+1pprk4eRdSslzWQhuEuRpYQx+tMU5aLYHhG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKb01BPRxPbfveK4gyQcDU8JxI0IN6uj7QvgkKA/GNhyWqrO50
	FqAepngu7TUrG4WjATqjou6UmIJL0qK/QAylUqFmMmG0X6Jb3rm1TTVhQoB8XwQ=
X-Gm-Gg: ASbGncva1yaJcK/LZfULMgbZtUnYbEZK1yTNVPq92Iq2Ok763WGnn5Lh+cOFfN/GwSw
	2gn2rarfJ0pm3wrxV7Eg42wfFeTRBhgSfVsz0JJwvpAGj6TgWzWhGBUXBnqdGocK8/Ej6fBlgLQ
	dbutAJimHa4wn5VEyl0BwGWxXckFzwVEf1Ub0oD1EtXT7Q4zcT6wZvZ4iE2euC5Qv8E1SFo0/oB
	9PVnLa82yZhjt44zZz7p3SsS9m4Ivr98fKFmICL2dmiuOEtDxoTW8zMgnXJOYMdae8aYCTxW2y+
	hd4S8XEAsjn7aoB0YQ==
X-Google-Smtp-Source: AGHT+IFFAStE0PAvTO+jh6r5YnTPF2eK18OSXOLEzH3xFJcpk63J/EyIwhEYEe5g9NEBcwA5qS73Rw==
X-Received: by 2002:a05:6830:7306:b0:71d:f068:1ff3 with SMTP id 46e09a7af769-720ff6d4303mr38018237a34.8.1736269886323;
        Tue, 07 Jan 2025 09:11:26 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97642f5sm10536657a34.6.2025.01.07.09.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:11:24 -0800 (PST)
Message-ID: <283d2478-8788-44fb-bb22-48968250d71f@baylibre.com>
Date: Tue, 7 Jan 2025 11:11:24 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] iio: adc: ad7380: add alert support
To: Julien Stephan <jstephan@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
 <20250107-ad7380-add-alert-support-v3-4-bce10afd656b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250107-ad7380-add-alert-support-v3-4-bce10afd656b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/25 2:48 AM, Julien Stephan wrote:
> The alert functionality is an out of range indicator and can be used as
> an early indicator of an out of bounds conversion result.
> 
> ALERT_LOW_THRESHOLD and ALERT_HIGH_THRESHOLD registers are common to all
> channels.
> 
> When using 1 SDO line (only mode supported by the driver right now), i.e
> data outputs only on SDOA, SDOB (or SDOD for 4 channels variants) is
> used as an alert pin. The alert pin is updated at the end of the
> conversion (set to low if an alert occurs) and is cleared on a falling
> edge of CS.
> 
> The ALERT register contains information about the exact alert status:
> channel and direction. ALERT register can be accessed using debugfs if
> enabled.
> 
> User can set high/low thresholds and enable alert detection using the
> regular iio events attributes:
> 
>   events/in_thresh_falling_value events/in_thresh_rising_value
>   events/thresh_either_en
> 
> In most use cases, user will hardwire the alert pin to trigger a shutdown.
> 
> In theory, we could generate userspace IIO events for alerts, but this
> is not implemented yet for several reasons [1]. This can be implemented
> later if a real use case actually requires it.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> 
> [1] https://lore.kernel.org/all/4be16272-5197-4fa1-918c-c4cdfcaee02e@baylibre.com/
> ---

...

> +static int ad7380_read_event_config(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir)
> +{
> +	struct ad7380_state *st = iio_priv(indio_dev);
> +	int alert_en, tmp, ret;
> +
> +	ret = iio_device_claim_direct_mode(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(st->regmap, AD7380_REG_ADDR_CONFIG1, &tmp);
> +
> +	iio_device_release_direct_mode(indio_dev);
> +
> +	if (ret)
> +		return ret;
> +
> +	alert_en = FIELD_GET(AD7380_CONFIG1_ALERTEN, tmp);

nit: return directly and drop alter_en.

> +
> +	return alert_en;
> +}
> +
> +static int ad7380_write_event_config(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     bool state)
> +{
> +	struct ad7380_state *st = iio_priv(indio_dev);
> +	int ret;
> +
> +	ret = iio_device_claim_direct_mode(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(st->regmap,
> +				 AD7380_REG_ADDR_CONFIG1,
> +				 AD7380_CONFIG1_ALERTEN,
> +				 FIELD_PREP(AD7380_CONFIG1_ALERTEN, state));
> +
> +	iio_device_release_direct_mode(indio_dev);
> +
> +	if (ret)
> +		return ret;
> +
> +	return 0;

return ret;

> +}
> +
> +static int ad7380_read_event_value(struct iio_dev *indio_dev,
> +				   const struct iio_chan_spec *chan,
> +				   enum iio_event_type type,
> +				   enum iio_event_direction dir,
> +				   enum iio_event_info info,
> +				   int *val, int *val2)
> +{
> +	struct ad7380_state *st = iio_priv(indio_dev);
> +	int ret, tmp;
> +
> +	switch (info) {
> +	case IIO_EV_INFO_VALUE:
> +		ret = iio_device_claim_direct_mode(indio_dev);
> +
> +		switch (dir) {
> +		case IIO_EV_DIR_RISING:
> +			ret = regmap_read(st->regmap,
> +					  AD7380_REG_ADDR_ALERT_HIGH_TH,
> +					  &tmp);
> +			if (ret)
> +				return ret;

Can't return directly here without releasing direct mode.

Suggest to move everything between claim and release to a helper function to
simplify things (avoiding goto and break).

> +
> +			*val = FIELD_GET(AD7380_ALERT_HIGH_TH, tmp);
> +			ret = IIO_VAL_INT;
> +			break;
> +		case IIO_EV_DIR_FALLING:
> +			ret = regmap_read(st->regmap,
> +					  AD7380_REG_ADDR_ALERT_LOW_TH,
> +					  &tmp);
> +			if (ret)
> +				return ret;
> +
> +			FIELD_GET(AD7380_ALERT_LOW_TH, tmp);
> +			ret = IIO_VAL_INT;
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		iio_device_release_direct_mode(indio_dev);
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ad7380_write_event_value(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir,
> +				    enum iio_event_info info,
> +				    int val, int val2)
> +{
> +	struct ad7380_state *st = iio_priv(indio_dev);
> +	const struct iio_scan_type *scan_type;
> +	int ret;
> +	u16 th;
> +
> +	switch (info) {
> +	case IIO_EV_INFO_VALUE:
> +		ret = iio_device_claim_direct_mode(indio_dev);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * According to the datasheet,
> +		 * AD7380_REG_ADDR_ALERT_HIGH_TH[11:0] are the 12 MSB of the
> +		 * 16-bits internal alert high register. LSB are set to 0xf.
> +		 * AD7380_REG_ADDR_ALERT_LOW_TH[11:0] are the 12 MSB of the
> +		 * 16 bits internal alert low register. LSB are set to 0x0.
> +		 *
> +		 * When alert is enabled the conversion from the adc is compared
> +		 * immediately to the alert high/low thresholds, before any
> +		 * oversampling. This means that the thresholds are the same for
> +		 * normal mode and oversampling mode.
> +		 */
> +
> +		/* Extract the 12 MSB of val */
> +		scan_type = iio_get_current_scan_type(indio_dev, chan);
> +		if (IS_ERR(scan_type))
> +			return PTR_ERR(scan_type);

Same with this function, it isn't releasing on error, so we can use a helper
here too to solve it.

> +
> +		th = val >> (scan_type->realbits - 12);
> +
> +		switch (dir) {
> +		case IIO_EV_DIR_RISING:
> +			ret = regmap_write(st->regmap,
> +					   AD7380_REG_ADDR_ALERT_HIGH_TH,
> +					   th);
> +			if (ret)
> +				return ret;
> +
> +			break;
> +		case IIO_EV_DIR_FALLING:
> +			ret = regmap_write(st->regmap,
> +					   AD7380_REG_ADDR_ALERT_LOW_TH,
> +					   th);
> +			if (ret)
> +				return ret;
> +
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		iio_device_release_direct_mode(indio_dev);
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
