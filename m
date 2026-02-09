Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F5A2DCBFA
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618885; cv=none; b=sbxmc22O7i0iWlzelZ4wQ/47c9rvZL8uOgnYsOmh5i0znXnWVn9OV1BS1/UJlrL+QGMFHZ1EvBHY0f1jrBNsOZ9ClkTSiQELGHRgXsNE3zI+MHIQ1mgRDFwgxfjeQRjhbb90ISJEKaTQQGFbWtC6p9KXcJiLzXiEq8AbXeFtLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618885; c=relaxed/simple;
	bh=6cWXYQnSOpTkqGyqYB4HcUXTzLmY/x0Rpt1y2l2tVp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUDG3AhcmeqL32rFs4XydaqRjVQLBU5h3IQCG7hcBUEBlugHzXzmGD8rsRD1BxIhfrVmc64/waWa53WMprNS6BhFhx8kyh0gDBTeQ+G82/zLOG8NZnvy1r74s9ccIMG0ISK5KauqfY/7Wtynkv/8pem/CzPxKlsshzQsZImYN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPQu0iI2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPQu0iI2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c636487ccaeso1394104a12.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 22:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770618884; x=1771223684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2HCkzlSd9VJd8jvOdY2m/zS2AjvWLxS2zuWfs+MEEQ=;
        b=mPQu0iI2fjQbnBKLT6+57wpAVWSTIuecZ0r5I67ui6owswjPAFq05te5g5W7av07UD
         vP6YCcQ+GesUSFOa42Sx+3EFJTtNrPb+lN0xjM5Fj17IZ05CbX7Ex72leStzjDxSYizU
         mFACt588bisAO4v9svjUcw6tAn88BxFospIEGh5V/z953tfH0O2uUeVVeVTjBD1+O3BR
         gvvgpNHDIOgmW/A/wKAPkbrbMoRLmkPrVai7Sxyq7OyQ2oZyLs//76QzYeVKlznoVCNg
         bTPzeuft8rQikMP1r/3AMDzsjTTFbMsbxDhahniqPRBzGUedUbfsoCRmy0LdPoySVFNt
         EvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770618884; x=1771223684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q2HCkzlSd9VJd8jvOdY2m/zS2AjvWLxS2zuWfs+MEEQ=;
        b=SMFLYMNa14eD0xZcGb1FT38nSLPkZNQMRP2YnZFSKShP6nxXb1Cy46KZWzniEzS+o1
         atrjilHvWTWJ8Z1MU5AocX5yLqQ+h1E50duEXwXIlqTaCILAwuDPp8hUQsbwbZ4bCkRG
         JJP8tvub9kvWqxpGKkd3YxWGTL0bAVqpKhYMnCw1IjPo8j8hp01kbZMILY1s7+V4c0iF
         bYnQCITvEFLGWzrVRsBALMxTa2XTkEAdMI4KWmEhtWgzTw6GASf+tFeT4VzU7goOx4xT
         yIIrnIkNH3XOeOUmK0wsOwLOIQdHVbNs9FSIOK6uJO3+bIFHTAGQ+jYr+lsa3F2vNcOR
         gZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdZLiMeUNxn0QwwyzO2zyD1tfJw9orLtlyk/n+I3gH747ACkcYwxQ7CZ15R8HZxOxIGe8DOYhquv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9wbr9c6ghInpHEWV1gzm59Wyy+lYKXB13v0SKlJk6+52B2kEr
	Z7I0tydyxqFzwNcIYYvKl1VpBQQ4fpbVFlB85uhGQBHeMmtybqqwNSpO
X-Gm-Gg: AZuq6aJ/Z27L25q76kxKf8kerOVXCmx5u74DFkqWOUgH1NfgAHCJ8FxCTEl/GOm/NXY
	gdHjm90vxwW8zy6q6CAwTitC4mh76uNR8dyUSFuchsJl4hruZhYXdCS5NJIyE3BvRKdBw5rYcro
	a7JflS9roox3Y/Atv+A4gycwPQlruudJKq5t9qnmT98HkaW5+wZXBHHunuDg3nAzSflMYgXld1L
	yYPVd1zwi8Z4u0OH+6KcgJASEFYS7lB8V1mfDScLbGFu8FMGXFhmF59SDkBaT+l87FIcdL6xfkr
	tVRueZhVvDRg0ZpFYURgV0on4m4FIbxwZQlF9LCHsvBrQZkKHMSVILh3oWfzXpkNtrsWp9lXccl
	ycuYIg1tOTLJKSwdCZuffMbpWnt0yEwhtaLnZTJRpPMV+Q6I6suwxZfDwbxD8w40Os0aGfCB2D9
	4o1F1505gG28h1qYlaBapxYFa/PzXYoMqXHpW2WCcc6ghohB3q
X-Received: by 2002:a17:903:198b:b0:2a0:ba6d:d101 with SMTP id d9443c01a7336-2a95204fe49mr87231105ad.21.1770618884126;
        Sun, 08 Feb 2026 22:34:44 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:e705:6ccd:6241:6a0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm83440455ad.53.2026.02.08.22.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:34:43 -0800 (PST)
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
Subject: [PATCH v7 1/3] input: trackpoint - Enable doubletap by default on capable devices
Date: Mon,  9 Feb 2026 15:33:53 +0900
Message-ID: <20260209063355.491189-2-vishnuocv@gmail.com>
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

Enable doubletap functionality by default on TrackPoint devices that
support it. The feature is detected using firmware ID pattern matching
(PNP: LEN03xxx) with a deny list of incompatible devices.

This provides immediate doubletap functionality without requiring
userspace configuration. The hardware is enabled during device
detection, while event filtering continues to be handled by the
thinkpad_acpi driver as before.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v7:
- Removed unwanted comments
- Removed psmouse_info ()

Changes in v6:
- No Changes

Changes in v5:
- Renamed function to trackpoint_is_dt_capable()
- Simplified string comparison without sscanf()
- Removed wrapper function as suggested
- Fixed missing period in comment

Changes in v4:
- Simplified approach: removed all sysfs attributes and user interface
- Enable doubletap by default during device detection
- Removed global variables and complex attribute infrastructure
- Uses minimal firmware ID detection with deny list
- Follows KISS principle as suggested by reviewers

Changes in v3:
- No changes

Changes in v2:
- Improve commit messages
- Sysfs attributes moved to trackpoint.c
- Removed unnecessary comments
- Removed unnecessary debug messages
- Using strstarts() instead of strcmp()
- is_trackpoint_dt_capable() modified
- Removed _BIT suffix and used BIT() define
- Reverse the trackpoint_doubletap_status() logic to return error first
- Removed export functions as a result of the design change
- Changed trackpoint_dev->psmouse to parent_psmouse
- The path of trackpoint.h is not changed
---
 drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++++++++++
 drivers/input/mouse/trackpoint.h |  5 ++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..e12d76350252 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -393,6 +393,45 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
 	return 0;
 }
 
+/* List of known incapable device PNP IDs */
+static const char * const dt_incompatible_devices[] = {
+	"LEN0304",
+	"LEN0306",
+	"LEN0317",
+	"LEN031A",
+	"LEN031B",
+	"LEN031C",
+	"LEN031D",
+};
+
+/*
+ * Checks if it's a doubletap capable device.
+ * The PNP ID format is "PNP: LEN030d PNP0f13".
+ */
+static bool trackpoint_is_dt_capable(const char *pnp_id)
+{
+	size_t i;
+
+	if (!pnp_id)
+		return false;
+
+	/* Must start with "PNP: LEN03" */
+	if (!strstarts(pnp_id, "PNP: LEN03"))
+		return false;
+
+	/* Ensure enough length before comparing */
+	if (strlen(pnp_id) < 12)
+		return false;
+
+	/* Check deny-list */
+	for (i = 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
+		if (!strncmp(pnp_id + 5,
+			     dt_incompatible_devices[i], 7))
+			return false;
+	}
+	return true;
+}
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -470,6 +509,12 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
+		error = trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBLETAP_ENABLE);
+		if (error)
+			psmouse_warn(psmouse, "Failed to enable doubletap: %d\n", error);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index eb5412904fe0..3e03cdb39449 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -69,6 +69,8 @@
 					/* (how hard it is to drag */
 					/* with Z-axis pressed) */
 
+#define TP_DOUBLETAP		0x58	/* TrackPoint doubletap register */
+
 #define TP_MINDRAG		0x59	/* Minimum amount of force needed */
 					/* to trigger dragging */
 
@@ -110,6 +112,9 @@
 					   external device will be forced to 1 */
 #define TP_MASK_EXT_TAG			0x04
 
+/* Doubletap register values */
+#define TP_DOUBLETAP_ENABLE	0xFF	/* Enable value */
+#define TP_DOUBLETAP_DISABLE	0xFE	/* Disable value */
 
 /* Power on Self Test Results */
 #define TP_POR_SUCCESS		0x3B
-- 
2.51.0

