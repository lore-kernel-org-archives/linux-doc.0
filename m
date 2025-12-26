Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21481494A8;
	Fri, 26 Dec 2025 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766743632; cv=none; b=uIx/yGc4E5NNUDujhs4DsDch6TZzH7sJbaDdelhJTkrVvHsQJwIr0KzDRfZAry3+0pdFDYOgbJhu+rATigwVqw4l6V+K9jat47Sl6Yfy+zsQhMlGoFHI3+q5/grBqgb3oIpRgr6npqivX8FGhB82LhOqSqeGascj6UivLd/zPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766743632; c=relaxed/simple;
	bh=cp0VCWQZd5qtq+L7ZYwdOrJ2BeS3puBAA808BaQIvNM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YEsDl5y6k/acLpPho29SS3VoXRnsbIHLrM6Oh5603CDOeXGO0ML2f0uw6c8La8mnZpO0Ffkh6p2oqjy3Dyh0yFwci1TCsVMtEXiLHT9tkOvr8owt37fWhielvc88H0HCPCHy0R5L/AeUzYh9hTsUeVPnwd9X5oLbenCUOm/QJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1LqUj7YH; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1LqUj7YH"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=l7T+YGSbqj+e0hTazt6RxyEyzfQ8WVqvckzZlYgLl48=;
	b=1LqUj7YHCvgU0ez5JwfvoySJx//SwWrY32KqGLW1SdbhyIlg1qXuNVOjoAUPyu/ZdPsH9rs3i
	qjr8nLHKQyO2YQr/1rZGNn+kXPNTGe1zvSmoDsFKo/Z/KAC0w/MKer8QFlXf4gZHgAtVcAFWMqL
	znzBNwxvUDGUSD0tOgLeIfQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dd1RM4ZFlzpTKy;
	Fri, 26 Dec 2025 18:03:59 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (unknown [7.185.36.8])
	by mail.maildlp.com (Postfix) with ESMTPS id B6FFF4036C;
	Fri, 26 Dec 2025 18:06:59 +0800 (CST)
Received: from huawei.com (10.50.85.135) by dggpemf500012.china.huawei.com
 (7.185.36.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 26 Dec
 2025 18:06:58 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <corbet@lwn.net>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<Liam.Howlett@oracle.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
	<vbabka@suse.cz>, <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<willy@infradead.org>, <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lianux.mm@gmail.com>,
	<zhangqilong3@huawei.com>
Subject: [PATCH next v2 0/2] THP COW support for private executable file mmap
Date: Fri, 26 Dec 2025 18:03:35 +0800
Message-ID: <20251226100337.4171191-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500012.china.huawei.com (7.185.36.8)

This patch series implementate THP COW for private executable file mmap.
It's major designed to improve the performance of hotpatch programs, and
reusing 'vma->vm_flags' hints to determine whether to trigger the exec
THP COW.

The MySQL (Ver 8.0.25) test results on AMD are as follows:

-------------------------------------------------------------------
                 | Exec mmap Rss(kB)  | Measured tpmC (NewOrders) |
-----------------|--------------------|---------------------------|
 base(page COW)  |       32868        |        339686             |
-----------------|--------------------|---------------------------|
 exec THP COW    |       43516        |        371324             |
-------------------------------------------------------------------

The MySQL using exec THP COW consumes an additional 10648 kB of memory
but achieves 9.3% performance improvement in the scenario of hotpatch.
Additionally, another our internal program achieves approximately a 5%
performance improvement as well.

As result, using exec THP COW will consume additional memory. The
additional memory consumption may be negligible for the current system.
It's necessary to balance the memory consumption with the performance
impact.

v2:
- Add MySQL and internal program test results

Zhang Qilong (2):
  mm/huge_memory: Implementation of THP COW for executable file mmap
  mm/huge_memory: Use per-VMA hugepage flag hints for exec THP COW

 include/linux/huge_mm.h |  1 +
 mm/huge_memory.c        | 91 +++++++++++++++++++++++++++++++++++++++++
 mm/memory.c             | 15 +++++++
 3 files changed, 107 insertions(+)

-- 
2.43.0

