Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B90280A58
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 04:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758189; cv=none; b=RIYuXfMtvcUkFhxpEM3yGGyfGpHX5sU6bNrH+Zhplcweaht7fFoblZzIpRXiHqUYwZ+v348yRgPMrtzAT2bcPU/LtPGq4GGNRugL5NBOUjuJQlnNYXKDgHPlfkr+K6IucD78046UpeKO2TMoyByfdN7J8Qy6wAmPKcjlm23xuJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758189; c=relaxed/simple;
	bh=HCtUpjIPIG5Uugov2OV8ihV47rK3YaTGz6VtefggPpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AP4JAgXNobOPGGOMa48wLKlaKFce+tuZ/kKcSPDasHVOYyvkHzh9cUtwxQGzBWd/FFW3y6+444GGCj6g4LArCWJuv7myPQig9GeNEFaW8U3ZycJnHJlTmitK809AFwV5j16bRw3ok7YJHQrcupudMkocSPbrl7hIt7gPOwRAqb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/1GzSwX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/1GzSwX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-842307472d4so182097b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 21:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758187; x=1782362987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1papM2W9KLSMiQ51HSi85TiIoRBa0nUKenc379MiLQ=;
        b=J/1GzSwXzubbus1l2KW2xxT8eWDCiQS6d3n1wagJUMT8oGhVB3RDvuzGtuado7ucXO
         k4RrdK/dOIIkuaPCmrsfEfz385YAEsNmIVlKlMMchPGYcUHleG3kkZbdQJyEBHzPWJd2
         0nsc2WBV3bCdrSOjX/RsilTGAjRaaHM1ZqTRTO0IKGTlpHwzGUZSVQfVieYC7qV1O/d1
         XYFQquii0U1z7jGP7ObI1j9Xc3ftvDYhQwKu/0+3cj8NFMnjNpzbCJWD774NsSCfSQuD
         f8eQz5GPwVmKHacl7ZgnfKdIc9gRtw15ln3X5q7+3h9UcAW82kNE2Sf3bv7yF8r9oozk
         Wp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758187; x=1782362987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w1papM2W9KLSMiQ51HSi85TiIoRBa0nUKenc379MiLQ=;
        b=Wyz5AqhTq7jGnRJ9jYsJTa/XTsB+FlDxgMvbryLfVeagLW+sQpBcrI39GBfTWiFsAY
         /N2hRELJ/TfgK227pGo+6CHMIKXRzx4H5ezuLh5zy5WxR5jeMQwQzye7iZC7b/KgG8R4
         62QkMly4SfDmHBskiTA5jthhW5FfZG3QAxrYmJARjd4nauI7v2p4Nnal4Mx8ww9xhaMj
         6VVG03APM/dNGDOQBpsYFF0IQBIHvz+FCBB5BxOaWsYiDRjuH/4LFLh6ST49WuiiK1el
         +JNuP5/ZQJ1qURSqFrTx/A3BdYus0GIc2rKdnr2ZbpfCWL1FEY7FPqa6fQ0YvosX4AlF
         BI2g==
X-Forwarded-Encrypted: i=1; AFNElJ8LfdEOMkEljty73lPw17cG1tHdFYgM1dEjCde8TwZsI+ftfgLu1tCuk+cQL3w9lkK9PHKO0R9Yi5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8hHjxLLU6zwZv8DdeGqu652pKmXpGFxxODEz78dUD/QsRpRDR
	oZAYjD5j/klja8b47NZTWjIGgVbtB8hDL7Ef/4wgm6CfxEdf/h/Hu1oj
X-Gm-Gg: Acq92OFzjVd2SQPm5JnkF4eC1TRpAuMBU8CCD1qZiD1CWi9TB6jdNHviBf03m0DEKpn
	MrmklyKFdJb6PZYm3r8KdAR8UKEKkgw/GpC7Tn2IW25y4dwwX3gGguFXcHJ0AMtVbW+2Y+xu14Y
	/dWQ4aXBEZn6yoqZxhJFHEMWRh7AkTeajbN+AZUJvc7cDeSKVA4cx0gokeaJTOkAtnvRP9nwQOq
	jHWvavB7YFJTXsWkAOK3MdtQ1hjKN4EY6lIfOvYxC5mH6IbGbAkie1dJJIQAmm66vL2IZFP6b/F
	ixqFfPYDZ3JvCvF6n86f5OB+qVYqPCAL6pC4zVtW8WyQW3cZfNRiwhv397ZhNUMqS8zNrU6dZvk
	kUdExh10xa/KAKP6w6plSGt3yaX3YHZSnDMKF4XJhO8tUC1cgdFSbo5PyEM+qh19EaJbCmpL/rk
	S55xe/nyaMd5/Yl4nEREsl3LE48K0VB2/vY9/Ke/mv+Bxa6S890/s=
X-Received: by 2002:a05:6a00:23d4:b0:842:7476:2376 with SMTP id d2e1a72fcca58-84541db467bmr952550b3a.41.1781758187176;
        Wed, 17 Jun 2026 21:49:47 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17214781b3a.47.2026.06.17.21.49.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 21:49:46 -0700 (PDT)
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
Subject: [PATCH v4 3/5] mm/zswap: Implement proactive writeback
Date: Thu, 18 Jun 2026 12:48:55 +0800
Message-Id: <20260618044857.69439-4-jiahao.kernel@gmail.com>
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

Zswap currently writes back pages to backing swap reactively, triggered
either by the shrinker or when the pool reaches its size limit. There is
no mechanism to control the amount of writeback for a specific memory
cgroup. However, users may want to proactively write back zswap pages,
e.g., to free up memory for other applications or to prepare for
memory-intensive workloads.

Introduce a "zswap_writeback_only" key to the memory.reclaim cgroup
interface. When specified, this key bypasses standard memory reclaim
and exclusively performs proactive zswap writeback up to the requested
budget. If omitted, the default reclaim behavior remains unchanged.

Example usage:
  # Write back 10MB of compressed data from zswap to the backing swap
  echo "10M zswap_writeback_only" > memory.reclaim

Note that the actual amount of compressed data written back may be less
than requested due to the zswap second-chance algorithm: referenced
entries are rotated on the LRU on the first encounter and only written
back on a second pass. If fewer bytes are written back than requested,
-EAGAIN is returned, matching the existing memory.reclaim semantics.

Internally, extend user_proactive_reclaim() to parse the new
"zswap_writeback_only" token and invoke the dedicated handler
zswap_proactive_writeback(). This handler reuses
zswap_try_to_writeback() to walk the target memcg subtree, draining
per-node zswap LRUs through list_lru_walk_one() with the
shrink_memcg_cb() callback.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 18 ++++-
 Documentation/admin-guide/mm/zswap.rst  | 11 +++-
 include/linux/zswap.h                   |  7 ++
 mm/vmscan.c                             | 14 ++++
 mm/zswap.c                              | 87 +++++++++++++++++++++----
 5 files changed, 120 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 6efd0095ed99..e52d97e8e9c6 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1425,9 +1425,10 @@ PAGE_SIZE multiple when read back.
 
 The following nested keys are defined.
 
-	  ==========            ================================
+	  ====================  ==================================================
 	  swappiness            Swappiness value to reclaim with
-	  ==========            ================================
+	  zswap_writeback_only  Only perform proactive zswap writeback
+	  ====================  ==================================================
 
 	Specifying a swappiness value instructs the kernel to perform
 	the reclaim with that swappiness value. Note that this has the
@@ -1437,6 +1438,19 @@ The following nested keys are defined.
 	The valid range for swappiness is [0-200, max], setting
 	swappiness=max exclusively reclaims anonymous memory.
 
+	The zswap_writeback_only key skips ordinary memory reclaim and
+	writes back pages from zswap to the backing swap device until
+	the requested amount has been written or no further candidates
+	are found. This is useful to proactively offload cold compressed
+	data from the zswap pool to the swap device. It is only available
+	if zswap writeback is enabled. zswap_writeback_only cannot be
+	combined with swappiness; specifying both returns -EINVAL.
+
+	Example::
+
+	  # Writeback up to 10MB of compressed data from zswap to the backing swap
+	  echo "10M zswap_writeback_only" > memory.reclaim
+
   memory.peak
 	A read-write single value file which exists on non-root cgroups.
 
diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
index 2464425c783d..fdeb197d1683 100644
--- a/Documentation/admin-guide/mm/zswap.rst
+++ b/Documentation/admin-guide/mm/zswap.rst
@@ -131,7 +131,16 @@ User can enable it as follows::
   echo Y > /sys/module/zswap/parameters/shrinker_enabled
 
 This can be enabled at the boot time if ``CONFIG_ZSWAP_SHRINKER_DEFAULT_ON`` is
-selected.
+selected. Once enabled, the shrinker automatically writes back zswap pages to
+backing swap during memory reclaim.
+
+If users want to explicitly trigger proactive zswap writeback for a specific
+memory cgroup without invoking standard page reclaim, it can be done as follows::
+
+	echo "10M zswap_writeback_only" > /sys/fs/cgroup/<cgroup-name>/memory.reclaim
+
+Both of the methods mentioned above are subject to the ``memory.zswap.writeback``
+control. This means that ``memory.zswap.writeback`` can prevent all zswap writeback.
 
 A debugfs interface is provided for various statistic about pool size, number
 of pages stored, same-value filled pages and various counters for the reasons
diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index 30c193a1207e..7bf38318dab1 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -35,6 +35,7 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
 void zswap_folio_swapin(struct folio *folio);
 bool zswap_is_enabled(void);
 bool zswap_never_enabled(void);
+int zswap_proactive_writeback(struct mem_cgroup *memcg, unsigned long nr_to_writeback);
 #else
 
 struct zswap_lruvec_state {};
@@ -69,6 +70,12 @@ static inline bool zswap_never_enabled(void)
 	return true;
 }
 
+static inline int zswap_proactive_writeback(struct mem_cgroup *memcg,
+					    unsigned long nr_to_writeback)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* _LINUX_ZSWAP_H */
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 299b5d9e8836..2e6c14569fc2 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -64,6 +64,7 @@
 
 #include <linux/swapops.h>
 #include <linux/sched/sysctl.h>
+#include <linux/zswap.h>
 
 #include "internal.h"
 #include "swap.h"
@@ -7855,11 +7856,13 @@ static unsigned long __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask,
 enum {
 	MEMORY_RECLAIM_SWAPPINESS = 0,
 	MEMORY_RECLAIM_SWAPPINESS_MAX,
+	MEMORY_RECLAIM_ZSWAP_WRITEBACK_ONLY,
 	MEMORY_RECLAIM_NULL,
 };
 static const match_table_t tokens = {
 	{ MEMORY_RECLAIM_SWAPPINESS, "swappiness=%d"},
 	{ MEMORY_RECLAIM_SWAPPINESS_MAX, "swappiness=max"},
+	{ MEMORY_RECLAIM_ZSWAP_WRITEBACK_ONLY, "zswap_writeback_only"},
 	{ MEMORY_RECLAIM_NULL, NULL },
 };
 
@@ -7869,6 +7872,7 @@ int user_proactive_reclaim(char *buf,
 	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
 	unsigned long nr_to_reclaim, nr_reclaimed = 0;
 	int swappiness = -1;
+	bool zswap_writeback_only = false;
 	char *old_buf, *start;
 	substring_t args[MAX_OPT_ARGS];
 	gfp_t gfp_mask = GFP_KERNEL;
@@ -7899,11 +7903,21 @@ int user_proactive_reclaim(char *buf,
 		case MEMORY_RECLAIM_SWAPPINESS_MAX:
 			swappiness = SWAPPINESS_ANON_ONLY;
 			break;
+		case MEMORY_RECLAIM_ZSWAP_WRITEBACK_ONLY:
+			zswap_writeback_only = true;
+			break;
 		default:
 			return -EINVAL;
 		}
 	}
 
+	if (zswap_writeback_only) {
+		/* zswap_writeback_only and swappiness are mutually exclusive. */
+		if (swappiness != -1)
+			return -EINVAL;
+		return zswap_proactive_writeback(memcg, nr_to_reclaim);
+	}
+
 	while (nr_reclaimed < nr_to_reclaim) {
 		/* Will converge on zero, but reclaim enforces a minimum */
 		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
diff --git a/mm/zswap.c b/mm/zswap.c
index e29f8a61412d..28200552dde3 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1423,6 +1423,27 @@ static struct mem_cgroup *zswap_iter_global(void)
 	return memcg;
 }
 
+/*
+ * Local iteration uses a local cursor to select from online memcgs
+ * under @root in a round-robin fashion.
+ *
+ * Pass the previous return value as @prev to advance the round-robin
+ * iteration, or pass NULL to start a new walk. If exiting early before
+ * the iteration completes, the caller must call mem_cgroup_iter_break()
+ * to release the cursor reference.
+ */
+static struct mem_cgroup *zswap_iter_local(struct mem_cgroup *root,
+					   struct mem_cgroup *prev)
+{
+	struct mem_cgroup *memcg;
+
+	do {
+		memcg = mem_cgroup_iter(root, prev, NULL);
+		prev = memcg;
+	} while (memcg && !mem_cgroup_tryget_online(memcg));
+	return memcg;
+}
+
 /*
  * Walk the memcg tree and write back zswap pages until the
  * (lower_pages, upper_pages) window closes, or abort encounter
@@ -1430,16 +1451,23 @@ static struct mem_cgroup *zswap_iter_global(void)
  * - No writeback-candidate memcgs found in a memcg tree walk.
  * - Shrinking a writeback-candidate memcg failed.
  *
- * For shrink_worker(), it passes lower=thr and upper=zswap_total_pages().
- * The @upper limit is refreshed in each iteration by re-evaluating
- * zswap_total_pages(), and the window closes once the total falls
- * below the threshold.
+ * For shrink_worker() (proactive=false), it passes lower=thr and
+ * upper=zswap_total_pages(). The @upper limit is refreshed in each
+ * iteration by re-evaluating zswap_total_pages(), and the window
+ * closes once the total falls below the threshold.
+ *
+ * For zswap_proactive_writeback() (proactive=true), it passes lower=0
+ * and upper=nr_to_writeback. The @lower limit is advanced by the
+ * compressed bytes written back via shrink_memcg(). The window closes
+ * once @nr_to_writeback pages of compressed data have been written back.
  */
-static void zswap_try_to_writeback(unsigned long lower_pages,
-				   unsigned long upper_pages)
+static int zswap_try_to_writeback(struct mem_cgroup *memcg,
+				  unsigned long lower_pages,
+				  unsigned long upper_pages, bool proactive)
 {
-	int failures = 0, attempts = 0;
-	struct mem_cgroup *iter_memcg;
+	int ret = 0, failures = 0, attempts = 0;
+	struct mem_cgroup *iter_memcg = NULL;
+	u64 bytes_written = 0;
 
 	while (lower_pages < upper_pages) {
 		unsigned long batch_size;
@@ -1447,14 +1475,17 @@ static void zswap_try_to_writeback(unsigned long lower_pages,
 
 		cond_resched();
 
-		iter_memcg = zswap_iter_global();
+		iter_memcg = proactive ? zswap_iter_local(memcg, iter_memcg)
+				       : zswap_iter_global();
 		if (!iter_memcg) {
 			/*
 			 * Continue shrinking without incrementing failures if
 			 * we found candidate memcgs in the last tree walk.
 			 */
-			if (!attempts && ++failures == MAX_RECLAIM_RETRIES)
+			if (!attempts && ++failures == MAX_RECLAIM_RETRIES) {
+				ret = -EAGAIN;
 				break;
+			}
 
 			attempts = 0;
 			continue;
@@ -1465,8 +1496,17 @@ static void zswap_try_to_writeback(unsigned long lower_pages,
 		/* drop the extra reference */
 		mem_cgroup_put(iter_memcg);
 
-		/* zswap total pages might have changed, refresh it. */
-		upper_pages = zswap_total_pages();
+		/*
+		 * Advance the window endpoint owned by this caller:
+		 *  - !proactive: zswap total pages might have changed, refresh.
+		 *  -  proactive: accumulate bytes freed and fold to pages.
+		 */
+		if (!proactive) {
+			upper_pages = zswap_total_pages();
+		} else if (shrunk > 0) {
+			bytes_written += shrunk;
+			lower_pages = DIV_ROUND_UP(bytes_written, PAGE_SIZE);
+		}
 
 		/*
 		 * There are no writeback-candidate pages in the memcg.
@@ -1478,9 +1518,15 @@ static void zswap_try_to_writeback(unsigned long lower_pages,
 			continue;
 		++attempts;
 
-		if (shrunk <= 0 && ++failures == MAX_RECLAIM_RETRIES)
+		if (shrunk <= 0 && ++failures == MAX_RECLAIM_RETRIES) {
+			ret = -EAGAIN;
 			break;
+		}
 	}
+
+	if (proactive)
+		mem_cgroup_iter_break(memcg, iter_memcg);
+	return ret;
 }
 
 static void shrink_worker(struct work_struct *w)
@@ -1490,7 +1536,7 @@ static void shrink_worker(struct work_struct *w)
 	/* Reclaim down to the accept threshold */
 	thr = zswap_accept_thr_pages();
 
-	zswap_try_to_writeback(thr, zswap_total_pages());
+	zswap_try_to_writeback(NULL, thr, zswap_total_pages(), false);
 }
 
 /*********************************
@@ -1736,6 +1782,19 @@ int zswap_load(struct folio *folio)
 	return 0;
 }
 
+int zswap_proactive_writeback(struct mem_cgroup *memcg,
+			      unsigned long nr_to_writeback)
+{
+	if (!memcg)
+		return -EINVAL;
+	if (!mem_cgroup_zswap_writeback_enabled(memcg))
+		return -EINVAL;
+	if (!nr_to_writeback)
+		return 0;
+
+	return zswap_try_to_writeback(memcg, 0, nr_to_writeback, true);
+}
+
 void zswap_invalidate(swp_entry_t swp)
 {
 	pgoff_t offset = swp_offset(swp);
-- 
2.34.1

