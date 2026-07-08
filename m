Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4932C11CB
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520126; cv=none; b=MfNqiR72IBgtqqOn5+nTHdxIPvWa/JoBBOxLJ3ZzPOEcTahBhbC+WIycOk/E+SzJJr3dtxIKP+a/CZGi/9NrgroRe1aMlzmDA9Lu9HydJmhmORhfhloEXtYw3QzOIem6Gx7aYmMC7hF9tht3hMIFTVTXbtoCVHNLYrNK9f60vgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520126; c=relaxed/simple;
	bh=LhWIkOjBRhSchfsWBTlfKi+6aOVgB2iAPIJukRdfpfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0QGMfRcL8MyUhLjm80Gg2bY1SsXckVdiYgOQAb++IjARCnFtXYEX1PdSKJBfPGk2MR6md8hB2emkuokcinil5Ta5ECvNx8QDTJM+lfWZtTktml+mA4ygMDNjg7CYKHDejv4IX1qZDb0LQ03kZJQAgQIaP8M9MOQ8L3vzE0F4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPfJJLRZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPfJJLRZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so8268765ad.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520124; x=1784124924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=idL2Xz0mU2qCcJAvF4YtSgzLnoGRC91n4WDotTzDTTc=;
        b=iPfJJLRZqejPJNjmhna2pPeAxMlBTGdU7uu2gZlS7WoIWbxBrmSk5mMfDxDLi9GAeM
         nh+S4C+c1ZXrIF8yFb1zMjzworWXTnL1jJQks2E010I40Cpzqyn0nD6aLbW3rmoBL/jS
         E0DSfekyUKcXDkH3bTD9/dnYoH4ObX7F3CAeKK5B8m6pxHzh5JxevcZqksCZWDLTagFO
         vmuUqrWS68BOcFnww0GNGzqpJrlogRxlUFi0SAhg05PwzOxa7CptBBJby4lxVDYvPRVU
         bGqAaPZGy6fTr805Apj5YjFx92wd2oIlNRxCI5AlkI3SMzGBTjPb85KuuXIsDWQLKM7q
         S/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520124; x=1784124924;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idL2Xz0mU2qCcJAvF4YtSgzLnoGRC91n4WDotTzDTTc=;
        b=oG2yoXN2X/xEuZ6zzAlo1oHRzwvnJvlJyOjmtb3Ff+Ipy0mhoRfVt0tYsfNo5uujSY
         tD8nx0U6z33BW/smndsC26o+IgykdauvI/izK5oDVpSQMJBkoyISTlDJ9upxYhFWioz0
         lZUxpAMalKwVPm82ZZ/roDLk+0ZjkwNyvADViK/i9bcaXwAFMVdNff/ZgFcRhCmzB7d/
         Szy9YInbHC5T7SoioUF3qLTbUH5CEbENnipv/uXJkHvC++msSg8iqWSQFoCkuT5jZEpk
         ObutJN60YZSYmKyJKp1FxOiRFAiAbNicfbKAJ937cqquTNQS4n+E9dx0o3piOVFwFFKm
         hwVw==
X-Forwarded-Encrypted: i=1; AHgh+RqqNYUZLxga5WgVqWBk1B+KACNWcRoy+XPrGujuShjVmFksR6MnVtp+CvziJk2w+oh2ikiynqN+44E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqD18m2sJ3HFpxYNduxUmXfG+pLf4UrBPr1SLkBkK8irwKPyqz
	0pMI+pk5eT/zd2JJV0zUEOmHITCFuNCmmhzVYI7w1iyD0F6jZ5vYTRuz
X-Gm-Gg: AfdE7clsZVNerRbJcyDPVjWJug5EV2RHbfQj7AdXrGPXOI1GIRre56IJd97s/Ukirmv
	neDLjRtF8HA238kFWesWz74jMuLlzXLS6BWiiSsXUr7T8I2/i1tR4R9XCN8YykWIDqagHZgtOaq
	8o5bc0EMcyWri3e4LBVfVK8MtZ4zO4meEWQfW/RegqeT/Ko49sHeKYS17/eL8X1s5UBJLmY+5hj
	Ikc6EPZqGfM61zKhVClavD5GXL+14ie9kN469bbaqBylK+YHU9FAy6xCmiUO5OtFimqr7QDttUi
	Q5kBqvCb2UFQaxdAYneSJ3aB/EkqbLaTk/xJEhk5jXOJwSYfhT+2pobgWCILryJ8rkzlO4h7YlD
	BHjhqMn29e02+3EyCBxBy6xfUlj3Ex71QP5gArSwhSqHlw0axfUJeDiLLf9ksZrT9u18nz6yA/G
	pmYsW0lJYvPs1HFouSO8s9T2a0qWWVH1Wl4Xoq3xndgOVh
X-Received: by 2002:a17:903:3c67:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2ccea37d246mr27168615ad.5.1783520124216;
        Wed, 08 Jul 2026 07:15:24 -0700 (PDT)
Received: from [10.125.192.148] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm29047715ad.37.2026.07.08.07.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:15:23 -0700 (PDT)
Message-ID: <bf14cfe5-e98e-c20a-231e-37b3a2489040@gmail.com>
Date: Wed, 8 Jul 2026 22:15:08 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com>
 <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com>
 <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
 <4ec2bd64-af40-8ebf-b8a8-2dd7421a1100@gmail.com>
 <5ce4035b-7f56-d1d2-2d2a-668446d870e8@gmail.com>
 <CAO9r8zOLe5eJfNmoszCX3rtD=6YEa_7xrvDV1acVDOtZg4vWYA@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zOLe5eJfNmoszCX3rtD=6YEa_7xrvDV1acVDOtZg4vWYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/7 03:33, Yosry Ahmed wrote:
> On Thu, Jul 2, 2026 at 5:32 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/7/1 19:45, Hao Jia wrote:
>>>
>>>
>>> On 2026/7/1 00:10, Yosry Ahmed wrote:
>>>>>> Before going through more versions we need to figure out if this will
>>>>>> pivot to be a proactive demotion interfcae for swap tiering.
>>>>>>
>>>>>
>>>>> Yes. Should I drop patches 4-6 in the next version and wait for swap
>>>>> tiering to be finalized?
>>>>> We can try to get the non-memcg parts (patches 1-3) merged upstream
>>>>> first. This would also give them plenty of time to bake and catch any
>>>>> potential regressions. Thoughts?
>>>>
>>>> Patches 1-2 can be sent and merged separately, yes. For patch 2,
>>>> please include some numbers for the writeback performance before and
>>>> after batching.
>>>
>>> I'd love to collect some performance data. Do you have any recommended
>>> benchmarks for this?
>>>
>>
>> Perhaps the following test case could work?
>>
>> Test Setup:
>> - Total memory: 32 GB
>> - zswap settings: max_pool_percent=1, accept_threshold_percent=50,
>> shrinker_enabled=N
>> - cgroup constraint: memory.max=1G
>> - Workload: Run the following stress-ng command inside the cgroup for
>> 120s to
>>     continuously force zswap store failures and trigger shrink_worker():
>>
>>     bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
>>     exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t
>> 120s -q'
>>
>> The following comparison results were collected over multiple runs via
>> bpftrace
>> and the 'written_back_pages' sysfs interface:
>>
>>                            Baseline         Patched
>> ---------------------------------------------------
>> shrink_worker wakeups       5,587             878
>> shrink_memcg calls      7,823,853       2,347,320
>> written_back                  257         781,214
>>
>> Conclusion:
>> Under the same workload and duration, the patched kernel shows a
>> significant reduction
>> in both shrink_worker wakeups and shrink_memcg calls, while successfully
>> executing a
>> much higher volume of page writebacks.
> 
> Hmm this is actually a bit concerning. Yes, we are invoking the
> shrinker less, but we're writing back *a lot* more memory, orders of
> magnitude more. We are using a batch size of 64, and making ~1/3 of
> the calls to shrink_memcg(), so the number of written back pages
> should be ~20x more, not 3000x more? I think I am missing something.
> 
> Also, ideally, the batching wouldn't result in significantly more
> writeback, but a similar amount of writeback over less shrinker
> invocations. If we are writing back significantly more pages then the
> batching logic is probably too aggressive?

Apologies, I think the test I constructed has a bit of a problem. This 
test has very, very heavy memory pressure and is already a very abnormal 
case.

The zswap entry returns the first time because of "second chance" after 
setting referenced to false. For the baseline, it scans 1 page per node 
each time for 16 loops. During the test, shrink_worker() basically exits 
at about 16 pages each time.

Since stress-ng periodically and randomly writes to this 4G memory, it 
keeps triggering zswapin and then waiting to zswapout new zswap entries 
after falling below the pool threshold. When the speed of zswapin/out is 
far greater than the scanning speed of shrink_worker(), a large number 
of zswap entries cannot wait until the second scan for writeback. New 
entries are stored on the zswap LRU list again, and the referenced of 
the new zswap entries is set to true again. During the test, it was 
found that 99.21% of the return values of shrink_memcg_cb() in the 
baseline kernel were LRU_ROTATE.

For the patched kernel, shrink_worker() scans at least 64 * 16 entries 
in a single pass, so it can trigger writeback during the second scan.


I have re-tested using a more common, reproducible scenario:

Test Setup:
- Total memory: 32 GB
- zswap settings: max_pool_percent=1, accept_threshold_percent=50, 
shrinker_enabled=N

Test Procedure:
Allocate 512MB anonymous pages and fill the data with random numbers (to 
avoid compression), then use cgroup memory.reclaim to force 512M 
anonymous pages into zswap.
Allocate a 4K anonymous page at an interval of 2ms, and then trigger a 
reclamation of a 4K anonymous page through cgroup memory.reclaim. When 
the pool threshold is reached, shrink_memcg() will be triggered.

The test data after running for 300s is as follows: (it will eventually 
stop writing back because the pool threshold is reached)

                           Baseline         Patched
---------------------------------------------------
shrink_worker wakeups          5126            85
shrink_memcg calls      11,003,734       173,420
written_back                40200          40233


Thanks,
Hao
