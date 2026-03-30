Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779B33B2FD5
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862897; cv=none; b=LZP33lAyR/eiZYVRVeAXT61b1nuFmwS0QsUYzWg1YoUpiX3gLE0VxDqqgZ61h0v0B7B57soo5fm1fmWT84W5n4mA49MYYG5TxVD9DNUNW/fhpoA7ysf3agt866uKju0mjeDt8emo8ZsayDztxJcyhHJPgkEj7XMs2OvAHoFTtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862897; c=relaxed/simple;
	bh=A0pfCojUiGgrrf0Ej5R1kBaQcEv947GaCDZ90NppBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iooAM7c/v5vfOGqkfCeJQG5NJQsKmm/Goc9PwgdSBfxYazUCQ1NAeLNed+Eb5qC44148f4ma4vO0R19PZCXhMbBCnDyupiVfVf5hI+Xazb/8AADUngmlPjSTe9J24iQC+wUmcz3MjP4/nxjTaRQdfV1HxJWTFd0NEqRz+gmM6Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqYuHeQ2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqYuHeQ2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so35304165e9.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862895; x=1775467695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3zDHIQyb3IezUESO9F09MAim9FoAsOYTRYDFkmxzVFg=;
        b=RqYuHeQ2zIlSNVIp8Y01sDKtexz5NJFxXDwwOWBCgszHinnN4Z6/AMcNkBLcWbigFn
         OXY8/eVUs/bkVcNDvMJlHzG5ZHfIIux8kCXkFXJv6CNVckuazEgO6KLX2qe3IYUHsX4c
         t8gjAvpYHbbyt2MWTK7717BHmVI9u8WhTcMDvNtN7gwhCHKEzoSpvPKa5Ra79xGJWsDg
         sPAaMwlVl6IaItM3tynUcu6m4jdFSTaWDJ9X+VW4N73b6pp2fo6oEOkdY8utKBA0gM+w
         x9wWINUCYasrsN1eyIyuy/pxjHHeZz6ACik8eHIMcNsVRucUQO1fAoHUWGSjMi5yDzAX
         BbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862895; x=1775467695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zDHIQyb3IezUESO9F09MAim9FoAsOYTRYDFkmxzVFg=;
        b=Q1xINOFEbkU2hvj5wNvPNaAzJudtibpQ3FeADGCvKsXwCM/1pVUiMZeEXyte5iF5vi
         nTKIk3asXvaxv1KEL17ECPGFHuk72KkMKDta2KH5mgDigndvmZI+a3R6xsiMF25VdDXz
         6cNyJT1BI7p4oobHs3A0aJ8myWIUvyX31fBB2EZ64fPBMGurB0J9Q068QCxvC25zyDhV
         ydN/0mdOle39Vzy79EqpeDo6pdwuFMQpiT9tqYM1JqrCVvGcR6wZtgUpTeDpDouBVsXq
         RKvUcZI6usVWmpIQOK3xfyBf1bE+ksosbXLdiQKF40FW9E5gQG12HIBlI1nWACL3hBUb
         i08w==
X-Forwarded-Encrypted: i=1; AJvYcCUU6lWtkdPoksfw1UmQW8diUfzjhfAf819WtC8qo9kNU0zKWYEghsg6uqVOHErMn4PD/gf2+dyH+vI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyk5pijqqbLhyBiQgjJUEtMcj1baUviy3eFi8R7zOrtt668BFE
	AkqkHoGVCYLbWAxp8cJVDvd+qYYXnFF9SxO9Oj3zRNDzfOSh7uxFa6Wv
X-Gm-Gg: ATEYQzwjOg7ueZDAoH5lMudoWJrIQ/ww9CUOFXdK3OGUCKSu99vZL7pgeZTJcxVieI3
	QPeEC17yMF4uG4ZhG2hyUGSSXOSNhY5pZNg7KwYlgDHIMVL4A25aB6iZt2AaFuiXzl8qexO+PMS
	n2JK1k+B4FIAzvWWLVd3gH8t0HkdIag6Qhe383fVOCPEhCtjw1Cyx4P9Oz3gARxg7qyP4v/S0h9
	VK0caNMzpKEgGHReyUFNf5KVcxC/AM0oqewYPEFcFMSeOUTBVuRf3YZykvcEY9njLN9hifMoRBX
	g4kNYyT4rPghM3unzVf5wA6YnJgTcJqo/d4K9zPx0fi7cpCBCsg2xIvtXIH971C+Lo26HxMMHr7
	o8a8lQJM34LvQMgDm8sRl+Iv7JK6XkbGKrESKDlCIzbeiBckDA6s2QpjrLpZw1WR9Ygd0/IGUOg
	f7/WXTedAWyD+Z
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-487280a25c4mr210099595e9.31.1774862894489;
        Mon, 30 Mar 2026 02:28:14 -0700 (PDT)
Received: from nsa ([45.94.208.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm74265215e9.0.2026.03.30.02.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:28:14 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:28:59 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <aco5L_6SZIB2DdpF@nsa>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-ltc4283-support-v8-2-471de255d728@analog.com>

Hi Guenter, Regarding AI review, I think most of the points were
discussed in previous revisions, but there are two valid.

On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
> Support the LTC4283 Hot Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  Documentation/hwmon/index.rst   |    1 +
>  Documentation/hwmon/ltc4283.rst |  266 ++++++
>  MAINTAINERS                     |    1 +
>  drivers/hwmon/Kconfig           |   12 +
>  drivers/hwmon/Makefile          |    1 +
>  drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
>  6 files changed, 2077 insertions(+)
>

...

> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> +				 bool max_alm, long *val)
> +{
> +	if (channel == LTC4283_VPWR)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  BIT(2 + max_alm), val);
> +
> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
> +		/*
> +		 * Lower channels go to higher bits. We also want to go +1 down
> +		 * in the min_alarm case.
> +		 */
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> +					  BIT(7 - bit - !max_alm), val);
> +	}

"Will this condition handle the ADIO12 and ADIO34 differential channels?
It looks like channels 14 and 15 fall through to the default return intended
for the DRAIN channel. Since reading the alarm implicitly clears the register
bits, could reading these ADIO alarms unintentionally clear actual DRAIN
alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"

Good catch and should be:

-       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
+       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {

> +
> +	if (channel == LTC4283_CHAN_DRNS)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> +					  BIT(6 + max_alm), val);
> +
> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> +				  val);
> +}

...

> +
> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev, *hwmon;
> +	struct auxiliary_device *adev;
> +	struct ltc4283_hwmon *st;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA |
> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> +		return -EOPNOTSUPP;
> +
> +	st->client = client;
> +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
> +				   &ltc4283_regmap_config);
> +	if (IS_ERR(st->map))
> +		return dev_err_probe(dev, PTR_ERR(st->map),
> +				     "Failed to create regmap\n");
> +
> +	ret = ltc4283_setup(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> +						     &ltc4283_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ltc4283_debugfs_init(st, client);
> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");

"Does this allow multiple LTC4283 chips to probe successfully?
Without allocating a unique ID per I2C instance, it seems the first probed
chip takes the generic name. If a second chip is present, it might attempt
to register with the exact same name, resulting in a failure in device_add()
and aborting the probe."

Also looks valid and I suspect is one of those that a quick look will
find more "offenders". I would purpose:

-       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
+       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
+                                             &st->gpio_mask, client->addr);

If there's nothing else and you agree with the above, is this something
you can tweak while applying or should I spin a new version?

Thanks!
- Nuno Sá

