Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85817D6
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758180; cv=none; b=TBJlXSaeLxu7NUomgpMV/Edj9MRqKyTYkZaaxIIBF1UOYx7gpxZlM2NWjhNepm5zLjqIvNS8bqsI9+6BmkV1FI7vrUx1iTyEVuavKRlhTIoK8DA7WiLXN6hU8gdsUQvbGjuY6aqVKIWTN4H+8KciJg5V+17UKuqxMJzO0bGwn58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758180; c=relaxed/simple;
	bh=TMVbqmJ8fC23b+mq81KREe/sP6Ygp+jEWeBZ/637AVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HrzS9bxcRMW9GfLkFHrZJk2pZ7/g+Smtqi/RFouGEL4g4dab1ztmHzyv74Pn4NLZELN4cgnC5cEJRl59W0IL07NOKYXbxS0EBUUgXDiidd0K15OoCFN2Iwctw2CCLjAvnNy69sDWpe08z7Nw+ODdRxXHVbIyallWGAeB/ao1WJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ih3rTNLu; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ih3rTNLu"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c85d8615b09so343031a12.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758178; x=1782362978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTogXYNv78gwID3PJ713yHc97a0x/oZa3BlIEI1TXEw=;
        b=Ih3rTNLuMDAdLAtOT78Py2hc/tT0gsXMgPshfWDQeFXZwdDK3T1duFjLgmwkSEIsQh
         pDe4jJp25YKhzi55/523oRrS9EudaeUeiVcaWNDyX1h8sNJvAtiHvZJlkm395G0Fyban
         OgRudDWPlfHhBEsqjiGGHZrAqPJyVas8Z1TJpRenXQepm7RXxIiesqbjN5ewYe3/a98Y
         T2tJa3YEYqwBrrKYvBTi/dJDB3Urm4Vk3oTw2LIaTBUfxnyZQOW+tklsnVYyR3DYHOvE
         v11ryA0jwbcqcxLNORuQ5k4HYdrkFHc/kIQeiSIkwCvMF7jg4hU4A3P6yv2Do5mtKzKB
         Q5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758178; x=1782362978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fTogXYNv78gwID3PJ713yHc97a0x/oZa3BlIEI1TXEw=;
        b=IxiGu1ByA4yELXl0VSzF94hBwNwCagvScCyCHdH2At2Oz1aR/76NKb8K5po6W+NT+i
         Y9QUVRampShOdWlh+sMmA18waQn5QOVihVcl+jfMJFBDTbXzamPBfVLpHxh5eEpZs5Qe
         lH0+Nt7rHdIJ2PJJNmhLvk9PtIPIKyTUmS644pkwhKQa3Whif+kc0X2ZnvNVWzy5oaGj
         xrZtZSHxude5vir/nYLMioIFdz6EyosxY3uTgfAQVdaw2rnXUruDT8uUqQw95w5YAxxD
         khr3a6hKd+hTpHAdCyTJ6v6ORoU8dOHxHqnQ76svDYiyEoH4oDkuI5hU67DcuaaCp3Pe
         MxOg==
X-Forwarded-Encrypted: i=1; AFNElJ/+zB5lLvDnIF6KSfcwbRnQIXDklydllgp57OBDFOWTZ/wyAnNwyBIEyPg5nCEezrZDIIkZHUR/hm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGYzsKPQAd8sgzkR1wD85r7JtloRykBwsLhVzM9oYIQaqsLz6
	PPHgssVoVAKr29xk1QSiM6EKbmMi/ccID2sTb1fUSHMu3TBB+/+IVENt
X-Gm-Gg: Acq92OGEPFbfsXrKgoonx+6FC7jLyfBt0adCgSXh8oDSz6LrAjhfK8mUOKL/aRwqm8z
	X/c7HknXw+OgC1boxugMQayUmlQMRkAzfjpXrR1qCTkpe/VvlrLQp1O4QJj1rqba2edJoq270qD
	gHLPBwzBtdonwy/9ycJMpnlNWUVrMfH934Cr4DR7UmAHwn5fOOyZRG4cq4Z0XxDiFqv6Tc7oD61
	03r55ThfWB1QwNk8pxT6Sl5EWUoQKzND4WJ3Oe4vqZO+OcSHz1qpMJuHHkcS0sLlgRliC5+pJLw
	HlnzE2cT/WlbPl16kFpTcwKnvz7W/p7OOgUuZzsVHrzdKgxS/UDickwHIH6llMQryJ9VDlyrsJf
	O3BWV9PPJz7z0x/WNNEaD05tbwvQp3bWnBM+7oW4YnE3J7TUeJ5V3qHEt4gx3CTp8I2JdYglB/i
	P6BM4z3bb7yGXmax/pCtQhaCdfNSM1DtBWCH75hUWi
X-Received: by 2002:a05:6a20:e212:b0:3b5:6b5a:4f29 with SMTP id adf61e73a8af0-3b8b7cd8e45mr7178450637.30.1781758178441;
        Wed, 17 Jun 2026 21:49:38 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17214781b3a.47.2026.06.17.21.49.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 21:49:38 -0700 (PDT)
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
Subject: [PATCH v4 2/5] mm/zswap: Factor writeback loop out of shrink_worker()
Date: Thu, 18 Jun 2026 12:48:54 +0800
Message-Id: <20260618044857.69439-3-jiahao.kernel@gmail.com>
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

In preparation for sharing the writeback loop with proactive
writeback, move the memcg iteration into zswap_iter_global() and the
loop into zswap_try_to_writeback(lower, upper). shrink_worker() is
reduced to computing the accept threshold and invoking the helper.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 136 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 81 insertions(+), 55 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index d7d031dee4cd..e29f8a61412d 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1380,61 +1380,75 @@ static long shrink_memcg(struct mem_cgroup *memcg,
 	return walk_arg.bytes_written;
 }
 
-static void shrink_worker(struct work_struct *w)
+/*
+ * Global iteration uses a global cursor to select from all online
+ * memcgs in a round-robin fashion.
+ *
+ * We save iteration cursor memcg into zswap_next_shrink,
+ * which can be modified by the offline memcg cleaner
+ * zswap_memcg_offline_cleanup().
+ *
+ * Since the offline cleaner is called only once, we cannot leave an
+ * offline memcg reference in zswap_next_shrink.
+ * We can rely on the cleaner only if we get online memcg under lock.
+ *
+ * If we get an offline memcg, we cannot determine if the cleaner has
+ * already been called or will be called later. We must put back the
+ * reference before returning from this function. Otherwise, the
+ * offline memcg left in zswap_next_shrink will hold the reference
+ * until the next run of shrink_worker().
+ */
+static struct mem_cgroup *zswap_iter_global(void)
 {
 	struct mem_cgroup *memcg;
-	int failures = 0, attempts = 0;
-	unsigned long thr;
-	long ret;
-
-	/* Reclaim down to the accept threshold */
-	thr = zswap_accept_thr_pages();
 
 	/*
-	 * Global reclaim will select cgroup in a round-robin fashion from all
-	 * online memcgs, but memcgs that have no pages in zswap and
-	 * writeback-disabled memcgs (memory.zswap.writeback=0) are not
-	 * candidates for shrinking.
+	 * Start from the next memcg after zswap_next_shrink.
+	 * When the offline cleaner has already advanced the cursor,
+	 * advancing the cursor here overlooks one memcg, but this
+	 * should be negligibly rare.
 	 *
-	 * Shrinking will be aborted if we encounter the following
-	 * MAX_RECLAIM_RETRIES times:
-	 * - No writeback-candidate memcgs found in a memcg tree walk.
-	 * - Shrinking a writeback-candidate memcg failed.
-	 *
-	 * We save iteration cursor memcg into zswap_next_shrink,
-	 * which can be modified by the offline memcg cleaner
-	 * zswap_memcg_offline_cleanup().
-	 *
-	 * Since the offline cleaner is called only once, we cannot leave an
-	 * offline memcg reference in zswap_next_shrink.
-	 * We can rely on the cleaner only if we get online memcg under lock.
-	 *
-	 * If we get an offline memcg, we cannot determine if the cleaner has
-	 * already been called or will be called later. We must put back the
-	 * reference before returning from this function. Otherwise, the
-	 * offline memcg left in zswap_next_shrink will hold the reference
-	 * until the next run of shrink_worker().
+	 * If we get an online memcg, keep the extra reference in case
+	 * the original one obtained by mem_cgroup_iter() is dropped by
+	 * zswap_memcg_offline_cleanup() while we are shrinking the
+	 * memcg.
 	 */
+	spin_lock(&zswap_shrink_lock);
 	do {
-		/*
-		 * Start shrinking from the next memcg after zswap_next_shrink.
-		 * When the offline cleaner has already advanced the cursor,
-		 * advancing the cursor here overlooks one memcg, but this
-		 * should be negligibly rare.
-		 *
-		 * If we get an online memcg, keep the extra reference in case
-		 * the original one obtained by mem_cgroup_iter() is dropped by
-		 * zswap_memcg_offline_cleanup() while we are shrinking the
-		 * memcg.
-		 */
-		spin_lock(&zswap_shrink_lock);
-		do {
-			memcg = mem_cgroup_iter(NULL, zswap_next_shrink, NULL);
-			zswap_next_shrink = memcg;
-		} while (memcg && !mem_cgroup_tryget_online(memcg));
-		spin_unlock(&zswap_shrink_lock);
+		memcg = mem_cgroup_iter(NULL, zswap_next_shrink, NULL);
+		zswap_next_shrink = memcg;
+	} while (memcg && !mem_cgroup_tryget_online(memcg));
+	spin_unlock(&zswap_shrink_lock);
+
+	return memcg;
+}
+
+/*
+ * Walk the memcg tree and write back zswap pages until the
+ * (lower_pages, upper_pages) window closes, or abort encounter
+ * MAX_RECLAIM_RETRIES times of the following conditions:
+ * - No writeback-candidate memcgs found in a memcg tree walk.
+ * - Shrinking a writeback-candidate memcg failed.
+ *
+ * For shrink_worker(), it passes lower=thr and upper=zswap_total_pages().
+ * The @upper limit is refreshed in each iteration by re-evaluating
+ * zswap_total_pages(), and the window closes once the total falls
+ * below the threshold.
+ */
+static void zswap_try_to_writeback(unsigned long lower_pages,
+				   unsigned long upper_pages)
+{
+	int failures = 0, attempts = 0;
+	struct mem_cgroup *iter_memcg;
+
+	while (lower_pages < upper_pages) {
+		unsigned long batch_size;
+		long shrunk;
 
-		if (!memcg) {
+		cond_resched();
+
+		iter_memcg = zswap_iter_global();
+		if (!iter_memcg) {
 			/*
 			 * Continue shrinking without incrementing failures if
 			 * we found candidate memcgs in the last tree walk.
@@ -1443,12 +1457,16 @@ static void shrink_worker(struct work_struct *w)
 				break;
 
 			attempts = 0;
-			goto resched;
+			continue;
 		}
 
-		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
+		batch_size = min(upper_pages - lower_pages, NR_ZSWAP_WB_BATCH);
+		shrunk = shrink_memcg(iter_memcg, batch_size);
 		/* drop the extra reference */
-		mem_cgroup_put(memcg);
+		mem_cgroup_put(iter_memcg);
+
+		/* zswap total pages might have changed, refresh it. */
+		upper_pages = zswap_total_pages();
 
 		/*
 		 * There are no writeback-candidate pages in the memcg.
@@ -1456,15 +1474,23 @@ static void shrink_worker(struct work_struct *w)
 		 * with pages in zswap. Skip this without incrementing attempts
 		 * and failures.
 		 */
-		if (ret == -ENOENT)
+		if (shrunk == -ENOENT)
 			continue;
 		++attempts;
 
-		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
+		if (shrunk <= 0 && ++failures == MAX_RECLAIM_RETRIES)
 			break;
-resched:
-		cond_resched();
-	} while (zswap_total_pages() > thr);
+	}
+}
+
+static void shrink_worker(struct work_struct *w)
+{
+	unsigned long thr;
+
+	/* Reclaim down to the accept threshold */
+	thr = zswap_accept_thr_pages();
+
+	zswap_try_to_writeback(thr, zswap_total_pages());
 }
 
 /*********************************
-- 
2.34.1

