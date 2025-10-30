Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9186D22688C
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832796; cv=none; b=VBYIX8WrcrA2MwwVQgPvenWeLKOm2qE5ELIkbhrrrCsSj22SvZEgiq5PyEupIO3+pWSvViVAbjKetwqj63hOSEhV2ZzA08UEbAa9xGfxSZ9ZIcWpYFvzQxPmwyKBFV8OE7nWRuaaOmqkHI8CvCjCtqVWsgIN+6r8Bn4TAYyWgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832796; c=relaxed/simple;
	bh=4yzhcm+IAIwlcKoFFaOdCRvdrmdbBqLmFatW4EsrfrE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=ann2qDyiIpOlw5JtuCMtxaXiI7hbBXNBuvjvjre7GH0mk8QGqb8R9ASqLHpT9AS4J40OyTi3npA/9NKBmaV3/4N33+iPYqzQjhJfKE6QPioL/HRK4QBK1OdPGtLo7iY0ihuEZxi9RbshwjVoAg/3OCxN7ERxoSRcVk62fdabV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LN66ibqT; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LN66ibqT"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-63c348b15f9so996477a12.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761832792; x=1762437592; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vz3yCdXQoYeYgS1SXe/5GkRB+re/qkPaYZwzwgz2P7s=;
        b=LN66ibqT2hZzW6Ah8++lWUNkii5ou4Nz19+uit01xWKKbBuVbylw1qln/Ra3gaY3G0
         Tpk7LI38jMn5lDi5/MkO5Z0JfHUDthzEVsL99i3SjS4Gja+w1t3YH/iURB385u7XUX4v
         9xMXg81CuNOY86FvSxeK/35V0EjQBP6LN3rsOalBNXhq/hP7RH/rqhHs0OWF0p9zIs/L
         JGz+L3Fk4u+uvvT8e1NI49FZIBJ5DzFeGCgEPn2M+N00+ILKctVNzrum/WJC0jpq/EFS
         lrRcmCPlNcERgFCa4mYKLG840KqeZAhXXm4lNF5x1EKg6UXItxw+pEs6WdXNZMJeeTNm
         1u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832792; x=1762437592;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vz3yCdXQoYeYgS1SXe/5GkRB+re/qkPaYZwzwgz2P7s=;
        b=Z06iUQ5KDbsyJxfTk9K4RYjbFEG1X+CrSD7T446xG61eH6fMHnGQCQBTyBnkPXUekH
         4nwYP1XI6a6xegmmkrZLnsVdOc0csbEsIYXh75cbK5gXvkm8Ws3xVQvjA7QkstME9X41
         oUsuykcVE1CuAmDqXyfLaArEGnJAUOeUFz6/MwpZieqijPdfp/jM7YQdk4VgGbsoYN6g
         UspzfYwYVJm5Anp8nGY+/wJDZhVc8jG02qWIf9jdtg5R1sIFjIRz4G1JbtL5Op7Blxdb
         kaLOhTUWIy3yDt6avU13XD+wGAV+/L1We5v/qT0Im2Zw7kDZzIGMBBl7NVsT78CPB+Q6
         pNYg==
X-Forwarded-Encrypted: i=1; AJvYcCUd+hkint6K6sFaEO7Mn78x6PfMqO1pb4PUQ5qD+AjY2k5ADVe9MFG5mZzw6y3sCuVhQhfdUGgterM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16rxPahdouVrBvoklvjJ+OIKExpqyrjhAE0fR05RqO/c7Ec86
	XRD5s+rYk7L7tzBfkjV0khEW6orHdP6a+9XxyPtOKaqlMDzTJ5imQmyAcqfN8a6N+z/2lr2vqwG
	hFrNhx17C0FW8wg==
X-Google-Smtp-Source: AGHT+IEHuuSkwZ8G4MedpjIlCXqYY2Av44ejdEgEEyzMrXgoO7Q6T81cPDTnhFGMs5h6ppfFyECQNWTd338NCA==
X-Received: from edt18.prod.google.com ([2002:a05:6402:4552:b0:640:68b4:68ff])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:430b:b0:63c:45fc:7dda with SMTP id 4fb4d7f45d1cf-64061a3f677mr2812913a12.20.1761832791722;
 Thu, 30 Oct 2025 06:59:51 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:59:49 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFRvA2kC/x3MQQqAIBBA0avErBswS4quEi3SmWogNDQiCO+et
 HyL/19IHIUTjNULkW9JEnxBU1fg9sVvjELFoJU2jWoV2g7P6K4DKbiEGsmw7sja3gwEpTojr/L 8x2nO+QN+5xpUYQAAAA==
X-Change-Id: 20251030-b4-prctl-docs-2-d5e24dbb758d
X-Mailer: b4 0.14.2
Message-ID: <20251030-b4-prctl-docs-2-v1-1-396645cb8d61@google.com>
Subject: [PATCH] Documentation/x86: Fix PR_SET_SPECULATION_CTRL error codes
From: Brendan Jackman <jackmanb@google.com>
To: Brendan Jackman <jackmanb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Balbir Singh <sblbir@amazon.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

If you force-disable mitigations on the kcmdline, for SPEC_STORE_BYPASS
this ends up with the prctl returning -ENXIO, but contrary to the
current docs for the other controls it returns -EPERM. Fix that.

Note that this return value should probably be considered a bug. But,
making the behaviour consistent with the current docs seems more likely
to break existing users than help anyone out in practice, so just "fix"
it by specifying it as correct.

Since this is getting more wordy and confusing, also be more explicit
about "control is not possible" be mentioning the boot configuration, to
better distinguish this case conceptually from the FORCE_DISABLE failure
mode.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/userspace-api/spec_ctrl.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/spec_ctrl.rst b/Documentation/userspace-api/spec_ctrl.rst
index ca89151fc0a8e7205e0a0062134d63b213b9ef11..806947a093e5e71cd23a6a1644db8654b870844a 100644
--- a/Documentation/userspace-api/spec_ctrl.rst
+++ b/Documentation/userspace-api/spec_ctrl.rst
@@ -81,11 +81,15 @@ Value   Meaning
 ERANGE  arg3 is incorrect, i.e. it's neither PR_SPEC_ENABLE nor
         PR_SPEC_DISABLE nor PR_SPEC_FORCE_DISABLE.
 
-ENXIO   Control of the selected speculation misfeature is not possible.
-        See PR_GET_SPECULATION_CTRL.
+ENXIO   For PR_SPEC_STORE_BYPASS: control of the selected speculation misfeature
+        is not possible via prctl, because of the system's boot configuration.
+
+EPERM   Speculation was disabled with PR_SPEC_FORCE_DISABLE and caller tried to
+        enable it again.
+
+EPERM   For PR_SPEC_STORE_BYPASS and PR_SPEC_INDIRECT_BRANCH: control of the
+        mitigation is not possible because of the system's boot configuration.
 
-EPERM   Speculation was disabled with PR_SPEC_FORCE_DISABLE and caller
-        tried to enable it again.
 ======= =================================================================
 
 Speculation misfeature controls

---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20251030-b4-prctl-docs-2-d5e24dbb758d

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

