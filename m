Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02173CAE84
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162921; cv=none; b=c3iqaqwDnf9EzeJUmDd5svaWV4vveZV4XiBM05E+h4LoiXglAMqZ7d5XoUGOya2w1zU2f3tynBUNvnXusbR+taVv3FzeiVg2BzwTpERdDoscsu3ps65f9wTvrbfdpW9Vsc4cyEtOGghxIqFKyU0SX/i0v1eoyTHYmlP4Ip2m5j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162921; c=relaxed/simple;
	bh=GlAJ1WSK7MS4JWW3qgmtSMSpzYqrlPQ5xWGNOhjuiDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkQhmPMhJ2Pp0leMeNmQCcHGztykVGQzMD4pzzHmTGeT361/avLYQWwlRMYZv/9+KTzoFhjt+aUZaHYbaH6x+mNVScDEuAWdHDWt1aetiCLL8fcqi9IAoO4jq4BnAi6x/hhF/eJ3AaCSEMQdRnx2DMCEFOHQXvI973OvLMWgJvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Bqa4S0km; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Bqa4S0km"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2173217b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162919; x=1788767719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUo/y6IjpqbcIL2TFvU1ITTKCpXfhtvRzwNLV1+yihc=;
        b=Bqa4S0kmsSeiBX9zprRiGHLdDs6SGrmULANisb+wFZsc78t5kK9jSoEpHaxFNPjuc/
         CszefzXJi2pjx8ogQvZb4nxcZVNaLy0vUtwiK1k8sX5Qitef8ba9LOalb4bVvpMBwL+v
         n7coQl+SLVaEI3Et8fQrhRhqc0aoBDET1BZTJ5Ny/k8Mkv52mUnwel8SYQc2076JngHD
         jD3qxIcHVdN4AD5aXewWaCLl7QvSCu1Bz3E286VMtZ8GUXuYDDgdqmXg8QabldcCDKgo
         tzk0vkMIiX8+ySpyCjTl8Xpd+BvXm24h74m4D3ay9ijCafkfsp/Ipd+wF8eiha7pXyoP
         y0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162919; x=1788767719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUo/y6IjpqbcIL2TFvU1ITTKCpXfhtvRzwNLV1+yihc=;
        b=EVMKF5yfYuiKkO3DX0ynD8hd33GTzJRQU3wDJwq7v1ZPtUQ6hasSzYRKSjAqyo7aXR
         yvnLH85D64TFmFk4CrPlSsk6vxAOXiPDyvHgsvSiOZbg8nKeo6R8Z5Z+8xa7B/K9O1S+
         f0VguNtae3yX7X6sIs7coVdYO4l3JPJ1w6dP+5Ma6fo1QsCa/qzdwkVgVtegSGuZ3Tqm
         Hq0tu0h8ZM9uT6bI0w3KP7XCEGMSkCwcS3UHXLldbaa4OBTHJu4mvooI1gEWH1msthaZ
         QAWQBCTaHMW1WDQBcYashlF6cbNjsxAQ6OTJkzHvLmSCHYIzHgbyDOgYjU+DzFFH/7PP
         VObg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1yyxFiGCq+qwMM7pI/YFPiOAI0/K04AyRSruubj1PCksQ2g7v3D7V7y38BXfXnle8QZGSb8hu8SQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+jLvbOSXaME10f6OUanGQ4EDm0vsLFCvtCQaGHJEJCCeMPilz
	UO0hf1rXiY69cQ8Lb7tk2sbKHSnroko3BMs8vM8fu4BaCglgHYWwq04DuY9hqxwagbY=
X-Gm-Gg: AR+sD11rSPFUp4fcc6c5/JfDPgo9j85ADLZJX6JMpXFRSIJVSVomcs8ndbertueah8w
	BFyyAnqNzRddBYyLvpp1IspSZgBVQRWnk4uqZe+eZnSTMfOQNuJKSva25sqMCD6CWgt5JSnKvvy
	DpCoWeAVhgOPs1mlpFNaRE0o7tHOaH6hJAs5FNcKnaFqjhSPuh2gXCah6+oXnIO9sjn2Q0kHyge
	WBMgy5K1ZteVQ0H44URDo0s9IkXkurh9ygwgAluAd0SIuzGJOVyXokU0nyi4pljk9bmcN22FS9F
	PwQ4kESE3ckvRYSew3yYF781Ve7QLaJORZS9eQx9+lNzmjktCDHnDtucsM0KGavpb28YRoYpBrr
	lYA4GIOjitdeNccsg1WEW/PU7hXJy/gus7j7zmQTToLKZpf0wvSS0f094WxJ1eG/SFYtTxlR8vA
	l6yzW+mMWGqtXpvJ9hwkhPGg7ecBhFphB5OUAOFl8aekYmQQ7q6WD6J1/+r1KlN3ISbm3ymtlkf
	UWij7k9Us53FTaclPoN2Vlj
X-Received: by 2002:a05:6a00:f0a:b0:848:4859:a45 with SMTP id d2e1a72fcca58-85628988a7cmr40655921b3a.2.1788162918893;
        Mon, 31 Aug 2026 00:55:18 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.55.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:55:18 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 11/11] Documentation/mm: update DAX vmemmap deduplication docs
Date: Mon, 31 Aug 2026 15:53:42 +0800
Message-ID: <20260831075342.57563-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831075342.57563-1-songmuchun@bytedance.com>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device DAX now uses the common per-zone shared tail page for vmemmap
deduplication. The old documentation still described a DAX-specific
layout with a separately populated tail vmemmap page and half the HugeTLB
savings.

Update the generic and powerpc documentation to describe the shared layout
and keep the powerpc-specific size calculations while avoiding duplicate
diagrams.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 Documentation/arch/powerpc/vmemmap_dedup.rst | 90 ++++----------------
 Documentation/mm/vmemmap_dedup.rst           | 32 +------
 2 files changed, 21 insertions(+), 101 deletions(-)

diff --git a/Documentation/arch/powerpc/vmemmap_dedup.rst b/Documentation/arch/powerpc/vmemmap_dedup.rst
index dc4db59fdf87..8286acbca9bc 100644
--- a/Documentation/arch/powerpc/vmemmap_dedup.rst
+++ b/Documentation/arch/powerpc/vmemmap_dedup.rst
@@ -19,82 +19,28 @@ With 1G PUD level mapping, we require 16384 struct pages and a single 64K
 vmemmap page can contain 1024 struct pages (64K/sizeof(struct page)). Hence we
 require 16 64K pages in vmemmap to map the struct page for 1G PUD level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     15    | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-
 With 4K page size, 2M PMD level mapping requires 512 struct pages and a single
 4K vmemmap page contains 64 struct pages(4K/sizeof(struct page)). Hence we
 require 8 4K pages in vmemmap to map the struct page for 2M pmd level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-With 1G PUD level mapping, we require 262144 struct pages and a single 4K
-vmemmap page can contain 64 struct pages (4K/sizeof(struct page)). Hence we
-require 4096 4K pages in vmemmap to map the struct pages for 1G PUD level
-mapping.
-
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |   4095    | --------------------------+
- |           |                     +-----------+
+Here's how things look on device-dax after vmemmap-optimized sections are
+populated. ``N`` is the number of vmemmap pages required by the DAX mapping
+above::
+
+  Device DAX                  vmemmap pages (N pages)         backing page frames
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +-------------+
+ |           |                     |     0     | -------------> |      0      |
+ |           |                     +-----------+                +-------------+
+ |           |                     |     1     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     2     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     .     | ------+        +-------------+
+ |  PMD/PUD  |                     +-----------+       |        | A single,   |
+ |   level   |                     |     .     | ------+------> | per-zone    |
+ |  mapping  |                     +-----------+       |        | shared tail |
+ |           |                     |   N - 1   | ------+        | page        |
+ |           |                     +-----------+                +-------------+
  |           |
  |           |
  |           |
diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 9fa8642ded48..8c287ae3f86c 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -1,4 +1,3 @@
-
 .. SPDX-License-Identifier: GPL-2.0
 
 =========================================
@@ -192,32 +191,7 @@ to 4 on HugeTLB pages.
 
 There's no remapping of vmemmap given that device-dax memory is not part of
 System RAM ranges initialized at boot. Thus the tail page deduplication
-happens at a later stage when we populate the sections. HugeTLB reuses the
-the head vmemmap page representing, whereas device-dax reuses the tail
-vmemmap page. This results in only half of the savings compared to HugeTLB.
-
-Deduplicated tail pages are not mapped read-only.
+happens at a later stage when we populate the sections.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
+Deduplicated tail pages are not mapped read-only. The mapping layout is the same
+as HugeTLB.
-- 
2.54.0

