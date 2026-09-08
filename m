Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB030BB8D
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 03:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836673; cv=none; b=s5SgZkbqCzgUrT8gMccALdGmMAGZn4t8lbL6YgU7IojjQKX5uGazq8NeJk5gCM0zKt5DAI/MdJrTZ9ZcBfMcOtgTFicgGllNtuj9R59HG4m2DBA8zSSIlxWe5zfHIFd//Qz/+vYIHnpLMme6WuqTs7hcvkFacMO88GbIqLj0Xnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836673; c=relaxed/simple;
	bh=dRLbFzgpgZgCYflbXCNRkhPaT+5HR8dXEGt9Utc4VhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1VF9SwaFYjwGpqdmym2nG5p/yVjatNHozc2EbWceq6WAIbneU/bmmiQu+3PJJF/8pjcFU9XP4H512yj9TKhpeGz8yI4+kkwHuZyYZbkX15jR4cqmiytMjv5k4DEgznixvWIaMhrmFyHKmcQSlXZjKaql+I5zzhLpkShVrhxNwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TE//ASuY; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TE//ASuY"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so3044411a12.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 20:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836671; x=1789441471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVT6j1P3zfNYXYnEjgM8kLQiWtuO+wz13pOr0ZtKdew=;
        b=TE//ASuYL2Y3Dff+qgLg9hcSpCfO9snNmNKd4D0FGpyNSGxSUKE8nc1/OGnt7/RRE8
         FQpPa7BHQ6ZrJrmc0ArW+eEb/jizJ0EM6LG7/461IzCcKhUIaOsahhdnqld/ZT9N44qS
         f7N9b8ZqZrgjq/8o+UENxXyJpMnnF3ULpU5qtHHIthZsnYH0Si3Fkf36bCgX8BbA6huX
         CEg8kvUoLWOVjUdmJknGu7BNQDGSoRbtFQ/1ZCFO8owG4czBhKBX1y76fyhdMkZR3j4o
         b1xt9KqPCYDJbKtG+2yO8Fa11jDI1YVSdsF7IxDrISNx86rFVATHMiYYEYzRmEOox6/J
         UNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836671; x=1789441471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVT6j1P3zfNYXYnEjgM8kLQiWtuO+wz13pOr0ZtKdew=;
        b=EdL+BLAQTfn8b/5rwZCcvSgHF4H8uGpwNIbWuzIg+rO4xpdW38E7jDQvVO4dCsAOTi
         xPMy+6ptZBNMA335+x8fVXAmaRZWWstJ/tO2LfVR9O17yO22NYkyHNoGGVk9+N+jaR4D
         d4ohyGx+/DwdQebJyZHZYcJvqYZstwXPmZX2Cg3ykXVNAd/gGbHAnclY/KF1upUilXbU
         8wFsAI5p+glhsdNd1jXd0VSlufscYtS5wiE8vZ3NUjF32tiBVAn/Mg49n0xlIlNNdG9+
         gpPOOWlnOwYMwZ30GxBfljT5NHOCMCH0f99rrws9XCSP+ME+b+//bQ29nuzVEksZNORk
         jcsQ==
X-Forwarded-Encrypted: i=1; AKwUvByR6IZCJpuUHZWZdWuH3JGk27Xw3hrOcAoKDbdJZ3t4QLof8i0LzHpTEIl9JTHnsHlFl7JOj3hnCo0=@vger.kernel.org
X-Gm-Message-State: AFuF++k2KmneNOyYO50NQYosGo5FeFHfi2s0fwUcU6CLu3BfOjrgzVJk
	7wdFvdo/bBxcDrY6GNaFgi6bxohj1xYs1n7EMeOmTK8cq2KbKpUwdAUJq6hLTfftYMs=
X-Gm-Gg: AYBFou0nflzPAwZf/mmlTrgQYr0uZ7Rl6dopCEwyThd0UxvCPI2840661EXty2dMrXA
	xULiwL+XEla64T/hZIAkbWePEEReSBNAXPuhXzrhSe5CymqbvxLpkR4tyQ3ckiaJSCSOS8qudYx
	ttvJVIVtSsR7jCN2Gc2xTh+12TdJUUbxATGkkK5cxQwAdHGz8bpvzcwIMJjGvm7tCyYu65yjUAx
	fkifPP6gq0Va4IygJuBbYFtOI6a/XsfJ4vVp+0hDwm76csYQpJWVjjIJaUnvJ/88ooZbE8TXfal
	cCq6h5xYncqeJQrHjNQgREA8T4UsmMPs7MfcXRTOthR2iFiLkCI81YpKaIzgvPgyhrRa06iwf7T
	kTDWYGkkX8hf3HQBD5dU8nk4LvGteFu3QdBHNQ1rSKNDjy3LPrpdcPtP8o825b5oIjyBVw9XZ4H
	COiLj+jjOotsc1oncPaJkEXuYWxFxT4cHaOQAsb7KrwJk2W+1wRMEX7kD1IF6DW1Uy8fieiwsCk
	AWkpdCeUpDQTvpLPFEqCUG8
X-Received: by 2002:a05:6a00:8c3:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86168e8bb34mr33801118b3a.2.1788836670753;
        Mon, 07 Sep 2026 20:04:30 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:30 -0700 (PDT)
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
Subject: [PATCH v2 07/11] mm/sparse-vmemmap: move HVO helpers to a public header
Date: Tue,  8 Sep 2026 11:03:31 +0800
Message-ID: <20260908030335.96549-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vmemmap optimization helpers currently live in mm/sparse.h,
which is an internal MM header. That works for MM code, but
prevents powerpc from using the same interfaces without including a
private header.

Move the declarations and inline helpers to
include/linux/vmemmap-optimization.h. This is a preparatory change for
powerpc, which has its own vmemmap optimization implementation and
needs to use the HVO interfaces from architecture code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Fix missing header dependencies.
---
 MAINTAINERS                          |  1 +
 include/linux/vmemmap-optimization.h | 91 ++++++++++++++++++++++++++++
 mm/hugetlb.c                         |  2 +-
 mm/hugetlb_vmemmap.c                 |  2 +-
 mm/memory_hotplug.c                  |  1 +
 mm/sparse.h                          | 73 +---------------------
 6 files changed, 96 insertions(+), 74 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c7aaa2e4790e..2985286cbbbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12096,6 +12096,7 @@ F:	Documentation/mm/hugetlbfs_reserv.rst
 F:	Documentation/mm/vmemmap_dedup.rst
 F:	fs/hugetlbfs/
 F:	include/linux/hugetlb.h
+F:	include/linux/vmemmap-optimization.h
 F:	include/trace/events/hugetlbfs.h
 F:	mm/hugetlb.c
 F:	mm/hugetlb_cgroup.c
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
new file mode 100644
index 000000000000..492dc662aae7
--- /dev/null
+++ b/include/linux/vmemmap-optimization.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * vmemmap-optimization.h
+ *
+ * Generic vmemmap optimization declarations.
+ *
+ * Author: Muchun Song <songmuchun@bytedance.com>
+ */
+#ifndef _LINUX_VMEMMAP_OPTIMIZATION_H
+#define _LINUX_VMEMMAP_OPTIMIZATION_H
+
+#include <linux/align.h>
+#include <linux/log2.h>
+#include <linux/mmdebug.h>
+#include <linux/mmzone.h>
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
+static inline unsigned int section_order(const struct mem_section *section)
+{
+	return section->order;
+}
+
+static inline void section_set_order(struct mem_section *section, unsigned int order)
+{
+	VM_WARN_ON(section_order(section) && order && section_order(section) != order);
+	section->order = order;
+}
+
+static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
+					   unsigned int order)
+{
+	unsigned long section_nr = pfn_to_section_nr(pfn);
+
+	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
+		return;
+
+	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
+		section_set_order(__nr_to_section(section_nr + i), order);
+}
+
+static inline unsigned int pfn_to_section_order(unsigned long pfn)
+{
+	return section_order(__pfn_to_section(pfn));
+}
+#else
+static inline unsigned int section_order(const struct mem_section *section)
+{
+	return 0;
+}
+
+static inline void section_set_order(struct mem_section *section, unsigned int order)
+{
+}
+
+static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
+					   unsigned int order)
+{
+}
+
+static inline unsigned int pfn_to_section_order(unsigned long pfn)
+{
+	return 0;
+}
+#endif /* CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION */
+
+static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
+{
+	const unsigned int order = pfn_to_section_order(pfn);
+	const unsigned long nr_pages = 1UL << order;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+}
+
+static inline bool vmemmap_optimizable_order(unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
+#endif /* CONFIG_SPARSEMEM_VMEMMAP */
+#endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index fda525bccf50..dff915e6c48b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -38,6 +38,7 @@
 #include <linux/mm_inline.h>
 #include <linux/padata.h>
 #include <linux/pgalloc.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/page.h>
 #include <asm/tlb.h>
@@ -52,7 +53,6 @@
 #include "hugetlb_cma.h"
 #include "hugetlb_internal.h"
 #include "mm_init.h"
-#include "sparse.h"
 #include <linux/page-isolation.h>
 
 #define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4a57e6c3352c..25c4e7d2664c 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -15,10 +15,10 @@
 #include <linux/mmdebug.h>
 #include <linux/pagewalk.h>
 #include <linux/pgalloc.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
-#include "sparse.h"
 #include "internal.h"
 
 /**
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 0db0379826df..d7a59167bec4 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -43,6 +43,7 @@
 #include "mm_init.h"
 #include "page_alloc.h"
 #include "shuffle.h"
+#include "sparse.h"
 
 enum {
 	MEMMAP_ON_MEMORY_DISABLE = 0,
diff --git a/mm/sparse.h b/mm/sparse.h
index 59b825df83b9..e511d99fc26b 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -9,77 +9,7 @@
 #define __MM_SPARSE_H
 
 #include <linux/mmzone.h>
-
-#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
-static inline unsigned int section_order(const struct mem_section *section)
-{
-	return section->order;
-}
-
-static inline void section_set_order(struct mem_section *section, unsigned int order)
-{
-	VM_WARN_ON(section_order(section) && order && section_order(section) != order);
-	section->order = order;
-}
-
-static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
-					   unsigned int order)
-{
-	unsigned long section_nr = pfn_to_section_nr(pfn);
-
-	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
-		return;
-
-	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
-		section_set_order(__nr_to_section(section_nr + i), order);
-}
-
-static inline unsigned int pfn_to_section_order(unsigned long pfn)
-{
-	return section_order(__pfn_to_section(pfn));
-}
-#else
-static inline unsigned int section_order(const struct mem_section *section)
-{
-	return 0;
-}
-
-static inline void section_set_order(struct mem_section *section, unsigned int order)
-{
-}
-
-static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
-					   unsigned int order)
-{
-}
-
-static inline unsigned int pfn_to_section_order(unsigned long pfn)
-{
-	return 0;
-}
-#endif
-
-static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
-{
-	const unsigned int order = pfn_to_section_order(pfn);
-	const unsigned long nr_pages = 1UL << order;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
-}
-
-static inline bool vmemmap_optimizable_order(unsigned int order)
-{
-	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
-}
+#include <linux/vmemmap-optimization.h>
 
 /*
  * mm/sparse.c
@@ -139,7 +69,6 @@ static inline void sparse_sections_init(void) {}
  * mm/sparse-vmemmap.c
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
 void sparse_init_subsection_map(void);
 int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-- 
2.54.0

