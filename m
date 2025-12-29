Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA022737F4
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978285; cv=none; b=htEd+XcjbWSFnb7iwBHrGY8CArb7FKnv+LjrthSfPdbwB3t1gHyHARYs62bmlivJAucWXl8YS06Vq5zJaC6tNHYrhu7D4mDcjF2kin2RQa9A1WgKi/Uo83kyDcL4AR6n/R7AIA94D+OcUAP6mrms7Z5gjJXBa8etWhuRtN96BF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978285; c=relaxed/simple;
	bh=LXmgTZe1DTlhBfOcVlbAaBHy8ZKaDHEjHmzF1BOSMdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLjM/fL/AvCKj0IeubmCaHAvRjqya17tzZ710JxUbBxxDmUU0urngBIXUuLN115kjlOplt8/OVrFOPy+6wccjrCOPfpPJ3fSPiD+FmZmtwkiYmUxPeGRg7f1qPqpSHbnxcRatqBzX10c47W0vT0U4NMxBdeFkbrredjjOefe1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5HSFf45; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5HSFf45"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d67f1877so110412175ad.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978281; x=1767583081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JwaiSohIuuXkqze/ZakjDyPJj0LsG+i+X6xuEUq81s=;
        b=g5HSFf45gOY/i4N5x3QWdj5pLjSOXEvAX4f+SxdxgN2mpK0AQ9x9MYZkKczsHjXhiL
         QXR+d/RSnHeTwTYXEVWoBqIIG0cUJtcxvA8lDP7M5UliGxN18h9VMLZkxzeibjyZ5JUT
         bf2e4eAbazzNDZW+550pbK0qeqYvdHRUqZ/b9OKbSkqXx+QRu4ksEdFTHwI6la/kRSm1
         BZfOFeACmtP1aWpk0/X3nDGWNVUQa8Gdl0A1TW2yO2VrwyIzc6Zbk564PfQ284sC27Dz
         MjiS96mnKxeZEnW7MMng5k5SWDbsieyf4H2U/B4OsTe+GkI3chA+rW0Hvb+cfSSvUYnN
         aPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978281; x=1767583081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3JwaiSohIuuXkqze/ZakjDyPJj0LsG+i+X6xuEUq81s=;
        b=uiuWzeQxk1LXOqkI16mM8ICKhUYoIMQIPDxfFP9TiUy9psuCbCBtSgPAL7HWCtJmGo
         4dpIhZYewh3ngAyoNBly7BF9sbDwEJXeGFQgfQmG+meXfQJchBXpnU8a+/FL/FAQKjq+
         sNMbxTUR8S6sWNUCUYA9B7sFbjHbe3FH2stXYAG9XrytxKa94yizhZzgSZYFygFOWqSP
         i5sYsHlk45KPYOhRmFlNpcps8izY8i4HUCxTW5+nOAjs1TI4zvVuALgtkdjMM0S9Mf0r
         F+5jFwo8UJ0ifY0IiKSwJtSR21HhsY8oBEj/PRwnCQMFHNiSZ3ocppVpic50nZKDgqgA
         dxCw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Snf+/b0DHd1DHEvqhjq3oX4rDh5r7gXIHL9FA2Q2h/gHb8xVYJ19GKB4AfGTyKNc6siGB+uaN10=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwPyVz9kudXkt7kh+tq8sygMtQfnR/4dEXyntoMBDhEA2ae8f
	AF9p2TB4Dku3K9ZYnAvBmWDKh+YOH/lhxM7rq3qjMX1HA6A9zbKlO236
X-Gm-Gg: AY/fxX6ufqwLk8rwaL/QDFrzzszs1/gs9z/r2Oc0mZkz2okUJtF8y7YDL6hx32q97r1
	YBUPxJLzTTe8cI0vb+YMDhsGfmsqDgWBAfwM4Sd+WTtuOsPHbGvmHdrAAs3Z2dnrXbqk7Kvhv7V
	/JAdbnthO4oh0q2pV4zPMvrQRh29ihqiYqUvJm8nOqFdw4ACQDmcqjlbk4rw+KNFZVdu12Cwlpw
	58aH+z27l72C+D4hMptkTVl5f9YSGWCz6/TXQOXFzRwKntzgx3qrDXwkl6eQJFntimSLsxJAzps
	zHw9Jzl9vSWEEk0wwo2Fj2Zv6wKnYuVcP0YyS0AsIO+6jrVGq8ETOwce1ZqiMR62ZDAjE6hlzM+
	wRZAOepLb1zmPfAanPIsns71fe1Kr+klQOKtZ11BHgBEv/ednya0PomgLIBSHcEIBW9inEhpcxp
	FJNUfuYdq+oPOYzO7j4hhxN5K2jjyfN0+XbdDsOmTxK5pNhZ41o602jwEH8Y4DZOM=
X-Google-Smtp-Source: AGHT+IE0oxTw33lXF0gPNZqSMH5W8WMr0A1jHiugdw67TZB5txq6InB6ctwd1MVVDSWaebt5Yahqaw==
X-Received: by 2002:a05:7022:6199:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-121721acb6dmr26336978c88.7.1766978281186;
        Sun, 28 Dec 2025 19:18:01 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:00 -0800 (PST)
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
Subject: [PATCH v2 04/16] HID: hid-lenovo-go: Add Rumble and Haptic Settings
Date: Mon, 29 Dec 2025 03:17:41 +0000
Message-ID: <20251229031753.581664-5-derekjohn.clark@gmail.com>
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

Adds attributes that control the handles rumble mode and intensity, as
well as touchpad haptic feedback settings.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 340 ++++++++++++++++++++++++++++++++++--
 1 file changed, 326 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 681791f119d1..7d8bd1dba7ce 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -38,6 +38,8 @@ struct hid_go_cfg {
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
 	u8 fps_mode;
 	u8 gp_left_auto_sleep_time;
+	u8 gp_left_notify_en;
+	u8 gp_left_rumble_mode;
 	u32 gp_left_version_firmware;
 	u8 gp_left_version_gen;
 	u32 gp_left_version_hardware;
@@ -45,11 +47,14 @@ struct hid_go_cfg {
 	u32 gp_left_version_protocol;
 	u8 gp_mode;
 	u8 gp_right_auto_sleep_time;
+	u8 gp_right_notify_en;
+	u8 gp_right_rumble_mode;
 	u32 gp_right_version_firmware;
 	u8 gp_right_version_gen;
 	u32 gp_right_version_hardware;
 	u32 gp_right_version_product;
 	u32 gp_right_version_protocol;
+	u8 gp_rumble_intensity;
 	u8 imu_left_bypass_en;
 	u8 imu_left_sensor_en;
 	u8 imu_right_bypass_en;
@@ -61,6 +66,8 @@ struct hid_go_cfg {
 	u32 mcu_version_protocol;
 	u8 rgb_en;
 	u8 tp_en;
+	u8 tp_vibration_en;
+	u8 tp_vibration_intensity;
 	u32 tx_dongle_version_firmware;
 	u8 tx_dongle_version_gen;
 	u32 tx_dongle_version_hardware;
@@ -167,6 +174,49 @@ static const char *const gamepad_mode_text[] = {
 	[DINPUT] = "dinput",
 };
 
+enum motor_cfg_index {
+	MOTOR_CFG_ALL = 0x01,
+	MOTOR_INTENSITY,
+	VIBRATION_NOTIFY_ENABLE,
+	RUMBLE_MODE,
+	TP_VIBRATION_ENABLE,
+	TP_VIBRATION_INTENSITY,
+};
+
+enum intensity_index {
+	INTENSITY_UNKNOWN,
+	INTENSITY_OFF,
+	INTENSITY_LOW,
+	INTENSITY_MEDIUM,
+	INTENSITY_HIGH,
+};
+
+static const char *const intensity_text[] = {
+	[INTENSITY_UNKNOWN] = "unknown",
+	[INTENSITY_OFF] = "off",
+	[INTENSITY_LOW] = "low",
+	[INTENSITY_MEDIUM] = "medium",
+	[INTENSITY_HIGH] = "high",
+};
+
+enum rumble_mode_index {
+	RUMBLE_MODE_UNKNOWN,
+	RUMBLE_MODE_FPS,
+	RUMBLE_MODE_RACE,
+	RUMBLE_MODE_AVERAGE,
+	RUMBLE_MODE_SPG,
+	RUMBLE_MODE_RPG,
+};
+
+static const char *const rumble_mode_text[] = {
+	[RUMBLE_MODE_UNKNOWN] = "unknown",
+	[RUMBLE_MODE_FPS] = "fps",
+	[RUMBLE_MODE_RACE] = "racing",
+	[RUMBLE_MODE_AVERAGE] = "standard",
+	[RUMBLE_MODE_SPG] = "spg",
+	[RUMBLE_MODE_RPG] = "rpg",
+};
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -333,6 +383,47 @@ static int hid_go_feature_status_event(struct command_report *cmd_rep)
 	}
 }
 
+static int hid_go_motor_event(struct command_report *cmd_rep)
+{
+	switch (cmd_rep->sub_cmd) {
+	case MOTOR_CFG_ALL:
+		return -EINVAL;
+	case MOTOR_INTENSITY:
+		drvdata.gp_rumble_intensity = cmd_rep->data[0];
+		return 0;
+	case VIBRATION_NOTIFY_ENABLE:
+		switch (cmd_rep->device_type) {
+		case LEFT_CONTROLLER:
+			drvdata.gp_left_notify_en = cmd_rep->data[0];
+			return 0;
+		case RIGHT_CONTROLLER:
+			drvdata.gp_right_notify_en = cmd_rep->data[0];
+			return 0;
+		default:
+			return -EINVAL;
+		};
+		break;
+	case RUMBLE_MODE:
+		switch (cmd_rep->device_type) {
+		case LEFT_CONTROLLER:
+			drvdata.gp_left_rumble_mode = cmd_rep->data[0];
+			return 0;
+		case RIGHT_CONTROLLER:
+			drvdata.gp_right_rumble_mode = cmd_rep->data[0];
+			return 0;
+		default:
+			return -EINVAL;
+		};
+	case TP_VIBRATION_ENABLE:
+		drvdata.tp_vibration_en = cmd_rep->data[0];
+		return 0;
+	case TP_VIBRATION_INTENSITY:
+		drvdata.tp_vibration_intensity = cmd_rep->data[0];
+		return 0;
+	}
+	return -EINVAL;
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -380,7 +471,11 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 		case GET_FEATURE_STATUS:
 			ret = hid_go_feature_status_event(cmd_rep);
 			break;
+		case GET_MOTOR_CFG:
+			ret = hid_go_motor_event(cmd_rep);
+			break;
 		case SET_FEATURE_STATUS:
+		case SET_MOTOR_CFG:
 			ret = hid_go_set_event_return(cmd_rep);
 			break;
 		default:
@@ -757,6 +852,168 @@ static ssize_t feature_status_options(struct device *dev,
 	return count;
 }
 
+static ssize_t motor_config_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count,
+				  enum motor_cfg_index index,
+				  enum dev_type device_type)
+{
+	size_t size = 1;
+	u8 val = 0;
+	int ret;
+
+	switch (index) {
+	case MOTOR_CFG_ALL:
+		return -EINVAL;
+	case MOTOR_INTENSITY:
+		ret = sysfs_match_string(intensity_text, buf);
+		val = ret;
+		break;
+	case VIBRATION_NOTIFY_ENABLE:
+		ret = sysfs_match_string(enabled_status_text, buf);
+		val = ret;
+		break;
+	case RUMBLE_MODE:
+		ret = sysfs_match_string(rumble_mode_text, buf);
+		val = ret;
+		break;
+	case TP_VIBRATION_ENABLE:
+		ret = sysfs_match_string(enabled_status_text, buf);
+		val = ret;
+		break;
+	case TP_VIBRATION_INTENSITY:
+		ret = sysfs_match_string(intensity_text, buf);
+		val = ret;
+		break;
+	};
+
+	if (ret < 0)
+		return ret;
+
+	if (!val)
+		size = 0;
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, SET_MOTOR_CFG,
+			       index, device_type, &val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t motor_config_show(struct device *dev,
+				 struct device_attribute *attr, char *buf,
+				 enum motor_cfg_index index,
+				 enum dev_type device_type)
+{
+	ssize_t count = 0;
+	int ret;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, GET_MOTOR_CFG,
+			       index, device_type, 0, 0);
+	if (ret)
+		return ret;
+
+	switch (index) {
+	case MOTOR_CFG_ALL:
+		return -EINVAL;
+	case MOTOR_INTENSITY:
+		i = drvdata.gp_rumble_intensity;
+		if (i >= ARRAY_SIZE(intensity_text))
+			return -EINVAL;
+
+		count = sysfs_emit(buf, "%s\n", intensity_text[i]);
+		break;
+	case VIBRATION_NOTIFY_ENABLE:
+		switch (device_type) {
+		case LEFT_CONTROLLER:
+			i = drvdata.gp_left_notify_en;
+			break;
+		case RIGHT_CONTROLLER:
+			i = drvdata.gp_right_notify_en;
+			break;
+		default:
+			return -EINVAL;
+		};
+		if (i >= ARRAY_SIZE(enabled_status_text))
+			return -EINVAL;
+
+		count = sysfs_emit(buf, "%s\n", enabled_status_text[i]);
+		break;
+	case RUMBLE_MODE:
+		switch (device_type) {
+		case LEFT_CONTROLLER:
+			i = drvdata.gp_left_rumble_mode;
+			break;
+		case RIGHT_CONTROLLER:
+			i = drvdata.gp_right_rumble_mode;
+			break;
+		default:
+			return -EINVAL;
+		};
+		if (i >= ARRAY_SIZE(rumble_mode_text))
+			return -EINVAL;
+
+		count = sysfs_emit(buf, "%s\n", rumble_mode_text[i]);
+		break;
+	case TP_VIBRATION_ENABLE:
+		i = drvdata.tp_vibration_en;
+		if (i >= ARRAY_SIZE(enabled_status_text))
+			return -EINVAL;
+
+		count = sysfs_emit(buf, "%s\n", enabled_status_text[i]);
+		break;
+	case TP_VIBRATION_INTENSITY:
+		i = drvdata.tp_vibration_intensity;
+		if (i >= ARRAY_SIZE(intensity_text))
+			return -EINVAL;
+
+		count = sysfs_emit(buf, "%s\n", intensity_text[i]);
+		break;
+	};
+
+	return count;
+}
+
+static ssize_t motor_config_options(struct device *dev,
+				    struct device_attribute *attr, char *buf,
+				    enum motor_cfg_index index)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	switch (index) {
+	case MOTOR_CFG_ALL:
+		break;
+	case RUMBLE_MODE:
+		for (i = 1; i < ARRAY_SIZE(rumble_mode_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       rumble_mode_text[i]);
+		}
+		break;
+	case MOTOR_INTENSITY:
+	case TP_VIBRATION_INTENSITY:
+		for (i = 1; i < ARRAY_SIZE(intensity_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       intensity_text[i]);
+		}
+		break;
+	case VIBRATION_NOTIFY_ENABLE:
+	case TP_VIBRATION_ENABLE:
+		for (i = 1; i < ARRAY_SIZE(enabled_status_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       enabled_status_text[i]);
+		}
+		break;
+	};
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
 #define LEGO_DEVICE_ATTR_RW(_name, _attrname, _dtype, _rtype, _group)         \
 	static ssize_t _name##_store(struct device *dev,                      \
 				     struct device_attribute *attr,           \
@@ -822,10 +1079,18 @@ static DEVICE_ATTR_RO_NAMED(gamepad_mode_index, "mode_index");
 struct go_cfg_attr reset_mcu = { FEATURE_RESET_GAMEPAD };
 LEGO_DEVICE_ATTR_WO(reset_mcu, "reset_mcu", USB_MCU, feature_status);
 
+struct go_cfg_attr gamepad_rumble_intensity = { MOTOR_INTENSITY };
+LEGO_DEVICE_ATTR_RW(gamepad_rumble_intensity, "rumble_intensity", UNSPECIFIED,
+		    index, motor_config);
+static DEVICE_ATTR_RO_NAMED(gamepad_rumble_intensity_index,
+			    "rumble_intensity_index");
+
 static struct attribute *mcu_attrs[] = {
 	&dev_attr_fps_switch_status.attr,
 	&dev_attr_gamepad_mode.attr,
 	&dev_attr_gamepad_mode_index.attr,
+	&dev_attr_gamepad_rumble_intensity.attr,
+	&dev_attr_gamepad_rumble_intensity_index.attr,
 	&dev_attr_reset_mcu.attr,
 	&dev_attr_version_firmware_mcu.attr,
 	&dev_attr_version_gen_mcu.attr,
@@ -896,26 +1161,41 @@ static DEVICE_ATTR_RO_NAMED(auto_sleep_time_left_range,
 			    "auto_sleep_time_range");
 
 struct go_cfg_attr imu_bypass_left = { FEATURE_IMU_BYPASS };
-LEGO_DEVICE_ATTR_RW(imu_bypass_left, "imu_bypass_enabled", LEFT_CONTROLLER,
+LEGO_DEVICE_ATTR_RW(imu_bypass_left, "imu_bypass_enable", LEFT_CONTROLLER,
 		    index, feature_status);
-static DEVICE_ATTR_RO_NAMED(imu_bypass_left_index, "imu_bypass_enabled_index");
+static DEVICE_ATTR_RO_NAMED(imu_bypass_left_index, "imu_bypass_enable_index");
 
-struct go_cfg_attr imu_enabled_left = { FEATURE_IMU_ENABLE };
-LEGO_DEVICE_ATTR_RW(imu_enabled_left, "imu_enabled", LEFT_CONTROLLER, index,
+struct go_cfg_attr imu_enable_left = { FEATURE_IMU_ENABLE };
+LEGO_DEVICE_ATTR_RW(imu_enable_left, "imu_enable", LEFT_CONTROLLER, index,
 		    feature_status);
-static DEVICE_ATTR_RO_NAMED(imu_enabled_left_index, "imu_enabled_index");
+static DEVICE_ATTR_RO_NAMED(imu_enable_left_index, "imu_enable_index");
 
 struct go_cfg_attr reset_left = { FEATURE_RESET_GAMEPAD };
 LEGO_DEVICE_ATTR_WO(reset_left, "reset", LEFT_CONTROLLER, feature_status);
 
+struct go_cfg_attr rumble_mode_left = { RUMBLE_MODE };
+LEGO_DEVICE_ATTR_RW(rumble_mode_left, "rumble_mode", LEFT_CONTROLLER, index,
+		    motor_config);
+static DEVICE_ATTR_RO_NAMED(rumble_mode_left_index, "rumble_mode_index");
+
+struct go_cfg_attr rumble_notification_left = { VIBRATION_NOTIFY_ENABLE };
+LEGO_DEVICE_ATTR_RW(rumble_notification_left, "rumble_notification",
+		    LEFT_CONTROLLER, index, motor_config);
+static DEVICE_ATTR_RO_NAMED(rumble_notification_left_index,
+			    "rumble_notification_index");
+
 static struct attribute *left_gamepad_attrs[] = {
 	&dev_attr_auto_sleep_time_left.attr,
 	&dev_attr_auto_sleep_time_left_range.attr,
 	&dev_attr_imu_bypass_left.attr,
 	&dev_attr_imu_bypass_left_index.attr,
-	&dev_attr_imu_enabled_left.attr,
-	&dev_attr_imu_enabled_left_index.attr,
+	&dev_attr_imu_enable_left.attr,
+	&dev_attr_imu_enable_left_index.attr,
 	&dev_attr_reset_left.attr,
+	&dev_attr_rumble_mode_left.attr,
+	&dev_attr_rumble_mode_left_index.attr,
+	&dev_attr_rumble_notification_left.attr,
+	&dev_attr_rumble_notification_left_index.attr,
 	&dev_attr_version_hardware_left.attr,
 	&dev_attr_version_firmware_left.attr,
 	&dev_attr_version_gen_left.attr,
@@ -952,26 +1232,41 @@ static DEVICE_ATTR_RO_NAMED(auto_sleep_time_right_range,
 			    "auto_sleep_time_range");
 
 struct go_cfg_attr imu_bypass_right = { FEATURE_IMU_BYPASS };
-LEGO_DEVICE_ATTR_RW(imu_bypass_right, "imu_bypass_enabled", RIGHT_CONTROLLER,
+LEGO_DEVICE_ATTR_RW(imu_bypass_right, "imu_bypass_enable", RIGHT_CONTROLLER,
 		    index, feature_status);
-static DEVICE_ATTR_RO_NAMED(imu_bypass_right_index, "imu_bypass_enabled_index");
+static DEVICE_ATTR_RO_NAMED(imu_bypass_right_index, "imu_bypass_enable_index");
 
-struct go_cfg_attr imu_enabled_right = { FEATURE_IMU_BYPASS };
-LEGO_DEVICE_ATTR_RW(imu_enabled_right, "imu_enabled", RIGHT_CONTROLLER, index,
+struct go_cfg_attr imu_enable_right = { FEATURE_IMU_BYPASS };
+LEGO_DEVICE_ATTR_RW(imu_enable_right, "imu_enable", RIGHT_CONTROLLER, index,
 		    feature_status);
-static DEVICE_ATTR_RO_NAMED(imu_enabled_right_index, "imu_enabled_index");
+static DEVICE_ATTR_RO_NAMED(imu_enable_right_index, "imu_enable_index");
 
 struct go_cfg_attr reset_right = { FEATURE_RESET_GAMEPAD };
 LEGO_DEVICE_ATTR_WO(reset_right, "reset", LEFT_CONTROLLER, feature_status);
 
+struct go_cfg_attr rumble_mode_right = { RUMBLE_MODE };
+LEGO_DEVICE_ATTR_RW(rumble_mode_right, "rumble_mode", RIGHT_CONTROLLER, index,
+		    motor_config);
+static DEVICE_ATTR_RO_NAMED(rumble_mode_right_index, "rumble_mode_index");
+
+struct go_cfg_attr rumble_notification_right = { VIBRATION_NOTIFY_ENABLE };
+LEGO_DEVICE_ATTR_RW(rumble_notification_right, "rumble_notification",
+		    RIGHT_CONTROLLER, index, motor_config);
+static DEVICE_ATTR_RO_NAMED(rumble_notification_right_index,
+			    "rumble_notification_index");
+
 static struct attribute *right_gamepad_attrs[] = {
 	&dev_attr_auto_sleep_time_right.attr,
 	&dev_attr_auto_sleep_time_right_range.attr,
 	&dev_attr_imu_bypass_right.attr,
 	&dev_attr_imu_bypass_right_index.attr,
-	&dev_attr_imu_enabled_right.attr,
-	&dev_attr_imu_enabled_right_index.attr,
+	&dev_attr_imu_enable_right.attr,
+	&dev_attr_imu_enable_right_index.attr,
 	&dev_attr_reset_right.attr,
+	&dev_attr_rumble_mode_right.attr,
+	&dev_attr_rumble_mode_right_index.attr,
+	&dev_attr_rumble_notification_right.attr,
+	&dev_attr_rumble_notification_right_index.attr,
 	&dev_attr_version_hardware_right.attr,
 	&dev_attr_version_firmware_right.attr,
 	&dev_attr_version_gen_right.attr,
@@ -991,9 +1286,26 @@ LEGO_DEVICE_ATTR_RW(touchpad_enabled, "enabled", UNSPECIFIED, index,
 		    feature_status);
 static DEVICE_ATTR_RO_NAMED(touchpad_enabled_index, "enabled_index");
 
+struct go_cfg_attr touchpad_vibration_enabled = { TP_VIBRATION_ENABLE };
+LEGO_DEVICE_ATTR_RW(touchpad_vibration_enabled, "vibration_enabled", UNSPECIFIED,
+		    index, motor_config);
+static DEVICE_ATTR_RO_NAMED(touchpad_vibration_enabled_index,
+			    "vibration_enabled_index");
+
+struct go_cfg_attr touchpad_vibration_intensity = { TP_VIBRATION_INTENSITY };
+LEGO_DEVICE_ATTR_RW(touchpad_vibration_intensity, "vibration_intensity",
+		    UNSPECIFIED, index, motor_config);
+static DEVICE_ATTR_RO_NAMED(touchpad_vibration_intensity_index,
+			    "vibration_intensity_index");
+
 static struct attribute *touchpad_attrs[] = {
 	&dev_attr_touchpad_enabled.attr,
 	&dev_attr_touchpad_enabled_index.attr,
+	&dev_attr_touchpad_vibration_enabled.attr,
+	&dev_attr_touchpad_vibration_enabled_index.attr,
+	&dev_attr_touchpad_vibration_intensity.attr,
+	&dev_attr_touchpad_vibration_intensity_index.attr,
+	NULL,
 };
 
 static const struct attribute_group touchpad_attr_group = {
-- 
2.51.2

