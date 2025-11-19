Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E02C15AE
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564674; cv=none; b=F05qsmUpNgIJz2bdYT6gUp7viIDkgGIfwtdmnHoidBbBFnvI4jtvXd+delwf9QmPqSHXSXv+JS18qbGpswn5jW9f7BfTAjwplY8QMLk4C290sc+A8CKQesxaQAPnvAf30aZ/5MNi0/xAYRgf4xdHKfKVG6PPXr7S2is25G/FIdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564674; c=relaxed/simple;
	bh=2pGdmEQ8tcNTxTNUzh0gshNDtu9TrQnkKUxRwS4d/yY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NXDzFfBDGWyDSRLQdYMi40Nead03QaRi9KgrKX6SmCmj99n9hVRNo9giVechYvkYtQ6P7ijTZUkIx0TH79BFrxp7KF0tf7kHezqztLyK+U8sL4+Gsx7DteSn1TyNecOL2KZSLyNpcPMlFkEefD0Ddv9xoRqwu84w1EbCzPphW9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrleG8O0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrleG8O0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so49527665e9.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763564670; x=1764169470; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hQ+wPKZ5wbbEqM0E6GKph1xRS7ddtp2l6WjQhWQmUPM=;
        b=RrleG8O0pZ5TDASnX7q1BCnlSPWBzX84/+UkZOMWgeIPcp8H6Iuwh7VZLAoR/WHHCR
         3MlZbBlLTJGVnQWC21svLw6UPaN8xhETaTvkxQx6fkMz5uapAZoSThkpqoywsmb+H0ZX
         SJhuggVmG5LSPmvaIGoVkhWokLGyZyC3kaFrlSLSgr9bRZsVDtoFCtQDN1LXAIRQDfVm
         BMa9gkGEzyKCyc5XW76I6QMoWgmhQ9MihTeBQxVouvfutMH5yZtCWpNK6Cp9SJqdqmYt
         iK6kL/UEyrBqhsE8LmWXJz1lUANPz8lutjYaFlnhKwe7/gjo53BhtMI767YeqC2qH6K/
         l6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763564670; x=1764169470;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ+wPKZ5wbbEqM0E6GKph1xRS7ddtp2l6WjQhWQmUPM=;
        b=bzq/kHDcs31HdHU+4lg9O9T7OTkP20nEVq2d7fXcde+IFMEhixgM3kFoEINzaIEme1
         wTEOAIoD59OjCdQnOgVd3hRFI5ux73JXsuilTyspb5tFqxDdDpL9AhA6qJSNNTl7I2zo
         g8AxWZTeY9dMOlT+j55bSNqmFBV3nWiHYeslPLijBvgmwV4ry3uiV8BNsNEAotjHgo7v
         IfCfL9C7KBk3druihpUz3PexdzXOuFi2vcfXF4E2h2/y3+1fb4fKVEBlY6z/o96Spl9a
         /ACLi/1Q4JSUHR3udiLmSNKlBO4wMmDkbHCbitMCOgdT5bW5JGnMmhPRLw29IC/cMb86
         q2/g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7KcjG4ZEmQLHx1ANH96CNQGa5T118N4olwRJuyarXyVi5B/Nd0MBz64z29DV/j7gFe4AUOXRwbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XDwksjyzxh+Dq9AKe45GId7ZuWXo5P1aUrbvZEr1SdJjtgAb
	uLGufFr1b0zY10dmbXYWDNCyP3XpdpgzjlS0R1WAFyWgRH4RXnvPZOsY
X-Gm-Gg: ASbGncv5H4akTvfM3MvyL2GQum4tzeRWT/DSQTc9zcb36jhFRkii7OfnGynfxToahZ8
	beg5UbtZtQ6nCVSSq/7fPo9RtrB//j7OQHDEdg6877nfOyPWpoJW9dzrjSAZzWsNEBez4wgKe07
	jb8Oozied1rrAo2JloB8JSXaFaZ9G/kfFjXPLvcjVTwiF9fPeFFXVgaymPjvLbl68T9VnfeM9lB
	0sXh93eHauZvVcuv/uXIUzZMm6U0Y67Lt0qDgFdwBMKJU5bz+TXgZEeyUUZekDiKvXNc8TrnuDG
	A+1TSQb3/73DT8R8xTY0MZ4ZTW+Tu+/UHUVlZkbFWW5g1dTTfdC5xY/Kd2rGc6BxgcB3Zy0eSAP
	yvz9hPSrpbco/AlPOd66r6KzSciNemhwcckDOUMcyjDP4ieK12AdrDGfuF5UKjJ1ikpEzmjo/tz
	2suNHG0bwnP1rMhf4376GwdQ==
X-Google-Smtp-Source: AGHT+IFpcIzrmWKVVTz+MWFSEtwWN1zDQI3jZ3sCRHa39duVmKBrF7yzNbx5EJESgwZKIv/zVeRTBQ==
X-Received: by 2002:a05:600c:3593:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-4778fe4fdecmr210014455e9.18.1763564669506;
        Wed, 19 Nov 2025 07:04:29 -0800 (PST)
Received: from [10.5.0.2] ([91.250.240.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106b03bsm54199145e9.9.2025.11.19.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:04:28 -0800 (PST)
Message-ID: <5758dedd1a0d97ddc522448502ae07b0ede4ea67.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: Add driver for wsen tids
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Thomas Marangoni <Thomas.Marangoni@becom-group.com>, 
	linux-hwmon@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux@roeck-us.net, 	corbet@lwn.net, Jonathan.Cameron@huawei.com,
 michal.simek@amd.com, 	nuno.sa@analog.com, Frank.Li@nxp.com,
 wenswang@yeah.net, apokusinski01@gmail.com, 	dixitparmar19@gmail.com,
 vassilisamir@gmail.com, paweldembicki@gmail.com, 	heiko@sntech.de,
 neil.armstrong@linaro.org, kever.yang@rock-chips.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, mani@kernel.org, dev@kael-k.io, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Wed, 19 Nov 2025 15:05:06 +0000
In-Reply-To: <20251119125145.2402620-4-Thomas.Marangoni@becom-group.com>
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
	 <20251119125145.2402620-4-Thomas.Marangoni@becom-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Thomas,

I'm a bit surprised why you have me on Cc. Since I'm here, let me give some=
 inputs...

On Wed, 2025-11-19 at 13:51 +0100, Thomas Marangoni wrote:
> Add support for the wsen tids. It is a low cost
> and small-form-factor i2c temperature sensor.
>=20
> It supports the following features:
> - Continuous temperature reading in four intervals: 5 ms, 10 ms,
> =C2=A0 20 ms and 40 ms.
> - Low temperature alarm
> - High temperature alarm
>=20
> The driver supports following hwmon features:
> - hwmon_temp_input
> - hwmon_temp_min_alarm
> - hwmon_temp_max_alarm
> - hwmon_temp_min
> - hwmon_temp_max
> - hwmon_chip_update_interval
>=20
> Additional notes:
> - The update interval only supports four fixed values.
> - The alarm is reset on reading.
>=20
> Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
> ---
> =C2=A0drivers/hwmon/Kconfig=C2=A0 |=C2=A0 10 +
> =C2=A0drivers/hwmon/Makefile |=C2=A0=C2=A0 1 +
> =C2=A0drivers/hwmon/tids.c=C2=A0=C2=A0 | 447 ++++++++++++++++++++++++++++=
+++++++++++++
> =C2=A03 files changed, 458 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/tids.c
>=20
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..2737350bb661 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2368,6 +2368,16 @@ config SENSORS_THMC50
> =C2=A0	=C2=A0 This driver can also be built as a module. If so, the modul=
e
> =C2=A0	=C2=A0 will be called thmc50.
> =C2=A0
> +config SENSORS_TIDS
> +	tristate "TIDS"
> +	depends on I2C
> +	help
> +	=C2=A0 If you say yes here you get support for the temperature
> +	=C2=A0 sensor WSEN TIDS from W=C3=BCrth Elektronik.
> +
> +	=C2=A0 This driver can also be built as a module. If so, the module
> +	=C2=A0 will be called tids.
> +
> =C2=A0config SENSORS_TMP102
> =C2=A0	tristate "Texas Instruments TMP102"
> =C2=A0	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index eade8e3b1bde..4eb77be3df67 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -227,6 +227,7 @@ obj-$(CONFIG_SENSORS_SY7636A)	+=3D sy7636a-hwmon.o
> =C2=A0obj-$(CONFIG_SENSORS_AMC6821)	+=3D amc6821.o
> =C2=A0obj-$(CONFIG_SENSORS_TC74)	+=3D tc74.o
> =C2=A0obj-$(CONFIG_SENSORS_THMC50)	+=3D thmc50.o
> +obj-$(CONFIG_SENSORS_TIDS)		+=3D tids.o
> =C2=A0obj-$(CONFIG_SENSORS_TMP102)	+=3D tmp102.o
> =C2=A0obj-$(CONFIG_SENSORS_TMP103)	+=3D tmp103.o
> =C2=A0obj-$(CONFIG_SENSORS_TMP108)	+=3D tmp108.o
> diff --git a/drivers/hwmon/tids.c b/drivers/hwmon/tids.c
> new file mode 100644
> index 000000000000..62e778202a5f
> --- /dev/null
> +++ b/drivers/hwmon/tids.c
> @@ -0,0 +1,447 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (c) BECOM Electronics GmbH
> + *
> + * wsen_tids.c - Linux hwmon driver for WSEN-TIDS Temperature sensor
> + *
> + * Author: Thomas Marangoni <thomas.marangoni@becom-group.com>
> + */
> +
> +#include <linux/util_macros.h>
> +#include <linux/regmap.h>
> +#include <linux/minmax.h>
> +#include <linux/hwmon.h>
> +#include <linux/bits.h>
> +#include <linux/math.h>
> +#include <linux/i2c.h>
> +
> +/*
> + * TIDS registers
> + */
> +#define TIDS_REG_DEVICE_ID	0x01
> +#define TIDS_REG_T_H_LIMIT	0x02
> +#define TIDS_REG_T_L_LIMIT	0x03
> +#define TIDS_REG_CTRL		0x04
> +#define TIDS_REG_STATUS		0x05
> +#define TIDS_REG_DATA_T_L	0x06
> +#define TIDS_REG_DATA_T_H	0x07
> +#define TIDS_REG_SOFT_REST	0x0C
> +
> +#define TIDS_CTRL_ONE_SHOT_MASK		BIT(0)
> +#define TIDS_CTRL_FREERUN_MASK		BIT(2)
> +#define TIDS_CTRL_IF_ADD_INC_MASK	BIT(3)
> +#define TIDS_CTRL_AVG_MASK		GENMASK(5, 4)
> +#define TIDS_CTRL_AVG_SHIFT		4
> +#define TIDS_CTRL_BDU_MASK		BIT(6)
> +
> +#define TIDS_STATUS_BUSY_MASK		BIT(0)
> +#define TIDS_STATUS_OVER_THL_MASK	BIT(1)
> +#define TIDS_STATUS_UNDER_TLL_MASK	BIT(2)
> +
> +#define TIDS_SOFT_REST_MASK		BIT(1)
> +
> +/*
> + * TIDS device IDs
> + */
> +#define TIDS_ID 0xa0
> +
> +struct tids_data {
> +	struct i2c_client *client;
> +
> +	struct regmap *regmap;
> +
> +	int irq;
> +	int temperature;
> +};
> +
> +static u8 update_intervals[] =3D { 40, 20, 10, 5 };

static const?

> +
> +static ssize_t tids_interval_read(struct device *dev, long *val)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +	unsigned int avg_value =3D 0;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, TIDS_REG_CTRL, &avg_value);
> +	if (ret < 0)
> +		return ret;
> +
> +	avg_value =3D (avg_value & TIDS_CTRL_AVG_MASK) >> TIDS_CTRL_AVG_SHIFT;
> +
> +	*val =3D update_intervals[avg_value];
> +
> +	return 0;
> +}
> +
> +static ssize_t tids_interval_write(struct device *dev, long val)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +	unsigned int avg_value;
> +
> +	avg_value =3D find_closest_descending(val, update_intervals,
> +					=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(update_intervals));
> +
> +	return regmap_write_bits(data->regmap, TIDS_REG_CTRL,
> +				 TIDS_CTRL_AVG_MASK,
> +				 avg_value << TIDS_CTRL_AVG_SHIFT);
> +}
> +
> +static int tids_temperature1_read(struct device *dev, long *val)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +	u8 buf[2] =3D { 0 };

Seems like __le16?
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(data->regmap, TIDS_REG_DATA_T_L, buf, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* temperature in =C2=B0mC */
> +	*val =3D (((s16)(buf[1] << 8) | buf[0])) * 10;

Then __le16_to_cpu()?

> +
> +	return 0;
> +}
> +
> +static ssize_t tids_temperature_alarm_read(struct device *dev, u32 attr,
> +					=C2=A0=C2=A0 long *val)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (attr =3D=3D hwmon_temp_min_alarm)
> +		ret =3D regmap_test_bits(data->regmap, TIDS_REG_STATUS,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TIDS_STATUS_UNDER_TLL_MASK);
> +	else if (attr =3D=3D hwmon_temp_max_alarm)
> +		ret =3D regmap_test_bits(data->regmap, TIDS_REG_STATUS,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TIDS_STATUS_OVER_THL_MASK);

Instead of passing attr and have this if() else why not passing the proper =
mask? Then
just regmap_read(regmag, reg, ...)?

> +	else
> +		return -EOPNOTSUPP;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D ret;
> +
> +	return 0;
> +}
> +
> +static int tids_temperature_minmax_read(struct device *dev, u32 attr, lo=
ng *val)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +	unsigned int reg_data =3D 0;
> +	int ret;
> +
> +	if (attr =3D=3D hwmon_temp_min)
> +		ret =3D regmap_read(data->regmap, TIDS_REG_T_L_LIMIT, &reg_data);
> +	else if (attr =3D=3D hwmon_temp_max)
> +		ret =3D regmap_read(data->regmap, TIDS_REG_T_H_LIMIT, &reg_data);
> +	else
> +		return -EOPNOTSUPP;

Same as above but with the proper register

> +
> +	if (ret < 0)
> +		return ret;
> +
> +	/* temperature from register conversion in =C2=B0mC */
> +	*val =3D (((u8)reg_data - 63) * 640);

Why the cast?

> +
> +	return 0;
> +}
> +
> +static ssize_t tids_temperature_minmax_write(struct device *dev, u32 att=
r,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 long val)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +	u8 reg_data;
> +
> +	/* temperature in =C2=B0mC */
> +	val =3D clamp_val(val, -39680, 122880);
> +	/* temperature to register conversion in =C2=B0mC */
> +	reg_data =3D (u8)(DIV_ROUND_CLOSEST(val, 640) + 63);
> +
> +	if (attr =3D=3D hwmon_temp_min)
> +		return regmap_write(data->regmap, TIDS_REG_T_L_LIMIT, reg_data);
> +	else if (attr =3D=3D hwmon_temp_max)
> +		return regmap_write(data->regmap, TIDS_REG_T_H_LIMIT, reg_data);
> +	else
> +		return -EOPNOTSUPP;

Redundant else if () and else

...

>=20
> +
> +static int tids_init(struct tids_data *data)
> +{
> +	int ret;
> +
> +	/* Triggering soft reset */
> +	ret =3D regmap_write_bits(data->regmap, TIDS_REG_SOFT_REST,
> +				TIDS_SOFT_REST_MASK, TIDS_SOFT_REST_MASK);
> +	if (ret < 0)
> +		return ret;
> +

No need for sleep some time? Typically that's defined on the datasheet.

> +	ret =3D regmap_clear_bits(data->regmap, TIDS_REG_SOFT_REST,
> +				TIDS_SOFT_REST_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Allowing bulk read */
> +	ret =3D regmap_write_bits(data->regmap, TIDS_REG_CTRL,
> +				TIDS_CTRL_IF_ADD_INC_MASK,
> +				TIDS_CTRL_IF_ADD_INC_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set meassurement interval */
> +	ret =3D regmap_clear_bits(data->regmap, TIDS_REG_CTRL,
> +				TIDS_CTRL_AVG_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set device to free run mode */
> +	ret =3D regmap_write_bits(data->regmap, TIDS_REG_CTRL,
> +				TIDS_CTRL_FREERUN_MASK, TIDS_CTRL_FREERUN_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Don't update temperature register until high and low value are read =
*/
> +	ret =3D regmap_write_bits(data->regmap, TIDS_REG_CTRL, TIDS_CTRL_BDU_MA=
SK,
> +				TIDS_CTRL_BDU_MASK);

return regmap_write_bits();

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int tids_probe(struct i2c_client *client)
> +{
> +	struct device *device =3D &client->dev;
> +	struct device *hwmon_dev;
> +	struct tids_data *data;
> +	unsigned int value;
> +	int ret;
> +
> +	data =3D devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client =3D client;
> +
> +	/* Init regmap */

The comment does not add any added value.

> +	data->regmap =3D devm_regmap_init_i2c(data->client, &regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(device, PTR_ERR(data->regmap),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap initialization failed\n");
> +
> +	/* Read device id, to check if i2c is working */

Same

> +	ret =3D regmap_read(data->regmap, TIDS_REG_DEVICE_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value !=3D TIDS_ID)
> +		return -ENODEV;
> +
> +	tids_init(data);

Check for the return value.

> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(device, "tids", data=
,
> +							 &tids_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static int tids_suspend(struct device *dev)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +
> +	return regmap_clear_bits(data->regmap, TIDS_REG_CTRL,
> +				 TIDS_CTRL_FREERUN_MASK);
> +}
> +
> +static int tids_resume(struct device *dev)
> +{
> +	struct tids_data *data =3D dev_get_drvdata(dev);
> +
> +	return regmap_write_bits(data->regmap, TIDS_REG_CTRL,
> +				 TIDS_CTRL_FREERUN_MASK,
> +				 TIDS_CTRL_FREERUN_MASK);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(tids_dev_pm_ops, tids_resume, tids_suspe=
nd);
> +
> +static const struct i2c_device_id tids_id[] =3D {
> +	{ "tids", 0 },

No need for 0

> +	{},

The above is already a terminator so you can drop the comma

- Nuno S=C3=A1

