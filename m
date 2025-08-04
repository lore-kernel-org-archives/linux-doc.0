Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F22272E5E
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316691; cv=none; b=dnVlgFj+Kh4R9o78iMut/PAHzEWAjJJOU1f4y859Vo4QL3oOTuZC2RP21lG5R/ji0iAFogviWYYkeJYxwIeUWuACcsd1GkY77FIownLigXO1l4GVhCne2Z1t1NQ93E+ery3RzamwoOYPOyofXy4LFHQdpHMiiROcVC770ImpSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316691; c=relaxed/simple;
	bh=6aJ0IUU1tiFShlsFi/Km91IALlxM+CUT5l8lbTEFVkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RA2DGPGdOd022owPrPyFMeyrP45cM+lT0rHBkWKyrhoiVg6x4aM+8SqUAc+WWHFZ9aIx19eG7SACHBV64T4BJhiiZpAIe2kaZ79eJ54sCCqais5HRVaY7AbmzGGpw6cna1IWmQ8lfDPjP5ak4lIHpq4oP9wXXiBcXlc1ZYjd0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ho/n3djK; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ho/n3djK"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-6197c433f6eso3312685eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316688; x=1754921488; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ek7nkTx7oQBr5pmhvnHkJbcjWINhcn0PApuRdg7tPwI=;
        b=Ho/n3djK/vOziCz6veotTl0aEjkAhlwcVGf6dNfvF9zXQik5iO6xiiBrkdLCEFApk4
         RIFUMfGPNJWGAZPyZROIkRTbuUcygeQWU6RnCSQolUdilBctaEfrb9uDipDSFHEhUqFh
         fZ0JtCDjFKX+yncnF5EhAHriRlDOGOIg0b6oImbBDqTqnBy9wtmdOl4yS52DJPQCOm0A
         mw7G9Z/vGt3ztODPBC7lWqG9LaxXZ/Px3JBPz9IkafHgOx8NC5iKGRxpLD7f0LgDtdc1
         0+l94PFKJQ82NR2OHkMbuXHQEyNZhfZ4oNHtRWIHPdnfYBCBkgm1gndUiokD1UbclRrJ
         1vNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316688; x=1754921488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ek7nkTx7oQBr5pmhvnHkJbcjWINhcn0PApuRdg7tPwI=;
        b=vfIvuBT1v772A3q3+L7KMcSlTOjF1JzJU8uTaJhGWxbQ9zFBh9mKAHLwBCsdgX8tVR
         xDwoJSIpIsrESgvHeWZzCx5YOGMl6K0bxmGb5P9oXZrIJyCmONvxxgtoJWxwVjS10Ne0
         DMzPVfLhRacKLjnasqWIQocpEH12rtIg/QsT7riZ/0UUr9Q1Tt3M9cXI/XYLRK20u8bl
         MGg/PraWQ+0zAqQGiU8i53Q6HygAVCZyMA8ylX8Ykv+z9KFtR05qWng0GOh4D59NtVlf
         mvxYLDhLriDFwPUFjemwLIa61qvOg44ykWJs6B/2jH98wGOmgCLqCljNBWEmpjBl7GYb
         hlLA==
X-Forwarded-Encrypted: i=1; AJvYcCWCGonyN7ZDsixVJBpRYaj2U04kd3g2kDvplq2Y6QgNlv8BIc6EvdHaNwkXFNGOFo/1b/UsI8wveAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl18HDlSacfQKr9r+av7ilnh18SvxQ5xGcIQYBfNjWvfNFXzKD
	isj/jKGUPW+j/+3VCflp6bQLB6JWJnZdR/8mg4lwW6t5+Bk5QzGeUUcz9ThQiG/KzCms3mYlSOn
	yycZdf0Bq0Q==
X-Google-Smtp-Source: AGHT+IEjr5sJfjbBUQYWZhIZ4rOglGuDpQpVSXj939XY+s2kAy7ykktL0lHdO88lLNN48OXhn6sUKk4ZSq/C
X-Received: from ooak5.prod.google.com ([2002:a05:6820:c005:b0:619:c124:3048])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:f02:b0:619:81ef:2511
 with SMTP id 006d021491bc7-6198ef440a8mr5302900eaf.0.1754316688530; Mon, 04
 Aug 2025 07:11:28 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:24 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-9-138ca980261d@google.com>
Subject: [PATCH v2 09/11] Input: MT - add INPUT_MT_TOTAL_FORCE flags
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Add a flag to generate ABS_PRESSURE as sum of ABS_MT_PRESSURE across
all slots.
This flag should be set if one knows a device reports true force and would
like to report total force to the userspace.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/input/input-mt.c | 14 ++++++++++----
 include/linux/input/mt.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 337006dd9dcf72ef2eeb8580e4dd83babf8100be..09f518897d4a71a4a7625367dc2c652ee6035d98 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -198,6 +198,7 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 	struct input_mt *mt = dev->mt;
 	struct input_mt_slot *oldest;
 	int oldid, count, i;
+	int p, reported_p = 0;
 
 	if (!mt)
 		return;
@@ -216,6 +217,13 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 			oldest = ps;
 			oldid = id;
 		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
+			p = input_mt_get_value(ps, ABS_MT_PRESSURE);
+			if (mt->flags & INPUT_MT_TOTAL_FORCE)
+				reported_p += p;
+			else if (oldid == id)
+				reported_p = p;
+		}
 		count++;
 	}
 
@@ -245,10 +253,8 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 		input_event(dev, EV_ABS, ABS_X, x);
 		input_event(dev, EV_ABS, ABS_Y, y);
 
-		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
-			int p = input_mt_get_value(oldest, ABS_MT_PRESSURE);
-			input_event(dev, EV_ABS, ABS_PRESSURE, p);
-		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
+			input_event(dev, EV_ABS, ABS_PRESSURE, reported_p);
 	} else {
 		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
 			input_event(dev, EV_ABS, ABS_PRESSURE, 0);
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 2cf89a538b18bbc7c99c8705c2d22bdc95065238..d30286298a00a356bc9db954ae362f034cdd359b 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -17,6 +17,7 @@
 #define INPUT_MT_DROP_UNUSED	0x0004	/* drop contacts not seen in frame */
 #define INPUT_MT_TRACK		0x0008	/* use in-kernel tracking */
 #define INPUT_MT_SEMI_MT	0x0010	/* semi-mt device, finger count handled manually */
+#define INPUT_MT_TOTAL_FORCE	0x0020	/* calculate total force from slots pressure */
 
 /**
  * struct input_mt_slot - represents the state of an input MT slot

-- 
2.50.1.565.gc32cd1483b-goog

