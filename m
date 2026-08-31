Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267733BFAFB
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162917; cv=none; b=F5imS1J1pyUKSZamFDSNKZppgM9IZYijyFv09gHqXlgobchIrqefe/cXRyaPx5Ku9107IO1JQX/bWbXePeHCHTy0ImHHzXCzvZIjjEAcTwSDdiZ5xDRUsCdWEZbio7kt4jNzTHSdxss9uriF675THDu20UNx4pMj6DEj23VivO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162917; c=relaxed/simple;
	bh=0craoejHz+yL27FxB85ch1A7TZcJ/6nPjXoONqTOYGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8EsfDeq52WnxDqYW28SXaPkoHv10KPnXKduTygqgzvviz2vvpVcYZ8LYC5uwp9g4sHFd+WVyz5JDY3kHV1FuvSQu7T2jxffVAXlKp4NcKWM7lcpC9ddtXr4o6W/aa5jctDV2omMQseAVBMw8PknQrWW+/D73DpykYGySWGMGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DFM58fR5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DFM58fR5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso3375720b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162914; x=1788767714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Uns/ZJlTRrXsZn1DdaJluablabo4P2O8/HR8HKp5bE=;
        b=DFM58fR5HSPLFJhOX23ETEp/9cXZuuukBeywrABjaW3Wh0ls4YBzOhMOeBR9Qq5/85
         bIg8H9pV6pT2SXGMJsdZlxtwWRqa2VuMoex+gQdTqnRmWWsHQv/IpfiAXb5xLLTRGdjR
         eBOusAYJ+0anPgnymRH4i/4/TBgisTGdNABwe25v/37FF4UT9kRckXXMQMG09XvdxSqm
         1DS2BvpGTNw6kmH8NKIE1BD3NhAtwxO1rtVu+JRjQ+LRf80RY4y8a2jodicUkuHA7yUJ
         as9wWtkF/ZPqDII32qwPqPbHGTE3g2SRbTWf9KyTxGqs5XPQ3UizdnrQdN3nO4FXB4wU
         U7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162914; x=1788767714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Uns/ZJlTRrXsZn1DdaJluablabo4P2O8/HR8HKp5bE=;
        b=iq6n1YT4VNaPJontg00rFYihwdhMt/NpMroI0kUEsqQdpA6Icw+6OKSnCAcvrGC9bs
         7JgELZKJN2+zsLLdu2wJ6lUYuupVuY+b0X5CwZZ6Zl/RSNxBD4q2qEcohvQVWje93c0A
         bZVeCMv9pSMaVSjndhQXQWd6Nn8E9PSdV4iIAF7qoPT7+ntT4JcaDFX2JeyA0EOWl/cV
         zfEz+JAT29UccMBM7GndO1E7sw9MREA8IRgqv+8J4onl95yLgb5YevCs1KBQ6AWBLA20
         f0aLpug77EOLaub4P79NKYbjWIS49rzrqBXfgxg1LnfmO5/f+ud4MxemoTJAgWwabWgk
         q9Ag==
X-Forwarded-Encrypted: i=1; AHgh+RotQueIQQ2+W/yV57zALw6ZtAsIqzSrZ9ZT5NSt7h85JnFt9xrtu91PA6wGN7aBX7CVngKwHazd5m4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYhpVGVlocce4CMOPBLBYSPriGLuxGpW77PErd3PxgwyLIwGQ/
	CsMMy5V62OS6oB9uAN23vt5gpt2vZpbtJvtQ4ONPRLp/S1oOM04sE0afRPJPpDI6qjY=
X-Gm-Gg: AR+sD130m3+CoebuOnMvTvMPvOriXP0lLCUC/MLcwuAfCwyizwpVKqUZJrXwtAMoxr1
	JtVEW2xdh8e8y9CpTrnzhL2htZiLNMFvO/ie9CB3rVurxNcZQLtMaKB+DyUcIq9T2WrQdti/HKi
	rsAW30ix9fBohUVw1I6EvUEjkoex66D2BpKunxpGIdRzqNK/1X4xZSlYTomBEFWYFufUz6pI93B
	wcRce7ghepdzwa8rettBZnrjG5LwVFIbNxsg+hjS8QOuCCUtgIPw+uJy13yjiwEIKjIxJ9UAEg0
	wuX6kGS934jjF3WtwYMouXHIuUbzoD8gYdoiNDt23urmTW99uPOCjiaPbhLf04pALITVV4jT2gS
	5grv4v+4hLhS72iENk89vvr2NOJmdAHvIFKv4FzDYjAQdqtrt04/ak26juaeGJOBKkmlndemOLB
	79pXulMBlRhrvmK6eInk1rYLqcjDShhWJz1bac8DBuLZ+nRAgDhMQzvu6+Ke4xmd5hCqYnYbSRd
	Pv29Clae/skYQ1mHZxrLMet
X-Received: by 2002:a05:6a00:845:b0:857:72ba:ff11 with SMTP id d2e1a72fcca58-85adca7066cmr2156632b3a.25.1788162914397;
        Mon, 31 Aug 2026 00:55:14 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.55.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:55:14 -0700 (PDT)
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
Subject: [PATCH 10/11] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Mon, 31 Aug 2026 15:53:41 +0800
Message-ID: <20260831075342.57563-11-songmuchun@bytedance.com>
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

section_nr_vmemmap_pages() no longer uses the altmap or pgmap
arguments, so drop them from the helper and its callers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 10 ++++------
 mm/sparse.c         |  3 +--
 mm/sparse.h         |  6 ++----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e655d9d1348f..4950ac2a1c01 100644
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
 	const int order = section_order(ms);
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
index 9349ed6326c0..adf057f54c0f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -251,8 +251,7 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
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
index e511d99fc26b..5d0f407bde7e 100644
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

