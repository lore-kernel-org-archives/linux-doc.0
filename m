Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A501F27A916
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575882; cv=none; b=VJ/tEq+Kt2ZsHlv1kdMwjz5Te4MSrnHUfdSZEnd/XljBJ+bqcHCABSUvD+ttt+sOjm4AmLVv1bw1ToHdoof/EXIleb1HLfja0VU9yxHeuDViy9GPzggagUNbIhCB3GZAbbRRCo8MOfeRpIMcPDT5RfI4BpOrLTnrUah/UbdVE4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575882; c=relaxed/simple;
	bh=j2RVUpj+x667v7vyWSyYDkDg2CgNdAXc01JuvoeLxyA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hUs0c717n2kmj36me6TRteJYg5XntPSLnUwGlnsAwZrYCGJFZD7BGt49H8FG/jKqJIRcm9t7HuampHS7SPqXMBZeTv7YscbD2bOe5HimhoXDhiElSraoCE3S/B+SfFPqQ0U+jB3CO115cg2IcXc6z7qa7B/tpKJ1beBv7TC32xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrosNoVS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrosNoVS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so14857905e9.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788575879; x=1789180679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZH3wkIQcCWjm+BxTgOu09F0rbTL1k1ZraSpB3gco3J8=;
        b=BrosNoVSjfTJmr5qf95CTuB4ufV2KjG2BrJOk+SOtDDsY59cDezJfVRcjc/lZJ7dtS
         OZoknfpM6IxUYocY6CsA4+iJ9ysUJj8adr8Ot4DiGr4V7kBbhqVOKf8crKNUT4kWwyI8
         p+LVRGarS0IO9CS2g1YKDzLmQdumoFKz6bPAC12bCJVwYAbbXxtoUu+R1DXVCRFRKYAW
         F+qZPqBx0lFxfh5L/72uua8qmBd476w7PBhTXueGaJ3EGBHRjQH5LpO2IHjOVJgfE4/F
         mcaJIKS/gX23PHszPH69yKfo6pyWi4tNgDwdRKni8xK2NS9ARWqp47uUGC3mKaBqPJ08
         KIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788575879; x=1789180679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZH3wkIQcCWjm+BxTgOu09F0rbTL1k1ZraSpB3gco3J8=;
        b=PwULRXnARtvzVG18XszJu8XsfrNpYxLZRayEa2b9YKq9kVG22+vsyE2axgyl0WkWjD
         JQxf66HhJyPIxQ4KvnY8ht6fE+lsDl6iwzBMZ6AoPh17qjQiizdkftIAmcuJcJ8JByIh
         hSSLdsk6PzI1L6/lZo35weogHl6cdGiI+HN0tjd6A2LSzDB8dFACp0mn/WzKaSTlHI/H
         gfCIRTYUGBPL5Y0SQf7jvFpIDV9O1oIilHp7ZiZ+zp2kjgF5ATIgrtLZbKhK7SqY/BMj
         AYSKV4s2jKHVt0tVV9hGyqJJfrYPFINbCsaYp8j+XRROpRnxY0nMliXBdSdWBRfeVwxB
         PKhQ==
X-Forwarded-Encrypted: i=1; AKwUvBww7FAMrpuJ592MI1iXeftmhptObgPnQAH2I0MzzOXGft2PuISLfSHqCcC6XDwqxhpfNkvX+Fq79P8=@vger.kernel.org
X-Gm-Message-State: AFuF++myr/YeQlct5D18OTcewkMegmjcu6GE9GlHJbtOMz7qWelvjniQ
	epMfoVQeym8QMFvojk/urADO5wEy0ghrx9miOtVGbF/QwYmdQefkFTDW
X-Gm-Gg: AYBFou3ZYHLStk4l5hJJ6gFsJqun7VOxWx9F2/eqqfd5Gy4S+tAB0hDyOClfgkxVEd8
	kF37SFeh41oq+e6SFGXszJPhRfkmh31yksqnrD7XCu/tT+lHenAnZBrggjfghAxTa6WKxCEa1ne
	OjnNsySOjYUzaLYeUe+hf/FdBa29/kvXOWsAjkt3IQsqZ5Gp4R6Yp6t1MLpT8487fUL4we1zvek
	fOh/pALZFsfdfZzyJC0vn81StHTfN3yPyurnEA98U3XKvZRi608hg4n64QihnnQySGKJBlyS9ek
	V8nfFPXskIvWT6/RYg2zic4JpNvgkQV9/Osyn3hlghHp/wKYT08nehwdrWFC033jr9eerTmYGVZ
	6I69r9u92jwpjdgJOrVMU5d50st7ZasORHzYG8bUx5hXR3tM+L6wfYAlkxX0vdM0VKA7T9foQbY
	4NIhiwFBEIlBgeqXmwdESqbO25B17QK6HAYwcyXDA03asvd2iPNJRZQJ24N9FZeHYtYbFo3taRt
	YewfKyRDp5lTld2tkLbZqkpj8Pp36iZclkvXbVR7PorlF9+3Vyl+MnkcU6dD0WuCtAQJnrPIzzu
	oAlviVNdAdANVipQKn47regf+Okerqp9w3V8nGtaBSf5RUSJPMzdQyVITeHGjQh67ok=
X-Received: by 2002:a05:6000:1acb:b0:485:8b5d:96d with SMTP id ffacd0b85a97d-4858b5d0d2dmr14136245f8f.19.1788575878815;
        Fri, 04 Sep 2026 19:37:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm10808778f8f.24.2026.09.04.19.37.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:37:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: irqflags-tracing: Fix the lockdep Kconfig option names
Date: Sat,  5 Sep 2026 04:37:46 +0200
Message-Id: <20260905023746.82998-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_PROVE_SPIN_LOCKING, CONFIG_PROVE_RW_LOCKING,
CONFIG_PROVE_MUTEX_LOCKING and CONFIG_PROVE_RWSEM_LOCKING have never
existed in mainline. Lock proving was merged as the single
CONFIG_PROVE_LOCKING, which has depended on CONFIG_TRACE_IRQFLAGS_SUPPORT
from the start, so there is no reduced set of options without it.

Fixes: 55df314fbdb4 ("[PATCH] lockdep: irqtrace subsystem, docs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/irq/irqflags-tracing.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/irq/irqflags-tracing.rst b/Documentation/core-api/irq/irqflags-tracing.rst
index bdd208259fb3..a3c77046ae6b 100644
--- a/Documentation/core-api/irq/irqflags-tracing.rst
+++ b/Documentation/core-api/irq/irqflags-tracing.rst
@@ -9,12 +9,8 @@ that it gives interested subsystems an opportunity to be notified of
 every hardirqs-off/hardirqs-on, softirqs-off/softirqs-on event that
 happens in the kernel.
 
-CONFIG_TRACE_IRQFLAGS_SUPPORT is needed for CONFIG_PROVE_SPIN_LOCKING
-and CONFIG_PROVE_RW_LOCKING to be offered by the generic lock debugging
-code. Otherwise only CONFIG_PROVE_MUTEX_LOCKING and
-CONFIG_PROVE_RWSEM_LOCKING will be offered on an architecture - these
-are locking APIs that are not used in IRQ context. (the one exception
-for rwsems is worked around)
+CONFIG_TRACE_IRQFLAGS_SUPPORT is needed for CONFIG_PROVE_LOCKING to be
+offered by the generic lock debugging code.
 
 Architecture support for this is certainly not in the "trivial"
 category, because lots of lowlevel assembly code deal with irq-flags
-- 
2.53.0

