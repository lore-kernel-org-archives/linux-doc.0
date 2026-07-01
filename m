Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2413BFE41
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898579; cv=none; b=gimLAJpZFAxrm10OfxmOuhS4zUn/VdjWYgwd2nXpP4uIIVcV5635Mfz31lQ+7pJRmJgsaATWpadlnzbNZCa5bs+oH8NWpTZUrCdDp5dDxi1jmM0vuRb+I8mh1lnRVmyzvmvoosKO0VT5kbarRobki88PUVaFzOHsPYTEElfctXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898579; c=relaxed/simple;
	bh=kFJU5S/ADS8cQ9IcAhCTCexim4U1NOWnfHr1WtpsRGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBQG2U3vODtS25Ytssvn0iuHvYLcsTaKvLPSG1VaIgbsn7PVjMWCq58JSzPoD24wZuC4Ga+Mj4S556vP3F2Ze9FteW21MxIvTDYEf60YZWPVlNLnSDJEPMxNhs3zznuQqQ4wT70xzULl3SmwE8/4iYYcsMVgDHjHTmYdppWU8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5EL6dBF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5EL6dBF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso304587a91.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782898577; x=1783503377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RZ1T1yMzReBxlyUrs6yfTSt/QEbowwV85eIIRt2ArQ4=;
        b=k5EL6dBFpgqCLtlochxhmoWK0jd98YXvCog3Tx2RyfaOvAz89eF+QzH97pDKmX4GwZ
         gD/OSgNBYCir/XT2AjVH7rvu4J3FNo0wi4fmBLoF6B7WJud2MXIGrSlMNvNRcw3JgXjO
         aMI+Ivao6vdlQr44L9tBt3i3pe1Z3p37Pz+HsAysFg25mtF0vQ+pLVAwRjsHhdEezpQw
         +J0ck12sGwBbiGxM7yosfLQ5W2oyVWwSuzuKTxYGc8efhrt8fKanditwF+opOnZEvhF9
         8nTv1j/j/AlcV3Av+oUKgzpAXJuJxOKGBbcTXv504MaVtIupU9hwdYVZhQY1S2Zek/V4
         YB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782898577; x=1783503377;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZ1T1yMzReBxlyUrs6yfTSt/QEbowwV85eIIRt2ArQ4=;
        b=QeRU2pcpYXZuCXzqVTdMV6/4UzeSBQSay533xHhke9DWVE/E6lSPHgGRH2ghhotpl4
         Y3Zef99QgaTzmVdnSJIVeJsdUZOgEKxOPhmd0cft9iL1Fc/5mLzm1T0t9SZF2miEOyOW
         gGFUir83QmFRTwxuphCpTgspPp7GS2UWITthMu0+10SWzuN4y0dl3kNF2ARuqpI1jyxb
         d7eT9hAmiELcETxB2q+qJeF69/T4lKkcVrSjRAg0vbhULUVIXknWAFOjpoPr7ZVICuW3
         nG3r7QHRlBcSXuvQCJcFH9VGVJjAFCiFN3dXMjUE63LSqfCxrc7MSUKT1qUJRslAwsD1
         5DrA==
X-Forwarded-Encrypted: i=1; AHgh+Rri2NJiipJDQffjr+kUIfu+801My82bvSrmqZjJPqELV7v3+Q4mVPjdsVigm2XfqFoO66RVqqflE94=@vger.kernel.org
X-Gm-Message-State: AOJu0YymF2L3n38Uby57+MhkOrjViqvIQIGi6SZoN/w0+Y9T2igSjghA
	e6NbZfaBs4hs54m1G1maBriT4GHru5TvK59jJlbG4Ky0vId0VTTT4/z5
X-Gm-Gg: AfdE7cl1l8DVvTbSWwLYc1XsyFHuJp10Z9D+WDNn4ykJ3w0ooCC1rjrl94NqluSRBR8
	SLb/qZmQeoZ9dyQUpur5O2b15H/YvqcmwvORUewmDqRt4YrE9WJwB1E8vc9G9Cz4+90yxWg31u3
	ryz55UTAYipL6cz1pJFURzlbTrcCZMd0LQgneJbVMGdAJqYaQPp/Exu80hBvb5Dg9Vw3qAKS++g
	2/jcrHfyNHkv2x5FrX7et/+uGxBIVumKo/X6UXOC4jMpAg09LP2I19Zce25F6CkYo+t0PkQ+D2+
	PHmyGLEJxTgyJOeVyhedu+WX3IDI0wfZgh9afzXyjVrGyll+5+ted/zb8523K4MF5975ZngebLK
	Y7xhAQvwceeeDuehBquTcRXZEGHrouiP6Cf5P9j4VcFcjsprIBcv937NUwmxO183syQNFG9neWr
	2Y6iCTGQ14pflTW0X3NHesU1P3YxN/zNvT
X-Received: by 2002:a17:90b:2687:b0:37f:caeb:69e3 with SMTP id 98e67ed59e1d1-380ba8fb076mr96356a91.23.1782898576891;
        Wed, 01 Jul 2026 02:36:16 -0700 (PDT)
Received: from [10.125.192.77] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097da4c32sm717511a91.2.2026.07.01.02.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:36:15 -0700 (PDT)
Message-ID: <a1c139d9-08b8-9631-7a85-697df4c23d52@gmail.com>
Date: Wed, 1 Jul 2026 17:35:55 +0800
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
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/1 00:10, Yosry Ahmed wrote:
>>> Before going through more versions we need to figure out if this will
>>> pivot to be a proactive demotion interfcae for swap tiering.
>>>
>>
>> Yes. Should I drop patches 4-6 in the next version and wait for swap
>> tiering to be finalized?
>> We can try to get the non-memcg parts (patches 1-3) merged upstream
>> first. This would also give them plenty of time to bake and catch any
>> potential regressions. Thoughts?
> 
> Patches 1-2 can be sent and merged separately, yes. For patch 2,
> please include some numbers for the writeback performance before and
> after batching.
> 
> Patch 3 does refactoring in preparation for patch 4, so I don't think
> it makes sense on its own.

Will do.

> 
>>>> +int zswap_proactive_writeback(struct mem_cgroup *memcg, u64 bytes_to_writeback)
>>>> +{
>>>> +    struct zswap_shrink_state s = {};
>>>> +    struct mem_cgroup *iter = NULL;
>>>> +    u64 bytes_written = 0;
>>>> +    int ret = 0;
>>>> +
>>>> +    if (!memcg)
>>>> +            return -EINVAL;
>>>
>>> Can this ever happen? It would be a bug in the caller.
>>
>> IIRC，Writing the following to the NUMA node sysfs entry triggers this
>> check:
>> echo "10M source=zswap" > /sys/devices/system/node/nodeN/reclaim
> 
> Oh yeah, I forgot about that one :)
> 
> If we keep this, probably combine the !memcg and writeback check below.

Will do.
> 
>>
>>>
>>>> +    if (!mem_cgroup_zswap_writeback_enabled(memcg))
>>>> +            return -EINVAL;
>>>> +    if (!bytes_to_writeback)
>>>> +            return 0;
>>>
>>> Do we need this? I think the loop will just never enter and
>>> mem_cgroup_iter_break() will do nothing.
>>
>> Will do.
>>>
>>>> +
>>>> +    while (bytes_written < bytes_to_writeback) {
>>>> +            long shrunk;
>>>> +
>>>> +            cond_resched();
>>>> +
>>>> +            if (signal_pending(current)) {
>>>> +                    ret = -EINTR;
>>>> +                    break;
>>>> +            }
>>>> +
>>>> +            /*
>>>> +             * Use a local iterator to walk the memcg and its online descendants
>>>> +             * in a round-robin manner. Upon exiting the loop, mem_cgroup_iter_break()
>>>> +             * must be called to drop the iterator reference.
>>>> +             */
>>>> +            do {
>>>> +                    iter = mem_cgroup_iter(memcg, iter, NULL);
>>>> +            } while (iter && !mem_cgroup_tryget_online(iter));
>>>> +
>>>> +            shrunk = zswap_shrink_one_memcg(iter, &s);
>>>> +            if (shrunk > 0)
>>>> +                    bytes_written += shrunk;
>>>> +
>>>> +            /* drop the extra reference taken by mem_cgroup_tryget_online() */
>>>> +            mem_cgroup_put(iter);
>>>
>>>
>>> Can we just use mem_cgroup_online() instead since mem_cgroup_iter()
>>> already graps a ref?
>>>
>> Will do.
> 
> If you're looking for another cleanup to do, shrink_worker() should
> probably also use mem_cgroup_online() and avoid taking/dropping an
> extra ref :)

IIRC, this might not work because zswap_next_shrink is a global variable 
and is accessed outside the lock during reclamation.

Consider the following race condition between shrink_worker on CPU0 and 
zswap_memcg_offline_cleanup on CPU1:


           CPU0                            CPU1
spin_lock(zswap_shrink_lock)
memcg1 = mem_cgroup_iter()
   memcg1.ref = 1
   zswap_next_shrink = memcg1
spin_unlock(zswap_shrink_lock)
                               zswap_memcg_offline_cleanup()
                               spin_lock(zswap_shrink_lock)
                               css_put(zswap_next_shrink)
                               memcg1.ref = 0  <--

shrink_memcg(memcg1) *maybe UAF*

Thanks,
Hao
