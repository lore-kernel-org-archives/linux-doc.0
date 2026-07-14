Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7052C21C4
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012504; cv=none; b=OK/8zM7e7YzibpW4W7k9lvTOzPyyYRbUDpAGFOM7lrxdmPqvi5dwCfYJRI1FgcsODwtXqFYvUWPkk++5Ejr5YtwY0axS4NBmVwmt4mYb+PhPpgcEA4OV4Y3SHE/7+H2Mm+ofvrTyd6OS0gTYsddMmPXyWjgE1RClFrHAXUDHAbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012504; c=relaxed/simple;
	bh=vPcRFwICMDC9Lik+bKb7IEi5ZWfJwDInk+CJD1m8JKY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d8fli3s7yxovnLQA69/6dO+zt7tgO6Dz7aZPKQuIxRC/Gnh3mbMTo6hcsZoppRYByVBoGoBMobeo//p1X/PdCqhSX02cgk1TPPjflPRR8hiO57tFv/v4DM4AEG0LdZXpgWICOzKXHYTjXBzWV250HBXOzwMA5xIZit+/MacbIdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=GcH8b5Ae; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GcH8b5Ae"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784012498; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=9toQdXyzLXloRYXjzkceTNVd5G3va6NI169jt75Ysz8=;
	b=GcH8b5AeYAXcuT64gVss/4QSHS05pHlsHwc+o/XPV6KlTD3jZXuk0Vs+F+rmT1IXuYR5XcrOA9+R53odPnYQL/1LzkDhYYvcy6LAJCx+uvhM6x//rG/cvDIR9MMP9Dynzw1Sl/kBzDQv4XVoc4UYaJXLsGWgFKYf/JDWrTIA5eE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X73IKvG_1784012497;
Received: from 30.178.83.149(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X73IKvG_1784012497 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Jul 2026 15:01:38 +0800
Message-ID: <24577326-4ed5-477a-9766-ec9cf16e6abf@linux.alibaba.com>
Date: Tue, 14 Jul 2026 15:01:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] nvme: Introduce service-time iopolicy
From: Guixin Liu <kanie@linux.alibaba.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 onathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org
References: <20260617114602.2224074-1-kanie@linux.alibaba.com>
In-Reply-To: <20260617114602.2224074-1-kanie@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, gently ping, all comments are wellcome.

Best Regards,
Guixin Liu

在 2026/6/17 19:45, Guixin Liu 写道:
> Hi all,
>    I developed the service-time iopolicy in nvme native
> multipath, please review, all comments are wellcome.
>
> Guixin Liu (2):
>    nvme-multipath: add service-time I/O policy
>    docs: nvme-multipath: document service-time I/O policy
>
>   Documentation/admin-guide/nvme-multipath.rst |  31 +++-
>   drivers/nvme/host/multipath.c                | 165 ++++++++++++++++++-
>   drivers/nvme/host/nvme.h                     |   6 +
>   drivers/nvme/host/sysfs.c                    |   5 +-
>   4 files changed, 202 insertions(+), 5 deletions(-)
>

