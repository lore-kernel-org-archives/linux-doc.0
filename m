Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68463B4E9F
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780761544; cv=none; b=I9NaY4lea6LR931YqEwjpCaydGglz9xVOC8T0K/xPbjO62CL2A8fUy2ca1bKIeGtPoXWzpWxbQ1OvxTQBXesr3OUcThXcQwNv9v9i0J9Y+gVl0B0F4KqGuUIzNJCmGoLVBG68linfkRraL/nh3ff5qyF8PNUSCqfBt3+jXUWrpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780761544; c=relaxed/simple;
	bh=wcUQRRBwb7R3/LqFZ9O34NOaCsSL1RwmALRPFa/6XQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KokMqKlxn2rwyavBt+3wV5kpDYv2Mz71V3GRqGpWnxWCBEpAa/piLgPiETTxzjwl41/CpjGd7tVt7brpS4lDqaDIvPiWpzCMUlxuOL8fibrSa6Yk8bXA0m2TNkxYn46ML0HaCKvJsav7JVtBeo8ya9Njx3nfjz46H4ZUXJIv1+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBmUBjLB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBmUBjLB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b915ded5so23919965e9.3
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780761541; x=1781366341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPAu+BAhHHXK2zlYgOPKG9XbowJkcKlbw5y7d5pIQQc=;
        b=eBmUBjLBLK/yKHhq9ItpBu19QeAe86JBepjp+3lFmWjr5oQ7w6lzdZpNHb1jHytROq
         kuEZRmWdLUFH1jbArNKTTxOIXh4zdoeM6VcN0qrI4r2Zl+vTqZ1gD6xdJzE6fbtwS1YK
         dn40XmvImoWX+1pE7hI2X5HAsAgDzvFxQNCIkP39b4f0oNaA+WXbqEDoTpuytQnjg2UM
         SBWYkBxObtTNy3DZDH/RCZRpsEg4RJoCMz46Wav4f3soSoVUDnhBvil1c7RL64d1aNY9
         0e7XcniUhegu5kTsF5o+syfsFjxryhIgmAZOdpHDC323EW+tFqS0I3mUYVQxKIPi7FTr
         Fybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780761541; x=1781366341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPAu+BAhHHXK2zlYgOPKG9XbowJkcKlbw5y7d5pIQQc=;
        b=k9WnbV8Wemdj1WUhcGaVmdsuwuZ0WLr+V8w+rDorxuPjedu3FWudhnu8QIwjkrTRPm
         ReQwXCcE3GnRbDZ/PiP0AonX0wK5k+Mo/uj10j0F4itzwHB3mFllg9kpqmhZhJ8YJs3S
         nNkAnsS/foqT9sYigKwJcnyIDZnN2ngcrqF3mddviXyh8hRIvLcnffpyjkBH8511SASJ
         Uv8tkI5dOJJNyol0vrZV6oC49ecBdXGHBTGvoDWuertC/AB455fHmU4iUbfLcyJN7YKg
         SQUU4sxb7+YGW0QnEYIrY7R1lvHlqka9LQkEQltTQTicTei7TBahoL/pJ4MNY9nPhIBV
         heng==
X-Forwarded-Encrypted: i=1; AFNElJ8eG2efVKuFDOC9nSym5Y32Iyg86hV5rmgwduc3gkLw6Ir5KIKR0/MGJk/B82SAUX8oAFGNaPVnAkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJX9Pr4nGgGRfdaROx0SmFQBW1QDYi9+9h/3RnlssyKM/X1yjk
	yhrrYQyGNSff3rVC2cHSbAeQ9egXDyBruz4oPn+kSen1rMMnkDJGY1w=
X-Gm-Gg: Acq92OE65zl3ILMD63KOjveFo5ivLytsYX+sev3TfL75VwDJ3k2bJop6JbVpRhnf82u
	ymoNHQeVZ375sEtkeMJUAIW5sPqgwU6mk3Z+Fnu5BsJQDeVF84cYWL1cYt+nNNOhuudQNW0Eh0O
	wze2+F2jgVH25rRyHD2yinW1N3UN7dBfF7smSD7LaIzFMB66DTBXjykxoGGksAmtz3DLdYLwpzG
	C+JgavahQVqsT+NO0jRPjGPNd1vVh8+sA+OEu+9RNZD1SdOulYGBrwwts1pS9gh9AmlpIlOxKql
	x3EfDRuBf5HpwIpHbVjz12ncEUMXBQZ9Va0NCCAUuuFpv+KAgY/AFqFm93JGc80gT5WED8KtYSb
	yRyXusecbb1kSaAd4Ll6BWQPzz2Xjz44soy/2sqBW2djBj62M5stmuD1E7Hy9I+A2yzEQiMGTgp
	lUx5nSXF/sTXFUhbB2jebQPNUtp5RrxkAktHBMN9DGsttBky1NUaFfL1Erbh5vcXG6iGtHPI0hX
	09X+JCx1EixBZLJ+qSehITWa9BxaflWlq3t4IsmlBSKNjfxCOAV
X-Received: by 2002:a05:600c:1554:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490c25eaca1mr150028355e9.11.1780761541013;
        Sat, 06 Jun 2026 08:59:01 -0700 (PDT)
Received: from hp-ubuntu.. ([196.119.187.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3a87dasm235639805e9.7.2026.06.06.08.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:59:00 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH] docs/mm: document slab cache isolation with SLAB_NO_MERGE
Date: Sat,  6 Jun 2026 16:58:55 +0100
Message-ID: <20260606155856.15548-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation explaining when and how to use SLAB_NO_MERGE to
protect security-critical slab caches from cross-cache heap
exploitation.

The document covers:
- Criteria for identifying caches that need isolation
- How the SLUB merge mechanism works and what prevents merging
- How to verify merge status on a running system
- The cross-cache attack class with CVE reference
- Tradeoffs (memory cost vs security benefit)
- Relationship to CONFIG_RANDOM_KMALLOC_CACHES, SLAB_TYPESAFE_BY_RCU,
  and the slab_nomerge boot parameter

This information was previously undocumented, requiring developers to
read mm/slab_common.c to understand when SLAB_NO_MERGE is appropriate.

Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 Documentation/mm/index.rst          |   1 +
 Documentation/mm/slab-isolation.rst | 113 ++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/mm/slab-isolation.rst

diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index fb45acba16ac..c2d5349dfc34 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -17,6 +17,7 @@ see the :doc:`admin guide <../admin-guide/mm/index>`.
    page_allocation
    vmalloc
    slab
+   slab-isolation
    highmem
    page_reclaim
    swap
diff --git a/Documentation/mm/slab-isolation.rst b/Documentation/mm/slab-isolation.rst
new file mode 100644
index 000000000000..d51472eb0c95
--- /dev/null
+++ b/Documentation/mm/slab-isolation.rst
@@ -0,0 +1,113 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================================
+Slab Cache Isolation for Security
+==================================
+
+Overview
+========
+
+The SLUB allocator merges slab caches with compatible size, alignment, and
+flags to reduce memory fragmentation. While this improves memory efficiency,
+it allows objects of different types to share the same slab pages. This
+enables cross-cache heap exploitation, where a use-after-free in one object
+type can be leveraged to corrupt an unrelated type.
+
+The `SLAB_NO_MERGE` flag prevents a cache from being merged, ensuring it
+receives dedicated slab pages.
+
+When to use SLAB_NO_MERGE
+==========================
+
+`SLAB_NO_MERGE` should be considered for slab caches that meet the
+following criteria:
+
+1. *Security-critical contents*: The object holds data whose corruption
+   leads directly to privilege escalation or security bypass, such as
+   credentials, cryptographic keys, or capability sets.
+
+2. *Actually mergeable*: The cache must not already be unmergeable.
+   A cache is already unmergeable if any of the following is true:
+
+   - It has a constructor (`ctor` argument is non-NULL).
+   - It has a non-zero `usersize` (with `CONFIG_HARDENED_USERCOPY`).
+   - It already has `SLAB_NO_MERGE` or another `SLAB_NEVER_MERGE` flag.
+
+3. *Bounded allocation volume*: The cache has a predictable number of
+   active objects, so the memory cost of dedicated slab pages is
+   acceptable.
+
+How merging works
+=================
+
+When `kmem_cache_create()` is called:
+
+1. If `usersize` is non-zero, the merge path is skipped entirely.
+
+2. Otherwise, `find_mergeable()` in `mm/slab_common.c` searches for a
+   compatible existing cache. A merge is prevented if:
+
+   - The `slab_nomerge` boot parameter is set
+   - The new cache has a constructor
+   - The new cache's flags include `SLAB_NO_MERGE`
+   - No existing cache has compatible size and flags
+
+3. If a compatible cache is found, the new cache becomes an alias. Both
+   share the same slab pages.
+
+Verifying merge status
+======================
+
+To check whether a cache is merged on a running system::
+
+    # Check how many other caches share its pages
+    cat /sys/kernel/slab/<cache_name>/aliases
+
+    # aliases > 0 means other types share this cache's pages
+
+The cross-cache attack class
+=============================
+
+Cross-cache attacks exploit slab merging to achieve type confusion:
+
+1. Attacker triggers a use-after-free in object type A.
+2. Type A's cache is merged with type B (they share slab pages).
+3. The freed type A slot is reallocated as type B.
+4. Attacker uses the dangling pointer to corrupt type B.
+5. Privilege escalation.
+
+CVE-2022-29582 demonstrates this technique: an io_uring use-after-free is
+exploited via cross-cache page-level reallocation to achieve root.
+
+`SLAB_NO_MERGE` prevents step 2: dedicated pages mean a freed slot of
+one type cannot be reallocated as a different type.
+
+Tradeoffs
+=========
+
+*Memory*: Isolated caches may have partially-filled slab pages that
+cannot be used by other types. For caches with bounded allocation counts,
+this is typically a few extra pages.
+
+*Performance*: Zero impact on `kmem_cache_alloc()` and
+`kmem_cache_free()`. The only effect is at boot when the cache is
+created.
+
+Relationship to other mitigations
+==================================
+
+`CONFIG_RANDOM_KMALLOC_CACHES`
+    Creates 16 copies of each `kmalloc` size class and randomly assigns
+    allocations among them. Only affects `kmalloc()` users. Does not
+    affect named caches created with `kmem_cache_create()`.
+
+`SLAB_TYPESAFE_BY_RCU`
+    Delays freeing the slab page by an RCU grace period. Does not delay
+    object slot reuse. Does not prevent cross-cache merging. Solves a
+    different problem: safe lockless access to freed-and-reallocated
+    objects of the same type.
+
+`slab_nomerge` boot parameter
+    Disables merging for all caches globally. `SLAB_NO_MERGE` provides
+    the same protection selectively for individual caches without the
+    global memory cost.
-- 
2.43.0

