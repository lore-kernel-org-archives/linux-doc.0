Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A62BE03C
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 01:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538317; cv=none; b=jsJbPDGRL81YOKAwELjGu7fo4d/MBPX6fOJssmemCeyUxg0gHNN/QblqgZvF5YQ44ICMbvQLXlZ3EpcUyyrvIaJIM3x3bGAhAi/QzKdEO16IvqAWW8+Cl0sbULavLv8RnTFcy/hgDNglbURveq8St7BD/C495mPHvi2ChnydoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538317; c=relaxed/simple;
	bh=wa9XYeHbb9kwdRQLnbUpXOx6qjjsAERqKKJ1t4nbqNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9WjWhtG5S6PuxTG0Ol1MeQ7PUvQXujOe1O6kjsszIqOpvhIXzkSPqxQacoBAL6eH3wQ53/3IhpBSSLQEhd5FEfmN+c8EldcTbiG5Nd/dCr3/S/5G0vfJsDbdb7ktitbo4i6FTE9eaUjxQpRarKENBo5AUiGFJTfpHutxrS8SuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCiEp/ih; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCiEp/ih"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso117541a91.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 18:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780538315; x=1781143115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnlelyjEPA4eQLtR+vH42NF5EXOCOjHQA+g+i9GlLcA=;
        b=pCiEp/ihFO9m59VVAbWFw4j47u2kCoav3FV7ntp4XBV+x9Zi8w2L7aDHp926PemqlX
         BS7bBE4d4Q/9G7SO8nXi/w7SMtgBn5lIDVr3CAA/jk5B9ri4imN5wuIQSBIgueTDns/l
         5AhjKLVCFjbOtXQwuqWKWpTQDD7Gv37SuiSiXtmxHMy5aVyXoRcIrBzmOIBudcdcwQOj
         xmwsi1HWr4KsRhClFsABbRBU2vphLUjCo/3p++AOB7tHTN0jJbbUnb21NWook4xDoVfG
         Y61CQziUjh0BcqIHqh0ASa+aLy0nCHgVhiwhRcotCiW66NgmtXZkkUgNSj9l7udBwgPj
         P5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780538315; x=1781143115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CnlelyjEPA4eQLtR+vH42NF5EXOCOjHQA+g+i9GlLcA=;
        b=d8BsWmJSuYhpKr/Njxu7nX8qoGAUUOT09L6ONSai/WJGQuokHeKty6D7BZFCaNxvrz
         trWcdlrN611L1EBVgB+r4DCTSqGNzzs63d6j+uGixiNpHctwQo/WJU8waXZQSWcSXWTb
         +JFivnWjrCBUjRX2Jv0cVMJAxqNK5pHkFAFIDH3w1p2MeT02TUSXXV/GLMoCv/lhqUJn
         w7lx3xGOZgnFWqPKgpatexBOSKSnTVOABBQm2Mps891bDbpp5wAIiWVWL6ZTMwgp9YXD
         i6D8FyU1rIy2g6Xn7AZaXR2RfHR48HEgrhsfMU+EVz0pVy26gSDNJclS+gtm+GCrr4Ed
         I9uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kvu8B2WAfHLDpTucNeyoEHPZxACsF0OSeKPGWOD0zqD08/oOJuWqFKWUC6jCAvrbkVTeoyvwEEVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+pc0cDAfBrB21amk9aBmTcxzW1/x48OI0ph5A2GvAIjOEk56J
	Q+izC51+YUPNba9S/KQKlDUrQnFf9sZrzh6ZLcHf+MRr/Y/fiEqmuBFP6BrpqA==
X-Gm-Gg: Acq92OHFybUrkvS5jLkqUmvHdWQASdw5hqpgFWI3Zdpd+Wm3cnAISkvBP63a+/K1Tis
	uvffMuuy/omuyTzJGrf+GJ03/MMUCoInYOOOEshQND4axI5NwaefsD6BmV5tHD6at4NH+WctlnS
	XqR89noqQ43qI2LIAOF9AOxiM0AnjKYO2b9ceUhqosmWSdS1tGAHk1iCCts+WGUOxt5Z9D4bjZy
	3QGPvAt93kTocLPbFJJGOB17z5BOK6l9NiuVSZ3tY0B/I4FOyGNZwYFUHhLNr2UqE1aaq5LjTdQ
	GnDDECuqUasjHUWA2/77beIW+fuYGPenMGT7NGAH0BqKukutmAUz10FAwX1bvomcuYWyAh6WoZB
	VtDET5xp+ZDPnQeZtUocrTXRJ+zGbsNoEMUsR1n/i0b1G+R7uJgqXm5yytljnfTqWRgRyEMgLJ3
	tEAqcfrxf4gGaQTvWA6gnDkoWIZgsp15Ib9za9nlPJG0Pq6Fz5wzGw5A==
X-Received: by 2002:a17:90b:224e:b0:36d:f28b:72e2 with SMTP id 98e67ed59e1d1-36e32a4281dmr5807810a91.8.1780538315484;
        Wed, 03 Jun 2026 18:58:35 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8064sm1082124a91.12.2026.06.03.18.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 18:58:35 -0700 (PDT)
Message-ID: <9898f83d-fae9-e284-6b85-c7f4089840a0@gmail.com>
Date: Thu, 4 Jun 2026 09:58:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor
 per-memcg
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com>
 <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
 <ah4ZZGl7GYJf54Wz@google.com>
 <ff344c9f-51da-8b3a-e7a9-c4a7f4702ef8@gmail.com>
 <ah9i3uhh3PFiS0Uk@google.com>
 <c7870fe2-3588-79db-cbfb-bd6a2b78f594@gmail.com>
 <aiBpibRNi0BcM1Zu@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <aiBpibRNi0BcM1Zu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/6/4 01:53, Yosry Ahmed wrote:
> On Wed, Jun 03, 2026 at 11:02:54AM +0800, Hao Jia wrote:
>>
>>
>> On 2026/6/3 07:19, Yosry Ahmed wrote:
>>>>>>>> Proactive writeback also wants a similar per-memcg cursor that is
>>>>>>>> scoped to the specified memcg, so that repeated invocations against
>>>>>>>> the same memcg make forward progress across its descendant memcgs
>>>>>>>> instead of restarting from the first child memcg each time.
>>>>>>>
>>>>>>> Is this a problem in practice?
>>>>>>>
>>>>>>> Is the concern the overhead of scanning memcgs repeatedly, or lack of
>>>>>>> fairness? I wonder if we should just do writeback in batches from all
>>>>>>> memcgs, similar to how reclaim does it, then evaluate at the end if we
>>>>>>> need to start over?
>>>>>>>
>>>>>>
>>>>>> Not using a per-cgroup cursor will cause issues for "repeated small-budget
>>>>>> calls" cases. For example, repeatedly triggering a 2MB writeback might
>>>>>> result in only writing back pages from the first few child memcgs every
>>>>>> time. In the worst-case scenario (where the writeback amount is less than
>>>>>> WB_BATCH), it might only ever write back from the first child memcg.
>>>>>
>>>>> Right, so a fairness concern?
>>>>>
>>>>> I wonder if we should just reclaim a batch from each memcg, then check
>>>>> if we reached the goal, otherwise start over. If the batch size is small
>>>>> enough that should work?
>>>>
>>>> Even with a small batch size, for small writeback requests triggered by
>>>> user-space (e.g., 2MB, which is batch size * N), it might still repeatedly
>>>> write back from only the first N child memcgs.
>>>
>>> Yes, I understand, I am asking if this is a problem in practice. For
>>> this to be a problem we'd need to trigger small writeback requests and
>>> have many memcgs.
>>>
>>>> This could cause the user-space agent to prematurely give up on zswap
>>>> writeback.
>>>
>>> Why? The kernel should not return before trying to writeback from all
>>> memcgs. If we scan the first N child memcgs and did not writeback
>>> enough, we should keep going, right?
>>>
>>
>> Yes, this issue is not caused by the kernel, but rather by our user-space
>> agent itself.
>>
>> For instance, suppose a parent memcg has two children, memcg1 and memcg2,
>> each with 200MB of zswap (100MB inactive). Triggering proactive writeback on
>> the parent memcg will exhaust memcg1's inactive zswap pages. After that,
>> even though memcg2 still has plenty of inactive zswap pages, it will
>> continue to write back memcg1's active zswap pages. Writing back active
>> zswap pages causes the user-space agent to prematurely abort the writeback
>> because it detects that certain memcg metrics have exceeded predefined
>> thresholds.
> 
> This will only happen if the reclaim size is smaller than the batch
> size, right? Otherwise the kernel should reclaim more or less equally
> from both memcgs?
> 

I gave it some thought. Not using a cursor could lead to unfairness 
issues with certain writeback sizes:

  - If the writeback size is an odd multiple of WB_BATCH (e.g., 
triggering a writeback of 3 * WB_BATCH), with 2 child cgroups, the 
writeback ratio might end up being 2:1.
  - If a memcg has 5 child cgroups and a writeback of 2 * WB_BATCH is 
triggered, it might repeatedly write back from only the first 2 child 
cgroups.

Although setting a smaller WB_BATCH might mitigate this unfairness, it 
could hurt writeback efficiency. Let's just use per-memcg cursors to 
completely fix these corner cases.

Thanks,
Hao

>> Of course, real-world scenarios are much more complex, and this kind of case
>> is extremely rare in our environment.
>>
>> That being said, your suggestion of using the global lock for the per-memcg
>> cursors makes the writeback fairer and would resolve these corner cases.
> 
> Right, but I'd rather not do per-memcg cursors at all if we can avoid
> it. Will using batches help make reclaim fair over all memcgs without a
> cursor?
> 
> We can always add the cursor later if needed.
