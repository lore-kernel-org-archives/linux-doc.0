Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DEE246774
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896752; cv=none; b=gi+xY1I90IVdg/bw4Urm6fwAgtIewuEVLzCaWxjqD6pe42Bni3vo/YA6LU4xghmtW4Nzmhh5qIIIxCpdR+PBhHxjtlY/MHGPor9ByyeqBbCDLbVbNtOYVtGPqjzcWFzhzWK3TrYY9opUN/2VawNY9F6VbKyi7fhZ9j2bnWqSc2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896752; c=relaxed/simple;
	bh=UdYFa/wErVhyI8FkVebEa9nOm5mWVcmU3tIV+07vzHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7Qt72G0LIll95fSnbiOlup1OUpj8S5K7orwo3XCSca17kjgbBPN+E8ghEsz5HO9CLUcDWJKijry+nfarRlIshinGkNDD/RcBoRcMQxEF/VApVx2aVx08F5xIooGU9N9fI9EuiDlKxF6XcF38jAP0uht+JfiUGfBUNbksmeJM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L80F7oOt; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L80F7oOt"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4960610eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896747; x=1772501547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xSSeMeVSt0X5TCGS5YKmn8zS8TuHWb4/7S+yRX98II=;
        b=L80F7oOt7wjaCHK1oXtd1XVzTmgFWBG8f+Lsbecinwn79Api9mqxI+KHKpi1vhnTR/
         cQ+mfzNUhfHaBzPRJOGbeVPgAMPHLJptPc2ilnxwpI54YOSVAk4nvDFSI13J8fu7C2EE
         9LpsrfEKlyVKaz+mEDhCGMOIW2+4XGtftLspeTgheiLlEzwwR2TjyNu/4wxaORsOEhio
         QZ7dkoRDVPKJlWHPJaLeqgt85isMCFf02LL3K1vZZob5OlyymRC3zHwx0i+aScBQm0Do
         akdGI5xQhrxg+upr3XLjHYZ7yQMMAlZm8ccafOK4hD7wcZocH48Xk8VymQpgj516osa8
         RJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896747; x=1772501547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1xSSeMeVSt0X5TCGS5YKmn8zS8TuHWb4/7S+yRX98II=;
        b=TQ0BwT5TFBm1ujRxUAD9IAq2JxiI37UuM+aaNwHnamytU5IAYfshDwd3k/fjFMvRjw
         xxOomEdscIL3glEMBbPa3cqVsVgwHBVe/D+ZFTlWE4RiJUa09nXv+54079rQ0a6hB0I2
         IjV1lewWnW5o3GRnfjlWEAKdZHR4oOx6lqkg+nmB5oDUYpZEJKtiQx0MejUodeL8DYz+
         VmWiSHyvJd9H7JBvrUgrQ7T1delC5HiWVTFrpGcV7/Thrxdnd98Um/wS10z7uV1PcrWY
         xCXBI+xsJM33rFo9Az5rSz6dXe9WGRMa+034m0OASmNUtpyVIz5xepPgK2ClqrvvcJvf
         VNxw==
X-Forwarded-Encrypted: i=1; AJvYcCVBKU0/rLLZjqlodBlUIK8Z5BCdTdMJU9nhOgk9d2JlLvJSK4AM/d5oKJMveRCT+YK8UYL+7oLppZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPDRqdmpZM0mmKmDWX643MczgOSIDvlnL0HHWigAFY7S07PCE
	TCzCJKd0YNWtKJ/EfgfXnG58xspmwzVimXIDK9DsT4lQf6+66h7jLzKW
X-Gm-Gg: ATEYQzwzKn4mSf4itRva1LQWn4EvJ2YKsYKMTyglxyff/gXMZw8nJQkDsk42YZdqHT/
	g+KWoEmOlRHDjSfGegK8xwk8b6TwAZDUFyr/pHqU0QsiY5XgjjEN6SZtuoiLDijzoHG695lR2RZ
	sPelO0xGIZifsoHFVOfc47lVdJ0r1C91zzuy/dq3KlvSGVJC3meDKFznWV7VgtcW5tX8oo26Lq0
	pPyteWhMTipQo57HDLa9nyT2Dv/WyegzCB3b3UPwnT4Df6fFsY88W0Rv8e+cBU1uFcF91R5pUgu
	hR/3kqbfgt26N4+wzdny422Asvohx7e3pBQbFlrqERtMIk/GbE6vw4Gs/r/UWfuQhvBOgfo4z+7
	OWMQdti0t/Dkibq0Oah0dxeZ6XtvMWYCIN+u21nQsT2RP/acIZczAjPluNdSWU0pIUJFSZCg3k4
	Md0R/77isvVEUvN9WiW10yIeBA64FygY7spBcOs8owWu9+oh3sgbuiNJXtyBcBSk2Uan9HhtfFL
	mM=
X-Received: by 2002:a05:7300:dc17:b0:2b7:35c8:32cf with SMTP id 5a478bee46e88-2bd7bd29ed8mr3782187eec.28.1771896747422;
        Mon, 23 Feb 2026 17:32:27 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm6485015eec.9.2026.02.23.17.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:32:27 -0800 (PST)
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
Subject: [PATCH v5 07/16] HID: hid-lenovo-go: Add Calibration Settings
Date: Tue, 24 Feb 2026 01:32:08 +0000
Message-ID: <20260224013217.1363996-8-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
References: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds calibration enable and last calibration status indicators for the
triggers, joysticks, and handle gyros.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 284 +++++++++++++++++++++++++++++++++++-
 1 file changed, 283 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index cd4fb646aed24..cd613d5ca37f7 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -43,8 +43,11 @@ struct hid_go_cfg {
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
 	u8 fps_mode;
 	u8 gp_left_auto_sleep_time;
+	u8 gp_left_gyro_cal_status;
+	u8 gp_left_joy_cal_status;
 	u8 gp_left_notify_en;
 	u8 gp_left_rumble_mode;
+	u8 gp_left_trigg_cal_status;
 	u32 gp_left_version_firmware;
 	u8 gp_left_version_gen;
 	u32 gp_left_version_hardware;
@@ -52,8 +55,11 @@ struct hid_go_cfg {
 	u32 gp_left_version_protocol;
 	u8 gp_mode;
 	u8 gp_right_auto_sleep_time;
+	u8 gp_right_gyro_cal_status;
+	u8 gp_right_joy_cal_status;
 	u8 gp_right_notify_en;
 	u8 gp_right_rumble_mode;
+	u8 gp_right_trigg_cal_status;
 	u32 gp_right_version_firmware;
 	u8 gp_right_version_gen;
 	u32 gp_right_version_hardware;
@@ -227,7 +233,41 @@ static const char *const rumble_mode_text[] = {
 	[RUMBLE_MODE_RPG] = "rpg",
 };
 
-#define FPS_MODE_DPI           0x02
+#define FPS_MODE_DPI		0x02
+#define TRIGGER_CALIBRATE	0x04
+#define JOYSTICK_CALIBRATE	0x04
+#define GYRO_CALIBRATE		0x06
+
+enum cal_device_type {
+	CALDEV_GYROSCOPE = 0x01,
+	CALDEV_JOYSTICK,
+	CALDEV_TRIGGER,
+	CALDEV_JOY_TRIGGER,
+};
+
+enum cal_enable {
+	CAL_UNKNOWN,
+	CAL_START,
+	CAL_STOP,
+};
+
+static const char *const cal_enabled_text[] = {
+	[CAL_UNKNOWN] = "unknown",
+	[CAL_START] = "start",
+	[CAL_STOP] = "stop",
+};
+
+enum cal_status_index {
+	CAL_STAT_UNKNOWN,
+	CAL_STAT_SUCCESS,
+	CAL_STAT_FAILURE,
+};
+
+static const char *const cal_status_text[] = {
+	[CAL_STAT_UNKNOWN] = "unknown",
+	[CAL_STAT_SUCCESS] = "success",
+	[CAL_STAT_FAILURE] = "failure",
+};
 
 enum rgb_config_index {
 	LIGHT_CFG_ALL = 0x01,
@@ -264,6 +304,13 @@ static const char *const rgb_effect_text[] = {
 	[RGB_EFFECT_RAINBOW] = "rainbow",
 };
 
+enum device_status_index {
+	GET_CAL_STATUS = 0x02,
+	GET_UPGRADE_STATUS,
+	GET_MACRO_REC_STATUS,
+	GET_HOTKEY_TRIGG_STATUS,
+};
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -508,6 +555,44 @@ static int hid_go_light_event(struct command_report *cmd_rep)
 	}
 }
 
+static int hid_go_device_status_event(struct command_report *cmd_rep)
+{
+	switch (cmd_rep->device_type) {
+	case LEFT_CONTROLLER:
+		switch (cmd_rep->data[0]) {
+		case CALDEV_GYROSCOPE:
+			drvdata.gp_left_gyro_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_JOYSTICK:
+			drvdata.gp_left_joy_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_TRIGGER:
+			drvdata.gp_left_trigg_cal_status = cmd_rep->data[1];
+			return 0;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case RIGHT_CONTROLLER:
+		switch (cmd_rep->data[0]) {
+		case CALDEV_GYROSCOPE:
+			drvdata.gp_right_gyro_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_JOYSTICK:
+			drvdata.gp_right_joy_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_TRIGGER:
+			drvdata.gp_right_trigg_cal_status = cmd_rep->data[1];
+			return 0;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -564,10 +649,16 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 		case GET_RGB_CFG:
 			ret = hid_go_light_event(cmd_rep);
 			break;
+		case GET_DEVICE_STATUS:
+			ret = hid_go_device_status_event(cmd_rep);
+			break;
 		case SET_FEATURE_STATUS:
 		case SET_MOTOR_CFG:
 		case SET_DPI_CFG:
 		case SET_RGB_CFG:
+		case SET_TRIGGER_CFG:
+		case SET_JOYSTICK_CFG:
+		case SET_GYRO_CFG:
 			ret = hid_go_set_event_return(cmd_rep);
 			break;
 		default:
@@ -1157,6 +1248,101 @@ static ssize_t fps_mode_dpi_index_show(struct device *dev,
 	return sysfs_emit(buf, "500 800 1200 1800\n");
 }
 
+static ssize_t device_status_show(struct device *dev,
+				  struct device_attribute *attr, char *buf,
+				  enum device_status_index index,
+				  enum dev_type device_type,
+				  enum cal_device_type cal_type)
+{
+	u8 i;
+
+	switch (index) {
+	case GET_CAL_STATUS:
+		switch (device_type) {
+		case LEFT_CONTROLLER:
+			switch (cal_type) {
+			case CALDEV_GYROSCOPE:
+				i = drvdata.gp_left_gyro_cal_status;
+				break;
+			case CALDEV_JOYSTICK:
+				i = drvdata.gp_left_joy_cal_status;
+				break;
+			case CALDEV_TRIGGER:
+				i = drvdata.gp_left_trigg_cal_status;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		case RIGHT_CONTROLLER:
+			switch (cal_type) {
+			case CALDEV_GYROSCOPE:
+				i = drvdata.gp_right_gyro_cal_status;
+				break;
+			case CALDEV_JOYSTICK:
+				i = drvdata.gp_right_joy_cal_status;
+				break;
+			case CALDEV_TRIGGER:
+				i = drvdata.gp_right_trigg_cal_status;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	if (i >= ARRAY_SIZE(cal_status_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", cal_status_text[i]);
+}
+
+static ssize_t calibrate_config_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, u8 cmd, u8 sub_cmd,
+				      size_t count, enum dev_type device_type)
+{
+	size_t size = 1;
+	u8 val = 0;
+	int ret;
+
+	ret = sysfs_match_string(cal_enabled_text, buf);
+	if (ret < 0)
+		return ret;
+
+	val = ret;
+	if (!val)
+		size = 0;
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, cmd, sub_cmd,
+			       device_type, &val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t calibrate_config_options(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(cal_enabled_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", cal_enabled_text[i]);
+
+	buf[count - 1] = '\n';
+
+	return count;
+}
+
 static int rgb_cfg_call(struct hid_device *hdev, enum mcu_command_index cmd,
 			enum rgb_config_index index, u8 *val, size_t size)
 {
@@ -1463,6 +1649,30 @@ static void hid_go_brightness_set(struct led_classdev *led_cdev,
 	}                                                                     \
 	static DEVICE_ATTR_RO_NAMED(_name, _attrname)
 
+#define LEGO_CAL_DEVICE_ATTR(_name, _attrname, _scmd, _dtype, _rtype)         \
+	static ssize_t _name##_store(struct device *dev,                      \
+				     struct device_attribute *attr,           \
+				     const char *buf, size_t count)           \
+	{                                                                     \
+		return calibrate_config_store(dev, attr, buf, _name.index,    \
+					      _scmd, count, _dtype);          \
+	}                                                                     \
+	static ssize_t _name##_##_rtype##_show(                               \
+		struct device *dev, struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return calibrate_config_options(dev, attr, buf);              \
+	}                                                                     \
+	static DEVICE_ATTR_WO_NAMED(_name, _attrname)
+
+#define LEGO_DEVICE_STATUS_ATTR(_name, _attrname, _scmd, _dtype)              \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return device_status_show(dev, attr, buf, _name.index, _scmd, \
+					  _dtype);                            \
+	}                                                                     \
+	static DEVICE_ATTR_RO_NAMED(_name, _attrname)
+
 /* Gamepad - MCU */
 struct go_cfg_attr version_product_mcu = { PRODUCT_VERSION };
 LEGO_DEVICE_ATTR_RO(version_product_mcu, "product_version", USB_MCU, version);
@@ -1600,9 +1810,45 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_left, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_left_index,
 			    "rumble_notification_index");
 
+struct go_cfg_attr cal_trigg_left = { TRIGGER_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_left, "calibrate_trigger", SET_TRIGGER_CFG,
+		     LEFT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_trigg_left_index, "calibrate_trigger_index");
+
+struct go_cfg_attr cal_joy_left = { JOYSTICK_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_joy_left, "calibrate_joystick", SET_JOYSTICK_CFG,
+		     LEFT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_joy_left_index, "calibrate_joystick_index");
+
+struct go_cfg_attr cal_gyro_left = { GYRO_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_left, "calibrate_gyro", SET_GYRO_CFG,
+		     LEFT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_gyro_left_index, "calibrate_gyro_index");
+
+struct go_cfg_attr cal_trigg_left_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_trigg_left_status, "calibrate_trigger_status",
+			LEFT_CONTROLLER, CALDEV_TRIGGER);
+
+struct go_cfg_attr cal_joy_left_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_joy_left_status, "calibrate_joystick_status",
+			LEFT_CONTROLLER, CALDEV_JOYSTICK);
+
+struct go_cfg_attr cal_gyro_left_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_gyro_left_status, "calibrate_gyro_status",
+			LEFT_CONTROLLER, CALDEV_GYROSCOPE);
+
 static struct attribute *left_gamepad_attrs[] = {
 	&dev_attr_auto_sleep_time_left.attr,
 	&dev_attr_auto_sleep_time_left_range.attr,
+	&dev_attr_cal_gyro_left.attr,
+	&dev_attr_cal_gyro_left_index.attr,
+	&dev_attr_cal_gyro_left_status.attr,
+	&dev_attr_cal_joy_left.attr,
+	&dev_attr_cal_joy_left_index.attr,
+	&dev_attr_cal_joy_left_status.attr,
+	&dev_attr_cal_trigg_left.attr,
+	&dev_attr_cal_trigg_left_index.attr,
+	&dev_attr_cal_trigg_left_status.attr,
 	&dev_attr_imu_bypass_left.attr,
 	&dev_attr_imu_bypass_left_index.attr,
 	&dev_attr_imu_enabled_left.attr,
@@ -1671,9 +1917,45 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_right, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_right_index,
 			    "rumble_notification_index");
 
+struct go_cfg_attr cal_trigg_right = { TRIGGER_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_right, "calibrate_trigger", SET_TRIGGER_CFG,
+		     RIGHT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_trigg_right_index, "calibrate_trigger_index");
+
+struct go_cfg_attr cal_joy_right = { JOYSTICK_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_joy_right, "calibrate_joystick", SET_JOYSTICK_CFG,
+		     RIGHT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_joy_right_index, "calibrate_joystick_index");
+
+struct go_cfg_attr cal_gyro_right = { GYRO_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_right, "calibrate_gyro", SET_GYRO_CFG,
+		     RIGHT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_gyro_right_index, "calibrate_gyro_index");
+
+struct go_cfg_attr cal_trigg_right_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_trigg_right_status, "calibrate_trigger_status",
+			RIGHT_CONTROLLER, CALDEV_TRIGGER);
+
+struct go_cfg_attr cal_joy_right_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_joy_right_status, "calibrate_joystick_status",
+			RIGHT_CONTROLLER, CALDEV_JOYSTICK);
+
+struct go_cfg_attr cal_gyro_right_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_gyro_right_status, "calibrate_gyro_status",
+			RIGHT_CONTROLLER, CALDEV_GYROSCOPE);
+
 static struct attribute *right_gamepad_attrs[] = {
 	&dev_attr_auto_sleep_time_right.attr,
 	&dev_attr_auto_sleep_time_right_range.attr,
+	&dev_attr_cal_gyro_right.attr,
+	&dev_attr_cal_gyro_right_index.attr,
+	&dev_attr_cal_gyro_right_status.attr,
+	&dev_attr_cal_joy_right.attr,
+	&dev_attr_cal_joy_right_index.attr,
+	&dev_attr_cal_joy_right_status.attr,
+	&dev_attr_cal_trigg_right.attr,
+	&dev_attr_cal_trigg_right_index.attr,
+	&dev_attr_cal_trigg_right_status.attr,
 	&dev_attr_imu_bypass_right.attr,
 	&dev_attr_imu_bypass_right_index.attr,
 	&dev_attr_imu_enabled_right.attr,
-- 
2.52.0

