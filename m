Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0358519992C
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 02:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959698; cv=none; b=tJOYJd+IPFgNG2EMt93dvpv0J5vu/bPbnQQsw7ktpMhxVE2dYATzJm6+oL1IWO+uuHeZd2jbBh980q5xG8vLd6N5LPJRna9eOMeNQPFymLxcNeiq1lcTZ3NSFZQIZyTRrwZFe5I4OGVUAuk3bCOsKoJVdmO2U02RFyoy2uF2x5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959698; c=relaxed/simple;
	bh=8kqHDz1T8vPkOVeqe1XSIrL8LjI68jWeARu4pzITenY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdFQotIXhJMNyEq4v82hH3xn7RA/TV5EQOvlKNFqnyUS9F0MSpJ+RVFn0fOoMj4xXG2kvWzVCMNV8nMFTqHL8822VaxkfBpEioaI7JTjiD+4r3aNhfikL2jy1ekwlAgVD/zZ95MYYqCB8aSuQkosij8pEk4E9gaaeJ5BZO2Oo48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JSjyD0y3; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JSjyD0y3"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782959688; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8kqHDz1T8vPkOVeqe1XSIrL8LjI68jWeARu4pzITenY=;
	b=JSjyD0y3vqfAexga+S9sUbMdxPE480fNGUnMlzqiEAu7CmhjGjlF9OyWw/5pXYKppaKfgyF/3F/jxVULOBN2jKRgz81I8VIviTOr0T20etonvQqTaceGf6ieM6evdnarn19jHHW/1O+DL45xcliF8mTwQ8aFj/kaHQnFuxjV+TA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X6COG0M_1782959686;
Received: from 30.178.83.30(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X6COG0M_1782959686 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 02 Jul 2026 10:34:47 +0800
Message-ID: <2dc374ad-b365-48c0-8d45-aacf53f80e4c@linux.alibaba.com>
Date: Thu, 2 Jul 2026 10:34:46 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] nvme: Introduce service-time iopolicy
To: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, onathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org
References: <20260617114602.2224074-1-kanie@linux.alibaba.com>
 <8103a626-d07b-4b20-b10e-d258485176ee@suse.de>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <8103a626-d07b-4b20-b10e-d258485176ee@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/7/1 19:14, Hannes Reinecke 写道:
> On 6/17/26 1:45 PM, Guixin Liu wrote:
>> Hi all,
>>    I developed the service-time iopolicy in nvme native
>> multipath, please review, all comments are wellcome.
>>
>> Guixin Liu (2):
>>    nvme-multipath: add service-time I/O policy
>>    docs: nvme-multipath: document service-time I/O policy
>>
>>   Documentation/admin-guide/nvme-multipath.rst |  31 +++-
>>   drivers/nvme/host/multipath.c                | 165 ++++++++++++++++++-
>>   drivers/nvme/host/nvme.h                     |   6 +
>>   drivers/nvme/host/sysfs.c                    |   5 +-
>>   4 files changed, 202 insertions(+), 5 deletions(-)
>>
> We're still waiting for the adaptive I/O policy to be included, so I
> guess this patch should build on top of that.
>
> Cheers,
>
> Hannes
Yes, I work on that adaptation. But I thought it would be helpful
for the maintainers to review the logic here first before I proceed.

Best Regards,
Guixin Liu

