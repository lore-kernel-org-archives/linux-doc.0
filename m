Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9F3BB44
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376361; cv=none; b=d3bSQiJUPfj5T2DHm9olyLT8AbJWptYWZWqPDeIFz3E0sY7VBQpjPHj1hcd8GsWwpOQZeCrkaeGkY7R4Nv8MLegLIuXZtJ+yiowmnMbUK9LUD67+FgxIeo0196gJmq3MvmYQcXRJmieMNOL6PVcZnPTp4mSZ3omjc//nUatGvbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376361; c=relaxed/simple;
	bh=6zxLAlp/Wljzbjiex8bdLyZK02qoFzsqEdbUkn3WDuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSi5CvZSFVl8IMpNDDSq+JZUIyoOY3yJ8nCTqXeOqJIzAwzd9zPKePUUa5ga6NgTFLHtD4qhCbK78ubHU+s/wLCjV9uY9DiRZgJPlUyX+hh9fz8T2Z4bKLTwfPRfbUhJTENWJIvIzJwytjRTrpY41npizFrMl4M32Dlbq5uhMTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6xWvYCf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6xWvYCf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2953ad5517dso23406765ad.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 16:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376359; x=1764981159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTc+9vRAB3R4MBY+OXbnjje5QcqV2vpqrpHPruJWjvs=;
        b=g6xWvYCfPdbSEHsmVgoJj/Xd1GfnUR7fYV+et8lPMiOBQouY8ncmcYLElE6LoRF8f+
         aWITltjN+U/Xq4+w72Q7w01JZhHmEVHYIqPH8Ifd4eOIu5fInkiUU4rBo3oODvMvF7tY
         6CpLOS59LYZiw3KInI7JRI9Y9Q3IqNLAySj6of684GlNZfelm8SeivqmekuWxk5P7zI0
         86yRF4sxqkSGqGHrFZ/gQFNWa3vx9LiObHL5eaUPlpo+P7Bp0Eu/6YRBxbjo/N30BtMD
         b7tBj1gUorl1nG3BimKT7bTpx4dd3/Bzlo/enbaiDruPLvWp5T/OEtL5KEeJwG19K2Lp
         maRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376359; x=1764981159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aTc+9vRAB3R4MBY+OXbnjje5QcqV2vpqrpHPruJWjvs=;
        b=g0qYrbGHLgf0Cem6gpyZM1F7PxNAe6NyuAnyT3PdWpPcvytKtdpStzS/pquX9is4j1
         op81sIk0Impgb1Qa3kaSpGND/dtRrJ8Olwbb0M9fLyOuvqTLkwaIV4Ol+lGmD0Db38QO
         yy+Cq43sh61w3na27oeAnS3Np0YxXNGcFNjOu8rZxlMqlNA6CwEsXH7/Xj6N1jj+r7FV
         +uMQY0FLKPaT2ICi4WVu06c4J3U7XAqRxaW22mLfiHLqCh08/rBxZ6F2EGBvpTbWSxjR
         LnYz33LgugWAg7OhqHX2pVRGetJr5vUs53Bqyu2YpNpbGQK3ckXJydGqA3dR2cBInaLu
         G5qg==
X-Forwarded-Encrypted: i=1; AJvYcCWcSJYkN5HLsvO8z4urMHYP1IhPBb777zd0NGjSlLkP5cafs48ZVscS0LfeNh6l58HejVCYL0+wolA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2EHO5tdjW+OoCbKtxly0bdccG7A3eGsgMpmePY/bpv7eObS5F
	V6P1VF9/AVW314hrqAB2UCd1n2hXA171fx5XTlDvg9hF1X1JOApkimRq05bUBlge0VUg5uTKY+E
	=
X-Gm-Gg: ASbGncs4uojqJay6xwV1zky78uRpt9lv1eWUzJYQmqw+Uwp+qGmBtKvYy+ax6CHCMNp
	pIwTgLRZsPu0lGemAP5m4D3lq6TGA/2jcXg+dYuZWsLHLH2Zc3n4IbGrGlE/CEbP7OZpyWZieVW
	vVtS8EramCa6m7sdqRIxVD9rtXVdv7uW07wfEPa6Xae/hu8o0y9ogz5d4ktawtXE4LCQcdBDjuo
	I8fEGZ+PI4rIyGCDNjcZ2zrtbXsCdjtZX2/UUvzimO8bBTySHjScvWCwhm4JmjtwunqgbvRm0su
	zYLJ0sX702Ezv2/G1z0IlM+xmnYcMUWjxKxP/Kyud8+0HOKNBcgMY2iQh8iBoaWlKK837k5tuQ4
	GuOwErW2q8WoImORuKUdg8XDsCucv4M7d0pjxt8+mM8Zk2Kw0LbR6lGCQBvWdwuxL8UySBauS1E
	7EVxllb9+suANRU3xoisJOa+zM1vXx5uwvbvq/zjp54g9pUdTqCEZ26e/w76GGlGQ/hQ==
X-Google-Smtp-Source: AGHT+IEvcIbegpok2li85P+v1Qef4lNDwGUNPU1TLt/0f+gQF8BvvzPIBH24rX6bK8TheUfD9/vBNg==
X-Received: by 2002:a17:902:d4d1:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-29baaf9abb7mr190627815ad.18.1764376358914;
        Fri, 28 Nov 2025 16:32:38 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:32:38 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 2/3] platform/x86: thinkpad_acpi - Add doubletap_filter sysfs interface
Date: Sat, 29 Nov 2025 09:25:32 +0900
Message-ID: <20251129002533.9070-3-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129002533.9070-1-vishnuocv@gmail.com>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysfs interface for controlling TrackPoint doubletap event filtering.
This allows userspace to enable/disable doubletap functionality and
query the current state.

The attribute is available at:
/sys/devices/platform/thinkpad_acpi/doubletap_filter

When set to 1, doubletap events are filtered out (ignored).
When set to 0, doubletap events are processed (default).

This complements the automatic hardware enablement in the trackpoint
driver by providing user control over event processing at the kernel level.

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
---
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 54 +++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..9b646ecff452 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -373,7 +373,7 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
-	u32 trackpoint_doubletap:1;
+	u32 trackpoint_doubletap_filter:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -3104,8 +3104,35 @@ static void tpacpi_send_radiosw_update(void)
 	hotkey_radio_sw_notify_change();
 }
 
+static ssize_t doubletap_filter_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	return sysfs_emit(buf, "%d\n", tp_features.trackpoint_doubletap_filter);
+}
+
+static ssize_t doubletap_filter_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	bool filter;
+	int err;
+
+	err = kstrtobool(buf, &filter);
+	if (err)
+		return err;
+
+	tp_features.trackpoint_doubletap_filter = filter;
+	return count;
+}
+
+static DEVICE_ATTR_RW(doubletap_filter);
+
 static void hotkey_exit(void)
 {
+	if (tpacpi_pdev)
+		device_remove_file(&tpacpi_pdev->dev, &dev_attr_doubletap_filter);
+
 	mutex_lock(&hotkey_mutex);
 	hotkey_poll_stop_sync();
 	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
@@ -3557,8 +3584,22 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
-	/* Enable doubletap by default */
-	tp_features.trackpoint_doubletap = 1;
+	/*
+	 * Enable kernel-level doubletap event filtering by default.
+	 * This allows doubletap events to reach userspace.
+	 */
+	tp_features.trackpoint_doubletap_filter = 1;
+
+	/* Create doubletap_filter sysfs attribute */
+	if (tpacpi_pdev) {
+		int err = device_create_file(&tpacpi_pdev->dev, &dev_attr_doubletap_filter);
+		if (err) {
+			pr_warn("Unable to create doubletap_filter sysfs attribute\n");
+			/* Continue even if sysfs creation fails */
+		} else {
+			pr_info("ThinkPad ACPI doubletap_filter sysfs attribute created\n");
+		}
+	}
 
 	return 0;
 }
@@ -3863,7 +3904,8 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_TRACK_DOUBLETAP:
-		if (tp_features.trackpoint_doubletap)
+		/* Only send the event if kernel-level filtering allows it */
+		if (tp_features.trackpoint_doubletap_filter)
 			tpacpi_input_send_key(hkey, send_acpi_ev);
 
 		return true;
@@ -11285,7 +11327,9 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
-		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
+		/* Toggle kernel-level doubletap event filtering */
+		tp_features.trackpoint_doubletap_filter =
+			!tp_features.trackpoint_doubletap_filter;
 		return true;
 	case TP_HKEY_EV_PROFILE_TOGGLE:
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
-- 
2.51.0

