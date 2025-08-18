Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BAD322A05
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527350; cv=none; b=VQIHqLpJkzqCZgAIL2DOb1Zb+Ezkpo7UQwqyTRWUSxwFNnwsWxjkwVVq/RzAAEYMOL335uNBQdSxir65thU8TOZ333iFS5di/17lwW9/GQQ1WpLFeR8EGhx4AUsMOFuSXIgW1cWJxJXJUOeSxcBfhoHAOACtJmSqYCjK+xRFNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527350; c=relaxed/simple;
	bh=NWZOt7Tv/JR11rhWhB2/TKtjzpxtTktoH9dWK3nHU4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s9xkDeiJ6paX+9a3fJuik08sjFfeowLKJiniyuacQIfMoVNiD+bh6B0dWl/0b8355garLe/A/fA2ANuEF42GHsO+ZjRSBgN27lJEqG7Pr1C2EMkl9+A7AQmzy4G7DIYYOSu3AacF3v1+fvxDaHxdkR7Qu0r87KM2F8LdnwvVC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kRRRVc2H; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kRRRVc2H"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-74382040c94so1115215a34.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527347; x=1756132147; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OWqdzpYUL7+PpXDh/tU9TKsciamS6RX7nVkdacIMWsQ=;
        b=kRRRVc2HQH1Jsn6PtczYQg50oJDl8xMJsg87ksNogm4YmBRjzZ4Nm/CS7Y/imJCft2
         FLtrSJbLMhoKiu5D4k8YpWtuEhAqVwW3JQwjbtuhdzU7KUKU0baPC+uDK8ga2oj9HySr
         8tNU85QTyuMYkd4YAfUTuKMV0eFUGZ57ArYfcdyyb0ZuI3Ta0x9n9obSc7sgwdr/Enkb
         6On97Z/eUI4+mAEIsE7dHrLgyG+2+AxNMojRVTLR7jafYGHgVGKkU3+S76jjTeTdRdjp
         sMiZ5GGVOlVOimcPEG9FzfoCAuC800JdUzAxKBipK07iqJH2fuXVyFX4hwYDI2YvgKw2
         zP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527347; x=1756132147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWqdzpYUL7+PpXDh/tU9TKsciamS6RX7nVkdacIMWsQ=;
        b=Wou8p3CwJi33DTctG/5yw7Iya3KacF9vpoeftBfog9OWHpzKzac60yV/zFqkpLlhWm
         0lBJqS6NcPe66skQy9+F0MY+fciDgGR0LX1o5XS2YKwNtWWLIpjGrV8o71zRsHguuNeI
         WEVPDSGhfTWN0F48x/oO+tf/vA7zGq88VxEzkCo2WJbXkx6/nvrUx0B9BCgh053G1/YW
         dJtppSOepF4bbZHl+cWxBeZ2fpiH62vMKR8sZFF50gVvlkCtG2hLg00DaJvLaseRjGQX
         1rDoJU0EhkhmeONtXLoDMKMmD7pAJwiUB9QWg+EKtjyL3CE8ODt8jJ3jHSDpIsAChehk
         37Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXh2z6hF6GkoBY/UvWhc1GV0trtzJWO+WWTnsZv5fPPTQpc2p6tv62p5x7p9Zjmvkbl4/KLJmgYOpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcwrJVfJok4H3I9yujcmhUDYNdihLfmTm3lcFuuOBw6DMl1Uyb
	h36wJIdadqHTT5CyDSXjfucBo9Pgcj6DAkjEURPTOS0Gq97d2G8/GQ/5L5U6hdg9KMcHVzcCY7J
	SaHvJYfsOAQ==
X-Google-Smtp-Source: AGHT+IH/qWzGqtEr/vp9llvd19SDMUbdy4409bfsCXcE5kPKwgW4iYVg3RWQ/06UA2ygO5oVNc/NYMA1/tmT
X-Received: from otvq39.prod.google.com ([2002:a05:6830:4427:b0:741:614a:ed95])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:6110:b0:743:8443:6b31
 with SMTP id 46e09a7af769-7439b9ccd8dmr4664627a34.6.1755527347292; Mon, 18
 Aug 2025 07:29:07 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:08 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-8-ca2546e319d5@google.com>
Subject: [PATCH v2 08/11] HID: haptic: add functions handling events
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Implement hid_haptic_handle_press_release() which generates haptic feedback
as well as saves the pressed state of the haptic device.
Add functions to increase and reset the state of the pressure detected by
the device.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-haptic.c | 20 +++++++++++++++++++-
 drivers/hid/hid-haptic.h | 15 +++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index ef09b4039f33f15d7220e69fbed10bd8b0362bb4..c02af820051c22d1c899db84496c5a44b868fe49 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -50,8 +50,13 @@ EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
 bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
 				    struct hid_input *hi, struct hid_field *field)
 {
-	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON) {
+		haptic->force_logical_minimum = field->logical_minimum;
+		haptic->force_physical_minimum = field->physical_minimum;
+		haptic->force_resolution = input_abs_get_res(hi->input,
+							     ABS_MT_PRESSURE);
 		return true;
+	}
 	return false;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
@@ -508,3 +513,16 @@ int hid_haptic_init(struct hid_device *hdev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_init);
+
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{
+	haptic->pressure_sum = 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_reset);
+
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				 __s32 pressure)
+{
+	haptic->pressure_sum += pressure;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_increase);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 402ac66954e315eb5444df277ab2b9a4ec415dd6..73601f429de16bae3b1d877445f7eebf41a69d94 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -74,6 +74,10 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure);
 #else
 static inline
 void hid_haptic_feature_mapping(struct hid_device *hdev,
@@ -107,4 +111,15 @@ int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_p
 {
 	return 0;
 }
+static inline
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
+{}
+static inline
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{}
+static inline
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure)
+{}
 #endif
+

-- 
2.51.0.rc1.163.g2494970778-goog

