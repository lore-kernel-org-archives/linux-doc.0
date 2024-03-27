Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6214037E
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548802; cv=none; b=om3ECvWyzGqhgJJ+FfMGe55k1H6dlUf2j5VnxcavILoeBXaz0DTBf74Et5yFHRgq/F9sp5BXE9SG7vBMhsddU5g4ZU2cdYaJhGAOPLHN2ABotQWg+2foYC4IK30waUUBz31NCGAXDN3u3VYCSuYI/cAMhyC1ReQd1/Vls5Frh18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548802; c=relaxed/simple;
	bh=dKvm68YP6vV5m6RnRGmChXP9DKhe2FjG5Kwa6llO6fk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hGoamgmYrdlP/i9aEdbaRX2zmgCciTSt7+zC1HOzwuDQiEN9MfW0LfW58zBRtlpAqomscr6psxPZyKsTjU0YqweU1dEs/EQD6dpkMSihZGXF9lPqRAKXjHKQg4tDGKqrrPElHdsqAgbGDWZO4E8SLUF9bQYGptAuxDcuXIuO1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V4TCK5yRZz1GD8d;
	Wed, 27 Mar 2024 22:12:45 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id D64A21400DA;
	Wed, 27 Mar 2024 22:13:16 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 22:13:16 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <willy@infradead.org>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Hugh Dickins
	<hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 4/6] mm: compaction: use isolate_movable_folio() in isolate_migratepages_block()
Date: Wed, 27 Mar 2024 22:10:32 +0800
Message-ID: <20240327141034.3712697-5-wangkefeng.wang@huawei.com>
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

This moves folio_get_nontail_page() before non-lru movable pages check,
and directly call isolate_movable_folio() to save compound_head() calls,
since the reference count of the non-lru movable page is increased, a
folio_put() is need() whether the folio is isolated or not.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 mm/compaction.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 807b58e6eb68..74ac65daaed1 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1097,41 +1097,41 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 			}
 		}
 
+		/*
+		 * Be careful not to clear PageLRU until after we're
+		 * sure the page is not being freed elsewhere -- the
+		 * page release code relies on it.
+		 */
+		folio = folio_get_nontail_page(page);
+		if (unlikely(!folio))
+			goto isolate_fail;
+
 		/*
 		 * Check may be lockless but that's ok as we recheck later.
 		 * It's possible to migrate LRU and non-lru movable pages.
 		 * Skip any other type of page
 		 */
-		if (!PageLRU(page)) {
+		if (!folio_test_lru(folio)) {
 			/*
 			 * __PageMovable can return false positive so we need
 			 * to verify it under page_lock.
 			 */
-			if (unlikely(__PageMovable(page)) &&
-					!PageIsolated(page)) {
+			if (unlikely(__folio_test_movable(folio)) &&
+					!folio_test_isolated(folio)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
 					locked = NULL;
 				}
 
-				if (isolate_movable_page(page, mode)) {
-					folio = page_folio(page);
+				if (isolate_movable_folio(folio, mode)) {
+					folio_put(folio);
 					goto isolate_success;
 				}
 			}
 
-			goto isolate_fail;
+			goto isolate_fail_put;
 		}
 
-		/*
-		 * Be careful not to clear PageLRU until after we're
-		 * sure the page is not being freed elsewhere -- the
-		 * page release code relies on it.
-		 */
-		folio = folio_get_nontail_page(page);
-		if (unlikely(!folio))
-			goto isolate_fail;
-
 		/*
 		 * Migration will fail if an anonymous page is pinned in memory,
 		 * so avoid taking lru_lock and isolating it unnecessarily in an
-- 
2.27.0

