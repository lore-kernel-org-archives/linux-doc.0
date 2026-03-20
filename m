Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43F34EF16
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034871; cv=none; b=duv+dO5+X1CjYpA1DAQjd6GQRe4OPkqJRXRYyRJxVL9tOe8IValQpajhBikbSW5hp16zer6ksYHomP5eOd7nPVEf7DGbKJVcWWTL8mmdPi8mg/bs1zSZy3duExrkDYGcGstXQzpxGAsZRmWA1avr1rFMETQQGqVstHCiR2Kqm44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034871; c=relaxed/simple;
	bh=HA+ycxRs+xDNiGz+g5rihXxbJ8yM3jeAeFSJ/RWFqvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEp8hMUAT5/HGxy/p0+3LWvgrGiR84of7Ew/56dxy6CrypTdF6w3yUuD6JILDqmwDjLTy5wESboW+ZNqrhjvLywOta77FF5MfFR9eS8rozBoWJX9rw10wELscnURMScPPBzJXKaEl7bM6PoHTpsn19gZ2UJG5FHY1RkS9uGk+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZON+0b9C; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZON+0b9C"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d75371d873so1047635a34.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774034868; x=1774639668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY7NTF4Dm0MfL8/0ZISsKMQQ1GHAv90xIRFAuLv54rc=;
        b=ZON+0b9C6klpWIjwbOyVt3MJ22CY7MY+CuBni+cRclHzmHbJJNzpEKeW+6gv30bhVQ
         4OFUqzwN7dZOdVnIgcfrWsi65Fu2INogwTa9jKMUgOjhr9NYIYo47WOHmB6SxBFditjA
         CGxivKxChaJHt5eqbBPMQFVJup+E6IPl59AurNPwsbo8x6UMG3XlAzuHJc89OLopZkTw
         Rupp88dl3N62OYMVvF+HT679FLIkotKIZZ8PeItlsBNEayZxsV2ZwKrfe7HixEWUQy9A
         HKbC6lmhsw7f+CDDPrhOJyB6uRGquaPabfujD/ht+BeDJHifUprBlCGdhnTz3tqY7Sez
         JM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034868; x=1774639668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KY7NTF4Dm0MfL8/0ZISsKMQQ1GHAv90xIRFAuLv54rc=;
        b=ogBfMf/3bZfwidOxymesURUgH+S0PGidkCRquFX/rgdew6vUP9v/Lm1WDDfxRH8iDZ
         g+1UxqU97UUYPRUwrRUX8iivhu0Anrjguf0JLrSc1vmFTwinEf/T+neL55KA1K/8FC8W
         qLiWOtvuV1R1WjMsvzG+R32uSNMQ5bvtEjZ122i1rjDP0jYy+KnftYADcjYohb76tOSs
         rg0riRYd7ubkK4koEKPQy7NcUDuNH9R3qrk8R81tS8ZlkXFNUqLilObD4hJc2i1MZWpw
         i9FQkufJE14AprPHmfoGif5Bd6D5N/A/6HFZBOlD2+cMcHdVSF0lwTsbm8HAyjzOuqSr
         m3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcQblPgomU5v6/MSH29KejkNckLjduSJic2ZCnip12kdZUV4s3v8uGg+x1tCVX2ZQ4DqWqdzZUbtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUJdHttcNpIqET1xASWDH3AhsuAq8Ox16h6o3rCsyKhPe2wHP
	KkRmtCeMWbUd3O3j0uW0NcboCXdn7gKljyfB1DdZe/Wc3bSwyfZHub16
X-Gm-Gg: ATEYQzyxM/cO803+5PqKdhH4Si6PwbCGXu4SVOpSIUjwCHaCr4xgiASHmOybmYcPP4M
	kz7x1GrCO3n9+kqEyLBdxb3PnOVeKe1zDqrMtLt/D+45HTZksbJpHe3S3+W6TjrKgLB95XALa9O
	08OaCztkIqRQwPeLylw8PH91qdrsd+gT3PMyDcS9a1LbAa0bYz4GQWWRFbh+X20Wkv2xhCN6H3h
	WzmGFnfPgYjaUerdT4/+/gX5C8VJFvClzGE1x0YHTkREa5X5NT3V9Rq6OClvml7ULaGXTmY44yp
	WOajJMLwFE6GtLs5q7CNqkutR3+6TObuAClo3GF9TLUEty7PX8X1Sx/VR8tcL/itFyPwAW3kiGY
	oM4Vud6fGYFkX2eYy6UtLds/jfkqbI7TPP4rr8qMz6hoRpOCcCf7vGoMwrUrwq+RTwBNskdZMLW
	/7f4ggwCrDrgF/T/+gSy1Qcr0Yfr5ZlqV7I+1RaCObtNy7Rg==
X-Received: by 2002:a05:6870:45a6:b0:3ec:4f31:42a with SMTP id 586e51a60fabf-41c10eff5ddmr3006039fac.7.1774034867967;
        Fri, 20 Mar 2026 12:27:47 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:72::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c14d63aa9sm2729687fac.10.2026.03.20.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:27:47 -0700 (PDT)
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
Subject: [PATCH v5 08/21] zswap: prepare zswap for swap virtualization
Date: Fri, 20 Mar 2026 12:27:22 -0700
Message-ID: <20260320192735.748051-9-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320192735.748051-1-nphamcs@gmail.com>
References: <20260320192735.748051-1-nphamcs@gmail.com>
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

