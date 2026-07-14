Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19EA3DA7E6
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010574; cv=none; b=LnRPPIcqYU0Jo26+DwCceSzZnhN9oEQ3NIT88NgoQGAvY8Qph9WQEyLLm6gAvYzF0luiijvqqQa9hdJxjbFLiWweN/zeDV2OAjvEu25CMpip4cLtiPyGsefGBISwElfhrvv/xnT9pIPMb7n1JGbNj2ANOFVogLjWadpQ+YSmZUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010574; c=relaxed/simple;
	bh=W6zvz+m+18iPbQMMOQV2DLS4LOC/QcuNiJ+cFuraoTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQIJ2Wd8atOCgLoJ7FTt6nDGY1BDHMEAYb0blkSJrmCLmx/AbcDrDryaxxd9Q1OizBH3KkziTrZY8Lw5xXCiggoSjGUb3wM8qg1mGat/ud5xGlFDDFQAy9mdgLRdTbhnxntbdQzMAI3lQ243ktjyfQwoQMTRZyz6ktTMUrD4yWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky2SDqSD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky2SDqSD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccf2360620so4669755ad.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 23:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010572; x=1784615372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w5q6gfBBfOjUS6i3fiduNPrbsndG/x1Ykm2ieMz81Cg=;
        b=Ky2SDqSDgoNpo6ZGEyNcdI2pXX2mtVL6nHFf3MFDzw8zuT6ugt+O5OX2wf14hYplQ2
         ARg7UJuuT5d06wKgiDnl8GRFUfThV+mwQVjDE3y/3quBBd2Sl/rL/gwOLO8W6og5oosO
         eZIy9crhbcTivCptBnA3mpgBMa48jNjafTTK7/kTAQLGdBOBNbB7ZXW+VHdmlgd51UHJ
         vW36x7HnG2NrKgjpbM/4N3SM33YTjnQ2J74Wrx06lGUwhwQF/+awuMAcKstv7u4O7m1j
         gXPc6IX8j1GdwujFykr5iEPdNQX7ncYTIWBgo+Z6D3zF/ZI0mTyhkNjeKdrvShanHAuC
         4E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010572; x=1784615372;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5q6gfBBfOjUS6i3fiduNPrbsndG/x1Ykm2ieMz81Cg=;
        b=OlbUJF3Uw1WgDGIOgxregp1KFtIoc/G3M7hnpQa33CvgRVt8cJWkqPw9lHZfH0lWL6
         oxI2AD7z7SPZf5C8EDOuM4qG5hMt7LFDO0mvH/+VRKuZiBEk2PMkmk4FkNtaCpqk9Oxm
         N/72wGZe8ZKDtUk1MSEdF92HkYLRvrpaKDRpeaTCyf0zW59To6+BeigPk2SZJ7dVk4jm
         vk5TM6Qq7/1Fan2/YPk4LTkAmSyG8CKSDWlxPPYOGD/ysUOyO4C8fYAjSOMvI46glOnT
         EvmejIqMBz4VP6YLg0Z1OChg6K4JnTVrsEBmFDm2VNA0dMFh6VDAypU8+H6E5qPr0t3r
         Qviw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7ZheJK0IDGB5DUhfo9bKRczjN3jyIYIZXgtBdIw+xfiI0x1VIkr53bcC64BsCZtLOLvo3ONp1ve4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWtj6fVa8un/o7i8jfhFqrvuplkHX/dsV+IWB2qd7mbsBpmFd
	9zLZo6PawzVwNxT1x2oBmfykWvHd2LxKZDJYOi+xtE9/a8pIp0zgPn59
X-Gm-Gg: AfdE7cnV2XHh5oC6papd2m05krXT6NyzK1Jzi3neLLA7M2BcnaRBs8xZ5y6xhkcZNMI
	ZIMFv3248vX6/C1tpjscI9Ac2xHwoMm1gj7x7FXnCxGFQIxaPNAxOyqE+Mai2u1hRQaMdGPlb54
	EvkYhSKzyTAGmGACmBSU1ykRoPm2cR9B+kQokwZnUwzQ27Po7q7FUZJ4jSPPrktWeP9+EyCh/0/
	SamSLfZn8/DQ7H/WwotOHaMumtSdsG4D6xVzHsGfIcB5NaDL+ZIcMleXG6XyLeg+SQChu1HFVQW
	R20T8JimCYFlcjS8AgjTAV/slUVX3zPmcBMAwM/8iTz7C9YBc2SGEO5yfvXYzWneySlm0gj0n/S
	v521qAf10W+bjzE1aVfalakRMdjHtBIuJv/cVeb4QXIJS5FnySTxkUT49H5NIA5XnkQc/1JWqOa
	3gP+ex8H017DQx4Vka8Hsvj6did6snDa/Brg==
X-Received: by 2002:a17:902:f683:b0:2c9:97a7:f543 with SMTP id d9443c01a7336-2ce9f1789d4mr105975955ad.41.1784010571982;
        Mon, 13 Jul 2026 23:29:31 -0700 (PDT)
Received: from [10.125.192.114] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccdf808379sm98300195ad.48.2026.07.13.23.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:29:31 -0700 (PDT)
Message-ID: <4b85fb73-73fb-d08d-e218-0eb34c6f90e9@gmail.com>
Date: Tue, 14 Jul 2026 14:29:06 +0800
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
 <bf14cfe5-e98e-c20a-231e-37b3a2489040@gmail.com>
 <CAO9r8zNzRWxCvUok7FJTZZOp6pS9D-Qdrsbi10rLBn4QRhw81A@mail.gmail.com>
 <30c8df43-9464-8fa0-3614-0ca06b97862e@gmail.com>
 <CAO9r8zNu=JPZG4be9beJUdBEGRgX6YaD_cpZw2P8WieDY=c06g@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zNu=JPZG4be9beJUdBEGRgX6YaD_cpZw2P8WieDY=c06g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/13 23:53, Yosry Ahmed wrote:
> On Fri, Jul 10, 2026 at 3:04 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/7/10 04:44, Yosry Ahmed wrote:
>>> On Wed, Jul 8, 2026 at 7:15 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2026/7/7 03:33, Yosry Ahmed wrote:
>>>>> On Thu, Jul 2, 2026 at 5:32 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2026/7/1 19:45, Hao Jia wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2026/7/1 00:10, Yosry Ahmed wrote:
>>>>>>>>>> Before going through more versions we need to figure out if this will
>>>>>>>>>> pivot to be a proactive demotion interfcae for swap tiering.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Yes. Should I drop patches 4-6 in the next version and wait for swap
>>>>>>>>> tiering to be finalized?
>>>>>>>>> We can try to get the non-memcg parts (patches 1-3) merged upstream
>>>>>>>>> first. This would also give them plenty of time to bake and catch any
>>>>>>>>> potential regressions. Thoughts?
>>>>>>>>
>>>>>>>> Patches 1-2 can be sent and merged separately, yes. For patch 2,
>>>>>>>> please include some numbers for the writeback performance before and
>>>>>>>> after batching.
>>>>>>>
>>>>>>> I'd love to collect some performance data. Do you have any recommended
>>>>>>> benchmarks for this?
>>>>>>>
>>>>>>
>>>>>> Perhaps the following test case could work?
>>>>>>
>>>>>> Test Setup:
>>>>>> - Total memory: 32 GB
>>>>>> - zswap settings: max_pool_percent=1, accept_threshold_percent=50,
>>>>>> shrinker_enabled=N
>>>>>> - cgroup constraint: memory.max=1G
>>>>>> - Workload: Run the following stress-ng command inside the cgroup for
>>>>>> 120s to
>>>>>>       continuously force zswap store failures and trigger shrink_worker():
>>>>>>
>>>>>>       bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
>>>>>>       exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t
>>>>>> 120s -q'
>>>>>>
>>>>>> The following comparison results were collected over multiple runs via
>>>>>> bpftrace
>>>>>> and the 'written_back_pages' sysfs interface:
>>>>>>
>>>>>>                              Baseline         Patched
>>>>>> ---------------------------------------------------
>>>>>> shrink_worker wakeups       5,587             878
>>>>>> shrink_memcg calls      7,823,853       2,347,320
>>>>>> written_back                  257         781,214
>>>>>>
>>>>>> Conclusion:
>>>>>> Under the same workload and duration, the patched kernel shows a
>>>>>> significant reduction
>>>>>> in both shrink_worker wakeups and shrink_memcg calls, while successfully
>>>>>> executing a
>>>>>> much higher volume of page writebacks.
>>>>>
>>>>> Hmm this is actually a bit concerning. Yes, we are invoking the
>>>>> shrinker less, but we're writing back *a lot* more memory, orders of
>>>>> magnitude more. We are using a batch size of 64, and making ~1/3 of
>>>>> the calls to shrink_memcg(), so the number of written back pages
>>>>> should be ~20x more, not 3000x more? I think I am missing something.
>>>>>
>>>>> Also, ideally, the batching wouldn't result in significantly more
>>>>> writeback, but a similar amount of writeback over less shrinker
>>>>> invocations. If we are writing back significantly more pages then the
>>>>> batching logic is probably too aggressive?
>>>>
>>>> Apologies, I think the test I constructed has a bit of a problem. This
>>>> test has very, very heavy memory pressure and is already a very abnormal
>>>> case.
>>>>
>>>> The zswap entry returns the first time because of "second chance" after
>>>> setting referenced to false. For the baseline, it scans 1 page per node
>>>> each time for 16 loops. During the test, shrink_worker() basically exits
>>>> at about 16 pages each time.
>>>>
>>>> Since stress-ng periodically and randomly writes to this 4G memory, it
>>>> keeps triggering zswapin and then waiting to zswapout new zswap entries
>>>> after falling below the pool threshold. When the speed of zswapin/out is
>>>> far greater than the scanning speed of shrink_worker(), a large number
>>>> of zswap entries cannot wait until the second scan for writeback. New
>>>> entries are stored on the zswap LRU list again, and the referenced of
>>>> the new zswap entries is set to true again. During the test, it was
>>>> found that 99.21% of the return values of shrink_memcg_cb() in the
>>>> baseline kernel were LRU_ROTATE.
>>>
>>> Hmm if I understand correctly, you are saying that the current
>>> upstream code is actually failing to writeback when it should in the
>>> previous test case with very high memory pressure, but it is with
>>> batching? If that's the case, I think it's actually really good data
>>> to include. However, we should make sure that's what's actually
>>> happening. If the current shrinker is not keeping up and failing to
>>> writeback, we should observe:
>>> 1. shrink_worker() hitting MAX_RECLAIM_RETRIES continuously and bailing.
>>> 2. zswap usage consistently remains at/near the limit, and not going
>>> down to the acceptance threshold.
>>> 3. zswap_store() failing to accept pages and the pages going directly
>>> to disk, causing an LRU inversion (hotter pages on disk, colder pages
>>> in zswap).
>>>
>>> Can you confirm that this is what's observed with the high pressure test case?
>>>
>>
>> Apologies, my previous explanation might not have been very clear.
>>
>> For an entry to be written back, the shrinker must scan the *same* entry
>> twice: the first scan sets referenced to false and returns ROTATE, and
>> only during the second scan can it be written back.
>>
>> If a swap entry is zswapin'd between the first and second scan (meaning
>> the entry is no longer on the zswap LRU), then this swap entry will not
>> be written back by the shrinker. Therefore, the second scan must occur
>> before this entry is zswapin'd for it to be possible to be written back.
>> So, if the baseline scanning speed is far slower than the lifecycle
>> speed of the swap entries, it results in only scanning once. In the
>> baseline kernel, 99.21% of the return values of shrink_memcg_cb() are
>> LRU_ROTATE, while the patched kernel's shrink_worker() scans at least 64
>> * 16 entries in a single pass, resulting in only 58.7% of the return
>> values of shrink_memcg_cb() being LRU_ROTATE.
> 
> Right, my question is, is the high rate of LRU_ROTATE leading to
> failure to writeback in a way that causes zswap store failures (and
> pages skipping zswap and going directly to swap)?

Yes, I observed that the number of zswap_store() failures (returning 
false) is very high.

Thanks，
Hao

