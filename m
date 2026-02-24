Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D432927FB18
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896755; cv=none; b=NEq358LGNanDklcle57dVqooCKAHYxyMsMYmKMctjt4FOOsTeKSkl6vtywf9smPmk/bzrgID6iPGF3k+uwobykPbNNWJhA0sMG75LCgxnwdb171PU6Si78NfY7jhdqHg7Agxr9L15ZJAgMcaD9SjSjrzb6qxR8b47iGXs0/Jmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896755; c=relaxed/simple;
	bh=MJEBoLXx6kZaotyArkUmXw4t11kA39rfjHgA906xTGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWapQ90g50f61l7N0A1MzLQkLITqwltUz2xZ46lP8W2R9fYd2u3LCNAFTgLB+MfGb9TQU8XXzBtm7OgiDmY+xm3/CAI9kiXMxdH5yPsNxCrmAM1PFaH+EkY7CMnAtt8I27ZijlXIlORFLYIQ6M2aEZHGDt1zn/2dx6wrDSDzbqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMPVpN8l; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMPVpN8l"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba94dbf739so5433121eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896752; x=1772501552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQzl3yVDAN1730LcqI2ceRttYFMRQfPPEDz6M2H8l6E=;
        b=TMPVpN8lcCA97sOYW2SiFDRtxiyHz8xlOz8TKE/XBnJhU3QERUhXGwPQCIONmbxo6u
         2G4Wqj4Lj18qB8Mbm81WkZeEi8OMVQAgK6l4P24i6t1KDin8I9ji9isMUnDSY4hP4C32
         GxQf2hJnKT9VFqoxOz0cMpwbJAIzdLURGNnZpOucdztcZbvl4eqqfbzoeK6aeJp2XPtN
         hT45HRYKidGI8rFCHGjjFpOQTnLdAAnHC6QXjghP+LdY6+C58a3AZxeo0V9KKefhcXUv
         M7uvZvHyk6z3Rk5N2H06XbpGoNhAvI9YQhw373yMbo52HLqw/aj9ZIbtGaqEYJYICkVX
         0OqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896752; x=1772501552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQzl3yVDAN1730LcqI2ceRttYFMRQfPPEDz6M2H8l6E=;
        b=AmDet/kAa9b+C7hPJq/W0u0JHg2S78aGl3SX9b0F4QlnHmfSTPiJvig+jKupwYWL4S
         iMFQyXEkKFWs+qdp+H+JVGq6Pq/16XpM6lqvT2fceCErCgMUbwM/ht2VW9jK36dEFZFo
         Jrie4wX3y4kTth3VlDP2qzg1Xve7ieU3AOOQrrSK3ibGcIclYw3lxBCZmIsjsvgEsxVo
         a+4CPyFP1DrDvbef6EQD03K+t9vh/62CPTvyI4mPNS4+l+mVealCm0rKGRvSlRqvXygl
         6mu33qnM7AVT16uq0+wbe78ecl2ilAc6+N1lKSc3f/Vm9pamJxIhvosjb3UCALiYbsfM
         FG8g==
X-Forwarded-Encrypted: i=1; AJvYcCUeLryEVRjX2KI59Qop7P7K03gH/8cyjtUvbJuDOq2edB95WKm1LnbLYwC8xDS+x+WjEVLJ0iMIH9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNX2luVuwbpY6CzHI7nqdVBwd1fWLq7JYbNFz2GX+DBGWmC+q2
	ZRxNGb9OOwzPkxUxhbmh/D/zutA7RCV3UzkLLNBoGa/jymAAvou4HQfT
X-Gm-Gg: ATEYQzzoCnvJf7rMwzxIZVDXike8rA+E4IfNZRuatK1RI67QiVAggur0Rg2WjJb9kT3
	rqnueFPLHVhcSw4tlvu/TmbRT8iVubMjfOqcZJ+DLlpOGLc83FgUSl5pbAY30+9B73jhF7m0OkL
	efvls2TuCrywf7hPxrQiHxbiyBx2m+xN22l7L5Sy5uYYtR6XjWlK/Xcasyk560yGXVawqykB0lI
	shPZwi7gcwSYyUbnviSWr+NwKoU+tNNyE7FoMsUBJYoXXZ6kt8PCsRWfqxeCdqaYLoOgztGdSQ7
	gEQICt68JT54i0sSo28zn6v+xJkEqpie6CMheSwTnTFmmZKa6V6NxQPb2LK2qJT3AdRigBJ2tQB
	1BlnPIlqJFviXkcLlUWUQjSPFcHbhAbmAONYW1O9vL638J9JxAhmhfvG1Z9FPpul3SEUYp+XA2Z
	5fqLzTkKWX7ApHMRc07Tr6JqMqUszCfqX2VmQ6+KN0eglVvlLTvWMFu9yJEN8WjLZVh5kbJ9fiy
	XY=
X-Received: by 2002:a05:693c:2c0a:b0:2ab:8ef5:df2 with SMTP id 5a478bee46e88-2bd7bd59af3mr4703596eec.35.1771896752005;
        Mon, 23 Feb 2026 17:32:32 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm6485015eec.9.2026.02.23.17.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:32:31 -0800 (PST)
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
Subject: [PATCH v5 13/16] HID: hid-lenovo-go-s: Add Touchpad Mode Attributes
Date: Tue, 24 Feb 2026 01:32:14 +0000
Message-ID: <20260224013217.1363996-14-derekjohn.clark@gmail.com>
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

Adds attributes for managing the touchpad operating modes.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 142 ++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 423b64cd02902..02d4e6548285e 100644
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
@@ -533,6 +574,95 @@ static ssize_t gamepad_property_options(struct device *dev,
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
@@ -662,9 +792,21 @@ struct gos_cfg_attr touchpad_enabled = { FEATURE_TOUCHPAD_ENABLE };
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
2.52.0

