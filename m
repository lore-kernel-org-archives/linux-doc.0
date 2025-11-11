Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32383369988
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762880858; cv=none; b=uFKcb7LZcFnnHREiqFpxVrgOumJKqyp+J796p4eOp+BbT1mN2m6KCMR3yWZcikB6fyflzHmTxffK/KxzjRBlRkwuAiRHFoRlCBBXmzuZ4uQ24L01QCqWbByPDbOdYfi6n9XFWX+JeZLMdZOEcWWsvq7ZQyrzkJSx0Pl896bKjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762880858; c=relaxed/simple;
	bh=VEsvXBuMJaslD78nHbemGjp1X8vOb2HF472M+Tj9XoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=okqMDbVo2fJlSpj7VSgmOUxPYv2iH4X3yfz7dHVfc32YkxhfCGmIu366UYpJFV0Xb4kWGI2FTWeNmFq4ti+4B2tnFh0AA49Y8BQYACSJgQfxznQlEohVgbQ/e8HfzR8vBK/4KI62uYAcINX3UTorxur/Ymsbd9QiHNjPCWxVVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVCHNL/S; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVCHNL/S"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso3193366a91.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762880856; x=1763485656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNfaH3hTQZnZSvGC8zp3FGczdnQaTGqYtT87SAfA22Q=;
        b=FVCHNL/SsDBXoUFltlu1H4dom8QY5ltWh0i++BHLkDtP1uOirG5lWWFvEs6hajf83u
         pwMKuPfOcU8FqjpSiuBRpPRkFFK4NM/rOMOJ35wRk0x7CznAQIIKId7Gso8tNF9oJ8+q
         yUiF+5PdN0cgGFXnaP9k7bllTQDOtk2TmoZcO6/MZsXcQ/LMTQDYtJAq0Xm6RYRDv+Ko
         3oCzo/ls07wScnhPiQJ6emBT8aGiJdnKzKw9r8NoGxuY+Ed0P6VefByvAKIaRTrtTQ8I
         WH3RmXHB48mGrRXpuO1qpOrom0phn2XVgO+KUk8lHM4YZT/HE5PHPzCAs0/3tzzvf0+K
         g4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762880856; x=1763485656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HNfaH3hTQZnZSvGC8zp3FGczdnQaTGqYtT87SAfA22Q=;
        b=fPGUQ+aMFc8t/liZqRqkLd6Wo1GaCczdRbxY7WKsMIQ846olId7gRokhjcaUK1IBUU
         xZJeCgvKR0cOYZIAbnKis19mMKXt+y5shxCE+mSY7pNzK8Hd5RTeTgiIYZCg9K9u6mbA
         TywWH0fnXeZWJ8qDN6/44vVCx4TpMMIK2bHWcv5k5deSc/Mof/otlCMNyFUkGhvwjljM
         9oQTIQcasoS9Z4d1PCJONeZ8eKbjtR6oCjTquC5FtZkKiEjS+zuN05cVeugYOfI6qeSI
         h2kANNHfpF513a7PaJvpDzc6VqstAvC71vHT/JwBsXq8c+yJhd+7YbafYJt+0Y+/zPtz
         +aIg==
X-Forwarded-Encrypted: i=1; AJvYcCUe+UpzC/UcsWs7+NUqTjUHzPX2E7JLXZrgdcv8j3v5B3pPmS9hhCCY22J1dkkdJtSh2Ra9AYbglTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+RPjn+1ntpy6uY5k7t3JsZPmB0Pli2xbiNesEu44fR70tU8b
	3eAO4DL9n8A/lkRKp17+45i8AhB8YbKBlf8m4NNrSmdpWA+Vp/l8ullZ
X-Gm-Gg: ASbGncv124084zwdZYDK5+NImtAOayjNe6dUOeMYPBBVKUd6qKoMKPiqm6qvB2zPHts
	RR7gZ9CE4XItprnMzM4Ab0HNVcssBRq4s5cvjziTTttXvhg9KhcBmGkYxipOm1GbU/vN5yZylAP
	Lei+DVn7S4cpn1u8rKBm9uYMir4zOmyFuyp45poF4A/BgtNLrCDc8SJ0Yx/oMN29I+usuq3QUmB
	qiCzqjRwOXadQDy3aZOpoh5vsRLr4h0SaIFtYr0pCkQj3cVIAsY5UwcgAH4kESvLrRYKP1bBNhU
	bW8z7lmmAUFVAjHqoKTSr9EZk2n5PDZHyEGqs6CVxxRgrqC+PIOzGv8MePyh9CQjJkYzA/h5cDR
	DcjQgsCWyqunlVPnbBgoWM5Fr/74Gm+Gg8ETmEWBKTzZMzZj3yCrlO5tPqeMxuJYT+jVkiofhF0
	gcdkfsTleTZIo0Ie4AJF30
X-Google-Smtp-Source: AGHT+IE1iOOpdC2mTa3BWXNPPiYY/mg6cjZa9GcGN6Tr3jFbChElH97v4yhJLq53JTXEL9sh5gITdw==
X-Received: by 2002:a17:90b:384d:b0:32e:87fa:d975 with SMTP id 98e67ed59e1d1-343ddeec15amr32068a91.34.1762880856160;
        Tue, 11 Nov 2025 09:07:36 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.146.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a699c98dsm21844080a91.17.2025.11.11.09.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 09:07:35 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v17 2/3] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Wed, 12 Nov 2025 00:07:28 +0700
Message-Id: <20251111170728.81552-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251106155915.GT8064@google.com>
References: <20251106155915.GT8064@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 6 Nov 2025, Lee Jones wrote:

> On Tue, 21 Oct 2025, Nam Tran wrote:
> 
> > The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
> > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
> > 4 RGB LEDs. Each LED can be configured through the related registers
> > to realize vivid and fancy lighting effects.
> > 
> > This patch adds minimal driver support for the LP5812, implementing
> > only the essential functionality: I2C communication with the device,
> > LED registration, brightness control in manual mode, and basic sysfs
> > interfaces for LED configuration and fault monitoring.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> >  MAINTAINERS                    |   4 +
> >  drivers/leds/rgb/Kconfig       |  13 +
> >  drivers/leds/rgb/Makefile      |   1 +
> >  drivers/leds/rgb/leds-lp5812.c | 730 +++++++++++++++++++++++++++++++++
> >  drivers/leds/rgb/leds-lp5812.h | 197 +++++++++
> >  5 files changed, 945 insertions(+)
> >  create mode 100644 drivers/leds/rgb/leds-lp5812.c
> >  create mode 100644 drivers/leds/rgb/leds-lp5812.h
> 
> Last go - just a few nits to fix-up.

Thank you for the feedback.
I'll address these minor issues and include the fixes in the next revision.
But I have a few concerns about some of the nits.

> > +static int lp5812_parse_led(struct device_node *np,
> > +			    struct lp5812_led_config *cfg,
> > +			    int led_index)
> > +{
> > +	int num_colors = 0, ret;
> 
> As above.
> 
> > +
> > +	of_property_read_string(np, "label", &cfg[led_index].name);
> 
> Is this optional?

The 'label' property is required for proper sysfs naming. Should I update the DT binding
to mark it mandatory and adjust the driver accordingly? I'd like to confirm if this aligns
with usual conventions for such properties.

> > +static int lp5812_probe(struct i2c_client *client)
> > +{
> > +	struct lp5812_chip *chip;
> > +	struct device_node *np = dev_of_node(&client->dev);
> > +	struct lp5812_led *led;
> 
> This is all of the LEDs though, right.
> 
> So "leds" would be better.
> 
> > +	int ret;
> > +
> > +	if (!np)
> > +		return -EINVAL;
> > +
> > +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> > +	if (!chip)
> > +		return -ENOMEM;
> > +
> > +	chip->cfg = i2c_get_match_data(client);
> > +	ret = lp5812_of_populate_pdata(&client->dev, np, chip);
> 
> That's not all this function does though.
> 
> And it's not pdata.
> 
> lp5812_of_probe() would probably be better.
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	led = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*led), GFP_KERNEL);
> > +	if (!led)
> > +		return -ENOMEM;
> > +
> > +	chip->client = client;
> > +	mutex_init(&chip->lock);
> > +	i2c_set_clientdata(client, led);
> 
> If you're only using the chip, why not just save the chip?

Just to confirm, you mean to store all LED instances inside the lp5812_chip struct and
only save the chip in i2c_set_clientdata(), instead of allocating a separate leds array
in probe()?

I can update the code accordingly if that's the preferred approach.

> > +/* Chip specific configurations */
> > +static const struct lp5812_device_config lp5812_cfg = {
> > +	.reg_reset = {
> > +		.addr = LP5812_REG_RESET,
> > +		.val  = LP5812_RESET
> > +	},
> > +	.reg_chip_en = {
> > +		.addr = LP5812_REG_ENABLE,
> > +		.val  = LP5812_ENABLE_DEFAULT
> > +	},
> > +	.reg_dev_config_0 = {
> > +		.addr = LP5812_DEV_CONFIG0,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_1 = {
> > +		.addr = LP5812_DEV_CONFIG1,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_2 = {
> > +		.addr = LP5812_DEV_CONFIG2,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_3 = {
> > +		.addr = LP5812_DEV_CONFIG3,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_4 = {
> > +		.addr = LP5812_DEV_CONFIG4,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_5 = {
> > +		.addr = LP5812_DEV_CONFIG5,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_6 = {
> > +		.addr = LP5812_DEV_CONFIG6,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_7 = {
> > +		.addr = LP5812_DEV_CONFIG7,
> > +		.val  = 0
> > +	},
> > +	.reg_dev_config_12 = {
> > +		.addr = LP5812_DEV_CONFIG12,
> > +		.val  = LP5812_DEV_CONFIG12_DEFAULT
> > +	},
> > +	.reg_cmd_update = {
> > +		.addr = LP5812_CMD_UPDATE,
> > +		.val  = 0
> > +	},
> > +	.reg_tsd_config_status = {
> > +		.addr = LP5812_TSD_CONFIG_STATUS,
> > +		.val  = 0
> > +	},
> > +	.reg_led_en_1 = {
> > +		.addr = LP5812_LED_EN_1,
> > +		.val  = 0
> > +	},
> > +	.reg_led_en_2 = {
> > +		.addr = LP5812_LED_EN_2,
> > +		.val  = 0
> > +	},
> > +	.reg_fault_clear = {
> > +		.addr = LP5812_FAULT_CLEAR,
> > +		.val  = 0
> > +	},
> > +	.reg_manual_dc_base  = {
> > +		.addr = LP5812_MANUAL_DC_BASE,
> > +		.val  = 0
> > +	},
> > +	.reg_auto_dc_base  = {
> > +		.addr = LP5812_AUTO_DC_BASE,
> > +		.val  = 0
> > +	},
> > +	.reg_manual_pwm_base  = {
> > +		.addr = LP5812_MANUAL_PWM_BASE,
> > +		.val  = 0
> > +	},
> > +	.reg_lod_status_base  = {
> > +		.addr = LP5812_LOD_STATUS,
> > +		.val  = 0
> > +	},
> > +	.reg_lsd_status_base  = {
> > +		.addr = LP5812_LSD_STATUS,
> > +		.val  = 0
> > +	}
> > +};
> 
> This is an unusual way to set out a register map.
> 
> Where have you seen this done before?
> 
> > +static const struct of_device_id of_lp5812_match[] = {
> > +	{ .compatible = "ti,lp5812", .data = &lp5812_cfg },
> 
> Seems odd to populate .data when you only have a single device.

I followed the style used in the lp55xx series drivers for the register map and device
config. I thought it makes sense to keep the same pattern to allow easier upgrade and
maintenance in the future. But you expect a more typical approach, right?

Thanks again for your review and support!

Best regards,
Nam Tran
