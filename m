Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FEA3E0738
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696780; cv=none; b=QctKlZXPJpnHJFrpHY9sfjLFz62FVZqApXEzHPEbXo3nepaXWRpoJ95c0sFAjgH8yQKKYUze9ZsF37pDNDKpyQT4vpk+z6xpqKAHzJqaQAYT9VmIV3Jr3BF71oeOm+vVNGKqi4gdx+cf6lWbtmtowK5TOCkSL21bSsC77GLUWw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696780; c=relaxed/simple;
	bh=euURCyAij/DiVsfCeqLtmd1t/tFQLmYPVkXjq/f1vec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Losi5JLk0p46B9qBIOOUv5OdrjTigfPw42qGGnmP0+qrdrodNJqmeVzuG0VqrBg9gCgKZBIizfq3ZzR3047yD4c6p9ct7ryujG2cRBuU/mpxdXTfeOX6/w5zRZHP/ClCuamh6ZFPg4PVH0DXZRfgOSXlU6bs09eqhGbDYMWmySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UcaPx8hB; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UcaPx8hB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781696768; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Kuyum3ZOu8vyChyP0CCx3KwpwUBf1l9eT41x3JiJcS0=;
	b=UcaPx8hBCAgfAXOESFxXAr6S19XQl9zyNoLBnaOaxK/RdR6Mj96bhI3DP5YKqWQscZ8tR3OY6e96nX8YtzcMA4gjQ+lCzJwxs2je1jV2cNSoBWxR2Sq7lxDFQmPaoCu61PRcM9DvXxsg6tYVJxDAzrnZ+6CG5tc3Yd0JccaLOtc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X53e-Rv_1781696763;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X53e-Rv_1781696763 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Jun 2026 19:46:08 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	onathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-nvme@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] nvme: Introduce service-time iopolicy
Date: Wed, 17 Jun 2026 19:45:57 +0800
Message-ID: <20260617114602.2224074-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,
  I developed the service-time iopolicy in nvme native
multipath, please review, all comments are wellcome.

Guixin Liu (2):
  nvme-multipath: add service-time I/O policy
  docs: nvme-multipath: document service-time I/O policy

 Documentation/admin-guide/nvme-multipath.rst |  31 +++-
 drivers/nvme/host/multipath.c                | 165 ++++++++++++++++++-
 drivers/nvme/host/nvme.h                     |   6 +
 drivers/nvme/host/sysfs.c                    |   5 +-
 4 files changed, 202 insertions(+), 5 deletions(-)

-- 
2.43.7

