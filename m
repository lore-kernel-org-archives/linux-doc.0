Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CEA3B531A
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 02:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477748; cv=none; b=fOWVxl5QASZngjJYFIwFbNuHdnFt8dqZKxc9r10VrvjFgEKYHE8unwIMtAz02hdFT986gphZvdU9J6sN2hDd0EszYjy0M4LxCMMS5seFA3QFIeqOt2AivFJ7R+GjfCFLkhWuC9Dl65vI0v+5yyOp+eeLhdjampNU2OigQBnAa90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477748; c=relaxed/simple;
	bh=dX1NF946TUb0fsJwDFBQI5wjoIzyGFvWnGsw2DRu0Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gh9iY9OHe5mFDmwr4WTz0QeJ/dyKWKvYOjUIgweGGQrQiVLD6wSpD/h1vEq0lCFhroyfH4T1ZPvwF1/MOPURYp5vuE8KZQWD+91SdgfR3AY4D97PVkS6YxVrzKpZUEPijWRzH6QUBfFB2fe+SjrDIIcwoKemHMShN+jYpX/4i5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dC3cUWt5; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dC3cUWt5"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0abca97c0so1066837a91.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 19:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477746; x=1791082546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CIuL28jJc9rBcE3veHd1eORcVK0n34BpltfpMfOrf4=;
        b=dC3cUWt5qkl0lSCXBC35zZCH8fwFnC1CPpHNkc/3rrQ4eTxmYrwqXk4AsWiqAFGcv2
         oGQGp70wmSeviUvCGgWf6A/icWK8AfyrEaBDHrSHNocGlkGgHqUrEzttxkQjG/2rKMp9
         Hqd5qDYYvKP/9eTxltsPj9sj/JKwKV8GAIgd1FD0TwtxFmIbexKlEtMbu8ABR5Mf7thi
         a6jX4krao8xd8DM9e2OHqV/Kccb8WTpLY8wWyfSkvSnpq6EUyA88wtL1DrgWI0tvUsb+
         f5rnHB7MJA+w0J4Ay/Fp8FfS3F/2fNacKDe6ot2rMnhcWvLHEK5DHZ0jlcpZL9lXKcHz
         HDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477746; x=1791082546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CIuL28jJc9rBcE3veHd1eORcVK0n34BpltfpMfOrf4=;
        b=URUODutYNtFUTTd/dl7hQkvYll8ESzM0ErgQTl1hM1PdoXELQW+AevtFqR0ba+JnzE
         bQgOIruxYf8nFKK1zRWtaRV4izgcVqCpryDqm1JjBlpRXGqYO3UsxFyH/kLWwZdC8xT/
         DxXzt/IV1zO9FZQnQDGzl20g81rfoAmd3dmkQqEfd7rIADJsKaGwJCHFPwCR2SDIfKkH
         753kQ4k0uv2nkJy8sLugVlm5k729DQimgMO/28yHwXd4+ZrdJwmqthkzTScngNKYklWl
         E9vVAwYr0afJokfftbjQ3YQHta55gttuCdJhZFEiLPkXQpueb/5BLHpgU33OzFf9/5L0
         5YUg==
X-Forwarded-Encrypted: i=1; AKwUvBzgmsNFoKw/wK2ZOY7ofzqBKIEVcVmh+rnU8dQkW05tQC4+zCxCfxdnhAfyCiaVPBWZHJxhRu13iUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ51sw/9TPIDgVdWexJS+S7jiGqLyv8SyYdtZrluU1zp0DdWtSJ
	TarqXFYEIBQpAScLIvI8SFmjQphSK65gIa7T105pE4qK1pqM68Z/ba8mp8DIVZEhjgE=
X-Gm-Gg: AYBFou1i43Dvx75cq1cqzZpMQUnfkU9LHY38Gquz4GOwq4oNLdf8X133ymRxLnYTbBX
	+SOKkAa0FB/uPq9b/ZBY2eXAZY+DsZ8l0bxOpnINQySIjuL48cMwKBUAE62uaE2OP/odH2RrCbd
	GnBQw0GT/BloPRvh6enrdrYycIlPiJd6P/3phePKu2EO0XxGcitmw1yBEfGMOgkwx6sGTGPvSNR
	xArY3p+EDiq1mOnyvMzqWY3TOPHq9zW1mhLpYGos8Aljdp3y4j6Fie/VOJlDKOqEvB5OGxgGCpS
	0hvDCSQITnnA6fIfnWxZZ5RPm74StxgNYKi8RkeQsuCI06ZlODLJ0acfcB3VMWQo6ZPMCOOzmP8
	6nx51Kl0GkKm/tz1v/aGbnpvKnXFNO1reaOkRH5eRwhuh/GM7+uus7IeKB+XnVtWjMxcDFMZYM9
	Z+bvrMHClY76mtRCJr8HmCrZyo6NMV7pN8tga+ueatt0AH996PEXJn/iDVYm+EL5k49UuBdBeoS
	qvd3xLJ+9kyRk5F7/cqcGYAvJ0CsBg=
X-Received: by 2002:a17:90b:380a:b0:3a0:be2d:3853 with SMTP id 98e67ed59e1d1-3a0be2d3c4emr5473938a91.8.1790477745543;
        Sat, 26 Sep 2026 19:55:45 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:45 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 11/12] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Sun, 27 Sep 2026 10:54:40 +0800
Message-ID: <20260927025441.741633-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
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
index b6378826b9a2..b617ff1b985d 100644
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
@@ -666,7 +665,7 @@ static struct page * __meminit populate_section_memmap(unsigned long pfn,
 	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap,
 						      pgmap);
 
-	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages));
 
 	return page;
 }
@@ -677,7 +676,7 @@ static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
 
-	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages));
 	vmemmap_free(start, end, altmap);
 }
 
@@ -687,8 +686,7 @@ static void free_map_bootmem(struct page *memmap)
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

