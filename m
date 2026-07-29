Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D493A7195
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314564; cv=none; b=J56ZqU5WNvpJNbdOyuJrqtBUJjOXeVFE7pyZydQiqp+MmHQYx5uovNJz9zaeJZhPBFqR8sSmx/GUYifCbebvMVymrQZZKT9UNIZjVVzXrCTsdFC73DURA2+XmSZ5hLraITREN+RKNtB5klfLTnv/xkbewQbrCJYmmYnD0+iJRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314564; c=relaxed/simple;
	bh=c6e8sdGl/Y564hCDqTlfzDVmcnUCQGDggtG9cOxIBeI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FYF8zUp0bUbFq/S8cwbj8W1o1Bj0fnnfP871dztgWGzRlK8SEdhhI98SgdpZEJml9za/Tb/YLtlSvkarWOs/2cm+pAlexgcI3kWLUUwtDpwI2NeVfV7SohOZsRyiqYvKY/oAl1iKVrOzt4ERzvsS6aP6S5ZaoPxl1QbQ7Z67iJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUh48zpH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUh48zpH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so454802a91.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785314562; x=1785919362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lW7K1TshKRQwVpxSydSGxpku6XFVIjRdVdgKlx/RWlw=;
        b=EUh48zpHexXQvfPDbM/PKJ7R9zjTQJN/XxTLB0WUWn+gpcR+i9XnTDVQLsn/3k2xT2
         b3Ls+sD4qAsyrJEd3c9nuh1y8Tiu+gCq1cIviZ0j4NQUrvWmbizSg2qjeMAKFaJgS2AI
         zqIa+dECIHCfqBunlF84Nbn6om527R+mI0mY/zME4EfFOf20WEpCDdOQYqv5IPzVjAAX
         YgBSbzsEqii69cM2Ibbt3x6pYzMUUuCyZBjdu5s/FhC6iHp/BztNORjsaENvTBCN2BWJ
         ASMEX9GJ8NIrFAEUbrHqgP1/w0Neb++o1/dY1Vng/w2dBxHWmxrrC4AOE7gGt1PqluGU
         NMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785314562; x=1785919362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW7K1TshKRQwVpxSydSGxpku6XFVIjRdVdgKlx/RWlw=;
        b=jF9sNA9E16We/BVkOOlhJVcJiM8edAkd/Bd+3EMEsrKZHHzW/zcmaBV75BqjMi3Gyh
         dHFELcSubKUKVTVfOsf5C/sNeLtjFIPpVUd8cEOFIrJiWfzMhVWbb6MgH6MfJq0uuq4I
         Eiz6EFTmHX2fnMUluJKtLWsqjVDOKngUWVjtXstgA0Slwq3O7NvM4lNlxpyPIbvhBAoy
         8dHG0EfJAFjexTkc6566lXR9hXOQvReLNIy5SGIBwNPL77VTYW/6zxioQQ+dcVUtU0Jf
         23lEc//Ei8wFvAAgg1k1KAX/aUhTdUeZEBmOh2UIp5XBgpsL4/9tcNVzwOIbAkLHR4yO
         gBJg==
X-Forwarded-Encrypted: i=1; AHgh+RoYbWTaDe6mtJ2BnqyhSG1kBIqvYAxIGUhpfdxAKiU0KuA/FWVJOEwHk+tbntmmqVMS1F8U+PH0z/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgGnnJhgclM9xcJiaOGrAorXG24mqnJ9ZeMhm7EsgdLSP7DB6
	cwhVduorOTCQpeC20xdRv8CBbVCGWKurbdLlPflbqSzz8mLqgcsHbC5k
X-Gm-Gg: AR+sD118kiKYnK9XQ1/YsvoqcJsToMcQJgoZ+iiPAyndFYmN3a0dGNMWqSX4vk7d9bn
	G2PfNntR8Fu2/2FTFt5mk76dSn0gBm1UoxzHMwQbHvN94pssK8ddTy5xBBnb1Ud21I53wGQEpIC
	oBsEwGtCCTMIEY9MVfocQB5G1j+VrPGxL0M0wB9tNtIKI527qMzi6qHOFYTultSsSlyVik9wnMf
	BEi6hToYN5BCV5Xynwk5Ns0xpB8YMBquAW4mDo4KDiLrmj2bvWCm7Cb6XgLmkj5MEcfc6s535Xa
	CGR2BGxLmiBxUnYGYbIQacwaD9kBQDFjLFgwsmchCetseqQZnBNBVS67He4/J1ARq8NhKmt9yA6
	jBM1gAVNi2AlSEcfGjgPFD6IXS2CBEZNMigeBlhxTXyb+x1bHSPDRlVolIxvw1vtBuxeS8NH4Rs
	3pzwx5u5mtkC/XlkD/Ff3sFA5r5kHQz1pW/LGda8GsvKqdKiDhPk5y55faOG/gbHwDv2FoWO/6N
	doKmPkBYyNclTyPdZyK9gzYGAbT
X-Received: by 2002:a17:90b:2e46:b0:38e:679f:3b3b with SMTP id 98e67ed59e1d1-38f6a57d6e5mr6107033a91.29.1785314562465;
        Wed, 29 Jul 2026 01:42:42 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2447744a91.17.2026.07.29.01.42.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 01:42:42 -0700 (PDT)
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
Subject: [PATCH v3 2/2] mm/zswap: Support batch writeback in shrink_memcg()
Date: Wed, 29 Jul 2026 16:42:06 +0800
Message-Id: <20260729084206.77793-3-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260729084206.77793-1-jiahao.kernel@gmail.com>
References: <20260729084206.77793-1-jiahao.kernel@gmail.com>
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
many pages are scanned per call. This enables setting the writeback batch
size to SWAP_CLUSTER_MAX for both the shrink_worker() and zswap_store() paths.

Test Setup:
- Total memory: 32 GB.
- zswap settings: accept_threshold_percent=50, shrinker_enabled=N.

Test Case 1:
Set max_pool_percent=1, allocate 512MB of anonymous pages, and fill them
with random data (to avoid compression). Then, use cgroup memory.reclaim
to force a large amount of anonymous pages into zswap. At an interval of
2ms, allocate a 4K anonymous page where the first 4 bytes are random numbers
and the rest are zeros, and then trigger reclamation of this 4K page through
cgroup memory.reclaim. When the pool threshold is reached, shrink_memcg()
will be triggered.
The test data after running for 120s is as follows:
                                Baseline      Patched
shrink_worker wakeups              5,363          169
shrink_memcg calls            11,373,201      350,703
written_back pages                40,212       40,241
zswap_store calls                161,190      163,753
   store succeeded (ret=1)       102,743      117,183
   store rejected (ret=0)         58,447       46,570
   store reject rate                ~36%        ~28%
pool_limit_hit delta              55,826       33,760
pswpout                           98,659       86,811
pswpin                                 2            0

Test Case 2:
We evaluated the following two sub-configurations using stress-ng inside
a cgroup capped at memory.max=1G for 120 seconds:
  Test Case 2a (max_pool_percent=1): Continuously triggers the global
  zswap pool limit, thereby waking up shrink_worker() to perform asynchronous
  shrinking.
  Test Case 2b (zswap.max=320M, max_pool_percent=50): Continuously triggers
  the cgroup's zswap.max limit, thereby invoking synchronous shrinking.
Command executed for both setups:
   bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
   exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t \
120s -q'

Test Case 2a (max_pool_percent=1):
                                Baseline       Patched
shrink_worker wakeups              5,640         1,308
shrink_memcg calls             8,481,500     3,140,972
written_back pages                   260       468,216
zswap_store calls              2,742,756     2,011,269
   store succeeded (ret=1)       934,640       947,988
   store rejected (ret=0)      1,808,116     1,063,281
   store reject rate                ~66%          ~52%
pool_limit_hit delta           1,181,310       196,882
pswpout                        1,808,376     1,531,497
pswpin                         4,288,497     3,635,365
Test Case 2b (zswap.max=320M, max_pool_percent=50):
                                Baseline       Patched
shrink_worker wakeups                 0              0
shrink_memcg calls              687,608         54,002
written_back pages              639,176        846,663
zswap_store calls             1,224,222      1,228,548
   store succeeded (ret=1)      992,816      1,208,123
   store rejected (ret=0)       231,431         20,425
   store reject rate               ~19%            ~2%
pool_limit_hit delta                  0              0
pswpout                         870,745        867,360
pswpin                        1,707,823      1,216,814

Under identical workloads and runtimes, batched zswap shrinking
exhibits a significant reduction in both shrink_worker() wakeups
and shrink_memcg() calls. Furthermore, the sharp drop in both pswpin
and zswap_store() rejections demonstrates that batching zswap shrink
operations effectively mitigates zswap_store() failures caused by
hitting the pool limit. This significantly prevents pages from bypassing
zswap and falling back directly to disk, thereby reducing LRU inversion.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Acked-by: Yosry Ahmed <yosry@kernel.org>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 48fc7b575e24..82dddfe74ef7 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1275,9 +1275,25 @@ static struct shrinker *zswap_alloc_shrinker(void)
 	return shrinker;
 }
 
-static int shrink_memcg(struct mem_cgroup *memcg)
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
@@ -1290,14 +1306,29 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 		return -ENOENT;
 
 	for_each_node_state(nid, N_NORMAL_MEMORY) {
-		unsigned long nr_to_walk = 1;
+		unsigned long nr_to_walk;
+
+		/*
+		 * Cap the scan at per-node LRU length so each entry is scanned
+		 * at most once per call.
+		 */
+		nr_to_walk = min(nr_remaining,
+				 list_lru_count_one(&zswap_list_lru, nid, memcg));
+		if (!nr_to_walk)
+			continue;
 
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
@@ -1369,7 +1400,7 @@ static void shrink_worker(struct work_struct *w)
 			goto resched;
 		}
 
-		ret = shrink_memcg(memcg);
+		ret = shrink_memcg(memcg, SWAP_CLUSTER_MAX);
 		/* drop the extra reference */
 		mem_cgroup_put(memcg);
 
@@ -1493,7 +1524,7 @@ bool zswap_store(struct folio *folio)
 	objcg = get_obj_cgroup_from_folio(folio);
 	if (objcg && !obj_cgroup_may_zswap(objcg)) {
 		memcg = get_mem_cgroup_from_objcg(objcg);
-		if (shrink_memcg(memcg)) {
+		if (shrink_memcg(memcg, SWAP_CLUSTER_MAX)) {
 			mem_cgroup_put(memcg);
 			goto put_objcg;
 		}
-- 
2.34.1

