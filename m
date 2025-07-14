Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5025BF13
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505784; cv=none; b=TX8vWaVws67B0MkDIkcdLuWCFnT1itmTvRTwxLNcvfsMJYe8WfEKMaLrcFFqYvSLz8PwDODx/fK7neey+jonKfLEJiulgCFhwF0bINUSsmv7uiMNRLzsFHB3IiyfCwWy/DIjF0GkwU7DTj6SOYEcC9414M3KGfm9wFkx5QT0yGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505784; c=relaxed/simple;
	bh=YNzJxgDiI5v3Q9YLogrSdDXxE5SUiXnUu/73gAN/4Tw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CiZ5QGU8HmwsxhWcYjCscGoIn2oeQcDGt2HoJu8b8xDLndngb7yvdUXChN6ytMpQKeLSVUJcdjizXQDshKCt+koXrRpK3qoJ9QV144HT/exsVtZfg4m+CocZ4LZvTVdOK6oRXmYvNOlCts4paJNgdz2NT5eHlJZ7Bm0Fz0OQXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I6SU5Vwu; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I6SU5Vwu"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3df6030ea2fso90451765ab.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505781; x=1753110581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTkp/+68hZXrxsbuIWT9PqNYoeinIAKwggwOQCHGGJ4=;
        b=I6SU5VwuXIp1VjFnAJZHGfvKaqGut4fOFEE2z+N4FVXAL/U2RLWPaapgmn3Vfsy/hC
         xrrtEeMuoswVGyoF11hyIuLH9J6znErmSOKgkaw0huN3kolOcKUHqCmXx4ObOulWqJlV
         EUby5QuwmQv4JyTeIlqIEHkNbuhAc/ULzCzOLxLKvfYY17M3e4mFn7uf63QdkoIgNIuP
         Bp9KjN8juRYdDbR34Qmxc0/gnBTpSHm7OrTWt3iPW1RF3+JrPXqOySDto9/B2dF5wEp9
         yEn2slgN5v3IMm7dVB6hkEq18dAkB+1M8sb4l5y7ky1ee3NTPwVxv6p/cyduWdtToVbP
         9/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505781; x=1753110581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTkp/+68hZXrxsbuIWT9PqNYoeinIAKwggwOQCHGGJ4=;
        b=aOzOdS4yvOYy//uWjNufmWe56AGSFmHuzDYpM9NezGzI1EzkYqQod9h9i19gUMo4c2
         bMbEKkDw/UV6MU9QcoLaqlaQqcJhRz5l8g0swSAwqMPDFXdc8/JQHJD61cnaehBUO8Sp
         xtbKfQtxg+Z5ljvCTQfoLUfgwrh0vWtMdXqFKEF66Ea3cW4wzEWQU+i+6LbsJTNfBmsZ
         QmzeAyLG+VoH4qbyjePiTPc9zJCwl76tM3ChR0F7pjWh8qKUkjtaGusXeQVHJ3S/zbSZ
         I8WUF/XKp98ruhu4bYJ5k8IFP2IIEIextHZl9X9U8drJhACbBhOH6pN84iTfot3D1nrK
         B8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvixJVVxz+Tw93zQvXHJJ5ExZYagE+8GgFcOYKwoWlsvCSL7/eBO5F4qbDFy7VkfA0Zif5Ite+mCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEUN352zhIbSMCuLXgs25uRpVfXiDlk91slCJInVRrjdvhYf0C
	Qgn5/Du0yeXiGXwDaoaSE45t3247RBb+csj+k80cDAgQXv2h6RDc6Udl+uYd/zqk5AzttgAq20m
	A8MYaU1X1Nw==
X-Google-Smtp-Source: AGHT+IE3G79mHx2jWovSJ3GXo/H85VA7RbU6ArP3q0xZY/vEDsrgte2dk+MESlRVaTvfrBk4jrfK/U56yv/H
X-Received: from ilmo4.prod.google.com ([2002:a92:d4c4:0:b0:3e1:4c75:1b6])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:3bc7:b0:3df:3208:968e
 with SMTP id e9e14a558f8ab-3e2556650e5mr119714415ab.14.1752505778209; Mon, 14
 Jul 2025 08:09:38 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:34 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-1-71c7c05748c9@google.com>
Subject: [PATCH 01/11] HID: add haptics page defines
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Introduce haptic usages as defined in HID Usage Tables specification.
Add HID units for newton and gram.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 include/linux/hid.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749bc5547ff78d5abe6db7bce2f62d2b..344ab0e40f29afe55575e5a7544496b7bb48a266 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -156,6 +156,7 @@ struct hid_item {
 #define HID_UP_TELEPHONY	0x000b0000
 #define HID_UP_CONSUMER		0x000c0000
 #define HID_UP_DIGITIZER	0x000d0000
+#define HID_UP_HAPTIC		0x000e0000
 #define HID_UP_PID		0x000f0000
 #define HID_UP_BATTERY		0x00850000
 #define HID_UP_CAMERA		0x00900000
@@ -316,6 +317,28 @@ struct hid_item {
 #define HID_DG_TOOLSERIALNUMBER	0x000d005b
 #define HID_DG_LATENCYMODE	0x000d0060
 
+#define HID_HP_SIMPLECONTROLLER	0x000e0001
+#define HID_HP_WAVEFORMLIST	0x000e0010
+#define HID_HP_DURATIONLIST	0x000e0011
+#define HID_HP_AUTOTRIGGER	0x000e0020
+#define HID_HP_MANUALTRIGGER	0x000e0021
+#define HID_HP_AUTOTRIGGERASSOCIATEDCONTROL 0x000e0022
+#define HID_HP_INTENSITY	0x000e0023
+#define HID_HP_REPEATCOUNT	0x000e0024
+#define HID_HP_RETRIGGERPERIOD	0x000e0025
+#define HID_HP_WAVEFORMVENDORPAGE	0x000e0026
+#define HID_HP_WAVEFORMVENDORID	0x000e0027
+#define HID_HP_WAVEFORMCUTOFFTIME	0x000e0028
+#define HID_HP_WAVEFORMNONE	0x000e1001
+#define HID_HP_WAVEFORMSTOP	0x000e1002
+#define HID_HP_WAVEFORMCLICK	0x000e1003
+#define HID_HP_WAVEFORMBUZZCONTINUOUS	0x000e1004
+#define HID_HP_WAVEFORMRUMBLECONTINUOUS	0x000e1005
+#define HID_HP_WAVEFORMPRESS	0x000e1006
+#define HID_HP_WAVEFORMRELEASE	0x000e1007
+#define HID_HP_VENDORWAVEFORMMIN	0x000e2001
+#define HID_HP_VENDORWAVEFORMMAX	0x000e2fff
+
 #define HID_BAT_ABSOLUTESTATEOFCHARGE	0x00850065
 #define HID_BAT_CHARGING		0x00850044
 
@@ -423,6 +446,12 @@ struct hid_item {
 #define HID_REPORT_PROTOCOL	1
 #define HID_BOOT_PROTOCOL	0
 
+/*
+ * HID units
+ */
+#define HID_UNIT_GRAM		0x0101
+#define HID_UNIT_NEWTON		0xe111
+
 /*
  * This is the global environment of the parser. This information is
  * persistent for main-items. The global environment can be saved and

-- 
2.50.0.727.gbf7dc18ff4-goog

