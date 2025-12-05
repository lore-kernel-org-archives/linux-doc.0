Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D5825EFBE
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764977546; cv=none; b=BNterZsPeVUNp9DCwjatbMjgbLFIuB3BHWU+dcfcviuH6LAiRYDASpXiIka9WbIosmAdDEHR3NuPTwlue/2Ss0eaaUaGuLdh9GZYoaJdZrXVKP5dfpVa5/1cqi8hBYJzTFf6AuDyIhPnRiMQtIaWMFOiq+5ftNiJd2GtyxOZLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764977546; c=relaxed/simple;
	bh=KuUawxiE1obehEPGbhCYaTrHUXmJuSPQ8BYWNOFalcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0/8913YJ9xa0YijrdBwealB1GbHoZ3ejRzynz0vK9+vmkCJwFbfyMDlFMHF7/nYX05i0SzvD+Sna7U+femktmxJC/f1fNgk/5Q0P4kkptDlO3CwtCnV/oStdKamyBz0HRJY7sCGKf4imIrMAym2jLuA64hig4Ic7FWTTl07bzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAjlkpCg; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAjlkpCg"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6420c08f886so3073705d50.3
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 15:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764977543; x=1765582343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1bp6D5JTy++9hCcdnJaW8sAeu8MFN04EOXKBwVmfQY=;
        b=GAjlkpCgl53oP5Kr1SdvOOXyJEn3bggCypZRetDJFvOQn1q/Xza0KDSifO1PBZ9QaI
         menb3jQ1X+tCYWKimXiafHb5ULFXRes1SJPthodcAO2K6smZI88C0E/jj42TaikLI8w+
         xfkx+ThfsAIQ5deNCZK134OiwbCXEfO1cHbS16C+izrM5cMcQGAN+Hj4MgTh2rD2zxk1
         A3l0cy6t0wJYCBriAifTdBrlI1CRJFbZjO22AaCgwtl80nbQl3MZkn0JJWGjr+LMww/T
         s4lA67hWWexwOi2RNWxxlKGd0Yzjd3kotLceJ5hwgYTAkuQQVNRtVHSOmkAe9JfDvsYu
         PSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764977543; x=1765582343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1bp6D5JTy++9hCcdnJaW8sAeu8MFN04EOXKBwVmfQY=;
        b=rR0bEp8ii/x/Z4BCXK2kAinA/FuPfuIDryey2oSG8qWBuQ36tPWsocZ6WsspaxTzI8
         SHkKNz1M8lLs2udMulTswDb2Ar7WNnwsrnnk/FBZHQ0tOFLSn6CuhrwkL55010TtGE9h
         bjTJRUumt22o1PrCbf15Ab3Ebfbwrqp90zMLGRes6CyfC9nx5IS7RIyA/Wc3RZzNoWPn
         ViProq1yzFx3vIzbrx28u+bZU4uHIZxpd3p+ORbp5s9OGl6Lfm5NXfJF/zOcITS/PeXI
         FLSFqdM1OfogzG3tBjdUMi7GpCkuT35L/qeMoiiji1jzwPyZOhE+QVoXvMvZ2/y6OLsb
         lTHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKa1pcorY7uCQKPKh+PAHzKJb8qV0rqrqQf+a4Xiqa17bp7Fc1hbZzmk1JH1et0GnzcyJXAPWh/k4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8mbPAEYHH/oE+lHJ6oTePY9pSMIkJYcLhGaAlkdbgTPRmpXy
	lIMS5v6VKkN5B0hx8Rw5JAaYL7/0QZkzqg4A9rZLo4B95smW5b8opuRm
X-Gm-Gg: ASbGncty3wmu+/MRajClCEYPkaClL4WeizO4CGY9k+n9AQjL3uCuQKL4hEHWp6RnwS5
	jcF4OWfVffeC9HVkgUZ4ANN66dnbtbkgJ5K7cmXo4G8HpJcJwHGaD3kDFoLeznhLQNFAeIBE3dm
	x51rtKmoMwrnvwoQvsJtycVLdT+VaS0vEol+AfggF/Zmb0BPKw/lhSGyTGW2U/o54uW4jPg3DqE
	2FiQxUzJnTB4Da3V+1GVrzGJXoJ7xfUfP0vV2SX8LU9o9ecd2yAcAaxxvic5y2Hnp0WAXH2bv+z
	U8Qn/D9Cy1g6BZbUBl+g6fbS+f2QmkTCkb3rXMt8HAe8uXfQYntHtIdCFsqP8sFkbonmTBiGY24
	7cEhAczrs5APd3+2GebqTxm3KN+I4DWC0C/ba8Nk83whEQCeoY6T8oy+2kV5UE+gn4XXtdE4iZD
	ewi9AttRJbUmtECuF9lncLeA==
X-Google-Smtp-Source: AGHT+IHuiF3W+0+y+RHRuFqEDswx1eZLikuL04SAxFeBYl2SfNCvqWtSQJuYZ+6A9jLmPwXhNw08/g==
X-Received: by 2002:a05:690e:2554:b0:641:f5bc:68e5 with SMTP id 956f58d0204a3-6444e804d45mr461456d50.82.1764977543310;
        Fri, 05 Dec 2025 15:32:23 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:4c::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f2b80casm2356687d50.9.2025.12.05.15.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 15:32:22 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: 
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Brendan Jackman <jackmanb@google.com>,
	Byungchul Park <byungchul@sk.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Hildenbrand <david@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wei Xu <weixugc@google.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC LPC2025 PATCH 4/4] mm/vmscan: Deprecate zone_reclaim_mode
Date: Fri,  5 Dec 2025 15:32:15 -0800
Message-ID: <20251205233217.3344186-5-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205233217.3344186-1-joshua.hahnjy@gmail.com>
References: <20251205233217.3344186-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zone_reclaim_mode was introduced in 2005 to work around the NUMA
penalties associated with allocating memory on remote nodes. It changed
the page allocator's behavior to prefer stalling and performing direct
reclaim locally over allocating on a remote node.

In 2014, zone_reclaim_mode was disabled by default, as it was deemed as
unsuitable for most workloads [1]. Since then, and especially since
2005, a lot has changed. NUMA penalties are lower than they used to
before, and we now have much more extensive infrastructure to control
NUMA spillage (NUMA balancing, memory.reclaim, tiering / promotion /
demotion). Together, these changes make remote memory access a much more
appealing alternative compared to stalling the system, when there might
be free memory in other nodes.

This is not to say that there are no workloads that perform better with
NUMA locality. However, zone_reclaim_mode is a system-wide setting that
makes this bet for all running workloads on the machine. Today, we have
many more alternatives that can provide more fine-grained control over
allocation strategy, such as mbind or set_mempolicy.

Deprecate zone_reclaim_mode in favor of modern alternatives, such as
NUMA balancing, membinding, and promotion/demotion mechanisms. This
improves code readability and maintainability, especially in the page
allocation code.

[1] Commit 4f9b16a64753 ("mm: disable zone_reclaim_mode by default")

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 41 -------------------------
 arch/powerpc/include/asm/topology.h     |  4 ---
 include/linux/topology.h                |  6 ----
 include/uapi/linux/mempolicy.h          | 14 ---------
 mm/internal.h                           | 11 -------
 mm/page_alloc.c                         |  4 +--
 mm/vmscan.c                             | 18 -----------
 7 files changed, 2 insertions(+), 96 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index ea2fd3feb9c6..635b16c1867e 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -76,7 +76,6 @@ Currently, these files are in /proc/sys/vm:
 - vfs_cache_pressure_denom
 - watermark_boost_factor
 - watermark_scale_factor
-- zone_reclaim_mode
 
 
 admin_reserve_kbytes
@@ -1046,43 +1045,3 @@ going to sleep prematurely (kswapd_low_wmark_hit_quickly) can indicate
 that the number of free pages kswapd maintains for latency reasons is
 too small for the allocation bursts occurring in the system. This knob
 can then be used to tune kswapd aggressiveness accordingly.
-
-
-zone_reclaim_mode
-=================
-
-Zone_reclaim_mode allows someone to set more or less aggressive approaches to
-reclaim memory when a zone runs out of memory. If it is set to zero then no
-zone reclaim occurs. Allocations will be satisfied from other zones / nodes
-in the system.
-
-This is value OR'ed together of
-
-=	===================================
-1	Zone reclaim on
-2	Zone reclaim writes dirty pages out
-4	Zone reclaim swaps pages
-=	===================================
-
-zone_reclaim_mode is disabled by default.  For file servers or workloads
-that benefit from having their data cached, zone_reclaim_mode should be
-left disabled as the caching effect is likely to be more important than
-data locality.
-
-Consider enabling one or more zone_reclaim mode bits if it's known that the
-workload is partitioned such that each partition fits within a NUMA node
-and that accessing remote memory would cause a measurable performance
-reduction.  The page allocator will take additional actions before
-allocating off node pages.
-
-Allowing zone reclaim to write out pages stops processes that are
-writing large amounts of data from dirtying pages on other nodes. Zone
-reclaim will write out dirty pages if a zone fills up and so effectively
-throttle the process. This may decrease the performance of a single process
-since it cannot use all of system memory to buffer the outgoing writes
-anymore but it preserve the memory on other nodes so that the performance
-of other processes running on other nodes will not be affected.
-
-Allowing regular swap effectively restricts allocations to the local
-node unless explicitly overridden by memory policies or cpuset
-configurations.
diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f19ca44512d1..49015b2b0d8d 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -10,10 +10,6 @@ struct drmem_lmb;
 
 #ifdef CONFIG_NUMA
 
-/*
- * If zone_reclaim_mode is enabled, a RECLAIM_DISTANCE of 10 will mean that
- * all zones on all nodes will be eligible for zone_reclaim().
- */
 #define RECLAIM_DISTANCE 10
 
 #include <asm/mmzone.h>
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 6575af39fd10..37018264ca1e 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -50,12 +50,6 @@ int arch_update_cpu_topology(void);
 #define node_distance(from,to)	((from) == (to) ? LOCAL_DISTANCE : REMOTE_DISTANCE)
 #endif
 #ifndef RECLAIM_DISTANCE
-/*
- * If the distance between nodes in a system is larger than RECLAIM_DISTANCE
- * (in whatever arch specific measurement units returned by node_distance())
- * and node_reclaim_mode is enabled then the VM will only call node_reclaim()
- * on nodes within this distance.
- */
 #define RECLAIM_DISTANCE 30
 #endif
 
diff --git a/include/uapi/linux/mempolicy.h b/include/uapi/linux/mempolicy.h
index 8fbbe613611a..194f922dad9b 100644
--- a/include/uapi/linux/mempolicy.h
+++ b/include/uapi/linux/mempolicy.h
@@ -65,18 +65,4 @@ enum {
 #define MPOL_F_MOF	(1 << 3) /* this policy wants migrate on fault */
 #define MPOL_F_MORON	(1 << 4) /* Migrate On protnone Reference On Node */
 
-/*
- * Enabling zone reclaim means the page allocator will attempt to fulfill
- * the allocation request on the current node by triggering reclaim and
- * trying to shrink the current node.
- * Fallback allocations on the next candidates in the zonelist are considered
- * when reclaim fails to free up enough memory in the current node/zone.
- *
- * These bit locations are exposed in the vm.zone_reclaim_mode sysctl.
- * New bits are OK, but existing bits should not be changed.
- */
-#define RECLAIM_ZONE	(1<<0)	/* Enable zone reclaim */
-#define RECLAIM_WRITE	(1<<1)	/* Writeout pages during reclaim */
-#define RECLAIM_UNMAP	(1<<2)	/* Unmap pages during reclaim */
-
 #endif /* _UAPI_LINUX_MEMPOLICY_H */
diff --git a/mm/internal.h b/mm/internal.h
index 743fcebe53a8..a2df0bf3f458 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1197,24 +1197,13 @@ static inline void mminit_verify_zonelist(void)
 #endif /* CONFIG_DEBUG_MEMORY_INIT */
 
 #ifdef CONFIG_NUMA
-extern int node_reclaim_mode;
-
 extern int find_next_best_node(int node, nodemask_t *used_node_mask);
 #else
-#define node_reclaim_mode 0
-
 static inline int find_next_best_node(int node, nodemask_t *used_node_mask)
 {
 	return NUMA_NO_NODE;
 }
 #endif
-
-static inline bool node_reclaim_enabled(void)
-{
-	/* Is any node_reclaim_mode bit set? */
-	return node_reclaim_mode & (RECLAIM_ZONE|RECLAIM_WRITE|RECLAIM_UNMAP);
-}
-
 /*
  * mm/memory-failure.c
  */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9524713c81b7..bf4faec4ebe6 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3823,8 +3823,8 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		 * If kswapd is already active on a node, keep looking
 		 * for other nodes that might be idle. This can happen
 		 * if another process has NUMA bindings and is causing
-		 * kswapd wakeups on only some nodes. Avoid accidental
-		 * "node_reclaim_mode"-like behavior in this case.
+		 * kswapd wakeups on only some nodes. Avoid accidentally
+		 * overpressuring the local node when remote nodes are free.
 		 */
 		if (skip_kswapd_nodes &&
 		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4e23289efba4..f480a395df65 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7503,16 +7503,6 @@ static const struct ctl_table vmscan_sysctl_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_TWO_HUNDRED,
 	},
-#ifdef CONFIG_NUMA
-	{
-		.procname	= "zone_reclaim_mode",
-		.data		= &node_reclaim_mode,
-		.maxlen		= sizeof(node_reclaim_mode),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-	}
-#endif
 };
 
 static int __init kswapd_init(void)
@@ -7529,14 +7519,6 @@ static int __init kswapd_init(void)
 module_init(kswapd_init)
 
 #ifdef CONFIG_NUMA
-/*
- * Node reclaim mode
- *
- * If non-zero call node_reclaim when the number of free pages falls below
- * the watermarks.
- */
-int node_reclaim_mode __read_mostly;
-
 /*
  * Try to free up some pages from this node through reclaim.
  */
-- 
2.47.3
