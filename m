Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82E2F60A7
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772991283; cv=none; b=LMrbrQIYJc/ynakUPEAGmdd6S92+eYOqGGjc8rdCWzC8Dl32YS4TOWmYuvwHIxLul5EboWxrYrUFifM3MQFmeFXAmQoXrmC+9GNSUGTV/sy0T+ow36LOhzd4tToFdj4XeUcpuLa846YaN6Fg/rfGsp+fT70r8DyJWR9+bGycx/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772991283; c=relaxed/simple;
	bh=eQ5hlI3vgUf9rlJcgQ07JXsapvXneGIZp4TpqI+70Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSea5/ea4SrsaPVbHvb4Rfr23rwcvl7JdLdaZCcuw5knDFkwb0d6oZevqtYFnNoaPd7WaaX9j2bwA5UkyFNw+8X29L6SOO4FuobGc+xhO8DISm25r0jkt+vujgvPfYck215TXbuJgsnFbsGpJeGgpbKw7+xfzqlilIAIw27I9mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN9VgWI5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN9VgWI5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad617d5b80so71252195ad.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 10:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772991281; x=1773596081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WL0HsBRBkkHgBOwL69XfPNOVZWpVtL9CtLnpRauXWrI=;
        b=dN9VgWI5/gU128dx1FlT9emgi5oNCTLy0R3WLxpOEPVKkjc7En0huESH9u9+Z0x20B
         aMwFhOyTIOVWF8g92fzXX5KAB/kCiqLCVPsgN668dZJW/nA+GgvCPOgxjGUo+r9FQ6Rd
         452eB1EPsE9MyMCovJdy8RvNPauu7EKLHCCtXYfupmo/WP03G6uX/qc4aqV74IF+lgb7
         GJBQ9JvwuEJbVzU2EvAPgWemdhlROZ5MBOwhl7Rsz7I5Jh8o0PxYg4LeqakbD9kyZEH2
         3NAFw0dcrUqtfYX3uUAc/pS6tHVoSQvZtim09k+5cGdOt1xjwuJld39+Th28ayGJXSIL
         OCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772991281; x=1773596081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WL0HsBRBkkHgBOwL69XfPNOVZWpVtL9CtLnpRauXWrI=;
        b=QDaRuSBnQDdegY68hrFw86kdZAib+QLrj5VxmBo8RrRDmohIwXXqeJBTPeMAr5fmC3
         Hmir7t50w2lyYWXQkvrQxJ7Kiik60uqHtJ1lap8YrTzNYUn5PTO7clrik3d/yZ9zeV4x
         hVes++x0fOgJdwxqxbEkgt38FucDJDf97+SiGLf7EjK7ccIzBa6rA4iSJZcaYp3XWei6
         eknARfnosfoqD3YDrEAbtULaj03uMsNIvEfkg9ozB/Ssw7ys3cHQpm6SmXPfm9Ly0lFR
         OowLT3A9qkHHnstJ+I8Vy1Ws0Y32aYxliMTMA3TdCKMuSSheTxpcTuCnVl3rSJb1mSLk
         MDKg==
X-Forwarded-Encrypted: i=1; AJvYcCXPjKcNrrez6i1jKQ0zqBpu7sWDQyoZxR1S2cTadyuE+g+ydCPW5XXrGzO/D1K+1WkDa7DKRZ2IzFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPYe8FixYsxVoxbszFMNhW99seglzoxr2ch14X6Z2zWJciiNsZ
	E4P8yQ+w/jwRouQk2hGzMBX3i3TqnlYsk6V5rBYbgLiG6n5YaA8nEZdN
X-Gm-Gg: ATEYQzz41r5nFtqSE0/7qPQcyTB83MaI7Z7vSYA/NSo9xPEpNxkW1wm/mwe8RA+gMmQ
	3AbN2CH/M7aoyimKUkNQ1IxrvwJ4XP/7Mi34l5dw300yKKraaXoUgxUj3dwKPGsTDDIiw0JLQZR
	Hw+gdOiYZv5KUwkQofYPAq5TV2tU+EsEWTkpX38N5ueOp3+8LcB3JOin57ZfdK2cEheYquix6Q8
	3w3nbhRdSEceRQ1VFQ1Fb2JGFycCasCZIesvonqPqnmPESO1NXP9f45ePDAAq+PpILFUOVn8Mwg
	nwHK4VX24C7OXS6CuN7Jczbij/YC8L7QC/vlN+hEgPzjBwnyKlZQnE1sIF7MxXMlh1pG7TELZGG
	mTMu/reGhPxJPVN0Spkr5W7EmS1+Wexv6s+mgDKWrv3ZRjU1SM/trk0zxyjydHj54PAU0EbCdpp
	0eP6GeMPt0J+0HeMVbMTRRq4CbxEveILtSwA3l
X-Received: by 2002:a17:902:d544:b0:2ae:7efa:c5b0 with SMTP id d9443c01a7336-2ae82538b70mr86897085ad.56.1772991281183;
        Sun, 08 Mar 2026 10:34:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b14sm110217825ad.19.2026.03.08.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 10:34:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 8 Mar 2026 10:34:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (pmbus/tps1689): Add TPS1689 support
Message-ID: <0b2f3bdd-e79c-4892-8523-2cab87596d97@roeck-us.net>
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-4-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217081203.1792025-4-sbogdanov@baylibre.com>

On Tue, Feb 17, 2026 at 10:12:03AM +0200, Stoyan Bogdanov wrote:
> Extend tps25990 existing driver to support tps1689 eFuse,
> since they are sharing command interface and functionality
> Update documentation for tps1689
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> ---
>  Documentation/hwmon/tps25990.rst | 15 ++++--
>  drivers/hwmon/pmbus/tps25990.c   | 91 ++++++++++++++++++++++++++++----
>  2 files changed, 92 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
> index 04faec780d26..e8bc9a550bda 100644
> --- a/Documentation/hwmon/tps25990.rst
> +++ b/Documentation/hwmon/tps25990.rst
> @@ -9,26 +9,31 @@ Supported chips:
>  
>      Prefix: 'tps25990'
>  
> -  * Datasheet
> +    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
>  
> -    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
> +  * TI TPS1689
> +
> +    Prefix: 'tps1689'
> +
> +    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
>  
>  Author:
>  
>  	Jerome Brunet <jbrunet@baylibre.com>
> +	Stoyan Bogdanov <sbogdanov@baylibre.com>
>  
>  Description
>  -----------
>  
> -This driver implements support for TI TPS25990 eFuse.
> +This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
>  This is an integrated, high-current circuit protection and power
>  management device with PMBUS interface
>  
> -Device compliant with:
> +Devices are compliant with:
>  
>  - PMBus rev 1.3 interface.
>  
> -Device supports direct format for reading input voltages,
> +Devices supports direct format for reading input voltages,
>  output voltage, input current, input power and temperature.
>  
>  Due to the specificities of the chip, all history reset attributes
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> index 33f6367f797c..f9ff4edadf53 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -58,34 +58,38 @@ struct tps25990_data {
>  	struct local_direct_value *info_local;
>  };
>  
> -static int tps25990_raw_to_value(struct i2c_client *client, int param, int raw)
> +static int tps25990_raw_to_value(struct i2c_client *client, int param, u32 raw)
>  {
>  	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
>  	struct local_direct_value *info_local = data->info_local;
> +	int val;
>  
>  	/* Formula : X = (Y / 10^R - b) / m */
>  	if (info_local->R[param] >= 0)
> -		raw /= int_pow(10, info_local->R[param]);
> +		val = DIV_ROUND_CLOSEST_ULL(raw, int_pow(10, info_local->R[param]));
>  	else
> -		raw *= int_pow(10, -info_local->R[param]);
> +		val = raw * int_pow(10, -info_local->R[param]);

Can the calculation in the 'else' branch overflow?

If info_local->R[param] is -6 (as it is for TPS25990_IIN_OCF), then
int_pow(10, 6) is 1,000,000. If raw is a 16-bit word like 65535, the product
is 65,535,000,000.

Since val is an int, it will overflow on 32-bit systems (and even on 64-bit
systems if int is 32-bit, which is the case in the kernel).

Should val be a 64-bit type for the intermediate calculation?

>  
> -	return DIV_ROUND_CLOSEST(raw - info_local->b[param], info_local->m[param]);
> +	val = DIV_ROUND_CLOSEST(val - info_local->b[param], info_local->m[param]);
> +
> +	return val;
>  }
>  
>  static unsigned int tps25990_value_to_raw(struct i2c_client *client, int param, int val)
>  {
>  	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
>  	struct local_direct_value *info_local = data->info_local;
> +	u32 raw; // return raw up to u16 -> u32
>  
>  	/* Formula : Y = ( m * X + b) * 10^R */
> -	val = (long)val * info_local->m[param] + info_local->b[param];
> +	raw = ((long)val * info_local->m[param]) + info_local->b[param];
>  
>  	if (info_local->R[param] >= 0)
> -		val *= int_pow(10, info_local->R[param]);
> +		raw *= int_pow(10, info_local->R[param]);
>  	else
> -		val = DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R[param]));
> +		raw = DIV_ROUND_CLOSEST_ULL(raw, int_pow(10, -info_local->R[param]));
>  
> -	return val;
> +	return raw;

Does this change handle negative results correctly?

If (val * m + b) is negative, assigning it to the u32 raw variable will
result in a very large positive number due to underflow. Subsequent
scaling and clamping in the caller will then produce an incorrect result
(e.g., 0xf instead of 0).

The previous implementation used a signed type for the intermediate result.
Is there a reason to switch to u32 before the final result is determined?

>  }
>  
>  /*
> @@ -281,7 +285,6 @@ static int tps25990_write_word_data(struct i2c_client *client,
>  		value = clamp_val(value, 0, 0xff);
>  		ret = pmbus_write_word_data(client, page, reg, value);
>  		break;
> -
>  	case PMBUS_VIN_OV_FAULT_LIMIT:
>  		value = tps25990_value_to_raw(client, TPS25990_VIN_OVF, value);
>  		value = clamp_val(value, 0, 0xf);
> @@ -370,6 +373,15 @@ static const struct regulator_desc tps25990_reg_desc[] = {
>  };
>  #endif
>  
> +struct local_direct_value tps1689_local_info = {
> +	.m[TPS25990_VIN_OVF] = 3984,
> +	.b[TPS25990_VIN_OVF] = -63750,
> +	.R[TPS25990_VIN_OVF] = -3,
> +	.m[TPS25990_IIN_OCF] = 7111,
> +	.b[TPS25990_IIN_OCF] = -2133,
> +	.R[TPS25990_IIN_OCF] = -2,
> +};
> +
>  struct local_direct_value tps25590_local_info = {
>  	.m[TPS25990_VIN_OVF] = 10163,
>  	.b[TPS25990_VIN_OVF] = -30081,
> @@ -379,6 +391,60 @@ struct local_direct_value tps25590_local_info = {
>  	.R[TPS25990_IIN_OCF] = -6,
>  };
>  
> +static struct pmbus_driver_info tps1689_base_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.m[PSC_VOLTAGE_IN] = 1166,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = -2,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.m[PSC_VOLTAGE_OUT] = 1166,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -2,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_TEMPERATURE] = 140,
> +	.b[PSC_TEMPERATURE] = 32103,
> +	.R[PSC_TEMPERATURE] = -2,
> +	/*
> +	 * Current and Power measurement depends on the ohm value
> +	 * of Rimon. m is multiplied by 1000 below to have an integer
> +	 * and -3 is added to R to compensate.
> +	 */
> +	.format[PSC_CURRENT_IN] = direct,
> +	.m[PSC_CURRENT_IN] = 9548,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = -6,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.m[PSC_CURRENT_OUT] = 24347,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = -3,
> +	.format[PSC_POWER] = direct,
> +	.m[PSC_POWER] = 2775,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -4,
> +	.func[0] = (PMBUS_HAVE_VIN |
> +		    PMBUS_HAVE_VOUT |
> +		    PMBUS_HAVE_VMON |
> +		    PMBUS_HAVE_IIN |
> +		    PMBUS_HAVE_PIN |
> +		    PMBUS_HAVE_TEMP |
> +		    PMBUS_HAVE_STATUS_VOUT |
> +		    PMBUS_HAVE_STATUS_IOUT |
> +		    PMBUS_HAVE_STATUS_INPUT |
> +		    PMBUS_HAVE_STATUS_TEMP |
> +		    PMBUS_HAVE_SAMPLES),
> +
> +	.read_word_data = tps25990_read_word_data,
> +	.write_word_data = tps25990_write_word_data,
> +	.read_byte_data = tps25990_read_byte_data,
> +	.write_byte_data = tps25990_write_byte_data,
> +
> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> +	.reg_desc = tps25990_reg_desc,
> +	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
> +#endif
> +};
> +
>  static struct pmbus_driver_info tps25990_base_info = {
>  	.pages = 1,
>  	.format[PSC_VOLTAGE_IN] = direct,
> @@ -428,18 +494,25 @@ static struct pmbus_driver_info tps25990_base_info = {
>  #endif
>  };
>  
> +struct tps25990_data data_tps1689 = {
> +	.info = &tps1689_base_info,
> +	.info_local = &tps1689_local_info,
> +};
> +
>  struct tps25990_data data_tps25990 = {
>  	.info = &tps25990_base_info,
>  	.info_local = &tps25590_local_info,
>  };
>  
>  static const struct i2c_device_id tps25990_i2c_id[] = {
> +	{ .name = "tps1689", .driver_data = (kernel_ulong_t)&data_tps1689 },
>  	{ .name = "tps25990", .driver_data = (kernel_ulong_t)&data_tps25990 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
>  
>  static const struct of_device_id tps25990_of_match[] = {
> +	{ .compatible = "ti,tps1689", .data = &data_tps1689 },
>  	{ .compatible = "ti,tps25990", .data = &data_tps25990 },
>  	{}
>  };
