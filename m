Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9CD481661
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491978; cv=none; b=Tcm8AYSJ+Lae9Ex47WOQBgPszM/UWtePbZ/eEN8C1RdyLUhLfaV7SPeOcCR7fINurgZBHqwjYg/+cn3iu4cFxBMBqqYoz/d5Q6+Ks4EzThyZVo9Mdob0NhA4vX3Ee5RUYDpNT2PNc7XUQFcKqPpQotYlmLf8GoMtRdbqPp/DnjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491978; c=relaxed/simple;
	bh=T6kHT+p1VwjYophqk0ehEJosMAed3iZy1b1M7R+o828=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FeXC9hwBuMpXHNImO1vAQA75Wy0f+jP4Y3xirQEAfPBWuYod0Z5weT2yt40mw7ueO9jAZX0HAemiwzyot1ELn+ttoJES2sbJkxbGQLtS+WrXk9rM0yy4Ll7QOs3onQ/6dO7C2ZVoQxSTMrkNNF1cNcazO1zy5Boy7iZUfm/Mjqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSmbqBMJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSmbqBMJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso1966353b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491967; x=1781096767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AdEtlgwKVGn3OjI19JPJND+SGmb9+Nc9aTPH09hmBU=;
        b=gSmbqBMJ/YP8JsRsqmbQd5yjAL1yE6abCB23bDKeTykWFEpag2l5toFAj5+3lV3nlf
         wzHw2h/1AgHz2myN0YQ667V18oGeTVKOEoP+sy2tWi5V5u69I5KwIFMSBczPg0tUIHFn
         A5oOsvcUOMn9DyVFFqqVUE+mrxdevXCBj8ttM+FcIQ9fVBk/pXD3MOllmjN+tsdNOE+6
         zPYTM3eTLNjnxLyvkEljZIMA7Wf3wG/oxkyQqn2j4RUl/cjGm+05dpJCzaM9OoO7A2dT
         zoTjwY+1YlstIlQdQwkeuhh+Y+fyF0rr1CcnCBwNOovXvjK1pbeqD0+qlPdErCwdodA8
         hCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491967; x=1781096767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/AdEtlgwKVGn3OjI19JPJND+SGmb9+Nc9aTPH09hmBU=;
        b=JKbqGM5YOxQJJKJuBiUVcW/dxleWWAC5jww0yFgGuLGXhikWA8xErJtbre7PF5N5T7
         LsK2BdM1XqwfAvOQ0of7K394oy32H9F7NtHAVDatGCU0EJCOvS1efPs/tiZXus7TChFj
         V6pBTuC078gQPO9f7NFDpDPoi1Hexdj0bRhnxzn4uPab+4LrbuVF0ytnOYAa4z1MZO4r
         8WUvpIciKCC+4cdeEe+Dcw/qcq7bMNnqgcUcgh7WEMueOqzj6hnULHZQA80hagq5caXE
         SjRAHDQWmhwrfMqHXmGRm7ZUV/tVxgQVIZ5hVtOdc/MWuInSmL5vyElwXTo1Yu3W7Acu
         Morw==
X-Forwarded-Encrypted: i=1; AFNElJ/1XFBJzbSPuVZ5zbyjU4sJ/Fmln4jca6hJnz6HOXl7M1dz6Y3ND5FgF3E3NH0EqKFf4ufnHDqF84M=@vger.kernel.org
X-Gm-Message-State: AOJu0YySM3XG3oADixDGtyF+EeIvH/JZCPMfZ4kN/pVFacWIDQyl6XhY
	yXgbPnJuYMgUWuxBISM1dqyV0F40QM2NE6DDRG/7QsRdIk+iH1uW1oz5
X-Gm-Gg: Acq92OG8Na3oHZRCuC8ak6DGMUhMj5kfXo4k8/D7se3/wx1zMYuWJv5Clmdlb5t31D5
	lGwDVjMmwNAvAwOvrCOru4z80mGlrbhaK550127nQ5jpDcFIS7ck5hbO/Yx0LRtVIdjqpWcFxxr
	bqJ/nT7BijdsMtdTN+gdQDHlV8Em53FwyU4wU3xgzTAuOKa7eajvrEN1OaPiEkrDphup827zwhD
	hdyuE4iecnJS2O7khd9cak/xucVGz0mBqpoJmVgMMuSVL2Ivl6lC27bZbBbupt5la5JRejw+/W1
	km02IkqttYLhIWCa3b7vFhhaaBWVz2E1oMVlI60IKf+L3DJJusFYREz6TQFLn995zM5itvdtGSV
	vLbPhk+Kpb4e/S5P9tZR47GP86giHsgZbgw5ems7gtotdvOpDB9Z5dqrdiKHRq4Tsvolrw7LAy2
	DxSKI+IHZ8ai/p6O1FOdjoCAhMV/Yr5gV0GXxaHI8+g0T2mHCxEOArC0BLf3oAiJZ68oYt6cUIW
	NtEb06nWd8=
X-Received: by 2002:a05:6a00:340b:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-84284ea24f6mr3094033b3a.20.1780491966627;
        Wed, 03 Jun 2026 06:06:06 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821d0sm3018661b3a.28.2026.06.03.06.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:06:06 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 03 Jun 2026 21:05:34 +0800
Subject: [PATCH v4 3/3] mm: move reclaim-internal declarations out of
 swap.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-3-ce0219e100d9@gmail.com>
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1780491936; l=7974;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=T6kHT+p1VwjYophqk0ehEJosMAed3iZy1b1M7R+o828=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD4bVWhMe8NLfW7WaNlCFAwsZgMqQhUe7WFiFzMCNG3jj26NJzsItffE/f0Y0lHspxRMIi1Z50i
 ycVwcPcdRAAY=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

Keep include/linux/swap.h focused on swap-facing interfaces by moving
MM-internal reclaim and workingset declarations into mm/internal.h.

Leave the small set of LRU helper declarations that are used outside mm/
in swap.h so this cleanup does not need a new public header under
include/linux/.

Suggested-by: Barry Song <baohua@kernel.org>
Suggested-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 include/linux/swap.h | 74 +++++-----------------------------------------------
 mm/internal.h        | 68 +++++++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c           |  1 +
 3 files changed, 76 insertions(+), 67 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 5bd6f1d5984a..5c0d92613a35 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -292,39 +292,19 @@ static inline swp_entry_t page_swap_entry(struct page *page)
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
 
@@ -333,42 +313,7 @@ static inline bool lru_cache_disabled(void)
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
@@ -389,11 +334,6 @@ static inline void reclaim_unregister_node(struct node *node)
 }
 #endif /* CONFIG_SYSFS && CONFIG_NUMA */
 
-#ifdef CONFIG_NUMA
-extern int sysctl_min_unmapped_ratio;
-extern int sysctl_min_slab_ratio;
-#endif
-
 void check_move_unevictable_folios(struct folio_batch *fbatch);
 
 extern void __meminit kswapd_run(int nid);
@@ -553,7 +493,7 @@ static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 
 void lru_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent, int nid);
 #else
-static inline int mem_cgroup_swappiness(struct mem_cgroup *mem)
+static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 {
 	return READ_ONCE(vm_swappiness);
 }
diff --git a/mm/internal.h b/mm/internal.h
index 5602393054f3..1744bb6b3222 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -24,6 +24,74 @@
 
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
+		unsigned int nr_io, unsigned int nr_rotated)
+		__releases(lruvec->lru_lock);
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

