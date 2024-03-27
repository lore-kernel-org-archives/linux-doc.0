Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4266D13AD33
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548801; cv=none; b=AvJSBpETuSqTedqVpdp+n85vcFw6F2py5z8OfxiKa/VNB8wK7jeWXnORbumt1f3eDShkc4Wmn+soz+4Qyf+IC2nh1OYVHA3yBB7kaKqExPRA2urDwKOFQVNlRFGUbkaNV1zbM6SoGIEt0RZx12rBFNPom6gvG7PnWZGlg1sAldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548801; c=relaxed/simple;
	bh=OLv9R835lIm/WraYEbxnz+gfbM3Qn3jwGxgTFn2hLHM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TdhOEVwywHF5si2b2ctgY0lrNMw7BdyPPFOMLcEoACUc4ij0uyo0KQroCsrX/rukbbk6BbbfnHFPwSQl3U7CWvCA0jJdbVTmDzC4cMo+W45zpwri8zE5fmF28k7gpiHW/VkJ3KidCztnu/sWLJ0pddSZDvgfSdLV5yS1vba7/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V4TBx4Zvzz1wnZy;
	Wed, 27 Mar 2024 22:12:25 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 08C27140259;
	Wed, 27 Mar 2024 22:13:15 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 22:13:14 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <willy@infradead.org>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Hugh Dickins
	<hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 1/6] mm: migrate: add isolate_movable_folio()
Date: Wed, 27 Mar 2024 22:10:29 +0800
Message-ID: <20240327141034.3712697-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100001.china.huawei.com (7.185.36.93)

Like isolate_lru_page(), make isolate_movable_page() as a wrapper
around isolate_lru_folio(), since isolate_movable_page() always
fails on a tail page, add a warn for tail page and return immediately.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/linux/migrate.h |  3 +++
 mm/migrate.c            | 41 +++++++++++++++++++++++------------------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index f9d92482d117..a6c38ee7246a 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -70,6 +70,7 @@ int migrate_pages(struct list_head *l, new_folio_t new, free_folio_t free,
 		  unsigned int *ret_succeeded);
 struct folio *alloc_migration_target(struct folio *src, unsigned long private);
 bool isolate_movable_page(struct page *page, isolate_mode_t mode);
+bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode);
 
 int migrate_huge_page_move_mapping(struct address_space *mapping,
 		struct folio *dst, struct folio *src);
@@ -91,6 +92,8 @@ static inline struct folio *alloc_migration_target(struct folio *src,
 	{ return NULL; }
 static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	{ return false; }
+static inline bool isolate_movable_folio(struct page *page, isolate_mode_t mode)
+	{ return false; }
 
 static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 				  struct folio *dst, struct folio *src)
diff --git a/mm/migrate.c b/mm/migrate.c
index 2228ca681afb..b2195b6ff32c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -57,31 +57,29 @@
 
 #include "internal.h"
 
-bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode)
 {
-	struct folio *folio = folio_get_nontail_page(page);
 	const struct movable_operations *mops;
 
 	/*
-	 * Avoid burning cycles with pages that are yet under __free_pages(),
+	 * Avoid burning cycles with folios that are yet under __free_pages(),
 	 * or just got freed under us.
 	 *
-	 * In case we 'win' a race for a movable page being freed under us and
+	 * In case we 'win' a race for a movable folio being freed under us and
 	 * raise its refcount preventing __free_pages() from doing its job
-	 * the put_page() at the end of this block will take care of
-	 * release this page, thus avoiding a nasty leakage.
+	 * the folio_put() at the end of this block will take care of
+	 * release this folio, thus avoiding a nasty leakage.
 	 */
-	if (!folio)
-		goto out;
+	folio_get(folio);
 
 	if (unlikely(folio_test_slab(folio)))
 		goto out_putfolio;
 	/* Pairs with smp_wmb() in slab freeing, e.g. SLUB's __free_slab() */
 	smp_rmb();
 	/*
-	 * Check movable flag before taking the page lock because
-	 * we use non-atomic bitops on newly allocated page flags so
-	 * unconditionally grabbing the lock ruins page's owner side.
+	 * Check movable flag before taking the folio lock because
+	 * we use non-atomic bitops on newly allocated folio flags so
+	 * unconditionally grabbing the lock ruins folio's owner side.
 	 */
 	if (unlikely(!__folio_test_movable(folio)))
 		goto out_putfolio;
@@ -91,13 +89,13 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 		goto out_putfolio;
 
 	/*
-	 * As movable pages are not isolated from LRU lists, concurrent
-	 * compaction threads can race against page migration functions
-	 * as well as race against the releasing a page.
+	 * As movable folios are not isolated from LRU lists, concurrent
+	 * compaction threads can race against folio migration functions
+	 * as well as race against the releasing a folio.
 	 *
-	 * In order to avoid having an already isolated movable page
+	 * In order to avoid having an already isolated movable folio
 	 * being (wrongly) re-isolated while it is under migration,
-	 * or to avoid attempting to isolate pages being released,
+	 * or to avoid attempting to isolate folios being released,
 	 * lets be sure we have the page lock
 	 * before proceeding with the movable page isolation steps.
 	 */
@@ -113,7 +111,7 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	if (!mops->isolate_page(&folio->page, mode))
 		goto out_no_isolated;
 
-	/* Driver shouldn't use PG_isolated bit of page->flags */
+	/* Driver shouldn't use PG_isolated bit of folio->flags */
 	WARN_ON_ONCE(folio_test_isolated(folio));
 	folio_set_isolated(folio);
 	folio_unlock(folio);
@@ -124,10 +122,17 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	folio_unlock(folio);
 out_putfolio:
 	folio_put(folio);
-out:
 	return false;
 }
 
+bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+{
+	if (WARN_RATELIMIT(PageTail(page), "trying to isolate tail page"))
+		return false;
+
+	return isolate_movable_folio((struct folio *)page, mode);
+}
+
 static void putback_movable_folio(struct folio *folio)
 {
 	const struct movable_operations *mops = folio_movable_ops(folio);
-- 
2.27.0

