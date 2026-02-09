Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEA2ECE9B
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618890; cv=none; b=kdpBvbWZBRi/Pf1hFcQLX0dfFmglNCMf3M5UoCh9il1zSQX8AzShpsyllonfqc9Ei23VQ2CFl93cN6Zic4AvNC+F7xcssl7aQ98MT3QwKs1SoiAFzKg1CcixolwfdD9To/+NSbMmN5JEwEP9rG1kAl7Y2y6LGoeCtg1Z5wLgtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618890; c=relaxed/simple;
	bh=EHO8zs+g1Ko8UHjpjUG4wCs7CJMj3UxzMt+d6rQqm7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/0oj1qek12An5P6Y5oaXepJrE0B+pD2Tkv/yO5HQWXILnHFdzMbJkpxY/M8SE89V7otbGdIYyC7uP3nKWgXpL53/KK98X6L+K8gUoSjIFDpQ0x+9iXWQOtgKi0jZJm/L3I+TBNNgoVj9D+IxXUDQ7V1HD+7dUjuCayEEO1/W3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aC0dG2GG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC0dG2GG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7d98c1879so23253995ad.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 22:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770618889; x=1771223689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=aC0dG2GGIN/Hl/iAH/bRCMPLqywkMnujvR2LwH1vpeQEe8cw2ShUTP0yb0HkjRJnjV
         diIGLi4IFQsi7C2KQF4f2y/Gd0ZY9iOgpo0evcPgpqVapRFs97+IW7Xaxwe/yZleksZw
         ILKk8X8v03n/R4UYLIDXDc/lu2SYuWuy3TEYT7B+Ikab860f02+KZONKqE/J1qOKhmh6
         xUV+Bm5NTzN4Llw9UFe9mk25AuBTdJgfucU0TxPhY6bHFszTez7fMCRTjy5TfCAsaXmU
         Qq+6MhzazTqK5VOJ//Orj/r+Dws7TOsVUl9YX3J8sbxs46D4QRidmDbxhFtAoyBx6Fvg
         5QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770618889; x=1771223689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=wDcbxKWyMGy02OrbcyBOsBDfTyUHoBKkBgvrXWw0jfFM8cUSmC7LM1pX4fETVT+0Px
         2Q+4ocCUdcF4qWRxRW3j01v3j9zyP/9Sef9urcIvSHF0grJvf9HuRZPdgxaClJHJcQ6a
         scPrnBEvAze00IMSL8XnePlJVzzd2gSPfcP82lfo1d1N+PdPNCTuzUw+Tsrnvogy7RMc
         bu2R7dBkSZSCu407Xf8oL7Wtg/YX3rYuVgDd1OOYJiY0hnGJcwkPOSSwoaYyG5dhY8hF
         3f63gCY8oP2WaeLfKpnL3Vh8XEwoOS+t8QPGTwmtnX49YyBH2k8TIgv77mVsJ2kDFTVn
         Vxvg==
X-Forwarded-Encrypted: i=1; AJvYcCVW3pnGsAy9XhSJJYhu4sCSu/cchdjP0hmPrRUzrZYMkfGV+6U/vnhe3ldOoE8+bpRn8rkvvWEKVSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YweLpPUtB5HRoT+9aav/GECd2Z1C2tks2U0OywhoFyGtbW2kOKO
	A/XQHssY23RtAQ4rQdhUVtDzrmm3i51F2HRlY4jmAIpzfpQhqMt/Zv6q
X-Gm-Gg: AZuq6aKcIPkRTNp8T6xAB+4BxCskJ6ft7usXarbDFQ/UkdIma6WhY9PYRqRtLEtZMzF
	C68auZE+pZew6pbGNRnEJfNdO4aAzPfDo8O0RIe0vFBfNBWnAoix0OagugfYA/ZSPAP5CGHx0pk
	R158103wLcPSdLOSB/2yIBorRZKLnX/tqXA5xfc/ClFPUyuqao0F0eKyMArgnFkbR5QhkbP07w3
	pxwP0dZkavmGlytS+7dGO3LtA2AgBWwLadidgMUCOSaMy9mU5DPVVEUQYPl6YGvqK31PO5Zxmt8
	BgEHTHax98UQLoH+r143Iz/b+URZ+S+gSJoZb1zwFe1esl6HtBW81UK7OK43xCCshuNe/dLlRv4
	Llkn37uVCC96wjXpXmDUwnIUvfXQWLIYF14tqpf2/kh3Z81ef9Rm/slxOM32PmeF0nR3+PGYgg8
	vyK6IB19hPBS1wgSAShmWIQ9fNCBP1IlyLiUsVbjdRVfrA4RZh
X-Received: by 2002:a17:903:298b:b0:2aa:e0d3:cae2 with SMTP id d9443c01a7336-2aae0d40c49mr32306765ad.14.1770618888863;
        Sun, 08 Feb 2026 22:34:48 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:e705:6ccd:6241:6a0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm83440455ad.53.2026.02.08.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:34:48 -0800 (PST)
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
Subject: [PATCH v7 2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint double-tap
Date: Mon,  9 Feb 2026 15:33:54 +0900
Message-ID: <20260209063355.491189-3-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209063355.491189-1-vishnuocv@gmail.com>
References: <20260209063355.491189-1-vishnuocv@gmail.com>
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

