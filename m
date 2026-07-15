Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E7441607
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114903; cv=none; b=Nv16mkOkCkOR7QUOpeihVnZo5zCMnKWdkehjJul8ph2LPFlnjt8kbDEs2GbRv4dw7yzqyOECKiRBC8yDKnOxHj6lf82DPhO9hXdnBSm9DC9fB904MwG/oQ9sIsildZVWVl3g5yTypL2MGfETuVyiJ98C5GoGTKJpo3VZCy84oGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114903; c=relaxed/simple;
	bh=tqvNLaV6+k1iAJaLbwpkKc68DEDWnWGXhZHCaF65ZjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8PhbdIw+rPWAjP8a7Xv5WuS6fkwMtTVDYnZqGqxfHzhRFx7QsDrY/hEfL6XmneXALOLjvfIpUeH74PXhVz56P+GdjoSSoJBUvMdCYAs9uwWb2kMlejKpKYOeHH0ryzU1FNDnfvVYtzYkH1cc8yx5LBR/zqv+26O1QyY3W4Si28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4K4ImUp; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4K4ImUp"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca957432c7fso3667266a12.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 04:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784114901; x=1784719701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BjZpJ/ZGdtH4VffFiXS+PfV8IVOQCwOAwF8cWS5dH18=;
        b=S4K4ImUpd901IlbKNjo72LJkDPR5GMcVt3LY7po9/HHrg5Dybazpw0W2zTW1cOobII
         P8L5RcGznCG6lmkStVTCfCQnJGkV+sAFAzomS0sYZlBp43vGY3mZrimj1+hccFFUOq+6
         S8jj8qSHWkyFFmSZYOm7nBKOceQ73X7bo4SjBNFgYQPfZcGLgKSfX/bEwupA8gumxXVe
         9sXk6CauNbmvsIFnm9WHMskdBbe9Z+m5/XyHqZbLxj1y8fsOcdis0m8UlOVmmHdfYLsM
         j1lMug+7/iKBC8dYol3/lVSDtILYpGA4fUVHeIBWmDVlkvXnNerzh12cjIztykF8+sYJ
         UGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784114901; x=1784719701;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjZpJ/ZGdtH4VffFiXS+PfV8IVOQCwOAwF8cWS5dH18=;
        b=k8W+CK2LTmBUQul0LWGwHTYiTJ+wja4UjTJs09Di4O1RKhiXOn811DVCCstFNPg1Wc
         5DNg5WtRmIxumTzC3dsncICnMzPm0hQ3s9sDqnU1/+kklXiAPqqEISBphdgZJBIogMYU
         o4zbfLNAjx1OpcOwnFB7WGDBuPCoXwuyCZ7o/7RNFzdwgB+/RtluWYYQ1hzTT1nSDgUU
         q9SxOoUg5s06CMDbm2R74EEjlYdj5ukA8bVK1EM5elmId8ZXbOmRwzcOyDj1ymO3WKyk
         uAD6G87M4HG8qXuhufPesa60FvQ7fgvPa0neRg81rb8nmy/jdjPh9F91WR4LGDeZJaVu
         libA==
X-Forwarded-Encrypted: i=1; AHgh+RpWYEssYNqobeLeHTulXHKE8x8uVr9xuQl/O3L42zUP9hX+P7JRFGTPjHctf5S+zuFR5mCooDBu1mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXsHNTjzexsThCx8bS7Nemj37ZrY+A3aR4I7ffZevUZ7UT0kwU
	8cfCmUJF/NTRLjBGQuFq3Q8jJrqL3F1zx8a55qgkixKL5jmWIZecWXGC
X-Gm-Gg: AfdE7clUw/BfLcfIVO1276xmRPAhgKDjLBvsXNQ5BqP8Skdhh6fpsbe9Bmndgu8ExWY
	f1OO9ezYp8x39SelGaPqn0zEquSNpXnCpAGLv6G5VLf6l2PRT+0HrgOhmo0uLq4eHxTGormggY7
	TSYC/c8mglsVAg2gJM7Y/jsNw9Hs7zus/MGBaG3hIAeRVEFxtEC7n2mRaJx0wuvcrWDE0BfwbNA
	q3iqzvJWbOf1n6HKXm1Y9/Yha8mIzO9+i37Zi904iBXToJ2szx4CXO2eJn8u5LnF/b/BzBHhY5R
	8ebj57f1I0p9W+lBZr56CBFY6Eun1Q35lWRUKthcM91WpMarI7uPyCmOuDSeZBeWxg2LoOli29P
	Dy0pHvUyckmnEcEyNpxfeRlr4Q9k2JKY6jfrKA4/wMAaWJhEFPsMJZU3HaDi0bN21pLt1RLCt/d
	gFg0OpX+p53kTJYZoHdgvceXP5sXr3CGJmwA==
X-Received: by 2002:a05:6a21:730e:b0:3a2:d838:bfc6 with SMTP id adf61e73a8af0-3c3573f6e82mr7065531637.29.1784114901393;
        Wed, 15 Jul 2026 04:28:21 -0700 (PDT)
Received: from [10.125.192.114] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258fcfe20sm59594a12.15.2026.07.15.04.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 04:28:20 -0700 (PDT)
Message-ID: <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com>
Date: Wed, 15 Jul 2026 19:28:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-3-jiahao.kernel@gmail.com>
 <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/15 00:52, Yosry Ahmed wrote:
> On Tue, Jul 14, 2026 at 1:15 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> Currently, shrink_memcg() writes back at most one entry per-node during
>> its traversal. This makes shrink_worker() inefficient, as it must
>> repeatedly re-enter shrink_memcg() to make any substantial progress.
> 
> Please also mention the case about writeback being slow to keep up
> with refaults in some cases, leading to zswap store failures and pages
> skipping zswap and going directly to disk, which is an LRU inversion.
> 

Will be done in the next version.


>>
>> To address this, extend shrink_memcg() and rewrite its LRU iteration logic
>> to support batch writeback. Introduce the nr_to_scan parameter to bound how
>> many pages are scanned per call. This enables batch writeback in the
>> shrink_worker() path, while maintaining a low scan budget in the
>> zswap_store() path.
>>
>> Additionally, to prepare for future proactive writeback, update the return
>> value semantics of shrink_memcg(): a positive value now represents the
>> actual number of compressed bytes written back, 0 indicates that candidates
>> existed but no writeback succeeded, and a negative value represents an
>> error code.
> 
> This part should be dropped for now, and added with the proactive
> writeback, as it's currently unused AFAICT. Removing
> zswap_shrink_walk_arg will simplify the patch and make it focused on
> the batching part.

Will be done in the next version.

> 
>>
>> Test Setup:
>> Total memory: 32 GB.
>> zswap settings: max_pool_percent=1, accept_threshold_percent=50,
>> shrinker_enabled=N.
>> Allocate 512MB of anonymous pages and fill them with random data (to avoid
>> compression), then use cgroup memory.reclaim to force a large amount of
>> anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymous
>> page where the first 4 bytes are random numbers and the rest are zeros, and
>> then trigger a reclamation of this 4K anonymous page through cgroup
>> memory.reclaim. When the pool threshold is reached, shrink_memcg() will
>> be triggered.
>>
>> The test data after running for 120s is as follows:
>>                             Baseline         Patched
>> shrink_worker wakeups          5363             85
>> shrink_memcg calls       11,345,012        188,264
>> written_back                  40214          40275
>>
>> Conclusion:
>> Under the same workload and run duration, the patched kernel shows a
>> significant reduction in both shrink_worker wakeups and shrink_memcg calls.
> 
> Please also include data from the case where zswap store failures are
> observed and pages go to disk, and compare before and after this
> patch. I think that part is also really important.

I retested and added some collected information. Perhaps 
`pool_limit_hit` and `pswpout` can explain that batch shrinking of zswap 
can reduce the number of pages that fail to be stored due to the pool 
limit, allowing zswap to skip zswap and go directly to disk.

                               Baseline      Patched
shrink_worker wakeups         5,363            85
shrink_memcg calls       11,373,201      180,928
written_back pages            40,212       40,236
zswap_store calls            161,190      168,741
   store succeeded (ret=1)    102,743      127,644
   store rejected (ret=0)      58,447       41,097
   store reject rate            ~36%         ~24%
pool_limit_hit delta          55,826       14,062
pswpout                       98,659       81,333
pswpin                            2            1


Thanks,
Hao
