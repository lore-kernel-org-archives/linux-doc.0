Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21468334681
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715443; cv=none; b=NoY3xJnz3qPG/JJbnM2ErQ7VSEZFIrL9rZbMa2bgEZTLL1V5GKzPYMOjWV1bwxY+3syOdKPYSTIyMo82u/6zdMhv0zgIKQcU5pALEF3HM2IcETL1/QVCcJOUrmDE0u+8A1Stg6/1R7sUi2TiINCwc5gbx6TIh2qjt2ehMWmjk+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715443; c=relaxed/simple;
	bh=sfTXdIgusCv835rgmExNC2fi0DAQNO7kS2NnPvpm2Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZkNZHSt0x49lw35Mpem2y/OD3OFdyvGX9c4EzzNghwvXjuksPIIisJw+AEvEfM505jMYg/Cr7TteLKV1dh5K+bp1WbuaJ/KNcKz0XRVQG6sLsilD4gY2tzPhDA96pzBtwYY6eVpT9W19nCvycRFmEfFBYOMUrkZTzhXul+vjhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLJoUWSs; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLJoUWSs"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so1830171a12.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715439; x=1768320239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUHjIDbkNzTZTLFz7CEqg9gXQzUHt8y3SwqX49Bzobk=;
        b=mLJoUWSsqd6/W+GcGbbOu7roN+TGBRHOi43+z9wUJ1JvH4PR2Q+pLyBEApRKTFn3wE
         lXruGsXtXmoKVknAPuScGvK1KLz0jeFo6jzby10dBKwqwnVS04jpXShZ9hECuxbTyWyc
         VRYBesu00kx0lysSOMvp2r9p7Lc920VlX180A+43DevWkGGosmwisLloRD7g3WxDfeiL
         SXAvjbe4jHdEn/KjhlpcHWCuOnuUUxoJj4raI9rm04qHZ6Y6DTQIuOydl53VFHUXQC06
         +KO/zOQ200jsa+6dYw7Rf2u1B3oFkPhoDlOfQclNH0rTfBqqeRxYgKwo/7E4yYF/m9P3
         I/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715439; x=1768320239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XUHjIDbkNzTZTLFz7CEqg9gXQzUHt8y3SwqX49Bzobk=;
        b=SnmWtCokATUvfHgaSYetLzV76GuBpuRTPsEJluMOnxA9cZOEwO/ivuVC8kcgKjxQgX
         u7AM1kukFpwTpfcqBuGD01IEAZAp69UJs6Yv0h34Qtg4CgTyO3zFPMiEKycgafOXIDom
         VtwCQTeTwsD24UkF8PebqZmRAwGt1baeSxfo4AuY9ZgdVzvFGVV9x9+20IaIj15H3PNw
         wZvdDiee9qH0U4rGG0eT4LHlvS/8yfbtQFJKPafN7Prnen6qpOm/BOMlnj2xPfM5GX4k
         LCKt43ERVmQIdtl1qe0HPphpEy8vp2L2xkMU4lF9j+KteCpg+Zx+Mfe6SeUN0+UfP3lq
         BZRA==
X-Forwarded-Encrypted: i=1; AJvYcCWQylQ94PbQElpXbTH5t1mCzshRooTYGww2cFKFJ5klgbOuZ6oDcZBjnZ+od2zNdQ6/r29CsKcG4ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPN8Mbr4LTtVqpQrE4GXuH8qsjT9YJ7Th9oy189QLRDTKYy4QF
	WH7Q/upuXfwBaRyy0FLyBDQ21Gzwt80wEMJ5b0SlY7CB65NiPjl0vA7d
X-Gm-Gg: AY/fxX6NEUK6sOg8uZF9bm5BquQlEA1Y9FJdJSygrRHXgJ2csbsidjqGxmqrmu+OhgB
	bWnDE/vDf0UnHTE24Qy7NyHF/9h9cf/pQsFlS4W9eTSyzGq7ZEov7vkINxMr11c7B2KvubZEcIR
	s2ydEQgjElzRjeq+oOU0mAA2nnLLy+EttQfEqQgxstIrlIpq/F+f6QpB6ak7qpG9y9PIwKviNdf
	11nDqW74E6IsCXS/sDo8XPlDKTr0wPu+BhyoRKTZ/hqELdawuefu6ibmVQ/BDNxScKo1jq34Cmr
	ORk7fMshzLa6bX510tMFaLJneSIiF9CD2vnQqX3Qc/YlW6Q4wUvvP4/N/HO+p4gIVYA6vT4fZL3
	kAkU9lUI/lzx2p8bgMe9hDBVccBFWfDUKoeNLihfLSNN6Nfbblx8+ET2W4ZLjFU3x8mgGxPv0B6
	gS7Id2hLVsFVjkMgQ8bgbqd3A=
X-Google-Smtp-Source: AGHT+IFtUB+Huqd/+RNj0Sg15SrL63cW/rNoqfEijDyjjDi1vClfHTD2UnPl3RO3NGX5v+4hlw8+0Q==
X-Received: by 2002:a05:6402:274e:b0:64b:8d7a:71cf with SMTP id 4fb4d7f45d1cf-65079675846mr3023366a12.26.1767715439152;
        Tue, 06 Jan 2026 08:03:59 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:80f9:d6dd:93b5:e2ef])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65ca0sm2474912a12.24.2026.01.06.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:03:58 -0800 (PST)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: [PATCH v1 2/2] hwmon: Add support for HiTRON HAC300S PSU
Date: Tue,  6 Jan 2026 17:03:53 +0100
Message-ID: <20260106160353.14023-3-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106160353.14023-1-vassilisamir@gmail.com>
References: <20260106160353.14023-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Add Support for HiTRON HAC300S PSU. This is a AC/DC hot-swappable
CompactPCI Serial Dual output active current sharing switching power
supply with a 312W rating.

Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
---
 Documentation/hwmon/hac300s.rst |  37 ++++++++
 MAINTAINERS                     |   7 ++
 drivers/hwmon/pmbus/Kconfig     |   9 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/hac300s.c   | 152 ++++++++++++++++++++++++++++++++
 5 files changed, 206 insertions(+)
 create mode 100644 Documentation/hwmon/hac300s.rst
 create mode 100644 drivers/hwmon/pmbus/hac300s.c

diff --git a/Documentation/hwmon/hac300s.rst b/Documentation/hwmon/hac300s.rst
new file mode 100644
index 000000000000..573269fc81f8
--- /dev/null
+++ b/Documentation/hwmon/hac300s.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver hac300s
+=====================
+
+Supported chips:
+
+   * HiTRON HAC300S
+
+     Prefix: 'hac300s'
+
+     Datasheet: Publicly available at HiTRON website.
+
+Author:
+
+  - Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
+
+Description
+-----------
+
+This driver implements support for the HiTRON HAC300S PSU. It is a Universal
+AC input harmonic correction AC-DC hot-swappable CompactPCI Serial Dual output
+(with 5V standby) 312 Watts active current sharing switching power supply.
+
+The device has an input of 90-264VAC and 2 nominal output voltaged at 12V and
+5V which they can supplu up to 25A and 2.5A respectively.
+
+Sysfs entries
+-------------
+
+======= ==========================================
+curr1   Output current
+in1     Output voltage
+power1  Output power
+temp1   Ambient temperature inside the module
+temp2   Internal secondary component's temperature
+======= ==========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648..feb8ec4d9b17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11254,6 +11254,13 @@ F:	kernel/time/timer_list.c
 F:	kernel/time/timer_migration.*
 F:	tools/testing/selftests/timers/
 
+HITRON HAC300S PSU DRIVER
+M:	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/hac300s.rst
+F:	drivers/hwmon/pmbus/hac300s.c
+
 DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
 M:	Andreas Hindborg <a.hindborg@kernel.org>
 R:	Boqun Feng <boqun.feng@gmail.com>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..4c2cb51dbe3f 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -124,6 +124,15 @@ config SENSORS_FSP_3Y
 	  This driver can also be built as a module. If so, the module will
 	  be called fsp-3y.
 
+config SENSORS_HAC300S
+	tristate "Hitron HAC300S-D120E PSU"
+	help
+	  If you say yes here you get hardware monitoring support for the
+	  Hitron HAC300S-D120E Power Supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called hac300s.
+
 config SENSORS_IBM_CFFPS
 	tristate "IBM Common Form Factor Power Supply"
 	depends on LEDS_CLASS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..b92309019d35 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
+obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
 obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
diff --git a/drivers/hwmon/pmbus/hac300s.c b/drivers/hwmon/pmbus/hac300s.c
new file mode 100644
index 000000000000..a1640449e5f5
--- /dev/null
+++ b/drivers/hwmon/pmbus/hac300s.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: 2024 CERN (home.cern)
+/*
+ * Hardware monitoring driver for Hi-Tron HAC300S PSU.
+ *
+ * NOTE: The HAC300S device does not support the PMBUS_VOUT_MODE register.
+ * On top of that, it returns the Voltage output values in Linear11 which is
+ * not adhering to the PMBus specifications. (PMBus Specification Part II,
+ * Section 7.1-7.3). For that reason the PMBUS_VOUT_MODE register is being faked
+ * and returns the exponent value of the READ_VOUT register. The exponent part
+ * of the VOUT_* registers is being cleared in order to return the mantissa to
+ * the pmbus core.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+#define LINEAR11_EXPONENT_MASK GENMASK(15, 11)
+#define LINEAR11_MANTISSA_MASK GENMASK(10, 0)
+
+#define to_hac300s_data(x) container_of(x, struct hac300s_data, info)
+
+struct hac300s_data {
+	struct pmbus_driver_info info;
+	bool vout_linear11;
+	s8 exponent;
+};
+
+static int hac300s_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct hac300s_data *data = to_hac300s_data(info);
+
+	if (reg == PMBUS_VOUT_MODE && data->vout_linear11)
+		return data->exponent;
+
+	return pmbus_read_byte_data(client, page, reg);
+}
+
+static int hac300s_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct hac300s_data *data = to_hac300s_data(info);
+	int rv;
+
+	rv = pmbus_read_word_data(client, page, phase, reg);
+	if (rv < 0)
+		return rv;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_IOUT_AVG:
+	case PMBUS_VIRT_READ_POUT_AVG:
+	case PMBUS_VIRT_READ_TEMP_AVG:
+		return -ENXIO;
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_READ_VOUT:
+		if (data->vout_linear11)
+			return FIELD_GET(LINEAR11_MANTISSA_MASK, rv);
+		fallthrough;
+	default:
+		return rv;
+	}
+}
+
+#define HAC300S_SW_FUNC (PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | \
+			 PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
+			 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
+			 PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_TEMP)
+
+static struct pmbus_driver_info hac300s_info = {
+	.pages = 1,
+	.func[0] = HAC300S_SW_FUNC,
+	.read_byte_data = hac300s_read_byte_data,
+	.read_word_data = hac300s_read_word_data,
+	.format[PSC_VOLTAGE_OUT] = linear,
+};
+
+static struct pmbus_platform_data hac300s_pdata = {
+	.flags = PMBUS_NO_CAPABILITY,
+};
+
+static int hac300s_probe(struct i2c_client *client)
+{
+	struct hac300s_data *data;
+	int rv;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct hac300s_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
+				     I2C_FUNC_SMBUS_READ_WORD_DATA))
+		return -ENODEV;
+
+	rv = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
+	if (rv < 0) {
+		data->vout_linear11 = true;
+		/* LINEAR11 format, use exponent from READ_VOUT register */
+		rv = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
+		if (rv < 0)
+			return dev_err_probe(&client->dev, rv, "Failed to read vout_mode\n");
+
+		data->exponent = FIELD_GET(LINEAR11_EXPONENT_MASK, rv);
+	}
+
+	data->info = hac300s_info;
+	client->dev.platform_data = &hac300s_pdata;
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct of_device_id hac300s_of_match[] = {
+	{ .compatible = "hitron,hac300s" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, hac300s_of_match);
+
+static const struct i2c_device_id hac300s_id[] = {
+	{"hac300s", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, hac300s_id);
+
+static struct i2c_driver hac300s_driver = {
+	.driver = {
+		   .name = "hac300s",
+		   .of_match_table = hac300s_of_match,
+	},
+	.probe = hac300s_probe,
+	.id_table = hac300s_id,
+
+};
+module_i2c_driver(hac300s_driver);
+
+MODULE_AUTHOR("Vasileios Amoiridis");
+MODULE_DESCRIPTION("PMBus driver for Hi-Tron HAC300S PSU");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.47.3

