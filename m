Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99073B8409
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732064; cv=none; b=lizwHb5r+iyzPJc1HItPZLr4c83AmYJwtuGAv0FOPppi556/VGAo44e7LSQkLOAHmb7n3iZqMbEbgjCWtFL7u9uy/guBLL2fhWxAmbdywA+61RNNq5M/acm0nFdCbQv1duOFz4a/BMxQ4TfZRaEOGTyvuUijOb9YItylrJYkB+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732064; c=relaxed/simple;
	bh=nYS4j+lIenlbD9WEwHu4z0ZhM2GL8Qz07Wecot4uMm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmYV0xz8bm4YU931+dj6L79LE0hVqizOPCO7JrkJEM/6BbZkt0wForWpbjVS1VsSWdJkqkuQKIhGsaXnp/93kRubhcreX1p5SPCx8FAUfCKHZImNkldiSIf99I5ptTKVx/SQM1LFA4hqIEARsrQVLaM8k/KWSlsxXpRsIwXoSEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxWdn7zV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxWdn7zV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9c9913ddaso5600425ad.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782732062; x=1783336862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FietH9U8kgJBALOyGZ+5s9r+QaNo83d8QuAuH167UTI=;
        b=ZxWdn7zVBGEpPt79Ep+tV+6XlTgtbaElQZjsn7wV8xEXt471xtxGMSVBSWh6E9g2Kq
         VaL4t6caR0tDZDNw5kP7WtMZF+rKCigGkuUkMs6Zf3W2OomAu2L32U9YMq6+bLAbTg2N
         pCWeu1nYp0nZkIcE4cDy9mEUINgWzkQqrbs+utq7lxLvPBf/otz8fkaYNryDhkQJCAXz
         wY+YitRLUZORRsk5E7T4/7A4apQLwZWoqsBwTu0G2/ohp2lvnSF+v9Z0FE3u/upGSWCR
         IERNHzr7gTMBCaBU8Y7aURbmcPBfLmAwNwXub8mL2MeZoXEPqRJ4dhwxrlXTvorp/h3H
         dy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732062; x=1783336862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FietH9U8kgJBALOyGZ+5s9r+QaNo83d8QuAuH167UTI=;
        b=M/oHzQGMU0j/a7BnWE9gw+pIcll4jxsZmZIBGIONTdU1+VIKbNDIpbc/3stbiOfRQ9
         yMk/9jagBLjTExNGAA7wiP18VjheOxMOq/BGayB94/H3NivNNV/AkT+Q3zXludYfw9+u
         5cn1kpdE8zpPRqqFuQLmCsIDqZ7LDqJ0dcoRTD821q/G0L6tJUoKcGI6yV0V0obqQJHB
         g2ikwi/xOQjF43cgl1qkmNumObembhcQe6q7izUPN3jFxURet0Xo0EpospxQTgDk7hNH
         L6KId5HIsNXk0wMy7+VjnK/9dokVsgXZGamb6m4SFqqNOABm4t/Y/2d0rBb3+Zp1SiOc
         oPvg==
X-Forwarded-Encrypted: i=1; AHgh+RpZdL9POgzx3MgiabzGLxq62KU3nZkrg/fdMTVn0zMquSCLQdkHelaf+BYeEkBEz2a0RN6J5Vp6xVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPe7ApJiaGaxSGrKLRfMEsYkEQPGAvV1OVVN8OahXUeClh3aMp
	6jVFRBqOAZ2fw6NuSee5w/TjQceU71tbhrFNmoEPuMHJXO7tCQI49RXg
X-Gm-Gg: AfdE7ckpoKQuhxaWmbEcJkA+rEZFS77zym3Y9j4GY4HIsv2b1SnG982nYEDuSXljlao
	EhLT0rBxSVJkyC8wpSfucZalrCCWrHWOwncDyl8k9oXjw0icZBv8uQYj5TGq59ozqtFVGv8JfvT
	Nk93BOULqLZYUTf0ncJ++sJPxNi+5NMgOSe8B5LPH8f7H66ORulxFjXqO2UrqJEGNB1CmR+Izxm
	QT96RGYeCJsLuFyBZpR8P9ZxK4wymnp+RqeQc+uuR2Z6DvD2SnhaTlDTXIkEewqWBNDyib8/bvp
	VBNcYlVN3Pc6n/JmsJgmHajTAv68nlxtDdMURpE2uq7XC8c52/QIGkNj5W3id7zYHsg3NjV9ZE7
	rWUlCCmEBTeLwC9OuWVzaX7wDnT0EGdsUJF9QrbVG3k5W4Ip9T+U/9pOjRh9+m4YKmls1LzduaA
	fpcyeAtDc1cvg440mDLuapharSuWwIcVCqiyTFAZ3s
X-Received: by 2002:a17:902:d510:b0:2ca:e3f:6a44 with SMTP id d9443c01a7336-2ca0e3f6c59mr15492975ad.1.1782732062077;
        Mon, 29 Jun 2026 04:21:02 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm92759085ad.56.2026.06.29.04.20.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 04:21:01 -0700 (PDT)
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
Subject: [PATCH v5 2/6] mm/zswap: Support batch writeback in shrink_memcg()
Date: Mon, 29 Jun 2026 19:20:28 +0800
Message-Id: <20260629112032.20423-3-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260629112032.20423-1-jiahao.kernel@gmail.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
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

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 89 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 0f8f04f22888..e2c2a3f1e061 100644
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
@@ -1373,7 +1422,7 @@ static void shrink_worker(struct work_struct *w)
 			goto resched;
 		}
 
-		ret = shrink_memcg(memcg);
+		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
 		/* drop the extra reference */
 		mem_cgroup_put(memcg);
 
@@ -1394,7 +1443,7 @@ static void shrink_worker(struct work_struct *w)
 		}
 		++attempts;
 
-		if (ret && ++failures == MAX_RECLAIM_RETRIES)
+		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
 			break;
 resched:
 		cond_resched();
@@ -1504,7 +1553,7 @@ bool zswap_store(struct folio *folio)
 	objcg = get_obj_cgroup_from_folio(folio);
 	if (objcg && !obj_cgroup_may_zswap(objcg)) {
 		memcg = get_mem_cgroup_from_objcg(objcg);
-		if (shrink_memcg(memcg)) {
+		if (shrink_memcg(memcg, num_node_state(N_NORMAL_MEMORY)) <= 0) {
 			mem_cgroup_put(memcg);
 			goto put_objcg;
 		}
-- 
2.34.1

