Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917258;
	b=HdTg+L5klqoio/Ga4f1LJbrkIeaReNFnoPdQfHtgP9xgzghs5G50CFvc6VXPg1dXPonA
	 WGOEWxvUrzg+wBzYWio8QQszDK34/ZWHs7UkN/Rq+vDl1pf2ZNirFA4612/klJpJrCoRW
	 cbbYYGIvVudGnO9IHNJlTkLitQkcFJtLbLvizIPWohpSRsGk8SQRQSbPOtpYTAtOIyR/A
	 FVT9fSw9XKlouPRYle28LSmlYhaj+H+l8aWqfrLp+8wmGgVJo0+Ve54mI35uCvR54DhsK
	 DiPhKv2JmL18Z14Y7jiAdkM7j7FdxQfn3TMVGISE4wngWEQapdIVieLqY+WESEDNJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gAIHywl1MwtQvs1NN9GS4hVFASUu/1jjvVICxYuSB7M=;
	b=N0BYzCKxm/wjowuGeerU8JNxUHOtCNRRyB25KgNxNOMn0GZXXU3nk2+BILs4xJKOaFGG
	 6jZ0zdyROQOBbIbRDHVhYzYcd3IkYku5RoEVjMcDffc4R7KyzFbavQjfAm65/XU0xfEXV
	 oND+weU3E7UqXOBNEXd4TzsnBMjUu+pG+JQ/3fTtNXdlEUFZq4iqbvlY+5qTaS1AKyotQ
	 wtJCOwqzDnTrBLqkZ04141MCeLE0od6PAQusJ2YU8NR5iHUPQZNFP5foVokZW+2rgAAp1
	 1nuzn3NQqYyAFAW2T5wJbrYe5V7GO2X9NOy3QoBm9n2CvrSYCxbnY2LtZZwqX8FoUMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hn140Y64;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34259606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34259606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hn140Y64
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2962536eec.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917257; x=1795522057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAIHywl1MwtQvs1NN9GS4hVFASUu/1jjvVICxYuSB7M=;
        b=hn140Y64cJChEV3M9lPqvGOQVRRAnFNgJvst1BkMN/2XuD9/aoMPDKS0yL60vj0bo0
         +Pu4oKn8zW1BEKnWBQUniX+d3zduaW1nR0Wui1uT8MfLX/AycV8CF4WZOM/29qTNaWiA
         bFGPi59VCVz46xvjUEM2ORzsJFRlHMM/7MPh36cDmpR6VlWRD+3bTWPkOnw03svAxPEM
         zOze1/Lyk5FFzes8G/VmiTUdKF6j5SjTqSjOPtmIFIyAm837t7VdN8fvqFEoJ3IUq+c2
         kmPLCwlGyVUor4zQng86nEGumubJ2Yi7yrXqoMZmmILUvSBGZYHg+8bC4PiDAqEPaNQx
         WAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917257; x=1795522057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gAIHywl1MwtQvs1NN9GS4hVFASUu/1jjvVICxYuSB7M=;
        b=K6fTIxSe47fKYNvTbwJgjiYFvUdlxGOzVcM3FPj2shlVSZ5PQmGlUnhuOWnpQMen/d
         e08mz/khAcSacPJfdEzOpROECHnUDAgWvEVnLjdqsToCnM53ISeFif+QpRRi7AVikW9W
         56VCaQPM1CuxeJoORvrNR+X3Eywnk6/i5BcuC3kpVCS0u+FUOy7hp3jKGHVVoyFTNgz3
         2S5zrgTbLY+Vsmp3hgBrkwcYHaVakMf4DVd8rrpTAvftczMFFbNRq0zDHBCZ5+il26D7
         Siz7dnfdBww6HRjwHdPQF5AmLPDkxxoQUeJL3ndLfJtnsFoon5QjTSeVK9QPXgBRWOTZ
         6CzA==
X-Forwarded-Encrypted: i=1; AL+hErG7OH7N9o/DJfW1wSb6juGRWTSrMmileRetvcCi7VjQnOa6wBdU0xM+3fgFNVs2L1+RSJhCJXIqlp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ODxG64LC0B/d7VQFWzD72P6eIiB7x/GrVZm0zCZQYfoNsIM3G
	+5SNQvROW1LS0NV6lzoApOuZyWX6zlVC3dCe97qP7vVy8t6m2PJLqdYB123YFoPj+1c=
X-Gm-Gg: AYBFou3Y0Z7ZghJP3pX7vAoaFe4prPkJBrLlCDYVkhdwpjIQNzNT4uDK3KkYXPf2Lkn
	iYkSv0n93WLcGqfMIAHRqLHAtSI6YRlcCg7eGy1EjTHZ/DIcbXftAzhnlEECDe7KVXrL5uOw38f
	91sx+kv7keco4jg1FZ58iiO6opZWdtbgALIhIXDSM94Gu0hSmZn5EvjOnrKRK6vpI5Ou5NtBxmt
	LU9ftA9/49ZIdGq1xYY/nc7mMfzo+E2lLlulc+PxwJZNcc6dWri+XujZ0ilO0q4OQbiJdh7KnD0
	viq2Cf+F0gd8YqVTOQxvug8d15qXk3qoWCVNUV6+RE0lVJb4p0wlJJs1MjqZfG8g2V1tQ/F7110
	ztSkHceQR4b8j/SpOOZZ/BICU2Vmnk1jHtBsZai24Ld/B9flf4YQ2XKMbbB2r3bosqiF1itewit
	YHRtSJ7xHhJ9+1YmU+Z1NEsbkGqRY8axL8Z/jOBzgLGGzPZwlyeIsFgMceSmuCQycT/heWbEv9t
	xas0lhIgDu6vx5IsegWb5kyNPwXKSexxiHZ1zJkW2kSEmjF62Hkpbq9jvD8aRbWvAueAPORBnAD
	qAr+S6+Nb4R2rPavaX9tgA3PBXfFv+Dq7or3ma4HogFfVPY64pTxuKo5eXoFKbiDbA==
X-Received: by 2002:a05:701b:4508:20b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b50306c4d3mr13554786c88.2.1794917256945;
        Tue, 17 Nov 2026 04:07:36 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:36 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for SPARSEMEM
Date: Tue, 17 Nov 2026 20:06:25 +0800
Message-ID: <20261117120627.50601-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN needs page extensions when kmsan_init_shadow() installs per-page
metadata, before memblock_free_all() releases memory to the buddy
allocator.  FLATMEM makes page extensions available by this point,
whereas SPARSEMEM initializes them later in boot.

Allocate boot-time SPARSEMEM page extensions from memblock to match
FLATMEM's initialization timing.  This gives early clients the same
page_ext availability guarantee across both memory models, while runtime
memory hotplug continues to use vmalloc.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Allocate all boot-time SPARSEMEM page extensions from memblock
  (suggested by Mike Rapoport)
- Keep memblock allocations above DMA and suppress per-section free
  messages (suggested by Chris Down)
---
 include/linux/page_ext.h |   9 +--
 mm/mm_init.c             |   4 --
 mm/page_ext.c            | 119 +++++++++++++++++++--------------------
 3 files changed, 60 insertions(+), 72 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 911a84bbb3db..d00320106a58 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -61,12 +61,10 @@ static inline bool early_page_ext_enabled(void)
 	return early_page_ext;
 }
 
-#ifdef CONFIG_SPARSEMEM
-static inline void page_ext_alloc(void)
-{
-}
+void page_ext_alloc(void);
 void page_ext_init(void);
 
+#ifdef CONFIG_SPARSEMEM
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	/*
@@ -76,9 +74,6 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	return next_pfn % PAGES_PER_SECTION;
 }
 #else
-void page_ext_alloc(void);
-void page_ext_init(void);
-
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	return true;
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 7344e7cb8196..baa2681857eb 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2707,10 +2707,6 @@ void __init mm_core_init(void)
 	build_all_zonelists(NULL);
 	page_alloc_init_cpuhp();
 	alloc_tag_sec_init();
-	/*
-	 * page_ext requires contiguous pages,
-	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
-	 */
 	page_ext_alloc();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
diff --git a/mm/page_ext.c b/mm/page_ext.c
index b41d4a957bc6..2910727e99e2 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/slab.h>
 
 /*
  * struct page extension
@@ -180,11 +181,6 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init(void)
-{
-	invoke_init_callbacks();
-}
-
 static struct page_ext *lookup_page_ext(const struct page *page)
 {
 	unsigned long pfn = page_to_pfn(page);
@@ -238,24 +234,16 @@ static int __init alloc_node_page_ext(int nid)
 	return 0;
 }
 
-void __init page_ext_alloc(void)
+static int __init __page_ext_alloc(void)
 {
-	int nid, fail;
-
-	if (!invoke_need_callbacks())
-		return;
+	int nid;
 
-	for_each_online_node(nid)  {
-		fail = alloc_node_page_ext(nid);
-		if (fail)
-			goto fail;
+	for_each_online_node(nid) {
+		if (alloc_node_page_ext(nid))
+			return -ENOMEM;
 	}
-	pr_info("allocated %ld bytes of page_ext\n", total_usage);
-	return;
 
-fail:
-	pr_crit("allocation of page_ext failed.\n");
-	panic("Out of memory");
+	return 0;
 }
 
 #else /* CONFIG_SPARSEMEM */
@@ -282,13 +270,21 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 	return get_entry(page_ext, pfn);
 }
 
-static void *__meminit alloc_page_ext(size_t size, int nid)
+static __ref void *alloc_page_ext(size_t size, int nid)
 {
 	void *addr;
 
+	if (!slab_is_available()) {
+		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
+					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+		if (addr)
+			memmap_boot_pages_add(size / PAGE_SIZE);
+		return addr;
+	}
+
 	addr = vzalloc_node(size, nid);
 	if (addr)
-		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
+		memmap_pages_add(size / PAGE_SIZE);
 
 	return addr;
 }
@@ -304,7 +300,7 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 	if (section->page_ext)
 		return 0;
 
-	table_size = page_ext_size * PAGES_PER_SECTION;
+	table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
 	base = alloc_page_ext(table_size, nid);
 
 	/*
@@ -331,11 +327,19 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 
 static void free_page_ext(void *addr)
 {
-	size_t table_size;
+	size_t table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
+	long nr_pages = table_size / PAGE_SIZE;
+
+	if (is_vmalloc_addr(addr)) {
+		memmap_pages_add(-nr_pages);
+		vfree(addr);
+		return;
+	}
 
-	table_size = page_ext_size * PAGES_PER_SECTION;
-	memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-	vfree(addr);
+	VM_WARN_ON_ONCE(!PageReserved(virt_to_page(addr)));
+	memmap_boot_pages_add(-nr_pages);
+	kmemleak_free_part_phys(__pa(addr), table_size);
+	free_reserved_area(addr, addr + table_size, -1, NULL);
 }
 
 static void __free_page_ext(unsigned long pfn)
@@ -449,52 +453,45 @@ static int __meminit page_ext_callback(struct notifier_block *self,
 	return notifier_from_errno(ret);
 }
 
-void __init page_ext_init(void)
+static int __init __page_ext_alloc(void)
 {
-	unsigned long pfn;
-	int nid;
-
-	if (!invoke_need_callbacks())
-		return;
-
-	for_each_node_state(nid, N_MEMORY) {
-		unsigned long start_pfn, end_pfn;
-
-		start_pfn = node_start_pfn(nid);
-		end_pfn = node_end_pfn(nid);
-		/*
-		 * start_pfn and end_pfn may not be aligned to SECTION and the
-		 * page->flags of out of node pages are not initialized.  So we
-		 * scan [start_pfn, the biggest section's pfn < end_pfn) here.
-		 */
-		for (pfn = start_pfn; pfn < end_pfn;
-			pfn = ALIGN(pfn + 1, PAGES_PER_SECTION)) {
+	unsigned long start, end, pfn;
+	int i, nid;
 
+	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid) {
+		for (pfn = start; pfn < end; pfn = SECTION_ALIGN_UP(pfn + 1)) {
 			if (!pfn_valid(pfn))
 				continue;
-			/*
-			 * Nodes's pfns can be overlapping.
-			 * We know some arch can have a nodes layout such as
-			 * -------------pfn-------------->
-			 * N0 | N1 | N2 | N0 | N1 | N2|....
-			 */
-			if (pfn_to_nid(pfn) != nid)
-				continue;
 			if (init_section_page_ext(pfn, nid))
-				goto oom;
-			cond_resched();
+				return -ENOMEM;
 		}
 	}
-	hotplug_memory_notifier(page_ext_callback, DEFAULT_CALLBACK_PRI);
-	pr_info("allocated %ld bytes of page_ext\n", total_usage);
-	invoke_init_callbacks();
-	return;
 
-oom:
-	panic("Out of memory");
+	return 0;
+}
+
+#endif
+
+void __init page_ext_alloc(void)
+{
+	if (!invoke_need_callbacks())
+		return;
+	if (__page_ext_alloc())
+		panic("Out of memory");
+
+	pr_info("allocated %ld bytes of page_ext\n", total_usage);
 }
 
+void __init page_ext_init(void)
+{
+	if (!page_ext_size)
+		return;
+
+#ifdef CONFIG_SPARSEMEM
+	hotplug_memory_notifier(page_ext_callback, DEFAULT_CALLBACK_PRI);
 #endif
+	invoke_init_callbacks();
+}
 
 /**
  * page_ext_lookup() - Lookup a page extension for a PFN.
-- 
2.54.0

