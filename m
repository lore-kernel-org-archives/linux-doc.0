Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E820311
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 01:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769479116; cv=none; b=WyZL4+47bYKcOAVf8UIpPsAEta/db7Qlnxl717i8o8zFoWLjrS9Q0IGvMkhkyqez1ZHRxgPaIcXMp27X/KV+MwiPSKYqjvgluwXAuzShFlPGBgX5yF3+i2vOO663j+/4NxgHi7xyFN59CFGjIog+A9Y5aSd/5sbQJHdX5ARF1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769479116; c=relaxed/simple;
	bh=Z6FKSJ4ik0isyMON2BUlYrXhP0sSTcGhFzDo5n6krps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq1o/480LZp1TQVB8HROKGSECFn6xTp15PRLyURY14mKRwdJsvhVJ6SGdXAxYVK6he1rza00jgTo4OtX/2E2Tufds+qXcy+rYfXJPy5stZu2sPJCthDLuYF76ogVqaQwiXIxnX2tkx6Y6dwtYIBAgkcBJYcKGJkUCeS2jZKUFdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWcae3eW; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWcae3eW"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c6a7638f42so744765285a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 17:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769479114; x=1770083914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkJAiqPJ0RIuEVTSHTXvdfZdv/4BNy1OhAhyG+OYEiU=;
        b=VWcae3eWvNsHx/YSsDSg3QqZV57mLU6Q+KVNnJChsOAFjVqfj1QPlxZy4vaJkUrOA1
         aiBJMDgmlNtSLV69/E4rSg1p2RAFdYtKLjQQuZQzG8q/oMf2F50O/q5VOdZeTHRtP9g1
         gLbf28zSZjDIDcIp42wLQWSszRF85bnEpx/jt57ZBsZCV7+IUVAyIUm+/KEIbQB3u7/f
         feM7ddxL07RK91ZCF/DNV3GsxJlxlYf9tFcIbgHJve+u0MlZ5JkWSiCLJJaQNHUNXkcS
         lP2FWk8MCEiIg53Dyi7PtXg3fLKsK6aVbSz6Tc6LTZc6ZMsdO/tIYxhWp3lj+jAhJtHh
         Wqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769479114; x=1770083914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vkJAiqPJ0RIuEVTSHTXvdfZdv/4BNy1OhAhyG+OYEiU=;
        b=roHnTgiznVhMgid40kmQJ9t4DIUlAo1tltxkC3Uh42pprfzGPiKthlJ6PvNPvYBhtv
         rhoEJz+1IrhQLOb32Jjn9IJb50LQ1qzWcqreJiIzFtRI152lTbUlY/IVLytgKG3+eXn5
         nd5O6+J47R8LrEeZbILPngmuezz1/QXJCob/o0/woQB1WqAvlub461PaIGBwQ7IJJ8oQ
         WlU5PVslcAOiIQ1swAIyYm2QfEsBzkAdWEXbRE6d71ZBwc2DqvtP3jmrbMw6b40lK1yq
         3DEzOHegKSrn6z8KqI2h8fzMyqNPmKYwMm2bnXmCtpd5NumxCrte36kEg2V5wKoXD0Le
         yYUA==
X-Forwarded-Encrypted: i=1; AJvYcCUWo2/wn7p4cUo0EuJmsBpnCFgEgfZPSQkEPQhHG8ejAGprHd/NP61zefLRAH5w6pW8zIC/zzhkHAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5Xi4oj25V5A8gQkV4j/3V/VVIOi+oDJVduqbYRzrwuj2LjBI
	T1mlVp3+ift6zFm9aqFn90B/bJMur9qsVP2c4/sndEEDpBwUiqMK0jgFmByo+fbw
X-Gm-Gg: AZuq6aJrMOpqCsoBJyfu9PkZVQZf0PyuNSq2Ayg4oWaQ7+4saZX8B6a4nOLdFYeSpnr
	+w8rduafn4FXZKkuSlBxbprNi7seHw+roZSUyBpZBg0E8Y4Gdo/Uuv6nfjnIRVWv9bwUofLVas6
	MspZwNUeNQx2VlpFKmjHtxWfso+I+9HsYREMcA+xSVMlN+6tMxRNEeiRLZdHnjqCtHYDHf3atI5
	w7r/4wCysYysL2yXvB0xE9KQmUhEIleUnr56r47bmQk+bS6K2LlYbIZ5E22/mQ61klOEAefAwY+
	hb+yu2jNBxM9U8VRlOnFjbOQLa1nJsfg+U6eb1cLEwd21EoOKcugKFgB9LO0FWbbBT0kwvNxWSg
	XxOkdlVC+OoZvXrx7WSxaR9OxUKNT54e3Yjwo1bseUsBDPzDN3Rx90yECRlHiUY5Iu0/WRYV5zq
	w3MTP50eQiW/E7zy49hj92P6DF
X-Received: by 2002:a17:902:cf4b:b0:29d:df04:fcdf with SMTP id d9443c01a7336-2a8453248e6mr56918905ad.42.1769472964310;
        Mon, 26 Jan 2026 16:16:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd123sm98625565ad.96.2026.01.26.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:16:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:16:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com
Subject: Re: [PATCH v5 2/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
Message-ID: <2138f2dd-cf45-4a74-b974-2bcce3793ca9@roeck-us.net>
References: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
 <20260119040459.2898998-2-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119040459.2898998-2-mayankmahajan.x@nxp.com>

On Mon, Jan 19, 2026 at 09:34:58AM +0530, Mayank Mahajan wrote:
> Add support for the P3T1035 & P3T2030 temperature sensor. While mostly
> compatible with the TMP108, P3T1035 uses an 8-bit configuration register
> instead of the 16-bit layout used by TMP108. Updated driver to handle
> this difference during configuration read/write.
> 
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>

Applied.

Thanks,
Guenter

> ---
> V1 -> V2:
> - Disabled hysteresis in is_visible function for P3T1035.
> - Added tables for conversion rate similar to the LM75 driver.
> - Implemented different bus access depending on the chip being used.
>    - Removed regmap for 8 bits; now we are using one regmap as before.
>    - Added read and write functions for i2c and i3c for use with regmap.
>    - Mapped the 8-bit configuration register to a 16 bit value for P3T1035.
> V2 -> V3:
> - Remove changes not relevant to adding a new device in the driver.
> - Address warnings due to incorrect usage of casting operations.
> - Remove the usage of P3T2030 as it's functionally identical to P3T1035.
> V3 -> V4:
> - Add GENMASK for getting mask for conversion rates.
> - Add static arrays for containing sample times for different sensors.
> - Remove redundant code such as checking for NULL pointer in probe.
> - Improve readability by removing double negation.
> - Remove type cast where not required; make reg_buf & val_buf local.
> V4 -> V5:
> - Remove device ID and use a separate parameter structure instead.
> - Revert formatting in the device structure back to the original one.
> 
>  drivers/hwmon/Kconfig  |   2 +-
>  drivers/hwmon/tmp108.c | 197 +++++++++++++++++++++++++++++++++--------
>  2 files changed, 161 insertions(+), 38 deletions(-)
> 
> --
> 2.34.1
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..31969bddc812 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2398,7 +2398,7 @@ config SENSORS_TMP108
>  	select REGMAP_I3C if I3C
>  	help
>  	  If you say yes here you get support for Texas Instruments TMP108
> -	  sensor chips and NXP P3T1085.
> +	  sensor chips, NXP temperature sensors P3T1035, P3T1085 and P3T2030.
> 
>  	  This driver can also be built as a module. If so, the module
>  	  will be called tmp108.
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index 60a237cbedbc..ae258fa7676e 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -17,6 +17,8 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> +#include <linux/util_macros.h>
> +#include <linux/bitfield.h>
> 
>  #define	DRIVER_NAME "tmp108"
> 
> @@ -70,10 +72,36 @@
> 
>  #define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */
> 
> +#define TMP108_CONF_CR0_POS		13
> +#define TMP108_CONF_CR1_POS		14
> +#define TMP108_CONF_CONVRATE_FLD	GENMASK(TMP108_CONF_CR1_POS, TMP108_CONF_CR0_POS)
> +
>  struct tmp108 {
>  	struct regmap *regmap;
>  	u16 orig_config;
>  	unsigned long ready_time;
> +	const struct tmp108_params *params;
> +};
> +
> +struct tmp108_params {
> +	bool config_reg_16bits;
> +	const u16 *sample_times;
> +	size_t n_sample_times;
> +};
> +
> +static const u16 p3t1035_sample_times[] = {4000, 1000, 250, 125};
> +static const u16 tmp108_sample_times[] = {4000, 1000, 250, 63};
> +
> +static const struct tmp108_params p3t1035_data = {
> +	.sample_times = p3t1035_sample_times,
> +	.n_sample_times  = ARRAY_SIZE(p3t1035_sample_times),
> +	.config_reg_16bits = false,
> +};
> +
> +static const struct tmp108_params tmp108_data = {
> +	.sample_times = tmp108_sample_times,
> +	.n_sample_times  = ARRAY_SIZE(tmp108_sample_times),
> +	.config_reg_16bits = true,
>  };
> 
>  /* convert 12-bit TMP108 register value to milliCelsius */
> @@ -101,21 +129,8 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
>  					  &regval);
>  			if (err < 0)
>  				return err;
> -			switch (regval & TMP108_CONF_CONVRATE_MASK) {
> -			case TMP108_CONVRATE_0P25HZ:
> -			default:
> -				*temp = 4000;
> -				break;
> -			case TMP108_CONVRATE_1HZ:
> -				*temp = 1000;
> -				break;
> -			case TMP108_CONVRATE_4HZ:
> -				*temp = 250;
> -				break;
> -			case TMP108_CONVRATE_16HZ:
> -				*temp = 63;
> -				break;
> -			}
> +			*temp = tmp108->params->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD,
> +								       regval)];
>  			return 0;
>  		}
>  		return -EOPNOTSUPP;
> @@ -192,22 +207,18 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
>  {
>  	struct tmp108 *tmp108 = dev_get_drvdata(dev);
>  	u32 regval, mask;
> +	size_t len;
> +	u8 index;
>  	int err;
> 
>  	if (type == hwmon_chip) {
>  		if (attr == hwmon_chip_update_interval) {
> -			if (temp < 156)
> -				mask = TMP108_CONVRATE_16HZ;
> -			else if (temp < 625)
> -				mask = TMP108_CONVRATE_4HZ;
> -			else if (temp < 2500)
> -				mask = TMP108_CONVRATE_1HZ;
> -			else
> -				mask = TMP108_CONVRATE_0P25HZ;
> +			len = tmp108->params->n_sample_times;
> +			index = find_closest_descending(temp, tmp108->params->sample_times, len);
>  			return regmap_update_bits(tmp108->regmap,
>  						  TMP108_REG_CONF,
>  						  TMP108_CONF_CONVRATE_MASK,
> -						  mask);
> +						  FIELD_PREP(TMP108_CONF_CONVRATE_FLD, index));
>  		}
>  		return -EOPNOTSUPP;
>  	}
> @@ -251,6 +262,8 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
>  static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
>  				 u32 attr, int channel)
>  {
> +	const struct tmp108 *tmp108 = data;
> +
>  	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
>  		return 0644;
> 
> @@ -264,8 +277,11 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
>  		return 0444;
>  	case hwmon_temp_min:
>  	case hwmon_temp_max:
> +		return 0644;
>  	case hwmon_temp_min_hyst:
>  	case hwmon_temp_max_hyst:
> +		if (!tmp108->params->config_reg_16bits)
> +			return 0;
>  		return 0644;
>  	default:
>  		return 0;
> @@ -311,6 +327,106 @@ static bool tmp108_is_volatile_reg(struct device *dev, unsigned int reg)
>  	return reg == TMP108_REG_TEMP || reg == TMP108_REG_CONF;
>  }
> 
> +static int tmp108_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i2c_client *client = context;
> +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits) {
> +		ret = i2c_smbus_read_byte_data(client, TMP108_REG_CONF);
> +		if (ret < 0)
> +			return ret;
> +		*val = ret << 8;
> +		return 0;
> +	}
> +
> +	ret = i2c_smbus_read_word_swapped(client, reg);
> +	if (ret < 0)
> +		return ret;
> +	*val = ret;
> +	return 0;
> +}
> +
> +static int tmp108_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i2c_client *client = context;
> +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits)
> +		return i2c_smbus_write_byte_data(client, reg, val >> 8);
> +	return i2c_smbus_write_word_swapped(client, reg, val);
> +}
> +
> +static const struct regmap_bus tmp108_i2c_regmap_bus = {
> +	.reg_read = tmp108_i2c_reg_read,
> +	.reg_write = tmp108_i2c_reg_write,
> +};
> +
> +static int tmp108_i3c_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i3c_device *i3cdev = context;
> +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> +	u8 reg_buf[1], val_buf[2];
> +	struct i3c_xfer xfers[] = {
> +		{
> +			.rnw = false,
> +			.len = 1,
> +			.data.out = reg_buf,
> +		},
> +		{
> +			.rnw = true,
> +			.len = 2,
> +			.data.in = val_buf,
> +		},
> +	};
> +	int ret;
> +
> +	reg_buf[0] = reg;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits)
> +		xfers[1].len--;
> +
> +	ret = i3c_device_do_xfers(i3cdev, xfers, 2, I3C_SDR);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = val_buf[0] << 8;
> +	if (reg != TMP108_REG_CONF || tmp108->params->config_reg_16bits)
> +		*val |= val_buf[1];
> +
> +	return 0;
> +}
> +
> +static int tmp108_i3c_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i3c_device *i3cdev = context;
> +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> +	u8 val_buf[3];
> +	struct i3c_xfer xfers[] = {
> +		{
> +			.rnw = false,
> +			.len = 3,
> +			.data.out = val_buf,
> +		},
> +	};
> +
> +	val_buf[0] = reg;
> +	val_buf[1] = (val >> 8) & 0xff;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits)
> +		xfers[0].len--;
> +	else
> +		val_buf[2] = val & 0xff;
> +
> +	return i3c_device_do_xfers(i3cdev, xfers, 1, I3C_SDR);
> +}
> +
> +static const struct regmap_bus tmp108_i3c_regmap_bus = {
> +	.reg_read = tmp108_i3c_reg_read,
> +	.reg_write = tmp108_i3c_reg_write,
> +};
> +
>  static const struct regmap_config tmp108_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 16,
> @@ -323,7 +439,8 @@ static const struct regmap_config tmp108_regmap_config = {
>  	.use_single_write = true,
>  };
> 
> -static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
> +static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
> +			       const struct tmp108_params *params)
>  {
>  	struct device *hwmon_dev;
>  	struct tmp108 *tmp108;
> @@ -340,6 +457,7 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
> 
>  	dev_set_drvdata(dev, tmp108);
>  	tmp108->regmap = regmap;
> +	tmp108->params = params;
> 
>  	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
>  	if (err < 0) {
> @@ -351,7 +469,6 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
>  	/* Only continuous mode is supported. */
>  	config &= ~TMP108_CONF_MODE_MASK;
>  	config |= TMP108_MODE_CONTINUOUS;
> -
>  	/* Only comparator mode is supported. */
>  	config &= ~TMP108_CONF_TM;
> 
> @@ -386,15 +503,15 @@ static int tmp108_probe(struct i2c_client *client)
>  	struct regmap *regmap;
> 
>  	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WORD_DATA))
> +				     I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
>  		return dev_err_probe(dev, -ENODEV,
>  				     "adapter doesn't support SMBus word transactions\n");
> 
> -	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> +	regmap = devm_regmap_init(dev, &tmp108_i2c_regmap_bus, client, &tmp108_regmap_config);
>  	if (IS_ERR(regmap))
>  		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
> 
> -	return tmp108_common_probe(dev, regmap, client->name);
> +	return tmp108_common_probe(dev, regmap, client->name, i2c_get_match_data(client));
>  }
> 
>  static int tmp108_suspend(struct device *dev)
> @@ -420,15 +537,17 @@ static int tmp108_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
> 
>  static const struct i2c_device_id tmp108_i2c_ids[] = {
> -	{ "p3t1085" },
> -	{ "tmp108" },
> -	{ }
> +	{ "p3t1035", (unsigned long)&p3t1035_data },
> +	{ "p3t1085", (unsigned long)&tmp108_data },
> +	{ "tmp108", (unsigned long)&tmp108_data },
> +	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
> 
>  static const struct of_device_id tmp108_of_ids[] = {
> -	{ .compatible = "nxp,p3t1085", },
> -	{ .compatible = "ti,tmp108", },
> +	{ .compatible = "nxp,p3t1035", .data = &p3t1035_data },
> +	{ .compatible = "nxp,p3t1085", .data = &tmp108_data },
> +	{ .compatible = "ti,tmp108", .data = &tmp108_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, tmp108_of_ids);
> @@ -444,7 +563,8 @@ static struct i2c_driver tmp108_driver = {
>  };
> 
>  static const struct i3c_device_id p3t1085_i3c_ids[] = {
> -	I3C_DEVICE(0x011b, 0x1529, NULL),
> +	I3C_DEVICE(0x011B, 0x1529, &tmp108_data),
> +	I3C_DEVICE(0x011B, 0x152B, &p3t1035_data),
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> @@ -453,13 +573,16 @@ static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>  {
>  	struct device *dev = i3cdev_to_dev(i3cdev);
>  	struct regmap *regmap;
> +	const struct i3c_device_id *id;
> 
> -	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
> +	regmap = devm_regmap_init(dev, &tmp108_i3c_regmap_bus, i3cdev, &tmp108_regmap_config);
>  	if (IS_ERR(regmap))
>  		return dev_err_probe(dev, PTR_ERR(regmap),
>  				     "Failed to register i3c regmap\n");
> 
> -	return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
> +	id = i3c_device_match_id(i3cdev, p3t1085_i3c_ids);
> +
> +	return tmp108_common_probe(dev, regmap, "p3t1085_i3c", id->data);
>  }
> 
>  static struct i3c_driver p3t1085_driver = {
