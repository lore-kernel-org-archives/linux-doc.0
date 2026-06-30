Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC8223328
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 01:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781729; cv=none; b=CZpoyCCXCw90nfhMOA0yy6jU3Cm9XHsjRqvgj9j864G55bsNMfZGZz33XTrtYdTTg0m2AFjZNAOaMwtG+ayk3M4+IgBFI5Yq22Xis8aqG80YDWaRetSWydMxoTgOCTRfbd5IxMEPfHo7fpG7txcCboJoeoNweu7iT7CTd/yHJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781729; c=relaxed/simple;
	bh=lEoc6fmBIVcyCGMOTJnDQjj7lHqRFs6S3s68NobX/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9s5vXonLTqAPd8H7IaNBZcG1ev0TglFF9S5wwQ/Uvzx8ZKRPMoF+o0foQQmL6wFVfz2KQD45u2vwLPXSL149L61x4MkbCQ8qNB+0ItQpUnviqLx8NruGUeIrFQNuW4sg8hEDC+x/shNwuJbIo9KErTKcphIAqTuh4LkS3+KKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsA0nNMS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsA0nNMS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-845f2909cd4so1088767b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782781728; x=1783386528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wsC4ibU+bFhqJ2SO7dxDXLRm5lYVtP1esDuPTrSveg=;
        b=HsA0nNMSTvUxl84k0LoG8tzAU+lp+VifZ+mFXJhbpANafrGjpj9XmVZ+tFk3p9zeLF
         g18gWDKCpY9nxLH4ACkJexZpPIkFso22lm7Vx7inoR2zLU2BLOXhUmRukD+wwShayuFx
         5fzy7QklWpsflJ10kOTkxo0Zh1A+4AYd6DQxhqYLeMrWV6Zao02Oa5NTuCfS9XYHU9Z3
         gCnIdYqVL+pCpsCvMItpNSDKl7Tlt1atvHn+sAn1FSl90eiIRq13BawO7AeIicDbzaXn
         kmyJ7U1A+w1Ip52X5zJ1Otzd7mRxkeRP20ssbjGs6bMyQnslnmYrPiRdrOb7zVC/8eLR
         PwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782781728; x=1783386528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0wsC4ibU+bFhqJ2SO7dxDXLRm5lYVtP1esDuPTrSveg=;
        b=qnnM2ReFny/dMVSPB6OG++IzEwuONBrHC19lmvM/9Kj6wI6Vp5hN18X06jm6+kNBuB
         atW89AzRjTlZufaDz3xFedRBesRGxx5EkPaju+OkWYAEAqk+JbWykGT4uqVJXOcTcsgo
         HCKzCH+cZvPg/dGhMfh8LpH+nY/abCVhJm+lYDEvSwqivGjBVcIC2QrO4749DPXkbQIR
         q1dXFdispFG2t/anzyWy5YwlvbK9foupzjGo7VqqRalobYi2mownWgkZ6OJCeU9/KpEV
         wImHNYDc43qCvmYHHlHzYzdNr/w7cNcCS4yA/zOzzSpcqPl57bwkiH7x62LepEzCoOhM
         WbOg==
X-Forwarded-Encrypted: i=1; AHgh+RqgpZx7aUOUNILuGAm8IK94+E3YexbfYEfMW0DK78+0ce/Z4OJEDSIQjHl/D0vzKeHTFFzAqvfuBAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YypZ6dmBFPik5gUe2irbuY+PdTs7Rt6YazId/pu/sPshj4P2n+I
	JJ8DT0k8H7IKZQGA/aWhC/N2NCs8IhoF8JwrpDm3QsVRRKScsk9LO00A
X-Gm-Gg: AfdE7clyVGEB069YAC44U2M0ZCKBWXD6gj7+oMO/WMVG/TvABabzudntvYKiYX3jtuY
	nez0q0MaMIDPgAwJgUUo8VJKyB3/d/CeMp6p5DccPGO6ajF9/R43WVzQLZ2wouv7irfO6TWdyJ4
	p6kLJsH9GpLs8t+bnxGFkkYBK0obFuOp0GixRvWCL2VNPBvfee5gUtb4o9gM7IyRcgjFzr40Vfg
	2qxyVJgbkDkF8pb0va0K+rjvNvSJaLN4NAtUCC1rtyh3Cf+NwVv59ozGcwLM7ta/gGjGbBR+gWJ
	UKnHDyrPuQJFlPUWGPgcTovawaaVuFQv5bLSK8PRH5HMYfCr3S8JPnAGw39kL6RBy+i7crD6QGF
	VuC4uhvtdvuX5zritbl60DxF3pNV2XL2nmxs6CPfKUn7AcTok+4r4BUYGQMBxbgBJaHAC8bgRA9
	p/d0QAbi+1Cd7touzIWqJtIl9T2wpH350w7AyN9mac1ouiEC5FUDXpXgaGbmo=
X-Received: by 2002:a05:6a00:9a1:b0:845:df39:b15c with SMTP id d2e1a72fcca58-8479f2b625cmr1188935b3a.37.1782781727680;
        Mon, 29 Jun 2026 18:08:47 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([203.18.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a005afbfsm653310b3a.27.2026.06.29.18.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:08:47 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 30 Jun 2026 09:08:19 +0800
Subject: [PATCH v5 3/3] mm: move reclaim-internal declarations out of
 swap.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-3-4627aba8ed1e@gmail.com>
References: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com>
In-Reply-To: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Baoquan He <baoquan.he@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1782781697; l=7989;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=lEoc6fmBIVcyCGMOTJnDQjj7lHqRFs6S3s68NobX/6o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFtgwlI9SmhWEjrAscbsQSiwexpKAiAE41BXNZkzWt8lb39d2sD5zrVmy3VvIS57HZS3bYuDkSv
 Yftv1piUUQQ8=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

Keep include/linux/swap.h focused on swap-facing interfaces by moving
MM-internal reclaim and workingset declarations into mm/internal.h.

Leave the small set of LRU helper declarations that are used outside mm/
in swap.h so this cleanup does not need a new public header under
include/linux/.

Suggested-by: Barry Song <baohua@kernel.org>
Suggested-by: Baoquan He <bhe@redhat.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 include/linux/swap.h | 74 +++++-----------------------------------------------
 mm/internal.h        | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c           |  1 +
 3 files changed, 75 insertions(+), 67 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 48cbcbe534bd..62482464c671 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -293,39 +293,19 @@ static inline swp_entry_t page_swap_entry(struct page *page)
 	return entry;
 }
 
-/* linux/mm/workingset.c */
-bool workingset_test_recent(void *shadow, bool file, bool *workingset,
-				bool flush);
-void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages);
-void *workingset_eviction(struct folio *folio, struct mem_cgroup *target_memcg);
-void workingset_refault(struct folio *folio, void *shadow);
-void workingset_activation(struct folio *folio);
-
 /* linux/mm/page_alloc.c */
 extern unsigned long totalreserve_pages;
 
 /* Definition of global_zone_page_state not available yet */
 #define nr_free_pages() global_zone_page_state(NR_FREE_PAGES)
 
+/* linux/mm/folio_lru.c */
+void folio_add_lru(struct folio *folio);
+void folio_mark_accessed(struct folio *folio);
+void lru_add_drain_all(void);
 
-/* linux/mm/swap.c */
-void lru_note_cost_unlock_irq(struct lruvec *lruvec, bool file,
-		unsigned int nr_io, unsigned int nr_rotated);
-void lru_note_cost_refault(struct folio *);
-void folio_add_lru(struct folio *);
-void folio_add_lru_vma(struct folio *, struct vm_area_struct *);
-void mark_page_accessed(struct page *);
-void folio_mark_accessed(struct folio *);
-
-static inline bool folio_may_be_lru_cached(struct folio *folio)
-{
-	/*
-	 * Holding PMD-sized folios in per-CPU LRU cache unbalances accounting.
-	 * Holding small numbers of low-order mTHP folios in per-CPU LRU cache
-	 * will be sensible, but nobody has implemented and tested that yet.
-	 */
-	return !folio_test_large(folio);
-}
+/* linux/mm/folio-compat.c */
+void mark_page_accessed(struct page *page);
 
 extern atomic_t lru_disable_count;
 
@@ -334,42 +314,7 @@ static inline bool lru_cache_disabled(void)
 	return atomic_read(&lru_disable_count);
 }
 
-static inline void lru_cache_enable(void)
-{
-	atomic_dec(&lru_disable_count);
-}
-
-extern void lru_cache_disable(void);
-extern void lru_add_drain(void);
-extern void lru_add_drain_cpu(int cpu);
-extern void lru_add_drain_cpu_zone(struct zone *zone);
-extern void lru_add_drain_all(void);
-void folio_deactivate(struct folio *folio);
-void folio_mark_lazyfree(struct folio *folio);
-
 /* linux/mm/vmscan.c */
-extern unsigned long zone_reclaimable_pages(struct zone *zone);
-extern unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-					gfp_t gfp_mask, nodemask_t *mask);
-unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone_idx);
-
-#define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
-#define MEMCG_RECLAIM_PROACTIVE (1 << 2)
-#define MIN_SWAPPINESS 0
-#define MAX_SWAPPINESS 200
-
-/* Just reclaim from anon folios in proactive memory reclaim */
-#define SWAPPINESS_ANON_ONLY (MAX_SWAPPINESS + 1)
-
-extern unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
-						  unsigned long nr_pages,
-						  gfp_t gfp_mask,
-						  unsigned int reclaim_options,
-						  int *swappiness);
-extern unsigned long mem_cgroup_shrink_node(struct mem_cgroup *mem,
-						gfp_t gfp_mask, bool noswap,
-						pg_data_t *pgdat,
-						unsigned long *nr_scanned);
 extern unsigned long shrink_all_memory(unsigned long nr_pages);
 extern int vm_swappiness;
 long remove_mapping(struct address_space *mapping, struct folio *folio);
@@ -390,11 +335,6 @@ static inline void reclaim_unregister_node(struct node *node)
 }
 #endif /* CONFIG_SYSFS && CONFIG_NUMA */
 
-#ifdef CONFIG_NUMA
-extern int sysctl_min_unmapped_ratio;
-extern int sysctl_min_slab_ratio;
-#endif
-
 void check_move_unevictable_folios(struct folio_batch *fbatch);
 
 extern void __meminit kswapd_run(int nid);
@@ -551,7 +491,7 @@ static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 
 void lru_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent, int nid);
 #else
-static inline int mem_cgroup_swappiness(struct mem_cgroup *mem)
+static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 {
 	return READ_ONCE(vm_swappiness);
 }
diff --git a/mm/internal.h b/mm/internal.h
index 181e79f1d6a2..0c2ee47d8936 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -24,6 +24,73 @@
 
 struct folio_batch;
 
+/* mm/workingset.c */
+bool workingset_test_recent(void *shadow, bool file, bool *workingset,
+			    bool flush);
+void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages);
+void *workingset_eviction(struct folio *folio,
+			  struct mem_cgroup *target_memcg);
+void workingset_refault(struct folio *folio, void *shadow);
+void workingset_activation(struct folio *folio);
+
+/* mm/folio_lru.c */
+void lru_note_cost_unlock_irq(struct lruvec *lruvec, bool file,
+		unsigned int nr_io, unsigned int nr_rotated);
+void lru_note_cost_refault(struct folio *folio);
+void folio_add_lru_vma(struct folio *folio, struct vm_area_struct *vma);
+
+static inline bool folio_may_be_lru_cached(struct folio *folio)
+{
+	/*
+	 * Holding PMD-sized folios in per-CPU LRU cache unbalances accounting.
+	 * Holding small numbers of low-order mTHP folios in per-CPU LRU cache
+	 * will be sensible, but nobody has implemented and tested that yet.
+	 */
+	return !folio_test_large(folio);
+}
+
+static inline void lru_cache_enable(void)
+{
+	atomic_dec(&lru_disable_count);
+}
+
+void lru_cache_disable(void);
+void lru_add_drain(void);
+void lru_add_drain_cpu(int cpu);
+void lru_add_drain_cpu_zone(struct zone *zone);
+void folio_deactivate(struct folio *folio);
+void folio_mark_lazyfree(struct folio *folio);
+
+/* mm/vmscan.c */
+unsigned long zone_reclaimable_pages(struct zone *zone);
+unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
+				gfp_t gfp_mask, nodemask_t *mask);
+unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
+			      int zone_idx);
+
+#define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
+#define MEMCG_RECLAIM_PROACTIVE (1 << 2)
+#define MIN_SWAPPINESS 0
+#define MAX_SWAPPINESS 200
+
+/* Just reclaim from anon folios in proactive memory reclaim */
+#define SWAPPINESS_ANON_ONLY (MAX_SWAPPINESS + 1)
+
+unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
+					   unsigned long nr_pages,
+					   gfp_t gfp_mask,
+					   unsigned int reclaim_options,
+					   int *swappiness);
+unsigned long mem_cgroup_shrink_node(struct mem_cgroup *memcg,
+				     gfp_t gfp_mask, bool noswap,
+				     pg_data_t *pgdat,
+				     unsigned long *nr_scanned);
+
+#ifdef CONFIG_NUMA
+extern int sysctl_min_unmapped_ratio;
+extern int sysctl_min_slab_ratio;
+#endif
+
 /*
  * Maintains state across a page table move. The operation assumes both source
  * and destination VMAs already exist and are specified by the user.
diff --git a/mm/memfd.c b/mm/memfd.c
index abe13b291ddc..6c72fe6caef7 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -19,6 +19,7 @@
 #include <linux/memfd.h>
 #include <linux/pid_namespace.h>
 #include <uapi/linux/memfd.h>
+#include "internal.h"
 #include "swap.h"
 
 /*

-- 
2.43.0

