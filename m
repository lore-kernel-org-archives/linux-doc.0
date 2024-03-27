Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BFE139D1D
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548805; cv=none; b=NluG/ib41HuQ+AfSgjXu9zwgYYjITLrcEpuQljRNdTeVqhfy9Vu7lUo1qop4RDTOUp8Oy/OkXUAfWrE7CyYbYWeAHCDOiQpW0nQYfOutZZRy+bwiFqbjCgPw2uv5VuPVIXiYzx/jm3x6O+nA0FiENS869zzuE7QqIPLb5GJdS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548805; c=relaxed/simple;
	bh=oV04ywnb5Z9PeTeDCybyW5fvpg8YS0DULu8cf+kHX9Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eCRYOJ0JKahF3iTDAePk2h+ugLEtez+Wq9WYC3S4h0spjag+86nXS226ZMmRO72J3/uMRV829oIOQWOZ6B8S1tQXO0gpUweVaZHFKgX6phrjyRf4ZJb9tGIzZVVnSb9i7lCulHp7bXMvqoV7sTbe85ZxrdiUE8kJSCkYaEDYPTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4V4T8g0hkgzXjwd;
	Wed, 27 Mar 2024 22:10:27 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 68BA41404F6;
	Wed, 27 Mar 2024 22:13:14 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 22:13:13 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <willy@infradead.org>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Hugh Dickins
	<hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 0/6] mm: remove isolate_lru_page() and isolate_movable_page()
Date: Wed, 27 Mar 2024 22:10:28 +0800
Message-ID: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
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

Turn isolate_lru_page() to folio_isolate_lru() and turn
isolate_movable_page() to isolate_movable_folio().

Kefeng Wang (6):
  mm: migrate: add isolate_movable_folio()
  mm: memory_hotplug: use more folio in do_migrate_range()
  mm: remove isolate_lru_page()
  mm: compaction: use isolate_movable_folio() in
    isolate_migratepages_block()
  mm: memory-failure: use isolate_movable_folio() in mf_isolate_folio()
  mm: migrate: remove isolate_movable_page()

 Documentation/mm/page_migration.rst           |  6 ++--
 .../translations/zh_CN/mm/page_migration.rst  |  6 ++--
 include/linux/migrate.h                       |  4 +--
 mm/compaction.c                               | 30 ++++++++---------
 mm/filemap.c                                  |  2 +-
 mm/folio-compat.c                             |  7 ----
 mm/internal.h                                 |  1 -
 mm/khugepaged.c                               |  8 ++---
 mm/memory-failure.c                           |  4 +--
 mm/memory_hotplug.c                           | 30 ++++++++---------
 mm/migrate.c                                  | 33 +++++++++----------
 mm/migrate_device.c                           |  2 +-
 mm/swap.c                                     |  2 +-
 13 files changed, 62 insertions(+), 73 deletions(-)

-- 
2.27.0

