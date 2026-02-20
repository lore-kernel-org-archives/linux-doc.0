Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C7E333429
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571172; cv=none; b=ADEffmMJ10PJuRPKq0BTZ6m9WlFJaJepz4xcaeNVNmkfX3GjQvo2qxx/bWFbWtDgWuuzHqzH/uStcJhqRoqJBsiMb85hfS1PdaleLR+VjAPfzSAOx7KX7Ka7MN2TP6BcTnVJyQvkTxgAdR42UQrAC12sfnR0u2YA3C3zlSpVv+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571172; c=relaxed/simple;
	bh=+9MUdfhqu4ktA5Ox0Yc+kI51uVbupxo1vtKU3v8emIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7avKjEXemSgLKbaW1+q3S/3KPNvFfEm2ur/yHCbI94/fdno8csTVn2FihmMTPb8Bmv+WzTHimBqro3sbCHR+9yw5c3l5IO7L4cmx7Q0ZbtMurtzN+mzchI3rntnO7huf8yYhQ37cWO880FK828grt437LqTvI87I3mK1JOdL5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7Mn2u11; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7Mn2u11"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso3447003eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 23:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771571168; x=1772175968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JJ4rxkXT2eVFW1PcohwFIvZsKZ0n8nS1xGcCEWCiXQ=;
        b=i7Mn2u117e6v9M06ns1o2b5mOPBMdbR0TN5FJnfiFiun8gTb/AAsu46X+9kj8rd/H+
         phi23H83yh/toFmKWLFBLSUCPjWGhOS4+swRytt2QmFhij3HPF7H6bRKrW33UNx6LirB
         2064/vTczPjECO7bIxduWeBkKRDcfVSwJFi8VIqlMxz9iXEUYT8uYANz4nNmp0oSyASl
         J/TwVG08VH6FFcaMWnJGLrESwKe/NcEVZYIta9psKoeQnRzLzwgOwcXUO1URKnxnNS/j
         7Si+C7nZopS70N2ZCOolmexc8w7nJTWzp40rm9VTYkLl5i86BzEeZF0Ljy4CIUoCQ+qV
         YR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571168; x=1772175968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9JJ4rxkXT2eVFW1PcohwFIvZsKZ0n8nS1xGcCEWCiXQ=;
        b=nBIvKY4V/y/NiHmY76hwdOzdtwMUkX6hG05eb/sAij/3RtnCNRVAGL36dqWLaKFEs1
         gFH43WPn+5bqQ+8HOtaMJDTaQVnpZsOUA/wUvAjDlMPhV41J0S2AnyFA6XMVrgZhhyzU
         JG6ulUPQFk/O3txEArgPZKK7y4iQUlRrnh0aJq0sX2sDqJ87WAWTgk3NNzcxHixMOS5c
         sU1v5FJilW6FFTwExKECtX51u29bNEQn+TLMPDBiCv0+l6wmUNsiAiTqHxpuY+8mDoIj
         w5VMKIYM4BYmuvTM+82P/PSPmE1qrylBmvym7O1Hb76gm8Jh6GWY0vqqi/9WU52rViLL
         sAuw==
X-Forwarded-Encrypted: i=1; AJvYcCUuKbnhtu8jLf17OqxfgfSFuKhq4hi4sA+weKwk55o7khDgGswtAYVYMKJbH4SRJOlqFxsfSxATHHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylY1LDzrzBHDmb6dlonX8pjnlBKsLxQUhImdH3wlTFhWN2mLWv
	ngKHa2mloRDgLAyZ0eBhEpE3hntqGqfz2bXDqgnwmz/7+9d/2tXJdDqN
X-Gm-Gg: AZuq6aLF3s2EG741f+3p1lzfugTpiy7kO08WOLAU5MaRVMXMAU3mJk713FZrakFt08k
	PvkAX9GxYa++jOBLvsApe4GY+rHynup15HEp+FpAcZpnD5PFqZgZxXMTHE0vf1biZjeiq43PEXl
	ULwgD4Jm6FCdrh5qChLT3xte3h3lgyaWJDqBM7P/TGDvWA2GRoAd4i6fSLtJw5w8WjICwGBoc2S
	uaNk1Lw4e1P+G9da18YqRqbulPGm9bxc/Sk0ZkGUgXnOSiwKb3u7lnaJs1tCotIb5q1Z8BEmmW5
	9eRCvAYpPvoDoX6vQTfNuMWgvPkv9V8OkV2OBpqX8r4SQWXGGG1pNOadv0Kag3ukz/GL2kKPADS
	V2r45C+4imS3pQhsFIsr+X2pUfdaUlGIvFvm57LEYUxm0sKwUS35bDPIABsCsufAV5+lLIy2Obo
	DX3cbGIYGiH/VT2uPLET/KAI5V/DdSMXYkeagNrhw0CL/tYyrb4x4VdFgZMP1htgqW9BdQR2TK7
	7c=
X-Received: by 2002:a05:693c:2c06:b0:2ba:ae6f:8149 with SMTP id 5a478bee46e88-2bd73359090mr294413eec.16.1771571168487;
        Thu, 19 Feb 2026 23:06:08 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb669f7dsm22163335eec.23.2026.02.19.23.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:06:08 -0800 (PST)
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
Subject: [PATCH v4 13/16] HID: hid-lenovo-go-s: Add Touchpad Mode Attributes
Date: Fri, 20 Feb 2026 07:05:26 +0000
Message-ID: <20260220070533.4083667-14-derekjohn.clark@gmail.com>
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

Adds attributes for managing the touchpad operating modes.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 142 ++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 9595994ce1bf9..92ee2602273af 100644
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
@@ -538,6 +579,95 @@ static ssize_t gamepad_property_options(struct device *dev,
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
@@ -667,9 +797,21 @@ struct gos_cfg_attr touchpad_enabled = { FEATURE_TOUCHPAD_ENABLE };
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

