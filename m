Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7FE21D3D6
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 01:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219368; cv=none; b=M+JXqrVdvQUy5zR13/oak39ivld84IAbOIaBrKbcbY0AP9y05B59xyv7LheV6SeKzAVal06yFbijrLN2TT4KfNHzZKpcpwggRnl0LRthvNwH8lZmLFy0NwY2BaB3y3Gp5JQ4SqR5SGEotwW4rdR4HpJe2oVeaJGbNDW6xXlchwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219368; c=relaxed/simple;
	bh=Uq1flWJME9yZBIe+pK57YoX7PNsp53RCp/QQ+B2TBXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/QXZxY5RFRMf0pEHu/ZNifd3SIWuIHNjKwh9Srxi3G+Om+XVG7w/ZSSmDlbhXJ+pGwGPkPwuw/N1HeaAKQcvEh/IIzbZag2SkLekVPvSdEGikt+215d+GRPxl2+6EvF4Ryyww9jOsZ/4S2qGwm1Z/SiK7+mS4VVKQNWECxlC/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4Qr2eG3; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Qr2eG3"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b714f30461so2645059eec.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 17:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769219365; x=1769824165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shcSpW9YVM231NFCSd2R8Nn6vQf/8t1cDlRE1ZGCnPo=;
        b=P4Qr2eG3mnYUDJNURHDGjaNBaIyFHSNKS7DxssfL4lJ28gg/bLO4hBPgjhNbI0YC13
         VUmlvjm6Ey/bYoXaOcyVeT6vfu93zr6W7vOGI3i6XlJkvCfHcPMjaRTpbfhL/4gFb1EW
         /LFYRk5g3DqgwIt3xa1c+khF34iUBfhf1jr8hNN/Xf+f+kbUjXVc6VMFl8m4Cy6chh7Z
         ubBCuEJJwwasJiT4EGH3A/Vpd1t02nL/ZAM+HhHUE3Iis48ts4Mvyu7xvTxzH1ClA0LP
         pi5NvadbP9diRk3CWgZ9lHluS8gvl91ArBELOYY876vs8vy1K3XjJ66YSe+0jrlxeJNW
         9XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769219365; x=1769824165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shcSpW9YVM231NFCSd2R8Nn6vQf/8t1cDlRE1ZGCnPo=;
        b=OYfsyDvTdLsMQ1YT4HWMeKcTbOtX+KpNlagLolC45RrCf81f3ufXZ7l7SrZ0cChoIJ
         0gfKJnKARgTvEqM1gJAnrPHOT537lqgLLIlLBwN3ezFyW4AL+NLz15FIc5XQx5T5VhKh
         Rj89gwhYGCtTZC2dVj7jJhuF0IPFrRUjxkVnG5licqck5okpGST8E7Vvcaj464U3+2/8
         W73e11kpw59/ReGTP8aY41DDEZKucka1r1AqQjrNtt8I5lsMy9BkZH+iHk1NaCUqlwLI
         iBZLvhVxtAfKl6r0bjSppmhX59io6+zSr8U4Twsv6tVq8xf3v0werIZHtt0Pzp4D0SPt
         65tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXyygMEcwCHG1zvyAULlutMzTBbZPeL5z7Wl8QOOH+XFbwif47wHX+zHeYweBtGxDIVkVc1xrrKOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/BUIbrmShhX+adnfJQGT6jK++a7eJ00gpEIH3E0K1v5m10TB
	ZkCOf/xkJrV63sCLUxKkBfiXfQ0YKt6ly1ZG1FCfDQYed2FBy/X5G1ac
X-Gm-Gg: AZuq6aLRhBrn7pRq3q2KSNgjMz0IgazOovbif7UWySnX2M1DWolKEsIpV/E0f0nzjMq
	8G/quGFLlZjHdXprC7jLfyACRAcFwHj+r/qUaS0DtGzzXgZ7wr80lt+O+F/BV8MTspv226wHYl8
	xY8fOMqvVvTgul4md8UNLkp6trVR854TvMP2gU4tjG0hwbGL6J3Qk9utwVwR7l/AsxPEfOv0ROv
	4mRjx9LwL8IzalNf/0mDegNWJFa2YP2Hu93MzJCnLPyYbm+JTtsitzP9PUELn+9vyvP7GEZMMu0
	Rv9BO0l2cUW0MdOq2X8/dRrVpDsTpKCB49JD61PMFzgB4LQLQZVgcmBwdOfLhL9JUEUPDzxeyVV
	yPCDm5wHYon2TQqwbJdUOAonwfeap6KFTwwDbkTyfyVrTc4BEXxAAH3sbEG0D7K6Eipq6TmV/N2
	E4EMzEwh3XpwOev7jfIvPF+kea+ATAqWb0taUxos12gcZ5mhjwFTOQaDfcOcg2+VA=
X-Received: by 2002:a05:7301:fa84:b0:2b7:98d:7b54 with SMTP id 5a478bee46e88-2b739992976mr2783751eec.14.1769219365156;
        Fri, 23 Jan 2026 17:49:25 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5160014eec.29.2026.01.23.17.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:49:24 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/16] HID: hid-lenovo-go-s: Add IMU and Touchpad RO Attributes
Date: Sat, 24 Jan 2026 01:49:06 +0000
Message-ID: <20260124014907.991265-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124014907.991265-1-derekjohn.clark@gmail.com>
References: <20260124014907.991265-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds attributes for reporting the touchpad manufacturer, version, and
IMU manufacturer.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
V3:
 - Fix bug where the touchpad attributes were assigned to the touchpad
   _show function instead of the test _show function.
---
 drivers/hid/hid-lenovo-go-s.c | 108 ++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index e422f3977517..d74a37c1980f 100644
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
@@ -742,6 +802,42 @@ static ssize_t touchpad_property_options(struct device *dev,
 	return count;
 }
 
+static ssize_t test_property_show(struct device *dev,
+				  struct device_attribute *attr, char *buf,
+				  enum test_command_index index)
+{
+	size_t count = 0;
+	int ret;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, index, 0, 0);
+	if (ret)
+		return ret;
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
@@ -1085,6 +1181,9 @@ struct gos_cfg_attr imu_bypass_enabled = { FEATURE_IMU_BYPASS };
 LEGOS_DEVICE_ATTR_RW(imu_bypass_enabled, "bypass_enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(imu_bypass_enabled_index, "bypass_enabled_index");
 
+struct gos_cfg_attr imu_manufacturer = { TEST_IMU_MFR };
+LEGOS_DEVICE_ATTR_RO(imu_manufacturer, "manufacturer", test);
+
 struct gos_cfg_attr imu_sensor_enabled = { FEATURE_IMU_ENABLE };
 LEGOS_DEVICE_ATTR_RW(imu_sensor_enabled, "sensor_enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
@@ -1092,6 +1191,7 @@ static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
 static struct attribute *legos_imu_attrs[] = {
 	&dev_attr_imu_bypass_enabled.attr,
 	&dev_attr_imu_bypass_enabled_index.attr,
+	&dev_attr_imu_manufacturer.attr,
 	&dev_attr_imu_sensor_enabled.attr,
 	&dev_attr_imu_sensor_enabled_index.attr,
 	NULL,
@@ -1145,6 +1245,12 @@ struct gos_cfg_attr touchpad_linux_mode = { CFG_LINUX_MODE };
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
@@ -1154,6 +1260,8 @@ static struct attribute *legos_touchpad_attrs[] = {
 	&dev_attr_touchpad_enabled_index.attr,
 	&dev_attr_touchpad_linux_mode.attr,
 	&dev_attr_touchpad_linux_mode_index.attr,
+	&dev_attr_touchpad_manufacturer.attr,
+	&dev_attr_touchpad_version.attr,
 	&dev_attr_touchpad_windows_mode.attr,
 	&dev_attr_touchpad_windows_mode_index.attr,
 	NULL,
-- 
2.52.0

