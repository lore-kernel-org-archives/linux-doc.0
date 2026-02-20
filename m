Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D553358DB
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571173; cv=none; b=tfTFrUVANY/WGfowG03tSrIHdLp5XYCwznq344J4q8qK5F0n/NXlzvDmTM+WrMjT4L/kVqVIZppSXuh+kq4STt8XgXfO0uT/oPW/u6gMwf+YV8FGLDc1uct6iHXLUAX37cJhWkHkdf2wXMGS+YHdx87o02UrCesjliYQwuBcF2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571173; c=relaxed/simple;
	bh=FDsEWTPcoALfgSUDbXF74OgZhwSh9yLvG288QGfUHp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6saum33as8suWSINDIf/mmsYKxo6DWxw8il1sikjQVeWV/hp71AhgblEXFMKaNg4uZENTjdSkgLkcchQSAohRdFnXaTGNv6K7q/ZxSKDp9ljD0E5fZ1c+j9vY90myCqNMpwNVM/Yoj1kYjXWN28gZvvKVpVAeIViDjNrOMXgOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvWBcgTM; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvWBcgTM"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bab70f8c8aso1581407eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 23:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771571171; x=1772175971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/cWKYU5Imx6hHH8nw9m+kmRNo61QGfuhGO9F8IkTNk=;
        b=JvWBcgTMZpt5cYXFVobYDmRXDPlUNt9cqCjIuR9In8YpA7EQCQElgqkhIl06q+/EGz
         ptPYgkXoWxoqHKyjIJhRrLU9cMSDpYtbmzcUcYIiTv1I7rqV8h9LmfTUuu+EUU1laWo1
         4rVlYt9m/sDPf4jDLgEY5BzZhdiXZ8VJaDzRZ8cYmYSriYwY/9TDbT1opvXGK0xx3Ir0
         X8YCehVHZDFQV7mCujSaERFiQSWSbJGrqW3OoPeKh1G4f9NwawYrDB7ciFJWGiXPcSsW
         XuELV3PFN4dWoExaZ9bpPGmi59zZQ26TsOTn9Q+Qe5M5706im5y5isuNQvPUZp415oKD
         TpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571171; x=1772175971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/cWKYU5Imx6hHH8nw9m+kmRNo61QGfuhGO9F8IkTNk=;
        b=lMS/pMBfaHJ3noprl1E+WNDwi8Zhv+k2TOFTRJmpAAc/r6/6yJ7Qs/84I7ZR6zB/pf
         GyWWM6SiiKJa9Zbwg+JtiP0AycouNQklpVqcjrLtOn47dbW/+27fNvvHawBdne4tNKau
         7QN4Jd75f5Y+JSSdhJntxjCja2fa+5d3mY5xM1gcMuY/wpycGU2nY9eJyyYjjlNmBn/c
         nWZBNMC3wOHN6BMpqETeVG+UQwiWCZZQrn147DZhWvNrd6EQqxbZ02yPQt7E7oMTtYLJ
         dYn6uwkyxoiLn/7t6/Rip2ynJxXsdyrZkV6oj7NgEDd4az8LBfFmYMKahKEoQNNlmuVQ
         7tMA==
X-Forwarded-Encrypted: i=1; AJvYcCViw1TNnR0LpE3JtM37N7RJ1TLJQP05pQmPo1OC4ZLYXgxEZsPBSZzxcfXq2oWpqk26oBmwhh3aduA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHK+BGbqOpf2JeBD44UGDzlondV3885DPZ4c2Gk2xbyHH1c4c
	PM2uCi1EwDyG+5k02aNw5q37GzBvBdK9hBNYEeS+THmS/BSb6ExKX/tI
X-Gm-Gg: AZuq6aLKmFDmwcDc+vvlA1kuSHKIFGAV9mON4vVH0kUzNeQl4GUQoJwDtrbv2rFQ7nN
	PhZTCDMx0X4+gCIYc9TOPy80Nlx8PNXVRBXpN0sB+8/Qta5M71ZRQpKHAhZBViH/qpxbUPFg8de
	0+OP3bPvXoxKZR/ayu/CTfOw7FMd+HwYpIBAPWifOnbYqToBbYF0FhN+aQpvBGKYLyc979Atstj
	IFNweEnMslhWyBeZu6RJG4+DNY6OTNtVS32OvXDjQ44qFD2h6W9kEF2a2jTUNh+ripK6FmGw442
	5kujHXtpUqGeMTO9io1qQMZ1LHmhMZywMKcIkU15XpGltmV4Y8oVImCAw8T+VXjOOvIo/UaVVdH
	fi/oqodSsdHYNxL61SzaDJc0IAnw074axK5FJxH+Sum44DrFZlzNCulSztQmQiPc8gciJ6CWSrR
	gbnkobwaPENXzjs2ahQQ7sFgcsEg+/nGYpKURYYIJKSQplD8cgRwj3yYO3jdUc1IM8k9t5wP7FK
	7o=
X-Received: by 2002:a05:7300:a284:b0:2ba:8da5:fd6d with SMTP id 5a478bee46e88-2bd5009a48amr3487321eec.15.1771571170626;
        Thu, 19 Feb 2026 23:06:10 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb669f7dsm22163335eec.23.2026.02.19.23.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:06:10 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Richard Hughes <hughsient@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/16] HID: hid-lenovo-go-s: Add IMU and Touchpad RO Attributes
Date: Fri, 20 Feb 2026 07:05:28 +0000
Message-ID: <20260220070533.4083667-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220070533.4083667-1-derekjohn.clark@gmail.com>
References: <20260220070533.4083667-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds attributes for reporting the touchpad manufacturer, version, and
IMU manufacturer.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v4:
 - Cache RO values at probe instead of calling them at request. Values
   don't change and reading the touchpad data is slow.
v3:
 - Fix bug where the touchpad attributes were assigned to the touchpad
   _show function instead of the test _show function.
---
 drivers/hid/hid-lenovo-go-s.c | 124 ++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 2a3b8ef9db06d..cabee8c958696 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -43,6 +43,7 @@ struct hid_gos_cfg {
 	u8 gp_mode;
 	u8 gp_poll_rate;
 	u8 imu_bypass_en;
+	u8 imu_manufacturer;
 	u8 imu_sensor_en;
 	u8 mcu_id[12];
 	u8 mouse_step;
@@ -54,6 +55,8 @@ struct hid_gos_cfg {
 	u8 rgb_speed;
 	u8 tp_en;
 	u8 tp_linux_mode;
+	u8 tp_manufacturer;
+	u8 tp_version;
 	u8 tp_windows_mode;
 } drvdata;
 
@@ -201,6 +204,36 @@ enum rgb_config_index {
 	USR_LIGHT_PROFILE_3,
 };
 
+enum test_command_index {
+	TEST_TP_MFR = 0x02,
+	TEST_IMU_MFR,
+	TEST_TP_VER,
+};
+
+enum tp_mfr_index {
+	TP_NONE,
+	TP_BETTERLIFE,
+	TP_SIPO,
+};
+
+static const char *const touchpad_manufacturer_text[] = {
+	[TP_NONE] = "none",
+	[TP_BETTERLIFE] = "BetterLife",
+	[TP_SIPO] = "SIPO",
+};
+
+enum imu_mfr_index {
+	IMU_NONE,
+	IMU_BOSCH,
+	IMU_ST,
+};
+
+static const char *const imu_manufacturer_text[] = {
+	[IMU_NONE] = "none",
+	[IMU_BOSCH] = "Bosch",
+	[IMU_ST] = "ST",
+};
+
 static int hid_gos_version_event(u8 *data)
 {
 	struct version_report *ver_rep = (struct version_report *)data;
@@ -279,6 +312,30 @@ static int hid_gos_touchpad_event(struct command_report *cmd_rep)
 	return ret;
 }
 
+static int hid_gos_pl_test_event(struct command_report *cmd_rep)
+{
+	int ret = 0;
+
+	switch (cmd_rep->sub_cmd) {
+	case TEST_TP_MFR:
+		drvdata.tp_manufacturer = cmd_rep->data[0];
+		ret = 0;
+		break;
+	case TEST_IMU_MFR:
+		drvdata.imu_manufacturer = cmd_rep->data[0];
+		ret = 0;
+		break;
+	case TEST_TP_VER:
+		drvdata.tp_version = cmd_rep->data[0];
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
 static int hid_gos_light_event(struct command_report *cmd_rep)
 {
 	struct led_classdev_mc *mc_cdev;
@@ -362,6 +419,9 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_TP_PARAM:
 		ret = hid_gos_touchpad_event(cmd_rep);
 		break;
+	case GET_PL_TEST:
+		ret = hid_gos_pl_test_event(cmd_rep);
+		break;
 	case GET_RGB_CFG:
 		ret = hid_gos_light_event(cmd_rep);
 		break;
@@ -743,6 +803,37 @@ static ssize_t touchpad_property_options(struct device *dev,
 	return count;
 }
 
+static ssize_t test_property_show(struct device *dev,
+				  struct device_attribute *attr, char *buf,
+				  enum test_command_index index)
+{
+	size_t count = 0;
+	u8 i;
+
+	switch (index) {
+	case TEST_TP_MFR:
+		i = drvdata.tp_manufacturer;
+		if (i >= ARRAY_SIZE(touchpad_manufacturer_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", touchpad_manufacturer_text[i]);
+		break;
+	case TEST_IMU_MFR:
+		i = drvdata.imu_manufacturer;
+		if (i >= ARRAY_SIZE(imu_manufacturer_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", imu_manufacturer_text[i]);
+		break;
+	case TEST_TP_VER:
+		count = sysfs_emit(buf, "%u\n", drvdata.tp_version);
+		break;
+	default:
+		count = -EINVAL;
+		break;
+	}
+
+	return count;
+}
+
 static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
@@ -1086,6 +1177,9 @@ struct gos_cfg_attr imu_bypass_enabled = { FEATURE_IMU_BYPASS };
 LEGOS_DEVICE_ATTR_RW(imu_bypass_enabled, "bypass_enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(imu_bypass_enabled_index, "bypass_enabled_index");
 
+struct gos_cfg_attr imu_manufacturer = { TEST_IMU_MFR };
+LEGOS_DEVICE_ATTR_RO(imu_manufacturer, "manufacturer", test);
+
 struct gos_cfg_attr imu_sensor_enabled = { FEATURE_IMU_ENABLE };
 LEGOS_DEVICE_ATTR_RW(imu_sensor_enabled, "sensor_enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
@@ -1093,6 +1187,7 @@ static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
 static struct attribute *legos_imu_attrs[] = {
 	&dev_attr_imu_bypass_enabled.attr,
 	&dev_attr_imu_bypass_enabled_index.attr,
+	&dev_attr_imu_manufacturer.attr,
 	&dev_attr_imu_sensor_enabled.attr,
 	&dev_attr_imu_sensor_enabled_index.attr,
 	NULL,
@@ -1146,6 +1241,12 @@ struct gos_cfg_attr touchpad_linux_mode = { CFG_LINUX_MODE };
 LEGOS_DEVICE_ATTR_RW(touchpad_linux_mode, "linux_mode", index, touchpad);
 static DEVICE_ATTR_RO_NAMED(touchpad_linux_mode_index, "linux_mode_index");
 
+struct gos_cfg_attr touchpad_manufacturer = { TEST_TP_MFR };
+LEGOS_DEVICE_ATTR_RO(touchpad_manufacturer, "manufacturer", test);
+
+struct gos_cfg_attr touchpad_version = { TEST_TP_VER };
+LEGOS_DEVICE_ATTR_RO(touchpad_version, "version", test);
+
 struct gos_cfg_attr touchpad_windows_mode = { CFG_WINDOWS_MODE };
 LEGOS_DEVICE_ATTR_RW(touchpad_windows_mode, "windows_mode", index, touchpad);
 static DEVICE_ATTR_RO_NAMED(touchpad_windows_mode_index, "windows_mode_index");
@@ -1155,6 +1256,8 @@ static struct attribute *legos_touchpad_attrs[] = {
 	&dev_attr_touchpad_enabled_index.attr,
 	&dev_attr_touchpad_linux_mode.attr,
 	&dev_attr_touchpad_linux_mode_index.attr,
+	&dev_attr_touchpad_manufacturer.attr,
+	&dev_attr_touchpad_version.attr,
 	&dev_attr_touchpad_windows_mode.attr,
 	&dev_attr_touchpad_windows_mode_index.attr,
 	NULL,
@@ -1257,6 +1360,27 @@ static void cfg_setup(struct work_struct *work)
 		return;
 	}
 
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_TP_MFR, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve Touchpad Manufacturer: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_TP_VER, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve Touchpad Firmware Version: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_IMU_MFR, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve IMU Manufacturer: %i\n", ret);
+		return;
+	}
+
 	/* RGB */
 	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, FEATURE_RGB_ENABLE,
 			       0, 0);
-- 
2.52.0

