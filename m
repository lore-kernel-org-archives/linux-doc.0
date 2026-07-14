Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623483FA5EF
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016960; cv=none; b=qJRMK8d0s+vPqEvi6sCqsdLyhNrqhogcB5zoP54W9aUKN+tzd37iau/rD+6MKCqnWPLmCVjzeFiCrItCIQdj/PEOQgxpNEqRAB1V1o3wRJ9fvF8uAL/8ZhBKgaIZEF/COU4rL8SmTgmNT7UUY6xOccZ0PqEl+Ne03YkvtmXcN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016960; c=relaxed/simple;
	bh=uUYlBhAZn84mwF8H+rHHQ5q26TeChr1Bxo2Zj9hIRxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MPuCkgvGZBr7uQDLFCZ9v6sT39FLNrDKU+hd7X5k6QoaEn9pA3Y709aio+o8XfE5MA5cZ36PoRogCfxyra2L3gtHjKjkRbaLL0zzQPmZmnFoDYd+D87BNESug0CykTHWsuTx7jxn2PZ02L+hkG7TkkjvzwgP5tHQ0e90IBbkM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK2+Zgwr; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK2+Zgwr"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so2403166a91.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 01:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784016955; x=1784621755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UXPYiyfSEkWVl+cC8sK2nhliwJgX/ylc+YW6RL4x9c=;
        b=bK2+ZgwriEcZxcsFZPGVeDHWH/YnTVCMUtFd6ff0Onn15zry6Qs6v6fseWCOJ1iAHL
         WVBr+3lpCYcscld5d1dI8uYxR0txO7oydcfabcfvlMWAytxh26S3TDBX6+7m34VurCpn
         ZiBSA2XbzBERk3jXqkA8ZHxLK3By2yZv73hIr1LgjPquhCHoa+lKGFeLD/ZkV2vBnBSi
         HyifKxTYCOQCroc8Bke03+c8ES+g1R6fx1wL90phx/BiUVroF9EhNf+tbynLkjFLpt2k
         ARZVJX5pf/sCdXcb6hu06q4gHa9Qq9uUhhgjLor1E8BHlPAgvQ5e5xGFS6XKVj7Jo9hk
         SvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016955; x=1784621755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UXPYiyfSEkWVl+cC8sK2nhliwJgX/ylc+YW6RL4x9c=;
        b=oifq/Mh5B2dYEAfxRdzBY1h562WTQPFQmcOGk7eic23gzX3L6M4e8MEkfbxkaXMNSg
         FQ9wYymuou8FwY8UU3rpcuD6y8jWPpQG69Kc3wSI5+qQStW06RHUFPsX89H80UOWyyCY
         vmBLXgIiAFhpXRZFe/cQgYk0K2FdUFcKY5nOnd+R/hx/Qg9A6j4frZkA1r4DWmsW86e6
         6GBofxHbq85ZgV02si9sZcwjv+/OS5Cn5NipvtH4HS0t9hpQfC2NE3cA2ToDa6tiz4Dd
         y5thcVKAzKp1EszWpZpZhdZrbIlSW1fEvBbkDC+KhvM0FuDIfR5gqBezLYkJHhfCYO2v
         wXag==
X-Forwarded-Encrypted: i=1; AHgh+RqTuoCQHx28UNuukfG8vwOfulO93NWPfKzUVMHMXwqK/RKqhW31IzRVCUZzBWhb+cP3H/m9G9lDVmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlU4omsIIyG/nbJ/Vl6PwNHrta7whUW9eMa1nJaPLzjTgULvEz
	vk5VjW/aNdSMsiOCT0OyiyGCWCK8Uvs19oM8/vLEe6VUiK0xmcGmbGQU
X-Gm-Gg: AfdE7clC5jVkFYWu7QSAZwDIrffFjlfE5Pb5JIeidwZgv1vp9wS2cBZpWZ3DGdDEwtt
	vOC1u3saDFnXtpk/zy+8CQ8+brDqXJ5UD7D6dWJuDB596G3D95nqQFt5zBaaGuDiMBn6VmYZbFa
	dQIvMgeAVwimRlqoRL+0U/io9Mf77qpDJ7TwNdXG3Z2+Ry/JOGJz32OW2TEwcT/DBX8iqs/D9gb
	gCpuHjqvvuS94XzqIloI6mEZAmg4HGjlX9kw/zAlpFPDKg1VXI93UWZXyRisy7DIh7T23kj9KRV
	UVhSxOhoH0wuDYL0139uu7Soh/Gt1YHFvAUiiSZ4464Gf9Zh5H0ziBm/tkpYXHKaP1kpUe06BuH
	eWR5pO+Z/tek1432HW9al47wT5SGKqJz58yTdpYXP0eRr3hiOY5BP1OdKqwXIEaENU5kJ/3olcn
	k/3Mkm/208vs/5vddET5XWjJBMS7MhnDdCAJmVVq1x
X-Received: by 2002:a17:90b:28c4:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-38e17db7bd5mr2555852a91.10.1784016954644;
        Tue, 14 Jul 2026 01:15:54 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17443f4fsm1091008a91.11.2026.07.14.01.15.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 01:15:54 -0700 (PDT)
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
Subject: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
Date: Tue, 14 Jul 2026 16:15:10 +0800
Message-Id: <20260714081510.16895-3-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260714081510.16895-1-jiahao.kernel@gmail.com>
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Currently, shrink_memcg() writes back at most one entry per-node during
its traversal. This makes shrink_worker() inefficient, as it must
repeatedly re-enter shrink_memcg() to make any substantial progress.

To address this, extend shrink_memcg() and rewrite its LRU iteration logic
to support batch writeback. Introduce the nr_to_scan parameter to bound how
many pages are scanned per call. This enables batch writeback in the
shrink_worker() path, while maintaining a low scan budget in the
zswap_store() path.

Additionally, to prepare for future proactive writeback, update the return
value semantics of shrink_memcg(): a positive value now represents the
actual number of compressed bytes written back, 0 indicates that candidates
existed but no writeback succeeded, and a negative value represents an
error code.

Test Setup:
Total memory: 32 GB.
zswap settings: max_pool_percent=1, accept_threshold_percent=50,
shrinker_enabled=N.
Allocate 512MB of anonymous pages and fill them with random data (to avoid
compression), then use cgroup memory.reclaim to force a large amount of
anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymous
page where the first 4 bytes are random numbers and the rest are zeros, and
then trigger a reclamation of this 4K anonymous page through cgroup
memory.reclaim. When the pool threshold is reached, shrink_memcg() will
be triggered.

The test data after running for 120s is as follows:
                           Baseline         Patched
shrink_worker wakeups          5363             85
shrink_memcg calls       11,345,012        188,264
written_back                  40214          40275

Conclusion:
Under the same workload and run duration, the patched kernel shows a
significant reduction in both shrink_worker wakeups and shrink_memcg calls.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 89 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 3d697a1a5365..6d492762957a 100644
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
 
@@ -1133,10 +1139,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 
 	/*
 	 * Once the lru lock is dropped, the entry might get freed. The
-	 * swpentry is copied to the stack, and entry isn't deref'd again
-	 * until the entry is verified to still be alive in the tree.
+	 * needed fields are copied to the stack, and entry isn't deref'd
+	 * again until it is verified to still be alive in the tree.
 	 */
 	swpentry = entry->swpentry;
+	length = entry->length;
 
 	/*
 	 * It's safe to drop the lock here because we return either
@@ -1155,12 +1162,13 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
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
@@ -1169,8 +1177,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
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
@@ -1179,9 +1190,9 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 	}
 
 	shrink_ret = list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_memcg_cb,
-		&encountered_page_in_swapcache);
+		&walk_arg);
 
-	if (encountered_page_in_swapcache)
+	if (walk_arg.encountered_page_in_swapcache)
 		return SHRINK_STOP;
 
 	return shrink_ret ? shrink_ret : SHRINK_STOP;
@@ -1275,9 +1286,31 @@ static struct shrinker *zswap_alloc_shrinker(void)
 	return shrinker;
 }
 
-static int shrink_memcg(struct mem_cgroup *memcg)
+#define NR_ZSWAP_WB_BATCH	64UL
+
+/*
+ * Scan up to @nr_to_scan pages across the per-node zswap LRUs of @memcg
+ * and write back the reclaimable ones.
+ *
+ * Since the second-chance algorithm rotates referenced entries to the
+ * LRU tail, the per-node scan is capped at the current LRU length so
+ * each entry is scanned at most once per call. It is up to the caller
+ * to handle retries, deciding whether to scan another memcg to complete
+ * the full iteration, or to rescan the current memcg to drain its zswap
+ * entries.
+ *
+ * Return: The number of compressed bytes written back (>= 0), or -ENOENT
+ * if @memcg has writeback disabled, is a zombie cgroup, or has empty
+ * zswap LRUs.
+ */
+static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
 {
-	int nid, shrunk = 0, scanned = 0;
+	struct zswap_shrink_walk_arg walk_arg = {
+		.bytes_written = 0,
+		.encountered_page_in_swapcache = false,
+	};
+	unsigned long nr_remaining = nr_to_scan;
+	int nid;
 
 	if (!mem_cgroup_zswap_writeback_enabled(memcg))
 		return -ENOENT;
@@ -1290,24 +1323,40 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 		return -ENOENT;
 
 	for_each_node_state(nid, N_NORMAL_MEMORY) {
-		unsigned long nr_to_walk = 1;
+		unsigned long nr_to_walk;
 
-		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
-					    &shrink_memcg_cb, NULL, &nr_to_walk);
-		scanned += 1 - nr_to_walk;
+		/*
+		 * Cap the scan at per-node LRU length so each entry is scanned
+		 * at most once per call.
+		 */
+		nr_to_walk = min(nr_remaining,
+				 list_lru_count_one(&zswap_list_lru, nid, memcg));
+		if (!nr_to_walk)
+			continue;
+
+		nr_remaining -= nr_to_walk;
+		list_lru_walk_one(&zswap_list_lru, nid, memcg, &shrink_memcg_cb,
+				  &walk_arg, &nr_to_walk);
+		/* Return the unused share of the budget to the pool. */
+		nr_remaining += nr_to_walk;
+
+		if (!nr_remaining)
+			break;
 	}
 
-	if (!scanned)
+	/* Nothing was scanned: every LRU under @memcg was empty. */
+	if (nr_remaining == nr_to_scan)
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
@@ -1369,7 +1418,7 @@ static void shrink_worker(struct work_struct *w)
 			goto resched;
 		}
 
-		ret = shrink_memcg(memcg);
+		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
 		/* drop the extra reference */
 		mem_cgroup_put(memcg);
 
@@ -1383,7 +1432,7 @@ static void shrink_worker(struct work_struct *w)
 			continue;
 		++attempts;
 
-		if (ret && ++failures == MAX_RECLAIM_RETRIES)
+		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
 			break;
 resched:
 		cond_resched();
@@ -1493,7 +1542,7 @@ bool zswap_store(struct folio *folio)
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

