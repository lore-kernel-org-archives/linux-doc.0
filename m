Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDE62C11C6
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 04:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758197; cv=none; b=uk4MDNDC4sMtd7+aLf5Ftfq3r3ONBWJth5vha3nA6ZHimdVwcJIcCMFeCvcEOmQdJHKBn2pSmKDndtUiWztLIcV6p4JOJ54u/vrU82NIrT3wIV+u+0Os+rEPw9usaacTOYwuMDDOH7iL9Sd2w8mu6bC+Gv14LHtrU9ndjNx7xKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758197; c=relaxed/simple;
	bh=YF1VqYtDfh/qM73g2Rpr89IjFyrI+p5pxTH6vyO1oZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tvO1zPYJ2QeVMKb3kaebxe2UbcdLca0YOyzgfHemA9Zw+Ut8jIpkD26G0BJk6Lo3H/bWiJlOb5snNJyFvXrWo6Ad5F2mm+9KhpKUH5FicFiaA8EziuxySlY+EiG724EMWnRKMx6zGWzHbEntUrr27pBLcg6IP5L6b59nwxBhkmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEbdq6ZO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEbdq6ZO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8453b56ab74so193376b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 21:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758196; x=1782362996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyhAjkY+9Qf6fDn3TYWufq6sYQTYoNNz/JFLMgng6yM=;
        b=bEbdq6ZOZUK7toDPQKD7Qhj4H4P7XWGD095GsfH3VTHRK9QP1AyBsAVZmR+tkbYAru
         Ci9SlhxxzGrhZjMcyhYeeoT/3QQKQ/g4URT6cKbhDUL6zb14StQGNlW9ipvvGV85o3LN
         pk6f4kBPSiIy49/UhTCm2i+xfkadCUJTNBeR3hSE3+iRU7HYLmCHyLU9P9yD1MSn+rxH
         +NEY/DBhLNMYNYbT0jWJZpGRpLwpD5hIZeh1mPSS760ZYNbjEkmNP/ruKa5uE/cg21ZM
         4pqvp3GveH0C3XRTTove5tz2rRqOksXkz2m6o+tFAyqnwrfAhp+uz3kB4pavVYX0TENE
         DJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758196; x=1782362996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lyhAjkY+9Qf6fDn3TYWufq6sYQTYoNNz/JFLMgng6yM=;
        b=d1qBnYfPT5KGzG1wGpHdTi3kHQ7NBJUBjI9RP26DeKE3pnm7nM8UttIolHjOofHf2S
         YTWSbnt+1v58CoHJHmzOTEwtZ0avgnVer7ZoIAL5PLufYk4TzHty0dC3sOxrSrJ+pIS0
         v0WMhlV0Y5xvgbEsH9SjLVH7oU/CvPLs4yRLkPtEWVn9BkOwEKynK3qrO4Sbc+CuB40C
         rRfToKmKHhzN5IAHAjkki6Lmd+NDsugDy8eMs8qrg5FLtydpoIpeg0D6PvktYmq1yfJi
         1osM0+VBC005W6Y26SgmBv31XXUuEleQia9Rmny/nQIHMFdUP4iF4SBVYTczQRUKeRJ5
         AFzA==
X-Forwarded-Encrypted: i=1; AFNElJ8xi+6Ml/CzPofzt13oviWTB9+z5WI0oYKNhDa3RXsO8n1VJbCFGXSC7EnyYJdfRNd21JxZ19pWZ+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzneq1exGOjImia9D9aKQfdaAuCOfiFpCvQ8LI+NjvBBywavgOZ
	yyb8VA4YfMavXODv9MNaG46SP8QjEbPQfBiqFyVOggUv5Lq93qq9JTkI
X-Gm-Gg: Acq92OFGPAvUk8ovd1DK7lRSEiUH+6fG9QmPPwOUdgz8Hjh4tPz27DDPGz3cF3pHH8R
	0DOn3wiVk0RsCbroSizVLrjlVUeQMadHX7w5BXTtTOEGjTSMPrb5qvZeFfTpHkmRle/XiO7DnrY
	5QIqSctjioYt9uUlKqCpc+lGQRfJH+JdqZAqLX4kO7qBxzGR9JvNkZzYSL80dlCNaE264jOnR4s
	UxBuiXwpGjzOHTbNAW8ggBm3YIbhgZaueDQimI1a5g50ITwSQsCpCLQF6lhTtgeC8a/lEzZFJRo
	WKXrqkiJzxl+pW0vIBQTE/NdmzgNSbkptFrRk3SnFZjqWR4xK7N5boaQTm1YXVyYs42Sue7o6pB
	pa+IAcPVs/KsAv5pplTOYnqSJHet/OYYm9ZP+exkU1TIhkbVE+ejpnTfFfRsdMTspy9/7fBSPnZ
	wzbZc/Iq59GZzwklpFgn/duAfl8HQttoroJ+cMg3+7
X-Received: by 2002:a05:6a00:2192:b0:845:3ac5:1b8a with SMTP id d2e1a72fcca58-8453ac51e2cmr2039626b3a.0.1781758195707;
        Wed, 17 Jun 2026 21:49:55 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17214781b3a.47.2026.06.17.21.49.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 21:49:55 -0700 (PDT)
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
Subject: [PATCH v4 4/5] mm/zswap: Add per-memcg stat for proactive writeback
Date: Thu, 18 Jun 2026 12:48:56 +0800
Message-Id: <20260618044857.69439-5-jiahao.kernel@gmail.com>
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

Add a new stat zswpwb_proactive_b to memory.stat. This counter is
incremented by entry->length during proactive writebacks triggered
via the zswap_writeback_only key in memory.reclaim. It tracks the
compressed size (in bytes) of pages proactively written back from
zswap to swap, allowing users to better monitor and tune the
proactive writeback mechanism.

Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  4 ++++
 include/linux/memcontrol.h              |  1 +
 mm/memcontrol.c                         |  3 +++
 mm/zswap.c                              | 23 ++++++++++++++++++-----
 4 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index e52d97e8e9c6..c164bb415002 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1748,6 +1748,10 @@ The following nested keys are defined.
 	  zswpwb
 		Number of pages written from zswap to swap.
 
+	  zswpwb_proactive_b
+		Bytes of compressed data proactively written back from
+		zswap to swap via memory.reclaim zswap_writeback_only key.
+
 	  zswap_incomp
 		Number of incompressible pages currently stored in zswap
 		without compression. These pages could not be compressed to
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index e1f46a0016fc..56580b264dc4 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -40,6 +40,7 @@ enum memcg_stat_item {
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
 	MEMCG_ZSWAP_INCOMP,
+	MEMCG_ZSWPWB_PROACTIVE_B,
 	MEMCG_NR_STAT,
 };
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 56cd4af08232..5ffb5095f0ee 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -433,6 +433,7 @@ static const unsigned int memcg_stat_items[] = {
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
 	MEMCG_ZSWAP_INCOMP,
+	MEMCG_ZSWPWB_PROACTIVE_B,
 };
 
 #define NR_MEMCG_NODE_STAT_ITEMS ARRAY_SIZE(memcg_node_stat_items)
@@ -1558,6 +1559,7 @@ static const struct memory_stat memory_stats[] = {
 	{ "zswap",			MEMCG_ZSWAP_B			},
 	{ "zswapped",			MEMCG_ZSWAPPED			},
 	{ "zswap_incomp",		MEMCG_ZSWAP_INCOMP		},
+	{ "zswpwb_proactive_b",		MEMCG_ZSWPWB_PROACTIVE_B	},
 #endif
 	{ "file_mapped",		NR_FILE_MAPPED			},
 	{ "file_dirty",			NR_FILE_DIRTY			},
@@ -1614,6 +1616,7 @@ static int memcg_page_state_unit(int item)
 	switch (item) {
 	case MEMCG_PERCPU_B:
 	case MEMCG_ZSWAP_B:
+	case MEMCG_ZSWPWB_PROACTIVE_B:
 	case NR_SLAB_RECLAIMABLE_B:
 	case NR_SLAB_UNRECLAIMABLE_B:
 		return 1;
diff --git a/mm/zswap.c b/mm/zswap.c
index 28200552dde3..d78bacf80209 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -163,6 +163,7 @@ struct zswap_pool {
 struct zswap_shrink_walk_arg {
 	unsigned long bytes_written;
 	bool encountered_page_in_swapcache;
+	bool proactive;
 };
 
 /* Global LRU lists shared by all zswap pools. */
@@ -990,7 +991,8 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
  * freed.
  */
 static int zswap_writeback_entry(struct zswap_entry *entry,
-				 swp_entry_t swpentry)
+				 swp_entry_t swpentry,
+				 bool proactive)
 {
 	struct xarray *tree;
 	pgoff_t offset = swp_offset(swpentry);
@@ -1045,6 +1047,15 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	if (entry->objcg)
 		count_objcg_events(entry->objcg, ZSWPWB, 1);
 
+	if (proactive && entry->objcg) {
+		struct mem_cgroup *memcg;
+
+		rcu_read_lock();
+		memcg = obj_cgroup_memcg(entry->objcg);
+		mod_memcg_state(memcg, MEMCG_ZSWPWB_PROACTIVE_B, entry->length);
+		rcu_read_unlock();
+	}
+
 	zswap_entry_free(entry);
 
 	/* folio is up to date */
@@ -1155,7 +1166,7 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 	 */
 	spin_unlock(&l->lock);
 
-	writeback_result = zswap_writeback_entry(entry, swpentry);
+	writeback_result = zswap_writeback_entry(entry, swpentry, walk_arg->proactive);
 
 	if (writeback_result) {
 		zswap_reject_reclaim_fail++;
@@ -1184,6 +1195,7 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 	struct zswap_shrink_walk_arg walk_arg = {
 		.bytes_written = 0,
 		.encountered_page_in_swapcache = false,
+		.proactive = false,
 	};
 	unsigned long shrink_ret;
 
@@ -1305,11 +1317,12 @@ static struct shrinker *zswap_alloc_shrinker(void)
  * writeback disabled, is a zombie cgroup, or has empty zswap LRUs.
  */
 static long shrink_memcg(struct mem_cgroup *memcg,
-			 unsigned long nr_to_writeback)
+			 unsigned long nr_to_writeback, bool proactive)
 {
 	struct zswap_shrink_walk_arg walk_arg = {
 		.bytes_written = 0,
 		.encountered_page_in_swapcache = false,
+		.proactive = proactive,
 	};
 	u64 bytes_to_writeback = nr_to_writeback << PAGE_SHIFT;
 	bool memcg_list_is_empty = true;
@@ -1492,7 +1505,7 @@ static int zswap_try_to_writeback(struct mem_cgroup *memcg,
 		}
 
 		batch_size = min(upper_pages - lower_pages, NR_ZSWAP_WB_BATCH);
-		shrunk = shrink_memcg(iter_memcg, batch_size);
+		shrunk = shrink_memcg(iter_memcg, batch_size, proactive);
 		/* drop the extra reference */
 		mem_cgroup_put(iter_memcg);
 
@@ -1642,7 +1655,7 @@ bool zswap_store(struct folio *folio)
 	objcg = get_obj_cgroup_from_folio(folio);
 	if (objcg && !obj_cgroup_may_zswap(objcg)) {
 		memcg = get_mem_cgroup_from_objcg(objcg);
-		if (shrink_memcg(memcg, 1) <= 0) {
+		if (shrink_memcg(memcg, 1, false) <= 0) {
 			mem_cgroup_put(memcg);
 			goto put_objcg;
 		}
-- 
2.34.1

