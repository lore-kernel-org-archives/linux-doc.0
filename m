Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F137DEBF
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379256; cv=none; b=tiiEgVVEaWDs7fHNS9DJ3Q2ourf8kESXdnlUBghjyNd8Pd80O9mzeVXQUUXCO7dyd906KyghDXZaZMQWT8f41/XpbADo+VE3PpZbBBLT27uN9oatLBwWk8f1UF4xMy/R2bH2wPl5Cc/EFXY2Gozx3OL5o6WKB/T9SPFruUoBzsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379256; c=relaxed/simple;
	bh=bHfqsarsKeqIkFDqllAq2cLDi3NkY7dQiJHYzxf7614=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+326Q3cGgVkoLNMNPQoKZJnz9lw4ON7ER0QzcdODIn5t5p4KHRJRuPWmaJUnSYr6/mILDo/Wg8cq/3hER2Tzp4CEontbY8gFVCq31mVw3yoogqV4flq4FoguG25u4FUxwc9JyVUkhf/5k+L5erqTNa0fdKaw9abrAV1TG+P4zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0Wu9UnP; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0Wu9UnP"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso965665a12.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785379254; x=1785984054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpl/BhnmY3lT4VrDtie/BwPkv0Auv8SB6MI32u30mKs=;
        b=S0Wu9UnPGR2+X98ecsAivrcMShE+nJTSCc6o9/1YSfm5PgoiRD8FRpHkjYRyZ2Ylrb
         uYzZv1RXA84YHq89WZqY3UPjCH7L0VAhKv2rMd0caFwsnUE42C0SOPVwO6WL1r9/4wr2
         cNedGTzEjTaKAb5CD+DvklSlAicvnP4dJ4xBKkC2vvuuAqRsGVHw4rGLIaoW1orgI/Cf
         I2pR8TTuFupjtDqyAluvYGTiuSUHB8WRRd5UwvZoEuK2EexdCn+S71/7uemVczLDtXeT
         SmcczdwnNtY458GFR/NugsaWB2yJ7KhrhnbRb3nCW/AI5UGFYLvhrGXreFDZVQqueFez
         tfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379254; x=1785984054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpl/BhnmY3lT4VrDtie/BwPkv0Auv8SB6MI32u30mKs=;
        b=bVw57PBwtv47+8vAdhuiywHNX4MrJvmElkPKBS3Cmi6P7mgk2faUfaehSIrxbQYTdd
         eVOd4F7P2bYgfsj9wzdyL6V5q4GSb/dftas7t7x013H4DVdnryzYXaYZSHsj4zy80K+c
         VLW/vJkG+7jalgabZUq2YP++GuQ6xHn17htjUHuWW41MSPvo4zEI7nEZm1vaw13PT4fw
         6LOh8AdfLuCmIYM9BzpKfiAbfDhW+QTE9gPrHoRw0R2Sk3NMe6Qvm3NZ02D8C0GmrSwl
         XAjwOIAQkJSRR+d9cHyTn4llxYTnZ8eoz6uYBrrSQY3TAyKiRwg2NVJUfg28Km5jvcnE
         a1Vw==
X-Forwarded-Encrypted: i=1; AHgh+RrN4EwRNFsEgrASj5Kf11DL+N+zL69brKcdWq8U1TL+PG8bzBuOrc5oPogJOllfx8SP7+NZtWZvR1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5EGG6hEte5MLSTP2cozyM4/Bqz/PY/veQzdfIXoQ35L7C6zo
	W8VxL+HSg7Vc7EZ1aXg15tymhOk/NaUZWHPKYuw618U0TRtWzEHqSrj5sIPuiQ==
X-Gm-Gg: AR+sD10Xq7rN3kiohuapVQGHM/wCh2eLT658xjkkIm7UcvjUFC72i3MKk/dQJ2w5tiz
	wcYZqJ7r3CsEq+pn/v+Mg6SINpoQV7CMVg0/c1ka8L+ITrFyWJxOgc14oiN/MiWfvQwvFxmj8aQ
	gXNLMhuOppEVDTPl0I0GzTI/9tiNlyBmwQH4omFkSZconMBkEQBOev4C41xXN6OZc/JEESgX6NK
	s/2z2DCBd7HGX6KDTmGzeBEYIukhawndmp24Y9oAcy641CfTDFxqTRAPcAMoM7sZFrOEEdbfWXb
	V70QZgOHyivh9o2MWG+/atSmxlOYTBPVgqSB/RCHtQECfHTQXd2az95Of1Lx2AWQ1RM+VZi4toU
	yDbor0cnB9z828mOU8wDh1Tdw6kNk1TbbRHsLe6Zz5ItNv5ttW9IcGUOHeCgdU/XuE6xIF36R92
	R7iLq+qg/WxO5PBFq/rsex4aN0x9fWtbp5/mIeqAT3S5MsekwnXTVYApoiFxScTVHlvfug3t/Zd
	Q==
X-Received: by 2002:a05:6a21:9985:b0:3c0:9c19:6587 with SMTP id adf61e73a8af0-3c900a02a8emr615851637.65.1785379254046;
        Wed, 29 Jul 2026 19:40:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc63fesm14028363eec.15.2026.07.29.19.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:40:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jul 2026 19:40:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Message-ID: <4e0d09d8-c083-417e-bd33-f5c132a802b8@roeck-us.net>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>

On Thu, Jul 30, 2026 at 09:03:34AM +0800, Alexis Czezar Torreno wrote:
> Implement support for external voltage divider scaling using the
> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.
> 
> When the desired output voltage exceeds VREF, a resistor divider
> (RFB1 and RFB2) is used to scale down the feedback voltage. The
> driver reads these resistor values from device tree and applies
> the scaling formula: VOUT_actual = VOUT_measured × (1 + RFB1/RFB2)
> 
> The properties are optional. If not specified, the driver assumes
> no voltage divider is present and reports the raw VOUT reading.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max20830.c | 65 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
> index cb2c23672166d641852199ca07eb716924f4f286..ddead72a8db5d6f8491cbfbf356db0f8de64da03 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/errno.h>
>  #include <linux/i2c.h>
> +#include <linux/math64.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/string.h>
> @@ -14,6 +15,56 @@
>  
>  #define MAX20830_IC_DEVICE_ID_LENGTH	9
>  
> +struct max20830_data {
> +	struct pmbus_driver_info info;
> +	u32 vout_rfb1;
> +	u32 vout_rfb2;
> +};
> +
> +/*
> + * MAX20830 only supports READ_VOUT for VOUT monitoring.
> + *
> + * Limit registers (VOUT_OV_WARN_LIMIT, VOUT_OV_FAULT_LIMIT, etc.) are not
> + * supported by this driver and return -ENODATA. This means sysfs attributes
> + * like in1_max, in1_crit, etc. will not be available. Only in1_input (the
> + * scaled output voltage) is supported.
> + *
> + * MAX20830 uses an external resistor divider for voltage sensing:
> + * - VOUT_COMMAND and VOUT_MAX set the reference voltage at the feedback pin
> + * - READ_VOUT reports the feedback voltage, which needs to be scaled for actual
> + *   output voltage
> + *
> + * Scaling formula: vout_actual = vout_fb × (1 + RFB1 / RFB2)
> + *
> + * If regulator support is added in the future, some adjustments are needed to
> + * ensure correct feedback voltages are set.
> + */
> +static int max20830_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	const struct max20830_data *data = container_of(info, struct max20830_data, info);
> +	int ret;
> +	u64 temp;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Apply voltage divider scaling if resistors are non-zero */
> +		if (data->vout_rfb1 && data->vout_rfb2) {
> +			temp = (u64)data->vout_rfb1 + (u64)data->vout_rfb2;
> +			temp = DIV_ROUND_CLOSEST_ULL((u64)ret * temp, data->vout_rfb2);
> +			ret = clamp_val(temp, 0, 0xFFFF);
> +		}
> +		return ret;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
>  static struct pmbus_driver_info max20830_info = {
>  	.pages = 1,
>  	.format[PSC_VOLTAGE_IN] = linear,
> @@ -24,13 +75,25 @@ static struct pmbus_driver_info max20830_info = {
>  		PMBUS_HAVE_TEMP |
>  		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>  		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data = max20830_read_word_data,
>  };
>  
>  static int max20830_probe(struct i2c_client *client)
>  {
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
> +	struct max20830_data *data;
>  	int ret;
>  
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->info = max20830_info;
> +
> +	/* Read optional voltage divider resistor values */
> +	device_property_read_u32(&client->dev, "adi,vout-rfb1-ohms", &data->vout_rfb1);
> +	device_property_read_u32(&client->dev, "adi,vout-rfb2-ohms", &data->vout_rfb2);
> +
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA) &&
>  	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK))
>  		return -ENODEV;
> @@ -78,7 +141,7 @@ static int max20830_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, -ENODEV,
>  				     "Unsupported device: '%s'\n", buf);
>  
> -	return pmbus_do_probe(client, &max20830_info);
> +	return pmbus_do_probe(client, &data->info);
>  }
>  
>  static const struct i2c_device_id max20830_id[] = {
