Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4BD3ED13B
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541063; cv=none; b=ckTQjqRuxy2ub5q25qnP9bBSqndn6z/eHYJlHDTItWHzcacKz+0omIXoAgapCmdzi7ZmgP4wwQ2J1W7E+prHoMkizK01iTt592h/6UFGuXdlzK0meFU+2MrlrHRoUh6Z8AgxVRmxiuOZcBFVdTIz6RYreqIn6TAVkxvC6Ft8aWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541063; c=relaxed/simple;
	bh=QgI9M8JCvMkxfWw24tOIx4mGI9U98UyteMWum8iZNHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0mj9/IiTdnxGNIOKj3x8EppPXMXOmCsD4TAvQUOTpqrOMGfWPwOIAu+r5fLTS0SkXpSu6kFVe/KUu11T6CyfsygSGzgzTCwPPmkJzoNZVFi+NwP/9BSVCcbhB11V3VhKK9VIiGQ27alDTcR4tQz4L0QTMfkhvFMKYaOqf13YyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RlRsxxoH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RlRsxxoH"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed6d6eso4852345ad.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 23:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541060; x=1790145860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1EqIpH0CyAwdpMqjXcOe7F5BCJx4eubUzqhI5rvq2s=;
        b=RlRsxxoHMYYB4E0v6O/yoE7vr2B87JzmbdtVqkReLV3phahaQyccRhkLLjVttQ6dF9
         QgE6fwyASHHBR2XW+OHoQ6a3Z/Y8QQmVbsr/BxrcgVABCucMIoSbOpDtInU7Fxv/yTHo
         w1h5du32nsnyFLnWQTJmr9COUe8GMxSLcZkHE8vt9VheN+a21IY8QUA7XsXkA3XtP2t8
         gUXs3peKNpGuLqnfXs5k2dxsIRyVGQSJGEFBSCfuS5aOeGMWBQr2LP/mF6Vecx6WgXjX
         eeEvrW9DatCYOGyOkTrGXeQwntRdTKhor/NdyamMfBYcg3MplMiJAQPH8G3T/mEt3vP3
         GeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541060; x=1790145860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1EqIpH0CyAwdpMqjXcOe7F5BCJx4eubUzqhI5rvq2s=;
        b=iYT9U+1gSiYk1Jtp0j8/V6LN4p6br8y4Phggadj5DWoHH4jn8ykxYx9UqoGC157+Mu
         /Rc/ejOe+yHxhVIm5HO5B5ndPSYiA5kmHBk7l74wlrCU/3SuAxHES2+rnpDNIUWGGbhE
         k1Ol3GmFyV66yAOwt0VG2+5A2xkh2DDf7syYn2aHXowk6vtn/jm6dpO0jA4oTPtryLIm
         dXiUKMvD/IE9Xid+LrgdgMIP0hdPZoKI432LGJbfEZA9yQA329GrXngZu1AXDwuarx1R
         DmxWFNjdk3ny9TfyWtjWDGtA0ruAOK58Fg7Tq2S4YVPI/lFwH5ZQqvgK5vzYIwOypLIT
         o4YQ==
X-Forwarded-Encrypted: i=1; AKwUvByUAaejqtfHOS0jjAy1HGGlXog/Yu4LUkVndNkx4YdGgKdjeZjdIbSG1LhwZ8EO8Iyu90h5j1gLusU=@vger.kernel.org
X-Gm-Message-State: AFuF++lS+ftjrdtyAG6aLA2E680uyszxYOHkjRTiI491O7qIbER7cABe
	FUFmnPjp8U0pgMv2S0m/wh0tXIjUahoMExTjniDgwpL6ykLrGgAP0BI4QwIqWY9lQQc=
X-Gm-Gg: AYBFou0Brqc4c0EdKSh0iq2q1z44Mop/jWEKP6HpG6BNkwWj5JTxHqtQDmhDAkkxpZn
	SXDprOl8MXGWtjs893Oz5lgowdNi6dPpu0ZJ7CyFIKQoG8zqlkzIXEyhv6gjq1DVPWu4MPuEITB
	iQ6W+4Wru8zCPUNq1/F08hC/U38oXvw8kUH1VFczjks3OXl4zb+Tft060e6bnRnEdRZhUQfu+bm
	uZsxMzkxX8dzcsCMtsVAzM2xhL6b1RqubBmBcnLUCz5lIGefhmXjQeshfHN/0SjJ2hs0Vz4VjsV
	S0fHruH2WVvoUMfShFy8y30RPGF7IOrIOGu7tFVB/vBBSPhAfQBO5aq/Gu5GUKz2HUuPLHNk4Pm
	E3rmglv08Lv0UibtjjMxPbV5+7/bszv7Sl9hUwflS0Ddp7ja6dcbm88OVmklYSbWrY4Nkq+C9TD
	apbgnoMG3HwAut8jSKOfC4uDpsGC8L9NuMM2amshiW8YfIby+mwAtfYJn2XMAeShvwB8Pe8uJ7/
	EHiCJskezjt610jYVmm
X-Received: by 2002:a17:902:c401:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2dd8e76f78dmr28974185ad.22.1789541060351;
        Tue, 15 Sep 2026 23:44:20 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:19 -0700 (PDT)
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
Subject: [PATCH v4 06/11] mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Wed, 16 Sep 2026 14:43:36 +0800
Message-ID: <20260916064341.1825793-7-songmuchun@bytedance.com>
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

HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
Device DAX has not been switched to that mechanism yet.

Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
with HugeTLB by using the common per-zone shared tail vmemmap page.

The optimization is enabled only for DEV-DAX through pgmap->vmemmap_shift,
which supplies the compound page order recorded in section metadata before
vmemmap population. Unlike FS-DAX, DEV-DAX does not modify tail struct
pages, so sharing them is safe.

Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
initialize its entries with PG_reserved for device zones. Also skip
poisoning vmemmap-optimizable sections while their struct pages may be
shared.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Move device_zone() after the definition of NODE_DATA() to fix
  non-NUMA builds.
- Update the commit message to describe the compound page order stored
  in section metadata
- Collect Acked-by from Qi Zheng

v2:
- Explain why sharing tail vmemmap pages is safe for DEV-DAX
  (suggested by Qi Zheng)
---
 include/linux/mmzone.h | 10 +++++++++
 mm/memory_hotplug.c    |  6 ++++--
 mm/sparse-vmemmap.c    | 47 ++++++++++++++----------------------------
 3 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 97147c764658..ebbda6f31139 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2149,11 +2149,21 @@ static inline int online_device_section(const struct mem_section *section)
 
 	return section && ((section->section_mem_map & flags) == flags);
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
+}
 #else
 static inline int online_device_section(const struct mem_section *section)
 {
 	return 0;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return NULL;
+}
 #endif
 
 static inline int online_section_nr(unsigned long nr)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b428da66d279..d7a59167bec4 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -43,6 +43,7 @@
 #include "mm_init.h"
 #include "page_alloc.h"
 #include "shuffle.h"
+#include "sparse.h"
 
 enum {
 	MEMMAP_ON_MEMORY_DISABLE = 0,
@@ -554,8 +555,9 @@ void remove_pfn_range_from_zone(struct zone *zone,
 		/* Select all remaining pages up to the next section boundary */
 		cur_nr_pages =
 			min(end_pfn - pfn, SECTION_ALIGN_UP(pfn + 1) - pfn);
-		page_init_poison(pfn_to_page(pfn),
-				 sizeof(struct page) * cur_nr_pages);
+		if (!section_vmemmap_optimizable(__pfn_to_section(pfn)))
+			page_init_poison(pfn_to_page(pfn),
+					 sizeof(struct page) * cur_nr_pages);
 	}
 
 	/*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 02da1321197d..7b5b9ceec697 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -193,6 +193,8 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 		set_page_node(page, zone_to_nid(zone));
 		set_page_zone(page, zone_idx(zone));
 		prep_compound_tail(page, NULL, order);
+		if (zone_is_zone_device(zone))
+			__SetPageReserved(page);
 	}
 
 	page = virt_to_page(addr);
@@ -490,23 +492,6 @@ static bool __meminit reuse_compound_section(unsigned long start_pfn,
 	return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
 }
 
-static pte_t * __meminit compound_section_tail_page(unsigned long addr)
-{
-	pte_t *pte;
-
-	addr -= PAGE_SIZE;
-
-	/*
-	 * Assuming sections are populated sequentially, the previous section's
-	 * page data can be reused.
-	 */
-	pte = pte_offset_kernel(pmd_off_k(addr), addr);
-	if (!pte)
-		return NULL;
-
-	return pte;
-}
-
 static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 						     unsigned long start,
 						     unsigned long end, int node,
@@ -516,21 +501,18 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pte_t *pte;
 	int rc;
 	unsigned long flags = VMEMMAP_POPULATE_DAX;
+	struct page *page;
+	unsigned int order = pfn_to_section_compound_order(start_pfn);
 
-	if (reuse_compound_section(start_pfn, pgmap)) {
-		pte = compound_section_tail_page(start);
-		if (!pte)
-			return -ENOMEM;
+	page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!page)
+		return -ENOMEM;
 
-		/*
-		 * Reuse the page that was populated in the prior iteration
-		 * with just tail struct pages.
-		 */
+	if (reuse_compound_section(start_pfn, pgmap))
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)), flags);
-	}
+					      page_to_pfn(page), flags);
 
-	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
+	size = min(end - start, (1UL << order) * sizeof(struct page));
 	for (addr = start; addr < end; addr += size) {
 		unsigned long next, last = addr + size;
 
@@ -546,12 +528,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			return -ENOMEM;
 
 		/*
-		 * Reuse the previous page for the rest of tail pages
+		 * Reuse the shared page for the rest of tail pages
 		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
 		 */
 		next += PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    pte_pfn(ptep_get(pte)), flags);
+					    page_to_pfn(page), flags);
 		if (rc)
 			return -ENOMEM;
 	}
@@ -883,13 +865,14 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
 	if (IS_ERR(memmap))
 		return PTR_ERR(memmap);
 
+	ms = __nr_to_section(section_nr);
 	/*
 	 * Poison uninitialized struct pages in order to catch invalid flags
 	 * combinations.
 	 */
-	page_init_poison(memmap, sizeof(struct page) * nr_pages);
+	if (!section_vmemmap_optimizable(ms))
+		page_init_poison(memmap, sizeof(struct page) * nr_pages);
 
-	ms = __nr_to_section(section_nr);
 	__section_mark_present(ms, section_nr);
 
 	/* Align memmap to section boundary in the subsection case */
-- 
2.54.0

