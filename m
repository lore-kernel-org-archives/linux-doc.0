Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650003ECBE4
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541082; cv=none; b=Lw9kBVj0mJKJy433t8LxPfFo1POEJBlmt+dc2Dfagm3M4o9YcNzCMmkw0Uu1iaie42rZXmWqZVjtlnAcuanzIqrQpKWqlfc0o4aQ9qKOF/SRsIm1lL1/hzuqackvC/qVn+GRe/V30qshULt5R4Wd0Dlq/AmF+q/gPa9pkZdyuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541082; c=relaxed/simple;
	bh=o5WJM3/QFSVrnnx6cWLQ5UPoN7IuOCV+HHfC3SmFVvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2C+eVriEFVaDuF5yf+cp5pcrP26CqPbYjsWBeaAF/y+nd6sntpvp/vPrST2UtpK/oapnmCQBSnjBa1dh6jDPeNOFFaLud7dzCtygFHrS1q1g85uMEpDOtToTkbVWynIRnfqwpLNZlvxSGj2d4/bkUwzElblkxYaPBDwCFTi1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BbqzPG7G; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BbqzPG7G"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fe517774so7193255ad.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541080; x=1790145880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=BbqzPG7GWtNylKccSg71VixFuJecxTQ3lf0YDea9jtfstudOs3EP5CzM468Aw2krl4
         6sz/apRIEAFfPPtKqTfPv2fhrbYqR+O9I+Kx17I3GVceIZKlWD7jbs87t9f6QR+tMoI8
         KgA88X4cLLcYxSLLIJ8GTZ0k/M5MtaNkOSglQ487/Nf9+VKh5se42taGsfEmiF42UUTi
         znlLbNxAoVCvx9xyBGgb+pAhIrShQqSUyVmeloqQll6hSeWV7JZqeGg9LEEM2Ft+Yg2F
         Ds38Vyj42FZpz0LkSlgdWA4cZ88kn9gHwoLTBRnVhzz+V1PY+8US6uwu1WtsuH5TV6Lg
         BHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541080; x=1790145880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=FELeIx1qmRfRtAxjtjIbOvIOm5e8106QlCtiRKehrcrghgLUQt8eHQH4McbKfIaWT9
         wyKXyOEESUgKFPEE/3KvYKL0q9RmgqecRb7YhSOj+BQYe44LSdLdDQQ1fpZZnHc7lN+y
         PPbkxrWhAJCn+hPr8yQdq/wJdtX5vYDwpzz2ZEH+wCzqQSO+QyUPgHCHZ4nCIAsppekq
         JG05+G5xIqYDd2EJ78x8dXOlFlkapeBMN3oF2wGY8sVjnh585CHuvKnnFs5zSXzotT+L
         wdrj/xaWnz2dzaH3caOS7ppup4FH6GXbpfdDPCA5Nj8W8dGeJSz9bX4zbGCSii4AXX6X
         XoWA==
X-Forwarded-Encrypted: i=1; AKwUvBxMgcyFhFc+3yiQzb9v9ZtQlDPD7+gv9Ti+obHDC6WnzJj+rxZsX7hQfhXs89raZoSICGvmMY4OViE=@vger.kernel.org
X-Gm-Message-State: AFuF++kyfNtovCOYUuYpKAAukW6lgMNn1vgIo8g4V3JL9w4icn8hUCvR
	HlV060QBlYbWSmVrH+e90v1mU9xKxqoDQZmryYs9RRFtCAJnLYNo0N2uXoQL0Cj1C9M=
X-Gm-Gg: AYBFou2aQCz5jBZpsVBNgWtFs2utcPqVapu6CaqCMHMSUzBxJmUYPwAc9HecIlfrqc9
	G/E5sZBruZBSdkOaYfDzEsjvI1sFtnsVX+DWhJJmiZizCqG/GafZ31JhlXXAOnKEjELG+ZV1sGp
	8gG3aKZVGRCFN74FAgGauounPSQmeJWHDJkCZhN+jVlmA7EMPYpslMuanRMmdOixNGaB3k0y1oo
	lz1r8jj6DpSDNhoZFT2FF1HhTwZi+0SprnPIWxqfAMFHa73OV8X8sFn7jeTKjCH3nWmW8Q9OQhO
	AOdPjXQrlVNVOAk9u63898m4Rx333NMksN0eXhF5gN2BgUi059GuC7+JWLrEcf1HUxNB2XiRTq2
	TthQAQcL7NFbP1/DeXEc/kRI/spU5Rxwi47kpUoTvhVgXZhPMiIOZqBWO85l0v7Qa6Op/3qWKal
	9ZpBRAgQkhAzgQYz5HG/awsezHUetJmlfbETSfwyucNgv3W7vtEwrz5PZLg4f67xp/CX5ccsBf2
	DBKdXDqV7lSlHTf41w70BfdhP3ZYw==
X-Received: by 2002:a17:902:c94a:b0:2d8:d4cc:be68 with SMTP id d9443c01a7336-2dd8e7b5ca2mr29021055ad.21.1789541079708;
        Tue, 15 Sep 2026 23:44:39 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:39 -0700 (PDT)
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
Subject: [PATCH v4 10/11] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Wed, 16 Sep 2026 14:43:40 +0800
Message-ID: <20260916064341.1825793-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-1-songmuchun@bytedance.com>
References: <20260916064341.1825793-1-songmuchun@bytedance.com>
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

