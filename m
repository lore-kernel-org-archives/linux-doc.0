Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7E40682C
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427179; cv=none; b=Jh2S+ruKEqP+3WE72lsFbaas3DV7RFVODqevyeriT4sggnBZAofP+noDATt9/FFjg3ctAmowuHfV7Kh/lxXO1XhU9TFnw9aXsvZvzhVUD/bjjpCkOXLicxR69HDl8uXtlStRK7d8fEqrhTyQIlO/F0pqVyucACbmrScHVYspa/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427179; c=relaxed/simple;
	bh=wOWl85XNfyyAiNHyYGNyYvPa6uOndgi090HkKRbqgzc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAvNjBLMftnD5Gzaa7topohxHyu/5p0p+o4i2wp8pGKAD99IHHPDYoWPce9kVx018cVLHFpXQLHmNe2hQOMYGUGPKYaRuAPVp9fuQklE32rpK7IK4aNDZler0bO3FKQwTAaLWMlUI1MCKfGrAZsTIhCdn3f/U1oY2djrFUvVKVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5gscQU4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5gscQU4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc80b585bfso20118705ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783427177; x=1784031977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0nHXbxtabQuV8Otb/IZQlaOiQs2taizWzEfRHotKPI=;
        b=S5gscQU4IHkhDjJj7wIKWdYWqqQDTRPRNDxkBE6vwUBEPMyjDmxsX5L+qIPVm+qAfY
         TxOPwHsTz7Z6dsMuP7CrlUIKuCfRoG82hvAlWCNtC4WntU2nyST8d5LlPbzjKuERp+eB
         jTJBfWs01y7njCeT2hwYLADeJ0tEvowp38O9EIPCoCpj/6h6husEEsUFdaN/Gm/Ez7Vr
         QBMncyKz0kT9Ae/R3QtQJKvHT6jw0AkQ7ZmNwmn4pcaxTx0rLiwE59khoeBByRSaMLFO
         i28wALwW5OHgYW8MCiM8z6z4iir36MNKTbMxkV+1VPmZf5olXWj2UBrazcGBEzC7keko
         MQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427177; x=1784031977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P0nHXbxtabQuV8Otb/IZQlaOiQs2taizWzEfRHotKPI=;
        b=Pi2BkQY9GCeSxMP0NUacn5GVq6zai4eW0FMxbs7qFv4uFIa5KHaQrimecSh7rVSD1v
         ZOx90/R9klf+WSq8mAJsNGWNCQYiSWaQ4578oCYLXrQGBaYShnAp8VRb4P6NBYHeD/12
         BnuMus0thnrhWHtIAfxp9QnSEELHmsv5mXvwHQ8HuhD4gDdmguFTreoMLYBZhuVwRZTL
         VUMMPyuZRvMN9dbfgwj+MBjAWmmOmQdvdT+oJy/dNz7Xx6g+HVmOP9jdgEFcik9G6OZ4
         PZo5KcexyogsBk/SRqLnEFy2hBp+B/hEB0JhxE0fMfowIKATnK4mORoBrxtrag6XnvjQ
         wlKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9Ews4FNL4o4jIcucko3FwP68MGoCBNm+r9xVeAbYjyIl4B0Bn5YBFR0jZXuj0OrP1GjY0NJKWP6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0B/UqK3Dx7cv9plFz8dGdk2trGPL4IkaeVONv9OTdyI0HQLH
	gA1SlH5CfH1CSIOZQJy5zYMt5tgdp4v3rDECRkUhs7wlkS1x01CGPf/t
X-Gm-Gg: AfdE7clv8EexJTx/hkVZYrwC8vc+VioSNmjwug6Avr/+HZdxyps2jwb9ZGhuBJ0VTcl
	h99B6nEIilRIqdLygH+vQElxDc53IOKVxeirMn2J8tqjMhISYIyaNRxXaHN4Vyv1/Jxp56Wk68x
	iyEUm/K2eNmES2xqxooze0BJZGxQ0EVNKVO0AEPkeaiBugV4r0Go2c/22GaoWZtwtSmfnzBh+T0
	jrt9v4Xj/RY0b4O7mLOqKUa2rhvbxIgjI5m+yr1X6g5amVGlJObMgQlNuRd3Car0fWIveTq2O4d
	FsjXw+jqYUtYO61eMF3fzdZJGwBAVJVyjlPUR0GbBiAqINwKuvhwGj/TG0VUuQGW3CKgXR0orYq
	zk4VArjL0UwMOAsH4OyvU3T2jBUNffvnA4NzLhCKRo6iVUvZynfBhnvovoLQOhUniF5zltiGMzp
	BS6NEIB4le6N6ed852c3yiiTmHPcJCcnx039kvb5ek5MbGckO05c4PQQkqrUs13lYgiZ418OHLO
	w==
X-Received: by 2002:a17:902:f645:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2ccbe3fcc82mr51027675ad.5.1783427176596;
        Tue, 07 Jul 2026 05:26:16 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm11078765ad.37.2026.07.07.05.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:26:16 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Frank Li <Frank.Li@nxp.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Syed Arif <arif.syed@hpe.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Colin Huang <u8813345@gmail.com>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912 and MAX20916
Date: Tue,  7 Jul 2026 20:26:38 +0800
Message-ID: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Analog Devices MAX20912 and MAX20916 dual-output
multiphase voltage regulators with PMBus interfaces.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/max20912.rst | 156 +++++++++++++++++++++++++++++++
 MAINTAINERS                      |   7 ++
 drivers/hwmon/pmbus/Kconfig      |   9 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/max20912.c   |  70 ++++++++++++++
 6 files changed, 244 insertions(+)
 create mode 100644 Documentation/hwmon/max20912.rst
 create mode 100644 drivers/hwmon/pmbus/max20912.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 29130df44d12..4fadb7e961b2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -166,6 +166,7 @@ Hardware Monitoring Kernel Drivers
    max20751
    max20830
    max20860a
+   max20912
    max31722
    max31730
    max31760
diff --git a/Documentation/hwmon/max20912.rst b/Documentation/hwmon/max20912.rst
new file mode 100644
index 000000000000..da1430751e93
--- /dev/null
+++ b/Documentation/hwmon/max20912.rst
@@ -0,0 +1,156 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver max20912
+======================
+
+Supported chips:
+
+  * Analog Devices MAX20912
+
+    Prefix: 'max20912'
+
+    Datasheet: Not publicly available
+
+  * Analog Devices MAX20916
+
+    Prefix: 'max20916'
+
+    Datasheet: Not publicly available
+
+Author:
+
+	Fred Chen <fredchen.openbmc@gmail.com>
+
+Description
+-----------
+
+This driver implements support for the Analog Devices MAX20912 and MAX20916
+high-density, flexible, and scalable dual-output multiphase voltage regulators.
+
+The MAX20912 supports up to 12 phases in total, configurable from 12+0 to
+6+6 phases between Rail A and Rail B.
+
+The MAX20916 supports up to 16 phases in total, configurable from 16+0 to
+8+8 phases between Rail A and Rail B.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Both devices expose two independently regulated output voltage rails,
+Rail A and Rail B, using the VR12 VID interface. Each rail reports input
+current, output current, temperature, input power, and output power.
+Input voltage is reported on Rail A only.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_alarm**
+
+**in3_input**
+
+**in3_label**
+
+**in3_alarm**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+**curr2_input**
+
+**curr2_label**
+
+**curr2_max**
+
+**curr2_max_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr3_input**
+
+**curr3_label**
+
+**curr3_max**
+
+**curr3_max_alarm**
+
+**curr3_crit**
+
+**curr3_crit_alarm**
+
+**curr4_input**
+
+**curr4_label**
+
+**curr4_max**
+
+**curr4_max_alarm**
+
+**curr4_crit**
+
+**curr4_crit_alarm**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp2_input**
+
+**temp2_max**
+
+**temp2_max_alarm**
+
+**temp2_crit**
+
+**temp2_crit_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_alarm**
+
+**power2_input**
+
+**power2_label**
+
+**power2_alarm**
+
+The driver provides the following attributes for output power:
+
+**power3_input**
+
+**power3_label**
+
+**power4_input**
+
+**power4_label**
diff --git a/MAINTAINERS b/MAINTAINERS
index 4a8b0fd665ce..a301af7ff6fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15851,6 +15851,13 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
 F:	Documentation/hwmon/max20860a.rst
 F:	drivers/hwmon/pmbus/max20860a.c
 
+MAX20912 HARDWARE MONITOR DRIVER
+M:	Fred Chen <fredchen.openbmc@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/max20912.rst
+F:	drivers/hwmon/pmbus/max20912.c
+
 MAX2175 SDR TUNER DRIVER
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index c8cda160b5f8..442c3538bf7c 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -421,6 +421,15 @@ config SENSORS_MAX20860A_REGULATOR
 	  This enables the MAX20860A to be used as a regulator device,
 	  providing voltage control through the regulator framework.
 
+config SENSORS_MAX20912
+	tristate "Analog Devices MAX20912 and MAX20916"
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices MAX20912 and MAX20916 dual-output voltage regulators.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called max20912.
+
 config SENSORS_MAX31785
 	tristate "Maxim MAX31785 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index ffc05f493213..2fa74f0caf18 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
 obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX20830)	+= max20830.o
 obj-$(CONFIG_SENSORS_MAX20860A)	+= max20860a.o
+obj-$(CONFIG_SENSORS_MAX20912)	+= max20912.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
diff --git a/drivers/hwmon/pmbus/max20912.c b/drivers/hwmon/pmbus/max20912.c
new file mode 100644
index 000000000000..3d028a619678
--- /dev/null
+++ b/drivers/hwmon/pmbus/max20912.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Analog Devices MAX20912 and MAX20916
+ * Dual-Output Voltage Regulator
+ *
+ * Copyright (c) 2026 Quanta Computer Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info max20912_info = {
+	.pages = 2,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = vid,
+	.vrm_version[0] = vr12,
+	.vrm_version[1] = vr12,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_POUT,
+	.func[1] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_POUT,
+};
+
+static int max20912_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &max20912_info);
+}
+
+static const struct of_device_id max20912_of_match[] = {
+	{ .compatible = "adi,max20912" },
+	{ .compatible = "adi,max20916" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, max20912_of_match);
+
+static const struct i2c_device_id max20912_id[] = {
+	{"max20912"},
+	{"max20916"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, max20912_id);
+
+static struct i2c_driver max20912_driver = {
+	.driver = {
+		.name = "max20912",
+		.of_match_table = max20912_of_match,
+	},
+	.probe = max20912_probe,
+	.id_table = max20912_id,
+};
+
+module_i2c_driver(max20912_driver);
+
+MODULE_AUTHOR("Fred Chen <fredchen.openbmc@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20912 and MAX20916");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.52.0

