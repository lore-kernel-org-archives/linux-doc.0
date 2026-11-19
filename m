Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071666;
	b=slKA7RlY6RUPwMncccyCz3EgJgwW6Tl5yNqg5uBsWW2rOceS79LDkz1CBT1Gxbtw23zN
	 tPJEhOVHP5QMkAO8DD3iwL6sPwPTIo8ygwZD2Ja7ikfWxTSTXHqi6pMxKtILAui5QIMxk
	 3dHoWxPwezRUX7vf/KRikVB+9x41E9LyvvfI4ttfFWWpPzecYtOJkQW9x/1HyTHr7Z5U0
	 2G/sOSRRj23OBi/UXrm1iVC09d64+5inAEYsQGE1LU063cQMLtDTu0pChJubERQoUNORN
	 QCXlLzsxkRGX+Jr2pwSnGXUUqKOPWY6HVQs8qOCpQqW5m48Eh9fNhbARnC3SrokIF4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D+FnLhj7qRAFWKIuwGU/FM3UqUnlL/5I23zrp6FTFBI=;
	b=bS/4VkCJN6VEtXMCDAPbNZJbj/6qj3PkH4nb5ecW8VLkPJCcafjdVJ9gXYGgPnkzEo1p
	 mVXUEg2aOAXz2g1gZPaQqONf92ttdMwQ2Jjoo+CJ0USVTaaPAZ57KnTErbtumAzAxnjuA
	 DIJdKmgppBJHNniMBRd5ao2DF5LzlvZ4cluzxMY6zpQzr4GS+22HMLosHUwpG0I7mkO08
	 o4ZF+2yW/zQ8oRHFYtASNGgN8kfLuG9tdnR1georF6kxaCmnVdzgJGthdSVJhzY2MpWHR
	 +tDCdrRGOT2kWl2hxN2dpSkEODtpC0Q5PdXCM3fZq5NXnZ4u3uif/MU4n1YscQaqvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZzjcteVu;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA3606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AA3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZzjcteVu
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso510046a91.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071665; x=1795676465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+FnLhj7qRAFWKIuwGU/FM3UqUnlL/5I23zrp6FTFBI=;
        b=ZzjcteVuganhCxCSsBgbT+MHa1JOJMlipltfzd1WJl0pIcWsWEBNO7wR7JtnQWLu+K
         ixxroXWp8+iADxcIN3Kb3S6MNXiVUpLxTAxlk4jjUauLJVffeRBdA7PB0Gz3gYixbbcr
         i5pD9/Cx4+mwEoYDaAb4b4SJBV1yMoUWpqOwtG/rA3HX3UWvZXLBpBQGKrRLo/lxQvuW
         WaSk3NaEcWsQNKyRGAL9+Yra9PIZUkNlAPGOn+pkC6TEv4bqVAv8vWkEQKZgEHxHhDiP
         NKvyBZvSB8IYPIwnKcI9qQnpFFsHBeueWdsBYUBJr6pV40bzcEq6mqbhh3rXuFzndrg0
         j/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071665; x=1795676465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+FnLhj7qRAFWKIuwGU/FM3UqUnlL/5I23zrp6FTFBI=;
        b=T7tdS1Z33JcOqwkLCaLj86AXYaF0hcheT+gOZRO340gARbwIDMmOMfNlXlmoB61Yqd
         V5n6m96PEkGo7w5UOHwUVLUSmX24v1lZMgcFg0yf2i0Olk04v13UMFLWHJ0zKMdTLmox
         XARHKGRKfuCEvH6Lqx6HwFyJ2Q/+/zXFBkTyuji7lABqFYP8vl6E4v7kVji7xuS62UvY
         1StTwJxFH+Odka5ZWzoGshalU5N7MguH9YQ2axp1XLRWmoVqIoIjRrrRiPQ0Qnzt2D/z
         KDdPtuTgLz2YdfZjznKoVvv6oRoWo97GOxxWx7WnEL5MlVZv0HTTccstp4p4aiaaw+D9
         PbKg==
X-Forwarded-Encrypted: i=1; AL+hErFjt4f/0mhZrH8mlV1R3l2wB5Ju3+snh9C4mUorNrjCU8KsWffVIa8/0bQ/AT4s8X2eEVB6ncxImeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RriGU/M1CrX+eeSoOo4SnDAQ4nSvLtDq8F4xyEtVy85rxmkPD
	+piEq/9Yr5aRS6zCy/OB/l7Wd5ubHifLGkw8GHViQjeUBfvqgmv5Ht1YExVLsD2kyhw=
X-Gm-Gg: AZFdTZeQwT2qgEhn+SofvKV1FBmD8lMFPPotPuELJCYM3dWZYUPTlQ40LqplFDMIyCd
	1n+aGeHjn4RFnxJiUf0DqFuKfayxtxJv5HlVzorNxq8Jc3DORv9QpXQgtT3cV12yddSaP8H6MGm
	Xcj3LVwKsxKVZQof38j7fQot1f6UT3j2ExClKyV42/DGLzur/5WYYyEb8a19p+l11tIAgGJ+gi8
	HyFR+orAT9wEftYlsgUzckH4TdR4edUx63vPVakI82JBW6l1jotADytoQO05ZQCEIZcTtIVGjZk
	To29OZlr3fTwIVO23GVkyBxGFwF03tw1rTHNcOyYpW5zDfi1gUuQV8Tjb3fwF/DmLQEpZC2s58k
	B1yy7+q/gdGgxgjyJv6EMhhG2sLBRqgZ4we0IIB/zJPonHmAxsAEAV4Zbg97uq9wC2NtJcPAiI7
	Dix/rXyKm85wz4dbv+cFC4JvJOy7seZRAeOvdbqrIGrQbVLW0RiMXYRXir1yzflJFV2ISkYji3x
	jtq7W3bG8bDWJ6N93m8z/KF/ZuosE960uOKlYLKkqltmOzjN24xSgy6Cj2nByymV8X7o2g4GSG1
	H2gCnJERU6zXxXSdL4+sJg1OAHm+UR4XzuP3wLu5liIrEFn63wZ70PPx0uI=
X-Received: by 2002:a17:90b:35d0:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3b409fed4c9mr143623a91.20.1795071664611;
        Wed, 18 Nov 2026 23:01:04 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.00.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:01:04 -0800 (PST)
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
Subject: [PATCH v3 5/7] mm/page_ext: allocate page extensions early for SPARSEMEM
Date: Thu, 19 Nov 2026 14:58:10 +0800
Message-ID: <20261119065812.89959-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119065812.89959-1-songmuchun@bytedance.com>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
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
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Use DIV_ROUND_UP() for page accounting instead of relying on the
  caller's size alignment (suggested by Mike Rapoport)
- Collect Reviewed-by from Chris Down and Mike Rapoport

v2:
- Allocate all boot-time SPARSEMEM page extensions from memblock
  (suggested by Mike Rapoport)
- Keep memblock allocations above DMA and suppress per-section free
  messages (suggested by Chris Down)
---
 include/linux/page_ext.h |   9 +--
 mm/mm_init.c             |   4 --
 mm/page_ext.c            | 117 +++++++++++++++++++--------------------
 3 files changed, 59 insertions(+), 71 deletions(-)

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
index bcc4e7e8cd1f..ea763e299769 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2705,10 +2705,6 @@ void __init mm_core_init(void)
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
index aff00f4e1bdd..cfd20ed72884 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/slab.h>
 
 /*
  * struct page extension
@@ -185,11 +186,6 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
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
@@ -243,24 +239,16 @@ static int __init alloc_node_page_ext(int nid)
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
@@ -287,10 +275,18 @@ static struct page_ext *lookup_page_ext(const struct page *page)
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
+			memmap_boot_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
+		return addr;
+	}
+
 	addr = vzalloc_node(size, nid);
 	if (addr)
 		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
@@ -309,7 +305,7 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 	if (section->page_ext)
 		return 0;
 
-	table_size = page_ext_size * PAGES_PER_SECTION;
+	table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
 	base = alloc_page_ext(table_size, nid);
 
 	/*
@@ -336,11 +332,19 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 
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
@@ -454,52 +458,45 @@ static int __meminit page_ext_callback(struct notifier_block *self,
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

