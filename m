Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCED344D9B
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786592638; cv=none; b=ZDZhoLPyiDUfLOK57qiGbKxF7kvpw0InVHBMjsCpvfRETws/MPOaGHCvuXuy1tm+F4m9q4lEwHG/+3S20BKXwsxM7hBqcvtX7n6BoOmTAnpoDQaUqlWqYXUvryZMCv89uPH1BrA+O1Ftdy1Sd/XUU0OIa74uoN8y7iw2FLnjwkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786592638; c=relaxed/simple;
	bh=YIJrD6SxIGVJ7cQ8C2Vw70w1jx4IHuWgBHmhxYe5pKA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JgSYjg5j3pASWF+AtRCBa9cjdsPs5CGshwo49CaBqzMxGhhWT/PM+wjAfMzwrE5NXsfvjyZ6NR/st1QqNgjx5H4L3rfftTsvhciH6TiE11Lvc+H7TDrI2B5hvAu8Moz3mL1Z/NNZ7+DAW09KGTQPpTtqTYwweh5ukE/05Tkf1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=fVqV4ht5; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="fVqV4ht5"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nfcGx0YSMLP1yfpj8Odjxu7UM2DMjOzTVUn/eVe9GgU=;
	b=fVqV4ht53hJl1keWSbKGqRqm/hOB8jbkpkwlzEQiaY5hFeoa2S/l+ZcmcyHbPofGkp7Xs88dG
	RdFBZAuYySQ1r7ZXvcfrP0SeIW4fVkhonDEA0HjlZhkhCUTWnD6ZoW16NGUv9MVmk8cnZTyvRvd
	Jw4QKIqLpMES5zI1PKyzq5Y=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hL9t65bSLzpT0F;
	Thu, 13 Aug 2026 11:33:02 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id B637340537;
	Thu, 13 Aug 2026 11:43:47 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 11:43:46 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<shr@devkernel.io>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v2 0/2] docs/ksm: fix advisor documentation and comment
Date: Thu, 13 Aug 2026 11:17:20 +0800
Message-ID: <20260813031722.569983-1-tujinjiang@huawei.com>
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
 kwepemr500001.china.huawei.com (7.202.194.229)

Fix typos and misleading description of advisor_min_pages_to_scan.

Changes since v1:
 * remove fix tags for both patches
 * update commit message and comment for patch2
 * collect Acked-by for patch1

Jinjiang Tu (2):
  docs: ksm: fix typos in sysfs knob names
  mm/ksm: fix advisor_min_pages_to_scan description

 Documentation/admin-guide/mm/ksm.rst | 8 ++++----
 mm/ksm.c                             | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.43.0

