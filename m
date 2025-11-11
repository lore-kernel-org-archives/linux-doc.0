Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF23A1D07
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762882876; cv=none; b=N7HtBafg6LObj++X5jtpv44vqSQiAk1lCwJNDksHX7LYu+yk6t6yaA9Z254npdA+XyZCEYEiV4NEiF0Ew8yX+iIZgVaupilgBhuYBVbkeQCfKE3vEXplh6OyZk12uafgdDQ19n8CEPBRDSa9+YtL0Ap3Te9U3uj/6h4lmy1KaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762882876; c=relaxed/simple;
	bh=EGHnGYguqdVtqzE8OSgSk5NT8BRurVLNOwx4JFd9SIc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=kL+nlBKW+BLuQ9oo25KhK6E3T0oQUFb1hCvfqsjXnRbvYo0bjzYqMFf7N+Gphp3JHsMKoeWgz31QtegdpEo7sVtVdvFSWJoCDofZgzaAhw7jTKxMd+Z6Mw2uolBCT7yjGbdSurCpoxegfksuG+0YKeFQoSQANT0wJQ4yTHtKwy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UlWa82Zh; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UlWa82Zh"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7270cab7eeso2175166b.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762882873; x=1763487673; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Pkn+9vIwNogTuxuW5MtMEzbQcXSFW7NMBZUwaPgd58=;
        b=UlWa82ZhMYnQnKsmmWLxnZCBfqx1zZnr+BIMcIIqWtbMj9KuAvFT5Q89+xm+pZswky
         cuFQOKwEmH9Eh9Crk0XyO0KUmaV+e3spyKsvBdzUXxws0PthZdAt4MgJ4t5UVOVv+ZpE
         hQ399H1vVyw2/NMMi3xn5iahXO8pmVC/7vJgNusnqUKcOxLM1zlYCz8+hTN9kWkbBV45
         0U7anPFUWbCIzY5+cyG4b+JDspQJNLQ5jXTQqA1ls52RCkorVcAzdZnF31sQrDbtwwZc
         hy9RB2sQCDkgqD5Aaymdv89AFHb8pOhPrtUSKDwYRuCuXDnMLFHP3qbm4wuLODWbfB6G
         5sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882873; x=1763487673;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Pkn+9vIwNogTuxuW5MtMEzbQcXSFW7NMBZUwaPgd58=;
        b=ThlMKp+hMfclzIZS7W/UYSnhGbMgncs+t9rPSX1Vdz7mviyUut6mb6uQJ61p4iJik3
         gQms1RiepkWKBZmvyd8BsTE9gQ1igHkV8u4a+UZ9MW5R9mB0pFjLcYS5Bf228LTwGIPq
         NsczbHwwT4HusopL9jVL8RU6fZv1WC08UKbrrZpVAmGKF+mJ9BChmZAwkR11DNw6No5W
         3XdTx1jr4yBKW0JVU+tHdoKPKCii9EESHhfXxG5UCCfX0B0WLJG/A8+zv5MQQyomtVD/
         GiJLDK0qrBgKSK2BKZCGc3/XM9qk4ReDgHqdGg8Uwsz7zL1w56Hcapw8H4vpIb+w6ywc
         3NEA==
X-Forwarded-Encrypted: i=1; AJvYcCXO2vzjmVpMxFjTxr9Y4mYO6pQiUPn+lPL/hmRJ8uyL/cUqCH0sm3ut9HvP1l9ebhULEJdhgry7hx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz91CNL87b2iZrtFttL2Vn+dB4VEz10RnphKFYI3cHLhQFRl72
	DN6S0P9clAq9lmBC9tY3IThfZSkmrz2UInTlA7MFvE5vbSltBS1TKhxLDSQ6u0ot+D5+ha0XZqE
	tInehwpmqC/+W4A==
X-Google-Smtp-Source: AGHT+IGFy0ukWziLWlhSBOsirOsL+DYT2dzywPbi9FrmXHCzpCDVHG57JmnIvw6h4MX59871sbWi4EI0TM15Aw==
X-Received: from ejbo8.prod.google.com ([2002:a17:906:3588:b0:b70:b190:7f2f])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a0c8:b0:b3f:9b9c:d49e with SMTP id a640c23a62f3a-b72e053f2b5mr1344154766b.57.1762882872997;
 Tue, 11 Nov 2025 09:41:12 -0800 (PST)
Date: Tue, 11 Nov 2025 17:41:08 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADN1E2kC/3WNwQ7CIBAFf6XZs2uAAtae/A/Tg8BKSWppoGk0D
 f8u9u5xJnnzdsiUAmXomx0SbSGHOFcQpwbs+Jg9YXCVQTChOGsZGolLsuuELtqMAp0iIZ0xF9U 5qKsl0TO8j+J9qDyGvMb0OQ42/rP/WxtHju1Va6ms6ZzmNx+jn+hs4wuGUsoX8rI/rK8AAAA=
X-Change-Id: 20251030-b4-prctl-docs-2-d5e24dbb758d
X-Mailer: b4 0.14.2
Message-ID: <20251111-b4-prctl-docs-2-v2-1-bc9d14ec9662@google.com>
Subject: [PATCH v2] Documentation/x86: Fix PR_SET_SPECULATION_CTRL error codes
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
Changes in v2:
- Fixed erroneous reference to PR_SPEC_STORE_BYPASS returning -EPERM.
- Link to v1: https://lore.kernel.org/r/20251030-b4-prctl-docs-2-v1-1-396645cb8d61@google.com
---
 Documentation/userspace-api/spec_ctrl.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/spec_ctrl.rst b/Documentation/userspace-api/spec_ctrl.rst
index ca89151fc0a8e7205e0a0062134d63b213b9ef11..61fe020b23a2ca632879597bd47a321bdedd9faf 100644
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
+EPERM   For PR_SPEC_L1D_FLUSH and PR_SPEC_INDIRECT_BRANCH: control of the
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

