Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7DFED7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 11:23:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751417AbeEVLXf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 07:23:35 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59027 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751060AbeEVLXe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 07:23:34 -0400
Received: from localhost.localdomain ([37.4.249.136]) by
 mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 0MSVhA-1fmTZu2thk-00RcVF; Tue, 22 May 2018 13:22:26 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH RFC V2 2/6] hwmon: Add support for RPi voltage sensor
Date:   Tue, 22 May 2018 13:21:48 +0200
Message-Id: <1526988112-4021-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LdsSoJA8INxvgtDoN2yI7zXwEq9v1jHg7Vb1jC+V6CdrldMTCcS
 eQatt1yUjFtoeU33NeXhMOeruWDiY6hJx1EIGPDYQ9dp/kqrxOPJSHscGFBG392RCWN59mV
 1Fa3gITWX0HhCDVm1qVQLIFj33+pMNuDHHxRfwzRX/LmDwG+SF+fv/DZadpcjKGBlaVpc0x
 2ftnSVW4LEUONwn/zy1dA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:VrsPU5jAy+k=:uxee8pl6ekRZ/OgHon1uJE
 sRKFQThFMLyOO+Kyy/sfGGt2nobH3prRmdxYZXaF5PsAZrK6YbH0fjoBLEkxMk9ZLcAd3k9OT
 1eknh1klrMokScKGXdjJQr3LgLK7ssICBjRyVsylqqu4sHHee5OwEP9un1RCRudqk9wyHyyhW
 W2dJdq3L3ch0DyP7e7ApZMxIgIdaPcZhnSuV9kECpguD9fnraeUvjhfehW2NVLbzynjndTF9H
 SNC1tFoMyJMyoqqWvOdKJLJrAwy93ers9XtDFdP8vm68G6o6sxACm1BA3STuMIZ32Pc3CqjuD
 V425UUzQl3/TUe3/VbqmrTf+ynkzSOR+ABiyPImW4p/wgdfxOg0rDoVz3N1fsgHqAsaYITPDs
 GoJYddY6rW6pjkObMKxfvC9KKaslLuAHDf4z3J0xwirmPU/MDSCLask8JU+xL4o65pOu/x5yO
 MxIc/qR3MQ0y+Fs3t8SAfOeg7gGEBZA0xKkt3QCzhvPfq3D4pk6+K16OoZVXekKwvXX0dskea
 LWkNoRVoH+73Y0fj/29noZtOSsuS5s8KmJpTyXOJSR+rhnC2S61+KDLbYgh+WDTwBiGbXrXjP
 CouGFQtPAkjrBndZ0TtF3D3UWUs87U2oYuLiRiq3dreoQpwLGg3ADQCgXRDDj3z1/ZqxdLQ2U
 gARQ6qpJhoWpoujtEzhVxKt7Ks8VxqkkOtpZr6NJI7LqlFu84vE8/jQujh0nDOpo/IuJi4loB
 EzOiVNNBpn1QbeWoyBASZ+JA3YUKWCDP0RlVV7XocwbBnvKDlr6j1yNlteBZe3Zzp+dE3VyvX
 CkYVL/Z
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently there is no easy way to detect undervoltage conditions on a
remote Raspberry Pi. This hwmon driver retrieves the state of the
undervoltage sensor via mailbox interface. The handling based on
Noralf's modifications to the downstream firmware driver. In case of
an undervoltage condition only an entry is written to the kernel log.

CC: "Noralf Trønnes" <noralf@tronnes.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/hwmon/raspberrypi-hwmon |  22 +++++
 drivers/hwmon/Kconfig                 |  10 ++
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/raspberrypi-hwmon.c     | 168 ++++++++++++++++++++++++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 Documentation/hwmon/raspberrypi-hwmon
 create mode 100644 drivers/hwmon/raspberrypi-hwmon.c

diff --git a/Documentation/hwmon/raspberrypi-hwmon b/Documentation/hwmon/raspberrypi-hwmon
new file mode 100644
index 0000000..3c92e2c
--- /dev/null
+++ b/Documentation/hwmon/raspberrypi-hwmon
@@ -0,0 +1,22 @@
+Kernel driver raspberrypi-hwmon
+===============================
+
+Supported boards:
+  * Raspberry Pi A+ (via GPIO on SoC)
+  * Raspberry Pi B+ (via GPIO on SoC)
+  * Raspberry Pi 2 B (via GPIO on SoC)
+  * Raspberry Pi 3 B (via GPIO on port expander)
+  * Raspberry Pi 3 B+ (via PMIC)
+
+Author: Stefan Wahren <stefan.wahren@i2se.com>
+
+Description
+-----------
+
+This driver periodically polls a mailbox property of the VC4 firmware to detect
+undervoltage conditions.
+
+Sysfs entries
+-------------
+
+in0_lcrit_alarm		Undervoltage alarm
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 768aed5..9a5bdb0 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1298,6 +1298,16 @@ config SENSORS_PWM_FAN
 	  This driver can also be built as a module.  If so, the module
 	  will be called pwm-fan.
 
+config SENSORS_RASPBERRYPI_HWMON
+	tristate "Raspberry Pi voltage monitor"
+	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
+	help
+	  If you say yes here you get support for voltage sensor on the
+	  Raspberry Pi.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called raspberrypi-hwmon.
+
 config SENSORS_SHT15
 	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e7d52a3..a929770 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -141,6 +141,7 @@ obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
 obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
+obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
new file mode 100644
index 0000000..6233e84
--- /dev/null
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Raspberry Pi voltage sensor driver
+ *
+ * Based on firmware/raspberrypi.c by Noralf Trønnes
+ *
+ * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
+ */
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
+#define UNDERVOLTAGE_STICKY_BIT	BIT(16)
+
+struct rpi_hwmon_data {
+	struct device *hwmon_dev;
+	struct rpi_firmware *fw;
+	u32 last_throttled;
+	struct delayed_work get_values_poll_work;
+};
+
+static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
+{
+	u32 new_uv, old_uv, value;
+	int ret;
+
+	/* Request firmware to clear sticky bits */
+	value = 0xffff;
+
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
+				    &value, sizeof(value));
+	if (ret) {
+		dev_err_once(data->hwmon_dev, "Failed to get throttled (%d)\n",
+			     ret);
+		return;
+	}
+
+	new_uv = value & UNDERVOLTAGE_STICKY_BIT;
+	old_uv = data->last_throttled & UNDERVOLTAGE_STICKY_BIT;
+	data->last_throttled = value;
+
+	if (new_uv == old_uv)
+		return;
+
+	if (new_uv)
+		dev_crit(data->hwmon_dev, "Undervoltage detected!\n");
+	else
+		dev_info(data->hwmon_dev, "Voltage normalised\n");
+
+	sysfs_notify(&data->hwmon_dev->kobj, NULL, "in0_lcrit_alarm");
+}
+
+static void get_values_poll(struct work_struct *work)
+{
+	struct rpi_hwmon_data *data;
+
+	data = container_of(work, struct rpi_hwmon_data,
+			    get_values_poll_work.work);
+
+	rpi_firmware_get_throttled(data);
+
+	/*
+	 * We can't run faster than the sticky shift (100ms) since we get
+	 * flipping in the sticky bits that are cleared.
+	 */
+	schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
+}
+
+static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long *val)
+{
+	struct rpi_hwmon_data *data = dev_get_drvdata(dev);
+
+	*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+	return 0;
+}
+
+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	return 0444;
+}
+
+static const u32 rpi_in_config[] = {
+	HWMON_I_LCRIT_ALARM,
+	0
+};
+
+static const struct hwmon_channel_info rpi_in = {
+	.type = hwmon_in,
+	.config = rpi_in_config,
+};
+
+static const struct hwmon_channel_info *rpi_info[] = {
+	&rpi_in,
+	NULL
+};
+
+static const struct hwmon_ops rpi_hwmon_ops = {
+	.is_visible = rpi_is_visible,
+	.read = rpi_read,
+};
+
+static const struct hwmon_chip_info rpi_chip_info = {
+	.ops = &rpi_hwmon_ops,
+	.info = rpi_info,
+};
+
+static int rpi_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rpi_hwmon_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->fw = platform_get_drvdata(to_platform_device(dev->parent));
+	if (!data->fw)
+		return -EPROBE_DEFER;
+
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
+				    &data->last_throttled,
+				    sizeof(data->last_throttled));
+	if (ret)
+		return -ENODEV;
+
+	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
+							       data,
+							       &rpi_chip_info,
+							       NULL);
+
+	INIT_DELAYED_WORK(&data->get_values_poll_work, get_values_poll);
+	platform_set_drvdata(pdev, data);
+
+	if (!PTR_ERR_OR_ZERO(data->hwmon_dev))
+		schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
+
+	return PTR_ERR_OR_ZERO(data->hwmon_dev);
+}
+
+static int rpi_hwmon_remove(struct platform_device *pdev)
+{
+	struct rpi_hwmon_data *data = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&data->get_values_poll_work);
+
+	return 0;
+}
+
+static struct platform_driver rpi_hwmon_driver = {
+	.probe = rpi_hwmon_probe,
+	.remove = rpi_hwmon_remove,
+	.driver = {
+		.name = "raspberrypi-hwmon",
+	},
+};
+module_platform_driver(rpi_hwmon_driver);
+
+MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
+MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
