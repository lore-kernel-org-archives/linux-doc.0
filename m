Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC12325D53C;
	Sat,  6 Dec 2025 23:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062229; cv=none; b=HppBpQh9mLMwppkWqta41O9c1BsicWz0vqctZepyoXg6MTCmow4CO7iIx3aMaCHuMCYjifEUOnip7FwjX4C53sQuryw9EE8nNtSdTsfWQguDTFLyW2f0PIhsH0kGri4bAxenYSUBXwvxWLHI0vLZrBLoMuTWJ61PrduR8wHck4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062229; c=relaxed/simple;
	bh=ep+jrIbVv9vGa6SgBSTj5ivMOs2gsXD3lJ0J4ipWtJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRR4Aiusy+8GSCAVOcPL+B20XeZ/Y7TUNXyLsn+ke2oJ8u6F09476fHu3KSMpGyFdy+Ai2HBR1Eai2kcrdP+PYkAS6ORGu4Gc03TdE4xFjQPmrR7M+cbHg6TN9pd5KFcEXGXGb+PslzbwuwBORN6jFFSsdcDoeycS6sXesf9RJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRMaTXNP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRMaTXNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5ED7C4CEF5;
	Sat,  6 Dec 2025 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062229;
	bh=ep+jrIbVv9vGa6SgBSTj5ivMOs2gsXD3lJ0J4ipWtJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pRMaTXNPuKpEz/bwr3yXklWljScvY8Jj5BQFKIAxjk2h0Dms2ugjoSTkH+4VcK1pG
	 i1Ai1LIN5A1c0f69RUgbYPpxvrSr3j7B88iR/40S7Lp5TeF7eozVr2jBLcghpIRdfd
	 /bvn5NfR8DMyi+2hcVDyY+awVnxHJYRxidOpE3RssOTu/Hjp2v1o8P8BPxOA4TSCgk
	 /WVrS+pMMcmEhIiyCPZPzzKU7WVzkGlQJOA7X/Mp/mlUCQeuVuFTa+dfb9Lja/gxGk
	 ZMjxWcn9ubImioTY5hhg/RkWq5DfVPu8dVpk7zdLWbaJ4Mdgn9mJc2HPLSm08L7v6K
	 kSaDK0M9Vnq3A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Graf <graf@amazon.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [RFC PATCH 07/10] mm: hugetlb: don't allocate pages already in live update
Date: Sun,  7 Dec 2025 00:02:17 +0100
Message-ID: <20251206230222.853493-8-pratyush@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230222.853493-1-pratyush@kernel.org>
References: <20251206230222.853493-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support live update for a hugetlb-backed memfd, it is necessary to
track how many pages of each hstate are coming from live update. This is
needed to ensure the boot time allocations don't over-allocate huge
pages, causing the rest of the system unexpected memory pressure.

For example, say the system has 100G memory and it uses 90 1G huge
pages, with 10G put aside for other processes. Now say 5 of those pages
are preserved via KHO for live updating a huge memfd.

But during boot, hugetlb will still see that it needs 90 huge pages, so
it will attempt to allocate those. When the file is later retrieved,
those 5 pages also get added to the huge page pool, resulting in 95
total huge pages. This exceeds the original expectation of 90 pages, and
ends up wasting memory.

Check the number of hugepages for the hstate already coming from live
update using hstate_liveupdate_pages(). Subtract that number from
h->max_huge_pages and pass that to the allocation functions. The
allocation functions currently directly use h->max_huge_pages, so update
them to take a parameter for number of pages to allocate instead.

Also update the error and status reporting function to deal with
liveupdated pages, report the right number, and handle errors.

Node-specific allocation is not supported with liveupdate currently.
This is because the liveupdate FLB data does not contain per-node
allocation numbers, so it is not possible to know how many live updated
pages each node has.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---
 mm/hugetlb.c | 79 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ff90ceacf62c..22af2e56772e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -39,6 +39,7 @@
 #include <linux/memory.h>
 #include <linux/mm_inline.h>
 #include <linux/padata.h>
+#include <linux/liveupdate.h>
 
 #include <asm/page.h>
 #include <asm/pgalloc.h>
@@ -64,6 +65,7 @@ struct hstate hstates[HUGE_MAX_HSTATE];
 __initdata nodemask_t hugetlb_bootmem_nodes;
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
 static unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE] __initdata;
+static unsigned long hstate_boot_nrliveupdated[HUGE_MAX_HSTATE] __initdata;
 
 /*
  * Due to ordering constraints across the init code for various
@@ -3484,13 +3486,19 @@ static void __init hugetlb_hstate_alloc_pages_onenode(struct hstate *h, int nid)
 	h->max_huge_pages_node[nid] = i;
 }
 
-static bool __init hugetlb_hstate_alloc_pages_specific_nodes(struct hstate *h)
+static bool __init hugetlb_hstate_alloc_pages_specific_nodes(struct hstate *h,
+							     unsigned long liveupdated)
 {
 	int i;
 	bool node_specific_alloc = false;
 
 	for_each_online_node(i) {
 		if (h->max_huge_pages_node[i] > 0) {
+			if (liveupdated) {
+				pr_warn("HugeTLB: node-specific allocation not supported with liveupdate. Defaulting to normal\n");
+				return false;
+			}
+
 			hugetlb_hstate_alloc_pages_onenode(h, i);
 			node_specific_alloc = true;
 		}
@@ -3499,15 +3507,25 @@ static bool __init hugetlb_hstate_alloc_pages_specific_nodes(struct hstate *h)
 	return node_specific_alloc;
 }
 
-static void __init hugetlb_hstate_alloc_pages_errcheck(unsigned long allocated, struct hstate *h)
+static void __init hugetlb_hstate_alloc_pages_errcheck(unsigned long allocated,
+						       unsigned long liveupdated,
+						       struct hstate *h)
 {
-	if (allocated < h->max_huge_pages) {
-		char buf[32];
+	char buf[32];
 
-		string_get_size(huge_page_size(h), 1, STRING_UNITS_2, buf, 32);
+	string_get_size(huge_page_size(h), 1, STRING_UNITS_2, buf, 32);
+
+	if (liveupdated > h->max_huge_pages) {
+		pr_warn("HugeTLB: got %lu of page size %s from liveupdate, requested pages are %lu\n",
+			liveupdated, buf, h->max_huge_pages);
+		h->max_huge_pages = liveupdated;
+	} else  if (liveupdated + allocated < h->max_huge_pages) {
 		pr_warn("HugeTLB: allocating %lu of page size %s failed.  Only allocated %lu hugepages.\n",
-			h->max_huge_pages, buf, allocated);
-		h->max_huge_pages = allocated;
+			h->max_huge_pages - liveupdated, buf, allocated);
+		if (liveupdated)
+			pr_warn("HugeTLB: %lu of page size %s are from liveupdate\n",
+				liveupdated, buf);
+		h->max_huge_pages = allocated + liveupdated;
 	}
 }
 
@@ -3542,11 +3560,12 @@ static void __init hugetlb_pages_alloc_boot_node(unsigned long start, unsigned l
 	prep_and_add_allocated_folios(h, &folio_list);
 }
 
-static unsigned long __init hugetlb_gigantic_pages_alloc_boot(struct hstate *h)
+static unsigned long __init hugetlb_gigantic_pages_alloc_boot(struct hstate *h,
+							      unsigned long nr)
 {
 	unsigned long i;
 
-	for (i = 0; i < h->max_huge_pages; ++i) {
+	for (i = 0; i < nr; ++i) {
 		if (!alloc_bootmem_huge_page(h, NUMA_NO_NODE))
 			break;
 		cond_resched();
@@ -3555,7 +3574,8 @@ static unsigned long __init hugetlb_gigantic_pages_alloc_boot(struct hstate *h)
 	return i;
 }
 
-static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
+static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h,
+						     unsigned long nr)
 {
 	struct padata_mt_job job = {
 		.fn_arg		= h,
@@ -3594,14 +3614,14 @@ static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
 
 	jiffies_start = jiffies;
 	do {
-		remaining = h->max_huge_pages - h->nr_huge_pages;
+		remaining = nr - h->nr_huge_pages;
 
 		job.start     = h->nr_huge_pages;
 		job.size      = remaining;
 		job.min_chunk = remaining / hugepage_allocation_threads;
 		padata_do_multithreaded(&job);
 
-		if (h->nr_huge_pages == h->max_huge_pages)
+		if (h->nr_huge_pages == nr)
 			break;
 
 		/*
@@ -3612,7 +3632,7 @@ static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
 			break;
 
 		/* Continue if progress was made in last iteration */
-	} while (remaining != (h->max_huge_pages - h->nr_huge_pages));
+	} while (remaining != (nr - h->nr_huge_pages));
 
 	jiffies_end = jiffies;
 
@@ -3636,7 +3656,7 @@ static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
  */
 static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 {
-	unsigned long allocated;
+	unsigned long allocated, liveupdated, nr_alloc;
 
 	/*
 	 * Skip gigantic hugepages allocation if early CMA
@@ -3648,20 +3668,31 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 		return;
 	}
 
-	if (!h->max_huge_pages)
+	/*
+	 * Some huge pages might come from live update. They will get added to
+	 * the hstate when liveupdate retrieves its files. To avoid
+	 * over-allocating, subtract the liveupdated pages from the total number
+	 * of pages to allocate.
+	 */
+	liveupdated = hstate_liveupdate_pages(h);
+	hstate_boot_nrliveupdated[hstate_index(h)] = liveupdated;
+	if (liveupdated >= h->max_huge_pages) {
+		hugetlb_hstate_alloc_pages_errcheck(0, liveupdated, h);
 		return;
+	}
+	nr_alloc = h->max_huge_pages - liveupdated;
 
 	/* do node specific alloc */
-	if (hugetlb_hstate_alloc_pages_specific_nodes(h))
+	if (hugetlb_hstate_alloc_pages_specific_nodes(h, liveupdated))
 		return;
 
 	/* below will do all node balanced alloc */
 	if (hstate_is_gigantic(h))
-		allocated = hugetlb_gigantic_pages_alloc_boot(h);
+		allocated = hugetlb_gigantic_pages_alloc_boot(h, nr_alloc);
 	else
-		allocated = hugetlb_pages_alloc_boot(h);
+		allocated = hugetlb_pages_alloc_boot(h, nr_alloc);
 
-	hugetlb_hstate_alloc_pages_errcheck(allocated, h);
+	hugetlb_hstate_alloc_pages_errcheck(allocated, liveupdated, h);
 }
 
 static void __init hugetlb_init_hstates(void)
@@ -3710,14 +3741,22 @@ static void __init report_hugepages(void)
 	unsigned long nrinvalid;
 
 	for_each_hstate(h) {
+		unsigned long liveupdated;
 		char buf[32];
 
 		nrinvalid = hstate_boot_nrinvalid[hstate_index(h)];
 		h->max_huge_pages -= nrinvalid;
 
 		string_get_size(huge_page_size(h), 1, STRING_UNITS_2, buf, 32);
-		pr_info("HugeTLB: registered %s page size, pre-allocated %ld pages\n",
+		pr_info("HugeTLB: registered %s page size, pre-allocated %ld pages",
 			buf, h->nr_huge_pages);
+
+		liveupdated = hstate_boot_nrliveupdated[hstate_index(h)];
+		if (liveupdated)
+			pr_info(KERN_CONT ", %ld pages from liveupdate\n", liveupdated);
+		else
+			pr_info(KERN_CONT "\n");
+
 		if (nrinvalid)
 			pr_info("HugeTLB: %s page size: %lu invalid page%s discarded\n",
 					buf, nrinvalid, str_plural(nrinvalid));
-- 
2.43.0

