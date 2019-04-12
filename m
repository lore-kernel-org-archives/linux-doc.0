Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 05F757D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Apr 2019 20:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfDLUiD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Apr 2019 16:38:03 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:43248 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbfDLUiC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Apr 2019 16:38:02 -0400
Received: by mail-vk1-f201.google.com with SMTP id v4so4474806vka.10
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2019 13:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=VKjDrHZEkQu2DTPlAKa1rGuu6IGa4ghwL+vjd5mFttY=;
        b=OtVAHK2YXP6VYiHkJTtnUxQMcpoJbqq7sTP4y6efIiXU4PpPCNoEUasr8VpS8MsW/C
         L+VItvRTi+O+YGBABZyXVMmy6PP2+FdV7hAuMFLD1E+yhEWpBRvE0C1hJfCMEFlyBzi1
         Iyc9CsxQNQIfaWLK0KhvxChoXQwidpQSw9PdRQsJZuzDy2a2FzGV+2YpqXbcz2F6PpyK
         btbQUwRq8kd/oNh8IU2UuOyLOpEzXwvzJ/S7oRAPvB98YPv+8r9K2dpYlP9FlriCQEdW
         JSxRvStG8shoLKyI1Qpq616sFlawJlSlKmiAM7U/uwdHa3L342feqgtOUBXAv6XoV9qk
         HVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=VKjDrHZEkQu2DTPlAKa1rGuu6IGa4ghwL+vjd5mFttY=;
        b=NQf+I6kFAaitaK0/JY5DkV+kLi4Vnw4WUHj/lbA0uIYQRQ5pbBtFxRg4Of3sXe2D9N
         QcCUc3JZQyqL5VFsnAgf9sk7ccXgIQMS8Dmgfj2wgCHKfJphj9+5oP4GNuDTi6l0UJfh
         YzY7XRfquOl9Qoanwg6ugv2LrSXic8+g1GKpaBgeXAcLkEs943jzHulH0VpP/TSS7kCI
         STDFfdlErLa2zlE23xVl3GvOPVdT87k0n54mMwYcYWdHXHsF68t9Mab9mRqV0xH4/tyv
         YhkGRiqVcpadq3q3uq55UZYYhiVhZ98JYv/cdvUkDG4+YtacDT/tYC79BYCH674Dw7VQ
         XSqw==
X-Gm-Message-State: APjAAAVFouulA5WRmCfaY9hgg3axfbtenunh+oB5FjtgMOokEST+6U14
        muN8Ls6SZwtBywYi6DRm2rNNbST9i4v5
X-Google-Smtp-Source: APXvYqzJHMrloPprZM49F4YlSowtoDXU2/QLGWc8sqpdwGsaP7ihnddV0HKvrf0T0sMNdGU6cn4tdEEs1oUn
X-Received: by 2002:ab0:3410:: with SMTP id z16mr79254uap.12.1555101481354;
 Fri, 12 Apr 2019 13:38:01 -0700 (PDT)
Date:   Fri, 12 Apr 2019 13:37:56 -0700
Message-Id: <20190412203756.67329-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH v3] hwmon: (pmbus/ir38064): Add driver for Infineon IR38064
 Voltage Regulator
From:   Patrick Venture <venture@google.com>
To:     venture@google.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net
Cc:     Maxim Sloyko <maxims@google.com>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maxim Sloyko <maxims@google.com>

Add the pmbus driver for the Infineon ir38064 voltage regulator.

VOUT_MODE is not supported by the device.  The driver fakes linear16
mode with exponent value -8.

The device supports VOUT_PEAK, IOUT_PEAK, and TEMPERATURE_PEAK, however
this driver does not enable them.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
v3:
 - Updated commit message to indicate behaviors.
v2:
 - Cleaned up weird tabbing behavior in doc.
v1:
 - Initial patchset.
---
 Documentation/hwmon/ir38064   | 64 +++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig   |  9 +++++
 drivers/hwmon/pmbus/Makefile  |  1 +
 drivers/hwmon/pmbus/ir38064.c | 60 ++++++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+)
 create mode 100644 Documentation/hwmon/ir38064
 create mode 100644 drivers/hwmon/pmbus/ir38064.c

diff --git a/Documentation/hwmon/ir38064 b/Documentation/hwmon/ir38064
new file mode 100644
index 0000000000000..618779a329da0
--- /dev/null
+++ b/Documentation/hwmon/ir38064
@@ -0,0 +1,64 @@
+Kernel driver ir38064
+=====================
+
+Supported chips:
+  * Infineon IR38064
+    Prefix: 'ir38064'
+    Addresses scanned: -
+    Datasheet: Publicly available at the Infineon webiste
+      https://www.infineon.com/dgdl/Infineon-IR38064MTRPBF-DS-v03_07-EN.pdf?fileId=5546d462584d1d4a0158db0d9efb67ca
+
+Datasheet is not publicly available.
+
+
+Authors:
+        Maxim Sloyko <maxims@google.com>
+        Patrick Venture <venture@google.com>
+
+Description
+-----------
+
+IR38064 is a Single-input Voltage, Synchronous Buck Regulator, DC-DC Converter.
+
+Usage Notes
+-----------
+
+This driver does not probe for PMBus devices. You will have to instantiate
+devices explicitly.
+
+Sysfs attributes
+----------------
+
+curr1_label		"iout1"
+curr1_input		Measured output current
+curr1_crit		Critical maximum current
+curr1_crit_alarm	Current critical high alarm
+curr1_max		Maximum current
+curr1_max_alarm	Current high alarm
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+in1_min		Minimum input voltage
+in1_min_alarm		Input voltage low alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage
+in2_lcrit		Critical minimum output voltage
+in2_lcrit_alarm	Output voltage critical low alarm
+in2_crit		Critical maximum output voltage
+in2_crit_alarm		Output voltage critical high alarm
+in2_max		Maximum output voltage
+in2_max_alarm		Output voltage high alarm
+in2_min		Minimum output voltage
+in2_min_alarm		Output voltage low alarm
+
+power1_label		"pout1"
+power1_input		Measured output power
+
+temp1_input		Measured temperature
+temp1_crit		Critical high temperature
+temp1_crit_alarm	Chip temperature critical high alarm
+temp1_max		Maximum temperature
+temp1_max_alarm	Chip temperature high alarm
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 629cb45f8557a..de87abab990e5 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -54,6 +54,15 @@ config SENSORS_IR35221
 	  This driver can also be built as a module. If so, the module will
 	  be called ir35521.
 
+config SENSORS_IR38064
+	tristate "Infineon IR38064"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  IR38064.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ir38064.
+
 config SENSORS_LM25066
 	tristate "National Semiconductor LM25066 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index ea0e39518c216..7d1fa6b3c8c93 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
+obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
new file mode 100644
index 0000000000000..4b957ebb6fa71
--- /dev/null
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon IR38064
+ *
+ * Copyright (c) 2017 Google Inc
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info ir38064_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.m[PSC_VOLTAGE_OUT] = 256,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT,
+};
+
+static int ir38064_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &ir38064_info);
+}
+
+static const struct i2c_device_id ir38064_id[] = {
+	{"ir38064", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, ir38064_id);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver ir38064_driver = {
+	.driver = {
+		   .name = "ir38064",
+		   },
+	.probe = ir38064_probe,
+	.remove = pmbus_do_remove,
+	.id_table = ir38064_id,
+};
+
+module_i2c_driver(ir38064_driver);
+
+MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon IR38064");
+MODULE_LICENSE("GPL");
-- 
2.21.0.392.gf8f6787159e-goog

