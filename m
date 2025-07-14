Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98525CC73
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505785; cv=none; b=NspBMxpKRnO1njxyJPZMi8BH3BBBbk0z34ue9W4bdsKjiObkIiM+Qi+Q/62OTcNEBKgtgPrVvY+0YhotlfT/lgduRC1/FxaRPv17JLzuhBMtl1h275nu+4vYrnKjNb2Jfbp6+NjI+4lu0mermrKDgxz933McO+Q95G+R8WaHaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505785; c=relaxed/simple;
	bh=/xx44fZm9CFefiwNufDk2tw2SX+xzRq16zogo7FXey4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DiyNHVK4edSf8vqlRcvk4aXTBfM0iSN7dSW+hMdCruanfdrkDm69+EfJfDWflXU72XU7EDtNIKOzGRQqp/e32cIs5TgfQVz3GADt7rtFwc1FBc5P76+GykhSXe/ugQYPXASRo1zu6tQIX8H6VcJngcSmF76xSxab6uP31HwdbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmrlTTkc; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmrlTTkc"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-613c312ba54so4190202eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505783; x=1753110583; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=67bqH3GyDp5YSS0C73rDz9/lGoijs6/n2SixQxLDey4=;
        b=XmrlTTkcuaMOcHWBnyg+r6lVthSGu9jWM1R1oPpthAHtrxnh+0n/ZLKGOHvknPAq+U
         cBtzPfslmgunbmi0dlLbK1V7+Im+Nhm7X6sn4oGyby8Hy+u7UcnBKKDw/Lw4DYbd1L7Y
         BFHP1QWha7in6hWKVRhcfRPEXVKrHHLUN2JZHoLTiGNXscVHo9L9cDXiE52U2CJsOowf
         0k6wm7/BHuo7NxggkVKugM7WsGHikosJHkgnR82N1sj5w1MzfbRQKZEnRQLlhiCkPKfQ
         hQUZSMyFEHlVxYS1IbnMqva5zr/1UwI4JBCQKxemtiunnsoeBEnHvwl3LW21A4slcuzA
         Mi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505783; x=1753110583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67bqH3GyDp5YSS0C73rDz9/lGoijs6/n2SixQxLDey4=;
        b=JHYuy0JTVxv9bx+yb9WGyL+IcNlvUDVw/PNCJOgisfl03te9cWkKNsG8ypon3DCpdU
         PWVBRbF65vH3HB89qN+9TOtx8jq5IOoQXKF43E8IrKsZh/UjgI+xoMmqFmSYvAF+1LyY
         woXXBTalBUMzmvbhOnGRdEvzN4XUNP3hJHh17s6Rdt1A94tZjY4nsThFk/kqzRax0KI7
         pLJiwaBWJt4racAtzRAit7pJZbfXtK0Aye933kqcnqW2b0tWABB81p1BugxAij+EtFbA
         Q7uzXuBMINu9PMPlXVxfqIegzUcocT7IF6pxIIw7qS/PcUH4tJEos1SvtfzB2E9hN6aY
         +WMw==
X-Forwarded-Encrypted: i=1; AJvYcCUfG8MgdydCVRxr5zGz1vX9zdvpJiwGzVHmRPvoYivGhbYeXtJlx775i7ZUiFB+Xn18diIyQTvU2k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycnI1obcnTGSKlc1zPQmgJh2ORRl1vYt1EjqbaHbM0FX2+HTT8
	jj7fBZ8nhFK8DfDRGSisEyUuP1OBp5LXebvv0sec7MIG6D8EwOpRdJ76Mv7FI0TN8oGhOquuRfB
	d7rf01uB9+A==
X-Google-Smtp-Source: AGHT+IGuSQqfqovrFAWMf6k1waoV/ChJgmKytwt31JmlAyf3zT371GAzTFjKdu0b7R7LKngAf0vQQJHsGIF7
X-Received: from oabwn16.prod.google.com ([2002:a05:6871:a910:b0:2c1:64e4:adb9])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e609:b0:2ea:7101:7dc1
 with SMTP id 586e51a60fabf-2ff27166c23mr9125788fac.33.1752505783196; Mon, 14
 Jul 2025 08:09:43 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:38 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-5-71c7c05748c9@google.com>
Subject: [PATCH 05/11] HID: input: allow mapping of haptic output
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

This change makes it possible to parse output reports by input mapping
functions by HID drivers.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91ebd8d8bdafaac07b5f85693b179cb4..d42c1fbd20a1cc01c04f93cf10f1d1c18043929c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -682,9 +682,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	if (field->report_count < 1)
 		goto ignore;
 
-	/* only LED usages are supported in output fields */
+	/* only LED and HAPTIC usages are supported in output fields */
 	if (field->report_type == HID_OUTPUT_REPORT &&
-			(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_LED &&
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_HAPTIC) {
 		goto ignore;
 	}
 

-- 
2.50.0.727.gbf7dc18ff4-goog

