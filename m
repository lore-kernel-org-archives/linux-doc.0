Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77053DEFF1
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000222; cv=none; b=NBGqqmD4wJC6Sk6wYP1QeWxBOfQKFr3QZOwyrIU1wEIHaChNt7JJDu0PrySsy2EOs57qJYrZogKjRfcoEElBxwJ7lQsQICalq40la0erm5tLksn/Y/6vph606/RzV5/SgdunQNWUfr0NPv1C2/XkWEkS/tLzGj0eBJGCbmdUUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000222; c=relaxed/simple;
	bh=iuubh3GxaCB8kP2Iv2dCi5tAwFrSn8rh02T1IyQsamw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p6QRio2fP8wS6RfYGCjeGct9KO2yuknUPvyEk1xfDhMxGQTz8TCyenDj3aFaYRYyZyJ17KnwX2clzIBLOjQWwwiYVA7+KBGKdJTu81AJOzcQIWx4UDG30398wT+LRzDPoG7Kg9XynuOKIVA2HzvpZEHCGaXmca6UxFGd2BOmIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppNQQdKH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppNQQdKH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84eb992a881so1712609b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786000220; x=1786605020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NholKuWtQvEG00t+vpLZ7cw0VYR49OMbVtszbQdNqzA=;
        b=ppNQQdKHGXm0ae8PpYwlLpbJm4wKHgDX6/SQcuZAvOwd2Y5mfNz45CjqiHiHxlWShB
         fJlaF7VLkV0UoFAi/ai0KTGTk5UjoU/g6ZdfcsHFF193SL5tR6rBOVW7G1UvGQK/6o99
         Kt/jhs0kOwkpx/Tvve7OsNeetF4zwJA6hOJ8Iii3g3j0w8Qya8j3jauu3Vx25IiUkQOs
         93GGkhCxcLZU1cVDWKfgoo0/fjHavl+wB+pm8PekxVj1p6FpDcwPMFjIwef7pYlJv3c2
         G4u1fFivjPZGvKUcfNN8F9ZlYa6YdQay8o2AtE3QUE+W5/FBzxxViqnJjHNwTJyPF194
         P+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786000220; x=1786605020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NholKuWtQvEG00t+vpLZ7cw0VYR49OMbVtszbQdNqzA=;
        b=ERAQ0KJq+C8r93dnukYvFWzAi5Dak6eC5Koa0NkLIWcfsiGSc91EQn0vAzwlAkKkNm
         SvRWJap5BZ5LGQjDz3aHPafckMuFVrOKdkyULOmOzXXqYDWxUDXLszM3vdp8BRgVYXsV
         uEAirAyOq+A2uCYEinkriJVUMAyCW8vmpBQjqP2q5YByjE1OeYIXyr7VYd4pktaCK3Qb
         oA4iz4JUbjSDdAc2DwhKiyDaNmWqcX3CvLN4g+z70kh6IfSlY/9J0Yzp1sFr+sKFtH0X
         HwzU9Y6fshQ/o+UwMrFNMKAVCaz9A+6p+kbG30vHv2S8T7b/2gLT52RljXP74GbLwA3s
         EkSg==
X-Forwarded-Encrypted: i=1; AHgh+RoYLIkVSYsrhWMvQmQlFwgdYWkY1NlJa2bULhfJ9CVaIxy4QT5F3ShGRjU0El5Hp0FPSyHaK+1+1zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrS74KuO5LemlNXKVf57GpsYUzra/Mjp2iiTXmMu7p6ZkbXQ+V
	4LYXfqp4guHEbcpbjST3fT0PsXhGdf0lpJJDH60PBpbU7q1LwJtYlHlu
X-Gm-Gg: AR+sD11iNr+xqWUkwelJ/dyjjDQx+Ri6IMvw/EsFaLgAkRFIfvXJik+Xx73VHAk+ZIN
	9Khek9AfQPoaU1AygducZSUnhzqtKTNdsBVA9iiFzhwNUZw9ESMEp86bnXS+RZAiK+XRbMaaD5X
	loMWKPh7p22E+t05iadjxleJkuG9dYwwMvxBKMXacRjO6L/F9Swe3zAYfnGSpP0ceftLTbC8kc2
	QTHjd7Ir0SpaYv/8sjyd/BybtA5S5tStAc+3KV5+JcufhDaSKQuN7qbXVIfCg9ltnJyEUCWOuTz
	9PUp28EpZ1tgAOA0QyEBspB9T4uFTkqRA0v92CD/m3GX66x68iI0SFFY6qiX3OijGmvL5li+/Yb
	ZlP2IOettnhN951TuQK8aUkUsZiDTm/gyE55fikfVs6PeTd4z1dWVRG7diFVUaDTyd+0bI38dBU
	87L2K+G/ae2hV5RyR37cSgZivf0VcvZckFk2g3xyJUdt1Tyc3sHDrNn2g/HwSpu/wfJQvDMiAUb
	enjI24YY8rEnuXOYz2LN0JF510=
X-Received: by 2002:a05:6a00:2e1a:b0:848:42a7:1854 with SMTP id d2e1a72fcca58-84f2e0c9c90mr13382273b3a.39.1786000219033;
        Thu, 06 Aug 2026 00:10:19 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm760154b3a.59.2026.08.06.00.10.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Aug 2026 00:10:18 -0700 (PDT)
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
Subject: [PATCH v4 2/2] mm/zswap: Support batch writeback in shrink_memcg()
Date: Thu,  6 Aug 2026 15:09:43 +0800
Message-Id: <20260806070943.95542-3-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260806070943.95542-1-jiahao.kernel@gmail.com>
References: <20260806070943.95542-1-jiahao.kernel@gmail.com>
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

To address this, extend the per-node scan budget in shrink_memcg() from a
single entry to up to SWAP_CLUSTER_MAX pages, enabling batch writeback for
both the shrink_worker() and zswap_store() paths.

Test Setup:
- Total memory: 32 GB, 1 NUMA node.
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
Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Yosry Ahmed <yosry@kernel.org>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 48fc7b575e24..ebbfe85ba7e8 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1275,6 +1275,14 @@ static struct shrinker *zswap_alloc_shrinker(void)
 	return shrinker;
 }
 
+/*
+ * Scan up to SWAP_CLUSTER_MAX pages on each per-node zswap LRU of @memcg
+ * and write back the reclaimable ones.
+ *
+ * Return: 0 if at least one entry was written back, -EAGAIN if entries
+ * were scanned but none could be written back, or -ENOENT if @memcg has
+ * writeback disabled, is a zombie cgroup, or has empty zswap LRUs.
+ */
 static int shrink_memcg(struct mem_cgroup *memcg)
 {
 	int nid, shrunk = 0, scanned = 0;
@@ -1290,13 +1298,14 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 		return -ENOENT;
 
 	for_each_node_state(nid, N_NORMAL_MEMORY) {
-		unsigned long nr_to_walk = 1;
+		unsigned long nr_to_walk = SWAP_CLUSTER_MAX;
 
 		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
 					    &shrink_memcg_cb, NULL, &nr_to_walk);
-		scanned += 1 - nr_to_walk;
+		scanned += SWAP_CLUSTER_MAX - nr_to_walk;
 	}
 
+	/* Nothing was scanned: every LRU under @memcg was empty. */
 	if (!scanned)
 		return -ENOENT;
 
-- 
2.34.1

