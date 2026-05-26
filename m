Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295CF3EB81B
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795997; cv=none; b=XE6ptrQv0djbe3FfiCmKaaPK6GwGFk3+pey8kSwjTbz1GWvM4+2oQvC/3pv2HgRO3P040UqQcPhGYM4bJ6BjBQl3JFjjKTCtd6cdXFeyFqiYKWf0MDfqXeq7Dzxe53v19E5GEHwjNBW4Nr6//xNdl4Zy3Mj1wnNsKGMPdTgiUsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795997; c=relaxed/simple;
	bh=l9XMVF4QcsPXwJE+iu5AEQrcjTk+ktDmpogspnHnoI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bikapzk5M1KdC4x7nN2MV7ncy6Z77QdJCJ+hKTqznWqs5+QyE8LuHFyOyvlXETNj9ZKcR43tpicuQf9vYnGQWWzU39XnMe66xHcmCZGBONI1N5RlDbzzBGAj4gOWHXMUPpK4Ko+HN5MjKZEC4CJKiButedKShv7zE8zlFx9R9QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT9IbUsv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT9IbUsv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8532ba6c95so748505a12.0
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779795989; x=1780400789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmT0l+ZeGCAjbHFitrEBWwyjPsHUbJhDumkOpCJMGgM=;
        b=dT9IbUsvEK197VBWW0MbdZAuXdou0jxopoHFbL4VoW/yBhMe1LomZHbS30TL8r9XXv
         zlay0tGU8sYZwJKTUBMdgt8RqTMsuo6rw/31dzH6IRtof3t1l9twONf5KROaWCedH/+H
         O+0cu+SZuXimrsrq3bQsN4N+jAsGN7/525AY9Hw/CupYVL7Xa8RhaawOf1nYvYvHsdBs
         RY247O01enD5YGQKQSL31PEhSdlkTKTcmvdMphLpFEOY67QbTkHvGSyR28D1vmr5XjTe
         144hqRxFCt76rh3Zg/w87rUANmH2ceylSJFLRdgkLDd6gHsl0lRrt3zZyNQL4CtgzZFE
         YOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795989; x=1780400789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmT0l+ZeGCAjbHFitrEBWwyjPsHUbJhDumkOpCJMGgM=;
        b=DqxLPE5Nbd4nCV4BdlT+MS6TBjEtjt0uhiFgj1FR3QP9x5yD7WsBebklAFZqzTfWHr
         phPGVSvizaUfvRCjo+gPv/b/8MSjJtH+ObYNp4wiWpxxxDWx07uMFB/LWDbPWXRo4iqr
         mZQ8iuu0izbe7slzFBVJUvWhQvGaC6v+7SdgbU967T0UUS2NAFnYAXW7nwNTlzrY9JTB
         yrMmI4lintlgONFMDNs5KDx1YiNGY8F12gCH5IMiBMmqY+4SMoXFVzrErpR+udg7B0IW
         8yPa4b5hWaikX8OweQ4VOJ77/FDau88S+tAvpjkLx+7kYTM5i2uyfDjOvhlGkXd+EtPU
         klTg==
X-Forwarded-Encrypted: i=1; AFNElJ95u/yskFkAGhChBDRfUjj/CfaAO+xnXa0IXguDHXVE+cY+GxTMiXW2UjDrzdBAfu3sqj4yqvroqT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrGcB0ePTiu29xh8k2hi8cQ5OvvNSzjsmVLMDVdArNfEn98+0
	ZeiPNaZGbBmI5RFGFqdYbt0njWq4EE12Ij3rqoX2ApZNrLfOsb2j0b0J
X-Gm-Gg: Acq92OGGT/vvVFRmGxco2U8+6Z95nujg2Eh0cV7MswT7RFiP5gcGhr35++5GwXImAOX
	QguaeLvRCCeO/XZOQKHPRHGogULhudXtegOogEOZmLOSQcq7yjnj3t+OVkUB8d9gYoDaPfG8GaI
	NnpGGqmyt2KZX2LB6DaaY8JBPTtTvDYy+nQdg6pJ2ormgz2LyphRE1TReQopc5et8kUPDn1tVqy
	Ti8U9ZP7hEgAQeTlaqkteDt1qfbXLIPu3I9uu3kQUffvLKYDi+WzzSxjycZk7J7swRXDs5+ceoT
	zedRJwDBKqQ4hsBb13omxMZjY2Yys/RpwXtOMmyOyEz0ptfrvq4/7YPloMBKSkB5KZpwEvShb+M
	CdrWlYXnNYcnQcUx5D6qHW58NLA+yvB6rc5ltOccvK0AVq0fNpGOTyGsbEgIICWIcipLsawTPec
	+oR+nogJvWr/ey8cHLxVf6tzeT0h9TltzqxwxIn2PpSb6m5HjJwp30S+4dUL8ACA==
X-Received: by 2002:a05:6a21:6113:b0:3a8:2339:24c4 with SMTP id adf61e73a8af0-3b328ed61d9mr17349804637.26.1779795989211;
        Tue, 26 May 2026 04:46:29 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852028fe99sm10304341a12.4.2026.05.26.04.46.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 04:46:28 -0700 (PDT)
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
Cc: cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
Date: Tue, 26 May 2026 19:45:58 +0800
Message-Id: <20260526114601.67041-2-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260526114601.67041-1-jiahao.kernel@gmail.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

The zswap background writeback worker shrink_worker() uses a global
cursor zswap_next_shrink, protected by zswap_shrink_lock, to round-robin
across the online memcgs under root_mem_cgroup.

Proactive writeback also wants a similar per-memcg cursor that is
scoped to the specified memcg, so that repeated invocations against
the same memcg make forward progress across its descendant memcgs
instead of restarting from the first child memcg each time.

Naturally, group the cursor and its protecting spinlock into a
zswap_wb_iter struct, and make it a member of struct mem_cgroup to
realize per-memcg cursor management. Accordingly, shrink_worker() now
uses the lock and cursor in root_mem_cgroup->zswap_wb_iter.

Because the cursor is now per-memcg, the offline cleanup must visit
every ancestor that could be holding a reference to the dying memcg.
Factor out __zswap_memcg_offline_cleanup() and walk from dead_memcg up
to the root.

No functional change intended for shrink_worker().

Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 include/linux/memcontrol.h |   3 +
 include/linux/zswap.h      |   9 +++
 mm/memcontrol.c            |   3 +
 mm/zswap.c                 | 119 ++++++++++++++++++++++++++-----------
 4 files changed, 98 insertions(+), 36 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index bf1a6e131eca..5e29c2b7e376 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -229,6 +229,9 @@ struct mem_cgroup {
 	 * swap, and from being swapped out on zswap store failures.
 	 */
 	bool zswap_writeback;
+
+	/* Per-memcg writeback cursor */
+	struct zswap_wb_iter zswap_wb_iter;
 #endif
 
 	/* vmpressure notifications */
diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index 30c193a1207e..efa6b551217e 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -11,6 +11,15 @@ extern atomic_long_t zswap_stored_pages;
 
 #ifdef CONFIG_ZSWAP
 
+/* Iteration cursor for zswap writeback over a memcg's subtree. */
+struct zswap_wb_iter {
+	/* protects @pos against concurrent advances */
+	spinlock_t lock;
+	struct mem_cgroup *pos;
+};
+
+void zswap_wb_iter_init(struct zswap_wb_iter *iter);
+
 struct zswap_lruvec_state {
 	/*
 	 * Number of swapped in pages from disk, i.e not found in the zswap pool.
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 13f5d4b2a78e..e205e5de193d 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -4024,6 +4024,9 @@ static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
 	INIT_LIST_HEAD(&memcg->memory_peaks);
 	INIT_LIST_HEAD(&memcg->swap_peaks);
 	spin_lock_init(&memcg->peaks_lock);
+#ifdef CONFIG_ZSWAP
+	zswap_wb_iter_init(&memcg->zswap_wb_iter);
+#endif
 	memcg->socket_pressure = get_jiffies_64();
 #if BITS_PER_LONG < 64
 	seqlock_init(&memcg->socket_pressure_seqlock);
diff --git a/mm/zswap.c b/mm/zswap.c
index 761cd699e0a3..73e64a635690 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -163,9 +163,6 @@ struct zswap_pool {
 /* Global LRU lists shared by all zswap pools. */
 static struct list_lru zswap_list_lru;
 
-/* The lock protects zswap_next_shrink updates. */
-static DEFINE_SPINLOCK(zswap_shrink_lock);
-static struct mem_cgroup *zswap_next_shrink;
 static struct work_struct zswap_shrink_work;
 static struct shrinker *zswap_shrinker;
 
@@ -717,28 +714,88 @@ void zswap_folio_swapin(struct folio *folio)
 	}
 }
 
-/*
- * This function should be called when a memcg is being offlined.
+void zswap_wb_iter_init(struct zswap_wb_iter *iter)
+{
+	spin_lock_init(&iter->lock);
+}
+
+#ifdef CONFIG_MEMCG
+/**
+ * zswap_mem_cgroup_iter - advance the writeback cursor
+ * @root: subtree root whose cursor to advance
+ *
+ * Advance @root->zswap_wb_iter.pos to @root itself or the next online
+ * descendant. Passing root_mem_cgroup yields a global walk.
  *
- * Since the global shrinker shrink_worker() may hold a reference
- * of the memcg, we must check and release the reference in
- * zswap_next_shrink.
+ * The cursor is retained across invocations, so successive calls walk
+ * @root's subtree cyclically in pre-order and, after %NULL, restart
+ * from the beginning.
  *
- * shrink_worker() must handle the case where this function releases
- * the reference of memcg being shrunk.
+ * The returned memcg carries an extra reference; release it with
+ * mem_cgroup_put().
+ *
+ * Return: the next online memcg in @root's subtree, or @root itself,
+ * with an extra reference, or %NULL after a full round-trip.
  */
-void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg)
+static struct mem_cgroup *zswap_mem_cgroup_iter(struct mem_cgroup *root)
 {
-	/* lock out zswap shrinker walking memcg tree */
-	spin_lock(&zswap_shrink_lock);
-	if (zswap_next_shrink == memcg) {
+	struct mem_cgroup *memcg;
+
+	if (mem_cgroup_disabled())
+		return NULL;
+
+	spin_lock(&root->zswap_wb_iter.lock);
+	do {
+		memcg = mem_cgroup_iter(root, root->zswap_wb_iter.pos, NULL);
+		root->zswap_wb_iter.pos = memcg;
+	} while (memcg && !mem_cgroup_tryget_online(memcg));
+	spin_unlock(&root->zswap_wb_iter.lock);
+
+	return memcg;
+}
+
+/*
+ * If @root's cursor currently points at @dead_memcg, advance it to the
+ * next online descendant so @dead_memcg can be freed.
+ */
+static void __zswap_memcg_offline_cleanup(struct mem_cgroup *root,
+					  struct mem_cgroup *dead_memcg)
+{
+	spin_lock(&root->zswap_wb_iter.lock);
+	if (root->zswap_wb_iter.pos == dead_memcg) {
 		do {
-			zswap_next_shrink = mem_cgroup_iter(NULL, zswap_next_shrink, NULL);
-		} while (zswap_next_shrink && !mem_cgroup_online(zswap_next_shrink));
+			root->zswap_wb_iter.pos =
+				mem_cgroup_iter(root,
+						root->zswap_wb_iter.pos, NULL);
+		} while (root->zswap_wb_iter.pos &&
+			 !mem_cgroup_online(root->zswap_wb_iter.pos));
 	}
-	spin_unlock(&zswap_shrink_lock);
+	spin_unlock(&root->zswap_wb_iter.lock);
+}
+
+/*
+ * Called when a memcg is being offlined. If @memcg or any of its
+ * ancestors has a cursor pointing at @memcg, it must be advanced
+ * past @memcg before @memcg can be freed. Walk the chain and
+ * release such references.
+ */
+void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg)
+{
+	struct mem_cgroup *parent = memcg;
+
+	do {
+		__zswap_memcg_offline_cleanup(parent, memcg);
+	} while ((parent = parent_mem_cgroup(parent)));
+}
+#else /* !CONFIG_MEMCG */
+static struct mem_cgroup *zswap_mem_cgroup_iter(struct mem_cgroup *root)
+{
+	return NULL;
 }
 
+void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg) { }
+#endif /* CONFIG_MEMCG */
+
 /*********************************
 * zswap entry functions
 **********************************/
@@ -1323,38 +1380,28 @@ static void shrink_worker(struct work_struct *w)
 	 * - No writeback-candidate memcgs found in a memcg tree walk.
 	 * - Shrinking a writeback-candidate memcg failed.
 	 *
-	 * We save iteration cursor memcg into zswap_next_shrink,
+	 * We save the iteration cursor in root_mem_cgroup->zswap_wb_iter.pos,
 	 * which can be modified by the offline memcg cleaner
 	 * zswap_memcg_offline_cleanup().
 	 *
 	 * Since the offline cleaner is called only once, we cannot leave an
-	 * offline memcg reference in zswap_next_shrink.
+	 * offline memcg reference in root_mem_cgroup->zswap_wb_iter.pos.
 	 * We can rely on the cleaner only if we get online memcg under lock.
 	 *
 	 * If we get an offline memcg, we cannot determine if the cleaner has
 	 * already been called or will be called later. We must put back the
 	 * reference before returning from this function. Otherwise, the
-	 * offline memcg left in zswap_next_shrink will hold the reference
-	 * until the next run of shrink_worker().
+	 * offline memcg left in root_mem_cgroup->zswap_wb_iter.pos will hold
+	 * the reference until the next run of shrink_worker().
 	 */
 	do {
 		/*
-		 * Start shrinking from the next memcg after zswap_next_shrink.
-		 * When the offline cleaner has already advanced the cursor,
-		 * advancing the cursor here overlooks one memcg, but this
-		 * should be negligibly rare.
-		 *
-		 * If we get an online memcg, keep the extra reference in case
-		 * the original one obtained by mem_cgroup_iter() is dropped by
-		 * zswap_memcg_offline_cleanup() while we are shrinking the
-		 * memcg.
+		 * Start shrinking from the next memcg after
+		 * root_mem_cgroup->zswap_wb_iter.pos. When the offline cleaner
+		 * has already advanced the cursor, advancing the cursor here
+		 * overlooks one memcg, but this should be negligibly rare.
 		 */
-		spin_lock(&zswap_shrink_lock);
-		do {
-			memcg = mem_cgroup_iter(NULL, zswap_next_shrink, NULL);
-			zswap_next_shrink = memcg;
-		} while (memcg && !mem_cgroup_tryget_online(memcg));
-		spin_unlock(&zswap_shrink_lock);
+		memcg = zswap_mem_cgroup_iter(root_mem_cgroup);
 
 		if (!memcg) {
 			/*
-- 
2.34.1

