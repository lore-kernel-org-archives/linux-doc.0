Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DD21ABB1
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 06:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553448; cv=none; b=T6S3MUXG5gVzRylT6pSz9DvPnE2pXIhESdXpFS/aWmXNAJggEr+2gS7g/g+02/+OtOmS65aP3eHaxBHEUlO3vsyRu75rBgSMmdcWxD8HrR9Q1v0KVTgUoi9T2jdIH7mMB4P4Q7D2sasgOY+BxxNuf5pGD2gqxWrDErv016aDmgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553448; c=relaxed/simple;
	bh=TPQ3wNSgiND0Jj/pIcGueHFrj0TQunmK6OEpaNyoBrU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=neQeLfDhmhdmZZmvJ2WfmDxSXDB/intgKfI4WCNCOy4YS9jOJz44FSnJbG12sipggN201TKbSouQM2nIIl0c824/wq/0xyicIBrU36RE54SyEMQf70LYWdF6EhgnqKVG7Bi0T2GP9oErNAdeqfrGAoursgf5zOvJyHOBjxL/q9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=SqTN8SiL; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="SqTN8SiL"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BE7h3+yxeVXfvWQuV0lNQ+7mLvBP685dQAMjbh176/w=;
	b=SqTN8SiLzFVGLB6RGHRM5cx5V35adm9PCquSVSY9SzdFLoq+ENurQWO3xKDbtynI6zvtQYhVY
	9TZoVOZoGiF/v36om0LaZkgIlWO3IGTEeuqLT3+jNrCTjUZpBw9ba/KTEFJSPX6mQjUs50qSqLz
	eGFEo6OTgjG3/kQJWileEXc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hT1CF6338zRhR0;
	Mon, 24 Aug 2026 14:26:33 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D1E8203C8;
	Mon, 24 Aug 2026 14:37:16 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 14:37:15 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<shr@devkernel.io>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v3 0/2] docs/ksm: fix advisor documentation and comment
Date: Mon, 24 Aug 2026 14:10:08 +0800
Message-ID: <20260824061010.3343959-1-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)

This series fixes two problems left in the KSM advisor documentation
and code comment:
 - Patch 1 fixes two typos in sysfs knob names ("adivsor_max_cpu" and
   "adivsor_max_pages_to_scan") in ksm.rst that don't match the actual
  knob names.
 - Patch 2 fixes the description of advisor_min_pages_to_scan: it is
   described as the lower limit of pages_to_scan, but is actually only
   used as it's initial value, and the runtime pages_to_scan can drop
   below advisor_min_pages_to_scan.

Changes since v2:
 * update cover letter
 * update commit message for patch2

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

