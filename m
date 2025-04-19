Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26C014AD2D
	for <linux-doc@vger.kernel.org>; Sat, 19 Apr 2025 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745048567; cv=none; b=JGj7U6EIUyB4J3MDjSvEi4YsW8mgvU3tpRiXFiOCuSyZnbAne+PV983fFRwftGvtRuxfWJdWzQXzqDgdJDT9BVCgoj7tujhVpAVODpAHfxSA79rGzOZH8tV6GJ9OCeXjrW7bOaUKds2lZ8CEi6o3Dt13WLJ+kApM7PmN0Dy73cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745048567; c=relaxed/simple;
	bh=9HiBbd1OCMroN2a22ETYEtVz7O6oY59eG/M+oGGURCs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P/MGAeWi1nVi3QrDRAyRdJqbz4+wdbTwPSGOCMLPsCTtr7FKuR2f9Osnihi7RLWbWLG4MZfvu1bo/YYrSkxLeKo8HXiuPMcIBUdZy2ojIeXa8aagL0qYQE8l7RZLyjzQn8uYcbQlpF4qnrwcY/kBbmi+vqO66USyDGq3GRO7CxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Zfk5P4Js2zvWpB;
	Sat, 19 Apr 2025 15:38:33 +0800 (CST)
Received: from kwepemo200002.china.huawei.com (unknown [7.202.195.209])
	by mail.maildlp.com (Postfix) with ESMTPS id EA35818047F;
	Sat, 19 Apr 2025 15:42:40 +0800 (CST)
Received: from huawei.com (10.175.124.71) by kwepemo200002.china.huawei.com
 (7.202.195.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 19 Apr
 2025 15:42:40 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <osalvador@suse.de>, <muchun.song@linux.dev>, <akpm@linux-foundation.org>,
	<david@redhat.com>, <corbet@lwn.net>
CC: <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, <tujinjiang@huawei.com>
Subject: [RFC PATCH] docs: hugetlbpage.rst: add free surplus huge pages description
Date: Sat, 19 Apr 2025 15:32:14 +0800
Message-ID: <20250419073214.2688926-1-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo200002.china.huawei.com (7.202.195.209)

When echo 0 > /proc/sys/vm/nr_hugepages is concurrent with freeing in-use
huge pages to the huge page pool, some free huge pages may fail to be
destroyed and accounted as surplus. The counts are like below:

  HugePages_Total: 1024
  HugePages_Free: 1024
  HugePages_Surp: 1024

When set_max_huge_pages() decrease the pool size, it first return free
pages to the buddy allocator, and then account other pages as surplus.
Between the two steps, the hugetlb_lock is released to free memory and
require the hugetlb_lock again. If another process free huge pages to the
pool between the two steps, these free huge pages will be accounted as
surplus.

Besides, Free surplus huge pages come from failing to restore vmemmap.

Once the two situation occurs, users couldn't directly shrink the huge
page pool via echo 0 > nr_hugepages, should use one of the two ways to
destroy these free surplus huge pages:
 1) echo $nr_surplus > nr_hugepages to convert the surplus free huge pages
to persistent free huge pages first, and then echo 0 > nr_hugepages to
destroy these huge pages.
 2) allocate these free surplus huge pages, and will try to destroy them
when freeing them.

However, there is no documentation to describe it, users may be confused
and don't know how to handle in such case. So update the documention.

Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 Documentation/admin-guide/mm/hugetlbpage.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index 67a941903fd2..0456cefae039 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -239,6 +239,17 @@ this condition holds--that is, until ``nr_hugepages+nr_overcommit_hugepages`` is
 increased sufficiently, or the surplus huge pages go out of use and are freed--
 no more surplus huge pages will be allowed to be allocated.
 
+Caveat: Shrinking the persistent huge page pool via ``nr_hugepages`` may be
+concurrent with freeing in-use huge pages to the huge page pool, leading to some
+huge pages are still in the huge page pool and accounted as surplus. Besides,
+When the feature of freeing unused vmemmap pages associated with each hugetlb page
+is enabled, free huge page may be accounted as surplus too. In such two cases, users
+couldn't directly shrink the huge page pool via echo 0 to ``nr_hugepages``, should
+echo $nr_surplus to ``nr_hugepages`` to convert the surplus free huge pages to
+persistent free huge pages first, and then echo 0 to ``nr_hugepages`` to destroy
+these huge pages. Another way to destroy is allocating these free surplus huge
+pages and these huge pages will be tried to destroy when they are freed.
+
 With support for multiple huge page pools at run-time available, much of
 the huge page userspace interface in ``/proc/sys/vm`` has been duplicated in
 sysfs.
-- 
2.43.0

