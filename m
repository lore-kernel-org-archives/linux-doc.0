Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FF72E3B1C;
	Mon, 15 Dec 2025 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802322; cv=none; b=mTMv8NvzbKjWSoVFmGGUA2DYFVkyHrmppcYqXoOxL7j5rp+n+ebbtgOojrZPgv9FR18RFP507auBZsDT8sMVhwsB5OvdF9EUSOPQ57yZkPENt440z4bxw9qRXDv/08ILk9a33G9oNa+0Ce7LI0bY0Y5jKfg/sOx0qSKNAZIgGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802322; c=relaxed/simple;
	bh=nxJ+FhAUBfeYd/hGQdav2JTmk20fSL24Am+MYsTkfP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f0V+qKEgyqzEwbXxkXiT25TRLPh21CcS+MUIXP49vT232h3xZyVFAeQBG5OHRR9/N7XyDeOk/C4MbiFPP+eyhcZOM9VQ00+pyiFxHI5gRaQuO6zjv3dhbOSzdk6MQiaNjqGVBzyM+YQYgcT91t1eD2/S2X9WBMrofOnahR4X4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=F17DNVbO; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="F17DNVbO"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bbIFC6VJA77jkt1FfGS/knbgL34kn+rdZVOQ9YOnR24=;
	b=F17DNVbO6fDO22XDpcGSqnWsLSYRd4I1YP6aJGypREcF7lFZX5PB7E3+h1IrFk6h/tocsm7VM
	6XtFHHSl+XhVjYW2r3IH2OYLTBMdTw9b9otytpRpq1r0nyyFJqbd/YqvkGeJNhVdAft1mTA19FS
	59yGCo5FftDJGHOMsCF0iZU=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dVKL73ZJ9znTVZ;
	Mon, 15 Dec 2025 20:36:15 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (unknown [7.185.36.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A3FB1400D4;
	Mon, 15 Dec 2025 20:38:30 +0800 (CST)
Received: from huawei.com (10.50.85.135) by dggpemf500012.china.huawei.com
 (7.185.36.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 15 Dec
 2025 20:38:28 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <corbet@lwn.net>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<Liam.Howlett@oracle.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
	<vbabka@suse.cz>, <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Zhang Qilong
	<zhangqilong3@huawei.com>
Subject: [PATCH next 0/2] THP COW support for private executable file mmap
Date: Mon, 15 Dec 2025 20:34:05 +0800
Message-ID: <20251215123407.380813-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500012.china.huawei.com (7.185.36.8)

This patch series implementate THP COW for private executable file
mmap. It's major designed to increase the iTLB cache hit rate for
hot patching application, and we add a new sysfs knob to disable or
enable it.

Zhang Qilong (2):
  mm/huge_memory: Implementation of THP COW for executable file mmap
  mm/huge_memory: Add sysfs knob for executable THP COW

 Documentation/admin-guide/mm/transhuge.rst |   8 ++
 include/linux/huge_mm.h                    |   5 +
 mm/huge_memory.c                           | 105 ++++++++++++++++++++-
 mm/memory.c                                |  13 +++
 4 files changed, 130 insertions(+), 1 deletion(-)

-- 
2.43.0

