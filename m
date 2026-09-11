Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCB3C4B79
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103043; cv=none; b=SttcsG5vBhi/GlHmckyEwpaAeCXslXO41g/3DOVAOIHWgiaFY/Ds3h9j23lDvku+4a4GUN9fOjV376t0fb2sn/gWhoX4E249A1qm5cK+NL0h5umPyG8cfMHFZijn843cZtZXDVI0N4TQ5PCvZvGGuTiDzCarrWJVYbhrQnL2wiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103043; c=relaxed/simple;
	bh=MxAOev2p2NgmPSdtM2IAWo2HVf04Xw3aSZERHz9cFF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3ANFmMh/CaGw4H5/C9AI+3q76SL86oxheDVQ4CZD1fnC2w32YeOmij+kCsgcE70jHuYoqZxX6jGDM8vv3umALF5ERXwYINFLYFGuOHIC1KTznIiXTygJv+Ag5tEEQvfQ+W8vqmA2N64ugktO4kEfqj28DGAd0kd5BMWigclsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kZRkvwL7; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kZRkvwL7"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so4495935ad.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103041; x=1789707841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h5irsdiFbTSRTtgQf8+DpZjFaqFHIv3CtCmLZFKqxE=;
        b=kZRkvwL7aI/ZD8UrHtWmTILqO6SchcRnAQ3jlbTPfHRK0DrzcqToBswt71+7GGWY32
         tQMrYXHmqs3p8g6daooCodxgGr1PNnD5rCpqS42iwMGph4QIC0DkUqUC7Xyh1rvAH7Ko
         ucVFHx55Q2e2jN7fLLWmZ+lIlQb9Z9qLi1kSW92ZGVv1gM6P98+lW3S9TQ6b8094IAj+
         BuVXeJPHuRUg53ciebcrxmenMLPV+KbRxdcgDBmbAMKlfuhkV8Qwdd2lUOHzGRd5PEjL
         4iSrMhTB7/X45RzD2BmVMOX3d2uvHvPzJBwRBaLkyQWPNe59ntL10zBag1+UFbTbFLkD
         iNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103041; x=1789707841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h5irsdiFbTSRTtgQf8+DpZjFaqFHIv3CtCmLZFKqxE=;
        b=lzy+0CTObstkK9Sd7EX/TCO6hR//qDmlu88YdZQk1rWGquFP2jJQRhNTx3NOcny3+c
         EOhVCPQ4oXTRuQc/xv76uQKOs1Kzn0dYktmt1JNuh+dRJY2U4k7ofYFHZWGfbHGnP7f6
         YMbRWJAgCBvEalmHywvnhJ3PTDoMXKCWjLLw6N0Ov1jhHe+X+3LmVzmKM1r4o0Sq52oO
         JrCKPtpSCjcXsGNwFswbT0ZM9Fi1VH47PIAGm10IttD8f4wzfwsp8SySlsLfb8WX1MGh
         bSUqCXByPNbmS1Qms1oPVvvPBhplaxZxHHDSkHvEy/UW7o8gGplL2WRx1z4qMvhllZVc
         6PvQ==
X-Forwarded-Encrypted: i=1; AKwUvByde2/VxsM7p1LAeiLvoOq+31cBUmrYIbYMuUCpxGBjNMe6aftSSs9hqCPJRUkuz4t8AvhwXrJ5nxo=@vger.kernel.org
X-Gm-Message-State: AFuF++kJmcPoyE+U05/lGFiMT7X70jjaFb/tD025RMbjgxJ6AeLlY/6A
	HYz5e+6qDxk6MH/yvVhHipHZa6f0PQvDp3/5w/PQrmzQUhb3fUddeLo5hhC5JB+PiNM=
X-Gm-Gg: AYBFou2CgmJffY0YW3mdIatBZp2PO2E8/hsj4h4Q5eX8GV1nJmoIlJYjKbKfLqGXPzP
	Me+VDC6eHLfGtsyp5VJ+o/9J23dSWpDwO5mZKCxhOJLySdzU2bLUZnmoyWyCJh7thl0lrnh8f6i
	oiWmGx2poWMFrRjXhwHvi8EV0UQXO7INlpQ998IcJvVxdjC+BsUnhfyeHWQbQoVXNpA0T0VgM2S
	QdA6eL+wiVEx1rEWKWRalvnuoYydeGUWBbvsqNSjd0ehLtIoEKzRIgt/LqCqiXDzWf0AOYNxvcd
	xBMIpNQggMNocEurgC6oElW6R0LgR7Nmn2TWBHQAJfdtyJNA2s0Kyu39tw24kSJCNp47PZpowmM
	WIUiXDbFgtPBaVPUHvrUY7IXZbO5ucowAFg0RFMPSZnUbnhUqervMrBQ3j4rguHLzu7fdKnQDw6
	nF18kWbETv6WPnk/JrRj0DWvsSyBB9QCFv5XGeLfaLm2k8zlZdV1MxFuG/wzBvJZzb8bWf9+IlE
	Nh7LE/2hJMN0hQ1qo2PtxlD2AwsQA/1xlbX9xIGOFanxIQ=
X-Received: by 2002:a17:90b:1648:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39d9bec50b9mr3746365a91.10.1789103041109;
        Thu, 10 Sep 2026 22:04:01 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:04:00 -0700 (PDT)
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
Subject: [PATCH v3 07/11] mm/sparse-vmemmap: move vmemmap optimization helpers to a public header
Date: Fri, 11 Sep 2026 13:02:24 +0800
Message-ID: <20260911050228.58884-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
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
powerpc, which has its own vmemmap optimization implementation and needs
to use the common vmemmap optimization interfaces from architecture code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Update the subject and commit message to describe common vmemmap
  optimization helpers
- Collect Acked-by from Qi Zheng

v2:
- Fix missing header dependencies.
---
 MAINTAINERS                          |  1 +
 include/linux/vmemmap-optimization.h | 94 ++++++++++++++++++++++++++++
 mm/hugetlb.c                         |  2 +-
 mm/hugetlb_vmemmap.c                 |  2 +-
 mm/sparse.h                          | 76 +---------------------
 5 files changed, 98 insertions(+), 77 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ef018673b5e..e4412c3d8d45 100644
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
index 000000000000..2327929467f3
--- /dev/null
+++ b/include/linux/vmemmap-optimization.h
@@ -0,0 +1,94 @@
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
+#endif /* CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION */
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
index 0d101ef934fc..7af55e1544e9 100644
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
index 5ddf06b83c96..a27f46fffb54 100644
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
diff --git a/mm/sparse.h b/mm/sparse.h
index a250bea4088e..a5111087ee3a 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -9,80 +9,7 @@
 #define __MM_SPARSE_H
 
 #include <linux/mmzone.h>
-
-#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
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
@@ -142,7 +69,6 @@ static inline void sparse_sections_init(void) {}
  * mm/sparse-vmemmap.c
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
 void sparse_init_subsection_map(void);
 int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-- 
2.54.0

