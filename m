Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADB934CC0;
	Wed, 25 Oct 2023 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiiDCBgf"
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9410C133;
	Wed, 25 Oct 2023 15:01:31 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6bd73395bceso173120b3a.0;
        Wed, 25 Oct 2023 15:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698271291; x=1698876091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R44jXdiuZHoojdDKPbMz5ZFFqiSzPyU1FqJ/gr42Jbs=;
        b=IiiDCBgfdNU52+/h/emFMrQaOKmxUvGJFLhBz02+EyGNZL9RvBZUyu9W7dCkj1yxS0
         IZ1dT25cf5NfRsWogwo8ZuBgqNx+DHKgWuMInSx0qJg36PmVrFiq2yDdGTfFq03pB9X3
         TWd7/XfmmuPWOXsam8x1sM7YoBucegvxd/+McRN3Vtn2Bsdxp2dq2t7RxzOT+6dOLuzb
         vyYPuAAmRbETCUMlmOK91abIM7ePCywCvFs/GPsQCR+e6zqQEKz1H9qEbu8B4e3QFodK
         LbsfDgFpbfBKfo7KfYWNEdp6j1Ip7RaM0kBI0mYxSrzs35z0i13Tz1wUBVYz2Jqxhg7l
         /CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698271291; x=1698876091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R44jXdiuZHoojdDKPbMz5ZFFqiSzPyU1FqJ/gr42Jbs=;
        b=dxBzRvbp7nvsAAXKh3zuT96HO+ldT0iH2DxWsG5p+HBX+6AH1btto79QJ9AoPAD7hX
         3aq4Ms42zVtLMXvDm1AxELIeS6OZbLtcoL31t4lzaTGDK8IidrMDNH+VDlphOOqFnM0d
         qa928e0P3nfkBNwA2PKzKlHOrFjf394Ns+kASJRzZk4VC38j4VvAclREUBusdMbUq0fL
         yO+v7OQ8dcIIVJN4NQzv2CV1DuynKKOVqflKZxnyba14KT+pkdwRA9ChXv01mLqoh9R9
         Xb6gAMXvrJrRp/ngpW0tS41jQgIV+V+rSJk0CmL7Y0Tu5EWh/16NmUyl1PMIxfi+Hla0
         A29g==
X-Gm-Message-State: AOJu0YxltLXjVTI9+KJ3tF6OntdibFotFUNmTVLY9krny9Z4VYa5+HlZ
	SYveCyOoFi6HuDOd+ewzcWY=
X-Google-Smtp-Source: AGHT+IEANEkEaIWdYpeG2OyuvGZrXFUGur91Fw+Z4WNSMUkEYwo0wnsCGDJNBDAWQXZR7xzsrQcW1w==
X-Received: by 2002:a05:6a00:23d1:b0:68e:351b:15b9 with SMTP id g17-20020a056a0023d100b0068e351b15b9mr1099676pfc.4.1698271290825;
        Wed, 25 Oct 2023 15:01:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x13-20020aa79a4d000000b006be0bd6a4d8sm9821288pfj.36.2023.10.25.15.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 15:01:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Oct 2023 15:01:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, kernel test robot <lkp@intel.com>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 4/7] hwmon: max31827: Handle new properties from the
 devicetree
Message-ID: <fcc0848f-d449-43e8-9664-aba0858367d3@roeck-us.net>
References: <20230919093456.10592-1-daniel.matyas@analog.com>
 <20230919093456.10592-4-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919093456.10592-4-daniel.matyas@analog.com>

On Tue, Sep 19, 2023 at 12:34:52PM +0300, Daniel Matyas wrote:
> Used fwnode to retrieve data from the devicetree in the init_client
> function.
> 
> If the uint32 properties are not present, the default values are used
> for max31827 chip.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> ---
> 
> v3 -> v4: Renamed property names to correspond with binding.
> 
> v2 -> v3: Separated patch into 2. Fixed 'WARNING: Unexpected
> indentation.'
> Reported-by: kernel test robot <lkp@intel.com>
> 
> v2: Added patch
> 
>  Documentation/hwmon/max31827.rst | 48 ++++++++++++++----
>  drivers/hwmon/max31827.c         | 85 +++++++++++++++++++++++++++++---
>  2 files changed, 116 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31827.rst
> index 9a1055a007cf..a8bbfb85dd02 100644
> --- a/Documentation/hwmon/max31827.rst
> +++ b/Documentation/hwmon/max31827.rst
> @@ -52,13 +52,21 @@ MAX31827 has low and over temperature alarms with an effective value and a
>  hysteresis value: -40 and -30 degrees for under temperature alarm and +100 and
>  +90 degrees for over temperature alarm.
>  
> -The alarm can be configured in comparator and interrupt mode. Currently only
> -comparator mode is implemented. In Comparator mode, the OT/UT status bits have a
> -value of 1 when the temperature rises above the TH value or falls below TL,
> -which is also subject to the Fault Queue selection. OT status returns to 0 when
> -the temperature drops below the TH_HYST value or when shutdown mode is entered.
> -Similarly, UT status returns to 0 when the temperature rises above TL_HYST value
> -or when shutdown mode is entered.
> +The alarm can be configured in comparator and interrupt mode from the
> +devicetree. In Comparator mode, the OT/UT status bits have a value of 1 when the
> +temperature rises above the TH value or falls below TL, which is also subject to
> +the Fault Queue selection. OT status returns to 0 when the temperature drops
> +below the TH_HYST value or when shutdown mode is entered. Similarly, UT status
> +returns to 0 when the temperature rises above TL_HYST value or when shutdown
> +mode is entered.
> +
> +In interrupt mode exceeding TH also sets OT status to 1, which remains set until
> +a read operation is performed on the configuration/status register (max or min
> +attribute); at this point, it returns to 0. Once OT status is set to 1 from
> +exceeding TH and reset, it is set to 1 again only when the temperature drops
> +below TH_HYST. The output remains asserted until it is reset by a read. It is
> +set again if the temperature rises above TH, and so on. The same logic applies
> +to the operation of the UT status bit.
>  
>  Putting the MAX31827 into shutdown mode also resets the OT/UT status bits. Note
>  that if the mode is changed while OT/UT status bits are set, an OT/UT status
> @@ -68,6 +76,18 @@ clear the status bits before changing the operating mode.
>  
>  The conversions can be manual with the one-shot functionality and automatic with
>  a set frequency. When powered on, the chip measures temperatures with 1 conv/s.
> +The conversion rate can be modified with update_interval attribute of the chip.
> +Conversion/second = 1/update_interval. Thus, the available options according to
> +the data sheet are:
> +
> +- 64000 (ms) = 1 conv/64 sec
> +- 32000 (ms) = 1 conv/32 sec
> +- 16000 (ms) = 1 conv/16 sec
> +- 4000 (ms) = 1 conv/4 sec
> +- 1000 (ms) = 1 conv/sec (default)
> +- 250 (ms) = 4 conv/sec
> +- 125 (ms) = 8 conv/sec
> +
>  Enabling the device when it is already enabled has the side effect of setting
>  the conversion frequency to 1 conv/s. The conversion time varies depending on
>  the resolution. The conversion time doubles with every bit of increased
> @@ -83,8 +103,18 @@ in the writing of alarm values too. For positive numbers the user-input value
>  will always be rounded down to the nearest possible value, for negative numbers
>  the user-input will always be rounded up to the nearest possible value.
>  
> +Bus timeout resets the I2C-compatible interface when SCL is low for more than
> +30ms (nominal).
> +
> +Alarm polarity determines if the active state of the alarm is low or high. The
> +behavior for both settings is dependent on the Fault Queue setting. The ALARM
> +pin is an open-drain output and requires a pullup resistor to operate.
> +
> +The Fault Queue bits select how many consecutive temperature faults must occur
> +before overtemperature or undertemperature faults are indicated in the
> +corresponding status bits.
> +
>  Notes
>  -----
>  
> -Currently fault queue, alarm polarity and resolution cannot be modified.
> -PEC is not implemented either.
> +PEC and resolution are not implemented.
> diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
> index f05762219995..2bddca60666d 100644
> --- a/drivers/hwmon/max31827.c
> +++ b/drivers/hwmon/max31827.c
> @@ -12,6 +12,19 @@
>  #include <linux/i2c.h>
>  #include <linux/mutex.h>
>  #include <linux/regmap.h>
> +#include <linux/hwmon-sysfs.h>

What is this supposed to be needed for ?

> +#include <linux/of_device.h>
> +
> +/*
> + * gcc turns __builtin_ffsll() into a call to __ffsdi2(), which is not provided
> + * by every architecture. __ffs64() is available on all architectures, but the
> + * result is not defined if no bits are set.
> + */
> +#define max31827__bf_shf(x)			 \
> +	({					 \
> +		typeof(x) x_ = (x);		 \
> +		((x_) != 0) ? __ffs64(x_) : 0x0; \
> +	})

You lost me here. The passed parameter is u32, making __ffs64
unnecessary. Why not use ffs() ?

>  
>  #define MAX31827_T_REG			0x0
>  #define MAX31827_CONFIGURATION_REG	0x2
> @@ -22,11 +35,19 @@
>  
>  #define MAX31827_CONFIGURATION_1SHOT_MASK	BIT(0)
>  #define MAX31827_CONFIGURATION_CNV_RATE_MASK	GENMASK(3, 1)
> -#define MAX31827_CONFIGURATION_U_TEMP_STAT_MASK	BIT(14)
> -#define MAX31827_CONFIGURATION_O_TEMP_STAT_MASK	BIT(15)
> +#define MAX31827_CONFIGURATION_TIMEOUT_MASK	BIT(5)
> +#define MAX31827_CONFIGURATION_RESOLUTION_MASK	GENMASK(7, 6)
> +#define MAX31827_CONFIGURATION_ALRM_POL_MASK	BIT(8)
> +#define MAX31827_CONFIGURATION_COMP_INT_MASK	BIT(9)
> +#define MAX31827_CONFIGURATION_FLT_Q_MASK	GENMASK(11, 10)
> +#define MAX31827_CONFIGURATION_U_TEMP_STAT_MASK BIT(14)
> +#define MAX31827_CONFIGURATION_O_TEMP_STAT_MASK BIT(15)

Why drop the <tab> after MAX31827_CONFIGURATION_U_TEMP_STAT_MASK
and MAX31827_CONFIGURATION_O_TEMP_STAT_MASK ?

>  
>  #define MAX31827_12_BIT_CNV_TIME	140
>  
> +#define MAX31827_ALRM_POL_LOW	0x0
> +#define MAX31827_FLT_Q_1	0x0
> +
>  #define MAX31827_16_BIT_TO_M_DGR(x)	(sign_extend32(x, 15) * 1000 / 16)
>  #define MAX31827_M_DGR_TO_16_BIT(x)	(((x) << 4) / 1000)
>  #define MAX31827_DEVICE_ENABLE(x)	((x) ? 0xA : 0x0)
> @@ -58,6 +79,7 @@ struct max31827_state {
>  	struct mutex lock;
>  	struct regmap *regmap;
>  	bool enable;
> +	struct i2c_client *client;

Only used in max31827_init_client(). Pass it as parameter
to that function.

>  };
>  
>  static const struct regmap_config max31827_regmap = {
> @@ -361,14 +383,57 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
>  	return -EOPNOTSUPP;
>  }
>  
> -static int max31827_init_client(struct max31827_state *st)
> +static int max31827_init_client(struct max31827_state *st,
> +				struct fwnode_handle *fwnode)
>  {
> +	bool prop;
> +	u32 data, lsb_idx;
> +	unsigned int res = 0;
> +	int ret;
> +
>  	st->enable = true;
> +	res |= MAX31827_DEVICE_ENABLE(1);
> +
> +	res |= MAX31827_CONFIGURATION_RESOLUTION_MASK;
> +
> +	prop = fwnode_property_read_bool(fwnode, "adi,comp-int");
> +	res |= FIELD_PREP(MAX31827_CONFIGURATION_COMP_INT_MASK, prop);
> +
> +	prop = fwnode_property_read_bool(fwnode, "adi,timeout-enable");
> +	res |= FIELD_PREP(MAX31827_CONFIGURATION_TIMEOUT_MASK, !prop);
> +
> +	if (fwnode_property_present(fwnode, "adi,alarm-pol")) {
> +		ret = fwnode_property_read_u32(fwnode, "adi,alarm-pol", &data);
> +		if (ret)
> +			return ret;
>  
> -	return regmap_update_bits(st->regmap, MAX31827_CONFIGURATION_REG,
> -				  MAX31827_CONFIGURATION_1SHOT_MASK |
> -					  MAX31827_CONFIGURATION_CNV_RATE_MASK,
> -				  MAX31827_DEVICE_ENABLE(1));
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
> +	} else {
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
> +				  MAX31827_ALRM_POL_LOW);
> +	}
> +
> +	if (fwnode_property_present(fwnode, "adi,fault-q")) {
> +		ret = fwnode_property_read_u32(fwnode, "adi,fault-q", &data);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Convert the desired fault queue into register bits.
> +		 */
> +		lsb_idx = max31827__bf_shf(data);
> +		if (lsb_idx > 3 || data != BIT(lsb_idx)) {
> +			dev_err(&st->client->dev, "Invalid data in fault queue\n");

This is misleading. It is not "Invalid data in fault queue",
it is an invalid value in the "adi,fault-q" property.

> +			return -EOPNOTSUPP;

			return -EINVAL;

As you state yourself, this is invalid data, not an unsupported operation.

> +		}
> +
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
> +	} else {
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
> +				  MAX31827_FLT_Q_1);
> +	}
> +
> +	return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
>  }
>  
>  static const struct hwmon_channel_info *max31827_info[] = {
> @@ -396,6 +461,7 @@ static int max31827_probe(struct i2c_client *client)
>  	struct device *dev = &client->dev;
>  	struct device *hwmon_dev;
>  	struct max31827_state *st;
> +	struct fwnode_handle *fwnode;
>  	int err;
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WORD_DATA))
> @@ -412,7 +478,10 @@ static int max31827_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(st->regmap),
>  				     "Failed to allocate regmap.\n");
>  
> -	err = max31827_init_client(st);
> +	st->client = client;
> +	fwnode = dev_fwnode(dev);
> +
> +	err = max31827_init_client(st, fwnode);

Both fwnode and client are only used in that function.
Actually, client is only used to get client->dev.
Just pass dev and st, get fwnode in max31827_init_client(),
and use dev directly there.

Guenter
