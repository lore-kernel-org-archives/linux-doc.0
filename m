Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37CC30C17D
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960113; cv=none; b=muyr9la0NXgLUEOnZWr5m4KbrXVEQXw+1rHjLBFWJqrIL9B/Z1ywFsz32aS36B4ffdyp8Ae14n6Kivc3UgvnA9455Nuwf8N2PBbtIFZkntaN7nuhl2HYrh50RfjA7gwFmydqR0Vc1IR6aB6FJD2Um/Jy07uIrxdzfOPClB28uM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960113; c=relaxed/simple;
	bh=NnjdJ0VTzldu49W5mcdmVmQl1rEFGjOR7UXnupRT89o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNUl7D1DzcUxLKOAFkDz56XisPAKL+4DjgZL7B0iHWv1uBl1vRsDd7clLpjpwJdu8xeWT7sqmh8Bxsq74KNXnvCDmiWHk3v3yRLgTb5rPEe4Yjk306AIfemJkjqezIGuX1Y2Io+mNsv5UZ00AnAgTGBCcVfFJtCIzsiXaeGAyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=ycSFdIHX; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="ycSFdIHX"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-699a23b2b08so177209eaf.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778960111; x=1779564911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2i7S9wo1ePdNkbO172mKq17H2QCBIBfTWKgSltqMeIg=;
        b=ycSFdIHXs9K+m3s4gmn0h5deTpkDt9ZhNq9w2hQhZ17c57ZrA1XU+xgHxu79eyPdH3
         /GCKWJKltawnEfsWVBnGgkyL3i9u6ZXxZPAkzJkcTNBCaHQm+nkMNUZFrMiqx3cnL7i0
         qApuwisVDLguS2/wyn4jLE3cDIIOsWJHaKfSUMcg89FTkPLCKcK5V9BfQehB1pFjJkjs
         pMX1XRSxyUFqyr4X81SgiJ0YJ9icqJQYUe/k4EA0Dm+JtVjux97j7Cpjr+5ku4dGXX83
         Sq0kuUjLH9ZKe2OSDdqpXNyfhHauBOSAfEgfOcfNOE+swwEHH8BxM19a03ziVhc/la1b
         +0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778960111; x=1779564911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i7S9wo1ePdNkbO172mKq17H2QCBIBfTWKgSltqMeIg=;
        b=NpxgNM7B9l+y0vJK3oKw1AyeZncSU/BN8gD9LqEQPPo/NOwO6VdLpNljC+lPt9Eiju
         rwOLF+zM1C7dR9XGBQEL6hbaU3wUB8pj8KCyDjFSP1e2LTStFTSZVq3QiwA4T0s6FZrc
         ocAC6uzGwOqc60jDYs7r1u/sSuhieYWHpjlcpVK/jY6acUQLKUekBM49x+qA5W+4KE32
         8w/NpdQAce1ab8+RuTr57H7wX3kMeH+klBGTYtiJGXz8IJ/xFmplNzxmhKbtPKlDEo0C
         knyhOBOkk1KuYo4SuZeqRlYgzUXlQWqKc05HTIhSe0KuuvTHBNlPEoMeEiW4/CYghM3N
         wQxw==
X-Forwarded-Encrypted: i=1; AFNElJ+P+If4geSqMLHNMxNZRexxO/GRCy3VsGO4BTKIKpEXgkdXG3XCYbHomA0hC1lgrDK8MumGGYdYh1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo1BqvQ5jI2ia5htnSM7STBJoB75s4qpwNXDL0vCEgf36X3Een
	vwI919pC63Z+N0Bouf3KQ8bHqL5duIEkYpRw6zA1FB3GAPE4j2V3erPzM0UD2vaCKHM=
X-Gm-Gg: Acq92OEMljYyOZOaoMHlUc8UiT6PSt8Ywivjy3qcBCDWMAjIZUmuJbi1niR8Z++Uatt
	byh+lCazm1GoukLaeZnAUQmIeFiNcXKgYRj+P8EWk+JdBTDf4IugJC/4ToILpGxX1PaK1CdskUO
	nYRQW4dL7icHLcwP3H200suB5tl7br6uH8qywFexAGDV3FmpjvDrzCaSuex6a+bdmBlnXdd9apb
	Cdc7zYkjb60sdTmcOPiO/pci/FitqpKigGl7DyzVD7jXFMhKNHdXTWsnBbWhaeJTbTM5AfKz43B
	v4YAhMal4tJcfBs8zVHkHKskbGIclyie7FcWjFB/mvWttMLfJIjRZzn0CrOoWHLNmBSfipFkC8C
	QWW6FM3SSwawVRKKBWO+dlgOBST3GIKKZXoxHoUTYrowL57tm91WzI5ANw/cAOwJ+qaH1ZSpEX0
	37rF0JMauSzJ66wBJ+3mnPpyQL1RRQomGYP0mO6TJk4SNbXr30VSsNqb3w05rgwcbBdtjOGDJZB
	g==
X-Received: by 2002:a05:6820:2017:b0:694:a2c9:2d50 with SMTP id 006d021491bc7-69c9c07d4fbmr5938765eaf.59.1778960110874;
        Sat, 16 May 2026 12:35:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b36d:bd18:7c02:29e2? ([2600:8803:e7e4:500:b36d:bd18:7c02:29e2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d048b3c51sm3071760eaf.11.2026.05.16.12.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:35:09 -0700 (PDT)
Message-ID: <2f74e76e-b066-40ac-9cb4-c75137c9825d@baylibre.com>
Date: Sat, 16 May 2026 14:35:09 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: dac: Add AD5529R DAC driver support
To: Janani Sunil <janani.sunil@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Janani Sunil <jan.sun97@gmail.com>
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-2-e315441685d7@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260508-ad5529r-driver-v2-2-e315441685d7@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/26 6:55 AM, Janani Sunil wrote:
> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> 

...

> +#define AD5529R_DAC_CHANNEL(chan, bits) {			\
> +	.type = IIO_VOLTAGE,					\
> +	.indexed = 1,						\
> +	.output = 1,						\
> +	.channel = (chan),					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
> +			      BIT(IIO_CHAN_INFO_SCALE),		\
> +	.scan_type = {						\

> +		.sign = 'u',					\

This field has a new name `.format`.

> +		.realbits = (bits),				\
> +		.storagebits = 16,				\
> +	},							\
> +}
> +static struct regmap *ad5529r_get_regmap(struct ad5529r_state *st, unsigned int reg)
> +{
> +	if (reg <= AD5529R_8BIT_REG_MAX)
> +		return st->regmap_8bit;
> +
> +	return st->regmap_16bit;
> +}

Another way we have done this is make custom read/write functions for the
regmap itself so that we don't have to have two regmaps.

> +
> +static int ad5529r_debugfs_reg_read(struct ad5529r_state *st, unsigned int reg,
> +				    unsigned int *val)
> +{
> +	return regmap_read(ad5529r_get_regmap(st, reg), reg, val);
> +}
> +
> +static int ad5529r_debugfs_reg_write(struct ad5529r_state *st, unsigned int reg,
> +				     unsigned int val)
> +{
> +	return regmap_write(ad5529r_get_regmap(st, reg), reg, val);
> +}

Would be more logical to move these closer to the struct that
references them.

(I snipped a bunch of functions here)

> +
> +static int ad5529r_reg_access(struct iio_dev *indio_dev,
> +			      unsigned int reg,
> +			      unsigned int writeval,
> +			      unsigned int *readval)
> +{
> +	struct ad5529r_state *st = iio_priv(indio_dev);
> +
> +	if (!readval)

Might as well swap these and avoid the !.

> +		return ad5529r_debugfs_reg_write(st, reg, writeval);
> +
> +	return ad5529r_debugfs_reg_read(st, reg, readval);
> +}
> +
