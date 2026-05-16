Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC52D8771
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778905730; cv=none; b=a2BFu+fM4jiUPNWHQK9Eyvxw+VTwOCTfjmXTInPPLNUUVsaABQA8ILMEO2o422k/4fw16JL6JRdVfqfu4El2zftFappJcsTBo5090V3cvWGVckPfK9TyJwMWKG0jhY5v6jXhwkoL4ivl8B3MYwrcg8WzmrjW+VIrp2KOibDcEwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778905730; c=relaxed/simple;
	bh=nZP70CZqE6bGso+DAuYlhVxWNj4z2V5mNKt4IKosrr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7i9twukIC00m0oo9O3T7Sf5Xgl5cXr+kyYbKeDgoEaAprmr8usEv+LVPmyrVo4GTWhe+d1Cyw/CHLBFhcK+rBpkSgAgiVV0zboZgQrpsUPzJRsdmHJod/0AC7eBpwTOHqTkkqjvtCGEb9KplP0f03r70LhEcG/+nRJHcnjbmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBlJu/8t; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBlJu/8t"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c19d23b19so672337c88.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778905728; x=1779510528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OrGi+YDYTzqbY19OULa0/WYU3URhHEW4PPAU5P3NWE=;
        b=LBlJu/8tQeayCRhnL2GCIy+nwYKpLvfCNC/WF0mJKTNmBXrItUSKtvZ2YDZBD4kJd0
         xRmWHaxNjFeCAWOsG2X3VFSnsRSZI8rRec/GEzPdzvUamgRQBqpwQ6N1AjHgyPLjjoRf
         tOLzAdKq5BK8qb+343UfQGinntw2oW16nMV2vwnZjpU7HU0dtkV7Af/gLBJqeSpvIGJg
         J8FG22XxYemWm/2IZGkbhCShKXv9g5fHayFa3AfH17eyy+4IrMw1yZF9QAaZTaDiu9SB
         xXDKPa3IpsJwLvOqucW3SWHEM6TBjf8OrVfhO3GFIvhBfSltSmR5rS1gQZ7PCFU79NCg
         gq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778905728; x=1779510528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+OrGi+YDYTzqbY19OULa0/WYU3URhHEW4PPAU5P3NWE=;
        b=s3JjdrYW3+UG/iASziusBJgGBguqlO6l/fFTHZSwx2St748hTGhBYFemig5+LwQjcw
         S9Qd6KL0ThJ7JT+w44L+aaYLzlhiMr3j5kalvIF27H7Bmxaly+SNG8+85Um6VXFMbaat
         wAS+QvjJqKL68Y07Q0rlmuo8jmfyxRMMcGWTlQL3dEpW6pR1ZypAzZkMKuOggT5rze61
         TWdrAKO6MZfNwa+9leEpS5V0A8ah0RAc/H525eWeY2byx7GmiL5yzMfwRAAggW50HcDB
         MajsZxWi5BKkyNT7NnvtvGIgMqFRPTvk2L725ysaaLs4TeysuQbxE0c4XyMTePfr6MTt
         wJyg==
X-Forwarded-Encrypted: i=1; AFNElJ+TuSpeDAU0FPvrkcfBv4JXzZw6jnKkibiHKp9qmD7muCXxc9LDToFiuHOjBZCtcWb/qsV2xgqqIps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBcE3FEfDuqv+ZN70TWcCuxpuY3yt3MezhJ0lMD7bzVDKfRYe
	uoPI8sOr91vBmqQL26c2JOeII04QC8Idb/C046So82M0bcTH8iRCwt78
X-Gm-Gg: Acq92OG6Vs3XkTS1p42IkvXBJQBoyvLhUfyKwgEUTw4VLovNy6grvjTsCJorlN6Au0G
	NQG8wosz3R4w8Z7laT6kIPE9rk8jLljlBfJKzPXCC0GpBTlmzyTo5LEXT6RHZYKFoGOD4NZ2YuT
	9bH250bsdMdiq7cMV+3OnX9nT1DqYviockX/BBDZI0qN1c/Nt8S2eIxr4MSna4Xic1HXyTb39H8
	kiW8XYNI5LIWt9rriB2I2WWZpAALNR9wbL9+74KJOXpj0FsO0/rJlX4QlSB7Xsb7dxHqH3c7aey
	TCNmSToN0lv0GGch9EipxuNZelq0yRB2pSBJSJiIBjhcKpKZ16J7Ftomy6yh0OFPACsFez5/xIw
	DRFVxfvXsMIjOjwnjIR9zG7zNfUgXHdl0XB1iI+2u0SvufDuvm+h8QUYuTB77vmsrZsEITVamlf
	m6mdAZDDyH4S79yFvVtNsaZllUKxoIiwk3mSSEcvmIuZjyx+kBp83AxNpqC+d4gwLGsJWNg9sSt
	tPMAkVtjpt6JKY=
X-Received: by 2002:a05:7022:2397:b0:12d:ed19:e6c6 with SMTP id a92af1059eb24-135048413a7mr3369751c88.31.1778905727772;
        Fri, 15 May 2026 21:28:47 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm13260185c88.7.2026.05.15.21.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 21:28:47 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Denis Benato <denis.benato@linux.dev>,
	Zhouwang Huang <honjow311@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] HID: hid-msi: Add Rumble Intensity Attributes
Date: Sat, 16 May 2026 04:28:41 +0000
Message-ID: <20260516042841.500299-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516042841.500299-1-derekjohn.clark@gmail.com>
References: <20260516042841.500299-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds intensity adjustment for the left and right rumble motors.

Claude was used during the reverse-engineering data gathering for this
feature done by Zhouwang Huang. As the code had already been affected,
I used Claude to create the initial framing for the feature, then did
manual cleanup of the _show and _store functions afterwards to fix bugs
and keep the coding style consistent. Claude was also used as an initial
reviewer of this patch.

Assisted-by: Claude:claude-sonnet-4-6
Co-developed-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v2:
  - Use pending_profile and sync to rom mutexes.
---
 drivers/hid/hid-msi.c | 151 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
index 8ea8f551b8e43..d4688caef296a 100644
--- a/drivers/hid/hid-msi.c
+++ b/drivers/hid/hid-msi.c
@@ -79,6 +79,8 @@ enum claw_profile_ack_pending {
 	CLAW_M1_PENDING,
 	CLAW_M2_PENDING,
 	CLAW_RGB_PENDING,
+	CLAW_RUMBLE_LEFT_PENDING,
+	CLAW_RUMBLE_RIGHT_PENDING,
 };
 
 enum claw_key_index {
@@ -234,6 +236,7 @@ static const struct {
 	{ 0xcc, "BTN_EXTRA" },
 	{ 0xcd, "REL_WHEEL_UP" },
 	{ 0xce, "REL_WHEEL_DOWN" },
+	{ 0xff, "DISABLED" },
 };
 
 enum claw_rgb_effect_index {
@@ -265,6 +268,11 @@ static const u16 button_mapping_addr_new[] = {
 static const u16 rgb_addr_old = 0x01fa;
 static const u16 rgb_addr_new = 0x024a;
 
+static const u16 rumble_addr[] = {
+	0x0022,  /* left  */
+	0x0023,  /* right */
+};
+
 struct claw_command_report {
 	u8 report_id;
 	u8 padding[2];
@@ -315,7 +323,10 @@ struct claw_drvdata {
 	enum claw_gamepad_mode_index gamepad_mode;
 	u8 m1_codes[CLAW_KEYS_MAX];
 	u8 m2_codes[CLAW_KEYS_MAX];
+	u8 rumble_intensity_right;
+	u8 rumble_intensity_left;
 	const u16 *bmap_addr;
+	bool rumble_support;
 	bool bmap_support;
 
 	/* RGB Variables */
@@ -400,6 +411,12 @@ static int claw_profile_event(struct claw_drvdata *drvdata, struct claw_command_
 			drvdata->led_mc.subled_info[2].intensity = frame->zone_data.zone[0].blue;
 		}
 
+		break;
+	case CLAW_RUMBLE_LEFT_PENDING:
+		drvdata->rumble_intensity_left = cmd_rep->data[4];
+		break;
+	case CLAW_RUMBLE_RIGHT_PENDING:
+		drvdata->rumble_intensity_right = cmd_rep->data[4];
 		break;
 	default:
 		dev_dbg(&drvdata->hdev->dev,
@@ -678,6 +695,9 @@ static const char *button_mapping_code_to_name(u8 code)
 {
 	int i;
 
+	if (code == 0xff)
+		return NULL;
+
 	for (i = 0; i < ARRAY_SIZE(claw_button_mapping_key_map); i++) {
 		if (claw_button_mapping_key_map[i].code == code)
 			return claw_button_mapping_key_map[i].name;
@@ -816,6 +836,126 @@ static ssize_t button_mapping_options_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(button_mapping_options);
 
+static ssize_t rumble_intensity_left_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	u8 data[] = { 0x01, (rumble_addr[0] >> 8) & 0xff, rumble_addr[0] & 0xff, 0x01, 0x00 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	u8 val;
+	int ret;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val > 100)
+		return -EINVAL;
+
+	data[4] = val;
+
+	guard(mutex)(&drvdata->rom_mutex);
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA,
+				    data, ARRAY_SIZE(data), 8);
+	if (ret)
+		return ret;
+
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM, NULL, 0, 8);
+	if (ret)
+		return ret;
+
+	drvdata->rumble_intensity_left = val;
+
+	return count;
+}
+
+static ssize_t rumble_intensity_left_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	u8 data[4] = { 0x01, (rumble_addr[0] >> 8) & 0xff, rumble_addr[0] & 0xff, 0x01 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	int ret;
+
+	guard(mutex)(&drvdata->profile_mutex);
+	drvdata->profile_pending = CLAW_RUMBLE_LEFT_PENDING;
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_READ_PROFILE, data,
+				    ARRAY_SIZE(data), 8);
+	if (ret) {
+		drvdata->profile_pending = CLAW_NO_PENDING;
+		return ret;
+	}
+
+	return sysfs_emit(buf, "%u\n", drvdata->rumble_intensity_left);
+}
+static DEVICE_ATTR_RW(rumble_intensity_left);
+
+static ssize_t rumble_intensity_right_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t count)
+{
+	u8 data[] = { 0x01, (rumble_addr[1] >> 8) & 0xff, rumble_addr[1] & 0xff, 0x01, 0x00 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	u8 val;
+	int ret;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val > 100)
+		return -EINVAL;
+
+	data[4] = val;
+
+	guard(mutex)(&drvdata->rom_mutex);
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA,
+				    data, ARRAY_SIZE(data), 8);
+	if (ret)
+		return ret;
+
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM, NULL, 0, 8);
+	if (ret)
+		return ret;
+
+	drvdata->rumble_intensity_right = val;
+
+	return count;
+}
+
+static ssize_t rumble_intensity_right_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	u8 data[4] = { 0x01, (rumble_addr[1] >> 8) & 0xff, rumble_addr[1] & 0xff, 0x01 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	int ret;
+
+	guard(mutex)(&drvdata->profile_mutex);
+	drvdata->profile_pending = CLAW_RUMBLE_RIGHT_PENDING;
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_READ_PROFILE, data,
+				    ARRAY_SIZE(data), 8);
+	if (ret) {
+		drvdata->profile_pending = CLAW_NO_PENDING;
+		return ret;
+	}
+
+	return sysfs_emit(buf, "%u\n", drvdata->rumble_intensity_right);
+}
+static DEVICE_ATTR_RW(rumble_intensity_right);
+
+static ssize_t rumble_intensity_range_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	return sysfs_emit(buf, "0-100\n");
+}
+static DEVICE_ATTR_RO(rumble_intensity_range);
+
 static umode_t claw_gamepad_attr_is_visible(struct kobject *kobj, struct attribute *attr,
 					    int n)
 {
@@ -836,6 +976,12 @@ static umode_t claw_gamepad_attr_is_visible(struct kobject *kobj, struct attribu
 	    attr == &dev_attr_reset.attr)
 		return attr->mode;
 
+	/* Hide rumble attrs if not supported */
+	if (attr == &dev_attr_rumble_intensity_left.attr ||
+	    attr == &dev_attr_rumble_intensity_right.attr ||
+	    attr == &dev_attr_rumble_intensity_range.attr)
+		return drvdata->rumble_support ? attr->mode : 0;
+
 	/* Hide button mapping attrs if it isn't supported */
 	return drvdata->bmap_support ? attr->mode : 0;
 }
@@ -849,6 +995,9 @@ static struct attribute *claw_gamepad_attrs[] = {
 	&dev_attr_mkeys_function.attr,
 	&dev_attr_mkeys_function_index.attr,
 	&dev_attr_reset.attr,
+	&dev_attr_rumble_intensity_left.attr,
+	&dev_attr_rumble_intensity_right.attr,
+	&dev_attr_rumble_intensity_range.attr,
 	NULL,
 };
 
@@ -1320,6 +1469,7 @@ static void claw_features_supported(struct claw_drvdata *drvdata)
 		drvdata->bmap_support = true;
 		if (minor >= 0x66) {
 			drvdata->bmap_addr = button_mapping_addr_new;
+			drvdata->rumble_support = true;
 			drvdata->rgb_addr = rgb_addr_new;
 		} else {
 			drvdata->bmap_addr = button_mapping_addr_old;
@@ -1331,6 +1481,7 @@ static void claw_features_supported(struct claw_drvdata *drvdata)
 	if ((major == 0x02 && minor >= 0x17) || major >= 0x03) {
 		drvdata->bmap_support = true;
 		drvdata->bmap_addr = button_mapping_addr_new;
+		drvdata->rumble_support = true;
 		drvdata->rgb_addr = rgb_addr_new;
 		return;
 	}
-- 
2.53.0

