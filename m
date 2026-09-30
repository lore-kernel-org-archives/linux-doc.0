Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C1502781
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777322; cv=none; b=eEEHMnfbdhlNaeOLszXE1DNE8VQ+uzBnL/KSP5JDUIIx4muLAvJbNtbNzDP1BopLvkgYomYmV5jIOmS4rPH6du0XY369RM3LxbEADibMeG+g04nfpUy0I9CUTl/QdlTVX4B2s7VKr4dDwzmJlp5Bm/3F2AlTI4Pz3J2o4ioMzp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777322; c=relaxed/simple;
	bh=Ylz1ZO7qeKqQZQ0n2m93icO29kQ4KyhfctRWKSRUn34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twLCD8PyGb1oKydjpKckSY9Qx1MIRlHBGGBH7nAB4II11J7q3Kq4yRp3OPYsHi/ve0jeNq7PNCmmPrtluVhrpmahgihTG2iFyZ23gLhXH4VLCT9mapbalfX2KhQYcgfXa6BXHhDF23SUYYWvY+JLwW8Z1mF47AHrqjhB8wAQ5Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SKB7QT5o; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SKB7QT5o"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so1943211a91.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 07:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777304; x=1791382104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hsh/ZoG8vVNv7jaAJJiYEU6YoSTVYkNqliPjJdqTXgY=;
        b=SKB7QT5ow72BnZFQeT9UIH9EQjDtmLZCcuJYYb8SkCz40DAuRY9VgUJpE6+P9w+twe
         ASrj1EI/8bLA2vNtRdnCiNVvCtjH+ZhHuAa7xRWht8zgfegRJMe4KbYx1XqV7oV8IGOH
         zrZzk4VZnp0VI5x9QVRT9URnTjvgRKWLZKqvieQcY7SCvNaKEYYCi5/uMl+/YzNqgSIP
         0A1+Oquy0FYQSOVh2r/ooyftgLlQ2VgThf/UCTz/GPExoX1YhFe/hUx3oB8BjOdeT3PG
         udpFv3kFJDFfD37amQSQ2GkH/pV8eO4R+lwLgPXAdJ/I0wgPH6Bhc+06QZNwBjs1Oj9q
         m88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777305; x=1791382105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hsh/ZoG8vVNv7jaAJJiYEU6YoSTVYkNqliPjJdqTXgY=;
        b=ePncrImROmMFVHckVAzDycyqRIYgRt1Qn+yoWIknw0FuHoYOXGDoZRr28duu404QBM
         tTYZbnuoREMhbr8QOO8kxnczjcMUNuwIkZgf+dJ+toX2bvDrKgVJr71gioFaY5n8bXDX
         IFqcjvLodKs5sfYG/zVeUJqf0U9APCH9qXWzcFdFRiFjWLmEO58G5TBfeiFGBoC/pPGJ
         3w2/6Br6UT9WzPbmVY0kqhY3ZSMfiK64szIXscV2oVsl4FG5aqsuaRc3x61afpUcvAOa
         Ehy0AiKeVVL2g9c22tlg3Ps7FH0Z95NfgPM8aiaTyMsIoRiovgSG6qXbPwAirMhu12ne
         P13g==
X-Forwarded-Encrypted: i=1; AKwUvBwbxthlp/22p4hhIKYaA4kfRbxMPrBWKZPMtoRVIoVcgRsU/BpYSu1l+l8faCqzBUE28vQ3wUa6MdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNvQyA6X6q3nStqSZq79EBlM+wJmA76RSyQzTpnCyYdggk34XL
	cYTykYPerFbzJUKX1Md9Uj2lVqGFPfkXfVNv1rP5N004jhVaHnhkzWOe4XzFlWol3sc=
X-Gm-Gg: AYBFou3ul115B19KwjDt6YwqbiTAbYaWdegUCH3xlp8sLh/FZTa9ncVrSG7fl6yoTxf
	Erz8t5FRMPn02rrRlDZ6Pxlupp6eao7cdNf+6B2Wl56F4iHF54ENjLNiDWPBkT7Z/Jwz1T43oXW
	KwlKaaodVuPUCok9o1Xtse9OWOo2vR31ZV2cUKF7EmpKF4pKSDnz2bx8jMiV2Uxmq3O48Jrw6QQ
	MuDRscPHX8w2dDhImQU88XdBJWWeJ5PKrOvHMdEnsYRRBRNhQ4iJ1IJ7aPdMDy6wIrvOlco6Sx+
	G3QHUveioInlmSuHnl/qq+qlW5jRz0hrRwbHy0dFCI/9FewGWT5P4vDyDaQY9k9W4/mQiOBhAol
	TJC70MVHYQA8A31Zu7icKrZ/EsrJjfiVZ2BYPtWEFMISykvaOkoOIIv5zW+20F9OwlJIwIcT6Ae
	jdv0z/adMppGe48FjxVNMCRt2G+u3IiOi+IScZpFZ3dOTlJzkxu0cvDXTcZBcPK9ZdNhVaBvfJX
	3HWZvUnc68qfw==
X-Received: by 2002:a17:90b:3ec7:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3a4d164f196mr919901a91.0.1790777304200;
        Wed, 30 Sep 2026 07:08:24 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.08.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:08:23 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 08/12] mm/sparse-vmemmap: move vmemmap optimization helpers to a public header
Date: Wed, 30 Sep 2026 22:06:23 +0800
Message-ID: <20260930140627.57431-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
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

Move the declarations and inline helpers to vmemmap-optimization.h.
This is a preparatory change for powerpc, which has its own vmemmap
optimization implementation and needs to use the common vmemmap
optimization interfaces from architecture code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand

v5:
- Move the VMEMMAP_OPTIMIZATION_* macros and MAX_FOLIO_VMEMMAP_ALIGN to
  vmemmap-optimization.h

v4:
- Use the renamed VMEMMAP_OPTIMIZATION config in the public header
- Collect Acked-by from Mike Rapoport

v3:
- Update the subject and commit message to describe common vmemmap
  optimization helpers
- Collect Acked-by from Qi Zheng

v2:
- Fix missing header dependencies.
---
 MAINTAINERS                          |   1 +
 arch/loongarch/include/asm/pgtable.h |   1 +
 arch/riscv/mm/init.c                 |   1 +
 include/linux/mmzone.h               |  17 -----
 include/linux/vmemmap-optimization.h | 109 +++++++++++++++++++++++++++
 mm/hugetlb.c                         |   2 +-
 mm/hugetlb_vmemmap.c                 |   2 +-
 mm/sparse.h                          |  78 +------------------
 8 files changed, 115 insertions(+), 96 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fe1d70ed5100..4689a0210060 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12097,6 +12097,7 @@ F:	Documentation/mm/hugetlbfs_reserv.rst
 F:	Documentation/mm/vmemmap_dedup.rst
 F:	fs/hugetlbfs/
 F:	include/linux/hugetlb.h
+F:	include/linux/vmemmap-optimization.h
 F:	include/trace/events/hugetlbfs.h
 F:	mm/hugetlb.c
 F:	mm/hugetlb_cgroup.c
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index cf29a4c8ac59..f87603135131 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -72,6 +72,7 @@
 
 #include <linux/mm_types.h>
 #include <linux/mmzone.h>
+#include <linux/vmemmap-optimization.h>
 #include <asm/fixmap.h>
 #include <asm/sparsemem.h>
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb37b0b67efe..857f9a55039c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -22,6 +22,7 @@
 #include <linux/hugetlb.h>
 #include <linux/kfence.h>
 #include <linux/execmem.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/alternative.h>
 #include <asm/fixmap.h>
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index cd68c1904c91..65de3bb13eb3 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -96,23 +96,6 @@
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
 
-/*
- * HugeTLB Vmemmap Optimization (HVO) requires struct pages of the head page to
- * be naturally aligned with regard to the folio size.
- *
- * HVO which is only active if the size of struct page is a power of 2.
- */
-#define MAX_FOLIO_VMEMMAP_ALIGN					\
-	(IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION) &&		\
-	 is_power_of_2(sizeof(struct page)) ?			\
-	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
-
-/* The number of retained vmemmap pages with HVO enabled. */
-#define VMEMMAP_OPTIMIZATION_PAGES		1
-#define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	\
-	(VMEMMAP_OPTIMIZATION_PAGES * PAGE_SIZE / sizeof(struct page))
-#define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
-
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
new file mode 100644
index 000000000000..bd0974b262a4
--- /dev/null
+++ b/include/linux/vmemmap-optimization.h
@@ -0,0 +1,109 @@
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
+/*
+ * HugeTLB Vmemmap Optimization (HVO) requires struct pages of the head page to
+ * be naturally aligned with regard to the folio size.
+ *
+ * HVO which is only active if the size of struct page is a power of 2.
+ */
+#define MAX_FOLIO_VMEMMAP_ALIGN					\
+	(IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION) &&		\
+	 is_power_of_2(sizeof(struct page)) ?			\
+	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
+
+/* The number of retained vmemmap pages with HVO enabled. */
+#define VMEMMAP_OPTIMIZATION_PAGES		1
+#define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	\
+	(VMEMMAP_OPTIMIZATION_PAGES * PAGE_SIZE / sizeof(struct page))
+#define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
+
+#ifdef CONFIG_VMEMMAP_OPTIMIZATION
+static inline unsigned int section_compound_order(const struct mem_section *section)
+{
+	return section->compound_page_order;
+}
+
+static inline void section_set_compound_order(struct mem_section *section,
+					      unsigned int order)
+{
+	VM_WARN_ON(section_compound_order(section) && order &&
+		   section_compound_order(section) != order);
+	section->compound_page_order = order;
+}
+
+static inline void section_set_compound_order_range(unsigned long pfn,
+		unsigned long nr_pages, unsigned int order)
+{
+	unsigned long section_nr = pfn_to_section_nr(pfn);
+
+	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
+		return;
+
+	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
+		section_set_compound_order(__nr_to_section(section_nr + i), order);
+}
+
+static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
+{
+	return section_compound_order(__pfn_to_section(pfn));
+}
+
+struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
+#else
+static inline unsigned int section_compound_order(const struct mem_section *section)
+{
+	return 0;
+}
+
+static inline void section_set_compound_order(struct mem_section *section,
+					      unsigned int order)
+{
+}
+
+static inline void section_set_compound_order_range(unsigned long pfn,
+		unsigned long nr_pages, unsigned int order)
+{
+}
+
+static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
+{
+	return 0;
+}
+#endif /* CONFIG_VMEMMAP_OPTIMIZATION */
+
+static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
+{
+	const unsigned int order = pfn_to_section_compound_order(pfn);
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
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+#endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index fd00141b089a..2003439ea13c 100644
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
index 76765c97ff68..0057fa2a16a8 100644
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
 
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
diff --git a/mm/sparse.h b/mm/sparse.h
index 326ad43bb5c3..a5111087ee3a 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -9,80 +9,7 @@
 #define __MM_SPARSE_H
 
 #include <linux/mmzone.h>
-
-#ifdef CONFIG_VMEMMAP_OPTIMIZATION
-static inline unsigned int section_compound_order(const struct mem_section *section)
-{
-	return section->compound_page_order;
-}
-
-static inline void section_set_compound_order(struct mem_section *section,
-					      unsigned int order)
-{
-	VM_WARN_ON(section_compound_order(section) && order &&
-		   section_compound_order(section) != order);
-	section->compound_page_order = order;
-}
-
-static inline void section_set_compound_order_range(unsigned long pfn,
-		unsigned long nr_pages, unsigned int order)
-{
-	unsigned long section_nr = pfn_to_section_nr(pfn);
-
-	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
-		return;
-
-	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
-		section_set_compound_order(__nr_to_section(section_nr + i), order);
-}
-
-static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
-{
-	return section_compound_order(__pfn_to_section(pfn));
-}
-#else
-static inline unsigned int section_compound_order(const struct mem_section *section)
-{
-	return 0;
-}
-
-static inline void section_set_compound_order(struct mem_section *section,
-					      unsigned int order)
-{
-}
-
-static inline void section_set_compound_order_range(unsigned long pfn,
-		unsigned long nr_pages, unsigned int order)
-{
-}
-
-static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
-{
-	return 0;
-}
-#endif
-
-static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
-{
-	const unsigned int order = pfn_to_section_compound_order(pfn);
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
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
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
@@ -142,9 +69,6 @@ static inline void sparse_sections_init(void) {}
  * mm/sparse-vmemmap.c
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-#ifdef CONFIG_VMEMMAP_OPTIMIZATION
-struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
-#endif
 void sparse_init_subsection_map(void);
 int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-- 
2.54.0

