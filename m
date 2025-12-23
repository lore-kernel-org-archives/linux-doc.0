Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D9245031
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 01:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454651; cv=none; b=kggIySqlbDj6HmKtOJgvT+vrnFgUJagcOBirw78PJvXoNa16abWbaQix3CoiGhW9ua3hMWFcBjc2Oytw7Fobqamj5uDWhQX96LKU8QqU4XrRAVHQSkTW3BLuXUhc9prS0BwMgmZisLVQUpi2DY1Ucv+AxQrf8zvX9Rn8cFZGgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454651; c=relaxed/simple;
	bh=uEHKD576beH67e61kwrMTdUcMTPFmpKLPmywvkgI+uM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBpucZ9zo/3L6V5yixmqF+v2iWKjQuCtmShmBQcWpqiMRMk5zWlm5FeaFny7+bqUM3ico5pkTqaiDje1t+rnB9cBWK53k0qSTxCT87HXGyGK3fx2tW1+9ApNAXGh+6CF0lhbZFTU28nrZXQBfOg+S+sHvfU6ByttpjP+pdBHNdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgD2NGsv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgD2NGsv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0b4320665so68796175ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 17:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766454649; x=1767059449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqv2lr9oTOPBdkEJPMmfpNrt4ToSFM+1GlrCKAsenpQ=;
        b=lgD2NGsv4LVTQzUdvrrQs6i5BUN2ZkVNEEM3HU9zFmITlmhHTGPnBMDYIEEBy+VKY0
         yM4JZ2R+wDZWroetB2o5iT6vPy9bE/ITdhsi5jLb5+fkCkQi7rLLEV53p1rh+bIGkeN5
         4d0knStDCzsNR8m+6QONq8wwZ2+agg1WWTWdvK6lJK+pKzT5f5CiJSAAxg/NthA4FeL4
         p+wIk2LM/HoSQnTU30FyxyjRUkVWSzWOgk0Uck7vA75ujYw7JIc9pWl0R62g1hVVW5UO
         5BmwaOlO5hNYi5ErKj6XGrToJ3lfpbW3EcP8ly+iTCUM4huGD3hub7+dcSBFwQV1gW6/
         518Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766454649; x=1767059449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wqv2lr9oTOPBdkEJPMmfpNrt4ToSFM+1GlrCKAsenpQ=;
        b=LPITLRXp1NUeMKbsJzvAphAApvv5IQZdM1QFzB9CCX6vejSGYFBCcPseTELowaKc9a
         OP31GvKuNNxaJUByrOxNiltaQTR+k3NPcO9WdHPSXpqoVc8Yz2NK4yxSznQvYD/A5npq
         meRp4inrY7Ca8ZS5HQ/Hl4S6IMidk+PTcEjrTwbD/xezns2tDWSOX+CWnT6PHVTgldq2
         8VjSWOBcrDS6zM4JcEbxvzUWpObNtQNOtMwEfzmnGOQlARr0C6K4yjlYXD48og+TpBBG
         OdKrFz351ssF2g9CjD0murq5g3Hmb4DQCZjck9Wo2m/W/6JyMK2uKHXgYjZESSacMcYd
         8jkA==
X-Forwarded-Encrypted: i=1; AJvYcCXnL1QKLScbyTj2YThTwjXfq/tl1xoLvnmJ6tDSLaQlaaActBYxYmCHUhnzez/U7VG+YzNjQVfp6oE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqe1fWPLoVg6nSKLXi9sL0FbUCNMX8cGKq526+t///KI/NrZhX
	VmbPcrTYq/rffIqRXSRgnzvUETmlGs/cGCVSisyxxDdKf8Zf1mViwfBE
X-Gm-Gg: AY/fxX76Fg3WCbatq1THaJfkRO0dAM4iK1799OBCGJDrYsdTSx1gKkSqoW0gYw4j+NJ
	vQyWqWS9SLBgprv2CARwLW7dgCQRP+AOTmBMqGHrPGiv0kiOzSZpqsGbbO2SfnlXaoUgRCMbt6S
	5L6PZeqsj8LaJqLmSBrJeBAuS4Xo0PVN7qYl5SLg/2a8VefgYFzaQN1w6RSCIPGXhvmL5jLRlqq
	opW8SkX+qUgzPt0iHx4Kq4IapeOMF25VP+uo64/YBKFd/hOTgX5xUQ04yfMngilwwDDQQPnvH4Z
	XHhWJnyxw6o2cXvA3imvRqa7xhf6gV1PP+u5tK0+GHNQ7Z9pz+5ecHwzqWA9ZHxFLUYaXB+0Oqo
	daT+/1zpvE7ohske7syMT7qFuNL/euao1lWq6uKzhj8xKb+nFuK5ff2P5PhNT8qvGf2kztXwiuv
	5D9IYLZ++JviPhU3JMF9q6Spl6QCWWxx5VC8nueWbwjaGCJI+NMnmJZQYkuVsDaQu7LJhXQ15Va
	sEIxJITtsjpuIVG+zAcgvnGhJ/nP+w=
X-Google-Smtp-Source: AGHT+IEhA13tZ7i7G8YMbG8Y1X4QbocBziyOC782N9pGDW2PHP9YSTCZT7HBwcAdytjODTQ8QXsPvA==
X-Received: by 2002:a17:902:cec1:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a2f2c4cde8mr103800405ad.54.1766454649009;
        Mon, 22 Dec 2025 17:50:49 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66834sm107316205ad.9.2025.12.22.17.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 17:50:48 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v3 2/2] hwmon: pmbus: add support for STEF48H28
Date: Tue, 23 Dec 2025 09:48:32 +0800
Message-Id: <20251223014832.1813114-3-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223014832.1813114-1-hsu.yungteng@gmail.com>
References: <20251223014832.1813114-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for STEF48H28 hot-swap controller.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
 Documentation/hwmon/index.rst     |  1 +
 Documentation/hwmon/stef48h28.rst | 73 +++++++++++++++++++++++++++++
 MAINTAINERS                       |  7 +++
 drivers/hwmon/pmbus/Kconfig       |  9 ++++
 drivers/hwmon/pmbus/Makefile      |  1 +
 drivers/hwmon/pmbus/stef48h28.c   | 76 +++++++++++++++++++++++++++++++
 6 files changed, 167 insertions(+)
 create mode 100644 Documentation/hwmon/stef48h28.rst
 create mode 100644 drivers/hwmon/pmbus/stef48h28.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..c682751a1fe3 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -233,6 +233,7 @@ Hardware Monitoring Kernel Drivers
    shtc1
    sis5595
    sl28cpld
+   stef48h28
    smpro-hwmon
    smsc47b397
    smsc47m192
diff --git a/Documentation/hwmon/stef48h28.rst b/Documentation/hwmon/stef48h28.rst
new file mode 100644
index 000000000000..b515bd4ba9a5
--- /dev/null
+++ b/Documentation/hwmon/stef48h28.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver stef48h28
+=======================
+
+Supported chips:
+
+  * Analog Devices STEF48H28
+
+    Prefix: 'stef48h28'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.st.com/resource/en/data_brief/stef48h28.pdf
+
+Author:
+
+  - Charles Hsu <ythsu0511@gmail.com>
+
+
+Description
+-----------
+
+The STEF48H28 is a 30 A integrated e-fuse for 9-80 V DC power rails.
+It provides inrush control, undervoltage/overvoltage lockout and
+overcurrent protection using an adaptive (I x t) scheme that permits
+short high-current pulses typical of CPU/GPU loads.
+
+The device offers an analog current-monitor output and an on-chip
+temperature-monitor signal for system supervision. Startup behavior is
+programmable through insertion-delay and soft-start settings.
+
+Additional features include power-good indication, self-diagnostics,
+thermal shutdown and a PMBus interface for telemetry and status
+reporting.
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data.
+
+Sysfs entries
+-------------
+
+================= ========================================
+in1_label		"vin".
+in1_input		Measured voltage. From READ_VIN register.
+in1_min			Minimum Voltage. From VIN_UV_WARN_LIMIT register.
+in1_max			Maximum voltage. From VIN_OV_WARN_LIMIT register.
+
+in2_label		"vout1".
+in2_input		Measured voltage. From READ_VOUT register.
+in2_min			Minimum Voltage. From VOUT_UV_WARN_LIMIT register.
+in2_max			Maximum voltage. From VOUT_OV_WARN_LIMIT register.
+
+curr1_label "iin".
+curr1_input Measured current. From READ_IIN register.
+
+curr2_label "iout1".
+curr2_input Measured current. From READ_IOUT register.
+
+power1_label		"pin"
+power1_input		Measured input power. From READ_PIN register.
+
+power2_label		"pout1"
+power2_input		Measured output power. From READ_POUT register.
+
+temp1_input		Measured temperature. From READ_TEMPERATURE_1 register.
+temp1_max		Maximum temperature. From OT_WARN_LIMIT register.
+temp1_crit		Critical high temperature. From OT_FAULT_LIMIT register.
+
+temp2_input		Measured temperature. From READ_TEMPERATURE_2 register.
+================= ========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index d701a4d5b00e..be6b6e9ee79b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24665,6 +24665,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/st,stc3117.yaml
 F:	drivers/power/supply/stc3117_fuel_gauge.c
 
+ST STEF48H28 DRIVER
+M:	Charles Hsu	<hsu.yungteng@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/stef48h28.rst
+F:	drivers/hwmon/pmbus/stef48h28.c
+
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..29ea8ba98b8b 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -576,6 +576,15 @@ config SENSORS_Q54SJ108A2
 	  This driver can also be built as a module. If so, the module will
 	  be called q54sj108a2.
 
+config SENSORS_STEF48H28
+    tristate "ST STEF48H28"
+	help
+	  If you say yes here you get hardware monitoring support for ST
+	  STEF48H28.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called stef48h28.
+
 config SENSORS_STPDDC60
 	tristate "ST STPDDC60"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..b2497f1d7bd9 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
+obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
 obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
diff --git a/drivers/hwmon/pmbus/stef48h28.c b/drivers/hwmon/pmbus/stef48h28.c
new file mode 100644
index 000000000000..f66612b2031b
--- /dev/null
+++ b/drivers/hwmon/pmbus/stef48h28.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for STMicroelectronics digital controller stef48h28
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+#include "pmbus.h"
+
+static struct pmbus_driver_info stef48h28_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 50,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 50,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_IN] = 100,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 0,
+	.m[PSC_CURRENT_OUT] = 100,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 9765,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -3,
+	.m[PSC_TEMPERATURE] = 25,
+	.b[PSC_TEMPERATURE] = 500,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
+	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+	    | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT
+};
+
+static int stef48h28_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &stef48h28_info);
+}
+
+static const struct i2c_device_id stef48h28_id[] = {
+	{"stef48h28"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, stef48h28_id);
+
+static const struct of_device_id __maybe_unused stef48h28_of_match[] = {
+	{.compatible = "st,stef48h28"},
+	{}
+};
+
+/* This is the driver that will be inserted */
+static struct i2c_driver stef48h28_driver = {
+	.driver = {
+		   .name = "stef48h28",
+		   .of_match_table = of_match_ptr(stef48h28_of_match),
+		   },
+	.probe = stef48h28_probe,
+	.id_table = stef48h28_id,
+};
+
+module_i2c_driver(stef48h28_driver);
+
+MODULE_AUTHOR("Charles Hsu <hsu.yungteng@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for ST stef48h28");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.34.1

