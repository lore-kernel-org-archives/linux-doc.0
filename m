Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AE2765CD
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558648; cv=none; b=tYPD/0cH62UrDnNEL4tjiDzzRA3MKczhZ6F1UcQpmh7/V31tNQ9Q/mMrD9y+Yk0234weWNpeIr5Bzl3mbuN2H3Wo2pshW+cQFzQLpWYiEK9F4bbXI825T78XG5R1voFoQaUbObCnPAV8B89ZHSYoxJidc7WityHy/ZqRSng55xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558648; c=relaxed/simple;
	bh=QzCEIxx18I6Dj0G3rDwWXnTsi3l8IYWfitCaWWFrWcM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tVLKAtTPHy+3e8kIwXMF6P/RUHNH/8mTxU0dHb6r/a4P5ZlFnExwEwqlX6Yyqd92LSKgLTDPT0UsuYuSW7vuS7Bpy/0JK9m72YM7jPakQrFgOMEP/1h3e0ncflFgxzzMTPLmugYUsrZjqa8BRrUHu1xDzRhhQv8GGFlY9yCWdUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2KuOCjSD; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2KuOCjSD"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-88432e631a7so1353130539f.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558644; x=1756163444; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ITZzkiLaqD060Ratl1OWwnlE4RAvXOmdgj6yIgMWt2w=;
        b=2KuOCjSDquAmEWfnHLRwwqnydeQ54PAgJIdzXWJHI1hbjUFLqa9gDkBlC+bUeE+Fvv
         +7jdHhOmz14ANN/j1NnrvgpZKeRzfBsVyUTiphDPSOJyH+hjJyInIMQ5uutxprG8PvCI
         eq1KYz8S6O+tMxaqMTOhZZCfDOPXnSoShcZ5hjM6lYPwU0qwOHdiV60h1aswYPfR/FVw
         yzhwXKW9K01Cq9uucaWOZ5uuU0XdeE86bPkV08OaBrj0xPBFBn3FwWJ+HrmhaFyUI116
         pLE1XaX+r49ROifsy3GVMEM4sLbCVfCr11ZRyh+hyXjkPWcDgjdwokBB1Gwm1hbqMjXx
         V5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558644; x=1756163444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITZzkiLaqD060Ratl1OWwnlE4RAvXOmdgj6yIgMWt2w=;
        b=KDtPYxagE7jaLc+mrzMduQpSbr85JzCZTMBUYlNAiNN2mueHq0b3Z8g5EG1MIQYqyG
         FyHQgFzSQ7GNipP8huoG2XHIOw5YK58m99pGKl/4AogijP2ymw2PZO3BK0nfaiA2sV+b
         ZPXyA+a0FUbL+4AZCwaccd2F1vUylUAsbDDaQ3qBTztsVXwf1c7UrXvjgAmui4QitAoo
         heNdaFbR02mqpDbL/fciqH8xYOb3dACsZSHRlmCVitR/E5UVDbV3jiphnu9g9eoVJeFO
         mFopHvPIy5Y/Vzfde8R172RGDHBo1e8DAZaT59NVwkepVkH94LXMuxTE55GbCly3oqCW
         2vFA==
X-Forwarded-Encrypted: i=1; AJvYcCWBcISbbA/LYXpKC1T4Eo+1pcJxdLS0R4WIJ6ccytfijYYrI5h8frvEfY+4hAtR3N9TMMQgzqDKbQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW6/srCp7g2EVfZAY5UJGvHqB5Ds3ly+YG1U0UX+UOo5GeVrqL
	w6pzfqRP2POM2NfUzUgCrdR6HlylNLtUojhafHGI/q5AZ3Arce+xtyTFIPyDkZD5q6VFxWXvA97
	1iabi79zKGA==
X-Google-Smtp-Source: AGHT+IHIXN747lwgxpSgQ+h7oFBZFXW1MQGKxYRpOFDSVedpgyT/xvpq+lb9cz7ebi+XMoNgB+oEOljtC5hb
X-Received: from iotq15.prod.google.com ([2002:a5d:9f0f:0:b0:881:a131:25d7])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:1683:b0:880:f288:e8e5
 with SMTP id ca18e2360f4ac-88467ebfc66mr85554639f.5.1755558644101; Mon, 18
 Aug 2025 16:10:44 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:51 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-10-e4f9ab0add84@google.com>
Subject: [PATCH v3 10/11] HID: haptic: add hid_haptic_switch_mode
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Function hid_haptic_switch_mode() can be used to switch between
device-controlled mode and host-controlled mode. Uploading a
WAVEFORMPRESS or WAVEFORMRELEASE effect triggers host-controlled mode if
the device is in device-controlled mode.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-haptic.c | 66 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index c02af820051c22d1c899db84496c5a44b868fe49..aa090684c1f23b61a1ac4e9e7e523b31a8166a21 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -5,6 +5,7 @@
  *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
  */
 
+#include <linux/input/mt.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -197,12 +198,46 @@ static void fill_effect_buf(struct hid_haptic_device *haptic,
 	mutex_unlock(&haptic->manual_trigger_mutex);
 }
 
+static void switch_mode(struct hid_device *hdev, struct hid_haptic_device *haptic,
+			int mode)
+{
+	struct hid_report *rep = haptic->auto_trigger_report;
+	struct hid_field *field;
+	s32 value;
+	int i, j;
+
+	if (mode == HID_HAPTIC_MODE_HOST)
+		value = HID_HAPTIC_ORDINAL_WAVEFORMSTOP;
+	else
+		value = haptic->default_auto_trigger;
+
+	mutex_lock(&haptic->auto_trigger_mutex);
+	for (i = 0; i < rep->maxfield; i++) {
+		field = rep->field[i];
+		/* Ignore if report count is out of bounds. */
+		if (field->report_count < 1)
+			continue;
+
+		for (j = 0; j < field->maxusage; j++) {
+			if (field->usage[j].hid == HID_HP_AUTOTRIGGER)
+				field->value[j] = value;
+		}
+	}
+
+	/* send the report */
+	hid_hw_request(hdev, rep, HID_REQ_SET_REPORT);
+	mutex_unlock(&haptic->auto_trigger_mutex);
+	haptic->mode = mode;
+}
+
 static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 				    struct ff_effect *old)
 {
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_device *ff = dev->ff;
 	struct hid_haptic_device *haptic = ff->private;
 	int i, ordinal = 0;
+	bool switch_modes = false;
 
 	/* If vendor range, check vendor id and page */
 	if (effect->u.haptic.hid_usage >= (HID_HP_VENDORWAVEFORMMIN & HID_USAGE) &&
@@ -225,6 +260,16 @@ static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *eff
 	fill_effect_buf(haptic, &effect->u.haptic, &haptic->effect[effect->id],
 			ordinal);
 
+	if (effect->u.haptic.hid_usage == (HID_HP_WAVEFORMPRESS & HID_USAGE) ||
+			effect->u.haptic.hid_usage == (HID_HP_WAVEFORMRELEASE & HID_USAGE))
+		switch_modes = true;
+
+	/* If device is in autonomous mode, and the uploaded effect signals userspace
+	 * wants control of the device, change modes
+	 */
+	if (switch_modes && haptic->mode == HID_HAPTIC_MODE_DEVICE)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_HOST);
+
 	return 0;
 }
 
@@ -290,6 +335,7 @@ static void effect_set_default(struct ff_effect *effect)
 static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 {
 	struct hid_haptic_device *haptic = dev->ff->private;
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_effect effect;
 	int ordinal;
 
@@ -297,20 +343,25 @@ static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 
 	if (effect.u.haptic.hid_usage == (HID_HP_WAVEFORMRELEASE & HID_USAGE)) {
 		ordinal = haptic->release_ordinal;
-		if (!ordinal)
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
-		else
-			effect.u.haptic.hid_usage = HID_HP_WAVEFORMRELEASE &
-				HID_USAGE;
+			if (haptic->mode == HID_HAPTIC_MODE_HOST)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		} else
+			effect.u.haptic.hid_usage = HID_HP_WAVEFORMRELEASE & HID_USAGE;
+
 		fill_effect_buf(haptic, &effect.u.haptic, &haptic->effect[effect_id],
 				ordinal);
 	} else if (effect.u.haptic.hid_usage == (HID_HP_WAVEFORMPRESS & HID_USAGE)) {
 		ordinal = haptic->press_ordinal;
-		if (!ordinal)
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
+			if (haptic->mode == HID_HAPTIC_MODE_HOST)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		}
 		else
-			effect.u.haptic.hid_usage = HID_HP_WAVEFORMPRESS &
-				HID_USAGE;
+			effect.u.haptic.hid_usage = HID_HP_WAVEFORMPRESS & HID_USAGE;
+
 		fill_effect_buf(haptic, &effect.u.haptic, &haptic->effect[effect_id],
 				ordinal);
 	}
@@ -392,6 +443,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
 		HID_HP_WAVEFORMSTOP & HID_USAGE;
 
+	mutex_init(&haptic->auto_trigger_mutex);
 	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
 		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
 

-- 
2.51.0.rc1.193.gad69d77794-goog

