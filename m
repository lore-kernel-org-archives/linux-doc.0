Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A516633DEDD
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958994; cv=none; b=D06fym253Yl+GLKR9/5ZI3xxm2CBLfK6t+2EA1Ce63wCPhcuTEWFtd8VH2F2pFkPIycOnqWN7EONjYvByo+HTjpNpcX0/B41pRR534k/ckvMbk6KlRH91rqg7HQlyr0XjsFvITTsVfJ6yIVm6L+yDdoVFdvuSUyvmF2BuFzoiaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958994; c=relaxed/simple;
	bh=msGHrG0N31BgvzjdtZs3pUL1RS6TzKsZz51sy/aaMro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvjYOegiFVv3QnwRNe3U3mIr4dw0I1m8FC/IS+oRCHmbFIdy1gX+oGoFouSjAlSDMD30tUC/ocO9oiDfIhMyA7X4tTgmY4net0l4sP+bfV3o2fjENcdd3Rv+s0DcUkcBmXZo5WgE44BoihkbvkKAadE8NGBB0Q0eT6w6ZPZCP2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQxnoC6S; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQxnoC6S"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-83ef1d17904so969289b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958992; x=1779563792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybAe4Yq5WnbodBsCF6/CHnT6jJ3uUESQY3Wg7H337Q8=;
        b=QQxnoC6Sqyf8jzEwpTCoasfHOpXgMj4V1XGT4cuYZToXQNXjRSnATbmtLk5iW/zn8G
         eA8hT6EAfsnrAeu69wgOJpPgfmq6oO7Zh7P/9WF/KCsEc0jHfHAOsSCO8Hww+LdEo1pt
         wlogc5obsXauILF4FxM9RyYjVa3ftDysHJ4vlNfh1DG/sX8QSdT96UB1trW/YhmKq3iw
         Wr4BIxCvtYK/E2pEpKNmTzzz24ImoBC9V1/qgo12EWNnCiXbaKL9AM+OOD56AvBHrfU9
         135MPvKJSS6CpNHuaPF8Mr/MeOz3rHZnEv4UIS2Lq984t0VlC4Z9ABPDiLse5tJqLERq
         9cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958992; x=1779563792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybAe4Yq5WnbodBsCF6/CHnT6jJ3uUESQY3Wg7H337Q8=;
        b=KlUSQQ6pIiL0+habR57hoobi2Ze2R/Eog5BQ2dSLiE8FRb6xyRjZkhY0KE4OJJAohr
         fqEofETtV/OEPctYpMZRXOzoaEdDeGjwtUEmi77E6wx9rdLZSwi/dx49N5Nn4+aYyj6N
         g814U1jTJEkz9HwMfqtgnWdgdGynFRuF9J04cgd8VIaRNE941UH8HbD2USOx99pcOyla
         jZ6boCrmhIeK8MFoR9ZLU/4brUZMJFM1tftexy4IDSuzYSTLy1PgJg4vZXvoalEb4q67
         T9HoCpKx82DV2tBh2ooE07CTnth352TnIN8aoYLTcBX4Np0i9i8PvJTKg/ks5ebN4Ht9
         61Yg==
X-Forwarded-Encrypted: i=1; AFNElJ/rV8xzmCpLcCXSx0cUap5DU01XNun4V+eNBP8VgaiwlusQPgB0w6rhwqBaT3txiSpdJoPI0jDcjlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ha+JjPJ46gBFMbO/T4WvG+xtsfSyM/y3Xl5LU57XMFtd6YMS
	t3whWEHb1Nhxi1SDPvEW2csKkwiqaBdJzeEEO+v/89yTtmsxfDXZCbJF
X-Gm-Gg: Acq92OFiV04svYGIJCG5gjZPvr5+b920cqVDQ7kul0WOe+JbVClWTUSe2s/O7KwrA7a
	KRbSSkzzIaxoxvr+whUKbKZVd3mGYI7LOgXtbn+QfM7nfzb1fETwIf2kAxRViGFmoCtZ+A73bJ/
	U8BxWR2z0Xo5BvsarkT6kYOSbuwZY9BMZEFdKuZKCYci/rURQ4LJfm+PUMY/4qESpGCLuSs6Gx9
	aV9mUwoXo7uLqXdNNwfcVrOXHA0n0OxM+Z6s3XTCgHOR/WgIFSeUtWjDa1Znpa1Lwmg96KhGcob
	tIciS1gNefC5OYYftVnDOu6DKtfmRP6uskqPg2JSMhTyjSOBZGQi/Jvh2dIS4I4sGiIYgEeNgKU
	aC6jRGADFnL9k9srbG9VWqauMv4xGMFhljIKRgi7bufTw+zGuumT3mNV4dkGB8vFUqMZltUOfoA
	FfF7ECrfRgXJaOqw/Oyi6SFo29/kFArG277j1TTgyjUakSvvMMGf2iYtAb/Gv05BQGQi3b
X-Received: by 2002:a05:6a00:340c:b0:83b:aa29:3415 with SMTP id d2e1a72fcca58-83f33cb5e9bmr9160316b3a.17.1778958991872;
        Sat, 16 May 2026 12:16:31 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 2/2] hwmon: raspberrypi: Add voltage input support
Date: Sun, 17 May 2026 00:45:55 +0530
Message-ID: <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the raspberrypi-hwmon driver to expose firmware-provided
voltage measurements through the hwmon subsystem.

The driver now exports the following voltage inputs:

  - in0_input (core)
  - in1_input (sdram_c)
  - in2_input (sdram_i)
  - in3_input (sdram_p)

Voltage values returned by firmware are converted from microvolts
to millivolts as expected by the hwmon subsystem.

Update the documentation related to it.

The existing undervoltage sticky alarm handling is preserved and
associated with the first voltage channel.

Tested in -
- Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
  Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/hwmon/raspberrypi-hwmon.rst |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c         | 134 +++++++++++++++++++++-
 2 files changed, 144 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/raspberrypi-hwmon.rst b/Documentation/hwmon/raspberrypi-hwmon.rst
index 8038ade36490..db315184b861 100644
--- a/Documentation/hwmon/raspberrypi-hwmon.rst
+++ b/Documentation/hwmon/raspberrypi-hwmon.rst
@@ -20,6 +20,17 @@ undervoltage conditions.
 Sysfs entries
 -------------
 
-======================= ==================
+======================= ======================================================
+in0_input		Core voltage in millivolts
+in1_input		SDRAM controller voltage in millivolts
+in2_input		SDRAM I/O voltage in millivolts
+in3_input		SDRAM PHY voltage in millivolts
+in0_label		"core"
+in1_label		"sdram_c"
+in2_label		"sdram_i"
+in3_label		"sdram_p"
 in0_lcrit_alarm		Undervoltage alarm
-======================= ==================
+======================= ======================================================
+
+The voltage inputs and labels are only exposed if the firmware reports support
+for the corresponding voltage ID.
diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index a2938881ccd2..4f96f37116f3 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -5,6 +5,7 @@
  * Based on firmware/raspberrypi.c by Noralf Trønnes
  *
  * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
+ * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
  */
 #include <linux/device.h>
 #include <linux/devm-helpers.h>
@@ -18,13 +19,26 @@
 
 #define UNDERVOLTAGE_STICKY_BIT	BIT(16)
 
+struct rpi_firmware_get_value {
+	__le32 id;
+	__le32 val;
+} __packed;
+
 struct rpi_hwmon_data {
 	struct device *hwmon_dev;
 	struct rpi_firmware *fw;
+	u32 valid_inputs;
 	u32 last_throttled;
 	struct delayed_work get_values_poll_work;
 };
 
+static const char * const rpi_hwmon_labels[] = {
+	"core",
+	"sdram_c",
+	"sdram_i",
+	"sdram_p",
+};
+
 static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 {
 	u32 new_uv, old_uv, value;
@@ -56,6 +70,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
 }
 
+static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
+				    long *val)
+{
+	struct rpi_firmware_get_value packet;
+	int ret;
+
+	packet.id = cpu_to_le32(id);
+	packet.val = 0;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
+				    &packet, sizeof(packet));
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(packet.val) / 1000;
+	return 0;
+}
+
 static void get_values_poll(struct work_struct *work)
 {
 	struct rpi_hwmon_data *data;
@@ -77,19 +108,94 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct rpi_hwmon_data *data = dev_get_drvdata(dev);
 
-	*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+			switch (channel) {
+			case 0:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_CORE,
+						val);
+			case 1:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+						val);
+			case 2:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+						val);
+			case 3:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+						val);
+			default:
+				return -EOPNOTSUPP;
+			}
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0) {
+				*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+				return 0;
+			}
+			return -EOPNOTSUPP;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int rpi_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	if (type == hwmon_in && attr == hwmon_in_label) {
+		if (channel >= ARRAY_SIZE(rpi_hwmon_labels))
+			return -EOPNOTSUPP;
+
+		*str = rpi_hwmon_labels[channel];
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	const struct rpi_hwmon_data *data = _data;
+
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			if (!(data->valid_inputs & BIT(channel)))
+				return 0;
+			return 0444;
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0)
+				return 0444;
+			return 0;
+		default:
+			return 0;
+		}
+	}
+
 	return 0;
 }
 
 static const struct hwmon_channel_info * const rpi_info[] = {
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_LCRIT_ALARM),
+			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_LCRIT_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
 	NULL
 };
 
 static const struct hwmon_ops rpi_hwmon_ops = {
-	.visible = 0444,
+	.is_visible = rpi_is_visible,
 	.read = rpi_read,
+	.read_string = rpi_read_string,
 };
 
 static const struct hwmon_chip_info rpi_chip_info = {
@@ -101,6 +207,7 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_hwmon_data *data;
+	long voltage;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -110,6 +217,26 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	/* Parent driver assure that firmware is correct */
 	data->fw = dev_get_drvdata(dev->parent);
 
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_CORE,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(0);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(1);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(2);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(3);
+
 	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
 							       data,
 							       &rpi_chip_info,
@@ -159,6 +286,7 @@ static struct platform_driver rpi_hwmon_driver = {
 module_platform_driver(rpi_hwmon_driver);
 
 MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
+MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
 MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:raspberrypi-hwmon");
-- 
2.54.0

