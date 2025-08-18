Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114C72765C0
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558638; cv=none; b=J6wZL+SnMi5DBbIgeyiSF4ucZKLi9fZWnp72t4SOtJ2tam0DxXmTgXb/jUik0OQdpmJh09MKNGcqgTt71XhGMDxnmixH7NacFl+8z80I+Ao0AgSbjFlMp/HGg5eGKK+RqM01wok4FD7fpclrxZ9XoFvKKTYfXZjmCPO5rXihkog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558638; c=relaxed/simple;
	bh=fmhEJJJB/E1FFPI5LjG9ozybSomAbkYBLER6Pk9jyms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HeRLQUo6GIPa8g4/QQfr5aQOJ2RRAQiQehKKn8bkzIN2WV/uxlmzgqgt8o67QIg8qS1+nN2HQS2ST5Ulya71iFDYKerkZvDc19ZSbP1zuj0ayUjBSDjbSbKAgs4+FR/BX6lEtQsGSLs+1W0C6WDdvgZfsxEboSazKAQEC31GyxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6pnQoVB; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6pnQoVB"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e671c9e964so10945135ab.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558634; x=1756163434; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H0QevRU85Pi+9axz8eFxpRKcQRe8ukOlLHQx9hBgz38=;
        b=H6pnQoVBSjnxDHOw8nUX5IrGcTb67khWH+mXN0py21h+cRLyrLx//f4BOCbEj00O5g
         7tHDfWumzYoT6SYRxw75nATdGvB5jnY/2YR9UY4ofnYDcdkzeXwrDEOJX7KXCFQps+Ds
         9GkTxwcDlwdNFQSZaRjFL+FYaO9sTq133m3KmgOolIjCqFmFTdKGUsjK1D+6VKz1FjSA
         UELLJNDzOd3Jf2Wp3y9H5prYCVNHlIC8v8C9iXfvoI8i0Iaa8nCvZlGs1IDR57ommzpn
         KTyD+2Dot2X1GZr0K78chufYGyigTTOGekN8qYMXmI0NwBpMm8gvufYXsxkL7PAeomfo
         Y+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558634; x=1756163434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0QevRU85Pi+9axz8eFxpRKcQRe8ukOlLHQx9hBgz38=;
        b=HHLWlVJlm4WA15G5BdPMeQTbhKqYjWOFZ4x7Urn0xMzpyaqezUGq3ZGUpTIYOvS64I
         KkVKBmgJAImjTewxlJ1ZpDlFLbkBKHsSuyXlk4Q1Al3v/q0v/X0CQX+v2HumoF+e7Ikp
         MdHjusV3VRbtll+zRmdYqn2gEL5S9Y5rS5y2KN2IA0c32BMeDjL7npL6wx0qK8GrbMy7
         eNHcBol0DIwXdpU5I3pEeJSe6z2k7322SYb9e6tRugUl1FAvM8dG66gOb5FXW4e4tX7Q
         zrkBDnogJMA52U2F1mPPjkKaOz/7ussIlSFKkAKQ6cUJVraJDJ0CUcaAn347ug2XtRJ9
         p+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWPbtoOawUGbSsPdWKkA19r1/4y+FJ+0v2w6JIvYllDBPBYheB3Td6JVkxUXtL7b+eVYxwZr5C9lNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMxCXL5RR/Opqs/BjkEAsa0SU3TDvE9VADuiGMYo5gVTFk9K/
	Z/athdl88SbcamDJKdvcYkCXv/YV5JA25QVH0KDAxlGbxBbMjhPKGa601C0OtRK0D7kCc1v8f5N
	lLasYBgrYYA==
X-Google-Smtp-Source: AGHT+IFCfiADlQxcsJnYSe59mlfocD3gP94iu57cJNx0vOjYhVOrRJWHhrHJK//rZTjPILcmNtM8bbwrPkcR
X-Received: from jabc24.prod.google.com ([2002:a05:6638:c218:b0:50a:68a6:1578])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1a26:b0:3e3:cc1b:2b5e
 with SMTP id e9e14a558f8ab-3e676627764mr9826585ab.15.1755558634367; Mon, 18
 Aug 2025 16:10:34 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:42 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-1-e4f9ab0add84@google.com>
Subject: [PATCH v3 01/11] HID: add haptics page defines
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
2.51.0.rc1.193.gad69d77794-goog

