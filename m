Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C126FA5E
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316683; cv=none; b=dzuHWUykRtY/wxy9gop+GekQ9phD5x2ad5aJEgei/pGUaqqkg6JqaPPgQU9WaQMJndo8/EVEGcIrXYZojNfOltpf3cfoJ2/ZXQKGWjPyUnrSUyaB/xP6ZG87mb3OALNK/+0aOn6YdCwThWRHATpB7M35jDVKrfRaRZUXgZ84Isk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316683; c=relaxed/simple;
	bh=wD7KH2nul7xWSFaFztu+JHvu62EHoaiPuiZ2VbswsXQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aF+egJVYenQvHKprdLgWyiI0RqFOBUE5FRRmrmHt6d6oEch3xc+n7xsMr8/c3V8d1/pRhuLVHf4VjlQJfHKsql9+8AqtnS9DA7vmo+4ab8/ptHlizxcSqK7j4dqKkVM9dJBn5ut9k6/LW5bYWF9LIGDxFlw+mVVsWp0Ce15PIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wGbbrE5u; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wGbbrE5u"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-881878af906so144689539f.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316680; x=1754921480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nuKq8QjQJ5E3pwFU8vQVEGwZ2XyLx0FOu2w9SY7fuwY=;
        b=wGbbrE5u0L6vY3yKUtsgUVTk2CO2QGeOfVbJdtQ7ZdSWQfjOww3Z233O/KE1+5MKMO
         o1Uljxm+Gw216g4teq7ve+xhlQKB1PKWtepWEKy08DeyTXanY0jvLci9XDytsrZUsrU8
         gEmylG95EUlDH07eLjfoxBu+cyp2o68LG0KFKZsrJT0sJSus+YhXoHYUcDE/xsUsJBsH
         R9GEykujNmyGN6NxIB0x0JrbqfbVsYwnfEkwDgKx5ceZhgTCyhXc1TNsTAG7DdCH5b1Z
         PKoil1C16BCoPRxD9MCHlrd1FpRf6690sVjWe5F8XMi5vCv1XpZWl0hYrojY5eWRcMSO
         Rscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316680; x=1754921480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuKq8QjQJ5E3pwFU8vQVEGwZ2XyLx0FOu2w9SY7fuwY=;
        b=eBnsa29bCzUt3aNa0bOdHqFM6GBRgfCKRFfOGtQMYGUjgHLKq5BDTYV7JOCIiY3ScR
         2CuNeMqjDAFGHvdakchfNxV4lAIZOBRXJlZh/m11jt+alGgooXGFadEhTe58wKXMbiU1
         oo3/mJeooeFjK0fLoCyEtfItOPL4KRZ8o6x44RydeFzKWBc2LwKIMKrnxfcTnkTzO5TN
         e40By+Y03/ePN7Q/BQxdkPBAyZX0wxyaQ/DRNXclNEoopsJg3vdeJ+ksGoEq/KAMMci0
         BO/+NhJZPKBoti1qEkNqSZPJ3BDT+7NYLiR0KCozKb6gznOXMznZGSZun+C2TjTbH3fe
         UWDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Se941XyFZPrVI4UMAvLVb/m2KDLbI+9UuXOvQ1OT/eAppH4ldp/W7QXMg24AxvvRR56O1bFgctw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykgjH+evbdbjtRV1hf2WW0MhnG2ERWgzU+dX2C9Wz5aKpso28H
	YENIbOI/ETGC2YZgKUj7hjAgar2CmM43LeviRcw1ZWyRgJ8yFe41rrmIsmldvQ1swuRApoS0vnV
	OsQrfUwJ0wQ==
X-Google-Smtp-Source: AGHT+IHqRipYLC3AElMPz+s9p6pNzZ5o6ocGxk8AyELudHcmR9kBNMUK6KIuj/qjmZElU5urf4KNvsxsch+6
X-Received: from iobbf13.prod.google.com ([2002:a05:6602:368d:b0:881:7968:8236])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:6b81:b0:87c:34e3:1790
 with SMTP id ca18e2360f4ac-88168313db5mr1501133939f.1.1754316679742; Mon, 04
 Aug 2025 07:11:19 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:16 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-1-138ca980261d@google.com>
Subject: [PATCH v2 01/11] HID: add haptics page defines
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
2.50.1.565.gc32cd1483b-goog

