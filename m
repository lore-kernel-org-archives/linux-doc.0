Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A8217F54
	for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2024 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954097; cv=none; b=LqXTKp/7UiC9kJsqepbGhFNXz6mYPg2ZHDjM3G8ThIypjobhm6WsE+twnifTz9sjplstjYRxJjw/9hiNxlBekW8csGNGw1tRTezKST4G8I/xY7swARt/1IN0VmdYLZ+hiSJBRifEOuyByExBlO6Cuo8DTsPKC24bdgFyityHWHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954097; c=relaxed/simple;
	bh=MWxPZ0rd0vQSSGb1OYfWrjEcHEmLMZBNRKOr3PUqu1U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=el5umYNOnRC9bJ4I/SMNqY+Z2E1Yzs/KlIJpz7UhYGV3wb4BhGCrJZel/ir/cj9KJjAsxGi6LdUCwM3LTWx/DIkXhCffPJH1C8y51nC4DlTmvee70b7QctZGuFFu1t05tcr3JRFf2+eH3YrhZDr2agKMATak1p1F3T/XfIVxGmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=Bgr+Ftoq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="Bgr+Ftoq"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cb6704ff6bso3725328a12.3
        for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2024 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1729954093; x=1730558893; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qC024lRJVAEmIHLuN+s83Hm+ef/1j+PPbHp473apDbA=;
        b=Bgr+FtoqNJnerTcO0wKkFHUGafd7/GJWb5Llvrz6rxduM3NbqZeqp/1Ln/YB/D7kSo
         76MWFU9Qf40cfaT0Ge1wbbjUpLYViTrkdXERKh2BfnTp00umUlarme+RZFiIOXLkJ2Ya
         9sjNiHBwqgQ+o4AFIDnvM37XpLeB+G/outCvghWxrS3wSwY9HZzkhBBkBpMXHvgGe1Rc
         oHGa38A+csgmP381YPbk76LwCBsQ4mHGeWjtkSYBiYPVcLu3IupjNEfziKDxV186n6/Q
         6PwQoVEwrSSyBf6JyRMecu4K7M2G8dWYwhgt+IpHp7oaXTPCBvB1AxrjWiPimLx4fnTl
         kkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729954093; x=1730558893;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qC024lRJVAEmIHLuN+s83Hm+ef/1j+PPbHp473apDbA=;
        b=brGUSqAdhfWLAyWFcHze1Xh0KJpYqGuhB/ucfyolmNwRcysN2UAA9S4ZeSVywf9Cm8
         HCy7kuz0aAfWpJrx+7JVk1uMoMbBBc5vC9FxREe8JvsAmJu0bTzIS1OTQAFsBVJXTUTg
         9oXvtoe4yzwF8MiyZlae79sReGFzPu1SYD5OmtsKjICB18ARasKJa7zyesK3BdUQJBOD
         vTCuvdlYH7prMBveMBt7CDz0jtXz9FNWVb7Ls/o6CCCKmyE77mxx+6pufptuBjG7AoQo
         OK94jgSiIud+cckdVIUxHO/PP/B6bpS9UxgvTAwiOCYk3tcVUo1nGOOaSD1+LBRyDfiI
         vr9A==
X-Forwarded-Encrypted: i=1; AJvYcCXsKVza1codBEZLvH2b7H2WDt4UQKtBkiJGDEqRF6obzoDqKj9yR3o72MGT0iJ0lUUDpfwBA9pp4sc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gEzIxNN+CNn/cb+jPQzCaC7sw8HnPKFfgklQTn4GMOeLukyF
	DsHAdS88gnkb836mpx8SKXJ2xySSxphTBFek/y2NTgU5hHHfElNcsANtkzO5wg4IjixR9tFt8wa
	yQpVsz5UP2MzZk9v3ksJ36IyY73R8yX37B7AUI2oJeQmT0raNYoMgl8+VqreC2gnP01F0WkMO8/
	iyC0BVhPr5g7icnTISubj+JbY=
X-Google-Smtp-Source: AGHT+IG4PpxrQduHWvKVj7/srrfd0iKQ4sb0Q12T19VO7aaWAAlCMAAaNmGu/B9Jn4rtQnFNhOISWA==
X-Received: by 2002:a05:6402:1d50:b0:5c8:9548:f28b with SMTP id 4fb4d7f45d1cf-5cbbf8a6813mr2154556a12.11.1729954093244;
        Sat, 26 Oct 2024 07:48:13 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:158c:1efa:f963:7401])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c42c7sm1586799a12.51.2024.10.26.07.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 07:48:12 -0700 (PDT)
Date: Sat, 26 Oct 2024 16:48:10 +0200
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: pavel@ucw.cz, lee@kernel.org, corbet@lwn.net,
	linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] Documentation:leds: Add leds-st1202.rst
Message-ID: <Zx0BKtXo55D_pCGk@admins-Air>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add usage for sysfs hw_pattern entry for leds-st1202 

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
 Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/leds/leds-st1202.rst

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
new file mode 100644
index 000000000000..72286a512c69
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED
+controller, implements 12 low-side current generators
+with independent dimming control. Internal volatile memory
+allows the user to store up to 8 different patterns.
+Each pattern is a particular output configuration in terms
+of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern
+format, maximum 8 tuples of brightness (PWM) and duration must
+be written to hw_pattern.
+
+- Min pattern duration: 22 ms
+- Max pattern duration: 5660 ms
+
+The format of the hardware pattern values should be:
+"brightness duration brightness duration ..."
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+Specify a pattern repeat number, which is common for all channels.
+Default is 1, other negative numbers and number 0 are invalid.
+
+This file will always return the originally written repeat number.
+
+When the 255 value is written to it, all patterns will repeat
+indefinitely.
-- 
2.39.3 (Apple Git-145)

