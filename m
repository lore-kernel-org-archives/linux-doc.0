Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563522;
	b=IzZSadSgOpUJqd5E7dcpTgLWmLKvr4dojHqv15olpGMUe6PmjvDp6zywMWrHUQWpTr/E
	 yshNIOSR5KmNfiV9YFa70wF6J50KBAJPOI2gglbDklEABJkU83HKxXZRZ7CeyRk55Udiu
	 5AVDlWaAh3cD1sgQZJbrbjUEO/mgeTMQPnJCt0Klfuiw/BHHLhn6VmCtqXt2AsQmCWyHo
	 aV2dFzBGsyapQA4V0xoYwI77g2dLgDPL0IYH0HoUW4mLMOSUrzYfqhMInHhvgYxr285Rc
	 kbXuEagkT4IhV7K3i0vvi3To+HilbfjrANl2hxW9+YcnFVJ8wfF8jXwwPjSKd0WZKEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Shyqse1OL+M2C4KCAQ1mJmEl8y6xAq/jS1H+63KIlcM=;
	b=ncqQniJgaLSbh12rF7Zp5sjURj9Musw+xs1Odof+xYYEkvRLivvPKAe1P4Zce9BcashI
	 js+qSf8TKq5HI5BLQ2PVl6J8bynl7CrRKtbDMsvbU+5uVF7G97pQ4ageHWBJKTpQJJfjw
	 YlcZ+52n6jUNWd0Bj70poLE8os2BuzdM2maxEVczrfhEPTaZqHfK2XF1uAkJPkIGFz4qI
	 CpaM7U23+bUw33cg1DtQPEhWZOZ071qN72rxMDqHhnmw3G6A4vjiPzMD/WE0yRQMVohL0
	 y2V43ND1ACzmKSOl8Q6c4ZBnu16NRnteeyLlZDBCweX7CHY7aBMJEdZ3HzLVCNHs+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mkLU7LCL;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9BE606A31B
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9BE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mkLU7LCL
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67489c8202cso273192d50.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563521; x=1793168321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Shyqse1OL+M2C4KCAQ1mJmEl8y6xAq/jS1H+63KIlcM=;
        b=mkLU7LCLmSwE8bU9f0EGJfVIKyqSqFttib2lzxFKUahkeHiR5UGVf678NZB2ND6AXx
         izs6vuwCmJUYetEf53snpEXD2J0byy5zdsN0MsMwVGutiUdA0ZCN6a8zkTQp4WLdkOha
         dJh8+lAD/YtI/ukhm6siPv6g1jYmy6o/lbH2rKT2+1ADOYZktOLuQ4+/MPKN6hIVSx7L
         oLGIRTJEtacdsPOVSbAl1i5NC1PkD1WQmPwu9GjNbDVf1yYeS5Llt3uSFS1lLqseWdrC
         OYgkuQGK4yB9om+hYP3oAku+D4qtZsJ8y1jqAsB8qkWafa4KpLfydZ41Q6G8JWy+/kVv
         ALWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563521; x=1793168321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Shyqse1OL+M2C4KCAQ1mJmEl8y6xAq/jS1H+63KIlcM=;
        b=Q3qNQWQYBJXXa2suH1YhSlBF2Wq9gz/xDbuWhi4ZqSlJw4f1ZgVegUVC3woQbv0Qps
         ZjIv7TyR08OXHR6QKHz12Mrfb66aoxVB3wkxbIU9dmHOHOWxxakU7RvJsgtUPVh9Gj5X
         1RduZ1WyEEyNmmBx+Axgn4iZkue+tndUgMg2DiGN+nJQCUzdiqSv5nNBL3UI/M0rJ77j
         w/687irDgQL9cb1XdAlDJT5CjqJn0IY23IFsRd1TLF+ebMdKZigG3nExk3SxVloUnH8H
         EJemVI1zVgn9VCvEeaEf8E6juylymsMQwZZIMIROvz1qbpZbmvM1juOSoKvXHm6brOGq
         0DBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe4t2jJAYJw8mXJ5sRemFmIxBvoqyDS8QFGP1mVY35cD3uRlG9yJcve7K32mwP/78aE5wbce5CD+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsqgHNCp6pnpSHlXXcwo4aPwtVdcMOGJdnpAZWXIXVH3FzKYsM
	QPzFjFlVBjYVyubRKNUBgvNE7xiZtyt8qPQz+4audas2Qgue2/SmjKp3
X-Gm-Gg: AYBFou10S9NCCwfWs5bNS0RqsGN5cTU4bcmdb63jOYagknPShEzHCQdMVAM2k/S5Axq
	6wHBojf/lvsTkZnrLGU4/7KK/b8gY5bY01SrpyL0bB5MG4CC8C6y/JrnxjVCexyZ5Vz57s+AJNg
	c+agbyPSHcCFzS1swa/sbj3K6luGyUs8/CpE6+Y/Hhlc2rYtwnF6skaKuRqA2+ad+GSoBiT92wQ
	AVZrWQRl9aM/W797Cr/p2kaL6hWjWxykodnERyZ3c74UaN1XhKCIjJacdN40AE6MpHy+0PnPMCP
	t4BCv/tfg4mli/NLqy7D2Jp6MS5R094L1xAjVghHeC+CBTWxYz9a078HjlJ4d14nUReCA9FA8lP
	zM0dsObitf6xsUEYZuLpSFtcuZZBqcOCMinxnYZxzYWmsHXK1GNaVV6+JO1SuWJhYi73kkswYDa
	meFhbjylvrzjOK1mQYwfVcbaKi1cmtasdkBbahNW18N0wVXlrxeKyANO5KdAHBJJLD4NsaNzFoJ
	UIsrxkEVel8EhYP+UpTIQqY4pmDpj8xvAsvB6yeXEP6FiSyUz31GgQbiNPFnfO9o8XPf6jKC7pT
	Dkhl9jIyvfeo857z3VEBAPWFWEhxjoINaHyrpH/bmEqg4ozaz+XBaMjXu4LKJRMl6A==
X-Received: by 2002:a53:ac91:0:b0:67a:11c3:6fc8 with SMTP id 956f58d0204a3-67a11c3747bmr297975d50.68.1792563520819;
        Tue, 20 Oct 2026 23:18:40 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:57::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e4c0b56sm632247d50.9.2026.10.20.23.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:18:39 -0700 (PDT)
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
	rdunlap@infradead.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v6 10/12] mm, swap: defer memcg_table allocation for physical swap clusters
Date: Tue, 20 Oct 2026 23:18:35 -0700
Message-ID: <20261021061837.1569125-1-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop allocating a memcg table for every physical swap cluster that only
ever holds vswap backings. The table costs SWAPFILE_CLUSTER *
sizeof(unsigned short) per cluster, 1 KB per 2 MB of swap on a 64-bit
kernel with 4 KB pages. On a vswap-heavy workload, where zswap writeback
is the only consumer of physical swap, that is the common case.

Such clusters never have their memcg_table read or written: vswap-layer
charging records on the vswap cluster's table, not the physical one.

Allocate eagerly only where the table is known to be needed: every vswap
cluster, and, when vswap is off, every physical cluster, since none of its
slots is then a vswap backing. A physical cluster otherwise allocates on
its first direct-use slot, and skips entirely if it only holds vswap
backings.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 83 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 64 insertions(+), 19 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 12cd5caeaaf2..e95f2441fdd7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -476,7 +476,8 @@ static void swap_cluster_free_table(struct swap_cluster_info *ci)
 	swap_cluster_free_count_table(table);
 }
 
-static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
+static int swap_cluster_alloc_table(struct swap_info_struct *si,
+				    struct swap_cluster_info *ci, gfp_t gfp)
 {
 	struct swap_table *table = NULL;
 	struct folio *folio;
@@ -497,7 +498,14 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
 		return -ENOMEM;
 
 #ifdef CONFIG_MEMCG
-	if (!mem_cgroup_disabled()) {
+	/*
+	 * A physical cluster under vswap may hold only vswap backings, which
+	 * record their memcg on the vswap cluster's table, not this one. Such
+	 * clusters defer memcg_table allocation until they hand out a direct-use
+	 * slot, including one for hibernation.
+	 */
+	if ((!vswap_is_enabled() || swap_is_vswap(si)) &&
+	    !mem_cgroup_disabled()) {
 		VM_WARN_ON_ONCE(ci->memcg_table);
 		ci->memcg_table = kzalloc_obj(*ci->memcg_table, gfp);
 		if (!ci->memcg_table) {
@@ -575,8 +583,8 @@ swap_cluster_populate(struct swap_info_struct *si,
 		lockdep_assert_held(&si->global_cluster_lock);
 	lockdep_assert_held(&ci->lock);
 
-	if (!swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					  __GFP_NOWARN))
+	if (!swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
+					      __GFP_NOWARN))
 		return ci;
 
 	/*
@@ -589,8 +597,8 @@ swap_cluster_populate(struct swap_info_struct *si,
 		spin_unlock(&si->global_cluster_lock);
 	local_unlock(&percpu_swap_cluster.lock);
 
-	ret = swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					   GFP_KERNEL);
+	ret = swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
+					       GFP_KERNEL);
 
 	/*
 	 * Back to atomic context. We might have migrated to a new CPU with a
@@ -867,7 +875,7 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 
 	ci = cluster_info + idx;
 	/* Need to allocate swap table first for initial bad slot marking. */
-	if (!ci->count && swap_cluster_alloc_table(ci, GFP_KERNEL))
+	if (!ci->count && swap_cluster_alloc_table(si, ci, GFP_KERNEL))
 		return -ENOMEM;
 	spin_lock(&ci->lock);
 	/* Check for duplicated bad swap slots. */
@@ -1090,7 +1098,9 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
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
@@ -1119,6 +1129,23 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 			if (!ret)
 				continue;
 		}
+#ifdef CONFIG_MEMCG
+		/*
+		 * Lazy-allocate memcg_table on the first direct-use slot of a
+		 * physical cluster.
+		 */
+		if (vswap_is_enabled() &&
+		    (!folio || !folio_test_swapcache(folio)) &&
+		    !mem_cgroup_disabled() && !ci->memcg_table) {
+			ci->memcg_table = kzalloc_obj(*ci->memcg_table,
+						      GFP_ATOMIC | __GFP_NOWARN);
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
@@ -1128,7 +1155,15 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
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
@@ -1149,7 +1184,13 @@ static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
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
@@ -1157,10 +1198,10 @@ static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
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
@@ -1181,7 +1222,8 @@ static unsigned int vswap_alloc_cluster(struct swap_info_struct *si,
 	spin_lock_init(&ci_dyn->ci.lock);
 	INIT_LIST_HEAD(&ci_dyn->ci.list);
 
-	if (swap_cluster_alloc_table(&ci_dyn->ci, GFP_ATOMIC | __GFP_NOWARN)) {
+	if (swap_cluster_alloc_table(si, &ci_dyn->ci,
+				     GFP_ATOMIC | __GFP_NOWARN)) {
 		kfree(ci_dyn);
 		return SWAP_ENTRY_INVALID;
 	}
@@ -1207,7 +1249,7 @@ static unsigned int vswap_alloc_cluster(struct swap_info_struct *si,
 	}
 
 	offset = cluster_offset(si, ci);
-	return alloc_swap_scan_cluster(si, ci, folio, offset);
+	return alloc_swap_scan_cluster(si, ci, folio, offset, NULL);
 }
 
 static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
@@ -1314,7 +1356,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		if (cluster_is_usable(ci, order)) {
 			if (cluster_is_empty(ci))
 				offset = cluster_offset(si, ci);
-			found = alloc_swap_scan_cluster(si, ci, folio, offset);
+			found = alloc_swap_scan_cluster(si, ci, folio, offset,
+							NULL);
 		} else {
 			swap_cluster_unlock(ci);
 		}
@@ -1358,7 +1401,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order < PMD_ORDER) {
 		/*
 		 * Scan only one fragment cluster is good enough. Order 0
-		 * allocation will surely success, and large allocation
+		 * allocation rarely fails, and large allocation
 		 * failure is not critical. Scanning one cluster still
 		 * keeps the list rotated and reclaimed (for clean swap cache).
 		 */
@@ -1373,7 +1416,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	/* Order 0 stealing from higher order */
 	for (int o = 1; o < SWAP_NR_ORDERS; o++) {
 		/*
-		 * Clusters here have at least one usable slots and can't fail order 0
+		 * Clusters here have at least one usable slots and rarely fail order 0
 		 * allocation, but reclaim may drop si->lock and race with another user.
 		 */
 		found = alloc_swap_scan_list(si, &si->frag_clusters[o], folio, true);
@@ -1594,7 +1637,7 @@ static swp_entry_t swap_alloc_fast(struct folio *folio)
 	if (ci && cluster_is_usable(ci, order)) {
 		if (cluster_is_empty(ci))
 			offset = cluster_offset(si, ci);
-		found = alloc_swap_scan_cluster(si, ci, folio, offset);
+		found = alloc_swap_scan_cluster(si, ci, folio, offset, NULL);
 	} else if (ci) {
 		swap_cluster_unlock(ci);
 	}
@@ -1982,7 +2025,8 @@ static bool vswap_alloc(struct folio *folio)
 		if (ci && cluster_is_usable(ci, order)) {
 			if (cluster_is_empty(ci))
 				offset = cluster_offset(vswap_si, ci);
-			alloc_swap_scan_cluster(vswap_si, ci, folio, offset);
+			alloc_swap_scan_cluster(vswap_si, ci, folio, offset,
+						NULL);
 		} else if (ci) {
 			swap_cluster_unlock(ci);
 		}
@@ -2843,7 +2887,8 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
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

