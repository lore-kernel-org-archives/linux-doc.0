Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D31FFC46;
	Sat,  6 Dec 2025 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062213; cv=none; b=O2UlE4vY+l6Hx9Hvngt4x8galPL7TdsJOb7EdnD+F1Ub+ylvmotwXVWPWe3moBdrV17A6fFg8TMRYuliTUNlhh0Cs5zWnt/sHDpzWYlZ6LANxGs3fZ/z9QxeBuxjtvh7bw58Fa6gogEqcH650dgvH2O79FSHB+RZcW4wz7x9GO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062213; c=relaxed/simple;
	bh=Ox02xBcc//UKEAF8uiKCw4Rli2lYMNILbHVcsJbEz2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGny2cnLLk6IzuO9PugWLZeh2oG+tPrdiwpFpGPBoZrrD1g367NKTDA5DVBHu/ERek3DghuSJY+Cijr/iKzOUAoCsvTylwLN0hBHkWHZbeTtVElCl/dV8CMbLlT6fBuyrVsBUmhw/NM5J/Nf1SJOMfBmXjXVSNdm/mKDrOaUEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2hpO4bO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2hpO4bO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E9DC4CEF5;
	Sat,  6 Dec 2025 23:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062213;
	bh=Ox02xBcc//UKEAF8uiKCw4Rli2lYMNILbHVcsJbEz2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e2hpO4bO+wM9UQfsdrf2uqicJ0FhxW6Sm9mZD278uMA/3d+W7v++CxtfI+PDsnr3i
	 uuqVGuNh09q4miQgjKdGoJNcTK29NQuti8nBQgSG6/7qnipDYKeuMd6FkmQjKF8Zsz
	 rjpuKq43X6t5HMWMg7cDp/xDL8Y7Jy5WaFPxm2Oxc6WqBifJ3A1KiTNCMuqXYCcbVv
	 AOTDaP2dy8xNgBDLJhL2fubY1EdA3HJb/0Dr3FAMUcqAoVorb3NR7BPyZ8iBs6ftlt
	 P2Oc3bHYta6eCIoR+ClYxLrAOr5DayoOTb1odeFfyWG+c2YS/C+O0wJd1dVKE8ZaeW
	 +iJZejAXfvvTw==
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
Subject: [RFC PATCH 05/10] mm: hugetlb: export some functions to hugetlb-internal header
Date: Sun,  7 Dec 2025 00:02:15 +0100
Message-ID: <20251206230222.853493-6-pratyush@kernel.org>
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

A later commit will add support for live updating a memfd backed by
HugeTLB. It needs access to these internal functions to prepare the
folios and properly queue them to the hstate and the file. Move them out
to a separate hugetlb-internal header.

There does exist include/linux/hugetlb.h, but that contains higher level
routines. It also prefixes the function names to make it clear they
belong to hugetlb. These are low-level routines that do not need to be
exposed to the public API, and renaming them to prefix with hugetlb is
going to cause a lot of code churn. So create mm/hugetlb_internal.h that
contains these definitions.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---
 MAINTAINERS           |  1 +
 mm/hugetlb.c          | 33 +++++++++------------------------
 mm/hugetlb_internal.h | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 24 deletions(-)
 create mode 100644 mm/hugetlb_internal.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2722f98d0ed7..fc23a0381e19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11540,6 +11540,7 @@ F:	mm/hugetlb.c
 F:	mm/hugetlb_cgroup.c
 F:	mm/hugetlb_cma.c
 F:	mm/hugetlb_cma.h
+F:	mm/hugetlb_internal.h
 F:	mm/hugetlb_vmemmap.c
 F:	mm/hugetlb_vmemmap.h
 F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0455119716ec..0f818086bf4f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -55,6 +55,8 @@
 #include "hugetlb_cma.h"
 #include <linux/page-isolation.h>
 
+#include "hugetlb_internal.h"
+
 int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
 struct hstate hstates[HUGE_MAX_HSTATE];
@@ -733,9 +735,8 @@ static int allocate_file_region_entries(struct resv_map *resv,
  * fail; region_chg will always allocate at least 1 entry and a region_add for
  * 1 page will only require at most 1 entry.
  */
-static long region_add(struct resv_map *resv, long f, long t,
-		       long in_regions_needed, struct hstate *h,
-		       struct hugetlb_cgroup *h_cg)
+long region_add(struct resv_map *resv, long f, long t, long in_regions_needed,
+		struct hstate *h, struct hugetlb_cgroup *h_cg)
 {
 	long add = 0, actual_regions_needed = 0;
 
@@ -800,8 +801,7 @@ static long region_add(struct resv_map *resv, long f, long t,
  * zero.  -ENOMEM is returned if a new file_region structure or cache entry
  * is needed and can not be allocated.
  */
-static long region_chg(struct resv_map *resv, long f, long t,
-		       long *out_regions_needed)
+long region_chg(struct resv_map *resv, long f, long t, long *out_regions_needed)
 {
 	long chg = 0;
 
@@ -836,8 +836,7 @@ static long region_chg(struct resv_map *resv, long f, long t,
  * routine.  They are kept to make reading the calling code easier as
  * arguments will match the associated region_chg call.
  */
-static void region_abort(struct resv_map *resv, long f, long t,
-			 long regions_needed)
+void region_abort(struct resv_map *resv, long f, long t, long regions_needed)
 {
 	spin_lock(&resv->lock);
 	VM_BUG_ON(!resv->region_cache_count);
@@ -1162,19 +1161,6 @@ void resv_map_release(struct kref *ref)
 	kfree(resv_map);
 }
 
-static inline struct resv_map *inode_resv_map(struct inode *inode)
-{
-	/*
-	 * At inode evict time, i_mapping may not point to the original
-	 * address space within the inode.  This original address space
-	 * contains the pointer to the resv_map.  So, always use the
-	 * address space embedded within the inode.
-	 * The VERY common case is inode->mapping == &inode->i_data but,
-	 * this may not be true for device special inodes.
-	 */
-	return (struct resv_map *)(&inode->i_data)->i_private_data;
-}
-
 static struct resv_map *vma_resv_map(struct vm_area_struct *vma)
 {
 	VM_BUG_ON_VMA(!is_vm_hugetlb_page(vma), vma);
@@ -1887,14 +1873,14 @@ void free_huge_folio(struct folio *folio)
 /*
  * Must be called with the hugetlb lock held
  */
-static void account_new_hugetlb_folio(struct hstate *h, struct folio *folio)
+void account_new_hugetlb_folio(struct hstate *h, struct folio *folio)
 {
 	lockdep_assert_held(&hugetlb_lock);
 	h->nr_huge_pages++;
 	h->nr_huge_pages_node[folio_nid(folio)]++;
 }
 
-static void init_new_hugetlb_folio(struct folio *folio)
+void init_new_hugetlb_folio(struct folio *folio)
 {
 	__folio_set_hugetlb(folio);
 	INIT_LIST_HEAD(&folio->lru);
@@ -2006,8 +1992,7 @@ static struct folio *alloc_fresh_hugetlb_folio(struct hstate *h,
 	return folio;
 }
 
-static void prep_and_add_allocated_folios(struct hstate *h,
-					struct list_head *folio_list)
+void prep_and_add_allocated_folios(struct hstate *h, struct list_head *folio_list)
 {
 	unsigned long flags;
 	struct folio *folio, *tmp_f;
diff --git a/mm/hugetlb_internal.h b/mm/hugetlb_internal.h
new file mode 100644
index 000000000000..edfb4eb75828
--- /dev/null
+++ b/mm/hugetlb_internal.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2025 Pratyush Yadav <pratyush@kernel.org>
+ */
+#ifndef __HUGETLB_INTERNAL_H
+#define __HUGETLB_INTERNAL_H
+
+#include <linux/mm.h>
+#include <linux/hugetlb.h>
+#include <linux/hugetlb_cgroup.h>
+#include <linux/list.h>
+
+void init_new_hugetlb_folio(struct folio *folio);
+void account_new_hugetlb_folio(struct hstate *h, struct folio *folio);
+
+long region_chg(struct resv_map *resv, long f, long t, long *out_regions_needed);
+long region_add(struct resv_map *resv, long f, long t, long in_regions_needed,
+		struct hstate *h, struct hugetlb_cgroup *h_cg);
+void region_abort(struct resv_map *resv, long f, long t, long regions_needed);
+void prep_and_add_allocated_folios(struct hstate *h, struct list_head *folio_list);
+
+static inline struct resv_map *inode_resv_map(struct inode *inode)
+{
+	/*
+	 * At inode evict time, i_mapping may not point to the original
+	 * address space within the inode.  This original address space
+	 * contains the pointer to the resv_map.  So, always use the
+	 * address space embedded within the inode.
+	 * The VERY common case is inode->mapping == &inode->i_data but,
+	 * this may not be true for device special inodes.
+	 */
+	return (struct resv_map *)(&inode->i_data)->i_private_data;
+}
+
+#endif /* __HUGETLB_INTERNAL_H */
-- 
2.43.0

