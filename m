Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20B3A7F58
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488386; cv=none; b=BV0+toyWhurBMnt0iMKZrLtx+Iikj1q/Ie7oLPtXkHkgxBB6A+EYIdbEBbiBMMTLdY7veaPS5AiAJl8d4zMlXvRSr8IfsnH8SJePnWhnV5quPhdXRVasVjgQUtA3Rh1YCUQMzvVB3I3ulruvAhi5DMUC4m+sdfs3jWZU1yyj83o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488386; c=relaxed/simple;
	bh=I0peSzQJvlIZz5uMjSKzPiwpkY7ufWY5RidKc3yKlbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUUV6/8SjBbBi1zgsIDcS2e4xtIsCmAZgwS07Da5OYnsjlT3udZLmGO75m6PmiL8KDy+mRXLxm2uFlCf47G1p7z4VzlVw1mzbTIzVQxXBr5epGvmEi36X0hOUL56rEQBK5761W21D/3anE5KNAM8Gs6IjjEpkn+ANMBCG2Jk9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R699iQhV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R699iQhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3039C16AAE;
	Thu, 15 Jan 2026 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488386;
	bh=I0peSzQJvlIZz5uMjSKzPiwpkY7ufWY5RidKc3yKlbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R699iQhV4OOHiDgDYTjylFpQBC6eLW+aiX9cTvJJ4tgeLRRFggUCDCtDpoRKfsh/S
	 02U6AOEO2KAqxxfFd57tns0l2SHnNpWa+pJdCRYhD9f44xqT2iit4TbiowmIcB0H6e
	 /V8JkqSpD4hVBTYr1zeOGzqb/+wmIJclkfDxNt8t3h+BWZctFpERXLcr+ktikmBS2V
	 RFo5qY7fwFh64Xd08iQrcIFstqyelGubITEBBEZqh0DO4+YaTX5u1FQhEgvagvYz4B
	 2EtjG4u2+ORD+G5l/Z9Us+8RZxXz6hY+cvTGxaJ3rLUjPWsVxRKTWmY1tuCrChmyI+
	 2yysEf2GfKojg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0016EF40068;
	Thu, 15 Jan 2026 09:46:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 15 Jan 2026 09:46:25 -0500
X-ME-Sender: <xms:wP1oaZvpnEUe5vsfvHSgOlJT4hooIQooCRbaUNDRis-Y6U7mcjCH8A>
    <xme:wP1oaRvxSod6DGeoJsLIvaX5Y2zRBd66MzQT_NksmYNUBFDvi4U-wEeBLN8X-F-pp
    frXw73uNq0FnY1g_N0fNGaa8pMeDcpDShQn0-er3LcjhilmgIQiLM8>
X-ME-Received: <xmr:wP1oafneybhNCm6rZWt920vgGvpEI9-eHaKCkR04si6AeP6RNHEPKV4YMsm68A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:wP1oaXt9pQQSAp2t_NdEt7r8lR30t9W_G0uu3uvyHlbC4covWI6afw>
    <xmx:wP1oaeM34zMbMcB9RzPAFWrxxfT1dYMHXiekJ3_ohiK_dFcEDDZN8g>
    <xmx:wP1oaY0MPHfCI_NWf8gd10K1UMr-sL3r5N1nSOT9rOhE9aVw9IQ9JQ>
    <xmx:wP1oaQzt55hw4TKgFLCG8KI3S7XMrqXzpv_sQxzE6odlrrDpP7QmVQ>
    <xmx:wP1oaSqgO7wVkmzErlv7ieLaYPRsE1BkRIYZQBvyD0bEo4Ztm6CuctG7>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:24 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv3 10/15] mm/hugetlb: Remove fake head pages
Date: Thu, 15 Jan 2026 14:45:56 +0000
Message-ID: <20260115144604.822702-11-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260115144604.822702-1-kas@kernel.org>
References: <20260115144604.822702-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
vmemmap pages for huge pages and remapping the freed range to a single
page containing the struct page metadata.

With the new mask-based compound_info encoding (for power-of-2 struct
page sizes), all tail pages of the same order are now identical
regardless of which compound page they belong to. This means the tail
pages can be truly shared without fake heads.

Allocate a single page of initialized tail struct pages per NUMA node
per order in the vmemmap_tails[] array in pglist_data. All huge pages
of that order on the node share this tail page, mapped read-only into
their vmemmap. The head page remains unique per huge page.

This eliminates fake heads while maintaining the same memory savings,
and simplifies compound_head() by removing fake head detection.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/mmzone.h | 16 ++++++++++++++-
 mm/hugetlb_vmemmap.c   | 44 ++++++++++++++++++++++++++++++++++++++++--
 mm/sparse-vmemmap.c    | 44 ++++++++++++++++++++++++++++++++++--------
 3 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 322ed4c42cfc..2ee3eb610291 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -82,7 +82,11 @@
  * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
  * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
  */
-#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
+#ifdef CONFIG_64BIT
+#define MAX_FOLIO_ORDER		(34 - PAGE_SHIFT)
+#else
+#define MAX_FOLIO_ORDER		(30 - PAGE_SHIFT)
+#endif
 #else
 /*
  * Without hugetlb, gigantic folios that are bigger than a single PUD are
@@ -1408,6 +1412,13 @@ struct memory_failure_stats {
 };
 #endif
 
+/*
+ * vmemmap optimization (like HVO) is only possible for page orders that fill
+ * two or more pages with struct pages.
+ */
+#define VMEMMAP_TAIL_MIN_ORDER (ilog2(2 * PAGE_SIZE / sizeof(struct page)))
+#define NR_VMEMMAP_TAILS (MAX_FOLIO_ORDER - VMEMMAP_TAIL_MIN_ORDER + 1)
+
 /*
  * On NUMA machines, each NUMA node would have a pg_data_t to describe
  * it's memory layout. On UMA machines there is a single pglist_data which
@@ -1556,6 +1567,9 @@ typedef struct pglist_data {
 #ifdef CONFIG_MEMORY_FAILURE
 	struct memory_failure_stats mf_stats;
 #endif
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	unsigned long vmemmap_tails[NR_VMEMMAP_TAILS];
+#endif
 } pg_data_t;
 
 #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 2b19c2205091..cbdca4684db1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -18,6 +18,7 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
+#include "internal.h"
 
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
@@ -517,6 +518,41 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	return true;
 }
 
+static struct page *vmemmap_get_tail(unsigned int order, int node)
+{
+	unsigned long pfn;
+	unsigned int idx;
+	struct page *tail, *p;
+
+	idx = order - VMEMMAP_TAIL_MIN_ORDER;
+	pfn =  NODE_DATA(node)->vmemmap_tails[idx];
+	if (pfn)
+		return pfn_to_page(pfn);
+
+	tail = alloc_pages_node(node, GFP_KERNEL, 0);
+	if (!tail)
+		return NULL;
+
+	p = page_to_virt(tail);
+	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
+		prep_compound_tail(p + i, NULL, order);
+
+	spin_lock(&hugetlb_lock);
+	if (!NODE_DATA(node)->vmemmap_tails[idx]) {
+		pfn = PHYS_PFN(virt_to_phys(p));
+		NODE_DATA(node)->vmemmap_tails[idx] = pfn;
+		tail = NULL;
+	} else {
+		pfn = NODE_DATA(node)->vmemmap_tails[idx];
+	}
+	spin_unlock(&hugetlb_lock);
+
+	if (tail)
+		__free_page(tail);
+
+	return pfn_to_page(pfn);
+}
+
 static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct folio *folio,
 					    struct list_head *vmemmap_pages,
@@ -532,6 +568,12 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	if (!vmemmap_should_optimize_folio(h, folio))
 		return ret;
 
+	nid = folio_nid(folio);
+
+	vmemmap_tail = vmemmap_get_tail(h->order, nid);
+	if (!vmemmap_tail)
+		return -ENOMEM;
+
 	static_branch_inc(&hugetlb_optimize_vmemmap_key);
 
 	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
@@ -549,7 +591,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
-	nid = folio_nid(folio);
 	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
 
 	if (!vmemmap_head) {
@@ -561,7 +602,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	list_add(&vmemmap_head->lru, vmemmap_pages);
 	memmap_pages_add(1);
 
-	vmemmap_tail	= vmemmap_head;
 	vmemmap_start	= (unsigned long)folio;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index dbd8daccade2..94b4e90fa00f 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -378,16 +378,45 @@ void vmemmap_wrprotect_hvo(unsigned long addr, unsigned long end,
 	}
 }
 
-/*
- * Populate vmemmap pages HVO-style. The first page contains the head
- * page and needed tail pages, the other ones are mirrors of the first
- * page.
- */
+static __meminit unsigned long vmemmap_get_tail(unsigned int order, int node)
+{
+	unsigned long pfn;
+	unsigned int idx;
+	struct page *p;
+
+	BUG_ON(order < VMEMMAP_TAIL_MIN_ORDER);
+	BUG_ON(order > MAX_FOLIO_ORDER);
+
+	idx = order - VMEMMAP_TAIL_MIN_ORDER;
+	pfn =  NODE_DATA(node)->vmemmap_tails[idx];
+	if (pfn)
+		return pfn;
+
+	p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
+	if (!p)
+		return 0;
+
+	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
+		prep_compound_tail(p + i, NULL, order);
+
+	pfn = PHYS_PFN(virt_to_phys(p));
+	NODE_DATA(node)->vmemmap_tails[idx] = pfn;
+
+	return pfn;
+}
+
 int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
 				       int node, unsigned long headsize)
 {
+	unsigned long maddr, len, tail_pfn;
+	unsigned int order;
 	pte_t *pte;
-	unsigned long maddr;
+
+	len = end - addr;
+	order = ilog2(len * sizeof(struct page) / PAGE_SIZE);
+	tail_pfn = vmemmap_get_tail(order, node);
+	if (!tail_pfn)
+		return -ENOMEM;
 
 	for (maddr = addr; maddr < addr + headsize; maddr += PAGE_SIZE) {
 		pte = vmemmap_populate_address(maddr, node, NULL, -1, 0);
@@ -398,8 +427,7 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
 	/*
 	 * Reuse the last page struct page mapped above for the rest.
 	 */
-	return vmemmap_populate_range(maddr, end, node, NULL,
-					pte_pfn(ptep_get(pte)), 0);
+	return vmemmap_populate_range(maddr, end, node, NULL, tail_pfn, 0);
 }
 
 void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
-- 
2.51.2

