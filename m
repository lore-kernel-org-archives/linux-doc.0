Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19D3EB80D
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127791; cv=none; b=PJHMS+rWDWShYmZ1ms5BV15FpV272jp5dCjwH0aShIeQs7acIL2uSv6Ho46zn/vlgtEcg6nqP3DlMHbw14t4j59BMUbR9MzoF7JqLMWWY0eOHhyv4t+Nn6KPumtInqZtrlKKPt5YMl+9IyBYi39hsMGndjvgnUuBuCiRYhuuWIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127791; c=relaxed/simple;
	bh=NEydfPX1MKHXnp0TzXwbq3IncMdTuoZl+H2qWySbXdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwI3ScnhWm0kJ6lFbKkxBm2+tDNXfaW2zsVfZSAX61vbYRmnLfN0WXCSi5ZOJFjAzfGLOByE3vrV2OI2TkbkJH8g0wv8Z39dj2DfpxafjjjXLCR8O4IICClVsxu/N+s/7NGBbLApWQV3NQTE4q3GIS0VNF9LMeRr/guCOCPJNg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtBQl6lA; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtBQl6lA"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be19f05d7dso759384eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127788; x=1773732588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzHNIoMecUVi7e1tRe6uwCQE+PdFWX4mR56jJmSKFks=;
        b=DtBQl6lAb54ZZWvEcHQjCYBjNRhfgCMxX5raDs6tjmjbyPqNdt8q/G/iES5t9vejP7
         gX6Ym/ez9ikmyCXEAfxDixeyyukJGjbAFAfa7dPySElaG31rBabCMyAxwC7UKlW3fq9Q
         JdFJPDZFF22qeO4SX2C9xozKOFzXDk7Y823xBrp8V4NffmdJhb+lS6dFua3iw5ciUx67
         fNAYS70xE2WIEQwkIAad/zoSMtrNH4FVS5oFkrNkA5+q+xCu9AZcMv0D95LFkuyUne79
         m8bD6oaB/NmtJWfQOhYt64KSM9IckguDyX51HnukGN0mpQXwtgx3qOT1kGFZkuGHaOAp
         mzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127788; x=1773732588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzHNIoMecUVi7e1tRe6uwCQE+PdFWX4mR56jJmSKFks=;
        b=cAyfbAOv38ororApVYyN6WGpQOmq1SlKzW4MbLOl21EsUIAyFleN4n9La0Ukx2XfCK
         DgfRA6+vMSFZPRTwmcZ8fjo7i21q1wMZ630a9/6bbl1J3YhkxGvbamiqGD3Eo/quhc/M
         V+GE9rNt067dh/81zpQ8fJyj1vLF+31p1st27f2HuRNGHVGiBprKeNM21nY6s+vaOwid
         oOWaERE27JzmDoJvoVMR1j0F9ZRnCV1cI8uMEJJV1YYh50/algHxXYoiOqxRIR4bwKcH
         S2kptsSCbmKjFFby4FA5ORcb6WbJCxfCS8Q3m1uqMqupgtpbre0A0hyAxdP8QsD+L2YA
         ENlw==
X-Forwarded-Encrypted: i=1; AJvYcCVWzIadlU9vVA9rCaO07ypI+Sv071gMiIbh6f2O1rY6ws1vOGLW5ewSi7kVIrntZa6GM4yy2ANW/hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuwQiuP0daN/TNloSFAevj1FnyyTnKJgcHhyFcsSCkEEJhdjXq
	9+oo9a8sp3OBoUuT1k/KsuEVA+HHCcDIHpV1eii+OU19UATW3rSxbEMM
X-Gm-Gg: ATEYQzzQ0x/AK3JatviRh/SKIbhPG/3GuC60uvTV87PC6/vjKgZPUw4kVTnL/OFA+97
	vcKzig5p1bTMo4afL8RWdMieTzE7AbGw4sB/vvIjH4NRVV25YmxoIp8QZ4Ry9+IIuxjF9l1os2f
	Qg/h334jqzy++WenKKePaJ5NR86fkn0gnQXpUsSWZERj0jmyQM4i8xiwLJ1MmBtn+CCsj4uyf73
	EJaFhp3tK8Zdou7ckS3IYrjsRiTYNll1dh2A2S3fYSbWJuwYXmO2bP3eIa2dUwU4541OTaywNmv
	d1iwo4XSPZk8PIt4uDMO/3EtoH1Fs7inasnmE3z/+KC7CYFCsZiviM8AtZrnQU+KEcqe9d9Lpsz
	gBOyIjOucNkQNnv/xMZYpVwp+nJoVf8H3/Lo+eO7qZoWkNoGUmChP2u1jdJxO9bDiCH2Ko4Q4AO
	MY6dgxckPdmGQ43OgVX5yr6y0fcgKY13HY99CsnSjAz+lOiulxmMCsRJex/KzSofRUVbT7yCClJ
	zhY1pG/7q8TxSU=
X-Received: by 2002:a05:7301:4198:b0:2b7:ff39:3123 with SMTP id 5a478bee46e88-2be4de96afemr5712913eec.9.1773127788338;
        Tue, 10 Mar 2026 00:29:48 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be81209142sm721925eec.12.2026.03.10.00.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:29:47 -0700 (PDT)
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
Subject: [PATCH v6 08/19] HID: hid-lenovo-go: Add OS Mode Toggle
Date: Tue, 10 Mar 2026 07:29:26 +0000
Message-ID: <20260310072937.3295875-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
References: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
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
v6:
  - Use NULL instead of 0 in mcu_propery_out when there is no data.
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
index 082d1b85d679..54861f2e04fc 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -76,6 +76,7 @@ static struct hid_go_cfg {
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
+			       GET_OS_MODE, USB_MCU, NULL, 0);
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
@@ -1712,6 +1808,9 @@ static DEVICE_ATTR_RO_NAMED(gamepad_rumble_intensity_index,
 static DEVICE_ATTR_RW(fps_mode_dpi);
 static DEVICE_ATTR_RO(fps_mode_dpi_index);
 
+static DEVICE_ATTR_RW(os_mode);
+static DEVICE_ATTR_RO(os_mode_index);
+
 static struct attribute *mcu_attrs[] = {
 	&dev_attr_fps_mode_dpi.attr,
 	&dev_attr_fps_mode_dpi_index.attr,
@@ -1720,6 +1819,8 @@ static struct attribute *mcu_attrs[] = {
 	&dev_attr_gamepad_mode_index.attr,
 	&dev_attr_gamepad_rumble_intensity.attr,
 	&dev_attr_gamepad_rumble_intensity_index.attr,
+	&dev_attr_os_mode.attr,
+	&dev_attr_os_mode_index.attr,
 	&dev_attr_reset_mcu.attr,
 	&dev_attr_version_firmware_mcu.attr,
 	&dev_attr_version_gen_mcu.attr,
-- 
2.53.0

