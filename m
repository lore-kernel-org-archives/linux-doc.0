Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA95248F57
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 07:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780816014; cv=none; b=cPi/tA6ZdOJgoVhy73cR9d4AYwaqvyrN4X/X6SCHOR2bBO38300THCsGlCl8rHJZv9LJZ0bb2shOCdg95pHfHPy4KZppwEWAp8sNbzePQbzY5tB717bxx+XqZD3IrjtArN33JCtEsQR0ej8vtVkmSTzR+WlsLKFpAkozOgcz9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780816014; c=relaxed/simple;
	bh=heTeMpu75d0octllsLN2T80w2EU3DkJ/ZmCHQiUIajE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2H+MdbBcXJVzp2cR8PsASRQ6WkqVM+2sbgso2ZX7wPcuqRB89kMrekqEBKJRXeetM81U2zNSGuJtsImPCffMd6F837UqoLn5E69wZ0XRUaAepEW2H2OhGP4LKNBIPUd4rTyFsrvVtJooMkrqhh8BjeFfRxmHNi4KYl41RHhmF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKrV7Q8k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKrV7Q8k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4908b92904fso37338115e9.0
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780816011; x=1781420811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjFCfZnGIYF5PioRnZOk1Y+cKLSfcfAJ9sx8UaHZ3lQ=;
        b=TKrV7Q8kNugCnqjStbMJi03g34l9fS0MBsTXyHuUozxqlz0jZo9eOBzC9sA55/4kYB
         12xfxBDa7nPUb/CCy+BGVvGtRsbdKGQJatr6LOSsjkAEZzqQ+qKXMsnuSPghimGigeta
         gOvUl7kBTP4CzMxGEovI7b6B7dXdk6hjHPw6caZr1JORDUlRIX3TlVZj7F8Btv3EoAYY
         XrnIa/V7JrLrNWw+EEpr9OUPBnZ+k17i1oAKvucU4pICEzR9X/84MIJmyc5xDFhIDlfz
         3qAg1nHW4ySAA7MzoHTjL5UjtjIqDrU/HKMod4GatGMZ69zWeKtYYfKHltKQ5WGkxLHS
         gwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780816011; x=1781420811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjFCfZnGIYF5PioRnZOk1Y+cKLSfcfAJ9sx8UaHZ3lQ=;
        b=WsPkkBkxlK9J/7/DpEenFLBmrIItEVHNvxst9NxZRbwp5D9j2tKiPW9X/KLCQJSedT
         +X9JQ6HuCyDY6hEL/HYz8gGXI6SIErvlbIZuhnmfzs3RIv1SLGIGyJ92Owk//RbffKRU
         BQL8BY1y2ZpvrArWIwzDB9t3Fr3M4DlRvF025hRZnuEd9lBwm5MieZfhf90ioWNu2Tjd
         67y7X0Wm+zxR9MGt70okqpUeYyeJEcarAxUuqD+5IJUirbOFF3kRKKOyOS4FLvpxS5sc
         NdiVTg6D3Jqo3p0x1UcLg6w8JVh8I+VSNEi9kSnaWCL8K1ThN3KianLaJ2Hrv9iRX0D8
         HZLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5Re7qnuNKYKFcPiX7EUKXrpFcdZAgeQq0jUsxO+Rs4MeZfnb8FPTyLGtwGcx+EW7PrHNb2NZoi8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgH+U2zuisv41qT1NAnlCsqBnTTQC0qh8N42EgWyftkeXJMJ+t
	FJHNbM4sfO5OYWbYtn5sU1JPxLY3yuLvGk/tsGFBEXZ2lTRbvOi1s2M=
X-Gm-Gg: Acq92OEdU9Ar/eidBbeOqIrAPl/kwIhwRCpy3PdJZSwwjPi0CsA1mrGaRhky8UMzBB+
	DRvOsrSh4qmeGNSri+sK5VOSpzgZy/3/2G1Rkfvhg31nTAbW6f78DSep7fz1Jr/pJ+xgBpUYvus
	kwiFDQsdxDNq4Fd3dBwNOTeN+aJ+Cdhb71pRoC6+PoSvnyAThi44vwVkdsPwoKawvGfeTQsgmO2
	ng16kLbPOGv46DU7sNmQckjI0+cBmStXNJtmT/SKw+EuNt1jvXEobsGzFuHIEu3Z6+Q9s1x1xhu
	TCbPDKT2Pa6GhHE1wSdggQ7sskn3RxmkAkXrvlNpNef9/yUvsVdPTm4+E4WFu3QVnkGDIZYEg/U
	5ut5pi8e31n5CGoCfnLFyrwjLdvrtGZtLypWdao/zjVMq3aqqQ3gWj8WIZzXQ7cau4AX6JZx663
	ZzUnF+a0w59K5Cs3BSzhkVIMSdymLdryb7fWOcgNUht/gIahh/KBrRDrdPeJNyAdfcmV8l1vWlK
	1v39i+X6fGbS2XYufXuK/bYbLvbRzgpsuaqD/gxog==
X-Received: by 2002:a05:600c:34c9:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490c25b3549mr184516635e9.7.1780816011186;
        Sun, 07 Jun 2026 00:06:51 -0700 (PDT)
Received: from hp-ubuntu.. ([41.248.186.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm44225082f8f.23.2026.06.07.00.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 00:06:50 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH v2] docs/mm/slab: document cache isolation with SLAB_NO_MERGE
Date: Sun,  7 Jun 2026 08:06:45 +0100
Message-ID: <20260607070645.9559-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260606155856.15548-1-med08elkadiri@gmail.com>
References: <20260606155856.15548-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation to slab.rst explaining when and how to use
SLAB_NO_MERGE to protect security-critical slab caches from
cross-cache heap exploitation.

The document covers:
- When to use SLAB_NO_MERGE and what it communicates
- How to verify merge status on a running system
- Tradeoffs (memory cost vs performance)
- Relationship to CONFIG_RANDOM_KMALLOC_CACHES, SLAB_TYPESAFE_BY_RCU,
  and the slab_nomerge boot parameter

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
Changes in v2 (per Jonathan Corbet and Matthew Wilcox feedback):
- Add content to existing slab.rst instead of creating new file
- Fix markup: use plain function() without additional formatting
- Use slab terminology consistently, not SLUB
- Remove How merging works section (implementation internals)
- Remove cross-cache attack class section (redundant)
- Remove Bounded allocation volume criteria
- Rephrase unmergeability guidance per Matthew Wilcox suggestion
- Add Assisted-by tag per coding-assistants.rst
 Documentation/mm/slab.rst | 60 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/mm/slab.rst b/Documentation/mm/slab.rst
index 2bcc58ada302..c485bd257c44 100644
--- a/Documentation/mm/slab.rst
+++ b/Documentation/mm/slab.rst
@@ -4,6 +4,66 @@
 Slab Allocation
 ===============
 
+Cache isolation with SLAB_NO_MERGE
+===================================
+
+The slab allocator merges caches with compatible size, alignment, and flags
+to reduce memory fragmentation. While this improves memory efficiency, it
+allows objects of different types to share the same slab. This enables
+cross-cache heap exploitation, where a use-after-free in one object type can
+be leveraged to corrupt an unrelated type.
+
+SLAB_NO_MERGE prevents a cache from being merged, ensuring it receives a
+dedicated slab. A freed slot in an isolated cache can only be reallocated as
+the same object type.
+
+When to use SLAB_NO_MERGE
+--------------------------
+
+SLAB_NO_MERGE should be considered for caches holding security-critical
+objects whose corruption leads directly to privilege escalation, such as
+credentials, cryptographic keys, or capability sets.
+
+It is harmless to specify SLAB_NO_MERGE even if the cache is already
+unmergeable for other reasons (e.g., it has a constructor or a non-zero
+usersize). The flag communicates intent and ensures the cache remains
+isolated if those other properties change in the future.
+
+Verifying merge status
+-----------------------
+
+To check whether a cache is merged on a running system::
+
+    # Check how many other caches share its slab
+    cat /sys/kernel/slab/<cache_name>/aliases
+
+    # aliases > 0 means other types share this cache's slab
+
+Tradeoffs
+----------
+
+**Memory**: Isolated caches may have partially-filled slabs that cannot be
+used by other types. The overhead is typically a few extra pages.
+
+**Performance**: Zero impact on kmem_cache_alloc() and kmem_cache_free().
+The only effect is at boot when the cache is created.
+
+Relationship to other mitigations
+----------------------------------
+
+CONFIG_RANDOM_KMALLOC_CACHES creates multiple copies of each kmalloc size
+class and randomly assigns allocations among them. It only affects kmalloc()
+users and does not affect named caches created with kmem_cache_create().
+
+SLAB_TYPESAFE_BY_RCU delays freeing the slab by an RCU grace period. It
+does not delay object slot reuse and does not prevent cross-cache merging.
+It solves a different problem: safe lockless access to freed-and-reallocated
+objects of the same type.
+
+The slab_nomerge boot parameter disables merging for all caches globally.
+SLAB_NO_MERGE provides the same protection selectively for individual caches
+without the global memory cost.
+
 Functions and structures
 ========================
 
-- 
2.43.0

