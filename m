Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EADE40A921
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237751; cv=none; b=SG0wZZPL3jjSObAjrUhouSmTHleSDb/qT/MJ+DIn2Bq8PngcJ3Ita/sBWhkkM7JZf8jwaYnVW7F1Y1x2zjkGUjqIbOhoajyYv2uKbkmdy3aCXc88JGiXO26WPCxpneOXCV5o+AERl+p0XCpEW6+v3XHcUby6N5RXm4fFfIGrG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237751; c=relaxed/simple;
	bh=Qrtn7jKPsi1Q4kgxyZGJk9Ho+u8uzUGXPnqnuVQ6FQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oe+6uyJkYqtvFeFPxxYmbLoJLIt5eH/TajsU3/ryZu2AfG6W2J5nDtGDP2PQiT5t8+LOJf1N/axJFAReXOOClnHPGeluXCxbjCEeMwlrQFp2heUbHX7ONeHmh7Q2JwFMXc/INSwnphLlq4HHZz62sMxrwRl6PteyZeXYYM1iI9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRZhO0Tu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRZhO0Tu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2932833a91.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785237746; x=1785842546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fnms+9vQk0XRhN8yGhD4S5jTMVSUJpQVAGAxU0TRZCc=;
        b=IRZhO0TuELtojoniNKgrovdBTJcnuQ1aG8T0i6rxmNwAnLty5Yfa10fDoADkpEimJr
         P+e3sj2xK3zwEGHLBtNrpB7Veglh7bWKsmjgSqg1gyNszw6kjDk1+yTm9WejoegY9c/6
         /Y/b2WRfl6h+I8xO7ndyhPGlib66LUCxTDpKuDqIaxlY4KkvcuYPP0bogs1xVpXKO6MT
         V4BFiIC1u7Hsk29ffFSh4H5ejScJUFVLLtnW9uz9E4MK7CFOI0M5E9i6bggZ8KINBGhX
         40Fk8pENvZhkM84XFJ2hd88kcHfTxVSv6RLg0ZjdtjzSWPIsdq04lOaAWUZiQkwn4HPW
         sT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237746; x=1785842546;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnms+9vQk0XRhN8yGhD4S5jTMVSUJpQVAGAxU0TRZCc=;
        b=ke6CxYe8JDvhAQucCqVgovOJ/EbGa5dkNNn3Wlko+5QU7dMlLJYbiI7yCIxnMRpTk2
         6NwZBGy555bsHWYZgjlJtX1mg2TR79Ah1xcfKuJbghFqL4CvfUOvV22daITua4PiJ5aX
         62pPpInx0Cmdra9FFaII9BcFpsVeSulOuUjil0RlaZ309etSOuAHJYlys0Cag7c+POUs
         rdY0aP47wxZfdqQ8z3YfjyfNYe98MN2NDM3Wsvi6PfnxUxQ/sVDf/2fpB+sb42k3vLsl
         gopnixjDmdFSRZ3ExBcr6R7JIxd7ZoaDTqofwhmY7513Ynfc/kS07ItH+QTSyXHHpn0r
         +A8g==
X-Forwarded-Encrypted: i=1; AHgh+RqnpAFSYrUY4kJhiqNfaAwEfQdnGGf4VEljtVmkkPSoFRGZGvGPuAW33QkbzMPLgk5wd4qF1e6srKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAlnpZWx9ICtItdQPg2LxnXPLWqOtPy9XQ/5qz0v+SWJLUzkKR
	Gj23gZW1vBG5lIgXnjKs0LIJRp0G+lImuKwswhGvYjr6eddnEk3YYIkm
X-Gm-Gg: AR+sD11+g364ouonajxDt2R/3jUSC1eMDo5b2vMgeQV1GGysjEhxVmC2L5ofq2KUbb7
	pK+/eRyUzTkcqqPemmpVGs3NBhegSwiI++Juc7XKwr7I5TMsOX2Ehz13LhLqRVbu4an9rEVl/7j
	eEEaheH+ncEFz+KaIy/RsFvLytr4ImlC302BdJNdHUYHExVjruT3RLRfocVnOjUE8ySG4UsF2GZ
	kguXz5Df8n2efu+CxxuiH8egNoRA4iK+BUFc9pOZi52UTNeFfvYrQmUDYSO8kVTJGHWLUJCaGun
	vEyFi22ZxEe2SBI6ab0klQ9pCbwfl4hsRaoBHWttVyOZvRbeJjp/Tfsvq2ES+OhX8uiB1ICmkYn
	7PHUFH5mLYCPPwAZyYTUqfV8vCubFs8dQ6yRfTCr8v7cSt9cCs1Th0M2WdKlj/GjRximgtIExdx
	H5i5KGonkj9IJbuw3QdR7cAfA=
X-Received: by 2002:a17:90b:3a4c:b0:387:e0db:bc24 with SMTP id 98e67ed59e1d1-38f6a59e3f9mr2045090a91.36.1785237745515;
        Tue, 28 Jul 2026 04:22:25 -0700 (PDT)
Received: from [10.125.192.117] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm1122800a91.10.2026.07.28.04.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 04:22:25 -0700 (PDT)
Message-ID: <7bf9384b-2999-f14e-f23c-0df93168c20b@gmail.com>
Date: Tue, 28 Jul 2026 19:22:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
 akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev,
 muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
 <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org>
 <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com>
 <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
 <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
 <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com>
 <amO-hwo8OGV5Goz0@cmpxchg.org>
 <CAO9r8zMgVmgQET+PUGexAgNqCZavA2YoTTXKSbWWoUv=A=ytSQ@mail.gmail.com>
 <f60fe501-7605-64dd-0572-77f7f3060f35@gmail.com>
 <CAO9r8zMBWA7nxM24VXQT00CVEZwFpMFNe73FFdPSZw2y=J-0HA@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zMBWA7nxM24VXQT00CVEZwFpMFNe73FFdPSZw2y=J-0HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/28 00:18, Yosry Ahmed wrote:
> On Sat, Jul 25, 2026 at 7:39 PM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/7/25 06:22, Yosry Ahmed wrote:
>>> On Fri, Jul 24, 2026 at 12:35 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>>>>
>>>> On Fri, Jul 24, 2026 at 11:39:41AM -0700, Yosry Ahmed wrote:
>>>>> On Fri, Jul 24, 2026 at 11:37 AM Nhat Pham <nphamcs@gmail.com> wrote:
>>>>>>
>>>>>> On Fri, Jul 24, 2026 at 10:57 AM Yosry Ahmed <yosry@kernel.org> wrote:
>>>>>>>
>>>>>>> The numbers generally look good, the store rejection rate is
>>>>>>> decreasing and we are naturally doing more writeback which makes
>>>>>>> sense. The store rejection rate actually increases when the batch size
>>>>>>> increases to 64, maybe aggressive writeback is more likely to fail and
>>>>>>> cause a store rejection, so that also makes sense.
>>>>>>>
>>>>>>> The only part I can't immediately reason about is pswpin. How are we
>>>>>>> reading from physical swap more than we ever wrote to it?
>>>>>>
>>>>>> The same page can be swapped out once, and swap in multiple times :)
>>>>>>
>>>>>> Unlike zswap, physical swap in is not necessarily exclusive. You load
>>>>>> the page in memory, but if the swapfile is not full, etc. etc. you
>>>>>> don't invalidate the copy of the data on the swapfile. At reclaim
>>>>>> time, we notice the page is not dirty, so we just skip (z)swapout.
>>>>>
>>>>> Oh right, I forgot about that, thanks.
>>>>>
>>>>> I still don't fully understand why pswpin is significantly increased
>>>>> with batching here. I would hope that with less LRU inversion we end
>>>>> up with less disk swapin. Probably the test access patterns are just
>>>>> too random compared to real workloads?
>>>>
>>>> Maybe more time in zswap for those tail entries left behind with the
>>>> smaller batch?
>>>>
>>>> That's a 32 entry window that could zswpin with the smaller batch but
>>>> pswpin with the larger one.
>>>
>>> Oh I was talking about going from no batching to batch=32. pspwin
>>> increased by 387,400 (~30%). We are writing back 272,880 more pages
>>> but we also have 209,837 less store rejections. So overall ~ 63,043
>>> more pages should end up on disk, which doesn't explain the increase
>>> in pspwin.
>>>
>>
>> In my previous runs, I also collected zswpin. could the following
>> explanation help account for what we are seeing?
>>
>> Assuming stress-ng maintains a roughly similar memory access rate,
>> batching flushes significantly more pages back to disk (meaning pages in
>> the zswap pool are evicted faster, keeping zswap pool residency lower).
>> As a result, when stress-ng accesses swapped memory, it is more likely
>> to fault pages in from disk (pswpin) rather than hit zswap (zswpin).
> 
> We are not just writing back more pages to disk, we are also accepting
> more pages into zswap. The whole point of writeback here is to evict
> colder pages to disk and accept (relatively) hotter pages into zswap,
> as they are more likely to be swapped in again.
> 
>>
>> In fact, zswpin in batch-32 dropped by 143,425 compared to
>> baseline—which aligns with batching having a lower zswpin and a higher
>> pswpin.
>>
>> To be frank, under the Test Case 2 workload, we cannot strictly
>> guarantee that the total volume of page reads and writes remains
>> consistent across all three runs within the same time window.
>>
>>                        baseline-cgroup   batch-all-32-cgroup
>> batch-all-64-cgroup
>> shrink_worker wakeups       7,238             766                 367
>> shrink_memcg calls     12,059,142       1,961,194             983,878
>> written_back               28,277         301,157             327,997
>> zswap_store calls        1,349,572       1,168,190          1,114,549
>>      store succeeded           492,861       521,315           459,246
>>      store rejected            856,712       646,875           655,303
>>      store reject rate           ~63%           ~55%               ~58%
>> pool_limit_hit             510,130          50,096             57,715
>> pswpout                    884,989         948,032            983,300
>> pswpin                   1,251,268       1,638,668          1,878,453
>> zswpout                    492,861         521,314            459,245
>> zswpin                     309,631         166,206            84,977 <-
> 
> One possible explanation is that we are shrinking too aggressively due
> to concurrent shrinkers. That's one difference between hitting the
> global limit and the memcg limit. There's a single global shrinker
> that all store failures will just wake up, while all concurrent stores
> hitting the memcg limit will start shrinking.
> 
> The other explanation is that, as I mentioned earlier, the access
> pattern is just too random and we are consistently refaulting cold
> memory. I am honestly a bit concerned about these results.
> 
> Hao, would you be able to try re-running the test with a single
> stressor? It would help us figure out if concurrent shrinking is a
> problem. It would also be useful to increase the global limit, to
> isolate writeback from hitting the memcg limit. I don't think both
> limits will often be used in conjunction, at least not in a way where
> both limits are hit simultaneously.
> 
> It may also be useful to run an actual workload if you are able to,
> like a kernel build or something, to see if the access patterns change
> how much we end up swapping in from zswap vs. disk.

Apologies—there was a flaw in my previous test setup. I had configured 
zswap.max=320M alongside max_pool_percent=1. Since the global zswap pool 
capacity was roughly 314M (< 320M), the global pool limit was actually 
being hit before the cgroup zswap.max limit. Both limits were likely 
interleaving throughout the run, making the results difficult to analyze.

Re-running with **zswap.max=280M** yields results that align with 
expectations:

Test Case: zmax280 stress-4 pool1%
                             baseline        batch-all32      batch-all64
   shrink_worker wakeups            0                0                0
   shrink_memcg calls         698,990           57,187           29,649
   written_back               655,570          865,131          883,508
   store succeeded          1,054,928        1,124,990        1,190,608
   store rejected             229,722           22,642           11,659
   store reject rate             ~17%              ~1%              ~0%
   reject_reclaim_fail            110           15,454           12,985
   pswpout                    885,437          888,027          895,478
   pswpin                   2,035,415        1,305,341        1,384,751
   zswpout                  1,054,928        1,124,990        1,190,608
   zswpin                     280,675          162,684          158,556

To isolate the cgroup zswap limit, I also tested with 
max_pool_percent=50 (which should behave similarly to the zswap.max=280M 
case above, bounded strictly by cgroup zswap.max):

Test Case: zmax320 stress-4 pool50%
                            baseline        batch-all32      batch-all64
   shrink_worker wakeups            0                0                0
   shrink_memcg calls         687,608           54,002           28,116
   written_back               639,176          846,663          862,347
   store succeeded            992,816        1,208,123        1,213,286
   store rejected             231,431           20,425           10,915
   store reject rate             ~18%              ~1%              ~0%
   pswpout                    870,745          867,360          873,553
   pswpin                   1,707,823        1,216,814        1,378,381
   zswpout                    992,816        1,208,123        1,213,286
   zswpin                     250,220          210,791          185,716


Finally, here is the dataset for zswap.max=320M and max_pool_percent=1 
with a single stress-ng worker (stress-1), which also looks consistent 
with your expectations:

Test Case: zmax320 stress-1 pool1%
                           baseline        batch-all32      batch-all64
   shrink_worker wakeups        9,279              980              557
   shrink_memcg calls      14,247,647        2,638,751        1,465,915
   written_back                 7,702          439,809          482,809
   store succeeded            329,603          531,224          566,150
   store rejected             883,945          517,578          482,644
   store reject rate             ~73%             ~49%             ~46%
   pswpout                    891,647          957,388          965,453
   pswpin                     692,255          628,246          582,781
   zswpout                    329,603          531,224          566,150
   zswpin                     248,871                3            7,872

Thanks,
Hao


