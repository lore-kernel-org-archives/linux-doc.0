Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254038;
	b=izgZi/uckxnhOLq9TmU6S6J4K70jchRMrPgC+ALm6sF22lqPsbsvmnKseBkQyPszJ4Zr
	 ROuWIPYh7QguF3WGbCQoIK1KZA686Mk7o1uP8TB0hQkpU5zCD3Zc6N9jSC3O3dZL8xILs
	 +xXP4kdbkoOqmw3YDqt/feV7NQaKl7CxsDLqM9RkGMmsG/gN0S5dI4yF+A21twXNt4PZl
	 eyWrhJupTUw4AAsuLRd3izusPp+XPPbdfGs7Vmx2+r/K70j9QCJdN7T1XHvx/gAt/KgJq
	 bq09nTlRJ6MjGmq1+glgJ95+CLoy8fSUMahiK8qqK5Dh5pt3HQapSzXpTrL0XHNWcrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=UNSxvxACDv6rV+hh5v7KUi83+vs01nWTUXRQ2PYQNxU=;
	b=0GLrkc5bBJxSjYcEzkbmDmBL+8HUb5a+JfVLepgJNOEmyq+Cfp/swI6XtchBaUzkte/v
	 eArgjTuY07L+i+G6bbTMReHhSlqOp4mkF+X4W7nZL4+d4f1g41sA2rAHIpqv2LrGBLjyP
	 +z3rGvwwEircnj3YFYNKjcHAJhuyPfrne96JgaX0jKKKRFQLKC+KSzf71FyMointhxOe1
	 38uOq9/zi/Ln80vw1vtKsEdHMj7gNb/ZOcVathBZ2GVGyGFP8rh8/xhr1ko+TLsidBPDA
	 lujTmopPeXGnFmFdyFVG1Mu4u9VPMJddKyyYpZdGQsFXNVUrR0IA1x5HTcOVL55YvIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="ho8P/1C5";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116A9606A31F
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116A9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ho8P/1C5
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e5378b281aso9346795ad.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254032; x=1793858832; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNSxvxACDv6rV+hh5v7KUi83+vs01nWTUXRQ2PYQNxU=;
        b=ho8P/1C58VDquswjb3GmuApdin+fY+YgGO7SBCZ/wPMbXdQrudpzDuUrJH4S6ZUrvR
         T+OrvnuItCtqAf9/RUcf12PyjpkM12hnNS1Uv8BrIkA1VkPRwhFjpCW1PEJNrcsRQyCj
         2zfDeWx/VJ8ci2CjCPmBrruNDmJ1NV5pvIeRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254032; x=1793858832;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UNSxvxACDv6rV+hh5v7KUi83+vs01nWTUXRQ2PYQNxU=;
        b=dOscz/23wBgcdO/ab+MAM5lYTpAIqRLsRvAmzBDKioZy86Ff6VqgPJujR+4Xohxqzi
         rK8ZLT9VBQMEqOkG8L81fHdE6EZmWtyGlbFHUKkb6K2Tulayzs7e+PJ3lkREN1EPBXDW
         FfgcafwdqpzLVl0jrEgSYJwumuzeQ5mZEauf8uoA4mTC0FsJEJoc+582qOIyop7ljwsu
         zoTkLP/EHNl6eQy+Pz3uO1wP2c/Nja5q+Jf8BpMFz9C3zcftZeB2itqyYDiXFSSj7Gte
         usTl3nZz4/zpEoOjclyQ65X9dJ4LcGopyl5C08jrLIK76rqClL6hV3xjiDksoTU/Ci7D
         v6DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPZUgM6ajdP7AADGYCicIgpUd6PjD3W9tTSPPN4H/evU/6bmZAgz7XA3DRXrZBOy8A7Y7R9vaISVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ30PeLNxuv+5KWlBGVvhQ1wSaoMoiDrv2hk6/75Gyw4CPa16K
	JWkUny9TRIkmCGMXIPRUPXUhuA4MPLcWtHxjY1gAhZ/mhMmsMCZUfTRnANkMp+1WrsyUtE+I16q
	pvyqv8EeyA+Tq
X-Gm-Gg: AYBFou0fK7fSJDJOtwt1K5bTypZn7zY9JLp5dTP/LVPnaIupsxfv+ZbDEBrR3PyhA0y
	3vQoGbST6x/VHpTFu7fVKnlYazX+pRXmdZ3E85Yfqhd0MJUDn0DKpmb2V2uT1Oz+aE5XSJA+sAP
	CuFDt/9afE0eW2/G/q01Vnm2tLpihYuIWJr1ZFp/pD37G6qt5NnEkARkZEc1PfVGeXnviP6gc+P
	4exv9sA9QKffvBSbse+J49UTC0Zw7abmLReeXtKXGrMe5DWh22+WXuVSSZJXv1cans+Vo1vRSUw
	fp6BAjoPq2diNSNWi0RIiQYRbhoXb1TnBQ72dnrWb87nMho2zB+ie8/fQj6qbHqlJ4+59rxwCdI
	veG/btvP1WLhJVV1elFuvnDCKlUHidhwHjBJ7FtppCkVUJJR4k2G4SghvGYTyIrRqCE7z0gCIkY
	6iIpvLlJI1Fjp7VJT0rPehifsTp+PNGjF7TAjK4Nt6r6kvGVOXGUbWPS/rr68oox4KBwUIavjwE
	j819OiKypPtM1yT/jxCNvhPBvd5uMc/OV3C3f/oXTM/ZIf1bC5AJBLc7SEVVq+VP396+3ODAeRy
	OIYNgev6rnd8QF/bWzMIk1ubHUGlqQscwgAubjsBY5Yx/XD4NyIyZotyptmJ/01/QDowKL8XKB3
	Hb+C+r2fqyYb6f0AXP/TrK9Ow4pAQtmL0PXNzGGILvkSWA+kAb2aQstOx6kZ3LVfmHAqoFZyfxA
	==
X-Received: by 2002:a17:902:fc87:b0:2e2:b7b8:abc5 with SMTP id d9443c01a7336-2eb0038e312mr41423305ad.32.1793254032255;
        Wed, 28 Oct 2026 23:07:12 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64549dfsm29271725ad.4.2026.10.28.23.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:07:11 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:07:06 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 0/6] mm/slab: Support selecting slab hardening features at
 boot
Message-ID: <cover.1793253633.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Slab hardening settings are currently all build time choices. This means
that, unfortunately, hosts with different requirements end up needing
separate kernel images. At Meta, for example, some hosts are built with
these options and the rest of the fleet isn't, and that's one of the
things that keeps those kernels apart.

Following the discussion on v1, this series now does two things:

- SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM are cheap enough with
  sheaves that it makes more sense to just enable them by default than
  to make them switchable. With both on, system level benchmarks didn't
  change measurably, only slowpath heavy microbenchmarks did [1].

- SLAB_BUCKETS and KMALLOC_PARTITION_CACHES cost memory (Harry measured
  about 1 MiB and 18 MiB respectively after boot on a 64 CPU VM [2]), so
  they get slab_buckets= and kmalloc_partition= boot parameters, which
  default to on when the option is built in.

Changes in v2:
- Make SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM default y instead
  of adding boot parameters for them (Vlastimil).
- Skip the memdup_user() part of the slab_buckets test on !MMU
  (Sashiko).
- Keep slab_buckets= and kmalloc_partition= separate for now. We can
  discuss whether to merge them into slab_hardening= or similar, as
  Harry suggested.

v1: https://lore.kernel.org/r/cover.1793086056.git.chris@chrisdown.name

[1] https://lore.kernel.org/r/auITixAJMfLtfa7i@chrisdown.name
[2] https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org

Chris Down (6):
  mm/slab: Enable SLAB_FREELIST_HARDENED by default
  mm/slab: Enable SLAB_FREELIST_RANDOM by default
  mm/slab: Support disabling SLAB_BUCKETS at boot
  slub_kunit: Add a test for the slab_buckets boot parameter
  mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
  slub_kunit: Add a test for the kmalloc_partition boot parameter

 .../admin-guide/kernel-parameters.txt         | 15 ++++
 lib/tests/slub_kunit.c                        | 87 +++++++++++++++++++
 mm/Kconfig                                    | 11 +++
 mm/slab.h                                     |  8 ++
 mm/slab_common.c                              | 48 ++++++++--
 5 files changed, 163 insertions(+), 6 deletions(-)


base-commit: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
-- 
2.54.0

