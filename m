Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E34263C8A
	for <linux-doc@vger.kernel.org>; Fri, 26 Dec 2025 23:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793244; cv=none; b=e1VaociaG8RBd0N/chotb6kcAAfW/vGmPI6DYyN4Aew/WAKwMpMGr3t88ZBQjTfss2lryVnpq68y+J2TDfvgOsK90vD0F4ndNGTTzGDM0dSUDgaDRdJcC7fogmZ9cvXWPqNlUhIC4ndhpP7P4Lc7aogMoTw2obr8tiVDHS8Rar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793244; c=relaxed/simple;
	bh=Hrnazuahv2v9rpFCsMEJC0zgdKheqCVmhgytvsJwNK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsS5Fh5g/K7YsaBuY7ibVcYK0OLnVAGsGxyAwAiNe6wKQ/4QoLSA45D1P+Bn9YQwZRJxKU4dVTqmv/Sb3u6zraAjkkUzWfu/jeJGAg33HEHRIE7f29jxRgX8YYfuTsf7WdTTaYZGKd6DlXstvd71Wks6XdaPeTmoA+eE6Rw+k1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GePis9lF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GePis9lF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so5926811b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Dec 2025 15:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793242; x=1767398042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMAB5C1zkD/DVWLKDv3RV0IL8z1Pp7D3kuyKzpTCHnM=;
        b=GePis9lF1yHS3bY/G6B2v56xmBrly5U9uR8aQpbIjN1lGqGIB3r+bA2em53PW3y+P2
         hdzxsXz+R7/SlomPUwUcY4GBgNoHTGfX3rCkkjQJ0cev6icApLdw8sCM0Os5FQOnPCpO
         tztGn0VFz8QzA+gfqTuosMOBENkAA3O1NU/8cE9XOqNPhUFkx7yH/Dk2tiDz50a52ijb
         1CU9BfqQ+O0ygVk4FUYQFiVfutd0PkYK92BA2Jhv3pXDAGpC85XZtiXAT5DnrQv+fQSB
         eW3371+7oNWmSapTff2t/3e5b9BJVivwdthE2P8BDmuKHczZlYj4YGGM/rRfh4wyAJhS
         +O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793242; x=1767398042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMAB5C1zkD/DVWLKDv3RV0IL8z1Pp7D3kuyKzpTCHnM=;
        b=P20DzUsZSxGJWaRLKGcmoJ8kZr133mKEA15zL675fu1FHOQWC+qWvFFbESXXif5D9d
         yf8Ev1NrNNjA3VYryzhjfMCmyLLdVYrbXHnXndATYaVj5G4YqX0SqrJQOB2M6uRbJUOM
         z9qqS+Ljx3UXnhALSiyLIcCFCADVQrO4ToUeIb5lU1LcZM6FgfV5xCmw7yLIyI7Hbkpj
         C4Zenkrq8IWsCiR9LSFfOiwzyTwc71UrLJ8Q7OZnv9i5UMU7Oagpn8yaiXTGjelAlnzT
         IpwWF4qkloeacimbBh6ufqtuktGsJrl8Sti1hNI/rl26rf5ohs5og5L/4eabtthw60SV
         dOxw==
X-Forwarded-Encrypted: i=1; AJvYcCUCMZJQ7bI+iMoNxLUb8cFYhrBCDRL9u0B6McRFGj9vuYSyCij1j2zfE3IVSIQ4bwy+GiHEki2b8Ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWIbXPjNiiVZqWhsi+HQyaPbHWUTo8u8r0ZcXl6gLm8BNcXpJ
	F27kJ21fj/ZlfjtXISQjr2ynX/s5RcSCAEiSsi7dwJnVPf+x4DqoGA+1
X-Gm-Gg: AY/fxX4Unf67lEMw8tl5EU0rI+0nvOdZ2bJjp7rks8bfWBVX8Ajp5JcKzXwTtJADwwe
	cE8ZdANGz8iolU6S1b+gElSIeWQQRe+b69p4Smr7ixD7SIvVwrPlXoFWsG/2F6VP4FWIXg5lSfn
	h9+HEMtlFXrzconT3/QsH1GAjTViQQRvAcER7qtzckL92XaOVLlgaKRYwQFLU5v52/s17C0cU40
	mhM3HdaBZv4NNV/JdCKSUb1Yn59fVmiUqGWr3RQv3WnvAPqSXlfV2B74xeqIpXDl4gSqTjj5220
	a0STGJJHjpTr2ZFXg7g3HR9Z+QoqIAZH/cHgmKnYjojwK+AWtw/0Y5/cCctqrmKslfQ8SfA/bF7
	bwlgX0VybwhHzDl3i+mcesS68yXJhXpmMJMQXS657QgCZlIM+ZOLHU+DFqz79m7vxVU8fvAMada
	EvFVllu801cJjE7mNvpjMTIwWgbK3GnoXpKjH1MjdN5S0mFnH+ftCWBLtSN1xckl7kNA==
X-Google-Smtp-Source: AGHT+IE/jRVZWjbzqOMpIpqznB8AgsA/aJsvshwBSCcVXQGXPfun222sZyDCBMQFidKb3X3DLoILKg==
X-Received: by 2002:a05:6a00:1ca2:b0:7f6:6011:b106 with SMTP id d2e1a72fcca58-7ff648e611emr22680938b3a.19.1766793241725;
        Fri, 26 Dec 2025 15:54:01 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:54:01 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 1/3] input: trackpoint - Enable doubletap by default on capable devices
Date: Sat, 27 Dec 2025 08:50:59 +0900
Message-ID: <20251226235101.106451-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
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
 drivers/input/mouse/trackpoint.c | 47 ++++++++++++++++++++++++++++++++
 drivers/input/mouse/trackpoint.h |  5 ++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..8319b5bb6ce5 100644
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
@@ -470,6 +509,14 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	/* Enable doubletap by default on capable devices */
+	if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
+		if (trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBLETAP_ENABLE))
+			psmouse_warn(psmouse, "Failed to enable doubletap: %d\n", error);
+		else
+			psmouse_info(psmouse, "Doubletap enabled by default!\n");
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

