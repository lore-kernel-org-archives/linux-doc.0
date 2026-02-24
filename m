Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176F023D7DB
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896752; cv=none; b=ooPvuXiHO9jDpAJ3r5Ibw2NQJlo+Joo02QvKVXAABH6QOrbwhGD32Edpeu2OGVBeRO+TI1FKEKaXd4/t+zmzEBzDwLwpgpDQrWFgGmHXGXcLUQQCzX74jqbCH69tscLEFdbnx9l3b2oiLEqq5dIP9f2FVNPzYqxPPOzU2//eU3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896752; c=relaxed/simple;
	bh=1CNVNi4J+0O83KvSLd7KcKe12vlxAT8zLXasG/sLHsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+Uf2cBJECje2XvkgI+xK0uauJBB+JOTqR5EYXSC2TfmZzVJZsXnX29b0O+tyMcpE+OmcJDiPGkRZKcC0d23UmjisnnjKcURsUrEYMAzOcBXfOIOSFcKQq4J8GpkTyuTA19slfPlwj5i2CpoSH+Z6BFCmJQsvsf/gM/KLVjBpK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXGofoJ6; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXGofoJ6"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6b0500e06so6260472eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896748; x=1772501548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qInaGkxxpA+nK4JOeZoash6/W7qtdW193EDqbn6n7Jo=;
        b=XXGofoJ6kBi+al4qFyM8RKKOUu46L0nH87+DzMP9l3O1RuXIxFHzdTn5XOQ6REO0n0
         s6yy1AhRd5KwD1Ts6Q1EPUyzbrU7mHjjKWrtz4kgBBjOJf0GN9GuPJ8obD4/4Uz9Vy1u
         L8V5Ybm3ylGShJgoEMgtatNXd+1w9HZysDISd9rwPz1ontqe9AjF0WoQYF2bMWqchv74
         xDjmouVnpeHtbSRgRQsZuVZ3l5/1o0PStninK9kj5l3bwFkVMU3yg279sEfuvJ+uz3tc
         B0toPcuSBBAcqnuIq/3oYzejR7TWIHCn3IAb1j1ohSB5/rCs8y1t7lY0+NLHOFVidcF5
         qTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896748; x=1772501548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qInaGkxxpA+nK4JOeZoash6/W7qtdW193EDqbn6n7Jo=;
        b=u7kJzXAhzA6Q5ZwyCBC7eaIa60uj62/ZlLKwWe2F/JAQDqalZytDjQUnNgQIbS0NnA
         gEBl27E9q3eRodHdv+pbFzxZaPP3wzWojPLKmjCmA58hqMDBVhBhP3nhsbLXIgVp+XiV
         h8SImFJkDJCFsgME2r0W30isIs3nLV42oj/LpiYGMy1rBnK2yDwPGqEdtRWVyx/xTZM3
         +4d6whVXEjaxDIbIuz+Jch9gsOLo8+Ug7k6c0F2KeFOXfEQrn/JfDGUrmk4BpkLSfxUv
         bmOkvkCx9QfqgTnYJrSu+n7uMGsFyJS7+dok448Q58gSmiLXEbqDabHfXPHDRTGxB6MU
         2Gtg==
X-Forwarded-Encrypted: i=1; AJvYcCXnx3eauWjgFWW6MU0CiVCs62sHtyCLoy2WdCLOSolmJGY9hTO/Cv5sCr4fApSz1OGI1J7q5zIRx48=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2vn/naUfodoeTdfAwfLbFmlRbxbSYhVpRQwRVdcGq9j3SZT2
	ksY4Y1jga3j44lZuq//MStdY+U2a0271nBwiysbjRDiaOefFWEHvuwgq
X-Gm-Gg: ATEYQzxGpzmJUDXQBshZcFUUmk9Z+uIgRbqaFJLT1zwz11KVoczWIh/hIJ/4ulu53W4
	aekRNjvKewmNr94cM67oGrHn1DWwAXVrDBjvpGAO014OyVktm1qyeqSxTpKQnW3BUgVDPE70BQk
	X5+YkrorvHR28SbuSmRVYlIEZGfXhcwjTWQGtkRSkLWfBwrYb7HsHowep94ftb/vSyRLwxg1K0p
	a4AUMxFjhkuNNgYSBRbX0KQ08oRGf7YrJrvzGm8MyDFbsBOcKFFZIjQZEc6r7pvu3Ct8WC/cxnz
	YeGIjjJqnzQRHZqrKIB1n7GIn2Xhk8oYutgPla1O3Iwcm+Tw2txr6FUd2i8Hb8K7EACO4xWoSu3
	dvlwLOqU23ZFyPJDnHxtvHUzd9Eb7u32Ce1tDGeE4IxxWYBLVNQWLGQegAZDYAK9bvOjROfsinG
	olhoQfzL+2dxoPoWJTzwO2v5VlXg3qn95RU0FcLqCSpwW5xxMybtR6qr5nT4XADqzpoXymJM2lY
	qe+REQJnA7rmw==
X-Received: by 2002:a05:7300:7491:b0:2b7:b7e7:9025 with SMTP id 5a478bee46e88-2bd7bd53d13mr3994025eec.31.1771896748208;
        Mon, 23 Feb 2026 17:32:28 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm6485015eec.9.2026.02.23.17.32.27
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
Subject: [PATCH v5 08/16] HID: hid-lenovo-go: Add OS Mode Toggle
Date: Tue, 24 Feb 2026 01:32:09 +0000
Message-ID: <20260224013217.1363996-9-derekjohn.clark@gmail.com>
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

Adds OS Mode toggle, who's primary function is to change the built-in
functional chords to use the right handle legion button instead of the
left handle legion button as the mode shift key.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
v5:
 - Remove reset_resume as it doesn't run, the device disconnects are
   reconnects during suspend. Udev or userspace will reset os_mode
   after resume.
v3:
 - Fix collision with os_mode_index attribute and os_mode_index enum.
---
 drivers/hid/hid-lenovo-go.c | 101 ++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index cd613d5ca37f7..6972d13802e20 100644
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
-- 
2.52.0

