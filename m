Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0813AE1B1
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041789; cv=none; b=HextDBso7WY66NEeVm0GiBBA2sp+N/9lh40kjUq9X9m+HcEigpapmMA9jLCyEJ9JA7OHsWmuf5QCHjR8KKPv8LhC/q9nQtnJ1C3ekAj83cGHaugGEz2ne5lSaevzRc0YSY5X6MyaSsYvHtDyo8dDjS3ZQ1UM6wx6jqF6TrNFKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041789; c=relaxed/simple;
	bh=SsQaumNHv0ocAFn7305gZZiU249imNn6N7fAB+LJizE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5znYW1/thaDzBoI9dpCJM4AmdK+pRZIWkGH6d/SOx+vkneqD7vqvhoAlzIKljm3snMYzkqW9hwZSzYmaZ/fN9UB4vmUBRXILP6RVc2abB+m+Ew3AWwMBt6NWOQSlUk+BFEJrx54xe0F7lY/U7CN1hhA0PmoDQe0cmDaw0aD13I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4kAkju9; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4kAkju9"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1179457a34.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786041785; x=1786646585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/z0Ae7xOJ//F3kxqKAMic+EYDc2ZHsdvQ58o+7Z+X/w=;
        b=L4kAkju98PBwATYR9Y3B1XqbUIS9ld8hLep2g35y9eWYnPda+V/UaRphr1JlRI9ixs
         Si3xkaLXrmJHrN/h2YgTDbldF7+PGRbTWeduqQzAWbCC/446omlNWvmAH/8mxnKSORZw
         5DZ0GKJY96kLPlBkif9UyfSmTSqfg45BHBBnrzHGr4U8Wnw446MeIA+xVCSKJebAJcS1
         nQ2Na4fQf/7loBEAydPCMEKSQ9udJsOzCHGOQxSD3jNU8DbSnJgOEDBj1S11JOBlgQKJ
         8mZ4Imdy5MoP8DMVwRqaq0BdoW6mfGirmstWNIJB/Qt2FBYq2zYLRyYxrjCNGTZeHwJc
         VPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041785; x=1786646585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/z0Ae7xOJ//F3kxqKAMic+EYDc2ZHsdvQ58o+7Z+X/w=;
        b=Q5VkR7Q37Mek3iMfb2bgBedwSrG8RFdkYacfTzRBZadzt9Hqqm8l7WVD/zs+CHZ9/D
         EFMQv7a2NyQSj0xeWyaPy6NxQqPvWB5OaSsLpk1aC4rZ0yizqRoF2CcY1rDtr6+IfqwZ
         mUVRsf0a6Api1i05+k+g0Xedoc1t1EE9u56n7kAJ6ORu87OToSAxwDK1imyL+blDFPGR
         eCujrkeitvryBLHRX2QLAWcf5sDUbJO+vYl6cST2FvJ79biiW6g0pRfYWlrZ6CWNTZLK
         PrvBbdgYIIcFF/khlTuDa0pWpWIj5TwRyas7cCFgG+efHO3t9HgQJiuUfSpGzxsYesi9
         kD8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrFn+JK5V3tqkIC4wddMUqrIsRfPRWr50xMyu1QYcEofvBlfzPWo77lLJ3hpjQAmRDw7Nf0ILLFeqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBHhsvFUFr1l7X+7KH7B6vApqQ4l7xJbmhT6P0q1KPPv1PiPE
	8wr1bJpme388z31AaEQU32qHrRX/YhmeXt2Emh1sU2uXGMylETlZojeC2KPvzqYF
X-Gm-Gg: AR+sD12sm51hXRY8jl5+qd3gV1BzEDmX8x8VOyUBbLeaYUfYLCmYLQbSoKBXzTXIW1W
	o3bjG+EVmLTFj70qTLQAVjr7ZGEbOxjsZKuVoH/wGDtxl24wBdcUuAfE9QI3DF9utqIBVK2m2Py
	RUJbX+0nJ6ZHcNfYkpw0TMvdVetS9BDyQS2r5tcNhzK/h60IjYY/580PY8Jm12hL2NpuB/nmZ2F
	mHgJUcOKN3T+jUttaRTXg1OjhdxRa3CNP+9dV3kchpfEPn9UDuhpIlE7gNJ2igxtAYZ29GHXh44
	1WMlAi82j3eXQAk6WHOpVWPy4xdjegguxV5i/qhdOLMUWcEzqvUUjl2uXM5PtpBAqUz8bfo9bcy
	G+vbf5AVCYW9ZgTHyBVMM6cyXxzvtkWcNAgnciNRQJyZHb3QISDu3txHb/UdDC6eyjyIx7zakoN
	Hzua8we2rnmCTToB3ClUG9m/0l//5V+HI/UPv49A48xT2Dsm6xpBSZlKwWwIqjspPghgiqi6LAx
	2GnBYKDCeU=
X-Received: by 2002:a05:6830:828e:b0:7dc:c4ae:a689 with SMTP id 46e09a7af769-7f1e5c13d47mr11440177a34.2.1786041785156;
        Thu, 06 Aug 2026 11:43:05 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:59::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df5deeeasm5000722a34.26.2026.08.06.11.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:43:04 -0700 (PDT)
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
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v3 06/11] mm, swap: write back vswap zswap entries to physical swap
Date: Thu,  6 Aug 2026 11:42:49 -0700
Message-ID: <20260806184254.3790858-7-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806184254.3790858-1-nphamcs@gmail.com>
References: <20260806184254.3790858-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for writing back zswap-backed vswap entries to physical
swap. The mechanism mirrors the existing zswap writeback path, except
the backing physical slot is allocated on demand at writeback time
rather than already being pinned by the PTE.

Now that vswap entries can be written back, relax the zswap shrinker
gate: replace the blanket "skip while vswap is enabled" check with
can_zswap_writeback(), which only skips when no physical slot is free to
allocate on demand. This keeps the shrinker off futile writeback when no
physical swap is available while letting it drain vswap entries
otherwise.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/zswap.c | 76 +++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 55 insertions(+), 21 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 5dc338188a29..128309d5063b 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1007,12 +1007,12 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
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
 	int ret = 0;
 
 	/* try to allocate swap cache folio */
@@ -1020,12 +1020,6 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	if (!si)
 		return -EEXIST;
 
-	/* Vswap entries have no physical backing to write to. */
-	if (swap_is_vswap(si)) {
-		put_swap_device(si);
-		return -EINVAL;
-	}
-
 	mpol = get_task_policy(current);
 	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
 				       NO_INTERLEAVE_INDEX);
@@ -1044,41 +1038,71 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	/*
 	 * folio is locked, and the swapcache is now secured against
 	 * concurrent swapping to and from the slot, and concurrent
-	 * swapoff so we can safely dereference the zswap tree here.
-	 * Verify that the swap entry hasn't been invalidated and recycled
-	 * behind our backs, to avoid overwriting a new swap folio with
-	 * old compressed data. Only when this is successful can the entry
-	 * be dereferenced.
+	 * swapoff so we can safely dereference the zswap tree (or vswap
+	 * vtable) here. Verify that the swap entry hasn't been
+	 * invalidated and recycled behind our backs, to avoid overwriting
+	 * a new swap folio with old compressed data. Only when this is
+	 * successful can the entry be dereferenced.
 	 */
-	tree = swap_zswap_tree(swpentry);
-	if (entry != xa_load(tree, offset)) {
+	if (entry != zswap_entry_load(swpentry)) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
+	if (swap_is_vswap(si)) {
+		/*
+		 * Allocate physical backing before decompress so a failure
+		 * wastes no work. folio_realloc_swap retags the vtable to
+		 * PHYS, leaving the entry pointer held only by the caller.
+		 */
+		phys = folio_realloc_swap(folio);
+		if (!phys.val) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+
 	if (!zswap_decompress(entry, folio)) {
 		ret = -EIO;
+		/*
+		 * For vswap: folio_realloc_swap already moved the entry
+		 * out of the vtable. Restore it via vswap_zswap_store so
+		 * the entry stays tracked (and the just-allocated PHYS
+		 * slot is freed). For non-vswap: entry is still in the
+		 * zswap tree.
+		 */
+		if (swap_is_vswap(si) && phys.val)
+			vswap_zswap_store(swpentry, entry);
 		goto out;
 	}
 
-	xa_erase(tree, offset);
+	if (!swap_is_vswap(si))
+		xa_erase(swap_zswap_tree(swpentry), offset);
 
 	count_vm_event(ZSWPWB);
 	if (entry->objcg)
 		count_objcg_events(entry->objcg, ZSWPWB, 1);
 
-	zswap_entry_free(entry);
-
 	/* folio is up to date */
 	folio_mark_uptodate(folio);
 
 	/* move it to the tail of the inactive list after end_writeback */
 	folio_set_reclaim(folio);
 
-	/* start writeback */
-	__swap_writepage(&ctx, folio, folio->swap);
+	/*
+	 * Start writeback. The entry has been moved out of its prior location
+	 * (vtable PHYS for vswap, removed from the tree otherwise), so we own
+	 * the free. vswap writes to the on-demand physical slot; others write
+	 * to the folio's own entry.
+	 */
+	if (swap_is_vswap(si))
+		__swap_writepage(&ctx, folio, phys);
+	else
+		__swap_writepage(&ctx, folio, folio->swap);
 	swap_write_submit(&ctx);
 
+	zswap_entry_free(entry);
+
 out:
 	if (ret) {
 		swap_cache_del_folio(folio);
@@ -1091,6 +1115,16 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 /*********************************
 * shrinker functions
 **********************************/
+/*
+ * vswap zswap entries need a physical slot allocated on demand (via
+ * folio_realloc_swap) for writeback; if none is free, writeback fails, so
+ * skip the shrinker to avoid spinning on entries we cannot drain.
+ */
+static bool can_zswap_writeback(void)
+{
+	return !vswap_is_enabled() || get_nr_swap_pages();
+}
+
 /*
  * The dynamic shrinker is modulated by the following factors:
  *
@@ -1228,7 +1262,7 @@ static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
 	if (!zswap_shrinker_enabled || !mem_cgroup_zswap_writeback_enabled(memcg))
 		return 0;
 
-	if (vswap_is_enabled())
+	if (!can_zswap_writeback())
 		return 0;
 
 	/*
@@ -1313,7 +1347,7 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 	if (!mem_cgroup_zswap_writeback_enabled(memcg))
 		return -ENOENT;
 
-	if (vswap_is_enabled())
+	if (!can_zswap_writeback())
 		return -ENOENT;
 
 	/*
-- 
2.53.0-Meta

