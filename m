Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403F1DA55
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376347; cv=none; b=oZP/bneOmOMqyA5ivVA0Z/l3ZnHhtQNDw0s0/jNNu63GVV09YyDLnooVTvZQUHX90cLEP0tnsKogBPmIsK3KYULtErFjtEcClOcHCdsq8QSRtI8stJvm4/WwGSyedfqg6ybNitcSZziA23wRHsrR0MZ0RzBEXFDKRVPkI+st/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376347; c=relaxed/simple;
	bh=IuCeBnCA12nf/Fqu5eYQSw4oiYf3AXHYMr3vFYEVRiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVk086rFaSBnnPH08E7fDWAMAsCo08lBPovJ5++ART+jt+4vMqmm/CmebxyW44NItN47X+10DG4mrfV4JaH9eT8YKtxRv0G7y2iOx3uVvSitXwwLHFw3McvKqGQG/JbsCXKGgr+79MWzmyV09nwTtFaltke0w1NyHQ/hF0FpP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay5CPxsL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay5CPxsL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297dc3e299bso23287415ad.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376344; x=1764981144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQatbXiS4IDF8tyOs0fGlxPqW6GCHi1/Lga4WQU56dE=;
        b=Ay5CPxsLDZtDkM7DFTHBsEvCcPU1/D5R/I1Jz1elHU243BDW12dDboEm+veKI8X4+T
         R5NGs7ceoL7gRqDV1dZojc5nZmSVHtJEJxz2jcGKMwFlxyb2GU9s5SiYnWf5tgpuHLIp
         UEAqXJgJI2zLz6g2J+s6flxPLJ4ErJyD/ZhKavFSV4y5x/DFeLBX+sp7MHC2SrAWdeyo
         sRdLG1uCJg8PjHzM6sYIa5HG0NdomvK2SxY4XAsnglVjWVd6wrTvULw3bgfrkKcdRgNW
         no1JSrsqy99TXvBd84WuGSAAeOZWyQhH9Ahfl3TpLXDaEUGWi+Mc6PglEdckLoJx3xRu
         Ds2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376344; x=1764981144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQatbXiS4IDF8tyOs0fGlxPqW6GCHi1/Lga4WQU56dE=;
        b=L79f3pFQGkjQlQ8U4zVWf9Idlnul9qus6exSbzMK5KdCnq8XHoe22U2fci5hkkOCxK
         3gBTa7UvOF1qrcqiF3FGPCwvVYE/qS0MGrruDUreKayWFeUquHuALc9IXzoYAlEfe0Bp
         C0ipQMX61V5D+BYo+Q1t7KUxIldUSm7MKCvxKsyzhZd3Ks4qSxtzcv68x+KYC/Ck9nf7
         Mh4Idplsa+a34eCF2AAreco7dZ/9Ud/rsTxfEb6TpqDezjJ/QoLF/qdpJwBJNACy4r8x
         UKUzj0XfEEo72zviFjDzg2z2vqo3xJQmwLzeIBbmwbiRdea+myzNsjTCfS3yrhX/RwNU
         ES1g==
X-Forwarded-Encrypted: i=1; AJvYcCVlx/TRB7a6WfuHLc1zL4mNuLTsb7yfatdJ4EG4K9/rWw0VH/PEO9BIddy0s9XDoVBEXHNyklL/JNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7BPmSCHZt5IeBiFAfOrM0hMffOCBlpKO8T1TUmkfXTZvIY+p4
	nmfJaxONZIIGeji0gi6mq+sJ8TN9BxaGASSKLqeCuG/PsxoGSolUIdr3
X-Gm-Gg: ASbGnctgmUz43M/dhuQDxJ3TWXR9D91/gDjFTW9T4lkIsvb3crdp3FcDjeUjXrzM6WK
	v7/0fme2lm5t1qLgwS+H6lz/KKYZQSUZbgvMIYKraNzzcKJy2TFhDKYzrkhur89GaHdHVi/4LHt
	edbk+dJCpEtYyqn7FsEymrx+KcEKD4C00tSQ8zsbK6fXoM8Lz5/NR26hgYOK03E1LChzAtjylnW
	Fu1FeO4ueAjCEnpR0s+y4etwcZ+3r45E2NWOzRK7orWbmwFc72eWKyubVFqpN2wwDAiEaiYPAul
	MP3cEkiVGPilri51g4ebo/joHCPv/tApce113uNq+1Jv6iRPr/MJdSghYD6lwzBykqmRZ4fKPku
	LaMdtivgel+H0Gkj8wz7ard0z9VDz37UO4uIV4l9LracplAyTDxHM6Jwv+7c1Qh5c0ajDoetzan
	6PP9nbvFNEnO7iMLk62lJ9Obtdcv4PFEwZZCcLm4P0GglJRUF/YxbmeRfrSg8J9vKVog==
X-Google-Smtp-Source: AGHT+IH+tqI7TxrE3Powg5mDCkQtUgWbnSb7QtzYFL6VRXzqfB4juIiEGJZGEy2486ootGZ/7Fn4SQ==
X-Received: by 2002:a17:903:1aaf:b0:296:3f23:b910 with SMTP id d9443c01a7336-29baae45c56mr137888385ad.9.1764376343606;
        Fri, 28 Nov 2025 16:32:23 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:32:23 -0800 (PST)
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
Subject: [PATCH v4 1/3] input: trackpoint - Enable doubletap by default on capable devices
Date: Sat, 29 Nov 2025 09:25:31 +0900
Message-ID: <20251129002533.9070-2-vishnuocv@gmail.com>
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

Enable doubletap functionality by default on TrackPoint devices that
support it. The feature is detected using firmware ID pattern matching
(PNP: LEN03xxx) with a deny list of incompatible devices.

This provides immediate doubletap functionality without requiring
userspace configuration. The hardware is enabled during device
detection, while event filtering continues to be handled by the
thinkpad_acpi driver as before.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
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
 drivers/input/mouse/trackpoint.c | 51 ++++++++++++++++++++++++++++++++
 drivers/input/mouse/trackpoint.h |  5 ++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..67144c27bccd 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -393,6 +393,48 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
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
+ * Checks if it's a doubletap capable device
+ * The PNP ID format is "PNP: LEN030d PNP0f13".
+ */
+static bool is_trackpoint_dt_capable(const char *pnp_id)
+{
+	const char *id_start;
+	char id[8];
+	size_t i;
+
+	if (!strstarts(pnp_id, "PNP: LEN03"))
+		return false;
+
+	/* Points to "LEN03xxxx" */
+	id_start = pnp_id + 5;
+	if (sscanf(id_start, "%7s", id) != 1)
+		return false;
+
+	/* Check if it's in the deny list */
+	for (i = 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
+		if (strcmp(id, dt_incompatible_devices[i]) == 0)
+			return false;
+	}
+	return true;
+}
+
+static int trackpoint_set_doubletap(struct ps2dev *ps2dev, bool enable)
+{
+	return trackpoint_write(ps2dev, TP_DOUBLETAP, enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE);
+}
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -470,6 +512,15 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	/* Enable doubletap by default on capable devices */
+	if (is_trackpoint_dt_capable(ps2dev->serio->firmware_id)) {
+		int error = trackpoint_set_doubletap(ps2dev, true);
+		if (!error)
+			psmouse_info(psmouse, "Doubletap enabled by default!\n");
+		else
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

