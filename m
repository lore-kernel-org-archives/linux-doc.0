Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44269273D84
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978292; cv=none; b=CnXFMH0hUrsMrUg2b+GdpChoeTETxgxTF2Lx9DexO2qJXj4Eo5QbGIFypUt6uQlnJeiM3RDkEYlytkxHpKd2mLTYjz0F38RRwj8A/mVuKbW4Clkb/Io+nVf/RuFTon8xwFL3joYOTKvz36Jee1KVXDsQVXyRocrAg/KauZG4jCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978292; c=relaxed/simple;
	bh=oqKm237OssMghJKlQPmco5wSMzp57040uiDrPySMFAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhquY71cFOCArxpmRc057BhnaUInhWGCmoPsCOq8c6sW1idfqc+UIISvLF/uVZEQU7tUlN9hP0OqXhMV1oyxWM27MedmyC1fvYmdvB8fgsAD1A6qhVxwEyqRWe18ISDR6g3FZG2XC1IW4fRmExhpI7l2IOentHeakoMR4AbrLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHQ0GfPF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHQ0GfPF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d5c365ceso114520295ad.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978288; x=1767583088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miGogj6YnndhpvXP0429HX4qoehDUgcQ4H71U57ueIM=;
        b=RHQ0GfPFUX7gQgJ/0yz2r6szOKR9Vv9QZo3LxkDoi3Nh6UGNSfolffzF1mnuwLqc7e
         UpDzCUydWbijSktaICAobi82oPH56MTJOdmWM7drMxb65y8JYWuE6e7zjhHOeuUfZL/p
         4CphOaqh/NSGTG9cjuViFhEEMPJjZt7xurywhfTcfYG9/goVhPuejDjVAD1Dfh1FCQwP
         as3tt050GRPIWX8m0VOpz2f7RBPoyRsATw9MA72eLWdUeJ96IbGSpWHNhPOkXU8IXrWZ
         pQl3GDnfe74ANpvs2+3gZMti/nreVgo3qFcBsNSjJp0iSLCSCWkyixZ/Vc+cwUZ7/0Jj
         K+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978288; x=1767583088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miGogj6YnndhpvXP0429HX4qoehDUgcQ4H71U57ueIM=;
        b=jpPcPVXVWpGeINwmujjMCp8wKJWGLXxsfkGS/gacsmhMrexyr7EpFXjNhilQa0MDYV
         eLs8vt89kT+dyqTc60ETkys+UnwTa4XiJQlvd3TSyny1jrP2/2XgBrkStoOppV8jZ2oy
         P7BuwIXwLYoSJ3+2q1xHzdcgRdbVRt4mB8rp+1C1AiAP0w2wM/lCKGCYMjtbaSk9z8Rl
         2apHmIo8pZGXl5T811WIUKnEJg4ZOA3FPdYffooBVk2W8oNN7xNDUNgfz3YAVcZaLZVC
         NmI5nITblwdRfVBfse50b+ItK3mW9oiyS0S6PlJk+gE3dwo4kbVFID1qBPolEXCQIBs3
         6ctQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnZL2f9xfTEMp9tVe0pTKBpQ/YIih+EUbVEYii+R3ZNIsv76u2O5GQ63W/bUTtuOYwOKUJrA/vKXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjIckeaZfZsUWHKO3w8+y568LBkzUwyQkznzVTo4D6IjLnM2R
	XfPiggvTwDMs9Rm0CA0J0oaWFuE+5xkGX/mthMbQxeWSPjqtj2gg6GIggzgkug==
X-Gm-Gg: AY/fxX6DBm+XFSLj9zYw6ea+FEB2rUzKc+A+iUvYMr5mhanJTqrHzkEZqehu3cZbS3u
	Me5KmtUX0W+gw0EsWv6CfYcUfLOKBfKLuQD3acqXGQwHGjS6CcinvIkLkSCz+7sNA+5bJj8Ffy6
	OFRTZu1ybbzAPfqxa8tTi5wPff9J86lLYRrFP685JKrdKx5F0ze3Ni/rc4V4ELWVLvbDxx1+qvI
	HOsS3Twzsn0muMF8CKY1GwoCnI01x2qXpU8EnaeJjDK0rkuxuL9ViEYduxmJgp7bunJAimkRnQP
	jAJ6MlYee9AQfcJCzfyb68VYmD+Yo0P/AtVphAz0tK+B3Qv5KwzDwL0iYUpE7zI32NQjlbdrl4W
	oTK6HgIKdA2jazmmFYg/BJJT9d/U14kYUomcVvsC8aImgGgDQbSGr1vk0A5eK2RxHF3HXLlfNow
	YNHitSChBSaiaOUCh3xPCJiIUZeqYkZgs6Mnlwqy6d52p1S+3nmYDbmU3L64EHxl4=
X-Google-Smtp-Source: AGHT+IHjwK9SUF/qOruDxO9wu7yjpn2zEeJHGppohIix6cKExalnAY9LGjRftJ0II/rrFdgWUa8T1w==
X-Received: by 2002:a05:7022:2217:b0:11b:9386:a3c2 with SMTP id a92af1059eb24-121722ff9fbmr29439286c88.45.1766978287954;
        Sun, 28 Dec 2025 19:18:07 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:07 -0800 (PST)
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
Subject: [PATCH v2 13/16] HID: hid-lenovo-go-s: Add Touchpad Mode Attributes
Date: Mon, 29 Dec 2025 03:17:50 +0000
Message-ID: <20251229031753.581664-14-derekjohn.clark@gmail.com>
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

Adds attributes for managing the touchpad operating modes.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 142 ++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 076afdaa9628..38425e3d6cb2 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -47,6 +47,8 @@ struct hid_gos_cfg {
 	u8 os_mode;
 	u8 rgb_en;
 	u8 tp_en;
+	u8 tp_linux_mode;
+	u8 tp_windows_mode;
 } drvdata;
 
 struct gos_cfg_attr {
@@ -145,6 +147,22 @@ static const char *const dpad_mode_text[] = {
 	[DIR4] = "4-way",
 };
 
+enum touchpad_mode_index {
+	TP_REL,
+	TP_ABS,
+};
+
+static const char *const touchpad_mode_text[] = {
+	[TP_REL] = "relative",
+	[TP_ABS] = "absolute",
+};
+
+enum touchpad_config_index {
+	CFG_WINDOWS_MODE = 0x03,
+	CFG_LINUX_MODE,
+
+};
+
 static int hid_gos_version_event(u8 *data)
 {
 	struct version_report *ver_rep = (struct version_report *)data;
@@ -204,6 +222,25 @@ static int hid_gos_gamepad_cfg_event(struct command_report *cmd_rep)
 	return ret;
 }
 
+static int hid_gos_touchpad_event(struct command_report *cmd_rep)
+{
+	int ret = 0;
+
+	switch (cmd_rep->sub_cmd) {
+	case CFG_LINUX_MODE:
+		drvdata.tp_linux_mode = cmd_rep->data[0];
+		break;
+	case CFG_WINDOWS_MODE:
+		drvdata.tp_windows_mode = cmd_rep->data[0];
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static int hid_gos_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -251,7 +288,11 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_GAMEPAD_CFG:
 		ret = hid_gos_gamepad_cfg_event(cmd_rep);
 		break;
+	case GET_TP_PARAM:
+		ret = hid_gos_touchpad_event(cmd_rep);
+		break;
 	case SET_GAMEPAD_CFG:
+	case SET_TP_PARAM:
 		ret = hid_gos_set_event_return(cmd_rep);
 		break;
 	default:
@@ -537,6 +578,95 @@ static ssize_t gamepad_property_options(struct device *dev,
 	return count;
 }
 
+static ssize_t touchpad_property_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count,
+				       enum touchpad_config_index index)
+{
+	size_t size = 1;
+	u8 val = 0;
+	int ret;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+		ret = sysfs_match_string(touchpad_mode_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case CFG_LINUX_MODE:
+		ret = sysfs_match_string(touchpad_mode_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (!val)
+		size = 0;
+
+	ret = mcu_property_out(drvdata.hdev, SET_TP_PARAM, index, &val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t touchpad_property_show(struct device *dev,
+				      struct device_attribute *attr, char *buf,
+				      enum touchpad_config_index index)
+{
+	int ret = 0;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, GET_TP_PARAM, index, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+		i = drvdata.tp_windows_mode;
+		break;
+	case CFG_LINUX_MODE:
+		i = drvdata.tp_linux_mode;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (i >= ARRAY_SIZE(touchpad_mode_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", touchpad_mode_text[i]);
+}
+
+static ssize_t touchpad_property_options(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf,
+					 enum touchpad_config_index index)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+	case CFG_LINUX_MODE:
+		for (i = 0; i < ARRAY_SIZE(touchpad_mode_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       touchpad_mode_text[i]);
+		}
+		break;
+	default:
+		return count;
+	}
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
 static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
@@ -666,9 +796,21 @@ struct gos_cfg_attr touchpad_enabled = { FEATURE_TOUCHPAD_ENABLE };
 LEGOS_DEVICE_ATTR_RW(touchpad_enabled, "enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(touchpad_enabled_index, "enabled_index");
 
+struct gos_cfg_attr touchpad_linux_mode = { CFG_LINUX_MODE };
+LEGOS_DEVICE_ATTR_RW(touchpad_linux_mode, "linux_mode", index, touchpad);
+static DEVICE_ATTR_RO_NAMED(touchpad_linux_mode_index, "linux_mode_index");
+
+struct gos_cfg_attr touchpad_windows_mode = { CFG_WINDOWS_MODE };
+LEGOS_DEVICE_ATTR_RW(touchpad_windows_mode, "windows_mode", index, touchpad);
+static DEVICE_ATTR_RO_NAMED(touchpad_windows_mode_index, "windows_mode_index");
+
 static struct attribute *legos_touchpad_attrs[] = {
 	&dev_attr_touchpad_enabled.attr,
 	&dev_attr_touchpad_enabled_index.attr,
+	&dev_attr_touchpad_linux_mode.attr,
+	&dev_attr_touchpad_linux_mode_index.attr,
+	&dev_attr_touchpad_windows_mode.attr,
+	&dev_attr_touchpad_windows_mode_index.attr,
 	NULL,
 };
 
-- 
2.51.2

