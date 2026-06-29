Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7E23C063C
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732071; cv=none; b=TU+Wx41o5ca1EVEs2msyscnRjH1/D9qyXx5Tiq++mkX+LQYbj3y4FhDI9j9Ph4t6yhgFOibWJsBuucONH1PTUFFEcrL1xmgO6ar7g5qpD6wS6hF24rsJpunSIYe87TTW33TIcxWHpx+JR4sPaTVY7hv5CijfbJ0qCkVzFJtd7z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732071; c=relaxed/simple;
	bh=wIACqre+bEPqLGzHTLWsUym9jduABCcu6rw/oU6Ua9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NdGDtvViZq4NI8+MRpMSNfWJoOuT5zm3/rQ1gyHBA7pYOO60pWBJX1je45Uj6Sk+ce6TbzFvFufifHRU6qYl+yTm0pYXh8DgXsr7FBgqDPaYi4JlEuTlGIGkjsUKRlz4wDb7SUT1gwUUJpIBB5uwvtkipKXJ4Y3in51Q1+0gA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V72NNWjt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V72NNWjt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c7ebfb63c6so19018545ad.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782732069; x=1783336869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO4sdWL/oCz6QEMC2wKysJsfeihvrWNSztOGuVnk/ZY=;
        b=V72NNWjtqYcJEHCSWTPe4fD3VWPFAuFrpJCt8tZX2kvF25tXFPJWhfKdbCe5Ab8l4U
         VdAc6K5ZvLc6Fg12HsEpaWfnZDebpQ7v1Zb021N7+ETN2J8F7xdkhdRS36u/Gmc1HuYP
         nQYkyss3TmKk6oaCda2FVHMaVVY5o1RwnwWrGfNBnssS4AbfZDnjZOjQRLj+XahQPYCP
         fXjwaqGza335hT0w0C32Z2+mQoHJWhC/wE0nt/rJrShDr43V06jeMI6araJJsR8Jiipx
         NdFe+dFy756UJVj6bK1owrQc+FXNhoUPPxAiABB/OCbYNI6tqsNbQggBFQgGLXzIPLC1
         LCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732069; x=1783336869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sO4sdWL/oCz6QEMC2wKysJsfeihvrWNSztOGuVnk/ZY=;
        b=M1uGcyUWMkxukx/W6SU0Y6SrjZ4ctimS98oBh4dPZERBTCLclUrqytMBzawK7fHA6G
         5YV+mGOiNbpRGXINjNElTmdEjn8zrgANJ0qRYgouUlplNfoJG3Nds/IQ9/Y6mtzYfpkL
         /umj7OSRh2CehsF3PKJwOPLJgGuwg0JhI1Xaja7HIvi7KvRIFxKNtRtmM9ClI1FvJquG
         pAojAUP+qk0Zu6HGPywuupaGrv1E+iQ4Xg8iNmevei0DrDGdF3NvXfegQqnYBfpqTbNr
         ui+wRd7WGROtRi/zw3ef5LNTmkFXqsl6F/9fSPEUPKDjZ3XjkoGbKT1iPodHN/ToIQ34
         wzfw==
X-Forwarded-Encrypted: i=1; AHgh+RptMgLJkN4jQo36XWJYSxljn4BIL6p7/kKZtRxQdDkhThC9jpPgZTn8WbLlWfkYZv9/uKAX6LgjC4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm7200RkPsckeO+Rva/N3sMA0TfW1ufA9ZtubnqP0u4Zu/ka+J
	+Q7X+fSAyqQqxFnUKFcK3Rkyv04v6bmokQsAVrfoozdLYo7SeKgvMmDr
X-Gm-Gg: AfdE7clB7sOIU6YWmInnavMTwKpcs4lt+6AyCCBcPaaYMO0nbVghpDssL+NgQAQyBge
	6BlGZhUzA/kzipV/wDlkCFV2hmgdOHrM2g1whdW+xXRyg69b0+AgVeV0tIoB+Ej5A9CXufs2Y1w
	xmftCC9GxYt9/HzO0t7gqK3tMq81KBnXgDvo9B3oR/l9AJxaU4JwIV207WeQa/RKfwg4svdG3ML
	IZFMeu0qPxJ70rJQGVVZj2iTsHmOjcfol7lYruQhq19aZxdVyyi43pSHOrLl663jK+XGU1aFBnk
	2ZnDsmvJzl+zaPZnt6z+BohavXmrZ2Qk/zu8q8SKKkAahidLx1vwQ25L9KIapuZ5pKl1RGox9Wv
	wegY484ZmBIe1y2TjRd8aBKG3pgjvcO4ZDigjxhCZsZjajiRezAuEENWNdvj/Mo6bvl9jGWfq5S
	H/dNAv1qA4lJnGQSYds53vRFUOnoVCn+eGwwcM1tPF
X-Received: by 2002:a17:902:d4c5:b0:2ca:be8:62d with SMTP id d9443c01a7336-2ca0be80814mr19308125ad.32.1782732069117;
        Mon, 29 Jun 2026 04:21:09 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm92759085ad.56.2026.06.29.04.21.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 04:21:08 -0700 (PDT)
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
Subject: [PATCH v5 3/6] mm/zswap: Extract a reusable writeback helper from shrink_worker()
Date: Mon, 29 Jun 2026 19:20:29 +0800
Message-Id: <20260629112032.20423-4-jiahao.kernel@gmail.com>
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

Extract a reusable writeback helper zswap_shrink_one_memcg() from
shrink_worker(). This helper will be reused by the upcoming proactive
writeback feature.

zswap_shrink_one_memcg() takes one step of a memcg-tree writeback walk
driven by the caller's iterator. Consequently, shrink_worker() now only
needs to calculate the acceptance threshold, drive its own iteration
based on this helper, and abort the walk when zswap_shrink_one_memcg()
returns -EBUSY.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 118 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 49 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index e2c2a3f1e061..ba01bf0e44e9 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1351,12 +1351,70 @@ static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
 	return walk_arg.bytes_written;
 }
 
+/* Track progress of a memcg-tree writeback walk. */
+struct zswap_shrink_state {
+	int scans;
+	int failures;
+};
+
+/*
+ * Take one step of a memcg-tree writeback walk driven by the caller's
+ * iterator, and fold the result into @s, the retry bookkeeping shared
+ * across steps. @memcg is the iterator's current memcg, or NULL once
+ * it has wrapped around after a full pass over the tree.
+ *
+ * The function returns -EBUSY to signal the caller to abort the walk after
+ * encountering either of the following MAX_RECLAIM_RETRIES times:
+ * - No writeback-candidate memcgs were found in a memcg tree walk.
+ * - Shrinking a writeback-candidate memcg failed.
+ *
+ * Return: The number of compressed bytes written back (>= 0), or -EBUSY
+ * when the caller should abort the walk.
+ */
+static long zswap_shrink_one_memcg(struct mem_cgroup *memcg,
+				   struct zswap_shrink_state *s)
+{
+	long shrunk;
+
+	/*
+	 * Reaching a NULL memcg means a full hierarchy pass completed.
+	 * Exclude the memcg-disabled case, where it is always NULL, and
+	 * fall through to shrink the root LRU directly.
+	 */
+	if (!memcg && !mem_cgroup_disabled()) {
+		/*
+		 * Continue shrinking without incrementing failures if we found
+		 * candidate memcgs in the last tree walk.
+		 */
+		if (!s->scans && ++s->failures == MAX_RECLAIM_RETRIES)
+			return -EBUSY;
+		s->scans = 0;
+		return 0;
+	}
+
+	shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
+
+	/*
+	 * There are no writeback-candidate pages in the memcg. With memcg
+	 * enabled this is not an issue as long as we can find another memcg
+	 * with pages in zswap, so skip without counting it as a candidate.
+	 * With memcg disabled the root LRU is the only target, so we should
+	 * abort if it has no writeback-candidate pages.
+	 */
+	if (shrunk == -ENOENT)
+		return mem_cgroup_disabled() ? -EBUSY : 0;
+	s->scans++;
+
+	if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
+		return -EBUSY;
+
+	return shrunk;
+}
+
 static void shrink_worker(struct work_struct *w)
 {
-	struct mem_cgroup *memcg;
-	int failures = 0, attempts = 0;
+	struct zswap_shrink_state s = {};
 	unsigned long thr;
-	long ret;
 
 	/* Reclaim down to the accept threshold */
 	thr = zswap_accept_thr_pages();
@@ -1367,11 +1425,6 @@ static void shrink_worker(struct work_struct *w)
 	 * writeback-disabled memcgs (memory.zswap.writeback=0) are not
 	 * candidates for shrinking.
 	 *
-	 * Shrinking will be aborted if we encounter the following
-	 * MAX_RECLAIM_RETRIES times:
-	 * - No writeback-candidate memcgs found in a memcg tree walk.
-	 * - Shrinking a writeback-candidate memcg failed.
-	 *
 	 * We save iteration cursor memcg into zswap_next_shrink,
 	 * which can be modified by the offline memcg cleaner
 	 * zswap_memcg_offline_cleanup().
@@ -1386,7 +1439,11 @@ static void shrink_worker(struct work_struct *w)
 	 * offline memcg left in zswap_next_shrink will hold the reference
 	 * until the next run of shrink_worker().
 	 */
-	do {
+	while (zswap_total_pages() > thr) {
+		struct mem_cgroup *memcg;
+		long ret;
+
+		cond_resched();
 		/*
 		 * Start shrinking from the next memcg after zswap_next_shrink.
 		 * When the offline cleaner has already advanced the cursor,
@@ -1405,49 +1462,12 @@ static void shrink_worker(struct work_struct *w)
 		} while (memcg && !mem_cgroup_tryget_online(memcg));
 		spin_unlock(&zswap_shrink_lock);
 
-		/*
-		 * Reaching a NULL memcg means a full hierarchy pass completed.
-		 * Exclude the memcg-disabled case, where it is always NULL, and
-		 * fall through to shrink the root LRU directly.
-		 */
-		if (!memcg && !mem_cgroup_disabled()) {
-			/*
-			 * Continue shrinking without incrementing failures if
-			 * we found candidate memcgs in the last tree walk.
-			 */
-			if (!attempts && ++failures == MAX_RECLAIM_RETRIES)
-				break;
-
-			attempts = 0;
-			goto resched;
-		}
-
-		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
+		ret = zswap_shrink_one_memcg(memcg, &s);
 		/* drop the extra reference */
 		mem_cgroup_put(memcg);
-
-		/*
-		 * There are no writeback-candidate pages in the memcg.
-		 * This is not an issue as long as we can find another memcg
-		 * with pages in zswap. Skip this without incrementing attempts
-		 * and failures.
-		 */
-		if (ret == -ENOENT) {
-			/*
-			 * With memcg disabled the root LRU is the only target, so
-			 * we should abort if it has no writeback-candidate pages.
-			 */
-			if (mem_cgroup_disabled())
-				break;
-			continue;
-		}
-		++attempts;
-
-		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
+		if (ret == -EBUSY)
 			break;
-resched:
-		cond_resched();
-	} while (zswap_total_pages() > thr);
+	}
 }
 
 /*********************************
-- 
2.34.1

