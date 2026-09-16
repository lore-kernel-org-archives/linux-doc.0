Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4F33EB7E5
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541067; cv=none; b=JoSxDTJe3YQAiJwBi3/XDlClpGtmGO2GxTOxMoSUKj1MBiv/WToJYbCiPHIXMC4LqUI79Nt0h0aRsTdEreP/ATdz/LEHWTcNAT6vJoIoF3YQwNTV/LH6h0w0y4YAEz+pCtkKKsMecL4JAh0EzRzG1pnwYhvTI+XiPcXfCBzf6e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541067; c=relaxed/simple;
	bh=41ZOaSS795Zy+Ullt5d+75xCPMwdSbCwgTHk1Zi0gZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MC9hNSqK6NuU3g4V6no0Doa2yusCtPLCRxLUAodVrSM6HXFHV+QnQ+FhaVE/1O2P3EFJOTOl1PRg732pxkvLcPKqW4hGPWTGw9OriCpONRQ8dQjx/8yC8y4Kq1wMrm46H3LnRGFP833psGsmW1ZPM0M9FQxYBXo3v3vDZvxxEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MxLsaHmi; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MxLsaHmi"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so3848405ad.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 23:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541065; x=1790145865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nO/SIiOPBpUCTQXEHAeYL+mDwPc1g15QDptSjej1KB0=;
        b=MxLsaHmiL5KVxCL53JtvdKNRjY/t6kfHMpxYQk55we1Nv0AI1XOVBfcpDTPq0OvFco
         kELkAciPwKJr7wkY9WWxk/zy8pHahVHD00l+xONGFN0U/egYiL6P1Eo0Bn6heioGAvTN
         75nZsnAIqeNIY0rZYn41RguriNaqeYS0d2sYZzfmY+S2mEOz6sXe4K/oNO90eNSSUIqp
         1Q8d3cVSrynAI4xfaXLSfPOGVhtyNd3ozKhCE1V/OL9AMl6yxl5YTEOwuVY12R/P1j4L
         //F7erOyWMdhiKCK8N7d22EtBUWoV4MU0CXrFacNssS6F5n5hwrJTG0zy9ZuVNHlU+fY
         Jmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541065; x=1790145865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nO/SIiOPBpUCTQXEHAeYL+mDwPc1g15QDptSjej1KB0=;
        b=TttjqZMu4l1lAr2AaZ7AnL3KuFNpsefoDk4HECWSUycdQxYngL94r5edKopB3+UTpu
         GOjSsCHL6aeSSwbB+XRFfUqg33CFs+IZPugkwSx/8iT0bSHaW2TpQp2jX5XmuDfacRrV
         lG9SDyrOIXT6Afv2MBctcqIfr1b2aexyvN3dttzfKna8iPbKwzZ0HVgolAy9/xsD5Dgh
         m3Zt2GjZuiSmnN2LMpWml+ntF0+WgBADys/h1zc8ASvo6g30ZyvE8Xzy5cfgxnkH10Di
         MwY4YpNgaA+020jH/wYNE1khz9pu5DFrnO4S/gtZtC01Lc85996xuLxT3Doxsf0x/UvU
         NqUw==
X-Forwarded-Encrypted: i=1; AKwUvBwsnIk9ryIlD/unQ6hGBrZSZVLpph7fQpUm2G36uc1i1MXzdc3sKEhIXeIU9P50hZ+YhpavJuqdTH0=@vger.kernel.org
X-Gm-Message-State: AFuF++nLJ9ZRkijV0bIveutmvC91iv2MRBVzLRLWtpE9+GHXspVHcHWg
	OFyOTv2KL4hqwgwB2kc3sxeNDwtUsKdwWjcV5WOGupa6pZIqk6n5Gr+VA1ss1XtlpJw=
X-Gm-Gg: AYBFou0PZeQZYUuwjIQ+TQGGL9ChoQPcaROoGgr32E2DPLZmcWqg7gRzlp00q84e2qZ
	1XqF+95WEWQGiUrUe6HzZKv93fo539fcCvHJXXgveJpjnC74XyufIruhvO0Wtp80snVhNgHpT/U
	L+rCz+aZMXdjyl+Nr3H9D3QGvzVz7MkQM6zaxBHzbTdPwZVT25QDy3gVh8OXVr8jeQ5hLSg8qwP
	Q/nGq+KNGHao74h+YZZxUZWHhm4JEDTbiVoq+np3xibnFQaCA03qxzYojutaJHgTdkawLrRrCDR
	Yls29Wr9UY0EnQCxtInd2XsoVRNGS7LxzAwXuuEzfPssBSLgp+EqkavtOmctjYKB84mzaTs1kt3
	IMYq4hZCqqlKNIKt3tuKZUq7aGP58yqmPbqaWMZXcf6gcrC3o+Ii6HYfWoHQhIdUov5CowtxOc/
	7haeBO4wv2Emu1AyG1bjcwkYXm8uP7O89Hsm7AdSfDQdzkLOjboTf3vFaicCBbleNuEaz4nzyh1
	lutXiYSnGae7+jsM+8=
X-Received: by 2002:a17:902:ce92:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2dd8e52ed65mr27165495ad.19.1789541064774;
        Tue, 15 Sep 2026 23:44:24 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:24 -0700 (PDT)
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
Subject: [PATCH v4 07/11] mm/sparse-vmemmap: move vmemmap optimization helpers to a public header
Date: Wed, 16 Sep 2026 14:43:37 +0800
Message-ID: <20260916064341.1825793-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-1-songmuchun@bytedance.com>
References: <20260916064341.1825793-1-songmuchun@bytedance.com>
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
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
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
index 000000000000..0f9da22bd8d0
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
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
+#endif /* CONFIG_SPARSEMEM_VMEMMAP */
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
index 8f6ef0b50b4f..a5111087ee3a 100644
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

