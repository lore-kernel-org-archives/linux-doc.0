Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC413B287
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548801; cv=none; b=dg2ns8c7qx/6/Rt6csILDhvSKCERANI60ik9fgRilljlGq40Fn9FBtVsC3b3SWeMleLa+QJiVSEZNsHI5Clg+SmVjOZ7YJvRmbvB3aL/7c/s3uqKkikuI516yDJsPeP8Oqac9HSGCOIo1NZbljBEkPG5eBEytf8uHwy3bgOnV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548801; c=relaxed/simple;
	bh=C0O8cqnwr7e9mdBCrrtfWDNaHOdsCLKcyVNfA4+izSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5uMJjyj4PzBsp+rb48hXW3/hLURltyGNM4lyTqcATiT1kcR6WserMtXSEf/NoOPvKcXJ44cGR/b0RrzeBrA5dR/w/8u0S3XWiTVL1ZwwYv4W9c9xw4pfEX7AwNa8icPqYW/8OX9eLKqHOQ1bOZ0J2e+YHi8RBWr4KH/1T+Z4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V4T8q6jGWz29dPD;
	Wed, 27 Mar 2024 22:10:35 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C5C71A0172;
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
Subject: [PATCH 2/6] mm: memory_hotplug: use more folio in do_migrate_range()
Date: Wed, 27 Mar 2024 22:10:30 +0800
Message-ID: <20240327141034.3712697-3-wangkefeng.wang@huawei.com>
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

With isolate_movable_folio() and folio_isolate_lru(), let's use
more folio in do_migrate_range() to save compound_head() calls.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 mm/memory_hotplug.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index a444e2d7dd2b..bd207772c619 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1774,14 +1774,14 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 
 static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 {
+	struct folio *folio;
 	unsigned long pfn;
-	struct page *page, *head;
 	LIST_HEAD(source);
 	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
 	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
-		struct folio *folio;
+		struct page *page, *head;
 		bool isolated;
 
 		if (!pfn_valid(pfn))
@@ -1818,15 +1818,15 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 		 * We can skip free pages. And we can deal with pages on
 		 * LRU and non-lru movable pages.
 		 */
-		if (PageLRU(page))
-			isolated = isolate_lru_page(page);
+		if (folio_test_lru(folio))
+			isolated = folio_isolate_lru(folio);
 		else
-			isolated = isolate_movable_page(page, ISOLATE_UNEVICTABLE);
+			isolated = isolate_movable_folio(folio, ISOLATE_UNEVICTABLE);
 		if (isolated) {
-			list_add_tail(&page->lru, &source);
-			if (!__PageMovable(page))
-				inc_node_page_state(page, NR_ISOLATED_ANON +
-						    page_is_file_lru(page));
+			list_add_tail(&folio->lru, &source);
+			if (!__folio_test_movable(folio))
+				node_stat_add_folio(folio, NR_ISOLATED_ANON +
+						    folio_is_file_lru(folio));
 
 		} else {
 			if (__ratelimit(&migrate_rs)) {
@@ -1834,7 +1834,7 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 				dump_page(page, "isolation failed");
 			}
 		}
-		put_page(page);
+		folio_put(folio);
 	}
 	if (!list_empty(&source)) {
 		nodemask_t nmask = node_states[N_MEMORY];
@@ -1846,9 +1846,9 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 
 		/*
 		 * We have checked that migration range is on a single zone so
-		 * we can use the nid of the first page to all the others.
+		 * we can use the nid of the first folio to all the others.
 		 */
-		mtc.nid = page_to_nid(list_first_entry(&source, struct page, lru));
+		mtc.nid = folio_nid(list_first_entry(&source, struct folio, lru));
 
 		/*
 		 * try to allocate from a different node but reuse this node
@@ -1861,11 +1861,11 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 		ret = migrate_pages(&source, alloc_migration_target, NULL,
 			(unsigned long)&mtc, MIGRATE_SYNC, MR_MEMORY_HOTPLUG, NULL);
 		if (ret) {
-			list_for_each_entry(page, &source, lru) {
+			list_for_each_entry(folio, &source, lru) {
 				if (__ratelimit(&migrate_rs)) {
 					pr_warn("migrating pfn %lx failed ret:%d\n",
-						page_to_pfn(page), ret);
-					dump_page(page, "migration failure");
+						folio_pfn(folio), ret);
+					dump_page(&folio->page, "migration failure");
 				}
 			}
 			putback_movable_pages(&source);
-- 
2.27.0

