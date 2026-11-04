Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805415;
	b=1lOFbUjBO7aWySD0KNi+OKSoyADiRPq8o34IfzcJLYG9YEiD6NtyV0CCKezzXHXzG5HN
	 42KQ4NAXoefRCWPn3AWNTu3aKo3PWOwjKR4NGUgyiO6MOLpEEauOFLq99+2Aio1A4Emq/
	 yujQzOOGESZT7A2cXgwHK+VkWoJUB8iq2rT+fpDcSPrXLi4lqzQ7sRwgTYbOGUCXea3w/
	 AbiZ7ppiJXahhb9yOZyGmnOhLnemogKYC1PXCycS9a0pbPvp1WQf+SS2aAE7s+ea3pzzM
	 MJbGObZs3TIihr/Z18crwlASdvL0FJWPLhElFDMKznfGy6MqaxwECLqOK3G4qZG6kHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Uq1e7jWuoceT2x7ZhYRUZ6C4jiC0NbfgYNrjkiRron4=;
	b=J37EoZUS0ENPVfsd147dLCue2sdySikqTnsBXWgguVody1J0QTASPvYZFLf9Ds2i2Jjn
	 cimdcNqV0zHRfCG+ttbI7kD+lTnG1s74fUnAQf3DMYEuCGDAHdXOWd6O/IxfOGAy2XixL
	 VSc9ZBWAtUYFoNICQr3+D38Fh8xyI6SWhyAZJlFAyfM5I3MO0KsZz59CG361USFdiC7Xm
	 s9XOLRJrgtKHCd/TF3YhruD2eip66ZCyZrGRf/gAGdZwyOQ7QpaXOvDnphOwuu0goAe9+
	 EtQCQibWEcfIkX2hKmctb1ibRvpEbtZHozWEDxqpbQEe1MV8vBbOaYukCcyCgJmE7eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V5qxMC8i;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6446074769
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6446074769
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V5qxMC8i
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so654590a12.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793805414; x=1794410214; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq1e7jWuoceT2x7ZhYRUZ6C4jiC0NbfgYNrjkiRron4=;
        b=V5qxMC8iNZRNUbCry/IYAuCXjsz2S2to3mmREdQL2kfZUuTj1juBWz+30iE/aIiyVh
         Nh6k0qHuKdq+p6gJXqz6NIGfOsBjLQKw79EaJ/OFVsblemYIH++/duGw4REg3H9mixk1
         zxavgu7KdB/IYCfpdOYnKLcTq68HP92rwv63DXx8ZHX7QkjG2P6rtA4BNv8Ek3NGyS4C
         6OU1A4wocJ7FZPg8DdyqykUFYoaD4mcsUva/MaMFM4gAzua4Ep7Nwy0VuZrP1NPCMghs
         mCmGUnGcPA6PrSFj+pn6r3qe2Izap8G51Jh6+OOB7pKI5eQWRYz8e5KvGAOBe/t6oime
         mZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805414; x=1794410214;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uq1e7jWuoceT2x7ZhYRUZ6C4jiC0NbfgYNrjkiRron4=;
        b=YQqOKckGDgr4ZLdb11fOgQcfGIpTNytk0uXzOmU/TkWESNOpd8diV2UIVPWdOywj5G
         qyaLRuXAe9ghERgECK6hefizDjxn9xTq4fHnJhFedk6IaM/wBOjcZLv06iDADpPJvI52
         yEkFfTlNcsLncwRrndW844O0FJdOjLE55Yk/KjhTLfHugALz5c4DTBBXgDYjl1EWM77+
         rKlfTJOWdrwTUFqh133NPXDZja3IZKMI7nYUrVlHmSGzxow7oPcbwWst50uYl8GvaNgJ
         ZoFrzfj0slBPU6kyAjwAwfqM1MILexFye9e9Fim7VIGBWjQVIX1sWFfHY6YnqTGbqomd
         lELg==
X-Forwarded-Encrypted: i=1; AKwUvByIGAGN6kbCZVn8gLr7rd2XRJv0sa12V6OhZGzbGQPpagR8jQoAeeeoEckjaaC8eD0A1hizssISArU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TA34dd80oCP3f+KvYndEtlkolhYAJbfOv3tQj8OTMTqrKG6wf
	4OPHo9WCGej5EfqFseIlTgumUc/vd4XYNYmvB5f0Sme45MxgxfT2ZXMZXohOBKgoBzRub+cwK2x
	8Iyjs34zKSWPDjaJlb11iWQ==
X-Received: from pfblt3.prod.google.com ([2002:a05:6a00:7443:b0:89f:6242:b2d2])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a107:b0:3e2:117a:6307 with SMTP id adf61e73a8af0-3e928d4476cmr14928062637.22.1793805413627;
 Wed, 04 Nov 2026 07:16:53 -0800 (PST)
Date: Wed,  4 Nov 2026 23:16:51 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104151651.3035537-1-stanleyjhu@google.com>
Subject: [PATCH v2] PM: runtime: Update runtime_pm.rst for non-fatal resume errors
From: Stanley Jhu <stanleyjhu@google.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Jens Axboe <axboe@kernel.dk>, 
	Bart Van Assche <bvanassche@acm.org>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
suspend callback failures"), rpm_callback() no longer sets
dev->power.runtime_error when ->runtime_resume() returns an error.
However, Documentation/power/runtime_pm.rst still states in both the
resume callback rules and the ->runtime_idle() comparison that the PM
core treats ->runtime_resume() errors as fatal device errors and blocks
runtime PM helper functions until the status is manually reset.

Update the resume callback semantics bullet to state that on error the
PM core resets the runtime PM status to 'suspended', returns the error
code from synchronous resume helpers, and unlike with the suspend
callback never treats resume failures as fatal, leaving the Section 4
runtime PM helpers unblocked so a subsequent resume request can run
->runtime_resume() again. Also drop ->runtime_resume() from the
->runtime_idle() fatal-error comparison.

Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
Fixes: aedc51762a0d ("PM: runtime: Clarify ->runtime_idle() callback return value handling")
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
Differences from v1:
- Contrast resume failures with the suspend callback instead of citing
  -EBUSY, -EAGAIN, or power.runtime_error (Brian Norris)
- Add Fixes tag for commit aedc51762a0d covering ->runtime_idle()
- Link to v1: https://lore.kernel.org/r/20261029040005.2100005-1-stanleyjhu@google.com

 Documentation/power/runtime_pm.rst | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 40a5c23d5259..09072c576087 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -222,11 +222,12 @@ what to do to handle the device).
     I/O operations as needed.  The runtime PM status of the device is then
     'active'.
 
-  * If the resume callback returns an error code, the PM core regards this as a
-    fatal error and will refuse to run the helper functions described in
-    `Section 4`_ for the device, until its status is directly set to either
-    'active', or 'suspended' (by means of special helper functions provided by
-    the PM core for this purpose).
+  * If the resume callback returns an error code, the PM core sets the
+    device's runtime PM status back to 'suspended' and returns the error
+    code from synchronous resume helpers.  Unlike with the suspend
+    callback, failures in the resume callback are never considered fatal,
+    so the helper functions described in `Section 4`_ are not blocked and
+    a subsequent resume request can run the resume callback again.
 
 The idle callback (a subsystem-level one, if present, or the driver one) is
 executed by the PM core whenever the device appears to be idle, which is
@@ -250,9 +251,9 @@ call to pm_runtime_autosuspend().
 To prevent this suspension (for example, if the callback routine has scheduled
 a delayed suspend or determined the device cannot be idle), the routine must
 return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
-->runtime_suspend() and ->runtime_resume(), the PM core does not treat negative
-return codes from ->runtime_idle() as a fatal device error; any non-zero value
-simply stops the PM core from suspending the device.
+->runtime_suspend(), the PM core does not treat negative return codes from
+->runtime_idle() as a fatal device error, and any non-zero value simply stops
+the PM core from suspending the device.
 
 Core Guarantees and Synchronization Rules
 -----------------------------------------
-- 
2.56.0.385.gac671c819a-goog

