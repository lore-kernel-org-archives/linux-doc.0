Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048AF34165F;
	Thu, 18 Dec 2025 15:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070612; cv=none; b=goTlp1J3/I9H2jykGyCVI/pr/REPyFdwqLmrT6d+e02B4itey+o0gQcSX3AeFpHzwnZ8ZLT5rW3BPc6tTBlNKE49Jgvbnv4YFwxpPDdeFpXz5d83vEQScvvvgk5cw+pLALZUI4gHyzuv2UJ/k1COg8ND9wmyG0aImODbmXWS8lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070612; c=relaxed/simple;
	bh=TSdSWKSGTjJX3BfXX5DtxkhH6XDBorGJgKQrJKFha5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4SUAyPiLB4hBXfMx/6Fxhf0b5/Z0FoXymoJdrDVA3T/lYNVTCjRkyCsdOGOAuycS4t++HLh5e3v28Yxbv7ApFWTAsLSuDPnSfSJru0EMJwVEg66rrVmeIq/b3cfWC76oyz8GAb5344gi6AkAdkvf9iP8m25gF72S2EUo4Ut6QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAvKXn2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAvKXn2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC48C4AF09;
	Thu, 18 Dec 2025 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070611;
	bh=TSdSWKSGTjJX3BfXX5DtxkhH6XDBorGJgKQrJKFha5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AAvKXn2w2IieUtB4WjbryyQEF3lcwBh11PSwagI0J+H0lo8dC/zQgCVH8UKAZHd9B
	 BelLaja/Tjflf18pWIkZVMPOTZuFNvvo3zjmlGMYWMYeQmwDEo0qa6wgfP12PJaJI3
	 qKVd8fogf7roQzos9Cqg7PZFjQL58HBcjHHDXI+ovhtZSDrcDSfT+B5W9lFU+SX+xH
	 BuPVbey76+x28dp6m+o+B62UWcEDElx5ubRkBJS1cEZqTmuA7aOSsYIu0hUwT8iGDS
	 E7pNpkzSIhnmQ0f7p1+ZMTsA2csg7Y9Egyfg5UuSZUBVRlvmKD73JXCX6qdWGwlkHu
	 +2oP+JQMlH2zw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C8B1BF40078;
	Thu, 18 Dec 2025 10:10:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 18 Dec 2025 10:10:10 -0500
X-ME-Sender: <xms:UhlEaZ46_JOQvKPkgwLjVLfXtCmcXpsJijAq73vxKzKEvAr16qJ6-Q>
    <xme:UhlEaWIhbdE-Sv_G9z5sHrogrS08pDvowbWG93ZmbMCWFGhs0vegMf3FeYBQZ4SsF
    SYLx_PyaNpPTm2-YO1csoaMmTcVPIYpynxrV3iSG7EATW_eZmK5srI>
X-ME-Received: <xmr:UhlEaTQ3LBThRE931pKvvklTD7yMSfn4PEaGPGbaHToqZ4msGZX8D0hRmXiz6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhudefjeehhfektdeuvdefveejffdvhfevtddugfduffejfeeikeelhedvtedvveen
    ucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrug
    horhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:UhlEaZoQLskv2F2iYu7gNRpF0qlfwgjMHqhTWyQzKOTxpakceu8kWw>
    <xmx:UhlEaRa2yxjhu46bRMhaHamREtO9MvWlyVHqPFGYl1F45JWMH-TISg>
    <xmx:UhlEaUSan2DcdtiG3cvHOca-6hx7TGdGb90Ly7SxCf6wbLm2Wpq1-Q>
    <xmx:UhlEafetUcAMDd25PPIzzGCKBsl19nW89xETapPKth1xHnxxLm3Lkw>
    <xmx:UhlEaTnmOSqhYhzPeIDhYkIcQJK7AXTAJYtrS9WPBlJqeGsiO1pevK6k>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:10:10 -0500 (EST)
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
Subject: [PATCHv2 09/14] mm/hugetlb: Remove fake head pages
Date: Thu, 18 Dec 2025 15:09:40 +0000
Message-ID: <20251218150949.721480-10-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218150949.721480-1-kas@kernel.org>
References: <20251218150949.721480-1-kas@kernel.org>
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
index 7e4f69b9d760..f33117618f50 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -81,7 +81,11 @@
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
@@ -1407,6 +1411,13 @@ struct memory_failure_stats {
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
@@ -1555,6 +1566,9 @@ typedef struct pglist_data {
 #ifdef CONFIG_MEMORY_FAILURE
 	struct memory_failure_stats mf_stats;
 #endif
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	unsigned long vmemmap_tails[NR_VMEMMAP_TAILS];
+#endif
 } pg_data_t;
 
 #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index d18e7475cf95..63d79ac80594 100644
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

