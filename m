Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE2378D93
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873011; cv=none; b=TGPeQBxIOFNTHnNYuPNc27ogDXMcAUaQzjzYIKP2bbdEaP1Thmfaph78dZFArl41W5IXFSiS/GThEIbgp+WNfsByhhf71kVK+Lz/N9TjUVAWz5ei3teACm3nKDFWeEEqxt9li5EIKHoeMHjNe8kBdSaUW2wmNY5RuCHTSBtVBYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873011; c=relaxed/simple;
	bh=HA+ycxRs+xDNiGz+g5rihXxbJ8yM3jeAeFSJ/RWFqvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piqzwBLS4km7R+4/Fi7uLf5+HUfhfPO9BR1Kfd3dOT3wa+kLNvokcya0Q6AYfaoAyMnFkHfddQ6Bf6+YMRHgwxtEqinsjGN6VHJe1gKONpmHZx4gsvIrfdNlXnEbdDS+ZD2GGBxe3eBFoP9ZUkdXe46yKhbZdUpAvv2vkuTN1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7tbUfA5; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7tbUfA5"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d7c76e1951so299842a34.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873008; x=1774477808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY7NTF4Dm0MfL8/0ZISsKMQQ1GHAv90xIRFAuLv54rc=;
        b=a7tbUfA54NLIfUJukh6mILe/ahcPmL3T+7WiwCdfW9FJFiPIELzTWwbp69oAMFBM2C
         cQuUDvWoj+lD7ctXQJ+8VxPHRnFjizShgkNm4Xh5vVZaraXooFKW6t5JycOYufdv7VPR
         fhcaxWlqwPEl/2pN2VxtMsQPcy3IzK4Ct2tQ/IIzTNieYC/va9f5MkLs5McR21/ng4K3
         zr9GIU8Pvfw7BI0TZooRqxRe2Eg9pZsBojz6hItYRFlVkwUlMTNEln8iCCZswL0qMVh8
         3PFGhlcG3eNqRCa3psr2NMY4FR7F83l9qhMZOhi3vck5LC55UuHtoYrwb9yxe/3mIf8t
         bi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873008; x=1774477808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KY7NTF4Dm0MfL8/0ZISsKMQQ1GHAv90xIRFAuLv54rc=;
        b=Zg1a/LzxpOyaigM43CocpBZ+i+NLphp1pPaoEzjGQ8p4mpUgTp6I1fSbK9L+P0QihU
         zsXtQqf2OSSPaItWapVMPOLVfsiEoL4TIBRjulU+WopX1V6iF8Hjo05b3i3po22MuHkV
         +LmcGQB6HLCk9DQCwX9ziuU5I5VBdhOG5riCjUVlBLVIwdMMFwHB31KiKg9fMQXhpECi
         avuWoDFjVNieHC2Vi06F3uK+5/po3GxYFWZTkJRRwphZrwOUA3xrotCOiMfXGaeni7SC
         DaRj4V8rIY3/qCUmsOugD4Ec9diNf2gCZ2rb9L/zLZB5Pk+aWOBKNMF/m21JnxFhH5oB
         UPrA==
X-Forwarded-Encrypted: i=1; AJvYcCWkN9VI6O3e3SiBMn45lB9+m2ABuDRm0Pd3Wrag4w1nRgoIwgxBP1qtIRphwTf+QV6flO2j1O5ML+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9sC71ivWbVCzf/SOMsBqmABaBoftv0EcZU4Me9aizqjJajSQ
	u7P8/2jxpQj2fX0LpDCSvpjLKNaXedGH5DDq14IVw55vebve4ucENQ8G
X-Gm-Gg: ATEYQzxGvrTSiAVHc+gc2LE7hspwGEQf2aVi9Tx2lMnvcAjvHwmYxaxbD1LC9fEuk4v
	jXjcTCtuXm9z4Lb8xb2YxOtFCSGofaY8L4TiNsj5ihOj3gRjw/qphjPBrKMZ89tukZcVGI0zQ3p
	Bzln5GtTVZZU1BTZICsNyrD0SUqi5b+1EnmSEzpnPMnR5+HBqfph8BOrWXc2cbH1BurJluCIQZV
	T1y5vLPTUn90ZV/b6zayufTL4gbCgsrYNfimKlxzYCl44d9WomWFQjYjMZnUtY6mB67yfToQUZe
	vJFLuI/mCRaCj0VrsbAN8dOgU3bDA88AqASJ88xaSiXuNmMESJVgtX+0Xv7ejxN4n99oOOCbpLi
	D94djNERqZkysjel0zq/H4Y8l0y5U17gpqN4EevT9CRN2aylT3ZIOJRtWquAJI0kBW+F9xEPRyc
	ZEk8gn2gBJe4JGuTuz/SZoXmBS28HDksP3vAX4XvtICqSq
X-Received: by 2002:a05:6830:498b:b0:7d7:4279:f1d1 with SMTP id 46e09a7af769-7d7ca281344mr3404168a34.0.1773873008244;
        Wed, 18 Mar 2026 15:30:08 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:3::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9b39ddbsm2935440a34.17.2026.03.18.15.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:30:07 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: kasong@tencent.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	nphamcs@gmail.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com,
	kernel-team@meta.com,
	riel@surriel.com
Subject: [PATCH v4 08/21] zswap: prepare zswap for swap virtualization
Date: Wed, 18 Mar 2026 15:29:39 -0700
Message-ID: <20260318222953.441758-9-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318222953.441758-1-nphamcs@gmail.com>
References: <20260318222953.441758-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The zswap tree code, specifically the range partition logic, can no
longer easily be reused for the new virtual swap space design. Use a
simple unified zswap tree in the new implementation for now.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 include/linux/zswap.h |  7 -----
 mm/swapfile.c         |  9 +-----
 mm/zswap.c            | 69 +++++++------------------------------------
 3 files changed, 11 insertions(+), 74 deletions(-)

diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index 30c193a1207e1..1a04caf283dc8 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -28,8 +28,6 @@ unsigned long zswap_total_pages(void);
 bool zswap_store(struct folio *folio);
 int zswap_load(struct folio *folio);
 void zswap_invalidate(swp_entry_t swp);
-int zswap_swapon(int type, unsigned long nr_pages);
-void zswap_swapoff(int type);
 void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg);
 void zswap_lruvec_state_init(struct lruvec *lruvec);
 void zswap_folio_swapin(struct folio *folio);
@@ -50,11 +48,6 @@ static inline int zswap_load(struct folio *folio)
 }
 
 static inline void zswap_invalidate(swp_entry_t swp) {}
-static inline int zswap_swapon(int type, unsigned long nr_pages)
-{
-	return 0;
-}
-static inline void zswap_swapoff(int type) {}
 static inline void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg) {}
 static inline void zswap_lruvec_state_init(struct lruvec *lruvec) {}
 static inline void zswap_folio_swapin(struct folio *folio) {}
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6b155471941c9..0372062743ef7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2972,7 +2972,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	spin_unlock(&p->lock);
 	spin_unlock(&swap_lock);
 	arch_swap_invalidate_area(p->type);
-	zswap_swapoff(p->type);
 	mutex_unlock(&swapon_mutex);
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
@@ -3615,10 +3614,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		}
 	}
 
-	error = zswap_swapon(si->type, maxpages);
-	if (error)
-		goto bad_swap_unlock_inode;
-
 	/*
 	 * Flush any pending IO and dirty mappings before we start using this
 	 * swap device.
@@ -3627,7 +3622,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	error = inode_drain_writes(inode);
 	if (error) {
 		inode->i_flags &= ~S_SWAPFILE;
-		goto free_swap_zswap;
+		goto bad_swap_unlock_inode;
 	}
 
 	mutex_lock(&swapon_mutex);
@@ -3650,8 +3645,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 
 	error = 0;
 	goto out;
-free_swap_zswap:
-	zswap_swapoff(si->type);
 bad_swap_unlock_inode:
 	inode_unlock(inode);
 bad_swap:
diff --git a/mm/zswap.c b/mm/zswap.c
index a5a3f068bd1a6..f7313261673ff 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -197,8 +197,6 @@ struct zswap_entry {
 	struct list_head lru;
 };
 
-static struct xarray *zswap_trees[MAX_SWAPFILES];
-static unsigned int nr_zswap_trees[MAX_SWAPFILES];
 
 /* RCU-protected iteration */
 static LIST_HEAD(zswap_pools);
@@ -225,45 +223,35 @@ static bool zswap_has_pool;
 * helpers and fwd declarations
 **********************************/
 
-/* One swap address space for each 64M swap space */
-#define ZSWAP_ADDRESS_SPACE_SHIFT 14
-#define ZSWAP_ADDRESS_SPACE_PAGES (1 << ZSWAP_ADDRESS_SPACE_SHIFT)
-static inline struct xarray *swap_zswap_tree(swp_entry_t swp)
-{
-	return &zswap_trees[swp_type(swp)][swp_offset(swp)
-		>> ZSWAP_ADDRESS_SPACE_SHIFT];
-}
+static DEFINE_XARRAY(zswap_tree);
+
+#define zswap_tree_index(entry)	(entry.val)
 
 static inline void *zswap_entry_store(swp_entry_t swpentry,
 		struct zswap_entry *entry)
 {
-	struct xarray *tree = swap_zswap_tree(swpentry);
-	pgoff_t offset = swp_offset(swpentry);
+	pgoff_t offset = zswap_tree_index(swpentry);
 
-	return xa_store(tree, offset, entry, GFP_KERNEL);
+	return xa_store(&zswap_tree, offset, entry, GFP_KERNEL);
 }
 
 static inline void *zswap_entry_load(swp_entry_t swpentry)
 {
-	struct xarray *tree = swap_zswap_tree(swpentry);
-	pgoff_t offset = swp_offset(swpentry);
+	pgoff_t offset = zswap_tree_index(swpentry);
 
-	return xa_load(tree, offset);
+	return xa_load(&zswap_tree, offset);
 }
 
 static inline void *zswap_entry_erase(swp_entry_t swpentry)
 {
-	struct xarray *tree = swap_zswap_tree(swpentry);
-	pgoff_t offset = swp_offset(swpentry);
+	pgoff_t offset = zswap_tree_index(swpentry);
 
-	return xa_erase(tree, offset);
+	return xa_erase(&zswap_tree, offset);
 }
 
 static inline bool zswap_empty(swp_entry_t swpentry)
 {
-	struct xarray *tree = swap_zswap_tree(swpentry);
-
-	return xa_empty(tree);
+	return xa_empty(&zswap_tree);
 }
 
 #define zswap_pool_debug(msg, p)			\
@@ -1691,43 +1679,6 @@ void zswap_invalidate(swp_entry_t swp)
 		zswap_entry_free(entry);
 }
 
-int zswap_swapon(int type, unsigned long nr_pages)
-{
-	struct xarray *trees, *tree;
-	unsigned int nr, i;
-
-	nr = DIV_ROUND_UP(nr_pages, ZSWAP_ADDRESS_SPACE_PAGES);
-	trees = kvcalloc(nr, sizeof(*tree), GFP_KERNEL);
-	if (!trees) {
-		pr_err("alloc failed, zswap disabled for swap type %d\n", type);
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < nr; i++)
-		xa_init(trees + i);
-
-	nr_zswap_trees[type] = nr;
-	zswap_trees[type] = trees;
-	return 0;
-}
-
-void zswap_swapoff(int type)
-{
-	struct xarray *trees = zswap_trees[type];
-	unsigned int i;
-
-	if (!trees)
-		return;
-
-	/* try_to_unuse() invalidated all the entries already */
-	for (i = 0; i < nr_zswap_trees[type]; i++)
-		WARN_ON_ONCE(!xa_empty(trees + i));
-
-	kvfree(trees);
-	nr_zswap_trees[type] = 0;
-	zswap_trees[type] = NULL;
-}
-
 /*********************************
 * debugfs functions
 **********************************/
-- 
2.52.0

