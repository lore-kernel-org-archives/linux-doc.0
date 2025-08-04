Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E32701AE
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316684; cv=none; b=OQhbSOIUj+r2wMWQYXc8NO0M9S1pA8/5ktn+/tIeOjXMy7IDxqlUpSFcOZjoemgV+4R6iYEZrSJ52SqTlAZr0yoXEQwN9j4CYezJL3G0Kkd20O1LI2U6+DBzXtVrWPsyp2HRy5hvZn0Jt12VznLjs/dQPYbadehnyE40/4P9Mw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316684; c=relaxed/simple;
	bh=sM1diI0+8QwBlMWWKxPjiFubTZJ47+1Rz6WjGiYKJLg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CjauFDIPrNdxOG6gzDUuzTDYqJ6oj6Xkuhlve/7+Fjme3xsRvPOxxxnlO3vRbM8LhYMTXVt2DOvhypMfC80cLs9K44JDZiLI/AF4dcK/i/VrGqQ9zu/975V0KB1hFFu/1BVgM8UuwDoKIcPWi5KjseYz2TdExCxfbfjcx+S2BX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YRThD+W3; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YRThD+W3"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-881878af906so144696139f.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316682; x=1754921482; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKCR9N5mLRlkbi0TLaRQSzln9H2RUOxEy61mEdM0ngY=;
        b=YRThD+W33fynYG4tAFFpcjdQAVOVjlusl0PCOE2Cw9y6YzovtmhFYCTi5qC2Oqc0hJ
         ZT56AYTwPseeCcOzC5vILQB7QUVfKbrLQnpDVFYQd0TqE7QC6yUfNWqPXAZZ+RuhOi37
         3gqLQfNTtfYOERgN41k1ow0fiyVwjrDh7pC3sKeANRj1mPKylIV9Gym0yFkV+O7ad2sx
         1+hFgG96GXydtUIeMZsNg8uZUwhvn6wYvMeTXYdE2yVpEJj66fAqEuGNIbIDGJHPkBzO
         VMEOphI6y5otDHXYQikl3xXMCwh/rBytp4b0fHpCnVgP/03fIT97dQif9tCvm7a10CsV
         BvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316682; x=1754921482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKCR9N5mLRlkbi0TLaRQSzln9H2RUOxEy61mEdM0ngY=;
        b=tH72/pOys0Uxak//2x0jgcCbzomf/qDGCfmXIv2JcBthjRjVFWWf4apAsOcMfH0BrN
         eDc2hYd32TCF9aZ5xVFbYYhuoys/Q8fx1EUCF0/SFFbELL7+yJcs4lZYziwBrz6AR9gG
         Z0tJwnMCM+sDWADZV24yOKoLaZcUxIoEpZNYRLlVwd84DGCiNaXCAqSjmFEYJ+/7pc6I
         PfMeSjbg0lLUXvcFpYkcKOOpVX/H6cpwxbcwMfGj4v194DWGC9QjyiLQqKGyUKla9bit
         sDwOzWvtyMXNUHNEbKefuOwKcg/JHpMj7J3xB2rxYZ/omKFscFyBRDP1x2CkwUBPdxUs
         ANhA==
X-Forwarded-Encrypted: i=1; AJvYcCURI7Gdv4GNLZY7Ong1SDgMpIx+q89wBBqAeTnzKYuOPKuiXzN9wqZ35KQ3s90uv7brf9AMuQRRH/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvKm32lN4HjTdytCBKCm7dyi34wqLw2nfzw+d3wuxyI3A4Ozri
	8Q4QQLBQcy/qnPEvlyHOTumawrrMjnu58KLBiDA2j7EI82vpKy5E/i8Q0WCpNnNwoE7DRx+9Shi
	pILWJ4FYqqA==
X-Google-Smtp-Source: AGHT+IG62l0XeGfQHwqlqdPD5To0kn4v4Bx1GZOjIxLss9+jyRgToxf6b+9GRK7gUtWE2MzF7/Yg60oLI5z1
X-Received: from ilsh9.prod.google.com ([2002:a05:6e02:529:b0:3e3:f33a:a85])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:8e:b0:3dd:89b0:8e1b
 with SMTP id e9e14a558f8ab-3e4161b3e64mr175173845ab.15.1754316682117; Mon, 04
 Aug 2025 07:11:22 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:18 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-3-138ca980261d@google.com>
Subject: [PATCH v2 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
haptic capabilities.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 Documentation/input/event-codes.rst    | 14 ++++++++++++++
 include/uapi/linux/input-event-codes.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index b4557462edd7b3fef9e9cd6c2c3cb2d05bb531ab..6f7aa9e8207c4aa825d9694ad891f4d105fe8196 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -400,6 +400,20 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
 All other axes retain their meaning. A device must not mix
 regular directional axes and accelerometer axes on the same event node.
 
+INPUT_PROP_HAPTIC_TOUCHPAD
+--------------------------
+
+The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
+- supports simple haptic auto and manual triggering
+- can differentiate between at least 5 fingers
+- uses correct resolution for the X/Y (units and value)
+- report correct force per touch, and correct units for them (newtons or grams)
+- follows the MT protocol type B
+
+Summing up, such devices follow the MS spec for input devices in
+Win8 and Win8.1, and in addition support the Simple haptic controller HID table,
+and report correct units for the pressure.
+
 Guidelines
 ==========
 
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 3b2524e4b667d1e7cc02ff5cb674e7c2ac069a66..efe8c36d4ee9a938ffb1b0dd0ddd0ec6a3fcb8fe 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -27,6 +27,7 @@
 #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
 #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
 #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
+#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
 
 #define INPUT_PROP_MAX			0x1f
 #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)

-- 
2.50.1.565.gc32cd1483b-goog

