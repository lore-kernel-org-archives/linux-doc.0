Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162FE44E055
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671986; cv=none; b=CU/nmNV/x/InvEoi7CmCMXrCDty7nNggoBTSuRXV4gWrvh3kEtJ+Vap0ksVQgBzHRyfEzYalRMGwrhXwgXKymZFBpaKzXaBIpz5KO8J3rbiulMoAc+mKRbbhedi35Fis2v7dUC9VDyNUUfpDiMnewzttMY8RjtCe0v3AsoVtzlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671986; c=relaxed/simple;
	bh=nDSTRjBO6H+M0nB3bfo7Tt9POfOY5EN48fG/RNTOvO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nc9KRHKGRT1Eg6UjqRbLK1kO+1NJvhEE8iZntp6YRx+w/iJQSEZtcM76yjdGfVA8g08GA2UHgOdfG0XC+cVP3PI92X6RFOoQhi69F+D67WcDN8Dv8lztM+UfBhkp1tgzjkmBoI7I1hSpUnJUV3pcBsDbR+yETPDGa4LwLIe0hcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU8bPhZo; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU8bPhZo"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44aeefa1c00so1173318fac.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787671977; x=1788276777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+G2HY1nMuhTy8GReU5FQmdFCwNyu4BLzojPY+0AOwU=;
        b=lU8bPhZoAnQ520vS9cRFOrNTx219eDjaXHH9twsqSfxVw93X6hug5TKlAiDEGyyRUk
         WcMNFZQtuxbuLiNO6ONDPTY4DRBKiI6tShv5N0B6I3SOBmOwa1rwbGFc6zx6fA/zu98N
         sJfjaGWHtLHkyXzSm9euZQpZrUFDM6/HStbHUBofioLIe4WCh+1IjjWLQ0cJl1XuUSEb
         PXhRNFVuFBlM011JhEg6AoHxbOwCfLmfGTZ/m6/sijXRxG2290+ERZVF1GQvRym+1OK3
         nnTDolMFHHofj2BpR7S/rC6cHsIu/M7wMAdC0MlyAtI1kmszb7byRx8n4R/5bsGFvTNN
         u9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787671977; x=1788276777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+G2HY1nMuhTy8GReU5FQmdFCwNyu4BLzojPY+0AOwU=;
        b=tIZvXL7DEhjt06GbR5Om3Jk2nJrvs2gm21g96w3SrK6HNSxOBj1lnhsEUq4K8pQsRc
         6KM1OjsvARaLfn2L845lmTfI8y0NWDQcu5HZRUAUDLrU2xN5FOaG1Oi2GaoAfU3TnQM2
         U2ZBun0TG6Up7UTc7TqqvgrNlqLeX4dFpu+4yCPK/9Cg71ohkwbyOfN8IDeAclfGDUqJ
         kDOu0hEgDIOVk6WVJ/MJRn08VEKMByqipmjmnJGeh0HF52QR9iwZ3VAtJaPbKrLIVxFJ
         YkxSv141POIr/MBzznrN7MiflOF6AB2bMv75I4YMpmF1xtgqrvK+QqlgLFFrzXoeOMHg
         5BEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpizk7ilyB30dG+jlqr2vevlkneASLQpiVDGnxOC5SN2vV0XtEi3/7F9DLBLqMNem8Jx+rB01k3LYc=@vger.kernel.org
X-Gm-Message-State: AFuF++nXMNHkLmx2tZLxR/7I04I2bQ/Z/f3/pVy7mm4tYagoPSjoQmHM
	GYg2q7YQ9LW14SEGBgNLjGyW9tyaEwwWcmNxIblvmaWYm5c1pkW824Zk
X-Gm-Gg: AR+sD10BKekVpcI743jkAj5ZMW75irlVHzc4CRJdm5s6NywdQvCao8DYyBYRageJx72
	HfT9segeLmWSYxt0ORuJQdAOIOWIb/zAki+l2btaUT8xKM95JrbyvO8dAv7oLcW4RfH+HOHU4wQ
	w9PWtHrsw2eWVPl+UM+hyOsTjonHRfc39EVN1Fx9KUgZ1lP7o3tG3o5EaLp45LboLJYmRvS3cAM
	B7TczVySqv9MgCLaNNB+RtaXizBX8Qb7osOILmO3/6kSQsBUEebnDjFTSFzGh8hVpDtHSNelIMh
	vmGI16P0tqU6AN+GQDBEv71vNa6SvQnBVcZ7FUBNC1LKu6hzVeOFBoR2zl6a9lImjGs9BMIYYE2
	LKbPXfwrjDu5OsKykB0K0sD7JZFKjOpPYWpPo2sP9BIGn7wAOmpGH/DkMk1UqPk/9Y3EMB3nNC4
	EUk5v8jEnxCCSsONgTduNMxAmDqfo7OE0pM0/nAQwQhqQtaf68NmexSp/pvPBIo9BfLTtslpyvR
	DDbKIQhgw==
X-Received: by 2002:a05:6871:d607:b0:451:fbeb:e9a6 with SMTP id 586e51a60fabf-464443cbc91mr6041524fac.0.1787671977026;
        Tue, 25 Aug 2026 08:32:57 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:2::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463831397bbsm7562679fac.4.2026.08.25.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:32:56 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosry@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	riel@surriel.com,
	gourry@gourry.net,
	haowenchao22@gmail.com,
	corbet@lwn.net,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v4 10/11] mm, swap: defer memcg_table allocation for physical swap clusters
Date: Tue, 25 Aug 2026 08:32:36 -0700
Message-ID: <20260825153238.2695446-11-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825153238.2695446-1-nphamcs@gmail.com>
References: <20260825153238.2695446-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop allocating a memcg table for every physical swap cluster that only
ever holds vswap backings. The table costs SWAPFILE_CLUSTER *
sizeof(unsigned short) per cluster, 1 KB per 2 MB of swap on a 64-bit
kernel with 4 KB pages. On a vswap-heavy workload, where zswap writeback
is the only consumer of physical swap, that is the common case.

Such clusters never have their memcg_table read or written: vswap-layer
charging records on the vswap cluster's table, not the physical one.

Allocate eagerly only where the table is known to be needed: every
vswap cluster, and, when vswap is off, every physical cluster, since
all of its slots then map directly into the PTEs. A physical cluster
otherwise allocates on its first direct-use slot, and skips entirely
if it only holds vswap backings. That deferred allocation can fail,
though rarely.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 85 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 3b10173cddc3..8c80544a7d25 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -471,7 +471,8 @@ static void swap_cluster_free_table(struct swap_cluster_info *ci)
 		 swap_cluster_free_table_folio_rcu_cb);
 }
 
-static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
+static int swap_cluster_alloc_table(struct swap_info_struct *si,
+				    struct swap_cluster_info *ci, gfp_t gfp)
 {
 	struct swap_table *table = NULL;
 	struct folio *folio;
@@ -494,7 +495,14 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
 	rcu_assign_pointer(ci->table, table);
 
 #ifdef CONFIG_MEMCG
-	if (!mem_cgroup_disabled()) {
+	/*
+	 * A physical cluster under vswap may hold only vswap backings, which
+	 * record their memcg on the vswap cluster's table, not this one. Such
+	 * clusters defer memcg_table allocation until they hand out a slot
+	 * that maps directly into the PTEs.
+	 */
+	if ((!vswap_is_enabled() || swap_is_vswap(si)) &&
+	    !mem_cgroup_disabled()) {
 		VM_WARN_ON_ONCE(ci->memcg_table);
 		ci->memcg_table = kzalloc_obj(*ci->memcg_table, gfp);
 		if (!ci->memcg_table) {
@@ -565,8 +573,8 @@ swap_cluster_populate(struct swap_info_struct *si,
 		lockdep_assert_held(&si->global_cluster_lock);
 	lockdep_assert_held(&ci->lock);
 
-	if (!swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					  __GFP_NOWARN))
+	if (!swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
+					      __GFP_NOWARN))
 		return ci;
 
 	/*
@@ -579,8 +587,8 @@ swap_cluster_populate(struct swap_info_struct *si,
 		spin_unlock(&si->global_cluster_lock);
 	local_unlock(&percpu_swap_cluster.lock);
 
-	ret = swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					   GFP_KERNEL);
+	ret = swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
+					       GFP_KERNEL);
 
 	/*
 	 * Back to atomic context. We might have migrated to a new CPU with a
@@ -857,7 +865,7 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 
 	ci = cluster_info + idx;
 	/* Need to allocate swap table first for initial bad slot marking. */
-	if (!ci->count && swap_cluster_alloc_table(ci, GFP_KERNEL))
+	if (!ci->count && swap_cluster_alloc_table(si, ci, GFP_KERNEL))
 		return -ENOMEM;
 	spin_lock(&ci->lock);
 	/* Check for duplicated bad swap slots. */
@@ -1079,7 +1087,9 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 /* Try use a new cluster for current CPU and allocate from it. */
 static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 					    struct swap_cluster_info *ci,
-					    struct folio *folio, unsigned long offset)
+					    struct folio *folio,
+					    unsigned long offset,
+					    bool *nomem)
 {
 	unsigned int next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 	unsigned long start = ALIGN_DOWN(offset, SWAPFILE_CLUSTER);
@@ -1108,6 +1118,24 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 			if (!ret)
 				continue;
 		}
+#ifdef CONFIG_MEMCG
+		/*
+		 * Lazy-allocate memcg_table on the first direct-use slot of a
+		 * physical cluster.
+		 */
+		if (vswap_is_enabled() && folio &&
+		    !folio_test_swapcache(folio) && !mem_cgroup_disabled() &&
+		    !ci->memcg_table) {
+			ci->memcg_table = kzalloc_obj(*ci->memcg_table,
+						      GFP_ATOMIC | __GFP_NOMEMALLOC |
+						      __GFP_NOWARN);
+			if (!ci->memcg_table) {
+				if (nomem)
+					*nomem = true;
+				goto out;
+			}
+		}
+#endif
 		if (!__swap_cluster_alloc_entries(si, ci, folio, offset % SWAPFILE_CLUSTER))
 			break;
 		found = offset;
@@ -1117,7 +1145,15 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 		break;
 	}
 out:
-	relocate_cluster(si, ci);
+	/*
+	 * On a discard-capable device, relocating a cluster whose memcg_table
+	 * allocation failed queues a discard for slots that were never used,
+	 * which folio_alloc_phys_swap() reads as progress and retries on.
+	 */
+	if (nomem && *nomem && !ci->count)
+		__free_cluster(si, ci);
+	else
+		relocate_cluster(si, ci);
 	swap_cluster_unlock(ci);
 	if (swap_is_vswap(si)) {
 		this_cpu_write(percpu_vswap_cluster.offset[order], next);
@@ -1138,7 +1174,13 @@ static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
 					 bool scan_all)
 {
 	unsigned int found = SWAP_ENTRY_INVALID;
+	bool nomem = false;
 
+	/*
+	 * In rare cases alloc_swap_scan_cluster() can fail due to
+	 * memcg_table allocation failure. Short-circuit to avoid looping
+	 * over the list indefinitely.
+	 */
 	do {
 		struct swap_cluster_info *ci = isolate_lock_cluster(si, list);
 		unsigned long offset;
@@ -1146,10 +1188,10 @@ static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
 		if (!ci)
 			break;
 		offset = cluster_offset(si, ci);
-		found = alloc_swap_scan_cluster(si, ci, folio, offset);
+		found = alloc_swap_scan_cluster(si, ci, folio, offset, &nomem);
 		if (found)
 			break;
-	} while (scan_all);
+	} while (scan_all && !nomem);
 
 	return found;
 }
@@ -1170,7 +1212,7 @@ static unsigned int vswap_alloc_cluster(struct swap_info_struct *si,
 	spin_lock_init(&ci_dyn->ci.lock);
 	INIT_LIST_HEAD(&ci_dyn->ci.list);
 
-	if (swap_cluster_alloc_table(&ci_dyn->ci, GFP_ATOMIC)) {
+	if (swap_cluster_alloc_table(si, &ci_dyn->ci, GFP_ATOMIC)) {
 		kfree(ci_dyn);
 		return SWAP_ENTRY_INVALID;
 	}
@@ -1196,7 +1238,7 @@ static unsigned int vswap_alloc_cluster(struct swap_info_struct *si,
 	}
 
 	offset = cluster_offset(si, ci);
-	return alloc_swap_scan_cluster(si, ci, folio, offset);
+	return alloc_swap_scan_cluster(si, ci, folio, offset, NULL);
 }
 
 static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
@@ -1303,7 +1345,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		if (cluster_is_usable(ci, order)) {
 			if (cluster_is_empty(ci))
 				offset = cluster_offset(si, ci);
-			found = alloc_swap_scan_cluster(si, ci, folio, offset);
+			found = alloc_swap_scan_cluster(si, ci, folio, offset,
+							NULL);
 		} else {
 			swap_cluster_unlock(ci);
 		}
@@ -1347,7 +1390,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order < PMD_ORDER) {
 		/*
 		 * Scan only one fragment cluster is good enough. Order 0
-		 * allocation will surely success, and large allocation
+		 * allocation will surely success unless the memcg table
+		 * allocation fails, which is rare, and large allocation
 		 * failure is not critical. Scanning one cluster still
 		 * keeps the list rotated and reclaimed (for clean swap cache).
 		 */
@@ -1363,7 +1407,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	for (int o = 1; o < SWAP_NR_ORDERS; o++) {
 		/*
 		 * Clusters here have at least one usable slots and can't fail order 0
-		 * allocation, but reclaim may drop si->lock and race with another user.
+		 * allocation, but reclaim may drop si->lock and race with another user,
+		 * and the memcg table allocation may fail.
 		 */
 		found = alloc_swap_scan_list(si, &si->frag_clusters[o], folio, true);
 		if (found)
@@ -1586,7 +1631,7 @@ static swp_entry_t swap_alloc_fast(struct folio *folio)
 	if (ci && cluster_is_usable(ci, order)) {
 		if (cluster_is_empty(ci))
 			offset = cluster_offset(si, ci);
-		found = alloc_swap_scan_cluster(si, ci, folio, offset);
+		found = alloc_swap_scan_cluster(si, ci, folio, offset, NULL);
 	} else if (ci) {
 		swap_cluster_unlock(ci);
 	}
@@ -1969,7 +2014,8 @@ static bool vswap_alloc(struct folio *folio)
 		if (ci && cluster_is_usable(ci, order)) {
 			if (cluster_is_empty(ci))
 				offset = cluster_offset(vswap_si, ci);
-			alloc_swap_scan_cluster(vswap_si, ci, folio, offset);
+			alloc_swap_scan_cluster(vswap_si, ci, folio, offset,
+						NULL);
 		} else if (ci) {
 			swap_cluster_unlock(ci);
 		}
@@ -2836,7 +2882,8 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
 	if (pcp_si == si && pcp_offset) {
 		ci = swap_cluster_lock(si, pcp_offset);
 		if (cluster_is_usable(ci, 0))
-			offset = alloc_swap_scan_cluster(si, ci, NULL, pcp_offset);
+			offset = alloc_swap_scan_cluster(si, ci, NULL,
+							 pcp_offset, NULL);
 		else
 			swap_cluster_unlock(ci);
 	}
-- 
2.53.0-Meta

