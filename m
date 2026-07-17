Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC3377AAB
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278343; cv=none; b=pF1x+BCLgbKeXedmRl9zIMsbo8VaI1gUMflBv6F8Oq79ihshfbKYIWZVP5bTJtIE579YwXQ3cmjOtiF4sI0wAYDY/vQTdqiCoEEahUKfgkbJ0bMu3qRD9K0nJ4z5XIKJBFLiWaKS7abvPdrzrWv/+faNMpiw1KQZ9x8mnKRZuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278343; c=relaxed/simple;
	bh=xaylzQGm3XlQeVpD4W6mIwMTYmCT1luwxC2820fJ9F0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t96UsnVf5QNA0tLqhwKIhXbAqts6xp+MnOaudNrQ9B1TMPmcIFv62s0eu/xW5+uhhYV1TBZyilHqTaCN8d9TLGoS+us0wDZE+E368CkKw5p8b2ZyisLUuyMUKFzrU9TAFUa/r39cBfVJJ4ACt824u2VUUVSBsgQvcHVNfcwi2Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c630a9GX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c630a9GX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8484a0b998fso6509251b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784278341; x=1784883141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAaayER3b5hTUVDck3FSxcWjhNxHvBfs9GbGsiNXdFQ=;
        b=c630a9GXW/NVTncgLhskhN505yrAIadBRmpVTe1ndFYVkUUlLMOjpDwsFkHYSKy56m
         w2R0JM44kx6tomrxjFbZPrRvzlKVniftlvo3SLFHQaKjWHiqgDLWh7RWMoIckyBZmSjJ
         nNfEogtw4DcPG1fTzbBlsXPhlBf9Jp41o61wwyAsGLjG0lJOm5DRWloF5iyM9OyAoDAc
         T4h6ZZaWRaai2N1BMy6alnwGBPGmn7lOgAiV2tWziT//lZh+GVqBe+MpKJow04F7mvhj
         RFpFkJkVlWr64lMgNNFnCiiPWobSUhlxKG04skdeuXpz8+CjNDReAl+g3MrzKOk0AVtR
         56bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278341; x=1784883141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAaayER3b5hTUVDck3FSxcWjhNxHvBfs9GbGsiNXdFQ=;
        b=WopYPe5YewPi+xpr79s5BMbhdimz/gVXKmkcZ8Dx6mkLasW6j2YTL4gz4upgwErON/
         D8nidiYb2QVSo0SJW1vOJ7wO7bJf1PRwLmXXseykZPU+4K73AR4CHopNM0TfWz35Bfe7
         V5qnezPPeF8CDXzN88gEKQ+SnPJJpDaC5typYNqp48JnA03KcFO/n66/qNBN2Byg1K1L
         E0cdI+yGmEa/dDLu6mO/xzWRXgP6QFbMFSByJY5gP0dOqKJKdfCMq2Pvv43GKiyTtyDG
         5pNcntqYOVxwG8pDr2Q94FMCEgec0BVCeoG+nFaUlWWm6JIh8KF7/nTI0722/9ff0cy9
         QcyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2o51ntSk8f13tQNVQTLpGL4WKr4KPdhBamTm+ujpQ1SSyVT7g0U0+E+rs6SyLObFUB5yDU9i6b4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwIrVhMkQAw9TLeEotomZzheLD9C1QkqYWwrrfvS4ULiwatOj8
	C8wyINRYfj+hYvmilu2/tEWdlC/0Er3c6BmBNpkRZvLSOepGXrRLaoBtycOx0A==
X-Gm-Gg: AfdE7cla3G5zaER82MBgf5X1j4v1xcAPVA0PEMgXx9wpYDPnoCpm2ZFo+clUYbi5cna
	lP5joaAx/OEZHUEeTaJ+6+uCMdbK3RDIqylJS+yehyeBis2vD6FfuFDEs3A+Wb4WXH0UfXqZ/cr
	gdmKGXsUbh6upsOYmtjSHusac0+QlVWCxlxlns0AfJbD9md++v4Vpus1GLkhEG01XW++bxQOp2w
	VWT1QWcOErMOLghHyXiCwSdK6oj6Sbf9rn7D4hcoZkNzvOKr1pXTzWbau2yM/CrsrE36TO44Zj9
	BSNAsYmsxoAbceUu3mUHJfWbr5gcyTZmdefpgWkXj6gNzpMut/4Ltd0E4YcsqgePb96ZmdrP2SN
	mMMw35ek/QjR6BM11m1dw1YVaZIhhsnFxumRju/yUH9+ICO3hAV8lSt3Ogo2Cwfz80uRbkKra6Z
	zGz7P+SF5YORRxeHpXgUaTZ9W0BfFe7Q==
X-Received: by 2002:a05:6a00:44c5:b0:845:e08c:a4eb with SMTP id d2e1a72fcca58-84c29519471mr1855968b3a.58.1784278341157;
        Fri, 17 Jul 2026 01:52:21 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9f477sm619474b3a.58.2026.07.17.01.52.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 01:52:20 -0700 (PDT)
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
Subject: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
Date: Fri, 17 Jul 2026 16:51:51 +0800
Message-Id: <20260717085151.22822-3-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260717085151.22822-1-jiahao.kernel@gmail.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
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
Under high memory pressure, this can cause the writeback speed to be
too slow to keep up with refaults, leading to zswap store failures and
forcing pages to skip zswap and go directly to disk, which results in
an LRU inversion.

To address this, extend shrink_memcg() and rewrite its LRU iteration logic
to support batch writeback. Introduce the nr_to_scan parameter to bound how
many pages are scanned per call. This enables batch writeback in the
shrink_worker() path, while maintaining a low scan budget in the
zswap_store() path.

Test Setup:
- Total memory: 32 GB.
- zswap settings: max_pool_percent=1, accept_threshold_percent=50,
  shrinker_enabled=N.

Test Case 1:
Allocate 512MB of anonymous pages and fill them with random data (to avoid
compression), then use cgroup memory.reclaim to force a large amount of
anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymous
page where the first 4 bytes are random numbers and the rest are zeros, and
then trigger a reclamation of this 4K anonymous page through cgroup
memory.reclaim. When the pool threshold is reached, shrink_memcg() will
be triggered.
The test data after running for 120s is as follows:
                                Baseline       Patched
shrink_worker wakeups              5,363            85
shrink_memcg calls            11,373,201       180,928
written_back pages                40,212        40,236
zswap_store calls                161,190       168,741
   store succeeded (ret=1)       102,743       127,644
   store rejected (ret=0)         58,447        41,097
   store reject rate                ~36%          ~24%
pool_limit_hit delta              55,826        14,062
pswpout                           98,659        81,333
pswpin                                 2             1

Test Case 2:
To consistently force zswap store failures and trigger shrink_worker(),
the following stress-ng command was run for 120 seconds within a cgroup
limited to a memory.max of 1G:
   bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
   exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t \
120s -q'
The test data after running for 120s is as follows:
                                Baseline       Patched
shrink_worker wakeups              5,640           987
shrink_memcg calls             8,481,500     2,504,818
written_back pages                   260       768,576
zswap_store calls              2,742,756     2,301,414
   store succeeded (ret=1)       934,640     1,308,686
   store rejected (ret=0)      1,808,116       992,728
   store reject rate                ~66%          ~43%
pool_limit_hit delta           1,181,310       101,593
pswpout                        1,808,376     1,761,304
pswpin                         4,288,497     3,902,658

Under identical workloads and runtimes, batching the zswap shrinker
exhibits a significant reduction in both shrink_worker wakeups and
shrink_memcg calls. Furthermore, the sharp drop in both pool_limit_hit
and zswap_store rejections demonstrates that batching the zswap shrinker
effectively mitigates zswap_store failures caused by hitting the pool
limit. This significantly prevents pages from bypassing zswap and falling
back directly to disk, thereby reducing LRU inversion.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 48fc7b575e24..6a09b9ebfd25 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1275,9 +1275,27 @@ static struct shrinker *zswap_alloc_shrinker(void)
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
+ * Return: 0 if at least one entry was written back, -EAGAIN if entries
+ * were scanned but none could be written back, or -ENOENT if @memcg has
+ * writeback disabled, is a zombie cgroup, or has empty zswap LRUs.
+ */
+static int shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
 {
-	int nid, shrunk = 0, scanned = 0;
+	unsigned long nr_remaining = nr_to_scan;
+	int nid, shrunk = 0;
 
 	if (!mem_cgroup_zswap_writeback_enabled(memcg))
 		return -ENOENT;
@@ -1290,14 +1308,29 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 		return -ENOENT;
 
 	for_each_node_state(nid, N_NORMAL_MEMORY) {
-		unsigned long nr_to_walk = 1;
+		unsigned long nr_to_walk;
 
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
 		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
 					    &shrink_memcg_cb, NULL, &nr_to_walk);
-		scanned += 1 - nr_to_walk;
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
 
 	return shrunk ? 0 : -EAGAIN;
@@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct *w)
 			goto resched;
 		}
 
-		ret = shrink_memcg(memcg);
+		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
 		/* drop the extra reference */
 		mem_cgroup_put(memcg);
 
@@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
 	objcg = get_obj_cgroup_from_folio(folio);
 	if (objcg && !obj_cgroup_may_zswap(objcg)) {
 		memcg = get_mem_cgroup_from_objcg(objcg);
-		if (shrink_memcg(memcg)) {
+		if (shrink_memcg(memcg, 1)) {
 			mem_cgroup_put(memcg);
 			goto put_objcg;
 		}
-- 
2.34.1

