Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5F271464
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316686; cv=none; b=Ft4poEbLArsrrqjVfjvye4Ql66FsD9Pm0e+s/n5wL61h+tqN/9UGVDOL80KAMGfDOEr6CVcHWG5p+7k2wvBtbNG0otG/mh4ZvslUGOB5Hl1nRPyvh+G3F12nXtLu+xehwIRG9uHdK0Bg52kOYEYuFPM2UkZhV97Azv3jfw4X7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316686; c=relaxed/simple;
	bh=iPB28TrEQ4MzyoHFPSBZfFSdBRfwDn75E/cHEkPI3WM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T2A5xyswM9XAQ66234pP+gOf6KolC9Pbz3CbOgLuSBFOHnFsI67oEXabqvX7nwj1cpty9v+xU80lNjg96x2c6SGZjzKJaapk3XAyfrI876pusoPG40JSPVdTHQIbJ7N9CKuXTJ6pRlHJMzVwztgWt7zeYppC2ggPoF1TYrbHzvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHKzsDRz; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHKzsDRz"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e3e6bd9e7eso32713045ab.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316684; x=1754921484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XcyO4Be4c4JXobjE7cGf2J4UxRVRdyWKCOO7WXUW/0=;
        b=tHKzsDRznyqF+49xYcriauuQh5hkkGMhguYP7PddHXjnP9tgeOepaGHoHKtzsPxZZ8
         87B0JHZDH6Ppv5kHueKs5k/Yaf9FJ3+69E6mjtmQ9jSWYNgzxdc+IPzExs49bln2wdE9
         XHlwMvj9MEbaJunsvD4pSkoWlqqlfIoLrN5ilHxVenn/LmZ611akmhzikSh/g2/NgNyP
         bDfOY9cNEZOSmGZLpQ7m2FJeOaYZU/gHo91yC+T9NVgw5BqeEEjCdvAKlQtDnWkUXoY/
         QIjyHJRC30IsgfXy70z8bsYJ4fbcD/WV+KH7V4F+1YmdFLghskaRIulceRSldpqLfeEn
         G6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316684; x=1754921484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XcyO4Be4c4JXobjE7cGf2J4UxRVRdyWKCOO7WXUW/0=;
        b=PEmYt/1BSSUTlExTUAZhWrWg52e6QW3LVk9vWaHy2npAhfMKOX/7Mwdf0wnYLyCgIQ
         8IPilQrxkcHu5VBaD2Mv3Lu10lFsOyGt6N7ntl8yZSacjqkAwpt6G+i67oTggneKrfpq
         zGL33V9IDcfj1OwdmAqN9cq9z3qykC2E18jMFmBy8o4M/df1NDYS6rS23Mz5tcB8h52J
         W8v8hrdOU1Wubz0Id1xt0rcj7YaDqP4kQBh7XRNFfOgtu3zbiCCQoQASi8ocJ3b1ibjQ
         odjS2pTejsXlBMp7o9ey576Yv+6YugX1/4hgBW/xoDYLJodvae7zOp5kz7a/IqDxNOBj
         97fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV68SR/uN84ylOJ/qXCMrfla2m6XwvdMuGMv6gZ03mrz1dasIx4EZ0877HTeWaRO15ToACq6GxUovs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycb/9B//LPp7D1WTjvsy5H5n1kRlPdoyPyPUUqBTLjMFZG7We4
	MUQnDkgzXyY3rGZPHuc7v2yG8cVWp9wayT+zXgSnEWOB8LIB2ZRm42LS9AMC6XpxoCfOJaIeVel
	lZ05Zc/qQCQ==
X-Google-Smtp-Source: AGHT+IGQi4BTJ2NRlvn9MIpnL6hO8RfWm/njfcBlrxUeB0NVxLukwkbFNqqbpuRQl0T8A20PSlKvv7sC5069
X-Received: from ilbec19.prod.google.com ([2002:a05:6e02:4713:b0:3e4:90c:613a])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:2789:b0:3e0:4564:4ef9
 with SMTP id e9e14a558f8ab-3e4160fb669mr165839005ab.4.1754316684472; Mon, 04
 Aug 2025 07:11:24 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:20 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-5-138ca980261d@google.com>
Subject: [PATCH v2 05/11] HID: input: allow mapping of haptic output
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
2.50.1.565.gc32cd1483b-goog

