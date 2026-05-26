Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC403EDABA
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796010; cv=none; b=nHklcJLYAU5X4LZP+MjRwN/PfnIIyz9T0cNnjFkvdJj31vyMDpsklT0cgaCkvaQHTCiGgjesjDldO/v97eGBecaNUM8nSc+1dOTXZtcouNu1vK5p54UWOns7NdxJWo756DKBEyFxQsjNSVQGKlCX77NsaLuImVUxV254vWKCCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796010; c=relaxed/simple;
	bh=FWMfB8uhsPIyNwMFM3AddVnmy9NCj+ewojVF2bEmBiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JrHpVAY4QekgjjyBNwu+aPcLRhYaMOMdegZnd0nJYq+vebyux0Ql4xIj2ZyaDl2HHxQBKgoISsyZ10n0HKBANsjdCxBHKYzfhLW5rc0NNSz35oYzs3TEyRVe5ENs4tb+4Y92UIarwmqze0X31F8YqNJhxz9DTgH9Wdnjsu6mn1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXoFEHp4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXoFEHp4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3699cdeec05so4442725a91.3
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796004; x=1780400804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyxgSUePtHx6I/zD41D6CDDvd5fSjKcBNMIc54wEtIs=;
        b=FXoFEHp4fPTD7wpEIocU8DRTuPQeKr8IQtP6X0ks7XU+78ZzY1lFwvSxK+3TxryEf9
         p5c5pS3CklPXzbBvlV4Hf/BUOETUr0vtoh2sPvsbrOzImY+MnTmImArY90ko6wD7GHdd
         NjnRTW5iAFaw8JS+Zy7Aj0PzOhgG7HYUIwz5LZJ8BgYqljlr3tpGN3SwHzPKRxMu6+i4
         3DHwVPV5LH5wR02GeOKBLBwfWx5QNjPQ8w/Cu6D61KmOK/z4KieJ454Am+1gJL2a9KS9
         cVSKkEk5mnEvem0wBCO9NJn2o3ObZkWTG+jw90pMP5aQrhcKIVfCAa5QxTtxLca6plTd
         FlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796004; x=1780400804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LyxgSUePtHx6I/zD41D6CDDvd5fSjKcBNMIc54wEtIs=;
        b=sl/CgTYz3exd4o6KY3mRxZ5Pg2QKZtRLEc4RsoYEd5OsWMoVkX58i/+AjE2ziVO/v0
         ljesnfzn6aHtRTPUblQYVWJFQB6Bm+06c/NNW6bFeOg9+YcGtHpOkoawqNH5dzRgiXAA
         DXb/KOuICoo3TYkW7RHauGjnpzoR9qW6ve8gMNjGB9O1fwmvNRUrh7JNGSYDWGEgF1Xc
         EnOLlvf4L6UiuzbwWLS1Yido1K/gPYY1Hlskae+NId4Z5thiFxvsaVf10eRfSibgJsqv
         rfGvFtCrB2E+TJkN6Bu+RGcgm0tST7rEHWS7YAu0yCat4F6NC2FAUb6mcILFVfWwqcsX
         N4XQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UfOGCIsiU0kWgcwnfD8XLCDPwKlvs4Y73jYnkHn6Ikj3MYSV+L+ybcaSN8ENXG4HBIJx0ULs+DAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+6zTY/CofYUlHNw5ZyKZQ2tZZyYEV0U47Bimz15GomwwuM4V
	qtMN1DZTEUf12GvebY/jo6vqty0IRb/556izA7AkqCJopGpaVg3mMvJf
X-Gm-Gg: Acq92OGhW58FzJmGz8ZkrV4jTPbNBkkk24341o/08npAeLh5o6P02qbYwZJAuUgUe2T
	KBSAUlLZ1EKFQwZh0ypVlsx9jfGbkS4AWsXQNIezYtfKIrmtybWCDFypkC1YisjDZ0JvKOP0bc6
	xrgS8wpFhoTUJFgpHNxtHLp5jhoGW9VHmqsEq+zxP8FbJ8si8FnC908vF/jlJEM4D/a5h5RoVdE
	qqLcFN0fhXx5YVU28m1d5PRgSNIhVDeUBe/fkhf7yUkv7GcQ0zKNvOpFIxay9nnAu5UB/zzdYfl
	bMVJMxFolnMjvu4KFM4HoJR4PxBXZGnmOQhyrHc6m4pu2aFjBNJ991oKQjdQnZAncNRoiIjDk3B
	n3Sik/kvBeQqJ0Cpn9ckWgM3Ebef1oG5w3m2uDS2LZlk66VSErGyt861EgFd9PAw0/pYwA8S+7g
	Vdty8tYd16fHaop2k0iVQuSvacC2xfEtc3qeW6cnB0fry2CuG6sTo=
X-Received: by 2002:a17:90b:350a:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-36afcf566b1mr3550820a91.16.1779796003831;
        Tue, 26 May 2026 04:46:43 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852028fe99sm10304341a12.4.2026.05.26.04.46.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 04:46:43 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	yosry@kernel.org,
	mkoutny@suse.com,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev
Cc: cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v3 3/4] mm/zswap: Add per-memcg stat for proactive writeback
Date: Tue, 26 May 2026 19:46:00 +0800
Message-Id: <20260526114601.67041-4-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260526114601.67041-1-jiahao.kernel@gmail.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Currently, zswap writeback can be triggered by either the pool limit
being hit or by the proactive writeback mechanism. However, the
existing 'zswpwb' metric in memory.stat and /proc/vmstat counts all
written back pages, making it difficult to distinguish between pages
written back due to the pool limit and those written back proactively.

Add a new statistic 'zswpwb_proactive' to memory.stat and /proc/vmstat.
This counter tracks the number of pages written back due to proactive
writeback. This allows users to better monitor and tune the proactive
writeback mechanism.

Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  4 +++
 include/linux/vm_event_item.h           |  1 +
 mm/memcontrol.c                         |  1 +
 mm/vmstat.c                             |  1 +
 mm/zswap.c                              | 41 ++++++++++++++++++-------
 5 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 6564abf0dec5..7d65aef83f7b 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1748,6 +1748,10 @@ The following nested keys are defined.
 	  zswpwb
 		Number of pages written from zswap to swap.
 
+	  zswpwb_proactive
+		Number of pages written from zswap to swap by proactive
+		writeback. This is a subset of zswpwb.
+
 	  zswap_incomp
 		Number of incompressible pages currently stored in zswap
 		without compression. These pages could not be compressed to
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 03fe95f5a020..7a5bee0a20b6 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -138,6 +138,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		ZSWPIN,
 		ZSWPOUT,
 		ZSWPWB,
+		ZSWPWB_PROACTIVE,
 #endif
 #ifdef CONFIG_X86
 		DIRECT_MAP_LEVEL2_SPLIT,
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index e205e5de193d..7648b3fd940e 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -571,6 +571,7 @@ static const unsigned int memcg_vm_event_stat[] = {
 	ZSWPIN,
 	ZSWPOUT,
 	ZSWPWB,
+	ZSWPWB_PROACTIVE,
 #endif
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	THP_FAULT_ALLOC,
diff --git a/mm/vmstat.c b/mm/vmstat.c
index f534972f517d..66fd06d1bb01 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1452,6 +1452,7 @@ const char * const vmstat_text[] = {
 	[I(ZSWPIN)]				= "zswpin",
 	[I(ZSWPOUT)]				= "zswpout",
 	[I(ZSWPWB)]				= "zswpwb",
+	[I(ZSWPWB_PROACTIVE)]			= "zswpwb_proactive",
 #endif
 #ifdef CONFIG_X86
 	[I(DIRECT_MAP_LEVEL2_SPLIT)]		= "direct_map_level2_splits",
diff --git a/mm/zswap.c b/mm/zswap.c
index 7bcbf788f634..b45d094f532a 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -160,6 +160,11 @@ struct zswap_pool {
 	char tfm_name[CRYPTO_MAX_ALG_NAME];
 };
 
+struct zswap_shrink_walk_arg {
+	bool proactive;
+	bool encountered_page_in_swapcache;
+};
+
 /* Global LRU lists shared by all zswap pools. */
 static struct list_lru zswap_list_lru;
 
@@ -1042,7 +1047,8 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
  * freed.
  */
 static int zswap_writeback_entry(struct zswap_entry *entry,
-				 swp_entry_t swpentry)
+				 swp_entry_t swpentry,
+				 bool proactive)
 {
 	struct xarray *tree;
 	pgoff_t offset = swp_offset(swpentry);
@@ -1097,6 +1103,12 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	if (entry->objcg)
 		count_objcg_events(entry->objcg, ZSWPWB, 1);
 
+	if (proactive) {
+		count_vm_event(ZSWPWB_PROACTIVE);
+		if (entry->objcg)
+			count_objcg_events(entry->objcg, ZSWPWB_PROACTIVE, 1);
+	}
+
 	zswap_entry_free(entry);
 
 	/* folio is up to date */
@@ -1146,7 +1158,8 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 				       void *arg)
 {
 	struct zswap_entry *entry = container_of(item, struct zswap_entry, lru);
-	bool *encountered_page_in_swapcache = (bool *)arg;
+	struct zswap_shrink_walk_arg *walk_arg = arg;
+	bool proactive_wb = walk_arg && walk_arg->proactive;
 	swp_entry_t swpentry;
 	enum lru_status ret = LRU_REMOVED_RETRY;
 	int writeback_result;
@@ -1201,7 +1214,7 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 	 */
 	spin_unlock(&l->lock);
 
-	writeback_result = zswap_writeback_entry(entry, swpentry);
+	writeback_result = zswap_writeback_entry(entry, swpentry, proactive_wb);
 
 	if (writeback_result) {
 		zswap_reject_reclaim_fail++;
@@ -1212,9 +1225,9 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 		 * into the warmer region. We should terminate shrinking (if we're in the dynamic
 		 * shrinker context).
 		 */
-		if (writeback_result == -EEXIST && encountered_page_in_swapcache) {
+		if (writeback_result == -EEXIST && walk_arg) {
 			ret = LRU_STOP;
-			*encountered_page_in_swapcache = true;
+			walk_arg->encountered_page_in_swapcache = true;
 		}
 	} else {
 		zswap_written_back_pages++;
@@ -1226,8 +1239,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 		struct shrink_control *sc)
 {
+	struct zswap_shrink_walk_arg walk_arg = {
+		.proactive = false,
+		.encountered_page_in_swapcache = false,
+	};
 	unsigned long shrink_ret;
-	bool encountered_page_in_swapcache = false;
 
 	if (!zswap_shrinker_enabled ||
 			!mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
@@ -1236,9 +1252,9 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 	}
 
 	shrink_ret = list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_memcg_cb,
-		&encountered_page_in_swapcache);
+		&walk_arg);
 
-	if (encountered_page_in_swapcache)
+	if (walk_arg.encountered_page_in_swapcache)
 		return SHRINK_STOP;
 
 	return shrink_ret ? shrink_ret : SHRINK_STOP;
@@ -1709,7 +1725,10 @@ static long zswap_proactive_shrink_memcg(struct mem_cgroup *memcg,
 		return -ENOENT;
 
 	for_each_node_state(nid, N_NORMAL_MEMORY) {
-		bool encountered_page_in_swapcache = false;
+		struct zswap_shrink_walk_arg walk_arg = {
+			.proactive = true,
+			.encountered_page_in_swapcache = false,
+		};
 		unsigned long nr_to_scan, nr_scanned = 0;
 
 		/*
@@ -1743,12 +1762,12 @@ static long zswap_proactive_shrink_memcg(struct mem_cgroup *memcg,
 
 			nr_written += list_lru_walk_one(&zswap_list_lru, nid, memcg,
 							&shrink_memcg_cb,
-							&encountered_page_in_swapcache,
+							&walk_arg,
 							&nr_to_walk);
 
 			if (nr_written >= nr_to_write)
 				return nr_written;
-			if (encountered_page_in_swapcache)
+			if (walk_arg.encountered_page_in_swapcache)
 				break;
 
 			cond_resched();
-- 
2.34.1

