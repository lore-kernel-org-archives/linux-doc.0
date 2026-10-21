Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562627;
	b=wlhX4q9GcBXOd1yLWIgbpMwlEbOaO/3KcxsFGTXpeAgW6EghkfHX9Byf5YtWtbAqqVOQ
	 xROEZk16PCQZvtR0dxNevLEHw1FFn9ny7sz8zozgAj2CSYxEpLn6wIvhv+i8nkP1yLHal
	 xKMP7Qk1vJAgn5J4gsmOwSi2Q0tb0R+Y/fMJUhMgspo/t5xzZ4fX1quvlMQkY9H0IorzY
	 EJkYh/TOs+D3TKHviihqU9A7FcB/pjvqd9Xo3m0U2m0r1InwL3+jcJ63jD8Z31Gc356MA
	 J6pZPA0dcA4wTQyZli7EZSDwPY4If5SiqaavH7KD9TZhCm9JBbLwKsPL97yM1VJuNYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hXV3pXzpnzs8U7BbqpWsaUJNBuB8eNBkejRWaj9fiJ0=;
	b=PQ8PqNoEkeu0HNC2nmbxtWdmLTHK/ez04knOD2ue/bcxYCvSPqfVSowfHHAkq4KSn+ZJ
	 tRFFqIkshhZ19ifWEgMFaZkbPU+OS7dcjIQzFqJkmjNQfuQzinsKOECO7Ut3FLyDwnXG1
	 cNseXH0+G4dsVEmZjcJI77DO5IQtZYTtPiATZKB0+KaJRJXBYRZCyewnU471AqJuBK7BS
	 /Pf/Jr8yQ7pQmerWzyhsavxbMmpmwui/X/SIz8d+jHitY2flBo3vapRebX1YtThCL/CUc
	 WRU71+0r8xwfPP7qd+9Ip6AUSPR5pXUk9agQ/h1Z2lTpxG8y4wZFQgDsSofy5Miq28w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iN4WdV09;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B6606A327
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98B6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iN4WdV09
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b118bea471so1986107b3.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562626; x=1793167426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXV3pXzpnzs8U7BbqpWsaUJNBuB8eNBkejRWaj9fiJ0=;
        b=iN4WdV09dBPlOo3iHc4DGXc6vYHT2MEVxnumJU9t1WuWpjPUq3TwTuyg6GiHw7ztgk
         kuitYNZHRlPT6h3tq/LRTE78topov3d0SbZW1w0MPcLMz0MSrFrP8eqPS+10km8JJrqG
         NLVxsyO/X+ptQ28S08psLuo8vITHFV3czqCkgxJqHIkmeAKGZB2KzxS+qst0RgCNDsSk
         /r3iqeMyE/73vQ3SHoXsYeY7Vb36tWO/dQ8vnaoDJf3V3nqxmx8XJaVPlnTK/6dd5H7/
         7pERuPDrlduolwc9pJCvaWmEpFUW0M2RU7o/BwJ+Y1gbcWZB6qp7JFZtI1nSChcpuZh/
         +mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562626; x=1793167426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXV3pXzpnzs8U7BbqpWsaUJNBuB8eNBkejRWaj9fiJ0=;
        b=aDhUHVPNrS4D4Kw75eqBAiYC46ZuvmQOb3k3uxKkjwLqZevbHHbeiz7vrdt/o/eFoV
         D5t80T8cgCZoSkfkW5NsN+xHHs2Wg5ncKV0Vk8K84Bw3jje+jkuIL/pD6+qgglycuoXO
         LRBFkiqK3nu/o5uzCJTXeHjEk8A//OM3Xx5ahw6QnwTBalMyiW6gh0UjTMc8mbqKDX1D
         kLD/J+EuhBHrq7hlNfCdKsiqGVrqbSdbTL+dqcxU8a/lo8fHy5J4SfgysXOysPPr+gW6
         MkcJL6ijahSn183UhmTBEdJiNz4vBr+UY1ZSnvC4RXwf/MnVZYIwMXWvRNiUix1g41Zf
         QH2g==
X-Forwarded-Encrypted: i=1; AKwUvBzw+SahI89/UbqHvyz3RIWvJB1jiCVz92kYZXeeQGinQnYivqETbBVS+LyhzouJAJHzJfsy5YhimUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDxkkiXbM5ne6ohTGYE5tscSEG7KeaF9iYrqmh1oKUoHLCvMC2
	EzGLDCCyxC4SfSxUnOQtwpFLv7J4pSIqVlma+Zn1lpV2sJ4TYydQjFnD
X-Gm-Gg: AYBFou3CbXDwXnyhsK/c7R8USu7BRxEGftHEKnS3buKHMoIY/mBfDcHbvYbPJEf+8Pt
	gUDcMBtsO3MdRq3LpXhM2Na3yVRC4lTqZTe8y+XXyUcFfYuvqYYFvkNNS+1YzV2ETTudEaW5b43
	CXkbY38jJF7lpVnUG6KjGGwKipnkRPPSE6XK2b+WTEAleYuh+FVcv6gOU1sISqVFZIqxslBJP+3
	o8Le6WKfyEjmlr6r6VXgBom1GGcq9dD5GTllK+B3eudivol7b9m7vVj6WxuM23rNeKT2NV2lUE3
	LN0K1XgIf+qBpOqsJ6SK/cKw/4/3/vvCVDnjKoDGE9B4N87w2FfTiX6N5JW4EBaFonvzrwjDTNr
	d0BxxBaGAlO6taUusNtaaFASFFiDWFd2e3aO2eiyVv7raODYa59vDRlyUmwyy+2/6skzXTmnXUr
	e5BgBlIstJpW3Ke43kwL5jQV/ThX389oWh1Q0LnG/ep2rmBmbltzno7ZqqlId0uOcPovPGjEbVH
	PgLDO91KebbbmmjeqtbvsFEgxjzO6+tBb+qczcw71F0DaAndkOqJbcLR2tkN4HsRyWFep4IkCF4
	1QS3iYIw26wY3psEfKQcNfelM0s3+NsgBLZEs9ShtHb4xQqsCpaAN9Qyio5SO0Kj
X-Received: by 2002:a05:690c:e3eb:b0:8b0:89ea:6aca with SMTP id 00721157ae682-8b133cdd929mr5826817b3.6.1792562625774;
        Tue, 20 Oct 2026 23:03:45 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:50::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300ae0c2sm7348597b3.18.2026.10.20.23.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:03:44 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosry@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	riel@surriel.com,
	gourry@gourry.net,
	haowenchao22@gmail.com,
	corbet@lwn.net,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v6 06/12] mm, swap: write back vswap zswap entries to physical swap
Date: Tue, 20 Oct 2026 23:03:17 -0700
Message-ID: <20261021060323.553433-7-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for writing back zswap-backed vswap entries to physical
swap. The mechanism mirrors the existing zswap writeback path, except
the backing physical slot is allocated on demand at writeback time
rather than already being pinned by the PTE.

Zswap shrinker only skips vswap entries when we're out of physical swap
space.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/zswap.c | 69 +++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 1b91dba992ab..fd0c2f126b57 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1076,12 +1076,13 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
 static int zswap_writeback_entry(struct zswap_entry *entry,
 				 swp_entry_t swpentry)
 {
-	struct xarray *tree;
 	pgoff_t offset = swp_offset(swpentry);
 	struct folio *folio;
 	struct mempolicy *mpol;
 	struct swap_info_struct *si;
 	struct swap_io_ctx ctx = {};
+	swp_entry_t phys = {};
+	bool is_vswap;
 	int ret = 0;
 
 	/* try to allocate swap cache folio */
@@ -1089,12 +1090,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	if (IS_ERR_OR_NULL(si))
 		return -ENOENT;
 
-	/* Vswap entries have no physical backing to write to. */
-	if (swap_is_vswap(si)) {
-		put_swap_device(si);
-		return -EINVAL;
-	}
-
+	is_vswap = swap_is_vswap(si);
 	mpol = get_task_policy(current);
 	folio = __swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
 					 NO_INTERLEAVE_INDEX);
@@ -1115,24 +1111,44 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	/*
 	 * folio is locked, and the swapcache is now secured against
 	 * concurrent swapping to and from the slot, and concurrent
-	 * swapoff so we can safely dereference the zswap tree here.
+	 * swapoff so we can safely dereference the zswap tree (or vswap
+	 * vtable) here.
 	 * Verify that the swap entry hasn't been invalidated and recycled
 	 * behind our backs, to avoid overwriting a new swap folio with
 	 * old compressed data. Only when this is successful can the entry
 	 * be dereferenced.
 	 */
-	tree = swap_zswap_tree(swpentry);
-	if (entry != xa_load(tree, offset)) {
+	if (entry != zswap_entry_load(swpentry)) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
+	if (is_vswap) {
+		/*
+		 * Allocate physical backing before decompress so a failure
+		 * wastes no work.
+		 */
+		phys = folio_realloc_swap(folio);
+		if (!phys.val) {
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
+
 	if (!zswap_decompress(entry, folio)) {
 		ret = -EIO;
+		/*
+		 * The phys allocation above took the entry out of the vtable.
+		 * Restore the zswap entry to the vtable, which also frees the
+		 * allocated physical swap space.
+		 */
+		if (is_vswap)
+			vswap_zswap_store(swpentry, entry);
 		goto err;
 	}
 
-	xa_erase(tree, offset);
+	if (!is_vswap)
+		xa_erase(swap_zswap_tree(swpentry), offset);
 
 	count_vm_event(ZSWPWB);
 	if (entry->objcg)
@@ -1159,7 +1175,10 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	folio_put(folio);
 
 	/* start writeback */
-	__swap_writeout(&ctx, folio, folio->swap);
+	if (is_vswap)
+		__swap_writeout(&ctx, folio, phys);
+	else
+		__swap_writeout(&ctx, folio, folio->swap);
 	swap_write_submit(&ctx);
 
 	return 0;
@@ -1174,6 +1193,17 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 /*********************************
 * shrinker functions
 **********************************/
+/*
+ * With vswap disabled, all zswap entries use directly mapped physical swap
+ * entries. With vswap enabled, such entries are rare.
+ *
+ * A zswap-backed vswap entry needs physical swap capacity for writeback.
+ */
+static bool zswap_writeback_possible(void)
+{
+	return !vswap_is_enabled() || get_nr_swap_pages() > 0;
+}
+
 /*
  * The dynamic shrinker is modulated by the following factors:
  *
@@ -1311,7 +1341,7 @@ static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
 	if (!zswap_shrinker_enabled || !mem_cgroup_zswap_writeback_enabled(memcg))
 		return 0;
 
-	if (vswap_is_enabled())
+	if (!zswap_writeback_possible())
 		return 0;
 
 	/*
@@ -1397,7 +1427,8 @@ static struct shrinker *zswap_alloc_shrinker(void)
  * were scanned but none could be written back, or -ENOENT if @memcg has
  * writeback disabled, is a zombie cgroup, or has empty zswap LRUs.
  *
- * Also returns -ENOENT when vswap is enabled.
+ * Also returns -ENOENT when vswap is enabled and there is no physical
+ * swap to write back to.
  */
 static int shrink_memcg(struct mem_cgroup *memcg)
 {
@@ -1406,7 +1437,7 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 	if (!mem_cgroup_zswap_writeback_enabled(memcg))
 		return -ENOENT;
 
-	if (vswap_is_enabled())
+	if (!zswap_writeback_possible())
 		return -ENOENT;
 
 	/*
@@ -1437,11 +1468,7 @@ static void shrink_worker(struct work_struct *w)
 	int ret, failures = 0, attempts = 0;
 	unsigned long thr;
 
-	/*
-	 * When vswap is enabled, zswap entries are almost all vswap backed,
-	 * with no slot to write back to.
-	 */
-	if (vswap_is_enabled())
+	if (!zswap_writeback_possible())
 		return;
 
 	/* Reclaim down to the accept threshold */
@@ -1522,7 +1549,7 @@ static void shrink_worker(struct work_struct *w)
 			break;
 resched:
 		cond_resched();
-	} while (zswap_total_pages() > thr);
+	} while (zswap_total_pages() > thr && zswap_writeback_possible());
 }
 
 /*********************************
-- 
2.53.0-Meta

