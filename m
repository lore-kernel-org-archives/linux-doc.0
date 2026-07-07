Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8916E3E5A2F
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440734; cv=none; b=KWdNAj6TG+MJjmt4285lX4U1b6GurgGHt/0MKcNPcGMwiDDQ0Y6X+gF3DxaVIIpD+/iOuxlZdnr2TGeiNhQgzJpDXbd/fEp+5f2kxNBp2BgZLrVAAilnaF5ZvYUAB8/4zLktRkB0nWNbHXx97oP8wuPLMhV+Vv0BksMY2wlEzpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440734; c=relaxed/simple;
	bh=HQQ72dgmVbZC77bcr0zDY6sZbYi1+DHjLIVBbJrZdNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CL9x/bRp8gDYI5qCshUOZ0o0HzyILdL0hTF5nSuxFnAV7bPMIWS0dBsaeXredXblof5Gp9L5/qNx03TTC6JQ8yu5AyueM2BEdowNiASBPBiVt2PM268wVCSpUtxHgLWSjh8EkFU50R2OuNLM2Tsj4wRzeb5rZRqU9XIf/WbMYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH/JiP7g; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH/JiP7g"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so35244815ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783440731; x=1784045531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsX4tsng9Yri+W6keCRu8OvEuZNjSh1FDIcrUyUmTN0=;
        b=lH/JiP7gFoYMJUrTnAwntroL3r83Rb96v4nwebAHDjxgbwlFYpHzs8x3nYVp0dfGUx
         qsh0MZ+GYwjDu5a7/nQOyeTMJG6P5mX2/XEm6tWfjFgnv2ZwBQnM5RNyo+GThRittSYX
         GISyqQrITGKDiekYWOQMbqPwmUg74wgnyPxmBGHZ3yciZ9YIf6w9iwXC2x3PrOyLDkzp
         0DSrow/0y7qBYJXRGd2Vgk0Dut0y0oScmK4VUVyJs5yNkHZeZOsTy5t5v9zxOJFOxj5b
         H5Jib2O12mEn2WrcH1IvgGkL0Qyk9H2icVtMnAoZ2NhhnskVXxdAbQSfuA8Iu+BSQjO2
         MjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440731; x=1784045531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsX4tsng9Yri+W6keCRu8OvEuZNjSh1FDIcrUyUmTN0=;
        b=RWr9Rbfj4V81/VteF7JzjAxgE3tpLj9Hjx6nu5tUH27qh+TpD0KatkISjUxX5aPaE6
         JplgOS62LXHENgFayP8hx5Ze5cgH6cWgXdko+ZjnQD5ffl6JAX3LwIyCl1wdf9MR9H7J
         Fxxq0IwbgU/oEjmHubsHr8/I7r2A09GbJEOYWm0FbxBret5dvBTCN2vb4Vc9ZQxbNyZv
         dseZ7lAPRw7xErTfgSW46QxGq39+J4duwuo3NMaYG+azdK7v/IBJ1jTbmF4Kmm41TwHU
         yi05l4+dNOjlF3Gp7FNuZCmXm1JuZRCNLaYjp6Tal4b4zLjaGEcmNdlC1UKBdfpRP8QI
         OXuw==
X-Forwarded-Encrypted: i=1; AHgh+RofRRI7s4D+1cvDBj0GkTJz5XilFPtwWLq2sUrS6PX80Rg7/cLmYaQidASyJoz7lHo5Lbl+hOYnfZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmEhy7xEv6qqM3AH2Z146j9OBA9UcqwdBz0Jv0au/ey72G+vA
	nLA5XvcnDCWsGuvkvB8QHlmqxrnSWKjighwI/eKxG8CmV9L1RZwPOVdI
X-Gm-Gg: AfdE7cn31t5wTdAiae66u0i1PT3gLxwbamdPsJOSgehzP2LxnxNZx8r9eIQBZkdJDlu
	M+RKIuV3AqDNFkyR/VshMPT4Xc+J4AfM8kBwJHxRljDc5PVh1n5V5RSIysIXlTTz6oYStZUpQCR
	lcVlDuPsz1BgYx0Su1TGPmskziw9ofdCdjzBE979b9OUEWxRPhzRRHbsGFzsEcyGc96LOKrgNZA
	rCf25cdrEWI/shLNEl+Dji6W7K8ghMZ+Onpe5lLJboOmd18cCgtxJicKvtk51Flbd4Lk+vx7sMw
	DOzVMzY4Q0lZnmZIIJhCRBz03QnV3J/g5SaysrFdTfMURafqqOxW/25r9uGShfwala18Hv6O2QK
	vL1E5bCyrzJvaMoml/de6zcV4jAq6Cm3nRRJuur3m2u1naEC2QGFFP7eaX6IFhU7D8cjTpWAEu0
	R7bGGR9784zbXUs1EV9ztWLC+eXNk4Q75fRtkLSLJpiMkJjkUYGAN4MrEQ55xb5zMMYb9hYYj2b
	p9TrThsITvadzvR7HraUWvLzKRuEg==
X-Received: by 2002:a17:902:cf0b:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2ccbe7297fbmr54305675ad.20.1783440730695;
        Tue, 07 Jul 2026 09:12:10 -0700 (PDT)
Received: from [127.0.1.1] (ec2-18-162-112-89.ap-east-1.compute.amazonaws.com. [18.162.112.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfd443sm14712115ad.30.2026.07.07.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:12:10 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 08 Jul 2026 00:11:29 +0800
Subject: [PATCH v8 3/3] mm: move reclaim-internal declarations out of
 swap.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-3-e816812698a8@gmail.com>
References: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com>
In-Reply-To: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com>
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
 Baoquan He <baoquan.he@linux.dev>, Baoquan He <baoquan.he@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783440691; l=8023;
 i=wujianyue000@gmail.com; s=linux; h=from:subject:message-id;
 bh=HQQ72dgmVbZC77bcr0zDY6sZbYi1+DHjLIVBbJrZdNQ=;
 b=0jVFtpQEPgTsXXe5ds9owsTq+WvvydPjod9VWp04TA+Fkf2lUvZJ5S3Q0/HwyIkJmL37ta0OD
 a0g631yeow0DmZgzjEJrODwbmd/Cg0ax/FTzRtf3/yDQic5nxJHu/v8
X-Developer-Key: i=wujianyue000@gmail.com; a=ed25519;
 pk=49tqjvkqDVX1TtHEyTCiJGlKLg6SQ4BmgzG+HoHQW6E=

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
index 841c27611627..6afbe6b7252d 100644
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

