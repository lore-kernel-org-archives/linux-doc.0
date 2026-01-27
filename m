Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9B342518
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510445; cv=none; b=DiT8ivHn0x8YG/N9V2E25mJuVK+TDWZxEk+Gz8cTrcTQumEh+eNO2SaPjjDsYzTN5b84oeKpCqUplks6/Tr9ORu0nhbhUz0uF04BdcLApoJkmYM4sYfnX9csM7w0JLvdfkKAra2cm/jm8mTWdqgr2E4QJYIBOuhRlDrqCazYd78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510445; c=relaxed/simple;
	bh=EHO8zs+g1Ko8UHjpjUG4wCs7CJMj3UxzMt+d6rQqm7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvk1bY1j1suOncCuwkmUtw+BP9DOc0VC8wW9nP0ZUWV2cKeLjbgBCp240RSlM3VrILoM96/PYglpyRkaxt648tgukZ+L4NBqszadbeMiLd9P2XpzuXjKokhzAaB8qm3XeNPVQANmwvaYd/3XOK8UE9QH5auUSDxts20KM1KFCtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNg0nf9k; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNg0nf9k"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so43466365ad.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 02:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510443; x=1770115243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=fNg0nf9ka1mEDu8+WR1YmmZyYgnBmf1BK7YmSSapIj1HMnmWwk5tiUFjBMdMk5nsWo
         QAP4HaGVTJvWz7EIrOPVNXMmwHRhfBPVkC32cq1xKMhdAoS+bbiHJhMXfjr8sGyzjT5N
         YbQ29q8nK2F5dF9pDRJXWT8GQWjz9xfYhZgj5cV+6gENF/i7RHYPXL3Ny3ipjQ0K70m2
         mOB7ikShd6HwPEA44GjMkkXn88d656amDhJ1d+28epx79IoJSiyH5SqMZ4bLliKlXXS9
         io2zIsPyN3CaNGbGFTI15wMFQL7aYScfjVkBikbNj8vqcxT4gr2hY0Gzq/CoHC+8sdLB
         8ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510443; x=1770115243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=tQeX0C27otRD8XgKl8n+5DznpcyEdauBjKNaopQNac6O+/vyBl+uv+/ZhND7kTvx0K
         lprK0+xGk0plkteOxO+pbML/SjYHZIQGO7qpXljN0Zxxgm/hVFVW9UTYtygIq98OFbAZ
         i27nAK4+wWnQMuvd28tlYjrZhnebXofCwwTfZjU0kLIs/GLfK2ntxukqtxP6xHeDhcRh
         sxEOAEwbet3CA++tZEEcL+G9q0OX4nwbQGFkRzFvChUQayGumBq7ySCS33vM82cMzomw
         atFpYgNWVR4ROnBJD+ZaSobF+iRmm9bs5a/beA/VnVPRdhMZ+BKorqj99++dsaGwKSx+
         inzg==
X-Forwarded-Encrypted: i=1; AJvYcCXaBx5VKvQG0drr15FJoNHy/wJF1gogfnm8wxVW4KI1BVaZoCLcMylcuImTg+9G2GQZua2L+o0frtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzDVEbwbsfWAjNkoQRn2BpobWPQCSsSCSOg9b/S7Qomp/o1yG
	nPg82TJJF6YRX0j0OjEnUQ/3XR8sU6TiKD7YBGNO56QSfZ/Hx9LApgJS
X-Gm-Gg: AZuq6aIEOOqReQkCFPxwx6OIaMm7EQUNIEyjI7UoJ9lRBj5NcXdH1HTTYuMEhu+pXX4
	7kT0Bqz7QsOMK5Owt/NrVakaNQpXL3GDudp2+3KsnrK241ZPZGK721+zeudMEyLcdpPsDvbRtOB
	Od+ORBlPZ9JwTvBj9QI1bCW/7Ozau0XyBsR7am7o70ZgHS0Dt5kouvFLh/6gNzEm5QcY1audfPf
	P7nVcUbYLWHr0dl4MHme4rRb15nnlMSulmIN5uQg0WDwyhUaymE1m5sv5KgP+vx2+XEZLxQx7UU
	kL7mxTejqCrrtTgm/ENEl68loxS1tuq6qYLuvdZmlgV3NnRRCrDVI7939N0Ozf2DEukp6E5IB/Q
	Jz0ShJCA1a2SnpZ9FrXB44KVMpjhtrXtfYqoyeSBQpMiFoqUCVW8dq9nGMKX/jyhzIrY0Whbekw
	8T//ooWFQ/lRXTUPVHGJ5DptWxgqmYoeYRHdQxeA==
X-Received: by 2002:a17:903:2f0e:b0:2a7:561e:690b with SMTP id d9443c01a7336-2a870df1966mr14406385ad.58.1769510443442;
        Tue, 27 Jan 2026 02:40:43 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:38fe:3edc:7f99:7e99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82339095c85sm7218907b3a.67.2026.01.27.02.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:40:42 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v6 2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint double-tap
Date: Tue, 27 Jan 2026 19:39:06 +0900
Message-ID: <20260127103907.20269-3-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127103907.20269-1-vishnuocv@gmail.com>
References: <20260127103907.20269-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sysfs attribute to enable or disable TrackPoint double-tap hotkey
events at the kernel level.

The TrackPoint firmware enables double-tap support automatically. This
interface allows userspace to control whether double-tap events are
forwarded to userspace.

The attribute is available at:

  /sys/devices/platform/thinkpad_acpi/doubletap_enable

  0 - Disable double-tap hotkey events
  1 - Enable double-tap hotkey events (default)

Filtering is implemented by suppressing ACPI hotkey delivery without
injecting synthetic input events.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
- Updated commit message to clarify dependency on trackpoint driver
- Now handling sysfs read/write of trackpoint driver using file read/write
- Removed sysfs attribute creation of trackpoint double tap here
- Reversed the logic and return false right away
- Dropped unnecessary debug messages
- Using dev_dbg() instead of pr_xxxx()

Changes in v3:
- No changes

Changes in v4:
- Simplified approach: single sysfs attribute for user control
- Clear naming: doubletap_filter instead of doubletap_enabled
- Intuitive behavior: 0=process events, 1=filter events
- No cross-driver dependencies or complex interactions
- Minimal code changes using existing thinkpad_acpi infrastructure

Changes in v5:
- Rename doubletap_filter to doubletap_enable to match actual behavior
- Fix inverted logic so events are emitted only when doubletap is enabled
- Register sysfs attribute via hotkey_attributes[] (no device_create_file)
---
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 42 +++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..ca01323c990a 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -373,7 +373,7 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
-	u32 trackpoint_doubletap:1;
+	u32 trackpoint_doubletap_enable:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -3018,6 +3018,31 @@ static const struct attribute_group adaptive_kbd_attr_group = {
 	.attrs = adaptive_kbd_attributes,
 };
 
+/* sysfs doubletap enable --------------------------------------------- */
+static ssize_t doubletap_enable_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	return sysfs_emit(buf, "%d\n", tp_features.trackpoint_doubletap_enable);
+}
+
+static ssize_t doubletap_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	bool enable;
+	int err;
+
+	err = kstrtobool(buf, &enable);
+	if (err)
+		return err;
+
+	tp_features.trackpoint_doubletap_enable = enable;
+	return count;
+}
+
+static DEVICE_ATTR_RW(doubletap_enable);
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *hotkey_attributes[] = {
@@ -3032,6 +3057,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
 	&dev_attr_hotkey_radio_sw.attr,
+	&dev_attr_doubletap_enable.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
 	&dev_attr_hotkey_poll_freq.attr,
@@ -3557,8 +3583,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
-	/* Enable doubletap by default */
-	tp_features.trackpoint_doubletap = 1;
+	/* Enable TrackPoint doubletap event reporting by default. */
+	tp_features.trackpoint_doubletap_enable = 1;
 
 	return 0;
 }
@@ -3863,9 +3889,9 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_TRACK_DOUBLETAP:
-		if (tp_features.trackpoint_doubletap)
-			tpacpi_input_send_key(hkey, send_acpi_ev);
-
+		/* Only send event if doubletap is enabled */
+		if (!tp_features.trackpoint_doubletap_enable)
+			*send_acpi_ev = false;
 		return true;
 	default:
 		return false;
@@ -11285,7 +11311,9 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
-		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
+		/* Toggle kernel-level doubletap event filtering */
+		tp_features.trackpoint_doubletap_enable =
+			!tp_features.trackpoint_doubletap_enable;
 		return true;
 	case TP_HKEY_EV_PROFILE_TOGGLE:
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
-- 
2.51.0

