Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9933AE6EE
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 22:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779143385; cv=none; b=iRKGtT+4P8ju6XC5yFhBfGHBqpWALxww8lqyRi9pGNzOfAGyrVLVcb5cBb1jipvYQ40BV7OWxYLlC81MMtvTPUyNQAHNnzIlqz0M1/A1qlemTnGh8a4yVPEB2UWXxaf0/oee09lazq6IXODR6rp30fP7tJm6NQba0l2pKFhNh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779143385; c=relaxed/simple;
	bh=ATIJkJpw6FNG542B7coh18izn9jy2d6IcrFe1PXuySg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhoPVV25ZPtD68n0Fwa8rbLcRBazURFMDHAfrhqiYAZQx5nXMdAwOMD1BDQJMlE9X2aGTWpPMSWcBAzAjYn0Rs0P5xCbxzrNc5jOElfw/IaQzf+0oEOf/jovObYyzIfW07JyYaDkHMtKMKU2r09vI8W3KLKIbYFs1wX9Qkkagts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq6Ed8Rd; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq6Ed8Rd"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so10684110eec.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 15:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779143383; x=1779748183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBHGd6RpXFsgzhD8maiZ0ZUzNdvAB0Ntl39qTre2IF0=;
        b=Iq6Ed8RdRHZXS/I8DzUOmL36+Yr/qYwDSwoAa6h286fE/EPQ2A6pxY2Bg9rdnCY/V7
         HSqb2RqZq98PEE7si44HXO7szlQGLhlce9eJU4H9OtXZpcNCNkFSTrb3WUES3pGxb3cy
         NmjZ3B9t4zpxXFryiCx40BPW4Oyi+9JBirEFlqJTjHQovh4FdJxmcUkcgXPPREXTDC2r
         16BFzZ6VK8J4ep1opRuh30ya+J/Tp5nqowf2nDdiQMM/JuY+Zdffhdcv02yd1TJYiEDq
         F1Qfic81pl4s/qXChE6b8XcMLvNFw2gwdi+IEY/hFFikhsh4qgk9xMVWLdwqzKLj9tcd
         rLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779143383; x=1779748183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBHGd6RpXFsgzhD8maiZ0ZUzNdvAB0Ntl39qTre2IF0=;
        b=qK1KOiimFUX+mIw+iCipTm3wufRnKZexniTdPswhfQTu7Xf8D3slRVszwXhmicwRwB
         rDupa35n3ramTAHVdEh7O+5VI1H5FVLxMHLm/qi8TisXuph0cEJzaFwlC7LH2nQfkj5a
         fDOaxJM26HNy1nJBBs8oVZgunM7FadSqZANJ6d+QCNEhIOUMXipnR2UASSB3fACbXBD+
         8PHic9zXh5JFOTGz0IupIsa/9BPMqyFwRhroG9Pr0WmwD7qSNPM9c92KWGWM0537+05i
         P4V0+PSBy6s/QG0gp5SYdj6Wtzl5sI8efg9X5pLU5EbbDCi9gOeMSiQlhfgQX/+zWOIJ
         HZlw==
X-Forwarded-Encrypted: i=1; AFNElJ+2j4W8zvzDNL5E8DlfCm+I2vhXZBbp1uMINBMUhCb8NnpYdUOmKvCKbCqioNFK8AtP5sMOmc7E9Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLwO35UTciwX0n3YC6/cqW+KE9vibzW81KZqAMS1zq669Io0D4
	WelMMDdDgAvKfu/vuhPIYCUAxLQMt50oAAz4NHy/sUrQwsGsfnNuvt6R
X-Gm-Gg: Acq92OEyo4AIhrYVc6pSoRB4ErayjXCkTwkEkHU/ylZaM6KLiUpx6lV23xWxR2PoBjG
	5Q7yrxFRrtQTsc3ZUM7Fa0lRrFLJIC4nDIv3xWR4krAaIZ5Y6zf5EWGcvWFcGwBaZ7Spe6qlvz0
	Jfpn9oelpyyOk8Az+y9UAx0+l/H55iGA3DrQQ+b1EmAqUgF9r2Kunj/QHq3cSgQ0X/teq3YZYLi
	RT3EU3m7RcjTgIBiuQgJ99cj7gKEd5wPcUKWD+XwDN613o9OOFryNJN7Z0tgfzrR5f4TqOLu2Ji
	hj+f6jLIfBRQLg41pHCGAu4A/8ikBBbhemgupjPdNTXtK1lYOzHs8q1/CvLXwTBFVMWrI9+yO7P
	WChf1Gp3aAjiT6gIzyXlS70RB/qEmcLwc0CLbl/5fKlGA916Qyk7AnZogCZUYl9DePnRX8Uimz6
	2MXagmhGxEU7AdChXV57If0peSeP22znGIiP0cHy7QnrCnB537Nc7q76tyimQ6KzHjgXLUaJ4TP
	6sd
X-Received: by 2002:a05:7301:2f85:b0:2ea:ed7c:912f with SMTP id 5a478bee46e88-303986a1430mr8039362eec.27.1779143382715;
        Mon, 18 May 2026 15:29:42 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc464sm15797095eec.14.2026.05.18.15.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:29:42 -0700 (PDT)
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
Subject: [PATCH v6 4/4] HID: hid-msi: Add Rumble Intensity Attributes
Date: Mon, 18 May 2026 22:29:35 +0000
Message-ID: <20260518222935.1802071-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518222935.1802071-1-derekjohn.clark@gmail.com>
References: <20260518222935.1802071-1-derekjohn.clark@gmail.com>
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
v6:
  - Make all timeouts 25ms to ensure at least 2 jiffies in a 100Hz
    config.
  - Add spinlock_irqsave for read/write access on rumble_intensity
    variables.
  - Gate all attribute show/store functions with gamepad_registered.
v5:
  - Remove mkey related changes.
v2:
  - Use pending_profile and sync to rom mutexes.
---
 drivers/hid/hid-msi.c | 167 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
index 4d267b896da72..339f256b60dbe 100644
--- a/drivers/hid/hid-msi.c
+++ b/drivers/hid/hid-msi.c
@@ -78,6 +78,8 @@ enum claw_profile_ack_pending {
 	CLAW_M1_PENDING,
 	CLAW_M2_PENDING,
 	CLAW_RGB_PENDING,
+	CLAW_RUMBLE_LEFT_PENDING,
+	CLAW_RUMBLE_RIGHT_PENDING,
 };
 
 enum claw_key_index {
@@ -265,6 +267,11 @@ static const u16 button_mapping_addr_new[] = {
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
@@ -317,9 +324,13 @@ struct claw_drvdata {
 	enum claw_gamepad_mode_index gamepad_mode;
 	u8 m1_codes[CLAW_KEYS_MAX];
 	u8 m2_codes[CLAW_KEYS_MAX];
+	u8 rumble_intensity_right;
+	u8 rumble_intensity_left;
 	bool gamepad_registered;
+	spinlock_t rumble_lock; /* lock for rumble_intensity read/write */
 	spinlock_t mode_lock; /* Lock for mode data read/write */
 	const u16 *bmap_addr;
+	bool rumble_support;
 	bool bmap_support;
 
 	/* RGB Variables */
@@ -409,6 +420,14 @@ static int claw_profile_event(struct claw_drvdata *drvdata, struct claw_command_
 		}
 
 		break;
+	case CLAW_RUMBLE_LEFT_PENDING:
+		scoped_guard(spinlock_irqsave, &drvdata->rumble_lock)
+			drvdata->rumble_intensity_left = cmd_rep->data[4];
+		break;
+	case CLAW_RUMBLE_RIGHT_PENDING:
+		scoped_guard(spinlock_irqsave, &drvdata->rumble_lock)
+			drvdata->rumble_intensity_right = cmd_rep->data[4];
+		break;
 	default:
 		dev_dbg(&drvdata->hdev->dev,
 			"Got profile event without changes pending from command: %x\n",
@@ -882,6 +901,142 @@ static ssize_t button_mapping_options_show(struct device *dev,
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
+	if (!drvdata->gamepad_registered)
+		return -ENODEV;
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
+				    data, ARRAY_SIZE(data), 25);
+	if (ret)
+		return ret;
+
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM, NULL, 0, 25);
+	if (ret)
+		return ret;
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
+	u8 val;
+
+	if (!drvdata->gamepad_registered)
+		return -ENODEV;
+
+	guard(mutex)(&drvdata->profile_mutex);
+	drvdata->profile_pending = CLAW_RUMBLE_LEFT_PENDING;
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_READ_PROFILE, data,
+				    ARRAY_SIZE(data), 25);
+	if (ret) {
+		drvdata->profile_pending = CLAW_NO_PENDING;
+		return ret;
+	}
+
+	scoped_guard(spinlock_irqsave, &drvdata->rumble_lock)
+		val = drvdata->rumble_intensity_left;
+
+	return sysfs_emit(buf, "%u\n", val);
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
+	if (!drvdata->gamepad_registered)
+		return -ENODEV;
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
+				    data, ARRAY_SIZE(data), 25);
+	if (ret)
+		return ret;
+
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM, NULL, 0, 25);
+	if (ret)
+		return ret;
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
+	u8 val;
+
+	if (!drvdata->gamepad_registered)
+		return -ENODEV;
+
+	guard(mutex)(&drvdata->profile_mutex);
+	drvdata->profile_pending = CLAW_RUMBLE_RIGHT_PENDING;
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_READ_PROFILE, data,
+				    ARRAY_SIZE(data), 25);
+	if (ret) {
+		drvdata->profile_pending = CLAW_NO_PENDING;
+		return ret;
+	}
+
+	scoped_guard(spinlock_irqsave, &drvdata->rumble_lock)
+		val = drvdata->rumble_intensity_right;
+
+	return sysfs_emit(buf, "%u\n", val);
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
@@ -902,6 +1057,12 @@ static umode_t claw_gamepad_attr_is_visible(struct kobject *kobj, struct attribu
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
@@ -915,6 +1076,9 @@ static struct attribute *claw_gamepad_attrs[] = {
 	&dev_attr_mkeys_function.attr,
 	&dev_attr_mkeys_function_index.attr,
 	&dev_attr_reset.attr,
+	&dev_attr_rumble_intensity_left.attr,
+	&dev_attr_rumble_intensity_right.attr,
+	&dev_attr_rumble_intensity_range.attr,
 	NULL,
 };
 
@@ -1430,6 +1594,7 @@ static void claw_features_supported(struct claw_drvdata *drvdata)
 		drvdata->bmap_support = true;
 		if (minor >= 0x66) {
 			drvdata->bmap_addr = button_mapping_addr_new;
+			drvdata->rumble_support = true;
 			drvdata->rgb_addr = rgb_addr_new;
 		} else {
 			drvdata->bmap_addr = button_mapping_addr_old;
@@ -1441,6 +1606,7 @@ static void claw_features_supported(struct claw_drvdata *drvdata)
 	if ((major == 0x02 && minor >= 0x17) || major >= 0x03) {
 		drvdata->bmap_support = true;
 		drvdata->bmap_addr = button_mapping_addr_new;
+		drvdata->rumble_support = true;
 		drvdata->rgb_addr = rgb_addr_new;
 		return;
 	}
@@ -1488,6 +1654,7 @@ static int claw_probe(struct hid_device *hdev, u8 ep)
 	spin_lock_init(&drvdata->cmd_lock);
 	spin_lock_init(&drvdata->mode_lock);
 	spin_lock_init(&drvdata->frame_lock);
+	spin_lock_init(&drvdata->rumble_lock);
 	init_completion(&drvdata->send_cmd_complete);
 	INIT_DELAYED_WORK(&drvdata->cfg_resume, &cfg_resume_fn);
 	INIT_DELAYED_WORK(&drvdata->cfg_setup, &cfg_setup_fn);
-- 
2.53.0

