Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66FD2848A8
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978295; cv=none; b=aIjT3LPFHtSCaXvqbaNzKbg2Zp4eqtzPDFit7JO5U+KrBvH7DmllMxNG078WYWYNe6odrETptKZM6icPtE3OY36kVut31gsbUbJQNKkALipdxEwgsJ+Q7wunUSc/LfNk0ksWpcSENv20yuAv+KaE1wNZyC7yMC741bb0gOPO7qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978295; c=relaxed/simple;
	bh=IUvo+u2e1SrpUl39JLlNAQlGoj/E9x719j6K58inOTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fK4wWIZ43rn4t7d66pL8ccAPwuQ5tDPKmliYQE0raCYrz6IAG0EwTmYpNBWw410KRbd1uj57L1Fq7cev7nVjEDbTuJ162dCuy2FPlTkj6Jxj6QTRXJiEBnf2DGEefLJeoURvxs51Y94jVQeyq+KyAAiRJsFTr40decwkz3mVFuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRmfy+ML; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRmfy+ML"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so6663935b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978289; x=1767583089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn94LU96Z2B+v/2xA7vRHpP471K3U6dTWIu2Ddfkl2Q=;
        b=jRmfy+MLN+dCnqXGTT9MQmKIQjche36HVqYs8HpTf5edaF3CcFePNv/eDZ/7YgRSCS
         SJeVbQj9pmN7uXW5hQ7/FeoOQU9OxSugeshviGb2PDkXNavc7o4YYhcdMV5tUrYopsAU
         MxGOj6KgpYtB3PeMHKPJQOIBCM/NZFdmJgzPQpUUudSrpqARO4y3uEcwC0yApk+sZaKF
         oSgAK/UQJOZDyf3MfXAF/gAEKqLBPhJU1WjUlZdgISHQoVrGm1/lPwcZTJOhM/0/kS2z
         S7uqDPXKr60rMfwCRay5lbbzZ0a0JSpIT1XkadBT0jANdy/DhyjDAMMrbTE2bBsTHjWA
         5/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978289; x=1767583089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yn94LU96Z2B+v/2xA7vRHpP471K3U6dTWIu2Ddfkl2Q=;
        b=NFDejMmrC1SUJ3ApXpqPwQfsSZ74Qfg0ZMa+CWLNPZi6IZnPrCY378dhwb2qX0zq4+
         ReHTFcKycIlHg9dighQRCFVcyS0gWRnjAQSrIloHfxkgslv+uoF+SAzaUtm2q0NTWqOy
         +DHKtbej/OT2NmkOXRqhdYYKoDfiJ0yONSK+ymFN/XaBwUpMwg1N6hRoIxDtrptnzrmh
         lmZGe1s4EBo8YqcZ7a7u6zhsAzqddA+SgHqf5mtWi6McI7Aex7H75kMF+uL+QYzUotia
         njrwd817VMNecXF6cOqwoUqa3BhDvkpD+GpZ3T5bL7I38g47ARGbYBUEjQz/8FhwwzY9
         DfAg==
X-Forwarded-Encrypted: i=1; AJvYcCUGDxJp5KkIQ7CGDNZgNljf7Heli+FCGx7ihm0v+uJ8aEFK6L/fbkNC5kJRkEUszHqK/kCa8TqUb7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxpLSlCUSrh9ECY5oh+kY10rK5ILHpn2CLfwWuiimM0X+9x6tm
	0DPPdCfbavyHyQrdh84tN8Ndy26e/rHF2h0EXcdndKp+i0kfcRVjktOQ
X-Gm-Gg: AY/fxX7zTNZyfLvBY8B9Pe8nt8fF+8wDG5BNerUvcRvW2BqctSXT7d1UTe0CdPC5QTv
	3EKdwOqgUJNxdgnw25d94tca9zULfulIAvhxcFgHbZ937sgg6CV1hQX47yyLiAq0e/7JcWFeBiv
	D9dtkqwR7a7/RelMabIvxaJYmutxsrMhHocmLC/BcOlMS9IxrPoOnRAicDwmwa5ZEq5IVW+ex7U
	DmkIKz8DM3ZjbIUQcXQVyd6OdIqp4EZyuBLFjqpUloK4MHpkxPHHa7IcspUdyJvh6SYpMerRbpR
	M44CByfBkKh4PeNI8T6sqK5WHa50gyTHwu2fAo+5Zw32yvEo+17CriKzZcXZOTPnAnSjtpLP830
	yEIKyDucwRVqryKMZyJygakzEbAwszgBEkyv2xTvxLFelCgbFHldyPIP9p7lW3ey9szU5ZpC8GK
	HOXWnYpCH20tvuB3LmDP1q1MnT4F8KxYqPo7kjoIENaIbl9gNWQJRZOdTEN9MkgKA=
X-Google-Smtp-Source: AGHT+IFQ5fbCr21d6zsw6uYA1gOZsyHt90UhAMUtwWfZf5dhOP8cfNLe5vdZhiKaUYPmyinJjXAt8Q==
X-Received: by 2002:a05:7022:2526:b0:119:e56b:98be with SMTP id a92af1059eb24-121723031f8mr27749537c88.37.1766978289476;
        Sun, 28 Dec 2025 19:18:09 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:09 -0800 (PST)
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
Subject: [PATCH v2 15/16] HID: hid-lenovo-go-s: Add IMU and Touchpad RO Attributes
Date: Mon, 29 Dec 2025 03:17:52 +0000
Message-ID: <20251229031753.581664-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
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
 drivers/hid/hid-lenovo-go-s.c | 108 ++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index e422f3977517..11000cf54e56 100644
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
+LEGOS_DEVICE_ATTR_RO(touchpad_manufacturer, "manufacturer", touchpad);
+
+struct gos_cfg_attr touchpad_version = { TEST_TP_VER };
+LEGOS_DEVICE_ATTR_RO(touchpad_version, "version", touchpad);
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
2.51.2

