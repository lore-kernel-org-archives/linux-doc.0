Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C2B330B2B
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767904729; cv=none; b=VoxlkkeHTwfH145Yi0zf8carPTRr+abohB+4qoHP+DdbUM7BZjGQTV85isHHRRqfECmvYdVlq7Tbw9w825TMFIl5lfZTxovgstyUH4Nnbw2ZiuF1HTZmn5N7rmh5JXEJEC6ia6SF81eUI/vQ+jDg5/1fb9FSvfGq2OWKdBWl+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767904729; c=relaxed/simple;
	bh=qpZtiRNxcsJUu3AUTMQj3Awyi35/tyhY6J8Dqm1Quvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g2aNxnlMeOCFFyCHVr+QAVGd4NJjEaPX+vvhuhPJ0BuuNbpIK9RzN8mBcKr3Om0ah4nRNRr1DUB4gLGurrKMvz5qVlb3KDyyZaUvG7+sQxxVAcPCa/m9PHr/2hJ/ye8O8V0dyJ77cE9p4Pdhv5iWPZmkkURgrC1mnQDR5bBaI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HFFGtcTA; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HFFGtcTA"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88fe44cce7eso28999876d6.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 12:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1767904725; x=1768509525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nggVLtJRnFU0QDlUT0CWimedJUol/+KzTaLPJoqAtUY=;
        b=HFFGtcTApntHosngjgK334Z8upT+hEJe1YlSIUt7m+8s9IFnGpbISwACJYKGBM72qk
         nEB4sC1ThkYKzI724WdX1+NjcZFyzKKL5c+iITmvogIVkZz8Do4AACEMIorusnwlLyzR
         2Rhu0gDdyovYpb8+yqk0tVRTZppuJahTXfU3TAoTPS7/N3w7cahCJNocg73aFGtAASD9
         mzneFBdhddRVeZFQ6Cgy4IcfAz0WR/SBKwuHcByMwfpCOHOp18iKbEXUuKH4h5r475o2
         HD2lPSJY/heQNxrXS4Acwf7bvAqw1IDz2hcczyGJf9+lVP6TLA1JmKTmpRar5nCeSj47
         b01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767904725; x=1768509525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nggVLtJRnFU0QDlUT0CWimedJUol/+KzTaLPJoqAtUY=;
        b=vWSnTL5jY4fkKih+V2Dd2Mjy2wiCpgHuTcAmbLY2yWj7bDnkuuxvPHJhLtr93nx3TP
         6CCDLkY75A9NlZwdId6RzcxFeJfpO8zVnfgy9NrX9NrpCON4bD9TmmKi54x2qZE8wpaF
         0IFMZS0xP8fQ60v0funlwEPLSlnVY3UTFBxURuOzg9tLLE4rG9t3fH9Ep96lo42Iza7K
         S/shJaCZB1Mq96s+hjB6BGpQOx0+i6yc1CKpgLrygQSQCgiXeKdofw4IBRMAg8CqxO/8
         9Do7UBw4XvzMAzpZt4T3REvqo5auABQKSEk1Bs8npVzOXCm55C4CCPKoSPL0gpqRhVOi
         Zx2w==
X-Gm-Message-State: AOJu0Yyf54hgGRuEkeque15hku7mgzWzA8Gem8e2vDbaw79cCsIHbltl
	2rEWbPGQ7rJx8OXQGSfJKLfK6qb8EaQ0HCv9nYsLUfH7Fd+JHspOiMCNb9DJpRgMq/4=
X-Gm-Gg: AY/fxX6QvJVd4v16t4Wsc9ZAdNFgVv4r251rXfIFZJoGBU9j+1zabKJCfz/3Q1joE0Z
	/uXvI0gDpcxQnMXtBhVtJ3+YMBaL2k0X8uXK9Pbph6mVHTWzJJXluR5WsJPClrTY4LaOgr791SH
	JpFThTY3qNLap46ieTXExJ18oqDEsQwDTfKlaBO8Hrpx05LM6ui/SaeHP6nrtVO49ZizR0vKsLV
	RQFd3SOrQjQa/JbQvDuRu/ZcjEbfrFZyuLhVIDIUp4cv8kSh3+tiRtNSMncqEBsWqRR/B+i8xFt
	ZX0I1FVgneN2nWMuVABOIp4BasTJmOEW67doHBsrrIWCdJHbnLTSRG+XjwE84+b5NGBd1AALyOs
	hv7KSvOtLMoTrE4+/xPtg5CnxZ8Jcuun63W7QkP/u3rIiUDBrpiZTZcAc4M7vyIVau7hDslWXgD
	17fW91PjgQJJcAGHdEGdoCK3BlU8av1SNOSnE4lDOJElNzdnQmDRx5tMpANemZKBX0kXFtve0NC
	GQ=
X-Google-Smtp-Source: AGHT+IGGkUof/CU2/WL6ia65lx/hKwi6wIF+fNWN77FX8bbJUBtv8zQ3F0zWY/9RAxC3ckJGR4/xjQ==
X-Received: by 2002:a05:6214:e4f:b0:88a:52a1:2576 with SMTP id 6a1803df08f44-8908418394fmr114080716d6.1.1767904725150;
        Thu, 08 Jan 2026 12:38:45 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e472csm60483886d6.23.2026.01.08.12.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:38:44 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	longman@redhat.com,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	akpm@linux-foundation.org,
	vbabka@suse.cz,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	ziy@nvidia.com,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	rppt@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	chrisl@kernel.org,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	bhe@redhat.com,
	baohua@kernel.org,
	yosry.ahmed@linux.dev,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	osalvador@suse.de,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	cl@gentwo.org,
	harry.yoo@oracle.com,
	zhengqi.arch@bytedance.com
Subject: [RFC PATCH v3 2/8] mm: constify oom_control, scan_control, and alloc_context nodemask
Date: Thu,  8 Jan 2026 15:37:49 -0500
Message-ID: <20260108203755.1163107-3-gourry@gourry.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108203755.1163107-1-gourry@gourry.net>
References: <20260108203755.1163107-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nodemasks in these structures may come from a variety of sources,
including tasks and cpusets - and should never be modified by any code
when being passed around inside another context.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/cpuset.h | 4 ++--
 include/linux/mm.h     | 4 ++--
 include/linux/mmzone.h | 6 +++---
 include/linux/oom.h    | 2 +-
 include/linux/swap.h   | 2 +-
 kernel/cgroup/cpuset.c | 2 +-
 mm/internal.h          | 2 +-
 mm/mmzone.c            | 5 +++--
 mm/page_alloc.c        | 4 ++--
 mm/show_mem.c          | 9 ++++++---
 mm/vmscan.c            | 6 +++---
 11 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
index 631577384677..fe4f29624117 100644
--- a/include/linux/cpuset.h
+++ b/include/linux/cpuset.h
@@ -81,7 +81,7 @@ extern bool cpuset_cpu_is_isolated(int cpu);
 extern nodemask_t cpuset_mems_allowed(struct task_struct *p);
 #define cpuset_current_mems_allowed (current->mems_allowed)
 void cpuset_init_current_mems_allowed(void);
-int cpuset_nodemask_valid_mems_allowed(nodemask_t *nodemask);
+int cpuset_nodemask_valid_mems_allowed(const nodemask_t *nodemask);
 
 extern bool cpuset_current_node_allowed(int node, gfp_t gfp_mask);
 
@@ -226,7 +226,7 @@ static inline nodemask_t cpuset_mems_allowed(struct task_struct *p)
 #define cpuset_current_mems_allowed (node_states[N_MEMORY])
 static inline void cpuset_init_current_mems_allowed(void) {}
 
-static inline int cpuset_nodemask_valid_mems_allowed(nodemask_t *nodemask)
+static inline int cpuset_nodemask_valid_mems_allowed(const nodemask_t *nodemask)
 {
 	return 1;
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 45dfb2f2883c..dd4f5d49f638 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3572,7 +3572,7 @@ extern int __meminit early_pfn_to_nid(unsigned long pfn);
 extern void mem_init(void);
 extern void __init mmap_init(void);
 
-extern void __show_mem(unsigned int flags, nodemask_t *nodemask, int max_zone_idx);
+extern void __show_mem(unsigned int flags, const nodemask_t *nodemask, int max_zone_idx);
 static inline void show_mem(void)
 {
 	__show_mem(0, NULL, MAX_NR_ZONES - 1);
@@ -3582,7 +3582,7 @@ extern void si_meminfo(struct sysinfo * val);
 extern void si_meminfo_node(struct sysinfo *val, int nid);
 
 extern __printf(3, 4)
-void warn_alloc(gfp_t gfp_mask, nodemask_t *nodemask, const char *fmt, ...);
+void warn_alloc(gfp_t gfp_mask, const nodemask_t *nodemask, const char *fmt, ...);
 
 extern void setup_per_cpu_pageset(void);
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6a7db0fee54a..7f94d67ffac4 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1721,7 +1721,7 @@ static inline int zonelist_node_idx(const struct zoneref *zoneref)
 
 struct zoneref *__next_zones_zonelist(struct zoneref *z,
 					enum zone_type highest_zoneidx,
-					nodemask_t *nodes);
+					const nodemask_t *nodes);
 
 /**
  * next_zones_zonelist - Returns the next zone at or below highest_zoneidx within the allowed nodemask using a cursor within a zonelist as a starting point
@@ -1740,7 +1740,7 @@ struct zoneref *__next_zones_zonelist(struct zoneref *z,
  */
 static __always_inline struct zoneref *next_zones_zonelist(struct zoneref *z,
 					enum zone_type highest_zoneidx,
-					nodemask_t *nodes)
+					const nodemask_t *nodes)
 {
 	if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
 		return z;
@@ -1766,7 +1766,7 @@ static __always_inline struct zoneref *next_zones_zonelist(struct zoneref *z,
  */
 static inline struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
 					enum zone_type highest_zoneidx,
-					nodemask_t *nodes)
+					const nodemask_t *nodes)
 {
 	return next_zones_zonelist(zonelist->_zonerefs,
 							highest_zoneidx, nodes);
diff --git a/include/linux/oom.h b/include/linux/oom.h
index 7b02bc1d0a7e..00da05d227e6 100644
--- a/include/linux/oom.h
+++ b/include/linux/oom.h
@@ -30,7 +30,7 @@ struct oom_control {
 	struct zonelist *zonelist;
 
 	/* Used to determine mempolicy */
-	nodemask_t *nodemask;
+	const nodemask_t *nodemask;
 
 	/* Memory cgroup in which oom is invoked, or NULL for global oom */
 	struct mem_cgroup *memcg;
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 62fc7499b408..1569f3f4773b 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -370,7 +370,7 @@ extern void swap_setup(void);
 /* linux/mm/vmscan.c */
 extern unsigned long zone_reclaimable_pages(struct zone *zone);
 extern unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-					gfp_t gfp_mask, nodemask_t *mask);
+					gfp_t gfp_mask, const nodemask_t *mask);
 
 #define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
 #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 289fb1a72550..a3ade9d5968b 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4326,7 +4326,7 @@ nodemask_t cpuset_mems_allowed(struct task_struct *tsk)
  *
  * Are any of the nodes in the nodemask allowed in current->mems_allowed?
  */
-int cpuset_nodemask_valid_mems_allowed(nodemask_t *nodemask)
+int cpuset_nodemask_valid_mems_allowed(const nodemask_t *nodemask)
 {
 	return nodes_intersects(*nodemask, current->mems_allowed);
 }
diff --git a/mm/internal.h b/mm/internal.h
index 6dc83c243120..50d32055b544 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -587,7 +587,7 @@ void page_alloc_sysctl_init(void);
  */
 struct alloc_context {
 	struct zonelist *zonelist;
-	nodemask_t *nodemask;
+	const nodemask_t *nodemask;
 	struct zoneref *preferred_zoneref;
 	int migratetype;
 
diff --git a/mm/mmzone.c b/mm/mmzone.c
index 0c8f181d9d50..59dc3f2076a6 100644
--- a/mm/mmzone.c
+++ b/mm/mmzone.c
@@ -43,7 +43,8 @@ struct zone *next_zone(struct zone *zone)
 	return zone;
 }
 
-static inline int zref_in_nodemask(struct zoneref *zref, nodemask_t *nodes)
+static inline int zref_in_nodemask(struct zoneref *zref,
+				   const nodemask_t *nodes)
 {
 #ifdef CONFIG_NUMA
 	return node_isset(zonelist_node_idx(zref), *nodes);
@@ -55,7 +56,7 @@ static inline int zref_in_nodemask(struct zoneref *zref, nodemask_t *nodes)
 /* Returns the next zone at or below highest_zoneidx in a zonelist */
 struct zoneref *__next_zones_zonelist(struct zoneref *z,
 					enum zone_type highest_zoneidx,
-					nodemask_t *nodes)
+					const nodemask_t *nodes)
 {
 	/*
 	 * Find the next suitable zone to use for the allocation.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ecb2646b57ba..bb89d81aa68c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3988,7 +3988,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 	return NULL;
 }
 
-static void warn_alloc_show_mem(gfp_t gfp_mask, nodemask_t *nodemask)
+static void warn_alloc_show_mem(gfp_t gfp_mask, const nodemask_t *nodemask)
 {
 	unsigned int filter = SHOW_MEM_FILTER_NODES;
 
@@ -4008,7 +4008,7 @@ static void warn_alloc_show_mem(gfp_t gfp_mask, nodemask_t *nodemask)
 	mem_cgroup_show_protected_memory(NULL);
 }
 
-void warn_alloc(gfp_t gfp_mask, nodemask_t *nodemask, const char *fmt, ...)
+void warn_alloc(gfp_t gfp_mask, const nodemask_t *nodemask, const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list args;
diff --git a/mm/show_mem.c b/mm/show_mem.c
index 3a4b5207635d..24685b5c6dcf 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -116,7 +116,8 @@ void si_meminfo_node(struct sysinfo *val, int nid)
  * Determine whether the node should be displayed or not, depending on whether
  * SHOW_MEM_FILTER_NODES was passed to show_free_areas().
  */
-static bool show_mem_node_skip(unsigned int flags, int nid, nodemask_t *nodemask)
+static bool show_mem_node_skip(unsigned int flags, int nid,
+			       const nodemask_t *nodemask)
 {
 	if (!(flags & SHOW_MEM_FILTER_NODES))
 		return false;
@@ -177,7 +178,8 @@ static bool node_has_managed_zones(pg_data_t *pgdat, int max_zone_idx)
  * SHOW_MEM_FILTER_NODES: suppress nodes that are not allowed by current's
  *   cpuset.
  */
-static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
+static void show_free_areas(unsigned int filter, const nodemask_t *nodemask,
+			    int max_zone_idx)
 {
 	unsigned long free_pcp = 0;
 	int cpu, nid;
@@ -399,7 +401,8 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
 	show_swap_cache_info();
 }
 
-void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
+void __show_mem(unsigned int filter, const nodemask_t *nodemask,
+		int max_zone_idx)
 {
 	unsigned long total = 0, reserved = 0, highmem = 0;
 	struct zone *zone;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7c962ee7819f..23f68e754738 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -80,7 +80,7 @@ struct scan_control {
 	 * Nodemask of nodes allowed by the caller. If NULL, all nodes
 	 * are scanned.
 	 */
-	nodemask_t	*nodemask;
+	const nodemask_t *nodemask;
 
 	/*
 	 * The memory cgroup that hit its limit and as a result is the
@@ -6502,7 +6502,7 @@ static bool allow_direct_reclaim(pg_data_t *pgdat)
  * happens, the page allocator should not consider triggering the OOM killer.
  */
 static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
-					nodemask_t *nodemask)
+				    const nodemask_t *nodemask)
 {
 	struct zoneref *z;
 	struct zone *zone;
@@ -6582,7 +6582,7 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
 }
 
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-				gfp_t gfp_mask, nodemask_t *nodemask)
+				gfp_t gfp_mask, const nodemask_t *nodemask)
 {
 	unsigned long nr_reclaimed;
 	struct scan_control sc = {
-- 
2.52.0

