Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2910222A4E1
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219365; cv=none; b=o3EMsWv9jZPARftaMUFskGpHEoa8WDuY4aA8ewwpKwvBJVydRd90/Agrry9EBiXI6IcEQBh6+RBQBPxQSTdAhhezQroJ81R2JOmMIex8pF4v8Y7SPoR6ANnrllFQDgjXKm74BpmHVDIqfsWXJSkLRjZ8Lu6jCxQ3n+0f0j7HnNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219365; c=relaxed/simple;
	bh=GPHNlP+i5kClaBF8b/aV82UQxUbAdS3uGeajNgNkvow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcZCuvttIO2tG7InqaMW8LQmqy/gyT/W0MFC3iI2Tp2mHGYJBIBfZKd5VK8PIRlvdWpSadkrA6r0HE3ZW3LLTsfqznGGZA3+pqaqSnP12DITsEv2aBdpjKynKsKo61fSnnlTQaIcWjq3DfyBbwS0Io/lqV+IOTBcFkqEy4ZZfEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCMosbFC; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCMosbFC"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4540809eec.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 17:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769219361; x=1769824161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwMqD/JxDTChJj/0URSAhzNpbthbnAQ4R2LI3Lm7E3I=;
        b=UCMosbFC3PJrkCtmElMkJgYUuPeqOXE9jvyFlGzhrhWDU4Fb5u4jNITGSfUnfiEpcG
         qSFoADjj/eAG46BEfsQhzBuGAmrSEEgu3OY/AJdBUOAv2PDUncaLgfFCoptutvXr8P4f
         +W1p/SvQG5K4xsh+kNIfXOjTjq6AZsNL5UuOXOjWgN2qOGLTI3YiD5y7gp+gq4nbtPob
         7kz9J+ORu+L/ApobSEYAc63LJsOveEQ4h5FawavEzEfzrB2/ZUx1RLZkvnIXFlHvYX1I
         e3wNXVqSKf8kbeZb7FlU5HI8oMRLQ1o7vGwedxaXGOi7UKYtch8pMMBZ7SXh0HJmkQPv
         AyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769219361; x=1769824161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AwMqD/JxDTChJj/0URSAhzNpbthbnAQ4R2LI3Lm7E3I=;
        b=swIWOQnrpKemYqjLLnYr+I0AT3VI93C7g5dIRgDF2oEtFltT4JmPSxJVz54EbdTRRm
         c7xpSjm02ZsIiF36xSmCxL2ZEr8aRy3zvhZ3Ip6XDlTo3A2AdTGCCAi6YtIZ9j4mbUtd
         ZkAO7ILa9LXWOd0lSWIqMyDgWcaD5h+vDdSsMP5iWqmV14jaCtSdlhZIdldtVFGs3D5r
         +2+D4HMJ1Z9z5Jx3uzTfdthzoDWwOPLl60iWOvjUDPfE3telrY4rh1dfJ5qVEOwm7CPr
         4GmV39Eg1B9HRd667fFoL16v0kxclVWcN9it82ppOkxbPGNI0Xx672LZC8j6eNcMnQqd
         Jd7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXm/QovOkpQOTuSVVe9vlmtIGuFYHyXUmrnJ/5UqP3SvUCR6YeM/IIwQRBp8PmOe1EQqjHCt9T0Ryo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT6x+rcTpIQRwdCZwH9qdZflgb2WPWxRhCpCKzDP5zkrquNX+c
	gfZDVFZGJqnRbemQFZ6qI+PdoJG4ofHCz/DabJWpt55Tp3WPzyssL6ycyZxndg==
X-Gm-Gg: AZuq6aLrHoL8mUY2TyFMo80n3plpG/MSig6wtUB9HawMgJ0HL7IXyZYjmt6dmmGgQOl
	+vzJwr64tscvy9e8dgAXreKh11zbf+HYlj1jOxGFRYqQ8a9rOPiE4OgddzDuXs/63hermMx09vO
	Db30IiwQR2bAQPjDxRnqL/i+vIQXtxG9ldvmwObExJVnQZNTgAWIlVWS4tGqmBh1JM+jq0Q13pT
	h/47KKHkElRC6LQx3NaAFe18KolWoYIkuEKLmjbMo6lhBnH1xpJ9cCCEaLC9HEKz5crHQ/qw+lD
	KbHX5ZoLQ8SxahwR5x6FSpaalbqVorgs52ziF9zUw6p86TzzQXU7Vw6D/w8wJ1O1SkfZrOwHMk9
	RQcjodJIxu/f57IyZdcFud5qbJAOFV+y1/UNGOPXA9kxGJ3YKp2qLMGHXMITPEfskwY+9dsbD0g
	HTJj93GlrI/R/1/GHOBrvk6mPfRUmA0ICrGxMrkuq4bPDKIq18pbjLdeOs4MTYgM8=
X-Received: by 2002:a05:7300:80c2:b0:2b4:706d:4e23 with SMTP id 5a478bee46e88-2b7397aa1c7mr2039019eec.0.1769219360957;
        Fri, 23 Jan 2026 17:49:20 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5160014eec.29.2026.01.23.17.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:49:20 -0800 (PST)
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
Subject: [PATCH v3 11/16] HID: hid-lenovo-go-s: Add MCU ID Attribute
Date: Sat, 24 Jan 2026 01:49:02 +0000
Message-ID: <20260124014907.991265-12-derekjohn.clark@gmail.com>
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

Adds command to probe for the MCU ID of the Lenovo Legion Go S
Controller and assign it to a device attribute.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 3e9041e746df..36cee6c3d4cc 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/string.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
 #include <linux/usb.h>
@@ -34,8 +35,13 @@ struct hid_gos_cfg {
 	struct completion send_cmd_complete;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
+	u8 mcu_id[12];
 } drvdata;
 
+struct gos_cfg_attr {
+	u8 index;
+};
+
 struct command_report {
 	u8 cmd;
 	u8 sub_cmd;
@@ -70,6 +76,14 @@ static int hid_gos_version_event(u8 *data)
 	return 0;
 }
 
+static int hid_gos_mcu_id_event(struct command_report *cmd_rep)
+{
+	drvdata.mcu_id[0] = cmd_rep->sub_cmd;
+	memcpy(&drvdata.mcu_id[1], cmd_rep->data, 11);
+
+	return 0;
+}
+
 static u8 get_endpoint_address(struct hid_device *hdev)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
@@ -103,6 +117,9 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_VERSION:
 		ret = hid_gos_version_event(data);
 		break;
+	case GET_MCU_ID:
+		ret = hid_gos_mcu_id_event(cmd_rep);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -160,10 +177,41 @@ static int mcu_property_out(struct hid_device *hdev, u8 command, u8 index,
 	return ret;
 }
 
+static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return sysfs_emit(buf, "%*phN\n", 12, &drvdata.mcu_id);
+}
+
+/* MCU */
+static DEVICE_ATTR_RO(mcu_id);
+
+static struct attribute *legos_mcu_attrs[] = {
+	&dev_attr_mcu_id.attr,
+	NULL,
+};
+
+static const struct attribute_group mcu_attr_group = {
+	.attrs = legos_mcu_attrs,
+};
+
+static const struct attribute_group *top_level_attr_groups[] = {
+	&mcu_attr_group,
+	NULL,
+};
+
 static void cfg_setup(struct work_struct *work)
 {
 	int ret;
 
+	/* MCU */
+	ret = mcu_property_out(drvdata.hdev, GET_MCU_ID, FEATURE_NONE, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev, "Failed to retrieve MCU ID: %i\n",
+			ret);
+		return;
+	}
+
 	ret = mcu_property_out(drvdata.hdev, GET_VERSION, FEATURE_NONE, 0, 0);
 	if (ret) {
 		dev_err(&drvdata.hdev->dev,
@@ -187,6 +235,13 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 	drvdata.hdev = hdev;
 	mutex_init(&drvdata.cfg_mutex);
 
+	ret = sysfs_create_groups(&hdev->dev.kobj, top_level_attr_groups);
+	if (ret) {
+		dev_err_probe(&hdev->dev, ret,
+			      "Failed to create gamepad configuration attributes\n");
+		return ret;
+	}
+
 	init_completion(&drvdata.send_cmd_complete);
 
 	/* Executing calls prior to returning from probe will lock the MCU. Schedule
@@ -207,6 +262,7 @@ static void hid_gos_cfg_remove(struct hid_device *hdev)
 {
 	guard(mutex)(&drvdata.cfg_mutex);
 	cancel_delayed_work_sync(&drvdata.gos_cfg_setup);
+	sysfs_remove_groups(&hdev->dev.kobj, top_level_attr_groups);
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 	hid_set_drvdata(hdev, NULL);
-- 
2.52.0

