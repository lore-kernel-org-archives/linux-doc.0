Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66423321A6
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571166; cv=none; b=q50hxwhd87TH2CF7Rmg+tVa+R6Zpi1xmUf/26ToZiedgvhBOywb5aosKPowRWHe2ZwGS2WkBmtGqFVoX4VEuV/9+j6VM58u7J8nr/8kDCn3q0qntQ5cYL5WQPtjEtpCoiX3tiICtotp0h7F0cpk9tc74/GfEekgbTaKMJ01CZiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571166; c=relaxed/simple;
	bh=EDVH4dUsTcpwD5nmM1gSIYpmlDqVKpktcjiRA1M4xFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovO1K/ORydQUcSdBvwE58qLhT4eTGcpYukYTgMN77dBi3HZEPhavvU0u0u5jXyJNQsBANmHQqdbot2wYHWg6tgyAR9DJ63l0wuUTgOl5WQDNR69168s1YG8VAcHYSCjWvU1MMbYLczJ5KwGmUXDqV4RqJOEkC3Aolm/y9J7qQZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjkDKXcR; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjkDKXcR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2baaceb4613so1419910eec.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 23:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771571164; x=1772175964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msPTXKVrZ/Wht8lz5xWWNbmXT7uXYwiOMAAoN9JAe9M=;
        b=FjkDKXcRC9I881oUch+SJa+8PYKtBYIvaoOLU9au0Luko590XUSez5reFwsrl8mHAZ
         l0hJozfUNyIzekBXory7Viv9GFsykzclHf5CqsX9JAK6OoPSC/Bs8HTTYRXIWAOcYOpb
         PxtBzAKNjPJ2/pX+KnkZbsMXTmqDIZc/4eDq1tRLj8Fl6/KlyQh1nOVATABZ4QeTJuEM
         2BOl7BtC49FE2FjICFkY5SQzOaoN9+ajixJOuNbbx4UTY94WSN40q1uzc+badAdq72ZN
         +4PHRxvHgLtZaMUjT7qbWwQO6XW/H4se41bTSQr9Y5RUXSv/VvhdavhnT+5+ifSpankG
         hf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571164; x=1772175964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=msPTXKVrZ/Wht8lz5xWWNbmXT7uXYwiOMAAoN9JAe9M=;
        b=Qqo/EIWY9TERfvvZ2JtQzIK810HfFEjxTmqG0OS1H6ukBcj8qHWNyhIoFDkgozCkzE
         TQf2DqHqO3qA4qGcdOtEHRf2uhP7eilH2/hkQslMWWu2SaMshVkYODaKtTuqfv9+tg5r
         5Gf9txYgZdbYfA7AJH3BZ/0Y3VIfEpP+ze1e9nExX8xADm0tCLCXzsXQipHomEnb7OeI
         NwNqa0GODMhA6BfFh4zMN/b8Sa4/96xcUDw7tr++heJDXep4yWyQEqZqA7pyGrejAmfs
         eoSC81YANOEqhaoQlymkjaJ+2sseGWT1hifHmP9fedD5a+LUn5X31t1zgCaqAxp3rf0R
         dliQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA0YBhkQbA7CDJVd1ZXFMsG48oyDixNapW1PZS0p9ob3cg8r/C6kWhr/8c25bwgdr2Dp3IRdkyVBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5ab4U38cJFYYXG0bCjF81TuUDYk7bAs9O2Fjzg29wgOqLdhR
	bG+JhD1Uc13Eq+hc3TCbsRG2MxrgVC92KesiOG1D7XkNkNHCcou1Cppq
X-Gm-Gg: AZuq6aL9o7d7QLiko5W8ftR6ibnDrky3/MIGjNbazeFspzXVy64RYvpLK19ABzzy9Wp
	JJY5RqQiqNx1nEi0wfknFwbKwIfKRe98hxAilvKKUC3dhwttilee+NU0GtVwAugang3jjJsWBHf
	8MFJvuVPQFv5e2qQFaauEG49CIhNB0FWStf5evT5E31dnxQTlMR2pGs9SBGJkDPzP9KwqxG9RXG
	LwJvDHQ7jrK8qR9FsjAiOQbshuXlJmPR3Hk/A17HaJ0Z8Atdwt7RyEbzJHn9PcPJb80iiWb6Gyt
	TiSBTkqw4EWOkQ3ZiXz39F6P6zrs6T+6XnFgk3nhtI0GAXNT+FCr0/JteIoffRGMsdXEg5otDhr
	2ESx1kec++7TnO2pWIAD2eV3nrKH/MGNhJvqVuwWk5z383s10x5mwzQ3qvwox/Ea2vQISbNP/Kk
	e/bgVYX0HKCB6pT9MrA8YcNjGbMAQhAsIKzn9z6bolgmamHbWsrnFlPxv0up2osiPX0psJ1MZQl
	mw=
X-Received: by 2002:a05:7300:23d3:b0:2b6:e793:caf7 with SMTP id 5a478bee46e88-2bd6081bc54mr1964279eec.18.1771571163972;
        Thu, 19 Feb 2026 23:06:03 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb669f7dsm22163335eec.23.2026.02.19.23.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:06:03 -0800 (PST)
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
Subject: [PATCH v4 08/16] HID: hid-lenovo-go: Add OS Mode Toggle
Date: Fri, 20 Feb 2026 07:05:21 +0000
Message-ID: <20260220070533.4083667-9-derekjohn.clark@gmail.com>
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

Adds OS Mode toggle, who's primary function is to change the built-in
functional chords to use the right handle legion button instead of the
left handle legion button as the mode shift key. This setting needs to
be restored after resume, so a reset-resume hook is added.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
V3:
 - Fix collision with os_mode_index attribute and os_mode_index enum.
---
 drivers/hid/hid-lenovo-go.c | 137 ++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index b5a1d3e1988f2..883e75894a437 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -76,6 +76,7 @@ struct hid_go_cfg {
 	u32 mcu_version_product;
 	u32 mcu_version_protocol;
 	u32 mouse_dpi;
+	u8 os_mode;
 	u8 rgb_effect;
 	u8 rgb_en;
 	u8 rgb_mode;
@@ -166,6 +167,8 @@ enum feature_status_index {
 	FEATURE_GAMEPAD_MODE = 0x0e,
 };
 
+#define FEATURE_OS_MODE 0x69
+
 enum fps_switch_status_index {
 	FPS_STATUS_UNKNOWN,
 	GAMEPAD,
@@ -311,6 +314,23 @@ enum device_status_index {
 	GET_HOTKEY_TRIGG_STATUS,
 };
 
+enum os_mode_cfg_index {
+	SET_OS_MODE = 0x09,
+	GET_OS_MODE,
+};
+
+enum os_mode_type_index {
+	OS_UNKNOWN,
+	WINDOWS,
+	LINUX,
+};
+
+static const char *const os_mode_text[] = {
+	[OS_UNKNOWN] = "unknown",
+	[WINDOWS] = "windows",
+	[LINUX] = "linux",
+};
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -593,6 +613,21 @@ static int hid_go_device_status_event(struct command_report *cmd_rep)
 	}
 }
 
+static int hid_go_os_mode_cfg_event(struct command_report *cmd_rep)
+{
+	switch (cmd_rep->sub_cmd) {
+	case SET_OS_MODE:
+		if (cmd_rep->data[0] != 1)
+			return -EIO;
+		return 0;
+	case GET_OS_MODE:
+		drvdata.os_mode = cmd_rep->data[0];
+		return 0;
+	default:
+		return -EINVAL;
+	};
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -666,6 +701,9 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 			break;
 		};
 		break;
+	case OS_MODE_DATA:
+		ret = hid_go_os_mode_cfg_event(cmd_rep);
+		break;
 	default:
 		goto passthrough;
 	};
@@ -1343,6 +1381,64 @@ static ssize_t calibrate_config_options(struct device *dev,
 	return count;
 }
 
+static ssize_t os_mode_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	size_t size = 1;
+	int ret;
+	u8 val;
+
+	ret = sysfs_match_string(os_mode_text, buf);
+	if (ret <= 0)
+		return ret;
+
+	val = ret;
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       SET_OS_MODE, USB_MCU, &val, size);
+	if (ret < 0)
+		return ret;
+
+	drvdata.os_mode = val;
+
+	return count;
+}
+
+static ssize_t os_mode_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	ssize_t count = 0;
+	int ret;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       GET_OS_MODE, USB_MCU, 0, 0);
+	if (ret)
+		return ret;
+
+	i = drvdata.os_mode;
+	if (i >= ARRAY_SIZE(os_mode_text))
+		return -EINVAL;
+
+	count = sysfs_emit(buf, "%s\n", os_mode_text[i]);
+
+	return count;
+}
+
+static ssize_t os_mode_index_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(os_mode_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", os_mode_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
 static int rgb_cfg_call(struct hid_device *hdev, enum mcu_command_index cmd,
 			enum rgb_config_index index, u8 *val, size_t size)
 {
@@ -1709,6 +1805,9 @@ static DEVICE_ATTR_RO_NAMED(gamepad_rumble_intensity_index,
 static DEVICE_ATTR_RW(fps_mode_dpi);
 static DEVICE_ATTR_RO(fps_mode_dpi_index);
 
+static DEVICE_ATTR_RW(os_mode);
+static DEVICE_ATTR_RO(os_mode_index);
+
 static struct attribute *mcu_attrs[] = {
 	&dev_attr_fps_mode_dpi.attr,
 	&dev_attr_fps_mode_dpi_index.attr,
@@ -1717,6 +1816,8 @@ static struct attribute *mcu_attrs[] = {
 	&dev_attr_gamepad_mode_index.attr,
 	&dev_attr_gamepad_rumble_intensity.attr,
 	&dev_attr_gamepad_rumble_intensity_index.attr,
+	&dev_attr_os_mode.attr,
+	&dev_attr_os_mode_index.attr,
 	&dev_attr_reset_mcu.attr,
 	&dev_attr_version_firmware_mcu.attr,
 	&dev_attr_version_gen_mcu.attr,
@@ -2181,6 +2282,27 @@ static void hid_go_cfg_remove(struct hid_device *hdev)
 	hid_set_drvdata(hdev, NULL);
 }
 
+static int hid_go_cfg_reset_resume(struct hid_device *hdev)
+{
+	u8 os_mode = drvdata.os_mode;
+	int ret;
+
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       SET_OS_MODE, USB_MCU, &os_mode, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       GET_OS_MODE, USB_MCU, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	if (drvdata.os_mode != os_mode)
+		return -ENODEV;
+
+	return 0;
+}
+
 static int hid_go_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret, ep;
@@ -2239,6 +2361,20 @@ static void hid_go_remove(struct hid_device *hdev)
 	}
 }
 
+static int hid_go_reset_resume(struct hid_device *hdev)
+{
+	int ep = get_endpoint_address(hdev);
+
+	switch (ep) {
+	case GO_GP_INTF_IN:
+		return hid_go_cfg_reset_resume(hdev);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct hid_device_id hid_go_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO,
 			 USB_DEVICE_ID_LENOVO_LEGION_GO2_XINPUT) },
@@ -2258,6 +2394,7 @@ static struct hid_driver hid_lenovo_go = {
 	.probe = hid_go_probe,
 	.remove = hid_go_remove,
 	.raw_event = hid_go_raw_event,
+	.reset_resume = hid_go_reset_resume,
 };
 module_hid_driver(hid_lenovo_go);
 
-- 
2.52.0

