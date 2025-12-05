Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8002E7645
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764977546; cv=none; b=G4UwLnSQloJ217212zRXw5otbm8uH1V8axpUew1b/LnmO3Zcs4XzeHD21hxeETaObwB0LyE7HBq94Lni6qS93bmnG/YyTYVhCD+DXs9ZewNAr30fmyVeszhtCLvr252CadAahvitJIMOwG8gorfoibvxLZ+3Y4yxw1nIxbuCJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764977546; c=relaxed/simple;
	bh=wpY55Dp8L0kCqW3v8iD8EKWvzYT13cCqvAzMecr+vgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PvEZq3i8yMX8rcFRE9ugQhgzHAmG8nyaQQXLLs/NjlS++TOF0QQ4FPTlbxeO8gLN4HI+arKTYZuwjslGdpgdYYhZ7WOBE3JbSAmSWWp0iPpju0VFQxgjkxXhjiD/AZDkbyVARw0awvP6InYzsVEP5gNHlTuVAnSlUjBwONlgNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmT3a8Q2; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmT3a8Q2"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-642fcb9c16aso2351512d50.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 15:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764977542; x=1765582342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dNzBA/KM3TzCUjw+cH+YJCV/4vpqJc2N6ZuhjsZcyw=;
        b=NmT3a8Q2JN/P3eGb8oqwFqR3b3f+DGrwHmUNf+Lncxuk1jlztpsY/uK856o8gW4t3C
         r/zVlWOp0L60+8LtVF1GuRMOfusQyl1QmdCDMRfJcY18SBytS//WZjdYQ9S7KEn/gb1S
         ck1EzOE+PdKCsScIj4R18LTEfAvE6ejT/yPJvOm4L8LBYM4QmCl8ILLH8IAg0M+H7M5P
         hR1s4msxo2xUAF8pQgxBAxyeP8MldN58E+CCahjeelPz5ceIibEB12wW8Iz4586c7ASJ
         +Dh2OFdQPtLwX+NLTtli5TcNuXSVN/6znMEOaGCuj8bNfSuH96J09woGGWgQZVt/D1+a
         +QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764977542; x=1765582342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0dNzBA/KM3TzCUjw+cH+YJCV/4vpqJc2N6ZuhjsZcyw=;
        b=fBXxVCodryw1Mg6AwYj7oo7sjlVPh06q9IvupMZ7Xvc0OwWyEgvh4Znn3hmiIamKE0
         gELlQsjpv5z4Xrk2VRDmruMYC7SG8zakamObkNz5x/7z5yhuUSBUy2omW7wxVLdtW/4o
         aTQcIbYEap2f3BnrTtcuTzwcqsx7l0eNJWgI9+tYJswI2Naa4k7vU+eMiDYcps3TSEXU
         KkHI7N9vcUbwtNtAIXx1/GRBrUj6fMiORC7auGGjZXiJ+JGuNYy+ykZwAmlwJ26PStqG
         11P0VUWcrPY9gl5ZbshaAWgwJm32/YV1Zs7df64uE6nkoqc9x9QXKH7Ma4GYR7lKbHXL
         Dz/A==
X-Forwarded-Encrypted: i=1; AJvYcCWafFkY5h2d+ubs/vsG8iklU9sTevhHFTxeV+jQ86dq+Ln4MHZLtZECGiqKJoBzitBjAQ14bhP/kdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzsFLBmnKNvJO3G8weeq/dvSTiopZaOGwX7uFOtwpK7jfHetx0
	j8qZUIwo9/vd83wn3T7C2Xq4i8rVIj7+fF/NM4a8lVVD/MreBpHBzcxv
X-Gm-Gg: ASbGnctj22dnBC6f7oceBJp0kQcVcco5BKhjhh/neUa7Ddqbz/HPoKILJO+kqhMOp37
	OTVWSJ/MOJivlPB14kxUWridRfj+Jm8WpsnUYvAtz4p7zz5EA4A631DOF3DHAS+7odzB5RB6CGg
	ptiV8UVecjQVbUuhIOyV86/htADg0UEyFYt5HgUa78EnbmZJhTxH6KSHyi94DBu8MxKGS4+8Fu6
	2vqxY0MjR5BsMIHCWnLo2kKNafwK7FFLBAcQS/MARzJ/Y6Va916brF/0uI0Lnasvo/8rEwfpa/d
	JvOxT7frvLZ2ePCSPioqMPYZLcTXyn9GV48FNAnVpFdAqlV1Np68LQuMgxHMjNVjrDFc3Y8LnrZ
	eNY87CSrG5TnQtBGkQomH3q+GUk/oe3Nm+FBC2oTRxDZoO6Z9tD/GTw82Pz7wS9HrYh51zhUQaA
	6mSMmNvagPsp5xuH0XI08D
X-Google-Smtp-Source: AGHT+IGDMUjSj5eZNlS8p7+TuSppjTK9shhyWb4cNaH9Kyj+wS4thzK9tHU/IzcAApEIw14tqpAafQ==
X-Received: by 2002:a05:690c:4b87:b0:789:61ca:88f6 with SMTP id 00721157ae682-78c33b19cedmr14020287b3.4.1764977542151;
        Fri, 05 Dec 2025 15:32:22 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:1::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f5b0c2fsm2331650d50.19.2025.12.05.15.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 15:32:21 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: 
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Alex Shi <alexs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wei Xu <weixugc@google.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	Yuanchu Xie <yuanchu@google.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC LPC2025 PATCH 3/4] mm/vmscan/page_alloc: Deprecate min_{slab, unmapped}_ratio
Date: Fri,  5 Dec 2025 15:32:14 -0800
Message-ID: <20251205233217.3344186-4-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205233217.3344186-1-joshua.hahnjy@gmail.com>
References: <20251205233217.3344186-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The min_slab_ratio and min_unmapped_ratio sysctls allow the user to tune
how much reclaimable slab or reclaimable pagecache a node has before
deciding to shrink it in __node_reclaim. Prior to this series, there
were two ways these checks were done:
  1. When zone_reclaim_mode is enabled, the local node is full, and
     node_reclaim is called to shrink the current node
  2. When the user directly asks to shrink a node by writing to the
     memory.reclaim file (i.e. proactive reclaim)

In the first scenario, the two parameters ensures that node reclaim is
only performed when the cost to reclaim is overcome by the amount of
memory that can easily be freed. In other words, it acts to throttle
node reclaim when the local node runs out of memory, and instead resorts
to fallback allocations on a remote node.

With the zone_reclaim_mode sysctl being deprecated later in the series,
only the second scenario remains in the system. The implications here
are slightly different. Now, node_reclaim is only called when the user
explicitly asks for it. In this case, it might make less sense to try
and throttle this behavior. In fact, it might feel counterintuitive from
the user's perspective if triggering direct reclaim leads to no memory
reclaimed, even if there is reclaimable memory (albeit small).

Deprecate the min_{slab, unmapped}_ratio sysctls now that node_reclaim
no longer needs to be throttled. This leads to less sysctls needing to
be maintained, and a more intuitive __node_reclaim.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 Documentation/admin-guide/sysctl/vm.rst       | 37 ---------
 Documentation/mm/physical_memory.rst          |  9 --
 .../translations/zh_CN/mm/physical_memory.rst |  8 --
 include/linux/mmzone.h                        |  8 --
 include/linux/swap.h                          |  5 --
 mm/page_alloc.c                               | 82 -------------------
 mm/vmscan.c                                   | 73 ++---------------
 7 files changed, 7 insertions(+), 215 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 4d71211fdad8..ea2fd3feb9c6 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -49,8 +49,6 @@ Currently, these files are in /proc/sys/vm:
 - memory_failure_early_kill
 - memory_failure_recovery
 - min_free_kbytes
-- min_slab_ratio
-- min_unmapped_ratio
 - mmap_min_addr
 - mmap_rnd_bits
 - mmap_rnd_compat_bits
@@ -549,41 +547,6 @@ become subtly broken, and prone to deadlock under high loads.
 Setting this too high will OOM your machine instantly.
 
 
-min_slab_ratio
-==============
-
-This is available only on NUMA kernels.
-
-A percentage of the total pages in each zone.  On Zone reclaim
-(fallback from the local zone occurs) slabs will be reclaimed if more
-than this percentage of pages in a zone are reclaimable slab pages.
-This insures that the slab growth stays under control even in NUMA
-systems that rarely perform global reclaim.
-
-The default is 5 percent.
-
-Note that slab reclaim is triggered in a per zone / node fashion.
-The process of reclaiming slab memory is currently not node specific
-and may not be fast.
-
-
-min_unmapped_ratio
-==================
-
-This is available only on NUMA kernels.
-
-This is a percentage of the total pages in each zone. Zone reclaim will
-only occur if more than this percentage of pages are in a state that
-zone_reclaim_mode allows to be reclaimed.
-
-If zone_reclaim_mode has the value 4 OR'd, then the percentage is compared
-against all file-backed unmapped pages including swapcache pages and tmpfs
-files. Otherwise, only unmapped pages backed by normal files but not tmpfs
-files and similar are considered.
-
-The default is 1 percent.
-
-
 mmap_min_addr
 =============
 
diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index b76183545e5b..ee8fd939020d 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -296,15 +296,6 @@ See also Documentation/mm/page_reclaim.rst.
 ``kswapd_failures``
   Number of runs kswapd was unable to reclaim any pages
 
-``min_unmapped_pages``
-  Minimal number of unmapped file backed pages that cannot be reclaimed.
-  Determined by ``vm.min_unmapped_ratio`` sysctl. Only defined when
-  ``CONFIG_NUMA`` is enabled.
-
-``min_slab_pages``
-  Minimal number of SLAB pages that cannot be reclaimed. Determined by
-  ``vm.min_slab_ratio sysctl``. Only defined when ``CONFIG_NUMA`` is enabled
-
 ``flags``
   Flags controlling reclaim behavior.
 
diff --git a/Documentation/translations/zh_CN/mm/physical_memory.rst b/Documentation/translations/zh_CN/mm/physical_memory.rst
index 4594d15cefec..670bd8103c3b 100644
--- a/Documentation/translations/zh_CN/mm/physical_memory.rst
+++ b/Documentation/translations/zh_CN/mm/physical_memory.rst
@@ -280,14 +280,6 @@ kswapd线程可以回收的最高区域索引。
 ``kswapd_failures``
 kswapd无法回收任何页面的运行次数。
 
-``min_unmapped_pages``
-无法回收的未映射文件支持的最小页面数量。由 ``vm.min_unmapped_ratio``
-系统控制台（sysctl）参数决定。在开启 ``CONFIG_NUMA`` 配置时定义。
-
-``min_slab_pages``
-无法回收的SLAB页面的最少数量。由 ``vm.min_slab_ratio`` 系统控制台
-（sysctl）参数决定。在开启 ``CONFIG_NUMA`` 时定义。
-
 ``flags``
 控制回收行为的标志位。
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 75ef7c9f9307..4be84764d097 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1451,14 +1451,6 @@ typedef struct pglist_data {
 	 */
 	unsigned long		totalreserve_pages;
 
-#ifdef CONFIG_NUMA
-	/*
-	 * node reclaim becomes active if more unmapped pages exist.
-	 */
-	unsigned long		min_unmapped_pages;
-	unsigned long		min_slab_pages;
-#endif /* CONFIG_NUMA */
-
 	/* Write-intensive fields used by page reclaim */
 	CACHELINE_PADDING(_pad1_);
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c5915d787852 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -411,11 +411,6 @@ static inline void reclaim_unregister_node(struct node *node)
 }
 #endif /* CONFIG_SYSFS && CONFIG_NUMA */
 
-#ifdef CONFIG_NUMA
-extern int sysctl_min_unmapped_ratio;
-extern int sysctl_min_slab_ratio;
-#endif
-
 void check_move_unevictable_folios(struct folio_batch *fbatch);
 
 extern void __meminit kswapd_run(int nid);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 010a035e81bd..9524713c81b7 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5676,8 +5676,6 @@ int local_memory_node(int node)
 }
 #endif
 
-static void setup_min_unmapped_ratio(void);
-static void setup_min_slab_ratio(void);
 #else	/* CONFIG_NUMA */
 
 static void build_zonelists(pg_data_t *pgdat)
@@ -6487,11 +6485,6 @@ int __meminit init_per_zone_wmark_min(void)
 	refresh_zone_stat_thresholds();
 	setup_per_zone_lowmem_reserve();
 
-#ifdef CONFIG_NUMA
-	setup_min_unmapped_ratio();
-	setup_min_slab_ratio();
-#endif
-
 	khugepaged_min_free_kbytes_update();
 
 	return 0;
@@ -6534,63 +6527,6 @@ static int watermark_scale_factor_sysctl_handler(const struct ctl_table *table,
 	return 0;
 }
 
-#ifdef CONFIG_NUMA
-static void setup_min_unmapped_ratio(void)
-{
-	pg_data_t *pgdat;
-	struct zone *zone;
-
-	for_each_online_pgdat(pgdat)
-		pgdat->min_unmapped_pages = 0;
-
-	for_each_zone(zone)
-		zone->zone_pgdat->min_unmapped_pages += (zone_managed_pages(zone) *
-						         sysctl_min_unmapped_ratio) / 100;
-}
-
-
-static int sysctl_min_unmapped_ratio_sysctl_handler(const struct ctl_table *table, int write,
-		void *buffer, size_t *length, loff_t *ppos)
-{
-	int rc;
-
-	rc = proc_dointvec_minmax(table, write, buffer, length, ppos);
-	if (rc)
-		return rc;
-
-	setup_min_unmapped_ratio();
-
-	return 0;
-}
-
-static void setup_min_slab_ratio(void)
-{
-	pg_data_t *pgdat;
-	struct zone *zone;
-
-	for_each_online_pgdat(pgdat)
-		pgdat->min_slab_pages = 0;
-
-	for_each_zone(zone)
-		zone->zone_pgdat->min_slab_pages += (zone_managed_pages(zone) *
-						     sysctl_min_slab_ratio) / 100;
-}
-
-static int sysctl_min_slab_ratio_sysctl_handler(const struct ctl_table *table, int write,
-		void *buffer, size_t *length, loff_t *ppos)
-{
-	int rc;
-
-	rc = proc_dointvec_minmax(table, write, buffer, length, ppos);
-	if (rc)
-		return rc;
-
-	setup_min_slab_ratio();
-
-	return 0;
-}
-#endif
-
 /*
  * lowmem_reserve_ratio_sysctl_handler - just a wrapper around
  *	proc_dointvec() so that we can call setup_per_zone_lowmem_reserve()
@@ -6720,24 +6656,6 @@ static const struct ctl_table page_alloc_sysctl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= numa_zonelist_order_handler,
 	},
-	{
-		.procname	= "min_unmapped_ratio",
-		.data		= &sysctl_min_unmapped_ratio,
-		.maxlen		= sizeof(sysctl_min_unmapped_ratio),
-		.mode		= 0644,
-		.proc_handler	= sysctl_min_unmapped_ratio_sysctl_handler,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE_HUNDRED,
-	},
-	{
-		.procname	= "min_slab_ratio",
-		.data		= &sysctl_min_slab_ratio,
-		.maxlen		= sizeof(sysctl_min_slab_ratio),
-		.mode		= 0644,
-		.proc_handler	= sysctl_min_slab_ratio_sysctl_handler,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE_HUNDRED,
-	},
 #endif
 };
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index d07acd76fdea..4e23289efba4 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7537,62 +7537,6 @@ module_init(kswapd_init)
  */
 int node_reclaim_mode __read_mostly;
 
-/*
- * Percentage of pages in a zone that must be unmapped for node_reclaim to
- * occur.
- */
-int sysctl_min_unmapped_ratio = 1;
-
-/*
- * If the number of slab pages in a zone grows beyond this percentage then
- * slab reclaim needs to occur.
- */
-int sysctl_min_slab_ratio = 5;
-
-static inline unsigned long node_unmapped_file_pages(struct pglist_data *pgdat)
-{
-	unsigned long file_mapped = node_page_state(pgdat, NR_FILE_MAPPED);
-	unsigned long file_lru = node_page_state(pgdat, NR_INACTIVE_FILE) +
-		node_page_state(pgdat, NR_ACTIVE_FILE);
-
-	/*
-	 * It's possible for there to be more file mapped pages than
-	 * accounted for by the pages on the file LRU lists because
-	 * tmpfs pages accounted for as ANON can also be FILE_MAPPED
-	 */
-	return (file_lru > file_mapped) ? (file_lru - file_mapped) : 0;
-}
-
-/* Work out how many page cache pages we can reclaim in this reclaim_mode */
-static unsigned long node_pagecache_reclaimable(struct pglist_data *pgdat)
-{
-	unsigned long nr_pagecache_reclaimable;
-	unsigned long delta = 0;
-
-	/*
-	 * If RECLAIM_UNMAP is set, then all file pages are considered
-	 * potentially reclaimable. Otherwise, we have to worry about
-	 * pages like swapcache and node_unmapped_file_pages() provides
-	 * a better estimate
-	 */
-	if (node_reclaim_mode & RECLAIM_UNMAP)
-		nr_pagecache_reclaimable = node_page_state(pgdat, NR_FILE_PAGES);
-	else
-		nr_pagecache_reclaimable = node_unmapped_file_pages(pgdat);
-
-	/*
-	 * Since we can't clean folios through reclaim, remove dirty file
-	 * folios from consideration.
-	 */
-	delta += node_page_state(pgdat, NR_FILE_DIRTY);
-
-	/* Watch for any possible underflows due to delta */
-	if (unlikely(delta > nr_pagecache_reclaimable))
-		delta = nr_pagecache_reclaimable;
-
-	return nr_pagecache_reclaimable - delta;
-}
-
 /*
  * Try to free up some pages from this node through reclaim.
  */
@@ -7617,16 +7561,13 @@ static unsigned long __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask,
 	noreclaim_flag = memalloc_noreclaim_save();
 	set_task_reclaim_state(p, &sc->reclaim_state);
 
-	if (node_pagecache_reclaimable(pgdat) > pgdat->min_unmapped_pages ||
-	    node_page_state_pages(pgdat, NR_SLAB_RECLAIMABLE_B) > pgdat->min_slab_pages) {
-		/*
-		 * Free memory by calling shrink node with increasing
-		 * priorities until we have enough memory freed.
-		 */
-		do {
-			shrink_node(pgdat, sc);
-		} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
-	}
+	/*
+	 * Free memory by calling shrink node with increasing priorities until
+	 * we have enough memory freed.
+	 */
+	do {
+		shrink_node(pgdat, sc);
+	} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
 
 	set_task_reclaim_state(p, NULL);
 	memalloc_noreclaim_restore(noreclaim_flag);
-- 
2.47.3
