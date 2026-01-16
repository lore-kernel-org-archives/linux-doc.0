Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EA3939A4;
	Fri, 16 Jan 2026 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580340; cv=none; b=agZzwRBoAMSZVHe3pxQXHwCp6Fqq0hbBJuccNtOoKXrtjy6TsPrVcYmH5tFDJ61a3M1Aovk2gPVDXGTA8qkzZLab7Rg0ZJgpXjmTlGoYFyer1NbnXj68PNHiKTh0xprqGE1HxQcYO/xv3p8ryCw/5ooSxaoi1hleMBZkt3mIOJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580340; c=relaxed/simple;
	bh=/Mp8bdLF/AfKTaNOMoq3MpNYakYvz35npSkmqiiDFVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psFxCftqf7A90T8wqCgjnttgmFSrLKcYBCyvNEB9MTUGZdKGeavHxvNPfxuDn/WZ6T2UrW4OssIbswnxDHJZCY99/BLZFjHb8mIvikn4W+SsGPnrdu8BQp2T/wlFiZ+ITFa9sBOSrAXbHEAxWCyiYuh9tUvlhDaMktLkkznvfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSWU+QUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSWU+QUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32582C116C6;
	Fri, 16 Jan 2026 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768580339;
	bh=/Mp8bdLF/AfKTaNOMoq3MpNYakYvz35npSkmqiiDFVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pSWU+QUdLEZVWfxZEr6S6sckSDMzAQP4ynowWsBJff95lj5PdNvb4u/5S7l0Di5Ms
	 o/vXoM6oqhKqeRhET2Vqd9LXEt07dCShAeFJPIbHfmyslXTXDkA5umftGDHUSnXLSh
	 xR7eWOjVqm5gU9RfWmAmZk7M8TQIHaLq5xc6bOAInPY6zU/FeosdWhAJoAOj7wLymY
	 NkTjIBSNWO5ljcggQA/ztCDP7qRqubZDcrioQG06NOuPhKBBO7IzeL7DXDOeWM09C9
	 UCe5PKJFjPVCBR0Kxh8kgNyZq62rgFNmGmwvCm/s21SE+6fj3VJd9l4efFv0HAfn3W
	 uNUtXpw1C/SAQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 547B4F40087;
	Fri, 16 Jan 2026 11:18:58 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 16 Jan 2026 11:18:58 -0500
X-ME-Sender: <xms:8mRqabv8Ft1x0lbuCbWr7rE0AwXZeP0w0g5rpaYEIGRB0ENrItdVlw>
    <xme:8mRqabvV8xRNxCiqNg_zfGQj9MBvYu35XjHW0c-WQ61oU658LgJKn7uw85il6k6VE
    vhT2I_o3XTcjpwk4laAtDDPCWvGp_BrG2PzxyD9O7xg55igoN4DaDcL>
X-ME-Received: <xmr:8mRqaRn3mkqm_kYMglTEhVZQZWByrhgc0vU5Kp9GGFVomV-bJ8abh4JAd_HqOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdelgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcuufhhuhhtshgv
    mhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhephfdufe
    ejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdevnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlodhmvg
    hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddvkeeggeeg
    jedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrghmvgdpnh
    gspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrghs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnug
    grthhiohhnrdhorhhgpdhrtghpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtghp
    thhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepuggrvhhiugeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehhrghnnhgvshestghmphigtghhghdrohhrghdprhgtphhtthhopehkvghrnhgvlh
    dqthgvrghmsehmvghtrgdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8mRqaRuD2fOUfJyL-ilunjIbkDM11U5BCD7G3JNoHJy_NW6x3N6bAQ>
    <xmx:8mRqaQNdl7mMH-A_cjvKJD4-n89JA2T3c2YZCtvTjFjYQ86sKEES0Q>
    <xmx:8mRqaS2byjdCEjpcq77vkESiVp2MfPwJubd9yLzg5A6E0g0vZZRzNA>
    <xmx:8mRqaSxnPuWtQWUehjJJ7jGoGBaOcKR3VaijEKbaWf-3kTNRyYnCcw>
    <xmx:8mRqacpfRkQGky2EDJ3ZdEq9M2tG_rSswLMxcoIcR0e-S_CnyXjLwNWw>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jan 2026 11:18:56 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	corbet@lwn.net,
	david@kernel.org,
	fvdl@google.com,
	hannes@cmpxchg.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	rppt@kernel.org,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	willy@infradead.org,
	ziy@nvidia.com
Subject: [PATCHv3.1 10/15] mm/hugetlb: Remove fake head pages
Date: Fri, 16 Jan 2026 16:18:46 +0000
Message-ID: <20260116161846.1799643-1-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260115144604.822702-11-kas@kernel.org>
References: <20260115144604.822702-11-kas@kernel.org>
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
per order in the vmemmap_tails[] array in pglist_data. All huge pages of
that order on the node share this tail page, mapped read-only into their
vmemmap. The head page remains unique per huge page.

Redefine MAX_FOLIO_ORDER using ilog2(). The define has to produce a
compile-constant as it is used to specify vmemmap_tail array size.
For some reason, compiler is not able to solve get_order() at
compile-time, but ilog2() works.

This eliminates fake heads while maintaining the same memory savings,
and simplifies compound_head() by removing fake head detection.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---

v3.1:
 - Define MAX_FOLIO_ORDER using ilog2();
 - Update commit message;

---
 include/linux/mmzone.h | 16 ++++++++++++++-
 mm/hugetlb_vmemmap.c   | 44 ++++++++++++++++++++++++++++++++++++++++--
 mm/sparse-vmemmap.c    | 44 ++++++++++++++++++++++++++++++++++--------
 3 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 322ed4c42cfc..bc333546c2d3 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -82,7 +82,11 @@
  * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
  * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
  */
-#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
+#ifdef CONFIG_64BIT
+#define MAX_FOLIO_ORDER		(ilog2(SZ_16G) - PAGE_SHIFT)
+#else
+#define MAX_FOLIO_ORDER		(ilog2(SZ_1G) - PAGE_SHIFT)
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

