Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76D1FD3
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 05:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0/hEtpw"
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E74192;
	Thu, 26 Oct 2023 22:02:18 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7c95b8d14so12992497b3.3;
        Thu, 26 Oct 2023 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698382938; x=1698987738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlmpmV8lTuoVsTeUH18NIDCO0oCTELRanovOZvhtsA4=;
        b=h0/hEtpw6V+HHyFLRv5P/FBci+XWIEpbIHb8k6jFkv+20quciuaamQ5evjycWELJ6c
         GxZ7lAbwyAM9lZCNxr5tm0+hxvVQfeCtMD+C3WVTupTQMNINlbvIajcbCQcpv+4tWE9D
         oRNHeWjV0LdQoHHdmHRwsVflXF/s1evUJ+Z6otSKGuE3VNzTCuQhni/TeOQeDmon74Bg
         IJpdnPjNRhpZwztxdlLhlklk9Pa/o0GA6v/VjFVyGV7MZ9YEcMcNPVV9TaOcMoI+BYDS
         aQApk4cw8y+JOwFzDVTQ1gaLYELy3LEqEpqPJSX+cPPgUqL4LIBCWXxfuRwlnG1ctmf0
         Vi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698382938; x=1698987738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlmpmV8lTuoVsTeUH18NIDCO0oCTELRanovOZvhtsA4=;
        b=nwEJbTofgDwl6lRP+hoAtLu7LMsCgmbi1jrLEGLOc5a4i3Cwn93xCCIo1JfT6v4X5i
         ywO/2FpoddzP9oAyusb1nSO/WJbMiap5cQEW4rWslP20+0dc8CvhD1xijPvrTZHENWec
         W9r0KP1hAmE5rqefmSc55FKHd6n90mh+jx/C6PfKHQYK5N3JHQxS2w8CfoN3c/t9yZPU
         EcnPbvAlzd6dMc5yY6w7/qXJe/Fa40nGx95HLSd7x8I9jlC9od5O9hMQ+hWERvJHF3C1
         KKoVc8287GB3aYHzwap4kXEz9XUldknmW2IbYLWXwpmsQUFna9hDaR8Twlfrwbr/lsMm
         oOVw==
X-Gm-Message-State: AOJu0Yy1ZvL1N1ZRA2Rso9/5rBtWyd3IJ0W2OJDmDNhzPxTwL5E2EJ+C
	ISfvBE87Uj/ZGZwN20e/rqSdUarAO7Y=
X-Google-Smtp-Source: AGHT+IGHP2JNnk09Gj1VfvPPB9cXN1g7nmAxGktR39sR0vsOhGO/foHYo07XESZhd4pwTpuoccXJ2A==
X-Received: by 2002:a81:c942:0:b0:5a8:2d2b:ca9c with SMTP id c2-20020a81c942000000b005a82d2bca9cmr1447757ywl.32.1698382937952;
        Thu, 26 Oct 2023 22:02:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g188-20020a0dddc5000000b005925c896bc3sm389038ywe.53.2023.10.26.22.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 22:02:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Oct 2023 22:02:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] hwmon: max31827: Add support for max31828 and
 max31829
Message-ID: <fe99431e-3245-484c-bf26-928048500ec6@roeck-us.net>
References: <20231026144405.546822-1-daniel.matyas@analog.com>
 <20231026144405.546822-2-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026144405.546822-2-daniel.matyas@analog.com>

On Thu, Oct 26, 2023 at 05:44:02PM +0300, Daniel Matyas wrote:
> When adi,flt-q and/or adi,alrm-pol are not mentioned,
> the default configuration is loaded.
> 
That isn't really a complete patch description.
It should include (even if repeated) that support for
additional chips is added.

> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> ---
> 
> v4 -> v5: Passed i2c_client to init_client(), because I needed it to
> retrieve device id.
> Used a simple if to load default configuration. No more switch.
> 
> v3 -> v4: No change.
> 
> v3: Added patch.
> 
>  drivers/hwmon/max31827.c | 51 +++++++++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
> index 7976d668ffd4..446232fa1710 100644
> --- a/drivers/hwmon/max31827.c
> +++ b/drivers/hwmon/max31827.c
> @@ -39,10 +39,15 @@
>  
>  #define MAX31827_12_BIT_CNV_TIME	140
>  
> +#define MAX31827_ALRM_POL_HIGH	0x1
> +#define MAX31827_FLT_Q_4	0x2
> +
>  #define MAX31827_16_BIT_TO_M_DGR(x)	(sign_extend32(x, 15) * 1000 / 16)
>  #define MAX31827_M_DGR_TO_16_BIT(x)	(((x) << 4) / 1000)
>  #define MAX31827_DEVICE_ENABLE(x)	((x) ? 0xA : 0x0)
>  
> +enum chips { max31827, max31828, max31829 };
> +
>  enum max31827_cnv {
>  	MAX31827_CNV_1_DIV_64_HZ = 1,
>  	MAX31827_CNV_1_DIV_32_HZ,
> @@ -373,12 +378,22 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
>  	return -EOPNOTSUPP;
>  }
>  
> +static const struct i2c_device_id max31827_i2c_ids[] = {
> +	{ "max31827", max31827 },
> +	{ "max31828", max31828 },
> +	{ "max31829", max31829 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max31827_i2c_ids);
> +
>  static int max31827_init_client(struct max31827_state *st,
> -				struct device *dev)
> +				struct i2c_client *client)
>  {
> +	struct device *dev = &client->dev;
>  	struct fwnode_handle *fwnode;
>  	unsigned int res = 0;
>  	u32 data, lsb_idx;
> +	enum chips type;
>  	bool prop;
>  	int ret;
>  
> @@ -395,13 +410,20 @@ static int max31827_init_client(struct max31827_state *st,
>  	prop = fwnode_property_read_bool(fwnode, "adi,timeout-enable");
>  	res |= FIELD_PREP(MAX31827_CONFIGURATION_TIMEOUT_MASK, !prop);
>  
> +	if (dev->of_node)
> +		type = (enum chips)of_device_get_match_data(dev);
> +	else
> +		type = i2c_match_id(max31827_i2c_ids, client)->driver_data;
> +

This should be something like

	type = (enum chips)(uintptr_t)device_get_match_data(dev);

though that requires that the enum values start with 1. This avoids
having to pass client to the function and is more generic.

>  	if (fwnode_property_present(fwnode, "adi,alarm-pol")) {
>  		ret = fwnode_property_read_u32(fwnode, "adi,alarm-pol", &data);
>  		if (ret)
>  			return ret;
>  
>  		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
> -	}
> +	} else if (type == max31829)

Not sure why checkpatch ignores this (maybe because of 'else if'),
but the else path should also be in {}.

But why is this only for max31829 ? I mean, sure, the default for
that chip is different, but that doesn't mean the other chips have
that bit set. There is no guarantee that the chip is in its default
state when the driver is loaded.

> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
> +				  MAX31827_ALRM_POL_HIGH);
>  
>  	if (fwnode_property_present(fwnode, "adi,fault-q")) {
>  		ret = fwnode_property_read_u32(fwnode, "adi,fault-q", &data);
> @@ -418,7 +440,9 @@ static int max31827_init_client(struct max31827_state *st,
>  		}
>  
>  		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
> -	}
> +	} else if ((type == max31828) || (type == max31829))

I _really_ dislike the notion of excessive ( ). Also, {} for the else
branch.

I also don't understand why that would be chip specific. I don't see
anything along that line in the datasheet.

Ah, wait ... I guess that is supposed to reflect the chip default.
I don't see why the chip default makes a difference - a well defined
default must be set either way. Again, there is no guarantee that
the chip is in its default state when the driver is loaded.

Also, why are the default values added in this patch and not
in the previous patch ?

> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
> +				  MAX31827_FLT_Q_4);
>  
>  	return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
>  }
> @@ -464,7 +488,7 @@ static int max31827_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(st->regmap),
>  				     "Failed to allocate regmap.\n");
>  
> -	err = max31827_init_client(st, dev);
> +	err = max31827_init_client(st, client);
>  	if (err)
>  		return err;
>  
> @@ -475,14 +499,19 @@ static int max31827_probe(struct i2c_client *client)
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
> -static const struct i2c_device_id max31827_i2c_ids[] = {
> -	{ "max31827", 0 },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(i2c, max31827_i2c_ids);
> -
>  static const struct of_device_id max31827_of_match[] = {
> -	{ .compatible = "adi,max31827" },
> +	{
> +		.compatible = "adi,max31827",
> +		.data = (void *)max31827
> +	},
> +	{
> +		.compatible = "adi,max31828",
> +		.data = (void *)max31828
> +	},
> +	{
> +		.compatible = "adi,max31829",
> +		.data = (void *)max31829
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, max31827_of_match);
