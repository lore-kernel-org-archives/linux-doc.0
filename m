Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729A213E89
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 01:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219361; cv=none; b=JxprlAWWbaC1ny7v01zXA872qOXhlf+g+kZyAo4X1m65C8/mx+/1ZjHzuvTuUvNw/J1IiFxvWuPMviIe4532gKJO4UzowTbME6b15e3ME/TTKCw5u4piaL9ScDke7H5r+krNW++uutFPBWMrHBXfD7bVkVz7E8xFfKLImqtyI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219361; c=relaxed/simple;
	bh=qJuj4Ia+10TBltpyLI+g8S5XrF+MJ8/PTrYWRa/oqwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8sRM7k2iuWMZ1IFUe8VvePAsdXmIf2g53fprUyEUhxqKJEa6p8PV5j7eLX7mR9ADGDKLf+bti7weq0CBfMc2MnGYuT34ITg0Eew8e/iDsFaCNIS9+ItrNjNqhkOwUK8f1IDpr5LCbLP3B04lL6uLcRekyclPTxhlq2Dlc2AZ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5S716y2; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5S716y2"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so2863777eec.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 17:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769219359; x=1769824159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aZEaY+55AD/U4p/NVSCgdZ6HlJBX4UUvXfJ8P13h3Y=;
        b=F5S716y27XQ1v1g5YICN8DN0huiNAK7NM+DtdtSxC/IGyku+UfWHFHmFJ/roOLskvU
         jU0iRNK5WMc+gXk3qglwLy7URcpsdpCqV/BcUdxgCiaGIgTEHxWFPnoBkNl5Nvq2V3az
         aD21A3j4bhcnbBBUl/v0qzhqOeJkHFEHrmk19AdafkQuOH02saAUZ5LY618vLYYvg/v1
         ezzC8qUh0p48cLvDrhA+Rm9oAE2N3WkP/D/ewvO2btAT2NpPKA/yT8f47IZ8KQQCiAQq
         vw44vwavRnGs/YXJdbJyb/csgSBCV2L50GI3lI3+T/gWBvSeYdS++VvJI/7jmMIQTFOn
         vFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769219359; x=1769824159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0aZEaY+55AD/U4p/NVSCgdZ6HlJBX4UUvXfJ8P13h3Y=;
        b=dajTPO3I0UsFkZovaZJpwr9MAxNyYGatjEEb6Zja4VQOBDQ9XOM8p1ED10RCkoluft
         UH1MWTKI8WEgmwyD7Sz0/3ZuN0ZTLorgRUxfQBSFysGQnbBQzrmX+sKsbqerNHbVcE5g
         4wzoW0RzLO9wAQlaFZI5RBwLAnGxwziSic5gWtGnUPd2LQQd3WV3Qjo1OKE3LW4537K7
         U+eTmgwmSOP7r2txIeceAX5w2dfUq5QXKjylXvPXiVU8veKTlpUcv1Di56CRy6tv3D7W
         eUqK3vo9rSSuVqoAUHEhZe+Bg7YgEjlaxqelphKyJ2tCRMAn92a3xUD2hw0jEE0Iej7N
         qZ8g==
X-Forwarded-Encrypted: i=1; AJvYcCW0SbTm0YBWj4xMNyl/GknFJf65VgcqAQMQ3JvJAiwYZL1jn+CEnkReTAeTsaAEZdi81jAmTNjA6JM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznf3ctL+EPEfy+6VieQyI+8qUOyCmUxUEfV0ZxLhKOwTgQrAhP
	G4vRFk/4Q8Xls5mGNEVN7meyof4PLE7yW+3+T5Ub6SpREKuIGDVm1uKw
X-Gm-Gg: AZuq6aJe33bwzpHXOY2JrX9OmHASpNi6uJX2d+nCXuS51eq0iS2x47ByYzyLPTEIZnv
	KQ8htZM8hFgV5ziTKlZhu6zjdKwEj1pBiuo2C5Lz9V8Egx2foCOnKX6cBB6dHc01G35l4dyIITv
	0vWyVi6FcOLRLIwI+n5gxK4CLA+HWEYbDb0/ZXw+yZwL2mj/2Oq8bfvC/Mnu0CZONUta8sfAdmG
	sxC8HMRib8X5NDe6nSCta9etym2wxpPUmD2cI6sI0/LEu63Uy8aeqkzLW3+utQuarkU5JVGklg/
	4vTnwh/D1Z3CoQ/I+4bR2vIke4eIekzzBEsett9xBn3JK8x0rtUZzSIo0cqICdg6Thobp23NhJ1
	YgNRxWxRJ/jBlCq2/Pm4SsmDX4kQoGERhVt6zWRmK+cSLoqtOQqncIFAgfr/rLLEDqxQx4FFQZ9
	nk5UrPrdTdfV+qngRd528Shu2EVzbKRv2c3CPvk9kQ7f2EU3U5skyOaJIBQ2poovQ=
X-Received: by 2002:a05:7301:4586:b0:2b7:2fff:ed30 with SMTP id 5a478bee46e88-2b739b6cb22mr2614300eec.20.1769219358624;
        Fri, 23 Jan 2026 17:49:18 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5160014eec.29.2026.01.23.17.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:49:18 -0800 (PST)
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
Subject: [PATCH v3 08/16] HID: hid-lenovo-go: Add OS Mode Toggle
Date: Sat, 24 Jan 2026 01:48:59 +0000
Message-ID: <20260124014907.991265-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124014907.991265-1-derekjohn.clark@gmail.com>
References: <20260124014907.991265-1-derekjohn.clark@gmail.com>
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

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
V3:
 - Fix collision with os_mode_index attribute and os_mode_index enum.
---
 drivers/hid/hid-lenovo-go.c | 137 ++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 6326a559fa73..a09950874add 100644
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
@@ -1338,6 +1376,64 @@ static ssize_t calibrate_config_options(struct device *dev,
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
@@ -1704,6 +1800,9 @@ static DEVICE_ATTR_RO_NAMED(gamepad_rumble_intensity_index,
 static DEVICE_ATTR_RW(fps_mode_dpi);
 static DEVICE_ATTR_RO(fps_mode_dpi_index);
 
+static DEVICE_ATTR_RW(os_mode);
+static DEVICE_ATTR_RO(os_mode_index);
+
 static struct attribute *mcu_attrs[] = {
 	&dev_attr_fps_mode_dpi.attr,
 	&dev_attr_fps_mode_dpi_index.attr,
@@ -1712,6 +1811,8 @@ static struct attribute *mcu_attrs[] = {
 	&dev_attr_gamepad_mode_index.attr,
 	&dev_attr_gamepad_rumble_intensity.attr,
 	&dev_attr_gamepad_rumble_intensity_index.attr,
+	&dev_attr_os_mode.attr,
+	&dev_attr_os_mode_index.attr,
 	&dev_attr_reset_mcu.attr,
 	&dev_attr_version_firmware_mcu.attr,
 	&dev_attr_version_gen_mcu.attr,
@@ -2177,6 +2278,27 @@ static void hid_go_cfg_remove(struct hid_device *hdev)
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
@@ -2235,6 +2357,20 @@ static void hid_go_remove(struct hid_device *hdev)
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
@@ -2254,6 +2390,7 @@ static struct hid_driver hid_lenovo_go = {
 	.probe = hid_go_probe,
 	.remove = hid_go_remove,
 	.raw_event = hid_go_raw_event,
+	.reset_resume = hid_go_reset_resume,
 };
 module_hid_driver(hid_lenovo_go);
 
-- 
2.52.0

