Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20C1F0E32
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 22:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763591003; cv=none; b=bKRP0aYntv7KFCNk4be/Iprvz0Ggj1yftSZQaV6S3UPAOS3HCMSfekIBpLltQ81aK7vd/RleSZ/eTkBxpHYQtMYLGVkW4XcaIYzSzdRGa8wKd1B4H5K48y6z0byVqzYYb6gHkdvxKNjgKyos0FV2J7YuE1KFi6Ad7/F3zx5UHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763591003; c=relaxed/simple;
	bh=kOPSLINu5BIGD8wdi0XJOT8GqQnnCfeWFAvT8Y/uBl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWJLIXaXC2j/z2Q1tM6dVCiBb0G0WW/+EufSKfK19kLooLCAxRu3TDzarfDNVSErStMasGFAaBbSCa0s22n8cplDIvSnvdtk+vbazr8i1VQCNcbMK1+s39jpaGpjKEWIs/8AvAJPgketPu/hGs3Mb6aQXott3/xHiF9j064BC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jyidim6w; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jyidim6w"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7baf61be569so227088b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 14:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763591001; x=1764195801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X8UCcv8WJcfbX/BhlHKUUmS50h9EVe0DKujQxp7fJEI=;
        b=Jyidim6wHtonYGNGCVd2D9BBE10uuW2MXfKINNIxlGDjb/PRIpOElX/lcnBJvJNPmo
         9FkvHUlbmcItgvsMQej98W5IKpF1Bc5VTBuR8n62jGNWgbOKz6D2RQJAb5saa4PhWpR5
         ZspJZjiceXoHuUEpXRFyiv9hhrEyqsb6G1gxrT0NUf9uCWGRaysoobzyenCOivjBWZO6
         RrvKv//TEunyLdQnYr+UwtHlJtQxjO4u7cAb/z7a2AuFLEeqa48bUxQjq3a0y8hAm9om
         elXiK51AWDV2pfj/jbZkPni/be8TCXsoV1rhNJBjUMUwMLKWPvLnB3pnNWhAG4uACdMD
         nFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763591001; x=1764195801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8UCcv8WJcfbX/BhlHKUUmS50h9EVe0DKujQxp7fJEI=;
        b=ayVRh4R0EbMrJbpUDY3GUbXtSCMrz9G9QIaRDrWB0gAeSaTSSb4nBYv9ahogCqFH6Y
         kzDgToepm4ef96ZgBpApNS2uai8u8hapi8UI2tei5jSrFKm0HejQ8JbgQzEQKvKTw/ep
         req8N3c9iwMDH1gcEwWBkKq8QyKjI9JMLR4Lw2yogbGULpddfXSdgIxOXtdZEDHQm9Pq
         2eSfY2718ga7vunRUn0fCk5GzWKRWqgy+Vfm50ooNdiARKOISDhv9rXgBhsuAJ72BZGI
         WE06tHQD6qgg2gZ/7qtvksWISl3RsSx8jhrgakeCjA9UM8psHBBBGq/pVSPsWPgzFrZm
         8Unw==
X-Forwarded-Encrypted: i=1; AJvYcCXCsZc43kljqgLXSy4x/E0BS5kr+XaI8VA8U1BavPqH82cjGw0OxEQwTiR3wwWqjPXce9TkOlTkQQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFxQvkRkkUPdn+uPbOh4o8XCoid4x74CCQY5bNwxmZ2dlrQG57
	fWD3Yp0e2u5bBfsJbjD8koHexw6qwrv7n9u28JLfb8XAupaqIUNM3/ZQ
X-Gm-Gg: ASbGnctEYM7a60Kw+WiTfjcZtSgm+pjLwheUihPnZQf3w/dAnH/SVrDHSKEotCeP1AL
	nqhRIOXt7iU9084wB1UWaC/SXujeF6KzQglfarQQIoDM1uYRM/30tw2LxNgBdGDXac4MTVLTp+9
	aPa3VQCrzUVnQH+rBOw+Xu/fQAxc/FGDwAui1IOaHr9/cm9DykswiybVD8dqNImEm50nqBjl/n9
	iYuRTOwZsKrn90wRrMxDFlJUj4VuJIUi2ZRWrJHrRK7XfmUDG1TD+aOR1ZTo08B8P/TAj+V4BrL
	NWEJw9v8/Ltz1PLJUYuJ+0xlor4oY+Va0Bid8YDkqWfzyBBEYtvVvq1BGFQS3hTlabmjSMo7WPV
	XY4SkxF6Wm8gdzmp4tATjfXDJUWLh1BM96VXU0CsQmB0fLHEJ2hfXmG1/oMOwFdPQvmzf+cVUpI
	HCJ+EOvztgeWgPPZciRNy/gFsJACiCcV60qk1zJCC5gSWIGc7urYclfBr4NkQ4wyUUrWtyY3JpM
	SMgtuS1
X-Google-Smtp-Source: AGHT+IGLyyUhWxITKqLXs3xMSNmqH+iaLGjGmw+PkUvYoUNNvU8QhUaV0xMzsenVLMrOnXg9dKZzIw==
X-Received: by 2002:a05:6a20:2586:b0:33e:6885:2bd4 with SMTP id adf61e73a8af0-3613b5eb0e7mr1319930637.29.1763591000803;
        Wed, 19 Nov 2025 14:23:20 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f023fba8sm385465b3a.41.2025.11.19.14.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 14:23:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6b5cd51f-be90-4646-9cfa-278e16c09dbe@roeck-us.net>
Date: Wed, 19 Nov 2025 14:23:17 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: Add driver for wsen tids
To: Thomas Marangoni <Thomas.Marangoni@becom-group.com>,
 linux-hwmon@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 Jonathan.Cameron@huawei.com, michal.simek@amd.com, nuno.sa@analog.com,
 Frank.Li@nxp.com, wenswang@yeah.net, apokusinski01@gmail.com,
 dixitparmar19@gmail.com, vassilisamir@gmail.com, paweldembicki@gmail.com,
 heiko@sntech.de, neil.armstrong@linaro.org, kever.yang@rock-chips.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, mani@kernel.org, dev@kael-k.io,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
 <20251119125145.2402620-4-Thomas.Marangoni@becom-group.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251119125145.2402620-4-Thomas.Marangoni@becom-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/25 04:51, Thomas Marangoni wrote:
> Add support for the wsen tids. It is a low cost
> and small-form-factor i2c temperature sensor.
> 

Additional feedback:

> +
> +static ssize_t tids_interval_write(struct device *dev, long val)
> +{
> +	struct tids_data *data = dev_get_drvdata(dev);
> +	unsigned int avg_value;
> +
> +	avg_value = find_closest_descending(val, update_intervals,
> +					    ARRAY_SIZE(update_intervals));
> +

Turns out find_closest_descending() can not handle large negative values
(close to the limit) correctly. val needs to be clamped to a reasonable range
(say, [0, 100]) before passing it to find_closest_descending().

> +	return regmap_write_bits(data->regmap, TIDS_REG_CTRL,
> +				 TIDS_CTRL_AVG_MASK,
> +				 avg_value << TIDS_CTRL_AVG_SHIFT);
> +}
> +
> +static int tids_temperature1_read(struct device *dev, long *val)

The "1" in the function name is really not needed here.

> +{
> +	struct tids_data *data = dev_get_drvdata(dev);
> +	u8 buf[2] = { 0 };
> +	int ret;
> +
> +	ret = regmap_bulk_read(data->regmap, TIDS_REG_DATA_T_L, buf, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* temperature in °mC */
> +	*val = (((s16)(buf[1] << 8) | buf[0])) * 10;
> +
> +	return 0;
> +}
> +
> +static ssize_t tids_temperature_alarm_read(struct device *dev, u32 attr,
> +					   long *val)
> +{
> +	struct tids_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (attr == hwmon_temp_min_alarm)
> +		ret = regmap_test_bits(data->regmap, TIDS_REG_STATUS,
> +				       TIDS_STATUS_UNDER_TLL_MASK);
> +	else if (attr == hwmon_temp_max_alarm)
> +		ret = regmap_test_bits(data->regmap, TIDS_REG_STATUS,
> +				       TIDS_STATUS_OVER_THL_MASK);
> +	else
> +		return -EOPNOTSUPP;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = ret;
> +
> +	return 0;
> +}
> +
> +static int tids_temperature_minmax_read(struct device *dev, u32 attr, long *val)
> +{
> +	struct tids_data *data = dev_get_drvdata(dev);
> +	unsigned int reg_data = 0;
> +	int ret;
> +
> +	if (attr == hwmon_temp_min)
> +		ret = regmap_read(data->regmap, TIDS_REG_T_L_LIMIT, &reg_data);
> +	else if (attr == hwmon_temp_max)
> +		ret = regmap_read(data->regmap, TIDS_REG_T_H_LIMIT, &reg_data);
> +	else
> +		return -EOPNOTSUPP;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	/* temperature from register conversion in °mC */
> +	*val = (((u8)reg_data - 63) * 640);
> +
> +	return 0;
> +}
> +
> +static ssize_t tids_temperature_minmax_write(struct device *dev, u32 attr,
> +					     long val)
> +{
> +	struct tids_data *data = dev_get_drvdata(dev);
> +	u8 reg_data;
> +
> +	/* temperature in °mC */
> +	val = clamp_val(val, -39680, 122880);

(0 - 63) * 640 = -40320

While this is a bit below the "official" limit, it is the default value in
the chip register. Writing a limit that is read from the chip should be supported,
so the range should be clamped to [-40320, 122880].

Thanks,
Guenter

