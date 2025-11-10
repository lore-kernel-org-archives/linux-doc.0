Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD1B18C008
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803408; cv=none; b=GWnmOTBvYKZYgNm4gyhZq3RfwgpgpbdupkmbYt9LNrR0DXW24Spm1aRG+eRDyO/WreOnKMs/xDFWG3M+BAMj5DGN798RPKFBn74IBVrES+erctB08vQHlyQW7v/Rh2fpNo9gIoEV50q46/2hIeJ5KRNHaFP63e/wTLYKrZf+grs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803408; c=relaxed/simple;
	bh=Qb6H7e1GNWYpx0zXiNhXMGNENsZMqUmvk6ZdQdT4edo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JEdDATKH9NONybgVTotrndOmAm+0fxpqNbgSWO+tJq06fkb3RluAL48tJnGlMtLebWnJwXsCeKBLulNVOqQ/Wefxx9+JGFkeunA9r+mALaFILRuMsY/E2D4sBoD6pc4vg4gKg55R5oiID43oZbMaIXA/MsvYI+Su/tk9G7uoadY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QrNStBGi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QrNStBGi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47755de027eso23661055e9.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 11:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762803405; x=1763408205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttljqdD72/jNbbr6++0E5iGMaW+W1pbD4ZT9pbcKYcs=;
        b=QrNStBGiWDUZx3mO75v0MJoAf3lxxekO/SsAXoI/m/+9kQfm1dKl0o78R/7Ywn6lUS
         XEMvaansFXbwAEa1tJjIxmxsXJl+7GQeRrLLZqtr/Q41Ta6lNdK9EvOuBeTHY/RoD0qe
         yhi2Fdh+FxxJS/FDa37ZyKreCdyf2O0u2AYphJk9N6+2mPuzUlQ3tvACaFd61FcsHrwn
         VYOCReFKZgq129RgB1eyCQJkhbhso6IjVn7/RlukLNA32sIEPqKnUDDq94e7aT++4bE+
         dkPPobWfX8ueSjzOYAcD4KM5JgPgwz2Y1KNm+A1j2N2POxMySnxZI5Qh0LTUTqOBt2Ci
         040g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762803405; x=1763408205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ttljqdD72/jNbbr6++0E5iGMaW+W1pbD4ZT9pbcKYcs=;
        b=jPajrxDk3WxlOCxwU0fMhZOrq3NaSvdn015NZHqv0EVOy7NdOLV/V1v/MnaOrLPr7I
         AmfKUqaZrAhdcwo6/3TgAIig+1dvk8ZlhxN+k3coQBYfkOfqWk7CEm90UCjesDAtFdVt
         cvtOJDQQMiuwwzu2y4cvuao5lqgl7FfGR8zYRhGBKmEEsHunpm/BXq1RlfWC0T4OD8+h
         vMf1TJ5D8u9cYvX00I0xH+TcDDjvGwi4fCWq+v6Q4NpjHAqX9kPL1zC+9pfQ/+TkpyVl
         N1Kv5srv2YfGmdHnIGfHqDWmO9oUveBEcYUuZyG9NNIZmhGHophlST0WslctuEB2Q06c
         8faw==
X-Forwarded-Encrypted: i=1; AJvYcCUXk51vJ2uZW7s7Yy8ZJj2wOjMNhZI7XbMOkw+cJsYQ8c99i68gUGdoY6DoZaYPZIO8jQq1NWBA2oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz89M77tk0Yp0YfD48z8kyC4sN4UZIqoA91Lt27NtYNE93EZ/mo
	XipgcZ7aAHjXVXVziH92A9S2gxCn+QKWhm+wqI4QO7lqTPXuZ+BMxN0YRvYW3+rFycY=
X-Gm-Gg: ASbGncvoeQ06RA+slsmHDRDzYwJ/CnB487wFIpntAm0AW9hIEGvMXaWnmRhBEMICfNf
	3GPqV9ZJPdXjYtBlh3dN49QdnysCkcK7rT/O9gO/susAgwqO4ivT8hSRt+7RWcl0Wyw3pU+KK4a
	eQu2ITy3qwMFUwM1rBBHCi+16ZC7HrMOH6plUP9k8vEg7snPZ8l+zL6NeWMsNOkcn/6ZbLh1NUy
	Ij5K3g5aGwm3ItNY6vmw4V4mTzYRfONuqFKuvqT4gv+uYQpwsthbCggHi6wrwvVkLYr7g8JI2p/
	y2qEMyzJQNwq/Nqy6F1s5U3//SPrYudxZDQTpggJblbt0cuGmvRIIkJu0wZgH3Qe6f20XF4L/ep
	GRN7Ri/1q3QSLPYrUHHWoFySqg54L4Wqcn7cXhpozSu/wzcwXt5WibhZgcLLG0M8Xo65DpDT8K0
	xsAtR8ohAIXXpftImhnY26
X-Google-Smtp-Source: AGHT+IEO5WOovwJKqZKjVkptEaFPi6rnDgcRpgzt4kQKQklLd5lgVA5XjA0MXpmNh6UDE1IOSEX41g==
X-Received: by 2002:a05:600c:4753:b0:477:54c0:6c3b with SMTP id 5b1f17b1804b1-47773224fe0mr86578935e9.2.1762803404642;
        Mon, 10 Nov 2025 11:36:44 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce32653sm336766725e9.13.2025.11.10.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:36:44 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Natalie Vock <natalie.vock@gmx.de>,
	Maarten Lankhorst <dev@lankhorst.se>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH RESEND 1/3] docs: cgroup: Explain reclaim protection target
Date: Mon, 10 Nov 2025 20:36:33 +0100
Message-ID: <20251110193638.623208-2-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110193638.623208-1-mkoutny@suse.com>
References: <20251110193638.623208-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The protection target is necessary to understand how effective reclaim
protection applies in the hierarchy.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 0e6c67ac585a0..a6def773a3072 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -53,7 +53,8 @@ v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgrou
      5-2. Memory
        5-2-1. Memory Interface Files
        5-2-2. Usage Guidelines
-       5-2-3. Memory Ownership
+       5-2-3. Reclaim Protection
+       5-2-4. Memory Ownership
      5-3. IO
        5-3-1. IO Interface Files
        5-3-2. Writeback
@@ -1317,7 +1318,7 @@ PAGE_SIZE multiple when read back.
 	smaller overages.
 
 	Effective min boundary is limited by memory.min values of
-	all ancestor cgroups. If there is memory.min overcommitment
+	ancestor cgroups. If there is memory.min overcommitment
 	(child cgroup or cgroups are requiring more protected memory
 	than parent will allow), then each child cgroup will get
 	the part of parent's protection proportional to its
@@ -1343,7 +1344,7 @@ PAGE_SIZE multiple when read back.
 	smaller overages.
 
 	Effective low boundary is limited by memory.low values of
-	all ancestor cgroups. If there is memory.low overcommitment
+	ancestor cgroups. If there is memory.low overcommitment
 	(child cgroup or cgroups are requiring more protected memory
 	than parent will allow), then each child cgroup will get
 	the part of parent's protection proportional to its
@@ -1934,6 +1935,23 @@ memory - is necessary to determine whether a workload needs more
 memory; unfortunately, memory pressure monitoring mechanism isn't
 implemented yet.
 
+Reclaim Protection
+~~~~~~~~~~~~~~~~~~
+
+The protection configured with "memory.low" or "memory.min" applies relatively
+to the target of the reclaim (i.e. any of memory cgroup limits, proactive
+memory.reclaim or global reclaim apparently located in the root cgroup).
+
+  root ... - A - B - C
+              \    ` D
+               ` E
+
+The protection value configured for B applies unchanged to the reclaim
+targeting A (i.e. caused by competition with the sibling E).  When the reclaim
+targets ancestors of A, the effective protection of B is capped by the
+protection value configured for A (and any other intermediate ancestors between
+A and the target).
+
 
 Memory Ownership
 ~~~~~~~~~~~~~~~~
-- 
2.51.1

