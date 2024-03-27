Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64813B287
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548808; cv=none; b=hEKNbI8i0NtUsv/8J8o0UihYDQsD9DJPGWiVF+TCe1C5ar2bGCsgtlYifmJNtVjh+kwKr1v3fZtU7Uy/zcqdKtX4AevR1/vph6jLo8ybEGASjNENWpo9yvKDNfV+3IKv4QLjBm9VNWzVaMk1r++XQA8bmRUirXZJywObHeKHYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548808; c=relaxed/simple;
	bh=CZwnoHQtOjYoE0nllxWkdCJVx8XGwi/326Yx+gZ9fwc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsK55Z3EAart+3e+psCpoYhh+fBHdG/zkBx9VvLYLGFR1owVX9R0XvV4JJYeG2olr/MxVA0t7U7oO78FcGRM9D5k7EHL/VYqrveHZHz1vSSwVtbB0jqSplm+VBIAPbyoGl48WBv3z9hMvTVPtUmHDOiqqeCcJntqYcHF+U32Suk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4V4T8k11QvzXjxC;
	Wed, 27 Mar 2024 22:10:30 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 765B61404F6;
	Wed, 27 Mar 2024 22:13:17 +0800 (CST)
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
Subject: [PATCH 5/6] mm: memory-failure: use isolate_movable_folio() in mf_isolate_folio()
Date: Wed, 27 Mar 2024 22:10:33 +0800
Message-ID: <20240327141034.3712697-6-wangkefeng.wang@huawei.com>
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

Directly use isolate_movable_folio() helper in mf_isolate_folio().

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 mm/memory-failure.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 9349948f1abf..6f47776df0e1 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2628,8 +2628,8 @@ static bool mf_isolate_folio(struct folio *folio, struct list_head *pagelist)
 		if (lru)
 			isolated = folio_isolate_lru(folio);
 		else
-			isolated = isolate_movable_page(&folio->page,
-							ISOLATE_UNEVICTABLE);
+			isolated = isolate_movable_folio(folio,
+							 ISOLATE_UNEVICTABLE);
 
 		if (isolated) {
 			list_add(&folio->lru, pagelist);
-- 
2.27.0

