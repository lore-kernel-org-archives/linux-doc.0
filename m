Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278853C10AA
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041800; cv=none; b=ErPosXph3WUJc7B3hpZIwreSYvwgEG24UlHUtzOaQSgdWVgBeBTuEVfdNn+qCL4masiAAmXsq4kzoFnhPL50Nv44mC6ymKYrK7584CoFwjJQvUKBATI0T6/OTPjfcpHLX/ZBolQ3pAwTEcUvMrGQLef4TEQlOrcsRDvJsO2iYRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041800; c=relaxed/simple;
	bh=eumqLR4Sq/NYD9JMwB+6UlrMy9SA9TwY89K9+nUggY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F82GbP7IBlE7/nsxKEaDU/NRfr4qxNJ8WT4t89LiohcD5o1yvwKqxrZyYv/axVS60Z5lnYXZxPYbiF9gx/tzBo3ZUyDrNSIkpQ9Zcl5MWVcjrcggQKr7p/Ypgh01oir88wL3nSm86xKu35xBsObCfybvfo1TqLN4Sqp26i0Alpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaXMEsax; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaXMEsax"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-45133d2974fso1622423fac.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786041798; x=1786646598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mfv2zxxfrg+kFLvg5TbxKt0slusQCG6TQNqV0DBz5Rs=;
        b=BaXMEsaxYB7FeUZ+zK4MnIhMeDcPjA4drG83vbEsX2Lw/o8qR6ADiYURZSa2W7hlX8
         OJzfZBYQvnWo+qIL3zS+4UYrF+oe6hyn0Q3CYcZUh//1ZS3s8cDTA0O2dBpr9L7e5WiQ
         /Eivj/jUh7BtwUrqH7oP7dViTo3BT/G3Ys+DCxDR/Kp7xZQYNmM+cW80Qu4C2/OKuz9y
         T/oAc7q/UhTOnq3iBVzWALA5WiyUcIX3uAenm2iZMVLTN56wajoYrA+gJnK58g+SzCWO
         1WN8MZQku7oWQRPao5ZtgJolr6EcdaqQlb8tdRPSSn3pqT33N2Ccu+QJeYsgy0KctNgO
         yHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041798; x=1786646598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mfv2zxxfrg+kFLvg5TbxKt0slusQCG6TQNqV0DBz5Rs=;
        b=BOtPacoazjMf88LTZVQ0Hjjp7q1g4B6U6D7FAqwLsDamOr/IYEa9eaoHuhdj9eKgFZ
         /bQJ6ut/G1Lig4TJ72tfYbB3lV70T4BUw+lmEZXSb8b0yXorFh73EhTI+eTSk379Ttvx
         4E480+Pd8qfhsskiFMO02lTCpSnGPLBJElqqDoyf+xcRvu99iudA6CFRgzhIunOmrjwt
         3iSbW4tfwLO8eV5Fx1sQVjeDO3YCgTFSkqfxutJ4S+Ki/d/qwnjUJNz7tvAbuhr27NF7
         ZJ/HL5FBMoEyIv/TgQJCbvuXZWr6Y4FKR4tTYEvjTRYRtrK8qUYflnmUqXditlCGQhms
         LVEw==
X-Forwarded-Encrypted: i=1; AHgh+RrDfQKAseNzrRtsSOxU8XBDQ2Rkh0iL4O8ku8NWUvvwLvbw419aEr/MrrrL/ZrbafG6/is0eS1lE/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3DUbZZCJ6NFGKL563Kfdo1Jh/Kq3W5yh4qSq3PXReSny/xqJq
	ofdwxNlD6/RuVVTKvz0xedIsUV7fxeMT/aVKFGLJWHu1npoWcyCu+FB8
X-Gm-Gg: AR+sD12eRq/B8cTAseebX+1cKhScVIyPnmgc13XlNm2S8jDAZ3bwn5hgr9TX4+pr9Z3
	uV2C91PS5/LNwVb+QCOQB5vDp2/ZpsxtZwLzakldFhHP1alyv/BFjBDRjwuVAROzShhGeXiBmkN
	vgqGJ/qi10jlPaaIGwFviOLrDuCCVdag+vdG5HCPlvf7Zw/945pUDtjqu8J+hStC+b02jOpsvVI
	Np6Bw8bDuTFnh2gkN+WGXfg2IJpjdODddpKCYZ6wfDkg0t6rxSAuDWryDlpmuwBXrRHiEKDAPCT
	CyKWbkRVsnhhDGNDc3CergoAFSJMEOISj5EWbz+9CZrWP6/3UD4M7JoixAcgqn8nJl7yz/LoR7d
	eikDi/zXW7u/Azz9GTjMW1WntGqk2/+afJoL6PlRg9stjVazrN0uV8VgvE6VnFfOKECdJyi//kv
	hA0Z/Zs0vN/MvJki17toSpBqW2CIB5O0mcdnC35yiUmKsdUCoThv66kwBKdDZ/V8XfoWeDimX91
	RZ7cLABM1lfLxQhM58r4w==
X-Received: by 2002:a05:6870:8929:b0:441:f3f6:622b with SMTP id 586e51a60fabf-4599eb1f492mr9226089fac.5.1786041793178;
        Thu, 06 Aug 2026 11:43:13 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:15::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a0586asm197246fac.2.2026.08.06.11.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:43:12 -0700 (PDT)
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
Subject: [PATCH v3 11/11] mm, swap: widen swap_info_struct max/pages to unsigned long
Date: Thu,  6 Aug 2026 11:42:54 -0700
Message-ID: <20260806184254.3790858-12-nphamcs@gmail.com>
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

Widen swap_info_struct->max and ->pages from unsigned int to
unsigned long so the vswap device can exceed the current 16 TB
cap (ALIGN_DOWN(UINT_MAX, SWAPFILE_CLUSTER) pages).

Physical swap is unaffected; backing files/bdevs continue to bound
it independently of the field width.

The new vswap cap is the cluster_info_pool xarray's allocator
limit. XA_FLAGS_ALLOC stores allocated IDs in u32, so
max_pages = UINT_MAX * SWAPFILE_CLUSTER (~8 PB at the typical
SWAPFILE_CLUSTER=512 layout).

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 include/linux/swap.h |  4 +--
 mm/swapfile.c        | 62 +++++++++++++++++++++++---------------------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 19a703510675..44353eb554da 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -246,7 +246,7 @@ struct swap_info_struct {
 	signed short	prio;		/* swap priority of this type */
 	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
-	unsigned int	max;		/* size of this swap device */
+	unsigned long	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
@@ -254,7 +254,7 @@ struct swap_info_struct {
 					/* list of cluster that contains at least one free slot */
 	struct list_head frag_clusters[SWAP_NR_ORDERS];
 					/* list of cluster that are fragmented or contented */
-	unsigned int pages;		/* total of usable pages of swap */
+	unsigned long pages;		/* total of usable pages of swap */
 	atomic_long_t inuse_pages;	/* number of those currently in use */
 	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
 	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 65559647eeb4..6db605594d48 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -450,10 +450,10 @@ static inline unsigned int cluster_index(struct swap_info_struct *si,
 	return ci - si->cluster_info;
 }
 
-static inline unsigned int cluster_offset(struct swap_info_struct *si,
-					  struct swap_cluster_info *ci)
+static inline unsigned long cluster_offset(struct swap_info_struct *si,
+					   struct swap_cluster_info *ci)
 {
-	return cluster_index(si, ci) * SWAPFILE_CLUSTER;
+	return (unsigned long)cluster_index(si, ci) * SWAPFILE_CLUSTER;
 }
 
 static void swap_cluster_free_table_folio_rcu_cb(struct rcu_head *head)
@@ -904,7 +904,7 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 
 	/* si->max may got shrunk by swap swap_activate() */
 	if (offset >= si->max && !mask) {
-		pr_debug("Ignoring bad slot %u (max: %u)\n", offset, si->max);
+		pr_debug("Ignoring bad slot %u (max: %lu)\n", offset, si->max);
 		return 0;
 	}
 	/*
@@ -1170,12 +1170,12 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 }
 
 /* Try use a new cluster for current CPU and allocate from it. */
-static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
-					    struct swap_cluster_info *ci,
-					    struct folio *folio,
-					    unsigned long offset)
+static unsigned long alloc_swap_scan_cluster(struct swap_info_struct *si,
+					     struct swap_cluster_info *ci,
+					     struct folio *folio,
+					     unsigned long offset)
 {
-	unsigned int next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 	unsigned long start = ALIGN_DOWN(offset, SWAPFILE_CLUSTER);
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
 	unsigned long end = start + SWAPFILE_CLUSTER;
@@ -1245,12 +1245,12 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	return found;
 }
 
-static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
-					 struct list_head *list,
-					 struct folio *folio,
-					 bool scan_all)
+static unsigned long alloc_swap_scan_list(struct swap_info_struct *si,
+					  struct list_head *list,
+					  struct folio *folio,
+					  bool scan_all)
 {
-	unsigned int found = SWAP_ENTRY_INVALID;
+	unsigned long found = SWAP_ENTRY_INVALID;
 
 	do {
 		struct swap_cluster_info *ci = isolate_lock_cluster(si, list);
@@ -1267,8 +1267,8 @@ static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
 	return found;
 }
 
-static unsigned int alloc_swap_scan_dynamic(struct swap_info_struct *si,
-					    struct folio *folio)
+static unsigned long alloc_swap_scan_dynamic(struct swap_info_struct *si,
+					     struct folio *folio)
 {
 	struct swap_cluster_info_dynamic *ci_dyn;
 	struct swap_cluster_info *ci;
@@ -1392,7 +1392,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 {
 	struct swap_cluster_info *ci;
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
-	unsigned int offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 
 	/*
 	 * Swapfile is not block device so unable
@@ -3488,10 +3488,10 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type)
  * Return 0 if there are no inuse entries after prev till end of
  * the map.
  */
-static unsigned int find_next_to_unuse(struct swap_info_struct *si,
-					unsigned int prev)
+static unsigned long find_next_to_unuse(struct swap_info_struct *si,
+					unsigned long prev)
 {
-	unsigned int i;
+	unsigned long i;
 	unsigned long swp_tb;
 
 	/*
@@ -3529,7 +3529,8 @@ static int try_to_unuse(unsigned int type)
 	struct swap_io_ctx ctx;
 	swp_entry_t entry, vswap_entry;
 	unsigned long swp_tb;
-	unsigned int i, j;
+	unsigned long i;
+	unsigned int j;
 
 	if (!swap_usage_in_pages(si))
 		goto success;
@@ -3964,7 +3965,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	struct file *swap_file, *victim;
 	struct address_space *mapping;
 	struct inode *inode;
-	unsigned int maxpages;
+	unsigned long maxpages;
 	int err, found = 0;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -4386,12 +4387,8 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 		pr_warn("Truncating oversized swap area, only using %luk out of %luk\n",
 			K(maxpages), K(last_page));
 	}
-	if (maxpages > last_page) {
+	if (maxpages > last_page)
 		maxpages = last_page + 1;
-		/* p->max is an unsigned int: don't overflow it */
-		if ((unsigned int)maxpages == 0)
-			maxpages = UINT_MAX;
-	}
 
 	if (!maxpages)
 		return 0;
@@ -4630,7 +4627,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto bad_swap_unlock_inode;
 	}
 	if (si->pages != si->max - 1) {
-		pr_err("swap:%u != (max:%u - 1)\n", si->pages, si->max);
+		pr_err("swap:%lu != (max:%lu - 1)\n", si->pages, si->max);
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
 	}
@@ -4718,7 +4715,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	/* Sets SWP_WRITEOK, resurrect the percpu ref, expose the swap device */
 	enable_swap_info(si);
 
-	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
+	pr_info("Adding %luk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
 		K(si->pages), name->name, si->prio, nr_extents,
 		K((unsigned long long)span),
 		(si->flags & SWP_SOLIDSTATE) ? "SS" : "",
@@ -4906,8 +4903,13 @@ static int __init vswap_init(void)
 		return 0;
 	}
 
+	/*
+	 * Cap at the cluster_info_pool xarray's allocator limit
+	 * (XA_FLAGS_ALLOC stores IDs in u32, tops out at UINT_MAX).
+	 */
 	maxpages = min(swapfile_maximum_size,
-		       ALIGN_DOWN((unsigned long)UINT_MAX, SWAPFILE_CLUSTER));
+		       ALIGN_DOWN((unsigned long)UINT_MAX * SWAPFILE_CLUSTER,
+				  SWAPFILE_CLUSTER));
 	si->flags |= SWP_VSWAP | SWP_SOLIDSTATE | SWP_WRITEOK;
 	si->ops = &vswap_ops;
 	si->bdev = NULL;
-- 
2.53.0-Meta

