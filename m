Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192963A6F03
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350259; cv=none; b=M7UtTQoyLA9n9UIZHnYrUSguCx5mFbjzRX0iWWt68+AN4bIZh9EwMyxsXu2gSgOaDQOFMSYAF/31MNfQBi99hOr1bhYYp86pvM7U5pvTHxjVaAVB2mYcBUN6cdK9GZMFX7En/nfQy/3LYSeL1zNyVaXcj9YJg5LKE62nRDBu94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350259; c=relaxed/simple;
	bh=v0CmJsJ2YboECIMwVR31yUzzIZtQS7igYnAk5OF0hCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cep2A3T4DDHRl/0+K9NjI3W7hywZDHIR15kInwEy4LNGklJ5QttQc93oYrsyEgwjA1f55EGB3MJeC71VfXlGq/QhSsUx0pGnEAAw090rguVhcK0ECROmen+94uewPkhGmw+hcyfc5AzVsMIK823eVdXX5pi4jr4WL5Ko4YS+NzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeoZi6iE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeoZi6iE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so74742955e9.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776350256; x=1776955056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VysYGCXsyIEebfIwJV27h+uUWML92olF3CQNmU0siXk=;
        b=BeoZi6iEqsK2MXckmjSMjBjeBe9uUarSQD5OYlYS/ejj2hpPrub967trtIIkNijQYC
         oeFeDC9T2lHUPhB6scStq0MoNwyaI3F7IESphUJHIF6wpTaemZxH7AmqAxO9JUtzT5rh
         bhRbZSW4r2eeAl87UsnuGxGXhz6pWSsKPovyJ16CwYFcLfP8glGYiQsmXtZ+3GIKtQ+N
         aI9wFa2mKYYElmOoNbAUJFroEJq0qUfB/508tw/fZuCqoWHhI9L0bHlnUHfdheGwZf4f
         NqmNqBFgtZ+aZiC59dUAieiXTT6INbiIs0u626gFR81fwT/ufE1u/O46Pm4L1wzD0Poz
         tpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350256; x=1776955056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VysYGCXsyIEebfIwJV27h+uUWML92olF3CQNmU0siXk=;
        b=F4ntCkyluRq4ItvcZfFrI6U7gsjltEzPZr9YGtw32kWdocCp62aa3gF2uYN8Y987ql
         +AYMMbS5DobWJID0g7DOBJKRVLcD6Yu53TTChKnt9PrNTvamHbhcTsZWKqwcHn4gdxqu
         Xkxy4XQyQiUTwiztdzyjn5ZVbLGGPTBOUk1cGfCuY7u2ma5qZz12W/t/GgimCQTJQbrr
         WlR9i6N3EvmNvsY7gQCEPS9UiMNpeWdztPPWg20AMxbnYGegKQ466JnJqZbY7VNGd3Ku
         OZ913XKSz1aaDRezJ5TA2wXcxWCUQIo3cvwhzcoxJ/HZm1K1XmiOdxKC3mgkFjz1Hi9Z
         nwIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gdZuiCm1QSfRiSZTp5P7fv/v7x+kgMUz5G1yVHoO6Ws2fFVY2Hp3GRdcfEIH3rde9clu31jPpRSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4Ni/cGNgsI/u2oLr3LQgzaI0jiLpMpvlhpn9jT/H9h6GXs5z
	oGieHuC4DwSCfZgiPwY3uSNqoqp0gnEGgdz5tDZHIiQOM8GGQDXlvwfF
X-Gm-Gg: AeBDies0ipGZWGLioSEnVnqCrX0TH4ydG7DpDVdZa3gc4X+Wgrt2dQkUPU8sGANIu98
	0vLRY8ZNZoMGpriHdbj0HXgNtxHYNf+5PmEs4S6rdIjA+ykE+KmWzlJb1+MSmOq1/OtGuVGHPTk
	d1NJNylWtgljg0BEn4gN5aVQeXKe9KlT6CiOgu0BlHYpT0mwNZoa39fxQ3b6x028LcVvpoCSSys
	7sotjGLueYIhSCKhdP0FIO1l6MlbvxCubhwQ0j0SPf4Y0PNzuM51ejXkPluBbx0PQzGdyeg5oet
	TvEUG21HnTNzVHRZCbiCLzxnoqgUs5v1Txge8ylmXAHurSJ+1gZ6c+kxqfma6q8cEMHGAhZLawI
	Fn3JICbNHzTXa7iYExEMkyvteQsleXlr5Q5jucc5dZHysuAg8fqyL3BmTRkSz+8fYn+jG+Dp2L1
	pU28fa7Pq4h0jlA6c=
X-Received: by 2002:a05:600c:3f19:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488d67bbc2amr343915545e9.1.1776350255889;
        Thu, 16 Apr 2026 07:37:35 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e7ecd9sm73158735e9.7.2026.04.16.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:37:35 -0700 (PDT)
Date: Thu, 16 Apr 2026 15:38:24 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max20830) add driver for max20830
Message-ID: <aeD0BCvuu2I5UFtX@nsa>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
 <20260416-dev_max20830-v2-2-2c7d676dc0bd@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-dev_max20830-v2-2-2c7d676dc0bd@analog.com>

On Thu, Apr 16, 2026 at 03:59:11PM +0800, Alexis Czezar Torreno wrote:
> Add support for MAX20830 step-down DC-DC switching regulator with
> PMBus interface. It allows monitoring of input/output voltage,
> output current and temperature through the PMBus serial interface.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  Documentation/hwmon/index.rst    |  1 +
>  Documentation/hwmon/max20830.rst | 49 +++++++++++++++++++++++
>  MAINTAINERS                      |  2 +
>  drivers/hwmon/pmbus/Kconfig      |  9 +++++
>  drivers/hwmon/pmbus/Makefile     |  1 +
>  drivers/hwmon/pmbus/max20830.c   | 86 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 148 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8b655e5d6b68b90c697a52c7bf526e81d370caf7..56f7eb761be76dd627a2f34135abad05203b0582 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -158,6 +158,7 @@ Hardware Monitoring Kernel Drivers
>     max197
>     max20730
>     max20751
> +   max20830
>     max31722
>     max31730
>     max31760
> diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20830.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..936e409dcc5c0898dde27d782308d4a7e1357e73
> --- /dev/null
> +++ b/Documentation/hwmon/max20830.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver max20830
> +======================
> +
> +Supported chips:
> +
> +  * Analog Devices MAX20830
> +
> +    Prefix: 'max20830'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20830.pdf
> +
> +Author:
> +
> +  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> +
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for Analog Devices MAX20830
> +Step-Down Switching Regulator with PMBus Interface.
> +
> +The MAX20830 is a 2.7V to 16V, 30A fully integrated step-down DC-DC switching
> +regulator. Through the PMBus interface, the device can monitor input/output
> +voltages, output current and temperature.
> +
> +The driver is a client driver to the core PMBus driver. Please see
> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +Sysfs entries
> +-------------
> +
> +================= ========================================
> +in1_label         "vin"
> +in1_input         Measured input voltage
> +in1_alarm         Input voltage alarm
> +in2_label         "vout1"
> +in2_input         Measured output voltage
> +in2_alarm         Output voltage alarm
> +curr1_label       "iout1"
> +curr1_input       Measured output current
> +curr1_alarm       Output current alarm
> +temp1_input       Measured temperature
> +temp1_alarm       Chip temperature alarm
> +================= ========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 031c743e979521a92ed9ac67915c178ce31727bd..d6a6745e2dae29c3b8f80bbe61c54a2f5ecd9f47 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15585,6 +15585,8 @@ L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +F:	Documentation/hwmon/max20830.rst
> +F:	drivers/hwmon/pmbus/max20830.c
>  
>  MAX2175 SDR TUNER DRIVER
>  M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecbc355f5ed3400855c2852ec2aa5ef..987705bf45b75b7b91ccc469247909f3c3f53d77 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -365,6 +365,15 @@ config SENSORS_MAX20751
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max20751.
>  
> +config SENSORS_MAX20830
> +	tristate "Analog Devices MAX20830"
> +	help
> +	  If you say yes here you get hardware monitoring support for Analog
> +	  Devices MAX20830.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called max20830.
> +
>  config SENSORS_MAX31785
>  	tristate "Maxim MAX31785 and compatibles"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 7129b62bc00f8a2e98de14004997752a856dfda2..bc52f930e0825a902a0dd1c9e2b44f2e8d577c35 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
>  obj-$(CONFIG_SENSORS_MAX17616)	+= max17616.o
>  obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
>  obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
> +obj-$(CONFIG_SENSORS_MAX20830)	+= max20830.o
>  obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..21ea8b59150cb0564f1776ee08131bad7fdef003
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardware monitoring driver for Analog Devices MAX20830
> + *
> + * Copyright (C) 2026 Analog Devices, Inc.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info max20830_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +		PMBUS_HAVE_TEMP |
> +		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int max20830_probe(struct i2c_client *client)
> +{
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];

AI seems a bit paranoid but maybe to be on the safe side just initialize
the above buffer.

> +	u8 len;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> +		return -ENODEV;
> +
> +	/*
> +	 * Use i2c_smbus_read_i2c_block_data() instead of
> +	 * i2c_smbus_read_block_data() to support I2C controllers
> +	 * which do not support SMBus block reads.
> +	 */
> +	ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> +					    I2C_SMBUS_BLOCK_MAX, buf);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read IC_DEVICE_ID\n");
> +
> +	/* First byte is the block length. */
> +	len = buf[0];
> +	if (len != 9)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Unexpected IC_DEVICE_ID response\n");
> +
> +	buf[len] = '\0';

It looks like it has a point in the above though.

- Nuno Sá

