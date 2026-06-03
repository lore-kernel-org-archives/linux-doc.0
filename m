Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB994657CD
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486214; cv=none; b=jmpKRbERruFDv4cOZHbQa1JTxEDjkWaWI6VUAg1QfWOo6PmWHvrVSIylh7naEqhE6W+U1022P4QjmSemYzY6dxiKWz+cKbFzi+LjBsEA+7jZoCJkL5a2kOUyVBjoNPhCeVtGhM2l32yVeXLC9gk+g9cyYfGqm8D5nJZjG9NPnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486214; c=relaxed/simple;
	bh=xOTX+MabhctCMO0AxLM6gpxNigvHpYgWMa7i9UOhHnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U00oj4nj6e3q/v9GANZcCHBiTegcw9xHar7HNThIAHrHbv70/GrMZLDn7lTrXVmrOLFksVEkqVdwBWpT26DRBI8chho0n5wS66upnb4CKML0kOrHB9nzCh6phR7KOJIzj0cNuvddL2YXZO1aNrZfeN4UbfnLsJVSGieipnxI/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HflTiosm; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HflTiosm"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so2449249a91.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 04:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780486211; x=1781091011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbLgrUUeNFGNskm0gEJ8DV84HGEbh6GoBjogs08lHeE=;
        b=HflTiosmYDes4tYn6xBTvtNMA9IHO7j7HDcC5GlLcw9p08u59BhVroSdNUHxvM+FMU
         u1esqBX1BrZq8bEUKgpKVwTIat6I3AdlOwTkyrwlbF5AluWNAGyrXjjDizqIfDWJTyJk
         4eYKVBsAQ6losAOMrAnQVCJaico1mTsopPAiDMV76utdbI1H8dq9O74nSI8Fd+DrJg8I
         NmFeH7ZQsnc67GIP/iztZo8OVpQaEbr/32/4JgSbINU4tPBOrNsO0hEHPKGDJ+dWRlof
         ZfXWaCJmvNkKuZTmC/MAqjpiF79/TJrD+cDX24mTd1BFlj0odbYgsf7a8rUo/rcP56iF
         EXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486211; x=1781091011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbLgrUUeNFGNskm0gEJ8DV84HGEbh6GoBjogs08lHeE=;
        b=GwtwDtE5oDZoDwfOmdkCdYQeABuysvo6ZtaJse27KYrd7E631FyDWbSzkN9DBR3EPS
         yfNbSWw2TuABraMMYB6g7fd8G0fRylaG9/90bTTXKhwS8RgWw6r5DZpxDfiQLKzQu/7S
         DrMlx1gVS1OO2gI/YWjOFgW96uIzbIIDgYvDoZRpDUwTpHLGZn7/7RfqW9sro1AwClRH
         HXQC80a+u9bBOeWcyIyS5uB00YMVHtt6AJp6mWeVZW2wnfvGqJM657n1gHGhqnvtSw2C
         LW6JI3gOoDlHWI2+SPiBREs87ESEczGZU/BbmXdJ74DNAAD5MT4bgZAsSp79asA4mMgU
         dTTA==
X-Forwarded-Encrypted: i=1; AFNElJ9JoeAbcACjWYKa1cWMMPpAXyZDcUgW/54BMto0WfchbcuovPbsDOnrzaa54mhuF9gacsS9kjqxkp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMCC1cL0xT0ak+IFCsV7h3gPj5Jk+j89gAMdvsVCwxB0UYUR9l
	8RG334ccupH1j1EdcxAzuwLdRihs6OoXd6C5cpv7lt9dcXOcJlLRW57j
X-Gm-Gg: Acq92OG5pvR1gSyAzKmFwqUrKDu09r9dkOUOMWfznzmKn1A8GGiqr7qqQvnVVAcnj4+
	x9DNMiACl/Pvl7VdWF5xAf+9qHPflMMm6Uc94h1R3xZi7pFYq8gZmaJQwUAIpr6DcF+LM1y3kme
	+RyUcakTbDFsaRUZt/UTf2ENuxVB4eC0A+qzr5OqPFcvc5PlNIi5jyLIgPJoVKGmDI7OBFBL4EV
	6pIBBreM4HSX3vYQEmhK0L7G7KGTymsCfIj4NVH3g7nrgCS/JAYBEmOo9bfmgCNps56cO6YWN/x
	Jsrd4owH6fZIS5kZ0YqfOoqgoSSJBUBK8BwuTUphPIaoKIC6eoxfOUGVApsFOEiSjETNr+3QvZC
	HVfOOjmhz+2NQA1/ssrFeLfPUx8JeztELjynAFosEYBqkVGBZT/Qp/OplHsY452x/y9bydUx2mc
	Hw6AZGZF8NMKqcdoOfLvhggvba3tki1dNS8oopL8jS4k8sICpp11BXNwcMZojqvKeP
X-Received: by 2002:a17:90b:2d8d:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-36e32285cf3mr3042276a91.14.1780486210499;
        Wed, 03 Jun 2026 04:30:10 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91820f3sm5910449a91.2.2026.06.03.04.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:30:10 -0700 (PDT)
Message-ID: <e2ddd20e-f092-4559-5d1f-d5c1130d2538@gmail.com>
Date: Wed, 3 Jun 2026 19:29:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 3/4] mm/zswap: Add per-memcg stat for proactive
 writeback
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org,
 mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-4-jiahao.kernel@gmail.com>
 <CAKEwX=PcFqmsdFqUnpWxrPkoc1B-1w3CEb0ydK3df0qJGG-mnQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=PcFqmsdFqUnpWxrPkoc1B-1w3CEb0ydK3df0qJGG-mnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/30 04:01, Nhat Pham wrote:
> On Tue, May 26, 2026 at 4:46 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
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
>>   Documentation/admin-guide/cgroup-v2.rst |  4 +++
>>   include/linux/vm_event_item.h           |  1 +
>>   mm/memcontrol.c                         |  1 +
>>   mm/vmstat.c                             |  1 +
>>   mm/zswap.c                              | 41 ++++++++++++++++++-------
>>   5 files changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 6564abf0dec5..7d65aef83f7b 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -1748,6 +1748,10 @@ The following nested keys are defined.
>>            zswpwb
>>                  Number of pages written from zswap to swap.
>>
>> +         zswpwb_proactive
>> +               Number of pages written from zswap to swap by proactive
>> +               writeback. This is a subset of zswpwb.
>> +
> 
> nit: I think this is specifically the zswap_writeback_only mode right?
> 
> Technically, normal proactive reclaim (memory.reclaim) can also hit zswap :)
> 
> Maybe some clarification here?

Thanks for the review. I will clarify this further in the next version.

Thanks,
Hao
