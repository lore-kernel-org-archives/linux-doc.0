Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427841B345
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127796; cv=none; b=pD+8CqqwgyT8fGjZ3RBVY5MaQrtg4pEP1GInQOEQIX5if/4vgWjUHY9zIuz/RVU8h7CgIXs7JAIxJynyHkaKA4cnYGbmM0axhu8so63XUcy+/RRSHZJgEHUHh9OFVuPgQ4M5JSSK/fyF3FQssRRhLAfrEx2SEtreUXhM2LcGmow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127796; c=relaxed/simple;
	bh=k8Z4PJ0jlhce1UF3Xo+dF+DpVA4UIZlzE5bAxI0XUjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kh+NHK5fWgrIonXgotgBVp7z548LMwmj0LoopYJGUocTH8nikKY6JuRpuuOmypZL/G7Nhn3RqpmYOgKU8SUOK/wQLqlG/xfIQaYj6ReKKZFx9om0xDzoWn1aliT90aC+/6v9ljTHha4I8oZniMjAFeJpYj6FgcLJbhcKf0R8N0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBkF2sKH; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBkF2sKH"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be19f05d7dso759573eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127794; x=1773732594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+/BdiVbU7ju/RLkpeD6wzKfiL0bcAcvC588TQS18Ao=;
        b=BBkF2sKHFYIVwzC1kXkqVY7aVv7tG7Qp2J7v/RQ+5LsLCW3MgARSL0wwxdN9xIOC+j
         rwDDd2tW87ZIyPrnh+gjZedcNmfSaKJ7tnOk+hmUZX9c48ZnlfIZBpwbXclotHAeRPZ6
         as6tczJhxBzOPBsJXNOUZXYeBVuYNOfMJm6DFAv67S1wdgox1mKa1CoHxEuftcUWOXr6
         yyQTneJIN0jC2wQ75gyrfhGwijTU78w/UehlI/tEScOQYG3Agz7SFZgCuKCRq+gqsnmV
         YBrmvbqvuNeXTSralm9QqReXrD1+l7pg8ueW7IiYnO4m5B+hovQq9Uf0i6nLCWUENfcX
         oTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127794; x=1773732594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+/BdiVbU7ju/RLkpeD6wzKfiL0bcAcvC588TQS18Ao=;
        b=rT6r/fXEpdg02CEFw3icWRUSf9MkeaAVfo9RcdvWJH7p1YLMUnVfWZ60L56VZGQ+/H
         Gmmo+mKNDUzZq5TDS4jEJ/85/5OZ01SOPhpyXshYHu6A21pOUjn6tw831X0NU58mUKJx
         9tRy1k9MgJ0j2NfVVnBaeN+uSS5MIjoVFatPPS+ikC2mD667zaaI0KYggK7ggGFQN41b
         d+yQAvbBjbA4XHUsQ9/BRodzyxZSdWaQlBw5y0ZCkFWc3z7Qsql9Nv7ROiIXAyqC9u9I
         rSVoSh4p6eSMB/va3U/qIRoyU2ZbzSk9W65JdtgceCPA8/2lc8AnsB38gz9Onwv0hpVv
         QFyw==
X-Forwarded-Encrypted: i=1; AJvYcCXoBGLWA09VYVsXGuIxiJ3yNWaGOR52rRkYNAXbFC6DobXYbVzkPjelpqUVQK2/A4xXV65CIVWACqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YykqfUFEujoJUB/qI8fjQv2we5kH0KJpsHuMSuy3pE/JhnMAyWK
	KZWh2LBThinF5aqNQ4cbwYk8S39SOicZNYFinkH9bmnm6oV+G6oNir+Q
X-Gm-Gg: ATEYQzx6u1tBzV3LvSFjEkTUigRfo8xq7Zj5+a7FigqfUW/ovAzw2MRTo5SgEPhZtlc
	jTpYEGBFt7AvoTfOkybEJKS2PZGqsJClWwyVQv4AshvFo7d/aev9xLhQY/E/Jg0oNPrIfxNZm4m
	s8Ybba1VgVZLcqp1yedPAqszS6Ei4vu7yzZEyeHjWJHDS0fkgO60O8g4/ejg1MhqR0CalkvH5X3
	zWHY2VzjcQV3In6ATav5ZpMU65pfEJ6d+/c18MyeFAeVNAamqWHPZ0rQtBnrP1nR40782Qig+Jr
	8jK4K4F9yUWPdhR+Yhnot1F/H6QZEIykDEk07NG1Z3BZAcIxLbfhXKkXa2owPjWEFkWwdMafa1B
	H0GbHZ1wmES+RhLaCwklNV2MyvpKT71eFfHUA4BVR2ga1LydorQG+zGmQ3JnfTyqm+YMQCnjV/l
	tPTrkK4FK3VD/ta86KLLN2SBsx6cVkMy5NozPOk1P9W+7wdETEx5tN9ss8efIjpSwLmV45+m8XD
	n/lPuaAsgl8MpI=
X-Received: by 2002:a05:7300:bc97:b0:2ba:956e:d26a with SMTP id 5a478bee46e88-2be4e06797fmr5706856eec.36.1773127793959;
        Tue, 10 Mar 2026 00:29:53 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be81209142sm721925eec.12.2026.03.10.00.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:29:53 -0700 (PDT)
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
Subject: [PATCH v6 13/19] HID: hid-lenovo-go-s: Add Touchpad Mode Attributes
Date: Tue, 10 Mar 2026 07:29:31 +0000
Message-ID: <20260310072937.3295875-14-derekjohn.clark@gmail.com>
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

Adds attributes for managing the touchpad operating modes.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v6:
  - Make local attributes static.
  - Use NULL instead of 0 in mcu_propery_out when there is no data.
---
 drivers/hid/hid-lenovo-go-s.c | 142 ++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 97c572cfe66c..5899cabe950f 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -47,6 +47,8 @@ static struct hid_gos_cfg {
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
@@ -530,6 +571,95 @@ static ssize_t gamepad_property_options(struct device *dev,
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
+	ret = mcu_property_out(drvdata.hdev, GET_TP_PARAM, index, NULL, 0);
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
@@ -659,9 +789,21 @@ static struct gos_cfg_attr touchpad_enabled = { FEATURE_TOUCHPAD_ENABLE };
 LEGOS_DEVICE_ATTR_RW(touchpad_enabled, "enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(touchpad_enabled_index, "enabled_index");
 
+static struct gos_cfg_attr touchpad_linux_mode = { CFG_LINUX_MODE };
+LEGOS_DEVICE_ATTR_RW(touchpad_linux_mode, "linux_mode", index, touchpad);
+static DEVICE_ATTR_RO_NAMED(touchpad_linux_mode_index, "linux_mode_index");
+
+static struct gos_cfg_attr touchpad_windows_mode = { CFG_WINDOWS_MODE };
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
2.53.0

