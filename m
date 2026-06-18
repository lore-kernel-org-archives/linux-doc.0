Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C987175A7F
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 04:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758169; cv=none; b=tBvghNl1jCEg5jnCYCYMUIEtBEb1Ig9GnfgqiIbp5sNQalhg1U7+0focE/Av4x/xXgFllCssFqXt9ZGq/oIUP80jvXxtG9lqWAj0SjRCNuG6fjwUIvBe21mPKbirFgiMOnCAP4svjPY+IwpUg6RytHKpLCuL3VMwpVO82/f+lwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758169; c=relaxed/simple;
	bh=icFfZQ/U3o57xaTAXnB3n/Ub2+4BqmO/f5ulEfrZ48o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uD6JRlW9tthb5nbNX5hDNk4+TrgoYDbGL0tXFvLBONt6y36TRW72ZIiBONjd3mGcHT6tYPjkMWTy0bsALvKP+N/+d7IlGMIH2QlZfGRVAuAFk0sff345uj4z1DlNVhFiKfQv2/ZsO91rtusei0Qs+nQ+LArNkdMpG13iS5cqWkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtjHQtpr; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtjHQtpr"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84540eb70b2so102983b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 21:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758168; x=1782362968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0Hrp4ly7FYGNcwCz9cInOYn+lLT0zH/zJYZGhEA7lk=;
        b=JtjHQtprx4JyV5QUKqMVQVCeJAEIzedGcK2S6b8MDKI2tW8Xjyd7LblXzTq+tpVQWB
         ZVpMV4XSKJ5Ns29i+3mrwG0OuHZhXyWZep33HY3OJlkNRrSZy7KXZpJt4b/4j9FFhPdi
         FchR+KSyoVuj/gg9Khi9t3pd6VD1FyOPAvLYfMNBpdodR/3MOZXzQu4aXDIhFjwwO0YP
         COHWWKLLnRrDblwRZfjEQNuvpMCdU7MhfQmGZxRVCwYh3W5V5rOqDLoLnsG+Lso+MBVh
         ld1zrKp/x5XDggVVfsxLptyNAbmcE8muYLe36bwoIHEPrXXJShxLISIfPG0DgRWdGcFX
         gyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758168; x=1782362968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0Hrp4ly7FYGNcwCz9cInOYn+lLT0zH/zJYZGhEA7lk=;
        b=bJdp7TNGYWUq9sc3qa5Bcq7NZt3MUBrFuWaFaPXaiAf4fJIX4LYz27BeFNx9wj37lq
         /5BufeZd6WrjQ2LJ1kSiR3Jk5VfyRQ77kn+c6mAjPks3ZzqIf6ThrRXhMBdkTuVs2mJX
         p07/j4hQmLV7PvVK3++qZUyfCykPLP82YRfMgnuHHmXFDEivNn1fijMxyUm2X6JDU5Td
         2q7EwNZxbUZly/xSEAiMIYpO77NZhipwS7YsFDA8abiSDyiSLnGu7Y/FqxVrF1LmQT/B
         +3drnj8F/9BiJ5MxmLYxtqFggajppUlJbZK2EA9Sh1cnH+7pdl+xGYc0jFhUH28ReOXh
         tvlg==
X-Forwarded-Encrypted: i=1; AFNElJ+nYneys2/nuTm7QKAzl5Z72KJVOtL1IbSoH7Ril5NOgSg3L5mi99fuVeoMFkceAHy3qoP3/PpDV7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8yv7TXo0cbgFj1yJbTJweq04haV1Nb7Fn2OIVY5zah0WKf91
	PRV93x4XCYmNGjbZ4iAh+4fUTQ8INKg4I1gHFG7LKdI8rzVSuPtpwh4W
X-Gm-Gg: AfdE7cmsrw+Mf1W/iBy/qmDiW5sIxUKF38SUBKceQVUDy1BjCnEu1SFolphuwIrrT5x
	kYMGK6qtY9scCvQINpM7gHGvQBrMzXpBzls2tB+WvgAQS69UKhgLpXSWDuZkait8UWUz/AQ4jgr
	PAsWj/Yv3Bwr6WBrh6kqGFxmCDe5h7CV0/PoHH/NtkLpntJXZ2JUCYS9ODTeGFGGIIvcggpRpI5
	wJVVo1Tohq3FGYcRr2eXDYhjIPvd6/1Wn/x9usMqP6ovcD40jt+ml+4gFjkzHsZXVDqxY591Ud5
	jQxF42F+fZbuvOQEuxRiXwKeY0Pc5Xvlmld3nVCtiaYCVTusTXGcW7OFeRPVncoynPwLNyZh7qI
	YRhDJ7km63M3EU47m4jqT9ME2CwzxtzULnTG5QnDXxqtQ65BIe6uepnHkzKr8iY7cwmGBNBDFJD
	/qMkL+1EuUA6yvQ4F2MLYUpNTHYLwThZ9zVX2Idxen
X-Received: by 2002:a05:6a00:27a1:b0:835:405a:7e6f with SMTP id d2e1a72fcca58-84541ba8066mr953371b3a.14.1781758167819;
        Wed, 17 Jun 2026 21:49:27 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17214781b3a.47.2026.06.17.21.49.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 21:49:27 -0700 (PDT)
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
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v4 1/5] mm/zswap: Extend shrink_memcg() writeback capability
Date: Thu, 18 Jun 2026 12:48:53 +0800
Message-Id: <20260618044857.69439-2-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618044857.69439-1-jiahao.kernel@gmail.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Currently, shrink_memcg() writes back at most one entry per-node
during its traversal. This makes shrink_worker() inefficient, as
it must repeatedly re-enter shrink_memcg() to make any substantial
progress.

To address this, extend shrink_memcg() and rewrite its LRU iteration
logic to support batch writeback. Introduce the nr_to_writeback
parameter to support a writeback budget based on compressed size.
This enables batch writeback in the shrink_worker() path, while
maintaining a low writeback budget in the zswap_store() path.

Additionally, to prepare for future proactive writeback, update
the return value semantics of shrink_memcg(): a positive value now
represents the actual number of compressed bytes written back, 0
indicates that candidates existed but no writeback succeeded, and
a negative value represents an error code.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 116 ++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 97 insertions(+), 19 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 761cd699e0a3..d7d031dee4cd 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -160,6 +160,11 @@ struct zswap_pool {
 	char tfm_name[CRYPTO_MAX_ALG_NAME];
 };
 
+struct zswap_shrink_walk_arg {
+	unsigned long bytes_written;
+	bool encountered_page_in_swapcache;
+};
+
 /* Global LRU lists shared by all zswap pools. */
 static struct list_lru zswap_list_lru;
 
@@ -1089,8 +1094,9 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 				       void *arg)
 {
 	struct zswap_entry *entry = container_of(item, struct zswap_entry, lru);
-	bool *encountered_page_in_swapcache = (bool *)arg;
+	struct zswap_shrink_walk_arg *walk_arg = arg;
 	swp_entry_t swpentry;
+	unsigned int length;
 	enum lru_status ret = LRU_REMOVED_RETRY;
 	int writeback_result;
 
@@ -1135,8 +1141,13 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 	 * Once the lru lock is dropped, the entry might get freed. The
 	 * swpentry is copied to the stack, and entry isn't deref'd again
 	 * until the entry is verified to still be alive in the tree.
+	 *
+	 * entry->length is also copied while the lock is held, because
+	 * zswap_writeback_entry() frees the entry on success and we still
+	 * need its compressed size to account for writeback.
 	 */
 	swpentry = entry->swpentry;
+	length = entry->length;
 
 	/*
 	 * It's safe to drop the lock here because we return either
@@ -1155,12 +1166,13 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 		 * into the warmer region. We should terminate shrinking (if we're in the dynamic
 		 * shrinker context).
 		 */
-		if (writeback_result == -EEXIST && encountered_page_in_swapcache) {
+		if (writeback_result == -EEXIST) {
 			ret = LRU_STOP;
-			*encountered_page_in_swapcache = true;
+			walk_arg->encountered_page_in_swapcache = true;
 		}
 	} else {
 		zswap_written_back_pages++;
+		walk_arg->bytes_written += length;
 	}
 
 	return ret;
@@ -1169,8 +1181,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 		struct shrink_control *sc)
 {
+	struct zswap_shrink_walk_arg walk_arg = {
+		.bytes_written = 0,
+		.encountered_page_in_swapcache = false,
+	};
 	unsigned long shrink_ret;
-	bool encountered_page_in_swapcache = false;
 
 	if (!zswap_shrinker_enabled ||
 			!mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
@@ -1179,9 +1194,9 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 	}
 
 	shrink_ret = list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_memcg_cb,
-		&encountered_page_in_swapcache);
+		&walk_arg);
 
-	if (encountered_page_in_swapcache)
+	if (walk_arg.encountered_page_in_swapcache)
 		return SHRINK_STOP;
 
 	return shrink_ret ? shrink_ret : SHRINK_STOP;
@@ -1275,10 +1290,32 @@ static struct shrinker *zswap_alloc_shrinker(void)
 	return shrinker;
 }
 
-static int shrink_memcg(struct mem_cgroup *memcg)
-{
-	int nid, shrunk = 0, scanned = 0;
+/*
+ * The maximum acceptable scan cost factor for writing back
+ * PAGE_SIZE bytes of compressed data.
+ */
+#define ZSWAP_WB_SCAN_FACTOR	16UL
+#define NR_ZSWAP_WB_BATCH	64UL
 
+/*
+ * Iterate over the per-node zswap LRUs of @memcg in batches, writing back
+ * up to @nr_to_writeback * PAGE_SIZE bytes of compressed data.
+ *
+ * Return: The number of bytes written back, or -ENOENT if @memcg has
+ * writeback disabled, is a zombie cgroup, or has empty zswap LRUs.
+ */
+static long shrink_memcg(struct mem_cgroup *memcg,
+			 unsigned long nr_to_writeback)
+{
+	struct zswap_shrink_walk_arg walk_arg = {
+		.bytes_written = 0,
+		.encountered_page_in_swapcache = false,
+	};
+	u64 bytes_to_writeback = nr_to_writeback << PAGE_SHIFT;
+	bool memcg_list_is_empty = true;
+	int nid;
+
+	/* Memcg with zswap writeback disabled are not candidates. */
 	if (!mem_cgroup_zswap_writeback_enabled(memcg))
 		return -ENOENT;
 
@@ -1290,24 +1327,65 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 		return -ENOENT;
 
 	for_each_node_state(nid, N_NORMAL_MEMORY) {
-		unsigned long nr_to_walk = 1;
+		unsigned long nr_to_scan, nr_scanned = 0;
+		unsigned long remain;
+		walk_arg.encountered_page_in_swapcache = false;
+		/*
+		 * Cap by LRU length: bounds rewalks when referenced
+		 * entries keep rotating to the tail.
+		 */
+		nr_to_scan = list_lru_count_one(&zswap_list_lru, nid, memcg);
+		if (!nr_to_scan)
+			continue;
+		memcg_list_is_empty = false;
+
+		/*
+		 * Cap by SCAN_FACTOR * remain budget: bounds scan cost
+		 * to the remaining writeback budget.
+		 */
+		remain = DIV_ROUND_UP(bytes_to_writeback - walk_arg.bytes_written, PAGE_SIZE);
+		nr_to_scan = min(nr_to_scan,
+				 remain * ZSWAP_WB_SCAN_FACTOR);
 
-		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
-					    &shrink_memcg_cb, NULL, &nr_to_walk);
-		scanned += 1 - nr_to_walk;
+		while (nr_scanned < nr_to_scan) {
+			unsigned long nr_to_walk = min(NR_ZSWAP_WB_BATCH,
+						       nr_to_scan - nr_scanned);
+
+			/*
+			 * Account for the committed budget rather than the walker's
+			 * actual delta. If the list is emptied concurrently, the
+			 * walker visits nothing and nr_scanned would never advance.
+			 */
+			nr_scanned += nr_to_walk;
+
+			list_lru_walk_one(&zswap_list_lru, nid, memcg,
+					  &shrink_memcg_cb,
+					  &walk_arg,
+					  &nr_to_walk);
+
+			if (walk_arg.bytes_written >= bytes_to_writeback)
+				return walk_arg.bytes_written;
+
+			if (walk_arg.encountered_page_in_swapcache)
+				break;
+
+			cond_resched();
+		}
 	}
 
-	if (!scanned)
+	/* Return -ENOENT if all zswap LRU lists are empty. */
+	if (memcg_list_is_empty)
 		return -ENOENT;
 
-	return shrunk ? 0 : -EAGAIN;
+	return walk_arg.bytes_written;
 }
 
 static void shrink_worker(struct work_struct *w)
 {
 	struct mem_cgroup *memcg;
-	int ret, failures = 0, attempts = 0;
+	int failures = 0, attempts = 0;
 	unsigned long thr;
+	long ret;
 
 	/* Reclaim down to the accept threshold */
 	thr = zswap_accept_thr_pages();
@@ -1368,7 +1446,7 @@ static void shrink_worker(struct work_struct *w)
 			goto resched;
 		}
 
-		ret = shrink_memcg(memcg);
+		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
 		/* drop the extra reference */
 		mem_cgroup_put(memcg);
 
@@ -1382,7 +1460,7 @@ static void shrink_worker(struct work_struct *w)
 			continue;
 		++attempts;
 
-		if (ret && ++failures == MAX_RECLAIM_RETRIES)
+		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
 			break;
 resched:
 		cond_resched();
@@ -1492,7 +1570,7 @@ bool zswap_store(struct folio *folio)
 	objcg = get_obj_cgroup_from_folio(folio);
 	if (objcg && !obj_cgroup_may_zswap(objcg)) {
 		memcg = get_mem_cgroup_from_objcg(objcg);
-		if (shrink_memcg(memcg)) {
+		if (shrink_memcg(memcg, 1) <= 0) {
 			mem_cgroup_put(memcg);
 			goto put_objcg;
 		}
-- 
2.34.1

