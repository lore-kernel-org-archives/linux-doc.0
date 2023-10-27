Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D8A1C05
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 04:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqrJ337s"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37A691;
	Thu, 26 Oct 2023 21:39:46 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c011e113so13639157b3.1;
        Thu, 26 Oct 2023 21:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698381586; x=1698986386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RuyN7Z9t1MvxigytHEt1NH3wRw/Dyjs2gT3gexH1ng=;
        b=gqrJ337sP6b2HJGn3fkYoWmAFV5ecpgujuomr3ktanj2AKBmwGb78O4FwC0Pwc5ER1
         X1Qr0ZMKOwJMAlP+JvRGc3iIr4Qykt9p3J9oePRay2N/C1m4L7KmZf+hCZJ1ZxYD++WG
         MsIiRDobHNVg2Mt+AoROZXBKxNBB3ZpvcQ+JoSzCV57zgusLkJxCxDzXZKxYOFP68Mqv
         8MXDcD4NuA2iArCxfACgLNloRLVjnWFPZH2n+jvM9gmZuYoOBl0xamyatN/oIwB6ZBLz
         hAsHLzoD2osqLcrietc+oTrLjeZlKBkYbNUPxzpVnKqe3fOtVW5rToW/bKm40wIMW+Zs
         QEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698381586; x=1698986386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RuyN7Z9t1MvxigytHEt1NH3wRw/Dyjs2gT3gexH1ng=;
        b=tamaU4BO48Cou43vghm7+WwXXjUpcCRBagOz94TMaO46m4g8uwQigrx9ih3O87Y4Tk
         H3gl2IiPgqlwZB4VngR86S8QOASHhVdXzwQf0UAA574LOsEfquJ6UHgGEFWfDp8o5QPE
         pEwWtf9dA5cvx8rpa5vgZlsnzLzRf0LgvhJrMbQ9RMMwDNvchKFpDWN8HdjhktyajPx8
         jRUc0iAhS4HqXNFe49RiXaNq6MkSXdO3JfqUtavIGb0AWCNgNidnzlpNcvxtTTvwpy8O
         hkq3uzPxzGahcW8l4D9aDTwplKSCsJJe4gi+AU9xPam3zGwBHs9br7FgCsuoC+r/E2Es
         oz1g==
X-Gm-Message-State: AOJu0Yz7cWt/AGuS6kVi6XSZQkrbT190yOOHQlsbA44OzNtae4kqitBq
	kqqAQFK8TBAyeK5uObd6UzA=
X-Google-Smtp-Source: AGHT+IFJbuwq32jitogZLT1Z9dyvC91j/odUsn6EzNpnh1G4M6br9ZWSjg22ifIw2RC9z8BWL5i6Zg==
X-Received: by 2002:a81:bd41:0:b0:5a7:b8de:390d with SMTP id n1-20020a81bd41000000b005a7b8de390dmr1643029ywk.13.1698381585824;
        Thu, 26 Oct 2023 21:39:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n18-20020a819e52000000b0058e37788bf7sm364006ywj.72.2023.10.26.21.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 21:39:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Oct 2023 21:39:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, kernel test robot <lkp@intel.com>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] hwmon: max31827: Handle new properties from the
 devicetree
Message-ID: <3d2e8fd9-3705-4ea9-b32f-4ca1abdd96ca@roeck-us.net>
References: <20231026144405.546822-1-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026144405.546822-1-daniel.matyas@analog.com>

On Thu, Oct 26, 2023 at 05:44:01PM +0300, Daniel Matyas wrote:
> Used fwnode to retrieve data from the devicetree in the init_client
> function.
> 
> If the uint32 properties are not present, the default values are used
> for max31827 chip.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> ---
> 
> v4 -> v5: Removed comment from __bf_shf() and used ffs() instead of
> ffs64().

You don't use ffs(). You still define a variant of it and use __ffs().

> Added tabs where there was a need.
> Removed i2c_client from private structure. In init_client() passed
> device structure, because I only used that.
> Changed error message when the data in adi,fault-q is invalid.
> Fwnode is initialized in init_client().
> 
> v3 -> v4: Renamed property names to correspond with binding.
> 
> v2 -> v3: Separated patch into 2. Fixed 'WARNING: Unexpected
> indentation.'
> Reported-by: kernel test robot <lkp@intel.com>
> 
> v2: Added patch.
> 
>  Documentation/hwmon/max31827.rst | 48 +++++++++++++++++++-----
>  drivers/hwmon/max31827.c         | 64 +++++++++++++++++++++++++++++---
>  2 files changed, 97 insertions(+), 15 deletions(-)
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
> index 614bbf5d25fa..7976d668ffd4 100644
> --- a/drivers/hwmon/max31827.c
> +++ b/drivers/hwmon/max31827.c
> @@ -12,6 +12,13 @@
>  #include <linux/i2c.h>
>  #include <linux/mutex.h>
>  #include <linux/regmap.h>
> +#include <linux/of_device.h>
> +
> +#define max31827__bf_shf(x)			 \
> +	({					 \
> +		typeof(x) x_ = (x);		 \
> +		((x_) != 0) ? __ffs(x_) : 0x0; \
> +	})
>  
>  #define MAX31827_T_REG			0x0
>  #define MAX31827_CONFIGURATION_REG	0x2
> @@ -22,6 +29,11 @@
>  
>  #define MAX31827_CONFIGURATION_1SHOT_MASK	BIT(0)
>  #define MAX31827_CONFIGURATION_CNV_RATE_MASK	GENMASK(3, 1)
> +#define MAX31827_CONFIGURATION_TIMEOUT_MASK	BIT(5)
> +#define MAX31827_CONFIGURATION_RESOLUTION_MASK	GENMASK(7, 6)
> +#define MAX31827_CONFIGURATION_ALRM_POL_MASK	BIT(8)
> +#define MAX31827_CONFIGURATION_COMP_INT_MASK	BIT(9)
> +#define MAX31827_CONFIGURATION_FLT_Q_MASK	GENMASK(11, 10)
>  #define MAX31827_CONFIGURATION_U_TEMP_STAT_MASK	BIT(14)
>  #define MAX31827_CONFIGURATION_O_TEMP_STAT_MASK	BIT(15)
>  
> @@ -361,14 +373,54 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
>  	return -EOPNOTSUPP;
>  }
>  
> -static int max31827_init_client(struct max31827_state *st)
> +static int max31827_init_client(struct max31827_state *st,
> +				struct device *dev)
>  {
> +	struct fwnode_handle *fwnode;
> +	unsigned int res = 0;
> +	u32 data, lsb_idx;
> +	bool prop;
> +	int ret;
> +
> +	fwnode = dev_fwnode(dev);
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
> +
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
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

Follow-up on above, why not something like
		lsb_idx = __ffs(data);
		if (hweight32(data) != 1 || lsb_idx > 3) {
			...

Or use ffs() and work with [1..4] instead of [0..3].
I don't see the point of defining another variant of ffs()/_ffs().

Guenter

> +			dev_err(dev, "Invalid data in adi,fault-q\n");
> +			return -EINVAL;
> +		}
> +
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
> +	}
>  
> -	return regmap_update_bits(st->regmap, MAX31827_CONFIGURATION_REG,
> -				  MAX31827_CONFIGURATION_1SHOT_MASK |
> -					  MAX31827_CONFIGURATION_CNV_RATE_MASK,
> -				  MAX31827_DEVICE_ENABLE(1));
> +	return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
>  }
>  
>  static const struct hwmon_channel_info *max31827_info[] = {
> @@ -412,7 +464,7 @@ static int max31827_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(st->regmap),
>  				     "Failed to allocate regmap.\n");
>  
> -	err = max31827_init_client(st);
> +	err = max31827_init_client(st, dev);
>  	if (err)
>  		return err;
>  
