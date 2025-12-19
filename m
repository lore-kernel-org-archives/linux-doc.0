Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7E34F495
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170048; cv=none; b=oeDCIYyX2YEUevnqYFjYTMBEYHbeShJH+IldCWmxP+2Q3SqgDIaPfyCnigjeszh93fBKclHTcvCOgsZwTKhJwR2P+VHHoHkybsMNsayXzmTLHdy/RnMKjiZ+mELd8K9odJidLxC0b8hpMHL9C7SUIj9PWKl9+bTvHk2mXtTQSJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170048; c=relaxed/simple;
	bh=vmmlyERkT3AjRqpZk/y1yFDkCVu7HL5/z99/+aWZxrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIVYXYD3Fmjd3kyt5j66gXFZ9l916f3lyqTzU/mdQqAtEcpEnp5dKAH016eJlz8r8z2Mkm3gcpEN+1s6hbMvHR0Tl6UDItab/CESd/ItXnjj+BkNjFZp2WdvPN70ugij9Dma8jdGST1+0WQgnzMkI4EnXHH4pR/hpGaKO6+HPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK78M4RC; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK78M4RC"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ed861eb98cso21456841cf.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766170045; x=1766774845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuCZ+fHIJQF3Nuz7eOBOWcO6aa8yeNtMpL8cd+du1T4=;
        b=cK78M4RCht45YR2ntoVjWjDSITpnau0Rzhv2n55WLbkKJ3Ws9gvXezVAdM+NWjSQNO
         GHtmCN9vYuLWebemr99pq5pHcLNoJHVDtybmEYFMnxdl4fTHC+/RthCU8URXS+tslKfy
         MYXky1px5XdYb0JmvE0k09rJN302ZkJSq6aFcPtujyRJQzRHL/AsCNb9KcBWkKDQ2RMU
         cUzf7Fn0uSFY3U9OJOQPJi8m2NEeVaJ+N8U4y26on9+0Af7EtwA7dL3Tl6U9jbQ5s8gY
         yN/0RU3TsMq8/4EfK9f3aRZpekJmhEGGGEVxd5AMRSMd930BPuJHqKslPHZOIbdlb+pK
         loeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766170045; x=1766774845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuCZ+fHIJQF3Nuz7eOBOWcO6aa8yeNtMpL8cd+du1T4=;
        b=U0aJ9KdNf3dB34GISQb/0ORtJeg3yibSRSqqpF45RvitM9kLhn0laEBdxNS/PGu5kv
         d6s7e00q7VdFHrO4DfOAmm53KAF0daalaDCpSt2Mnwm95beazyi6zovF+BiGzk16y/GN
         z6u2qzwKpeyQDP25T3yIRUJ9HSBc56QCOz9KZYfVXA3xPerz1C2rXOLNzo1vXWaloJYI
         j6CjVEmUsEZVpMvQRfbc/pjpdHN1kE1hYQehB+qTtSm7NjAGB/DN6h+N1Qeob6+Pk86j
         BcqY5armS+7y6VqvbOeY/qOq21I47/uajqOxgdjal4w9aVOSZdKzKt6tR1Xzz4umwg3h
         i+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc2Oe1psfgN7l7lbXXCU59APPCc7sy0mfcAtZRkCNHtqwq7K++XdNw3k3fT3oNIYbGXtBZNkvAkAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1b1aNqeY8MfqeA6Dr58cWNOWgib0OmxDF2HrY9aSyAhuedG65
	eMb68SuLzyLMo1v6lN2tldVt1B9tU1uxcVKXvKTh2Alrh/PLF0B/S190HjguBQ==
X-Gm-Gg: AY/fxX5Tz3j/s50gzJESuH8PVTFdWVm2sdtdRSJs8dyOQm6nrFldhyLyjpUO4cb81ES
	6uwVOal9ziLpIBbgpwqhBYn8HGK3Qvm0mWpFutVcf31MCOrV+9XfQ20DwWdndwIrTRUd0zc/a3D
	xo2I0izmGYfiw4B4PjrYY4VKqD1bdrOJNabxV/OQNGl9ega0nAMejm/fESV12M4DF6BZEpjKsm9
	a+jgRBCbV9S808A9tLTZG7dE7OhH4frAoevOaODXmF7aFFaC/LtHZZKrEIxCo0fjWeRn3aIuW/x
	oMS83nrfQW/O3Qsvlabfb0bN8eo2Aj6Whz+LIRefaRg/+ckitq48uKflocXwftojw3J7b5yKYkz
	6cRQjMiAdby6UB4SN1ogi7U/Jy/AuK//rPbZKV2PQMQwKGV6f6Qi7kMR5nL9gSITSOoZViTTqay
	l306L22QTyey18CcGtoJc0f0fy
X-Google-Smtp-Source: AGHT+IHOKSC+KI1Nyc4OKONZJ3szj4wUL6LNTRbQr8apuim/UbhzwDmhASs87IoUPE1cdNRRnYXwYA==
X-Received: by 2002:a05:7022:248a:b0:11b:9152:b3ad with SMTP id a92af1059eb24-121722dff70mr3707810c88.31.1766163143581;
        Fri, 19 Dec 2025 08:52:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm9673327c88.9.2025.12.19.08.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:52:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Dec 2025 08:52:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add mp5926 driver
Message-ID: <7fbb2eb5-5257-4461-96d8-264a1ac243a6@roeck-us.net>
References: <20251219055413.1661-1-Yuxi.Wang@monolithicpower.com>
 <20251219055413.1661-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219055413.1661-3-Yuxi.Wang@monolithicpower.com>

On Fri, Dec 19, 2025 at 01:54:13PM +0800, Yuxi Wang wrote:
> Add support for mps mp5926.
> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Applied, with a minor fix. See below.

Thanks,
Guenter

> ---
>  Documentation/hwmon/index.rst  |   1 +
>  Documentation/hwmon/mp5926.rst |  92 ++++++++++++++++
>  MAINTAINERS                    |   7 ++
>  drivers/hwmon/pmbus/Kconfig    |   9 ++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/mp5926.c   | 185 +++++++++++++++++++++++++++++++++
>  6 files changed, 295 insertions(+)
>  create mode 100644 Documentation/hwmon/mp5926.rst
>  create mode 100644 drivers/hwmon/pmbus/mp5926.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..6181c3f62177 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -185,6 +185,7 @@ Hardware Monitoring Kernel Drivers
>     mp2993
>     mp5023
>     mp5920
> +   mp5926
>     mp5990
>     mp9941
>     mp9945
> diff --git a/Documentation/hwmon/mp5926.rst b/Documentation/hwmon/mp5926.rst
> new file mode 100644
> index 000000000000..4b64a7e24ae6
> --- /dev/null
> +++ b/Documentation/hwmon/mp5926.rst
> @@ -0,0 +1,92 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp5926
> +====================
> +
> +Supported chips:
> +
> +  * MPS mp5926
> +
> +    Prefix: 'mp5926'
> +
> +  * Datasheet
> +    https://www.monolithicpower.com/en/
> +
> +Author:
> +
> +	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP5926 Hot-Swap Controller.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_lcrit**
> +
> +**in2_lcrit_alarm**
> +
> +**in2_rated_max**
> +
> +**in2_rated_min**
> +
> +The driver provides the following attributes for input current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr2_input**
> +
> +**curr2_label**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +The driver provides the following attributes for output power:
> +
> +**power2_input**
> +
> +**power2_label**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d701a4d5b00e..fea710aab535 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17708,6 +17708,13 @@ S:	Maintained
>  F:	Documentation/hwmon/mp2993.rst
>  F:	drivers/hwmon/pmbus/mp2993.c
>  
> +MPS MP5926 DRIVER
> +M:	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/mp5926.rst
> +F:	drivers/hwmon/pmbus/mp5926.c
> +
>  MPS MP9941 DRIVER
>  M:	Noah Wang <noahwang.wang@outlook.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..d0aa460abdc9 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -472,6 +472,15 @@ config SENSORS_MP5920
>  	  This driver can also be built as a module. If so, the module will
>  	  be called mp5920.
>  
> +config SENSORS_MP5926
> +	tristate "MPS MP5926"
> +	help
> +	  If you say yes here you get hardware monitoring support for Monolithic
> +	  MP5926.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp5926.
> +
>  config SENSORS_MP5990
>  	tristate "MPS MP5990"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..75ec4956ca8d 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>  obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
>  obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
> +obj-$(CONFIG_SENSORS_MP5926)	+= mp5926.o
>  obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
>  obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
>  obj-$(CONFIG_SENSORS_MP9945)	+= mp9945.o
> diff --git a/drivers/hwmon/pmbus/mp5926.c b/drivers/hwmon/pmbus/mp5926.c
> new file mode 100644
> index 000000000000..234a3e58f7e7
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5926.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// mp5926.c  - pmbus driver for mps mp5926
> +//
> +// Copyright 2025 Monolithic Power Systems, Inc
> +//
> +// Author: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pmbus.h>
> +#include "pmbus.h"
> +
> +#define PAGE	0x01
> +#define EFUSE_CFG	0xCF
> +#define I_SCALE_SEL	0xC6
> +#define MP5926_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
> +			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN | \
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_INPUT | \
> +			PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_VOUT)
> +
> +struct mp5926_data {
> +	struct pmbus_driver_info info;
> +	u8 vout_mode;
> +	u8 vout_linear_exponent;
> +};
> +
> +#define to_mp5926_data(x)  container_of(x, struct mp5926_data, info)
> +
> +static int mp5926_read_byte_data(struct i2c_client *client, int page,
> +				 int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp5926_data *data = to_mp5926_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		if (data->vout_mode == linear) {
> +			/*
> +			 * The VOUT format used by the chip is linear11,
> +			 * not linear16. Report that VOUT is in linear mode
> +			 * and return exponent value extracted while probing
> +			 * the chip.
> +			 */
> +			return data->vout_linear_exponent;
> +		}
> +		return PB_VOUT_MODE_DIRECT;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int mp5926_read_word_data(struct i2c_client *client, int page, int phase,
> +				 int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp5926_data *data = to_mp5926_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * Because the VOUT format used by the chip is linear11 and not
> +		 * linear16, we disregard bits[15:11]. The exponent is reported
> +		 * as part of the VOUT_MODE command.
> +		 */
> +		if (data->vout_mode == linear)
> +			ret = ((s16)((ret & 0x7ff) << 5)) >> 5;
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info mp5926_info = {
> +	.pages = PAGE,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_CURRENT_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.format[PSC_POWER] = direct,
> +
> +	.m[PSC_VOLTAGE_IN] = 16,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 0,
> +
> +	.m[PSC_CURRENT_IN] = 16,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = 0,
> +
> +	.m[PSC_VOLTAGE_OUT] = 16,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 0,
> +
> +	.m[PSC_TEMPERATURE] = 4,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 0,
> +
> +	.m[PSC_POWER] = 25,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -2,
> +
> +	.read_word_data = mp5926_read_word_data,
> +	.read_byte_data = mp5926_read_byte_data,
> +	.func[0] = MP5926_FUNC,
> +};
> +
> +static int mp5926_probe(struct i2c_client *client)
> +{
> +	struct mp5926_data *data;
> +	struct pmbus_driver_info *info;
> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mp5926_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &mp5926_info, sizeof(*info));
> +	info = &data->info;
> +	ret = i2c_smbus_read_word_data(client, EFUSE_CFG);
> +	if (ret < 0)
> +		return ret;
> +	if (ret & BIT(12)) {
> +		data->vout_mode = linear;
> +		data->info.format[PSC_VOLTAGE_IN] = linear;
> +		data->info.format[PSC_CURRENT_IN] = linear;
> +		data->info.format[PSC_VOLTAGE_OUT] = linear;
> +		data->info.format[PSC_TEMPERATURE] = linear;
> +		data->info.format[PSC_POWER] = linear;
> +		ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
> +		if (ret < 0) {
> +			dev_err_probe(&client->dev, ret, "Can't get vout exponent.");
> +			return ret;

			return dev_err_probe(&client->dev, ret, "Can't get vout exponent.");

> +		}
> +		data->vout_linear_exponent = (u8)((ret >> 11) & 0x1f);
> +	} else {
> +		data->vout_mode = direct;
> +		ret = i2c_smbus_read_word_data(client, I_SCALE_SEL);
> +		if (ret < 0)
> +			return ret;
> +		if (ret & BIT(6))
> +			data->info.m[PSC_CURRENT_IN] = 4;
> +	}
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id mp5926_id[] = {
> +	{ "mp5926", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, mp5926_id);
> +
> +static const struct of_device_id mp5926_of_match[] = {
> +	{ .compatible = "mps,mp5926" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp5926_of_match);
> +
> +static struct i2c_driver mp5926_driver = {
> +	.probe = mp5926_probe,
> +	.driver = {
> +			.name = "mp5926",
> +			.of_match_table = mp5926_of_match,
> +		   },
> +	.id_table = mp5926_id,
> +};
> +
> +module_i2c_driver(mp5926_driver);
> +MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
> +MODULE_DESCRIPTION("MPS MP5926 pmbus driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
