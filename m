Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7862612E1FB
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548809; cv=none; b=idEHLV/Xqe7WbqFuv5QhwEHyMijSsp+01KWWAqQzb5CHo+3zhoAvRGazj16NJ1b80hK0WMEVmhuJzwvQlszK2J66MmoWJsUGS3uRk5ghpQkwC3M2QV/4/QSVm1IVPyFeBhKd9tHVMG3ni0CJHh/IssC6eS9X7hmcZs4SXikPTQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548809; c=relaxed/simple;
	bh=JEffWrpDg0I3wA0gnukJ3C2U+BgKy0NQWNpC4TvF+7k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rskc9AvTBnzAzeNG4maABYrk4BtrnHVIfhZGYl4E/ywYF7BV95J4iv0szGOcKHdy0tPZrqaRv6HnskkuIW5fhmVbD0l/+Vxl6QjnpPFPamJVhywbh8crPkK3MARB6emCo3HzT34spv8dU6SnVBKl/JTQfBnQ61qhugc1hy2Ofmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4V4T9860pXz1QBQx;
	Wed, 27 Mar 2024 22:10:52 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B83A1402C6;
	Wed, 27 Mar 2024 22:13:18 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 22:13:17 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <willy@infradead.org>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Hugh Dickins
	<hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 6/6] mm: migrate: remove isolate_movable_page()
Date: Wed, 27 Mar 2024 22:10:34 +0800
Message-ID: <20240327141034.3712697-7-wangkefeng.wang@huawei.com>
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

There are no more callers of isolate_movable_page(), remove it.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/linux/migrate.h | 3 ---
 mm/migrate.c            | 8 --------
 2 files changed, 11 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index a6c38ee7246a..2b680b939020 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -69,7 +69,6 @@ int migrate_pages(struct list_head *l, new_folio_t new, free_folio_t free,
 		  unsigned long private, enum migrate_mode mode, int reason,
 		  unsigned int *ret_succeeded);
 struct folio *alloc_migration_target(struct folio *src, unsigned long private);
-bool isolate_movable_page(struct page *page, isolate_mode_t mode);
 bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode);
 
 int migrate_huge_page_move_mapping(struct address_space *mapping,
@@ -90,8 +89,6 @@ static inline int migrate_pages(struct list_head *l, new_folio_t new,
 static inline struct folio *alloc_migration_target(struct folio *src,
 		unsigned long private)
 	{ return NULL; }
-static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
-	{ return false; }
 static inline bool isolate_movable_folio(struct page *page, isolate_mode_t mode)
 	{ return false; }
 
diff --git a/mm/migrate.c b/mm/migrate.c
index b2195b6ff32c..f50ed046ede3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -125,14 +125,6 @@ bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode)
 	return false;
 }
 
-bool isolate_movable_page(struct page *page, isolate_mode_t mode)
-{
-	if (WARN_RATELIMIT(PageTail(page), "trying to isolate tail page"))
-		return false;
-
-	return isolate_movable_folio((struct folio *)page, mode);
-}
-
 static void putback_movable_folio(struct folio *folio)
 {
 	const struct movable_operations *mops = folio_movable_ops(folio);
-- 
2.27.0

