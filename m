Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC23ACF0A
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103060; cv=none; b=WOJ4gj92aHqdPxnQ8vl3dTTie2KjuixrrWYhfDvZTTkWub23nN9DX2aSFsjYc4HySXT34UmwiDt+dhmd/JRjdBol67YNzLlwHNWMKs45HxA4PKvCZAZ4EXap3xMYiXF62jFPTPT81jM+qHpd7Xum6mTacwhgFsFHQr33HBMS8Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103060; c=relaxed/simple;
	bh=o5WJM3/QFSVrnnx6cWLQ5UPoN7IuOCV+HHfC3SmFVvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEF1ksMbf+N7WXXYlwhBvKgUKiNdVx3q+xSqhCghcFbh1/gpCY4qDyLKI4F/oEg7XKNWAl/33foLuMKWMZYrLVGuJNoB14tQJl0yuqmbWH0sS/dYhtsQvevMQE9flu+5ZMOpbKgF+SmCg3zQV9YPqZ1RSQD2MyWJHuHy1Unw4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AXRhn5PK; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AXRhn5PK"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3c37877so480098a91.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103056; x=1789707856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=AXRhn5PKXzYGtdB6OaHb4lTuZqqB4h+EoDqk/IJOlI6InFnWnM90fsx01O3JR/Nhvh
         XFgNuYI3lxy9BxipCENY0G0CXPVDjPeZYRoXpc15Ms7QpDiSZAJhisGA1vxgr8Md3j92
         bBOOXxDM5KWKr2lfcwn5q9XAvc+IoWHNBw0HkFyjIZnBN4ZRhPCryeFy26+iKj00PLrw
         KbxVRoKC4Y9ijIS6NZs++3/3/hkfpBL++4FOIba3UknmxqshrxYpy8cobabXfdICRLs1
         FsogvXRrjgfa3HG7M9AfZ42xmbtE3ZlCvBn5M9Al4WWVYsqWlFNRVM2r6MKoISBfV1rL
         zwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103056; x=1789707856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=E+eIPy3ja70lkGrcT5nltYVxCq7XjIm7Pp3U4iyQyg9VivItML+tKMke+pJWv/eY2v
         /7tWj3/ue9XOYfygBHRayMthHr3Qe0JXyiBP9svEFHMZz4Vhx36Cj3og71WWZzq3uD7r
         F2q1voJmCgiJ1VcFDqprVC+xAX/6+G9ofYqdkF5BoU0NunGuvWqbLpGayNwyrGUuGNuW
         7gCTs7bp2GyhXHxCdTAvRPijjXct5/UDUDlbfp8utMpARy/f2CV8oVJAcHTZH1QXy12g
         As58XkkZTmbymMlA5shWNfnK0IJ0A47tzxM2hBv2Hf3ZyjxbaugAVCJas2pUI/cbqxyp
         dHYg==
X-Forwarded-Encrypted: i=1; AKwUvBwvsqcr7Q9f+KSrfcbBsWJVLUZ40T0UpszlyFIUM/udTUEnO8qVYEd1U9wqxR5c3GO85rJJDj0itI0=@vger.kernel.org
X-Gm-Message-State: AFuF++lrTcoULg9XjudXYyl5SRMu6q+mofaJZle4CJcrKDmEDUwoANZu
	cUIAtTWbjaNy4QnggnwBJUZJ1ksjuK9dhQj0IlM4wvLiR0rRblPYsndVVGc4Q9LAeu0=
X-Gm-Gg: AYBFou29wMdnTsui08Rl0CG92UoJ9QwTr5UiAEOVGB9TPt4hoUOAOD8GCG2GpUfSU3c
	ZDlkqxkCHYryg83wlalxFPRGChBdto0jPqy7NP0zVDD6ePEFutj3CPVf2+7ECCgARDgcWetFE/z
	en0dovQilNoMg3Z+yOqgVfCu6DG3qpIG6Dgz/lyHD8tpg/YhovikMRJHPUitc2Nl2KvJKBps0nC
	VTy2LFmnRSYW3/u0D2X1KOLxHyR6/dtm2AkMmnuTafUY4GUGyVakyNGKy8ZFdYTBwd4S+xpl5vx
	A2maXZ4kNJ/ZRcv/4nvzP38lvdLaqjPLohYy9ZHNYVyWkoqTM2zxHvwBp+VJ392ndIzKbXS6Dtw
	dAh6UJQioklyTZExse2gw2L3gYXi/i/FVfg3uMCzMMp3vG3R04yrnNFjkpOaExMuUdejp6AnpgI
	fQq1MYctZ77dUDNjsdL4k8b8lkHQ91M/UqRLI1zdZdWLEVAcUMYS1x+xylFwXQlqXQ9S0f9fhfm
	xj68r2c/OSHi+V7tjUtP7cc1klkzLCjxRxI
X-Received: by 2002:a17:90b:3ecc:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39d9bc382b7mr3533958a91.6.1789103056004;
        Thu, 10 Sep 2026 22:04:16 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.04.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:04:15 -0700 (PDT)
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
Subject: [PATCH v3 10/11] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Fri, 11 Sep 2026 13:02:27 +0800
Message-ID: <20260911050228.58884-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

section_nr_vmemmap_pages() no longer uses the altmap or pgmap
arguments, so drop them from the helper and its callers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 10 ++++------
 mm/sparse.c         |  3 +--
 mm/sparse.h         |  6 ++----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 39f0cfeefc6a..96506f594924 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -131,8 +131,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
 			start, end - 1);
 }
 
-int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
 	const int order = section_compound_order(ms);
@@ -637,7 +636,7 @@ static struct page * __meminit populate_section_memmap(unsigned long pfn,
 	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap,
 						      pgmap);
 
-	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages));
 
 	return page;
 }
@@ -648,7 +647,7 @@ static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
 
-	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages));
 	vmemmap_free(start, end, altmap);
 }
 
@@ -658,8 +657,7 @@ static void free_map_bootmem(struct page *memmap)
 	unsigned long end = (unsigned long)(memmap + PAGES_PER_SECTION);
 	unsigned long pfn = page_to_pfn(memmap);
 
-	memmap_boot_pages_add(-section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
-							NULL, NULL));
+	memmap_boot_pages_add(-section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION));
 	vmemmap_free(start, end, NULL);
 }
 
diff --git a/mm/sparse.c b/mm/sparse.c
index cc28bb41fdb1..b75921c622ed 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -250,8 +250,7 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 						nid, NULL, NULL);
 		if (!map)
 			panic("Failed to allocate memmap for section %lu\n", pnum);
-		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
-							       NULL, NULL));
+		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION));
 		sparse_init_one_section(__nr_to_section(pnum), pnum, map, usage,
 					SECTION_IS_EARLY);
 		usage = (void *)usage + mem_section_usage_size();
diff --git a/mm/sparse.h b/mm/sparse.h
index a5111087ee3a..530692cdd516 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -70,12 +70,10 @@ static inline void sparse_sections_init(void) {}
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 void sparse_init_subsection_map(void);
-int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
+int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages);
 #else
 static inline void sparse_init_subsection_map(void) {}
-static inline int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+static inline int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages)
 {
 	return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
 }
-- 
2.54.0

