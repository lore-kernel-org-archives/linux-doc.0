Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBDC3815CA
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260811; cv=none; b=iRH5gwIFwP6Yor8OYwiNCLtct3MdeLHRRUPxm1VckDywamSdvTIkTDrULpPRbpTJPqdAQqQY38Bs0eI/o8ZHXhY4eJ3T7BmyWD43fsbPOy7J3r0gUUKYBVFV8OyDXJBMhNlbNASEV0OtzRjcFlioi+X3S5E65iHJzv0OEE7NSDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260811; c=relaxed/simple;
	bh=c2aWehUldFJ6gV1953fK06n/cKp0RWFXMqpIh7GrrCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZ5i/PBqGL0cHob6mAqKToc6JX394tQl+pvdZ7c9wVs6nb6vXrDEsBuOCx6VovNlf4953/yCzRb3WzKLYqXvSRNwaDMSwFJ4I3XF2WGqEfvUvZxrX7s5Q8iKOhYgAOUZUvuUTSVhiPJcV4/806ew5fe4Pt82rqQ7E9mpxvnYnK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqxDfqS+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqxDfqS+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad4170e8eso24599635ad.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260809; x=1783865609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KD3puzdO3zNM++MosBOhLaFI4GrSRdgd8q2304qSZeU=;
        b=XqxDfqS+uSEjWMHnSZUXW3SYGb5RLmR7AxiYqD4dYxxiz6Flz/DG2//PfWvdK4J1/j
         KzLWusngke1V1xpIb9+H1i8lERsWZVozgXHBc5V5fur1dxAfxMameG9Rr/w241kqoHNq
         H2MPVgUzQUYM6lkMZ+88aIa3X9RzDlZxpab6Tq4Sbpq5zhJpoQzlQYome8d2cMJfnNer
         kjMluydy8Sp02RXMp95IyH3l+kPcYxq0Bzi0KS6Si/QLthMGJhlqPn9sn0k1Sy9kgrhZ
         igUPYTskDUhrb2TbOlU8hb+zEDZNJ2Zd+YC6zSfoeY8h69K1A7iv55VSBrMq3ANF9Umm
         mVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260809; x=1783865609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KD3puzdO3zNM++MosBOhLaFI4GrSRdgd8q2304qSZeU=;
        b=qE9ns6LWy3b2sniR5QfHBOEYOmaBlZpWIm1xY18TWu6fBVkO9HFgdpeNFfrRGgIFsu
         88Hju9N+3U0HBH6RElhvR39fTLRNF6e5YIoo5xVgDy1A29IRbuBaJLqRlNd5j64eG9/v
         7dE7IGeCy1pZveK+BYyTozYPJaCVUy5kTD+2mtQPKmtEtz7HVLEWwBYRIe53lP7FMuve
         qwRjkKrDyaBirSk6K2xawe3HIgadOINBJdrzRKLknPZ9eKB66e++1vsS+UBfomDeJKOs
         xgucOMU1bk3w8dlJW7XFeTE5y17braNnuB60f5cj+pOnDtQDF//LRJYOr3Y4lK35iuGU
         xk9A==
X-Forwarded-Encrypted: i=1; AHgh+RqBGReN3GiVbQqHk2wUQZTxRT3Nnw/MB8TmDjuJCRirevXSJ6BIqrto+2ZwIlpXAJOn8ikYWwGktGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLLGsXidVRbS25t18BOPY9u7T4pELF3yZ44++irT42zBoYU/i
	yfYQBm+fBpW7C7st1k6iPV71wob+jOcv832l2xiDblRG3+7C0d2D7JOc
X-Gm-Gg: AfdE7ckF8N92Bg3b7L6SsCaDo3iG1CbqqpVOx65zqTZKINpCPg0Pwy26sYxxvzgJK0t
	/S2mY6aLKDjBnOj727trDI/Bg5W5/fPdQnR89Ou88n+22XhmIG7TjMg/ZU0wVPtDW6Rt9JMZYED
	Sz4qhd4w2NlrEt1Yj5/ng4svhZCm0Uzn4QRNJqvOO4+/ZOf7/cV/7J+UYAXrNxJ4GlbEUmXvgIK
	z5bdqDdr7IBwAPrpaZI1JsggUMi3vEZSXMJuYPjfiw0jZ+ixPY00oba2G+tuABDA/py2PjgfA8y
	eiDKs1CXcPq5bdphW58Lpr3aL9PyLKV1w9jrnB2+icw1y1vRduWcsa/vyVfv9KpXCo5D6e+75O9
	0RTnW3YwEazFpdapSyDz1203n89Vd1vDqn8LNj4lARJZR7NIywxIXjF2EKZMBdGfgDDD/MqcYCk
	XJJ8F8rx1hGTt8ssSMIAWlkT4b8McVR8JbvT13rIvGiMPEHnqRRnKc3JFbljTjDvQ=
X-Received: by 2002:a17:903:1208:b0:2ca:d820:b9a6 with SMTP id d9443c01a7336-2cbb9ee4f7amr66159395ad.23.1783260809457;
        Sun, 05 Jul 2026 07:13:29 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260basm34169155ad.16.2026.07.05.07.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:13:28 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sun, 05 Jul 2026 22:12:33 +0800
Subject: [PATCH v7 3/3] mm: move reclaim-internal declarations out of
 swap.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-3-a028e8b5fc3d@gmail.com>
References: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
In-Reply-To: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1783260776; l=8023;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=c2aWehUldFJ6gV1953fK06n/cKp0RWFXMqpIh7GrrCQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB6JcfTN+mE2CHPBEqR+/87U1NvqNZUiG5beZpyUtBxMWLwnIn9JVPq6J2+mxbjcT42cmMpNDBw
 kLjThLFtHXAg=
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
 include/linux/swap.h | 75 +++++-----------------------------------------------
 mm/internal.h        | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c           |  1 +
 3 files changed, 75 insertions(+), 68 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 45656ca9792d..696ed01709c2 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -287,39 +287,19 @@ static inline swp_entry_t page_swap_entry(struct page *page)
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
 
+/* linux/mm/folio.c */
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
 
@@ -328,42 +308,6 @@ static inline bool lru_cache_disabled(void)
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
-/* linux/mm/vmscan.c */
-extern unsigned long zone_reclaimable_pages(struct zone *zone);
-extern unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-					gfp_t gfp_mask, const nodemask_t *mask);
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
@@ -384,11 +328,6 @@ static inline void reclaim_unregister_node(struct node *node)
 }
 #endif /* CONFIG_SYSFS && CONFIG_NUMA */
 
-#ifdef CONFIG_NUMA
-extern int sysctl_min_unmapped_ratio;
-extern int sysctl_min_slab_ratio;
-#endif
-
 void check_move_unevictable_folios(struct folio_batch *fbatch);
 
 extern void __meminit kswapd_run(int nid);
@@ -544,7 +483,7 @@ static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 
 void lru_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent, int nid);
 #else
-static inline int mem_cgroup_swappiness(struct mem_cgroup *mem)
+static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 {
 	return READ_ONCE(vm_swappiness);
 }
diff --git a/mm/internal.h b/mm/internal.h
index fa4fb69444ec..771bd3581fc7 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -31,6 +31,73 @@ struct huge_bootmem_page {
 	unsigned long flags;
 };
 
+/* mm/workingset.c */
+bool workingset_test_recent(void *shadow, bool file, bool *workingset,
+			    bool flush);
+void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages);
+void *workingset_eviction(struct folio *folio,
+			  struct mem_cgroup *target_memcg);
+void workingset_refault(struct folio *folio, void *shadow);
+void workingset_activation(struct folio *folio);
+
+/* mm/folio.c */
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
+				gfp_t gfp_mask, const nodemask_t *mask);
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

