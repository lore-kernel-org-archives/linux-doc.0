Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7F230E82E
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488472; cv=none; b=PYJOeJceDC1w1Yw9z0netAGIcVM+sZZw/JDaHfOkI0+mDBJ/rTpPgdSp2M8JtUW3PgGKnQx4Qhv+yfnvMGR47w9uDW6K6/IWxZR39eZJhOZAaysixGrs456KFg+uDrj3Fd6Xsr6R+A+JJ6xqaKaPFdbyzGGwuDyrRTukWEtEgj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488472; c=relaxed/simple;
	bh=YTt/oY/90xyPV9hUAQQynKGZH+KaO9lSsa1zS5bRuyU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VI6BtAIdxoIyJrNtlK8/rak8G1xIQVDpUqPOgskeM/eAUUOkcMWXK4WDHie0q0lJFP0wKBYBVH/Ue8ZgIofDUje3We3lr4sOu0RP6QpZKW6bnkhPsCry7Fdzs/8SsfBAbc2H9WCBmSQCXoJpS15KLMb1TQT/cL0IlnsL4d72dNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NR7XLSqq; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="NR7XLSqq"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VFyXsSHstxBFgLyWsqQtLrkX7vC2PRGmGRynzo628c8=;
	b=NR7XLSqqXjHovnSsi91bpQ05//uD9sh6Mlz2930eXsND/bAArDYszP5iHpIOozjH8RUHRZeN2
	PSrNFHeqRwC6YLullss5DMHxbBS/+EioVOFOUC7RW3D/aclMYMeTnnX3VTZhzx4XFVfWZEx8Is6
	3J0syixG1Gh9BFHpY7uDBXI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hBKYg0DwgzKm9T;
	Fri, 31 Jul 2026 16:51:35 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id BE6B040572;
	Fri, 31 Jul 2026 17:01:05 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Jul
 2026 17:01:05 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<shr@devkernel.io>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH 0/2] docs/ksm: fix advisor documentation and comment
Date: Fri, 31 Jul 2026 16:35:24 +0800
Message-ID: <20260731083526.3953421-1-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500001.china.huawei.com (7.202.194.229)

Fix typos and misleading description of advisor_min_pages_to_scan.

Jinjiang Tu (2):
  docs: ksm: fix typos in sysfs knob names
  mm/ksm: fix advisor_min_pages_to_scan description

 Documentation/admin-guide/mm/ksm.rst | 8 ++++----
 mm/ksm.c                             | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

--
2.54.0

