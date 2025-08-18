Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBA280305
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558648; cv=none; b=VCkHD9EgJ9FD+x+MvXJo6G/RCubcxM9u5fjJ2lWIsbFYYGYj6eLq/H4B82yMojg1OpN63kGBwU1byUc/7TMISBqLtOfduR5heSV2xNhzLNpuynxaCNhN6THy74odTQPW+m0iH60h+c1SS+5jqzeIbQdNqB4GRTP7C/3ZrOC+rzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558648; c=relaxed/simple;
	bh=pm1W0YfpOpWRiFbJt4o4DwVnxjqV5znVwyUekdvRLXU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aa1Tt/G+/K29s+/cGcVhIfWECd/ODoHcQOQEapvDhuRiinkJya/EwDpJQg6XVkHiXDy26In8fqV1YkNukTFC2p64Rx/1q4Rwph5IyyMx3EEhMNvUyQXf19B/P9jW9gAbmlnK92ItBuv05UIAHTFRx6lrjIDT8ZYjELipIuFMCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=obh3M1he; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="obh3M1he"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-88432e1c782so585144039f.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 16:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558645; x=1756163445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=weSzBVnDQwjDP7j2MvS38YwDqh+Hi+XeLH59AMJj2cU=;
        b=obh3M1he/uBiWescp4u2j2cnFx0V6CQ8VIFWaPfcNxgQckqYIwj0JkLktkp7fiihcr
         n+DUjQ6KtEIEC3O7KDhFwyvSpVYVDQkVqN4Wfe2x0vQCHOXFReh1cvrQ+/JCj1HYKf8j
         x2GuAZVDk7OgFg4Ggpi+dFCrkvnzjk776urDjUauwlgAe18wsPEwHnN2o56NB5X1X7yW
         TQJr3kPzKZUwyYwISj9eSi8VYdhffgTUGQEHa+ueSHA9YQkouUOoRonZAV33tKvZMOxM
         CI3ANjSPTZ2kir5KKfdFkaHKrTyQRHPUrF982KyBNdJHC0asiR6QXhEOLNWaOkKqShYs
         ozMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558645; x=1756163445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weSzBVnDQwjDP7j2MvS38YwDqh+Hi+XeLH59AMJj2cU=;
        b=iHFIR+L4yDqX/VlFoCfuqiwU9DGFUJchceENKMZL2lfqtkF/uDlDLQoAkFcdSgxFSe
         6ABJsiYfqG+atRTeYZ3lWOrgNPWwYXLTI/u6ZTXaoNRHSaUap382hHJQja0r3wGLrUVP
         mzJ5l+tlw7a8b2dCkuPOF9b3dmQTxRvdVfrPRyUG/2J/MszTmTEscKYZIkZ17YH3GPe7
         bIJIIg+UvmoQdNbvPZCjRnJe3nFaf9EIDoeX/awSI9Wwd49uF7+u+4WKI4aOm9w+ENAs
         bz7dCOt+Zsr+L2Zy/6yVFEdgIomYTZWedziHy+335LXtBkSVKFfXDK/XywktTxhZctFE
         gZdw==
X-Forwarded-Encrypted: i=1; AJvYcCWycl77lBqYInAcphzoE4dyTh+Xx5agKXtWQ/20AACL11EbTnjxrM5UAZw1er6f33SwL35CbmdnQLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPVKIshRy9Rbu+l69lFS+KumrsgWqHpWkb0UL/7MiOfC4LoYA
	E5NJA3OSTFIRc1dj/ChyQ5YH3A240R8JyJop24W4yWCY1DXIljtpGgyjM62s4zIjRIRrHocYIMi
	Z3jdOkDamGQ==
X-Google-Smtp-Source: AGHT+IEaW72/Pb59rNZtAEgraB28P029G7O5swShzAoxNgLe6iTZBLDO7jtuVyNiADWynNE2azecOrk3BnJX
X-Received: from iobbe15.prod.google.com ([2002:a05:6602:378f:b0:884:3f50:a648])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:2dd4:b0:884:315d:e433
 with SMTP id ca18e2360f4ac-88467f6312fmr87282339f.12.1755558635646; Mon, 18
 Aug 2025 16:10:35 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:43 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-2-e4f9ab0add84@google.com>
Subject: [PATCH v3 02/11] Input: add FF_HAPTIC effect type
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

FF_HAPTIC effect type can be used to trigger haptic feedback with HID
simple haptic usages.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 include/uapi/linux/input.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 2557eb7b056178b2b8be98d9cea855eba1bd5aaf..a440fafaa018947f4d9ca0a15af2b4c6bd0ae6a0 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -428,6 +428,24 @@ struct ff_rumble_effect {
 	__u16 weak_magnitude;
 };
 
+/**
+ * struct ff_haptic_effect
+ * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
+ * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined range
+ * @vendor_waveform_page: the vendor waveform page if hid_usage is in the vendor-defined range
+ * @intensity: strength of the effect as percentage
+ * @repeat_count: number of times to retrigger effect
+ * @retrigger_period: time before effect is retriggered (in ms)
+ */
+struct ff_haptic_effect {
+	__u16 hid_usage;
+	__u16 vendor_id;
+	__u8  vendor_waveform_page;
+	__u16 intensity;
+	__u16 repeat_count;
+	__u16 retrigger_period;
+};
+
 /**
  * struct ff_effect - defines force feedback effect
  * @type: type of the effect (FF_CONSTANT, FF_PERIODIC, FF_RAMP, FF_SPRING,
@@ -464,6 +482,7 @@ struct ff_effect {
 		struct ff_periodic_effect periodic;
 		struct ff_condition_effect condition[2]; /* One for each axis */
 		struct ff_rumble_effect rumble;
+		struct ff_haptic_effect haptic;
 	} u;
 };
 
@@ -471,6 +490,7 @@ struct ff_effect {
  * Force feedback effect types
  */
 
+#define FF_HAPTIC		0x4f
 #define FF_RUMBLE	0x50
 #define FF_PERIODIC	0x51
 #define FF_CONSTANT	0x52
@@ -480,7 +500,7 @@ struct ff_effect {
 #define FF_INERTIA	0x56
 #define FF_RAMP		0x57
 
-#define FF_EFFECT_MIN	FF_RUMBLE
+#define FF_EFFECT_MIN	FF_HAPTIC
 #define FF_EFFECT_MAX	FF_RAMP
 
 /*

-- 
2.51.0.rc1.193.gad69d77794-goog

