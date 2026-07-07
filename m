Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590843AA9D1
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 06:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406560; cv=none; b=Ouw3glPYpcb5evd/u+RldMdXZgGPwvWzXbURXogXawQb2mESuoAa/Oc2G4+SrT3rEWmlBXlusxGpTmQS4GivXnP5813H5NATLNC/Z6FzzYbq2lgL9q0/xicKcFSfABBaS4MBNFa1Gni8mHZRROqGCzCxEShYkGUL1shbtreon64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406560; c=relaxed/simple;
	bh=yNyjp0U3kTl2omwalIA3XiRnZM3ad/rt4OmY4yaWlTc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ciEIOxpZNz7Cs+l65jQ8vVFpOjx9ppbxHG/h9htl4VmX34XGgXcTMSedPrIoFfVap8XCyy6uzV7RAyWICXo80gt4kt66H5ksaM43Q08GHs6S4k2LORJRudJxmGo+pXc/YZM+FKbylYEm8SU5s6oUyWjztkuPRN4XfY2YetrpX/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--souravpanda.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pmWOj3xm; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--souravpanda.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pmWOj3xm"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8479b45ad08so6464690b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 23:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783406558; x=1784011358; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2+6BMS1LET88hmhEtqV37vGf+7f7OZkNHnFc4ohCrA=;
        b=pmWOj3xmma9B1UrhgUF8y3HXooYWSIq5H+WQtUryaQSrAcezLgcbPBPVTe7DAFBYSw
         L+UjChNMUATpqzLA7nnZ9T51Y3t2ePt7kaQ7k+Lc1zLPwHxSHdRDEbmhzn6qHR5G74lM
         IL1WH1ei1pJORt4DKTdLVRXSsl6N54Q2iHUHUshUcqDNgIFq4fz/q7q5CvJk75R8e4/8
         QWMyVSFJTAGAyCwc8h72ELDppc+sYtFXVLFtgXJ3ilw24w8uI/vbvQ8jOtWJz1uifoBe
         4TiKJcKXTfUIcD6hnGIPe1wKs29SoK5umyUD7PoMeg+xATIc7A9rRAcgoFlMfcY94r/Y
         bW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406558; x=1784011358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2+6BMS1LET88hmhEtqV37vGf+7f7OZkNHnFc4ohCrA=;
        b=oII+YrW7JgirQjTtXLu30he7UXDJsVLlo1/d7OsUSlVvRDUD+2z6IZ7PG/rjs64/73
         z2Ufvc0hrxoCyKCVhR0jL197WAMOF3V1KD4R7tD8lR1dopmKlhhVmjp9o5e0csDEiA0q
         tg0QxfphPADQkCcQqQsgD3F9nsKVVHSw1UPSgM7hZUbGGXO9O0ESDJqBeTDMQ2B4IgMT
         MavUko8+8FKb2vdVmKQ7zYibPNn/DI7vqqE8XX2GXPo+npZTSeC2tXm15N05VOUp4QJl
         xAKqUFo3eQzofHHqba0J7KyVWU69HOG61kPENmOgpz02Su42GZO6yxbgx0BvICDZm0oZ
         k9Hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1ZoRXao8QjEp5m1mZOMtZ/XKdVQqs9O1h4DXe0N/m/65tC9ulC42xsMSvL2OvS9S1o3IUCe9I2Og=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ysvFnHQ1Ob3G47eGbyEi1SaSthGmsuWnOCvIhm2GYn0J6/N2
	o6tBH2OmKImaTI84UcDlzevlbtB+wrsuxh5hBNX0fuxEOG6ryG7ACY58r7AzACX8ZLnyQYYoG2M
	CiC/9g7Pe90c2sRaRoUc9Bce59Q==
X-Received: from pfhh1.prod.google.com ([2002:a05:6a00:2301:b0:845:e874:e087])
 (user=souravpanda job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2350:b0:847:9367:e054 with SMTP id d2e1a72fcca58-84826e226d0mr3798373b3a.57.1783406557455;
 Mon, 06 Jul 2026 23:42:37 -0700 (PDT)
Date: Tue,  7 Jul 2026 06:42:30 +0000
In-Reply-To: <20260707064235.1386552-1-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707064235.1386552-1-souravpanda@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260707064235.1386552-2-souravpanda@google.com>
Subject: [PATCH 1/6] mm/hugetlb: add Kconfig and basic cache infrastructure
From: Sourav Panda <souravpanda@google.com>
To: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mst@redhat.com, 
	mhklinux@outlook.com, souravpanda@google.com, fvdl@google.com, 
	gthelen@google.com, mike.kravetz@oracle.com, pasha.tatashin@soleen.com, 
	rientjes@google.com, riel@surriel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce CONFIG_HUGETLB_CACHE Kconfig option and add the basic
infrastructure for the HugeTLB dynamic cache.

This includes:
- Adding new fields to struct hstate to track cached pages
  (nr_cached_hugepages, max_cached_huge_pages, and node-specific versions)
  and initializing them.
- Introducing a new hugetlb page flag HPG_cached to track cached folios.
- Updating remove_hugetlb_folio() to be cache-aware: if the folio has
  HPG_cached set, decrement cache counters instead of the free page
  counters. This prevents leaks during memory hotplug
  (dissolve_free_hugetlb_folios).
- Preventing inflation of free_huge_pages by cached pages to protect
  memory reservation guarantees.

Signed-off-by: Sourav Panda <souravpanda@google.com>
---
 fs/Kconfig              |  9 +++++
 include/linux/hugetlb.h | 14 +++++++
 mm/hugetlb.c            | 82 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/fs/Kconfig b/fs/Kconfig
index 43cb06de297f..d33d1973ce8f 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -268,6 +268,15 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
 	  The HugeTLB Vmemmap Optimization (HVO) defaults to off. Say Y here to
 	  enable HVO by default. It can be disabled via hugetlb_free_vmemmap=off
 	  (boot command line) or hugetlb_optimize_vmemmap (sysctl).
+
+config HUGETLB_CACHE
+	bool "HugeTLB dynamic cache"
+	help
+	  Enables a dynamic, NUMA-aware hugepage cache for
+	  gigantic hugepages to allow faster allocation of surplus pages.
+	  Surplus pages are recycled into this cache upon release
+	  instead of being freed back to the buddy allocator immediately.
+	  Subsequent hugetlb allocations will prefer this cache.
 endif # HUGETLBFS
 
 config HUGETLB_PAGE
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 2abaf99321e9..4768f52ddd35 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -585,6 +585,9 @@ enum hugetlb_page_flags {
 	HPG_vmemmap_optimized,
 	HPG_raw_hwp_unreliable,
 	HPG_cma,
+#ifdef CONFIG_HUGETLB_CACHE
+	HPG_cached,
+#endif
 	__NR_HPAGEFLAGS,
 };
 
@@ -645,6 +648,9 @@ HPAGEFLAG(Freed, freed)
 HPAGEFLAG(VmemmapOptimized, vmemmap_optimized)
 HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
 HPAGEFLAG(Cma, cma)
+#ifdef CONFIG_HUGETLB_CACHE
+HPAGEFLAG(Cached, cached)
+#endif
 
 #ifdef CONFIG_HUGETLB_PAGE
 
@@ -670,6 +676,14 @@ struct hstate {
 	unsigned int nr_huge_pages_node[MAX_NUMNODES];
 	unsigned int free_huge_pages_node[MAX_NUMNODES];
 	unsigned int surplus_huge_pages_node[MAX_NUMNODES];
+
+#ifdef CONFIG_HUGETLB_CACHE
+	unsigned long nr_cached_hugepages;
+	unsigned int nr_cached_hugepages_node[MAX_NUMNODES];
+	struct list_head hugepage_cache_lists[MAX_NUMNODES];
+	unsigned long max_cached_huge_pages;
+	unsigned int max_cached_huge_pages_node[MAX_NUMNODES];
+#endif
 	char name[HSTATE_NAME_LEN];
 };
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index c921287489de..15be3cf54606 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1381,6 +1381,60 @@ static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask, int
 }
 #endif
 
+#ifdef CONFIG_HUGETLB_CACHE
+static inline bool hugetlb_folio_is_cached(struct folio *folio)
+{
+	return folio_test_hugetlb_cached(folio);
+}
+
+static void hugetlb_cache_add(struct hstate *h, struct folio *folio, bool from_surplus)
+{
+	int nid = folio_nid(folio);
+
+	list_move_tail(&folio->lru, &h->hugepage_cache_lists[nid]);
+	folio_set_hugetlb_freed(folio);
+	folio_set_hugetlb_cached(folio);
+	h->nr_cached_hugepages++;
+	h->nr_cached_hugepages_node[nid]++;
+	if (from_surplus) {
+		h->surplus_huge_pages--;
+		h->surplus_huge_pages_node[nid]--;
+	}
+}
+
+static void hugetlb_cache_remove(struct hstate *h, struct folio *folio, bool to_surplus)
+{
+	int nid = folio_nid(folio);
+
+	list_del_init(&folio->lru);
+	folio_clear_hugetlb_freed(folio);
+	folio_clear_hugetlb_cached(folio);
+	h->nr_cached_hugepages--;
+	h->nr_cached_hugepages_node[nid]--;
+	if (to_surplus) {
+		h->surplus_huge_pages++;
+		h->surplus_huge_pages_node[nid]++;
+	}
+}
+#else
+static inline bool hugetlb_folio_is_cached(struct folio *folio)
+{
+	return false;
+}
+
+static inline void hugetlb_cache_add(struct hstate *h,
+				     struct folio *folio,
+				     bool from_surplus)
+{
+}
+
+static inline void hugetlb_cache_remove(struct hstate *h,
+					struct folio *folio,
+					bool to_surplus)
+{
+}
+#endif
+
 /*
  * Remove hugetlb folio from lists.
  * If vmemmap exists for the folio, clear the hugetlb flag so that the
@@ -1401,12 +1455,16 @@ void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
 	if (hstate_is_gigantic_no_runtime(h))
 		return;
 
-	list_del(&folio->lru);
-
-	if (folio_test_hugetlb_freed(folio)) {
-		folio_clear_hugetlb_freed(folio);
-		h->free_huge_pages--;
-		h->free_huge_pages_node[nid]--;
+	if (hugetlb_folio_is_cached(folio)) {
+		if (folio_test_hugetlb_freed(folio))
+			hugetlb_cache_remove(h, folio, false);
+	} else {
+		list_del(&folio->lru);
+		if (folio_test_hugetlb_freed(folio)) {
+			folio_clear_hugetlb_freed(folio);
+			h->free_huge_pages--;
+			h->free_huge_pages_node[nid]--;
+		}
 	}
 	if (adjust_surplus) {
 		h->surplus_huge_pages--;
@@ -4169,8 +4227,18 @@ void __init hugetlb_add_hstate(unsigned int order)
 	__mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
 	h->order = order;
 	h->mask = ~(huge_page_size(h) - 1);
-	for (i = 0; i < MAX_NUMNODES; ++i)
+	for (i = 0; i < MAX_NUMNODES; ++i) {
 		INIT_LIST_HEAD(&h->hugepage_freelists[i]);
+#ifdef CONFIG_HUGETLB_CACHE
+		INIT_LIST_HEAD(&h->hugepage_cache_lists[i]);
+		h->nr_cached_hugepages_node[i] = 0;
+		h->max_cached_huge_pages_node[i] = 0;
+#endif
+	}
+#ifdef CONFIG_HUGETLB_CACHE
+	h->nr_cached_hugepages = 0;
+	h->max_cached_huge_pages = 0;
+#endif
 	INIT_LIST_HEAD(&h->hugepage_activelist);
 	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
 					huge_page_size(h)/SZ_1K);
-- 
2.55.0.rc0.799.gd6f94ed593-goog

