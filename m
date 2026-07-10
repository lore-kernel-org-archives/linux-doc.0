Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60B3FB7D5
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677884; cv=none; b=RCML43CbgbfGZxRbK0PIqIWT/iZZKOgCEvtktzuLamU1rOXsmHjW8hUA5SG1+Xc/8zHjNKCA3GnU1p5B434EghyEOWdXPI+dESCLe0V0ecgaoChoo9fiPS8FYYE0V7zs5Gw53932eFNReAs5eqwh76rWmNEb+IXVQe4O+EZ047M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677884; c=relaxed/simple;
	bh=5WDDaaDAVQXdrw4/FTB+NaWlzMTU0oH389jY57JulR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9V318eprTlW2nAzQC4Bip53rIS9auKtsnDJ9nLTbaeG6Ji8Gp0R0QKDg5cnucOMwzU/zRcV7karlrsoGFOOq98xB8g1VqAnG2Tcj9/Fw4dFOQ6m+f9OlB6t7jNQh/5Ym1USvJrRfAl+NdX8y1oH1u6u7b3r6/4RPQAEixH88uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pw86qs3u; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pw86qs3u"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so547719a12.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783677882; x=1784282682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=myL3E4LURnOhpDjDCaKjpNj79ZKyqlfQLnc/0/n7x1Q=;
        b=pw86qs3uFVYGOHHpERto6NL7H+nv9j79BTQ42/QCCZWNp94sE+zo5F5M3qg9AofQFE
         6R61Q91zqY5iLl7yiLH3EQLOYE3bxVFRPwFd8ToaJSdetLLOOOYolbjDtHzWGgNZf7B6
         YJBlYg60HLxue6oqcTj62G5ToPUpqimBVlQ4ZZ6oDuxiRFpAQSwimqd4yDSOBe70XmxL
         p8HhyW/tJ8zdedJTUXfFqHodK9aiYsz9+O0vGAhwLRpbUW/fX0L7h86jwtVzJbtAbZmU
         XwcZuZEOq522brEEKm+JXrhuEgaUY3bVmkOU6G1Ku6E0EuIwlBAeW0+pTFDFyTUodWam
         F+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677882; x=1784282682;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myL3E4LURnOhpDjDCaKjpNj79ZKyqlfQLnc/0/n7x1Q=;
        b=V4xtiA8+4QX4srYmNy9VQ7TN5K7RzkPcNL4QfkzwDAHRI59X7UlPoiIHeceBej9Lk+
         1k6qSk1G17YCJcA85e7WCUR/4TNzdm/dxlt0jHlorxuIxG5TG1RaA4M65Z4N2PIjq/xJ
         lVBjgRLZswmGWMrWADDK8bQr8ICYvRBX7rLzEjqiBRaeQSgomK8sdaAYDrVJvtC/5Udt
         G60zvbiz0KUEjICtnscDtRp7+VNmBscRC0baS2ffEl09Rn6Ww8DD83fq0ftBhaHPkpdA
         D79ZDNvoKymj8uvs/1Sq4lpycjfEk+bUYXhNzjmPfZmne7eBMwiPvjRgkMqoLoYooznN
         lKFg==
X-Forwarded-Encrypted: i=1; AHgh+RrhgASNGfve8ng1HwrMS1kz0IC5q6+4v/XlE7VD6sZC3ZCoYcR9KbNNaR6YBMbuMT+qXiE0mAMnOkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGj+Q9V9OLDiHyo+2p764MpEvC5VF3rQKYm2cgSj0DARes7O8y
	MFK27HVbSy7XgAacuRRK/ptJpDtxlz07G7GCci/SQgLRsEEI9G346pYO
X-Gm-Gg: AfdE7cmyWMa7bhcMVHf+jgARa1CQnwxlQVXJUywqq/Xktfzi7qkQ1f+nJCHmRmKK2ds
	jc6ume6YgdFglayjg2tzyL6pgZQmI9hDPBWwCsaOWURkC0VIAsJQtMNBX88T2ZNcVYlNHhjrG7Y
	Kj1HUk2A3iQs1wBJ5VrOyVexITlws4xKBAJMcJU7VFkTNJti/pHmYzWPxNZycJTNI+Q+vDfXaHq
	EOl2lN9is4yysXP2pOhryGkQ0zs+8NaN5bdoPmgtAkwfdONUw8rfmqHlzvS6Mm1hryOBMQONEbE
	JQOk2fwcuoYlEDQnQ34DcKKLLeFo6swWWCFKg+QLxU/GrZglccC1EEftDsI/igwda5AxGxbZ9O5
	3r93krlrC7BU7agVy7a8y9zkVZ3odQtyBxXLNEqRRC/wNmVX1XOVDWEHfwsLuSGDjzd6KgGvr3X
	36tueWGZ2rJJ7MVsPjX4APEo66SMNjvA4vRA==
X-Received: by 2002:a05:6a20:12d0:b0:3b4:6f7e:d0f4 with SMTP id adf61e73a8af0-3c0bce18a95mr13340629637.15.1783677881818;
        Fri, 10 Jul 2026 03:04:41 -0700 (PDT)
Received: from [10.125.192.148] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca75ef0c30dsm3257653a12.17.2026.07.10.03.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:04:41 -0700 (PDT)
Message-ID: <30c8df43-9464-8fa0-3614-0ca06b97862e@gmail.com>
Date: Fri, 10 Jul 2026 18:04:23 +0800
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
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zNzRWxCvUok7FJTZZOp6pS9D-Qdrsbi10rLBn4QRhw81A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/10 04:44, Yosry Ahmed wrote:
> On Wed, Jul 8, 2026 at 7:15 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/7/7 03:33, Yosry Ahmed wrote:
>>> On Thu, Jul 2, 2026 at 5:32 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2026/7/1 19:45, Hao Jia wrote:
>>>>>
>>>>>
>>>>> On 2026/7/1 00:10, Yosry Ahmed wrote:
>>>>>>>> Before going through more versions we need to figure out if this will
>>>>>>>> pivot to be a proactive demotion interfcae for swap tiering.
>>>>>>>>
>>>>>>>
>>>>>>> Yes. Should I drop patches 4-6 in the next version and wait for swap
>>>>>>> tiering to be finalized?
>>>>>>> We can try to get the non-memcg parts (patches 1-3) merged upstream
>>>>>>> first. This would also give them plenty of time to bake and catch any
>>>>>>> potential regressions. Thoughts?
>>>>>>
>>>>>> Patches 1-2 can be sent and merged separately, yes. For patch 2,
>>>>>> please include some numbers for the writeback performance before and
>>>>>> after batching.
>>>>>
>>>>> I'd love to collect some performance data. Do you have any recommended
>>>>> benchmarks for this?
>>>>>
>>>>
>>>> Perhaps the following test case could work?
>>>>
>>>> Test Setup:
>>>> - Total memory: 32 GB
>>>> - zswap settings: max_pool_percent=1, accept_threshold_percent=50,
>>>> shrinker_enabled=N
>>>> - cgroup constraint: memory.max=1G
>>>> - Workload: Run the following stress-ng command inside the cgroup for
>>>> 120s to
>>>>      continuously force zswap store failures and trigger shrink_worker():
>>>>
>>>>      bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
>>>>      exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t
>>>> 120s -q'
>>>>
>>>> The following comparison results were collected over multiple runs via
>>>> bpftrace
>>>> and the 'written_back_pages' sysfs interface:
>>>>
>>>>                             Baseline         Patched
>>>> ---------------------------------------------------
>>>> shrink_worker wakeups       5,587             878
>>>> shrink_memcg calls      7,823,853       2,347,320
>>>> written_back                  257         781,214
>>>>
>>>> Conclusion:
>>>> Under the same workload and duration, the patched kernel shows a
>>>> significant reduction
>>>> in both shrink_worker wakeups and shrink_memcg calls, while successfully
>>>> executing a
>>>> much higher volume of page writebacks.
>>>
>>> Hmm this is actually a bit concerning. Yes, we are invoking the
>>> shrinker less, but we're writing back *a lot* more memory, orders of
>>> magnitude more. We are using a batch size of 64, and making ~1/3 of
>>> the calls to shrink_memcg(), so the number of written back pages
>>> should be ~20x more, not 3000x more? I think I am missing something.
>>>
>>> Also, ideally, the batching wouldn't result in significantly more
>>> writeback, but a similar amount of writeback over less shrinker
>>> invocations. If we are writing back significantly more pages then the
>>> batching logic is probably too aggressive?
>>
>> Apologies, I think the test I constructed has a bit of a problem. This
>> test has very, very heavy memory pressure and is already a very abnormal
>> case.
>>
>> The zswap entry returns the first time because of "second chance" after
>> setting referenced to false. For the baseline, it scans 1 page per node
>> each time for 16 loops. During the test, shrink_worker() basically exits
>> at about 16 pages each time.
>>
>> Since stress-ng periodically and randomly writes to this 4G memory, it
>> keeps triggering zswapin and then waiting to zswapout new zswap entries
>> after falling below the pool threshold. When the speed of zswapin/out is
>> far greater than the scanning speed of shrink_worker(), a large number
>> of zswap entries cannot wait until the second scan for writeback. New
>> entries are stored on the zswap LRU list again, and the referenced of
>> the new zswap entries is set to true again. During the test, it was
>> found that 99.21% of the return values of shrink_memcg_cb() in the
>> baseline kernel were LRU_ROTATE.
> 
> Hmm if I understand correctly, you are saying that the current
> upstream code is actually failing to writeback when it should in the
> previous test case with very high memory pressure, but it is with
> batching? If that's the case, I think it's actually really good data
> to include. However, we should make sure that's what's actually
> happening. If the current shrinker is not keeping up and failing to
> writeback, we should observe:
> 1. shrink_worker() hitting MAX_RECLAIM_RETRIES continuously and bailing.
> 2. zswap usage consistently remains at/near the limit, and not going
> down to the acceptance threshold.
> 3. zswap_store() failing to accept pages and the pages going directly
> to disk, causing an LRU inversion (hotter pages on disk, colder pages
> in zswap).
> 
> Can you confirm that this is what's observed with the high pressure test case?
> 

Apologies, my previous explanation might not have been very clear.

For an entry to be written back, the shrinker must scan the *same* entry 
twice: the first scan sets referenced to false and returns ROTATE, and 
only during the second scan can it be written back.

If a swap entry is zswapin'd between the first and second scan (meaning 
the entry is no longer on the zswap LRU), then this swap entry will not 
be written back by the shrinker. Therefore, the second scan must occur 
before this entry is zswapin'd for it to be possible to be written back.
So, if the baseline scanning speed is far slower than the lifecycle 
speed of the swap entries, it results in only scanning once. In the 
baseline kernel, 99.21% of the return values of shrink_memcg_cb() are 
LRU_ROTATE, while the patched kernel's shrink_worker() scans at least 64 
* 16 entries in a single pass, resulting in only 58.7% of the return 
values of shrink_memcg_cb() being LRU_ROTATE.

              Baseline         Patched
---------------------------------------------------
zswapin       929,096          281,196   <----
zswapout      982,731        1,058,746

After modifying the kernel to remove the "second chance" algorithm, the 
test data of the baseline kernel roughly conforms to our expectations.

Therefore, the constructed test has a bit of a problem. The second test 
case in my previous email can ensure that the entries on the zswap LRU 
are relatively stable.



It is worth noting that the capacity of the zswap pool will not remain 
constant all the time. Since stress-ng periodically writes to and reads 
from this 4G memory, accessing the pages in the zswap pool will trigger 
zswapin, causing the zswap pool size to decrease. Other pages attempting 
to zswapout into zswap via zswap_store() will fail (until the zswap pool 
size becomes 160M (accept_threshold_percent=50)), but the zswap_store() 
path will wake up shrink_worker() to try to perform scanning and 
writeback. Then stress-ng will continue to read and write memory, 
continuously triggering zswapin to further reduce the zswap pool size 
until the threshold, at which point shrink_memcg() will also stop. Then, 
new zswap entries (with referenced as true) are added to the zswap LRU 
again via zswap_store(), until the zswap pool size reaches 320MB (32 GB 
(Total memory) * 1%). This process repeats continuously during the test.

Thanks,
Hao

