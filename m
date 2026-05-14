Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628AE395AD5
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746920; cv=none; b=KpNW7M42ydFqd0QA/w/TLN1kPft2PxR4lGNwLw4SavLbnQJrxrfYOs1kLW37djH8wQiWM0mlO0ZyjL0IHDoTpxq/G3LvZZ0fW5ppTH3CwFiNFIMbZAtrDEGtDFWO/XcxHYhzzXm8Aa0cozJ5mkTVu3eEzp82/5kLvcudZq/Ux94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746920; c=relaxed/simple;
	bh=07Y/lkJkc1NqyJU8Q9kOlXnWNjntrNfFsId/nM9O38s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IipadTI7MRcZwdtEu7BIsSexYA6Lho9BbRbBw9ETz//ed3M6a40JOfiejIxRP/mSX+ZN6sqDQpBlxlpJ/DRdyGwXTvUBlLXOFJQHq/JMgK06eYdruK3SNeupJWhWwvNua213LduOUGbAtMtqk9gCBncgtkp8E7wpCvnCh0zIdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOfz7pAZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOfz7pAZ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82748257f5fso5565726b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 01:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778746919; x=1779351719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYXEDQETkSsL5D7C5JReu+GaAzOCViwf5QXVSoBOuE0=;
        b=nOfz7pAZCrokzB1f5KihG8/R+Gx7t3Yi2Enqsqm6vFey4AXggvt+/l/8OM/bn1Xcq/
         jWadVBRW6mEoTkOG/IlM4KqJtDI04q+CSIBT28tvn2HrAtOKKZcp/dy6mbCjqy8OwR+w
         mmJWu4rLvVj2siBNJvjW9X7ms/MxT5R0VXU2yICwjIID75boOPqdIGkeymEbjzmayn+5
         e1qglovgiXtdhmZDuxCUXHa/zrWPnlFpGJ1cQhc9cW2q6v0NGhieBrS9WIvZXtkSrM1V
         4Qqb2YwfbuDZ1uXccHRoMkPs5N25a7cw4PTZKmMrC7TXOPrpoWg6ZUWAwhF6okxd7FbV
         fMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746919; x=1779351719;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WYXEDQETkSsL5D7C5JReu+GaAzOCViwf5QXVSoBOuE0=;
        b=WW9P0h4mzA9bJkDfyHB6R11ZDZSDu28cf7Nqx9UGgTeI+wmjveO2Tvh6VxoiCCOhJt
         hCtpd58jj10L4JlUYat6eUIsdDnGn6+v8vkGm3ury5AVW/SWJi3h0Lw0f+2cgDoHWZls
         AVC1rTfz4/sEtAxo1r4cmnrTjuLLYotGwHsVWXqiZ9fzj5MRSL1XiDq3gpofg9eITB9j
         HNZZs92RiyioChd6yXwklGpP7XowKBpwftlgOxQQBn29evWKP2lgIqGx3ZX0EyEj3XHf
         pMLVT90fsosWfemBGbv58W1v3ta1vcjPEWHQMFjWruqGRtbu5n7a1rrhtWtwke9Rxdac
         0ilQ==
X-Forwarded-Encrypted: i=1; AFNElJ8X5EKQPHI5D9acp095nbjpYj8C7YK540rP5l2M4jtKbSHCzvgcAYElU1NCY5/Lie1rGaLGVZTDWjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEjPDHcBjkDTKe+KZNqYAwAYsygHixhML/dJOPb2EB0AgDkyW
	i///v92OsDd4l2w0jSjTQP6gKCennl9r66i7VOlku/eRPK7lLcrWEmaP
X-Gm-Gg: Acq92OETZEp7SSZKyrBT3PuSn6ukRh0MyeVjF2fK4YlHg+AdVnZiS3NkW7Ve7JDoHiz
	lM9vWQHi0ztXQgFhDvts0Y0mFEoKSxRZu74C9VJFcPE8sYCWmigjQb2xrObkTUR7prJw2qZQfRO
	GOmPN+xz/K8sVCRHzwKPAsQNrfSEZa+QxLkKyPm5jHwKIXuUOeX5PqFx/fecxtWl0WbkKtMmL7b
	2CpxV54Hi1dWbTVmi6fNdlEJMInumvuA5iIH5B2doE0dDVSzGs0cRcSdvoda5tomi5kLhg1Ubxj
	1mp6imx9nPlfhQqEHZy8jCUQWvk7r47R/4ZnzW0hSDHmayF7HBKQJQtQmt9uvYE8MlFomWS7gLW
	QTI9FRD8AeAXHC97jhnkJ3zfCvvDoFRen9IsTGoZmCLjJskI6k7MixLoeLlClKPO+Npp7qEI0kl
	XJzkzfh9q95ptoSpLPBop2pPzzG5FqHOW44aFucC0ETERQLeIfhhHRSQ==
X-Received: by 2002:a05:6a00:10cf:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-83f18e6700dmr2504897b3a.18.1778746918343;
        Thu, 14 May 2026 01:21:58 -0700 (PDT)
Received: from [10.125.192.65] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977a570sm1804344b3a.20.2026.05.14.01.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 01:21:57 -0700 (PDT)
Message-ID: <59a55147-b2c6-c5ff-64ae-07da4792958a@gmail.com>
Date: Thu, 14 May 2026 16:21:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] mm/zswap: Add per-memcg stat for proactive writeback
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org,
 mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <20260511105149.75584-4-jiahao.kernel@gmail.com>
 <CAKEwX=OigngmcNo1OU-apCFG2hebt5yZwXQxZQHqgC7SwH_HAQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=OigngmcNo1OU-apCFG2hebt5yZwXQxZQHqgC7SwH_HAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/14 05:21, Nhat Pham wrote:
> On Mon, May 11, 2026 at 3:52 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> Currently, zswap writeback can be triggered by either the pool limit
>> being hit or by the proactive writeback mechanism. However, the
>> existing 'zswpwb' metric in memory.stat and /proc/vmstat counts all
>> written back pages, making it difficult to distinguish between pages
>> written back due to the pool limit and those written back proactively.
>>
>> Add a new statistic 'zswpwb_proactive' to memory.stat and /proc/vmstat.
>> This counter tracks the number of pages written back due to proactive
>> writeback. This allows users to better monitor and tune the proactive
>> writeback mechanism.
>>
>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst |  4 ++++
>>   include/linux/vm_event_item.h           |  1 +
>>   mm/memcontrol.c                         |  1 +
>>   mm/vmstat.c                             |  1 +
>>   mm/zswap.c                              | 11 +++++++++--
>>   5 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 05b664b3b3e8..29a189b18efc 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -1734,6 +1734,10 @@ The following nested keys are defined.
>>            zswpwb
>>                  Number of pages written from zswap to swap.
>>
>> +         zswpwb_proactive
>> +               Number of pages written from zswap to swap by proactive
>> +               writeback. This is a subset of zswpwb.
>> +
>>            zswap_incomp
>>                  Number of incompressible pages currently stored in zswap
>>                  without compression. These pages could not be compressed to
> 
> nit: once we have reached consensus on an interface, can you add
> documentation for the new knob in cgroup v2 doc and zswap doc too, and
> how it interacts with the other interface (memory.zswap.writeback,
> shrinker_enabled sysfs knob).
> 
> A kselftest would be very much appreciated too :)

Thanks, will do in v2

Thanks,
Hao
