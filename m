Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D93B3888
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041796; cv=none; b=aw+wgwsAH7C2N+QaTyFGWzeoVHKCtpKJhOYcwZCadgeRY5RvWrC0Pw6iSUwWxMww44vRFjIW2pqOpSVNQ7fNfSsSfM7xXDW+BaWVbqCJEVwpKJtB+G21U8h+Y4PMEZBYKJ9b5Gh0rHy5qIxeUmERNEL/90dC4Bbemg3UC8Zxe/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041796; c=relaxed/simple;
	bh=kUgIWKYFgahkHMUnPHN6PokGq9uBRZ5QpQiL27RcoVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRy5XsQewQKdEs8aaLsuR/2WqftRwqIOQK7UWpcRxjD7GM3NvC86rWwLuxn/vhT5t2KkzKQm1leU2iwm/NfOdeG6oTHtnW77AOsfm/9x6EdkJ+KU0JNwrxG+eNjf6Q0LLKmcMth0aV+WdYOdJ/zs7T8g1mHCtwO+7m7FS+NngbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hywnn4mg; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hywnn4mg"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6b554044fso2369350a34.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786041792; x=1786646592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6q7yoTOhS8xVdFoqcdm5Nyx0rOXnYxJmiHBoOvthnIM=;
        b=hywnn4mgf3I5l8Rr1u+ZDavWqsSeQbYLOkXATsuEurMB66Ye8aIKLNj5hBxrt2ZTQp
         69Uvh7CGgZQQMgQOSJOQFxOUyXlWupnl6IhwDKgRblrneRWjgxhLMBNGf8h6FPWBQ0ro
         VGKZ7XQs6SuJit/gRscc/4nF/tIHr/jWL/nugBgOrTycGUN7fmvMJEACzn7+K8UFyxN4
         N+B/bWUvqtdk8gCXRPmp3n84+FB1J3MDEhb0VuA7QvqLIbzTwMczcSyiX+EEXuUIbRjn
         UmRgS90YEikSE6Bf4Vnt4Vx7relOmMMqhk815P04ppX1CQLOo9oMh0EE3dvUy/gXGsbA
         zDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041792; x=1786646592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6q7yoTOhS8xVdFoqcdm5Nyx0rOXnYxJmiHBoOvthnIM=;
        b=kWj42Cy+qkUA2JBACyaUM2VNziTc8urxxxEXk4Q1A3+NKO4WjkZ6/3W33vXMvxg4WR
         IkHgPAFGZAkiA3AGfgp8kC5zDl4yOmVTCiAlFxUBYPt4MACM6HInWFvT2b7+8jva+HRT
         NXLZwA+PaT495srdu9tgRFm+WnVdRHqHbAAEPu7/+ULvHBoDuTLR+hlNEnnAq/wGFBgH
         Ap+PpIqB1s0CYnAoJwUQJyvR7Xva2NK84lgYHJfS3q9R17Afh2Ff1L2dvLyRLZomAgC9
         iEt/mkFpupIRTL2wwzLfSrGhPNG9zBPQK8wTxS25+vfSJHVtxWmx/8EtaKYkoLJDSjyq
         Qoeg==
X-Forwarded-Encrypted: i=1; AHgh+RrnTqr2ns1mjO9acEjogKvQEW3itb0wvmHjiLVXbHXDtZ4HHAzTUd6uT5nU35ZddovfXqu97F9sfMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfH4KDobNUtaRDq7qTf0+WaB+OW9uxMagBZBzXPRKCcgIQKHc+
	BL4Sr4BXohaz7EwjUgEV3qoXf3hQNqdh3ob5SRPU2BG7UeWt513F4f2H
X-Gm-Gg: AR+sD111fLkhqElt2H+rucKEz8hfDLq+k7shn499HHtBUIFURMxteNo8AT03WWHSXs8
	vR9ycl07NqIa4z2cfMuGsRKXd94E4Hb7oR5UHRxDFFDMuCHbquAorH2Qg3JEqEvo+XDa32xnpr2
	H4jY+d/NAFUG8HjeNIJqN0XAvDouXogTsGs6rWexd5/pXGQ+jZKTkAgvR4MCkAOYLu3f31UV0IG
	8AKMuOqc1hL3kBnZkYy9YWanDoNt7eAo4Yzo8GADr6r4jop6mPVLbInpRQoFN0hVPuKvoheTfri
	wpjlWXTHp+5phQe2mNLVSRYB7Rg6CKKT2+YlYQQOBJijzodOEhPxDuXbTA07sBhTIK6ecOCSfS0
	ysQ25C3cUmxsFOqskCkJKSSDRJYNYbmmZt0t547f8P22tEojHUnDsDQ0rsbE+G4zpGVO5Y7hUSk
	3HAOqUMmW+Xra1vo5njDJKMpu5kIOTDWayfFyMuzB3yrrrqektSiXty4CyJpUjfMtM5Fq21u3/a
	S6mp/0fcIozbb0KAQ==
X-Received: by 2002:a05:6820:c8b:b0:6ac:8e23:3078 with SMTP id 006d021491bc7-6ae96c10021mr8748486eaf.5.1786041791947;
        Thu, 06 Aug 2026 11:43:11 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bc2631esm203436eaf.4.2026.08.06.11.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:43:11 -0700 (PDT)
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
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v3 10/11] mm, swap: defer memcg_table allocation for physical swap clusters
Date: Thu,  6 Aug 2026 11:42:53 -0700
Message-ID: <20260806184254.3790858-11-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806184254.3790858-1-nphamcs@gmail.com>
References: <20260806184254.3790858-1-nphamcs@gmail.com>
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

Allocate eagerly only when the cluster is known to need a table: any
cluster in a !CONFIG_VSWAP build, or any vswap cluster. For physical
clusters in CONFIG_VSWAP builds, defer to alloc_swap_scan_cluster(),
which allocates on the first direct-use slot and skips entirely when the
cluster only holds pointer-tagged vswap backings.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 40 ++++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index b4d7af21ca1c..65559647eeb4 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -492,7 +492,8 @@ static void swap_cluster_free_table(struct swap_cluster_info *ci)
 		 swap_cluster_free_table_folio_rcu_cb);
 }
 
-static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
+static int swap_cluster_alloc_table(struct swap_info_struct *si,
+				    struct swap_cluster_info *ci, gfp_t gfp)
 {
 	struct swap_table *table = NULL;
 	struct folio *folio;
@@ -515,7 +516,16 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
 	rcu_assign_pointer(ci->table, table);
 
 #ifdef CONFIG_MEMCG
-	if (!mem_cgroup_disabled()) {
+	/*
+	 * Allocate memcg_table eagerly only when we know it will be used:
+	 * any cluster in a !CONFIG_VSWAP build (all slots are direct use),
+	 * or any vswap cluster (every vswap alloc records memcg). Physical
+	 * clusters in a CONFIG_VSWAP build defer to alloc_swap_scan_cluster,
+	 * which allocates on the first direct-use slot and skips entirely
+	 * when the cluster only holds Pointer-tagged vswap backings.
+	 */
+	if ((!IS_ENABLED(CONFIG_VSWAP) || swap_is_vswap(si)) &&
+	    !mem_cgroup_disabled()) {
 		VM_WARN_ON_ONCE(ci->memcg_table);
 		ci->memcg_table = kzalloc_obj(*ci->memcg_table, gfp);
 		if (!ci->memcg_table) {
@@ -589,8 +599,8 @@ swap_cluster_populate(struct swap_info_struct *si,
 		lockdep_assert_held(&si->global_cluster_lock);
 	lockdep_assert_held(&ci->lock);
 
-	if (!swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					  __GFP_NOWARN))
+	if (!swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
+					      __GFP_NOWARN))
 		return ci;
 
 	/*
@@ -608,8 +618,8 @@ swap_cluster_populate(struct swap_info_struct *si,
 	if (!swap_is_vswap(si))
 		local_unlock(&percpu_swap_cluster.lock);
 
-	ret = swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					   GFP_KERNEL);
+	ret = swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
+					       GFP_KERNEL);
 
 	/*
 	 * Back to atomic context. We might have migrated to a new CPU with a
@@ -911,7 +921,7 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 
 	ci = cluster_info + idx;
 	/* Need to allocate swap table first for initial bad slot marking. */
-	if (!ci->count && swap_cluster_alloc_table(ci, GFP_KERNEL))
+	if (!ci->count && swap_cluster_alloc_table(si, ci, GFP_KERNEL))
 		return -ENOMEM;
 	spin_lock(&ci->lock);
 	/* Check for duplicated bad swap slots. */
@@ -1193,6 +1203,20 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 			if (!ret)
 				continue;
 		}
+#ifdef CONFIG_MEMCG
+		/*
+		 * Lazy-allocate memcg_table on the first direct-use slot of a
+		 * physical cluster.
+		 */
+		if (IS_ENABLED(CONFIG_VSWAP) && folio &&
+		    !folio_test_swapcache(folio) && !mem_cgroup_disabled() &&
+		    !ci->memcg_table) {
+			ci->memcg_table = kzalloc_obj(*ci->memcg_table,
+						      GFP_ATOMIC | __GFP_NOWARN);
+			if (!ci->memcg_table)
+				goto out;
+		}
+#endif
 		if (!__swap_cluster_alloc_entries(si, ci, folio, offset % SWAPFILE_CLUSTER))
 			break;
 		found = offset;
@@ -1259,7 +1283,7 @@ static unsigned int alloc_swap_scan_dynamic(struct swap_info_struct *si,
 	spin_lock_init(&ci_dyn->ci.lock);
 	INIT_LIST_HEAD(&ci_dyn->ci.list);
 
-	if (swap_cluster_alloc_table(&ci_dyn->ci, GFP_ATOMIC)) {
+	if (swap_cluster_alloc_table(si, &ci_dyn->ci, GFP_ATOMIC)) {
 		kfree(ci_dyn);
 		return SWAP_ENTRY_INVALID;
 	}
-- 
2.53.0-Meta

