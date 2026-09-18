Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D8331EB2
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 17:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752755; cv=none; b=imteTGkjKs1xL7O+nAtQ2oR2Sj7/M09ijswlklUUolitbWV/AA3TICws2odwlRmuvg/MTQidnBGbm5edXpgB/6XqsrIxNmKST0tFCsELdKBWPVYRI+OI13rlF28EYk0LbRjZDNXD02qdSxSfMvdmULu1lBGqXJLWbdsW7h66Q8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752755; c=relaxed/simple;
	bh=pMGpEi39BEyUo6zCUXVX6ESUaX/7PwRrk/NnMo1pLNs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZgGabDPaYhrVxnWQQvo4z7Viao718zlamzoXpoFBXUljOWnZjxcMl434aQpJnVY8vpk5i716O+v3KbX5JDOkz/yiA358MpP1w7zwLDoPimKrtK3JAIQTUBvr5l0HijtZOL5lrLdwMM6VPfDW7vltvC9kTXpTw8doEnNKWlL4A0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=VNnXktVs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="VNnXktVs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so6706515e9.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 10:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789752741; x=1790357541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dvc/pEW/BAh9vZt3yE6d0wx7vktxXFNO+yS8WEG5HPw=;
        b=VNnXktVsLAt3T1Ig0Mc9AiO9oe9bxAvbbIusYEESyFok61YQrsa5bwmH1AmobaSOFo
         lyk3NsL8p4FwB0aAquyTQFa0010XaWHF5/+GnHrEsbLqGF/Z7TszslYoJ/Y8lr1zxUKw
         FzKfChLwCojPe1HzC+iXJI5LfDsouGc5xiQg/u+dZ81keSrrfMt70JWlx9GVQQEA93yo
         efRrHQno5csmwCsIBJ2KthiW4Y+d2l7+UNghADAzbBxx7fvkSLrM2qfzT5wg1mP5f+7C
         /8m4JA5L/YJQhraWj1rpCI0wd2n/eZCCqTL7Pxe++3ybQIRcLy3I2yoOP6pQK5mCvIIL
         k1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752741; x=1790357541;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dvc/pEW/BAh9vZt3yE6d0wx7vktxXFNO+yS8WEG5HPw=;
        b=CZeYKNBHpQrUkLkhKYmhWzwecynwyibe9ssjTGdxEebUMdvwAhys0JobwmH/g4xkQc
         ZfjHNYe8N99JpNwumxBqdZLmjQ96wUNe2YDnFRpuiDxB8XJAHgi9hxftyWg2KgiRFnnX
         7VoNK8eCr6Q+HdIKsTarMBVv1XLpYSDxHl/W2JIQo9+78c2l8rtPVPGjGAo6tyjpL6OH
         5pbdGHeYLs1sHZxEDwnyteZA3P9cnjPk+jvYJkyx+Daccb5JEjFTP4H6vt16z3k681+H
         e+HkmbQT+6g7LG+X5nwet88K/QrhKiSLOtpEd8o5i3YVWE37ERH2ukxOv5voutAyRRkO
         klLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVO5djv8Y6r8lshxdqUnhK1oBBQnBTW98zXoVaaJTx5JNEx3caDKp1sNqOOpv55E4Mf47aWA0B5n4=@vger.kernel.org
X-Gm-Message-State: AFuF++nRNfYzp7bXs8lnCC7uMXwkTPi2mRXsJH25KtsBH853/3ixHEpY
	h+H0j/bwn8Z4e5QDSEu19pmRqr031o74XvxdN52GFv9gzbLJHb6Hz39s+V8eeQ3sSFy7FYj0btK
	JF+g0l+s=
X-Gm-Gg: AYBFou2F4mJalDtnbq8NBG3kuQfzyu0Nz9//sP8qkvWF52QHPBaTynfb2QDGPhSo4vt
	2TwXM6LKHv3XDkJb7EhGqNyNbVO9+XBIVKs3F4pKmZzGZP3j7K3eGIIvsl57szWk0rgyrPBo9Df
	9LoAaaFxO4lCn/vPAwTwtGWu6sHjf9y4VfTCb3fXvIZQXVp3Vm29+SHdaoezhiAbidGsCNshyZc
	LyB/Sv8HeSUgD4VQ9ij9l/NTGnmmqtAE5fAmR5nwu2AoYqdI7Rg1YzlH+CaB1j/Z4x/SlkrXRHo
	ySuWP9yYyk3XlbcmxUzBPu0uq5xHpNp66ArEU1/yqyJGJyptFU4Btvi6ybMZMttwIFRNSnKekdl
	DcZnuhSKO3sUwZutaOsbTNMPb631GHoRgyZNg7TvuWqYMYhFrI4jRK+8SXfGDRgAe/nC3zUgWsC
	mXiFgOc3xsUyR9SZs8CDMUVgZ4VYRVOXPrAaic2U48v0rTdtwrOoK3b/JFCMfaOX4rqmf7hZBQL
	jR5OdCVdxz4qeB7JZs9TcZEXfr82BXzPpS1M30sQgwEPsxZsnI=
X-Received: by 2002:a17:906:9f87:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c2a152e3212mr337280966b.0.1789752251335;
        Fri, 18 Sep 2026 10:24:11 -0700 (PDT)
Received: from ehlo.thunderbird.net (ip-077-020-009-205.vkd66.pools.vodafone-ip.de. [77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm331666b.47.2026.09.18.10.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:24:10 -0700 (PDT)
Date: Fri, 18 Sep 2026 19:24:05 +0200
From: Conor <mail@conchuod.ie>
To: Guenter Roeck <linux@roeck-us.net>, Colin Huang <u8813345@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
CC: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, colin.huang2@amd.com,
 linux-doc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_2/2=5D_hwmon=3A_=28pmbus/tda38740=29?=
 =?US-ASCII?Q?_Add_driver_for_Infineon_TDA38740/TDA38725?=
User-Agent: K-9 Mail for Android
In-Reply-To: <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com> <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com> <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
Message-ID: <2646A11E-8D13-4587-8027-1370E0007F36@conchuod.ie>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 18 September 2026 17:02:38 GMT+02:00, Guenter Roeck <linux@roeck-us=2En=
et> wrote:
>On 9/18/26 03:23, Colin Huang wrote:
>> Add a PMBus driver for Infineon TDA38740 and TDA38725
>> single-voltage synchronous buck regulators=2E
>>=20
>> Signed-off-by: Colin Huang <u8813345@gmail=2Ecom>
>
>For my reference (waiting for DT patch approval):
>
>Reviewed-by: Guenter Roeck <linux@roeck-us=2Enet>

I'm on holiday and only have my phone, and cannot find the binding patch t=
o reply to=2E
I found it on lore and it looks okay=2E

Cheers,
Conor=20

>
>> ---
>>   Documentation/hwmon/index=2Erst    |  1 +
>>   Documentation/hwmon/tda38740=2Erst | 65 +++++++++++++++++++++++++++++=
+++++++++++
>>   drivers/hwmon/pmbus/Kconfig      |  9 ++++++
>>   drivers/hwmon/pmbus/Makefile     |  1 +
>>   drivers/hwmon/pmbus/tda38740=2Ec   | 64 +++++++++++++++++++++++++++++=
++++++++++
>>   5 files changed, 140 insertions(+)
>>=20
>> diff --git a/Documentation/hwmon/index=2Erst b/Documentation/hwmon/inde=
x=2Erst
>> index f07977a20271=2E=2Eaeff87b3d46d 100644
>> --- a/Documentation/hwmon/index=2Erst
>> +++ b/Documentation/hwmon/index=2Erst
>> @@ -265,6 +265,7 @@ Hardware Monitoring Kernel Drivers
>>      sy7636a-hwmon
>>      tc654
>>      tc74
>> +   tda38740
>>      thmc50
>>      tmp102
>>      tmp103
>> diff --git a/Documentation/hwmon/tda38740=2Erst b/Documentation/hwmon/t=
da38740=2Erst
>> new file mode 100644
>> index 000000000000=2E=2E55ce12f14914
>> --- /dev/null
>> +++ b/Documentation/hwmon/tda38740=2Erst
>> @@ -0,0 +1,65 @@
>> +=2E=2E SPDX-License-Identifier: GPL-2=2E0-only
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Kernel driver tda38740
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Supported chips:
>> +  * Infineon TDA38740
>> +  * Infineon TDA38725
>> +
>> +    Prefix: 'tda38740'
>> +
>> +    Addresses scanned: -
>> +
>> +    Datasheet:
>> +      https://www=2Einfineon=2Ecom/row/public/documents/24/49/infineon=
-tda38740-tda38725-datasheet-en=2Epdf
>> +
>> +Author: Colin Huang <u8813345@gmail=2Ecom>
>> +
>> +Description
>> +-----------
>> +
>> +The TDA38740 and TDA38725 are single-output synchronous buck regulator=
s with a
>> +PMBus interface=2E They expose basic voltage, current, power and tempe=
rature
>> +telemetry through the standard PMBus hwmon interfaces=2E
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +curr1_alarm		Input current alarm
>> +curr1_input		Measured input current
>> +curr1_label		"iin"
>> +
>> +curr2_crit		Critical maximum output current
>> +curr2_crit_alarm	Output current critical high alarm
>> +curr2_input		Measured output current
>> +curr2_label		"iout"
>> +
>> +in1_crit		Critical maximum input voltage
>> +in1_crit_alarm		Input voltage critical high alarm
>> +in1_input		Measured input voltage
>> +in1_label		"vin"
>> +
>> +in2_crit		Critical maximum output voltage
>> +in2_crit_alarm		Output voltage critical high alarm
>> +in2_input		Measured output voltage
>> +in2_label		"vout"
>> +in2_lcrit		Critical minimum output voltage
>> +in2_lcrit_alarm		Output voltage critical low alarm
>> +
>> +power1_alarm		Input power alarm
>> +power1_input		Measured input power
>> +power1_label		"pin"
>> +
>> +power2_input		Measured output power
>> +power2_label		"pout"
>> +
>> +temp1_crit		Critical high temperature
>> +temp1_crit_alarm	Chip temperature critical high alarm
>> +temp1_input		Measured temperature
>> +temp1_max		Maximum temperature
>> +temp1_max_alarm		Chip temperature high alarm
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>> index bcfdc4ce4c10=2E=2Ee4ca80dd0574 100644
>> --- a/drivers/hwmon/pmbus/Kconfig
>> +++ b/drivers/hwmon/pmbus/Kconfig
>> @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
>>   	  If you say yes here you get regulator support for Infineon
>>   	  TDA38640 as regulator=2E
>>   +config SENSORS_TDA38740
>> +	tristate "Infineon TDA38725/TDA38740"
>> +	help
>> +	  If you say yes here you get hardware monitoring support for Infineo=
n
>> +	  TDA38725 and TDA38740=2E
>> +
>> +	  This driver can also be built as a module=2E If so, the module will
>> +	  be called tda38740=2E
>> +
>>   config SENSORS_TPS25990
>>   	tristate "TI TPS25990"
>>   	help
>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
>> index e288fe72a437=2E=2Eeb06d47816fd 100644
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)	+=3D stef48h28=2Eo
>>   obj-$(CONFIG_SENSORS_SQ24860)	+=3D sq24860=2Eo
>>   obj-$(CONFIG_SENSORS_STPDDC60)	+=3D stpddc60=2Eo
>>   obj-$(CONFIG_SENSORS_TDA38640)	+=3D tda38640=2Eo
>> +obj-$(CONFIG_SENSORS_TDA38740)	+=3D tda38740=2Eo
>>   obj-$(CONFIG_SENSORS_TPS25990)	+=3D tps25990=2Eo
>>   obj-$(CONFIG_SENSORS_TPS40422)	+=3D tps40422=2Eo
>>   obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679=2Eo
>> diff --git a/drivers/hwmon/pmbus/tda38740=2Ec b/drivers/hwmon/pmbus/tda=
38740=2Ec
>> new file mode 100644
>> index 000000000000=2E=2E067de07ba9fb
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/tda38740=2Ec
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: GPL-2=2E0+
>> +/*
>> + * Hardware monitoring driver for Infineon TDA38725/TDA38740
>> + *
>> + * Copyright (c) 2023 9elements GmbH
>> + *
>> + */
>> +
>> +#include <linux/err=2Eh>
>> +#include <linux/i2c=2Eh>
>> +#include <linux/init=2Eh>
>> +#include <linux/kernel=2Eh>
>> +#include <linux/module=2Eh>
>> +#include "pmbus=2Eh"
>> +
>> +static struct pmbus_driver_info tda38740_info =3D {
>> +	=2Epages =3D 1,
>> +	=2Eformat[PSC_VOLTAGE_IN] =3D linear,
>> +	=2Eformat[PSC_VOLTAGE_OUT] =3D linear,
>> +	=2Eformat[PSC_CURRENT_OUT] =3D linear,
>> +	=2Eformat[PSC_CURRENT_IN] =3D linear,
>> +	=2Eformat[PSC_POWER] =3D linear,
>> +	=2Eformat[PSC_TEMPERATURE] =3D linear,
>> +	=2Efunc[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
>> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
>> +	    | PMBUS_HAVE_IIN
>> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>> +	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
>> +};
>> +
>> +static int tda38740_probe(struct i2c_client *client)
>> +{
>> +	return pmbus_do_probe(client, &tda38740_info);
>> +}
>> +
>> +static const struct i2c_device_id tda38740_id[] =3D {
>> +	{ =2Ename =3D "tda38725"},
>> +	{ =2Ename =3D "tda38740"},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tda38740_id);
>> +
>> +static const struct of_device_id tda38740_of_match[] =3D {
>> +	{ =2Ecompatible =3D "infineon,tda38725"},
>> +	{ =2Ecompatible =3D "infineon,tda38740"},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, tda38740_of_match);
>> +
>> +static struct i2c_driver tda38740_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D "tda38740",
>> +		=2Eof_match_table =3D tda38740_of_match,
>> +	},
>> +	=2Eprobe =3D tda38740_probe,
>> +	=2Eid_table =3D tda38740_id,
>> +};
>> +
>> +module_i2c_driver(tda38740_driver);
>> +
>> +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("PMBUS");
>>=20
>
