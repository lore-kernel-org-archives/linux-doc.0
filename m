Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC17379C32
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659498; cv=none; b=cCDm5rYmWkWbvsGoGbXJXI6Ycm8otM9w4wtO0ZO9DYisd8D/KaLsZml6JJUyhUeVWzI/tjiP2MbDpw1eRsFGCJqBO6ujs+dyVzUzMzpgDeJ3me7ePxWHznA8mr+rvuhz8SIlOGLDGz4Uk2Dqc6HcCtR5qnjvbIMvdlhJx36w61U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659498; c=relaxed/simple;
	bh=syLqyXWh8onmszP6ITzEgIzgnnVbMA0gxWTg9tqsQps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKXD3eg3TSk5rIA3y1W0ExZQEGhhBFFlEyCvo4RRlZOmCfy6fdC5G3JQLlz12CJYGVXCdSRkPHUku+EhWk7NL7cn/spKQ6NmQZrZ1Tq/FLkuGiA7ey85BKEhZzr+UikW6I+wAspRpZ7df7yIa1XXaPzMCZdezKbJ2ZceRns5c9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4NStl2j; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4NStl2j"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so3511600a91.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778659495; x=1779264295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1dxIimePE2VOkjQz2/ma0Z1DDa/BQxq5kyPGrdKr+k=;
        b=h4NStl2jxSMK6+B1o4jurkW9rqCadgbuX83hXb6eM/WCAOemBuWouBhdi2Y1NfOtRT
         laQa/HXLVmkX5teleljn+oiFsFuFDls5WDsTYYR+rZA0WW24yts5cH7l8CnK4wQA3hcg
         m3zqGWJN9ZmuyqBcqu6tt0qCjwyXdpK9+JJvGTDjt1ejiF1MqbVmF1p8vtcjOPO5TX9K
         cUoLc993FGcDyivx9zuyk1Ej2EsEbP3og31nl/W6RXqJ8fc6WzCXy8rLN3NgRPSqE1G4
         vyi5HZPrSnI02amtWqrN6QA02CriUyOBCdQcMLpDduO8YBgWg+aEZaQ9GSRFYXkKMg4x
         X/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659495; x=1779264295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1dxIimePE2VOkjQz2/ma0Z1DDa/BQxq5kyPGrdKr+k=;
        b=MLnjAi647WskeMDqiaKHz3EZ/VGTuud2wedHyY9mmoy7wPTliQNsFOAzw1ozupRkfL
         Yvn0QXkYSey0gmTcL/79Cu3w81fJcvWrjJf1ZOW2M8HU5bBecgFVcMcMH8HfL3cnPXlr
         nacQiT+wMkNVanpfdlabIj/bfg+ZrfmCBYT0pcEFQH1MjafI90IOSXELXoJAwHj4qwLB
         XBvErRqGhrqyr6Cn46uIfEtQv0kMIRpIPETovyu1Q9FuolstsedRGA7f9XGgIYT8Dd8A
         a76MnPBgcM7ckMrzQSG6DW349fCmMvlZd+C5PN8UxJBmDkobs0KvF2+KFvtKitgk7Le/
         9YQg==
X-Forwarded-Encrypted: i=1; AFNElJ8Dm7z//7BC6WkPNdaHfFuznbxjZuQD3GXOkaiFNhsJ33BCUswJa1jwI/mECrlBUVIziA0n24pFYvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye1V4aaXSH2rcrqjRVlfSpD5KpXlJ2r9NZYNxHvZSR1LK5CyyM
	kMh0ti6W+guq9cXRn5DuPFIqW+LVkHTB34TpCWuA2Eu+ZmOwCo7GegbP
X-Gm-Gg: Acq92OF7M9QRkVsQYxcsv3FuWlwTsYCxs6I+5a2siXRrIxQYUbefG5frDMdF18w5fKI
	nI818f+DDkjDGg5zQetbiwLus+B18VMTf4SI7ma91TxBv3OwGSAiP0qwDlFWSRVxC3iJdQDS41r
	ezVUrcjpOefdxGJ4sGPuOLh853Gxg5eyFsHqbjhKa5DHlcf7EGsTYKqbjQO+6SzilClLzpA3hOO
	UO8SbFIv2sDSMicgaE//v+wQrFEya0rIHeLxydl/VKSYL15M/ZFOO5BiQv7gifGo1yP/XLlFvFw
	b9wjz4A6d63MTju44KE90C/nTVESQlpekxPkxRECAfSqF3lftp8Ypwx6wEEYA5YsYckPUh8XeIL
	GmK1COUL6uZKR+exL9u5PrYqMeg+F4GLnSvX2Qg7k0HeqtfkaKQYlf8PTdoVSzt5F595j9K7mWF
	dn8tN29bmJK7pSXMSyzEwtXf4XkXDlA+faMA0kGEP+7wg=
X-Received: by 2002:a17:90b:3f8c:b0:368:ed92:6f5 with SMTP id 98e67ed59e1d1-368f77f6980mr1854188a91.4.1778659494907;
        Wed, 13 May 2026 01:04:54 -0700 (PDT)
Received: from [10.125.192.65] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ede2d545sm2895850a91.6.2026.05.13.01.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:04:53 -0700 (PDT)
Message-ID: <6fc7fdf0-368c-5129-038e-623f9db2aa88@gmail.com>
Date: Wed, 13 May 2026 16:04:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org,
 mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>, Alexandre Ghiti <alex@ghiti.fr>
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <20260511105149.75584-3-jiahao.kernel@gmail.com>
 <CAKEwX=PLFRkfUvZyaYfwBv0QJ-8KAktvZvGA02Hod04H-RsS-Q@mail.gmail.com>
 <CAO9r8zNOPdpJuTmccvQ6ZAVS+tXxp-_ofA765DbnfaUZOPPO-g@mail.gmail.com>
 <12e4784e-2add-d849-7e54-bde8abfa6e78@gmail.com>
 <CAKEwX=MOixJAUGiwUcMQa0Stvg-mR-MvpDRD8WA4YMtRvnUYTg@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=MOixJAUGiwUcMQa0Stvg-mR-MvpDRD8WA4YMtRvnUYTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/12 23:47, Nhat Pham wrote:
> On Tue, May 12, 2026 at 2:32 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/5/12 03:57, Yosry Ahmed wrote:
>>> On Mon, May 11, 2026 at 12:49 PM Nhat Pham <nphamcs@gmail.com> wrote:
>>>>
>>>> On Mon, May 11, 2026 at 3:52 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>>>
>>>>> From: Hao Jia <jiahao1@lixiang.com>
>>>>>
>>>>> Zswap currently writes back pages to backing swap devices reactively,
>>>>> triggered either by memory pressure via the shrinker or by the pool
>>>>> reaching its size limit. This reactive approach offers no precise
>>>>> control over when writeback happens, which can disturb latency-sensitive
>>>>> workloads, and it cannot direct writeback at a specific memory cgroup.
>>>>> However, there are scenarios where users might want to proactively
>>>>> write back cold pages from zswap to the backing swap device, for
>>>>> example, to free up memory for other applications or to prepare for
>>>>> upcoming memory-intensive workloads.
>>>>>
>>>>> Therefore, implement a proactive writeback mechanism for zswap by
>>>>> adding a new cgroup interface file memory.zswap.proactive_writeback
>>>>> within the memory controller.
>>>>
>>
>> Thanks Nhat, Yosry — let me address both comments together.
>>
>>>>
>>>> We already have memory.reclaim, no? Would that not work to create
>>>> headroom generally for your use case? Is there a reason why we are
>>>> treating zswap memory as special here?
>>>
>>
>> Apologies for the lack of detailed explanation in the patch description,
>> which led to the confusion.
>>
>> While we are already utilizing memory.reclaim, it does not fully address
>> our requirements.
>>
>> Our deployment runs a userspace proactive reclaimer that drives
>> memory.reclaim based on the system's runtime state (memory/CPU/IO
>> pressure, refault rate, ...) and workload-specific
>> policy. That first stage compresses cold anon pages into zswap. Entries
>> that then remain in zswap past a policy-defined age threshold are
>> considered "twice cold", and the reclaimer wants
>> to write them back to the backing swap device at a moment of its own
>> choosing, to further reclaim the DRAM still held by the compressed data.
>>
>> This is the "second-level offloading" pattern described in Meta's TMO
>> paper [1]. zswap proactive writeback is what this series introduces to
>> address that second-level offloading stage.
>>
>> [1] https://www.pdl.cmu.edu/ftp/NVM/tmo_asplos22.pdf
> 
> Yeah that's what we've been trying to work on as well :) We are
> working on a couple of improvements to the mechanism side of this path
> (cc Alex) - hopefully it will help your use case too!
> 
> Anyway, back to my original inquiry: I understand your use case. It's
> pretty similar to our goal. What I'm not getting is why is
> memory.reclaim (which you already use) not sufficient for zswap ->
> disk swap offloading too?
> 
> Zswap objects are organized into LRU and exposed to the shrinker
> interface. Echo-ing to memory.reclaim should also offload some zswap
> entries, correct? Are there still cold zswap entries that escape this,
> somehow?
> 

Yes, the memory.reclaim path does drive some zswap writeback, but
it is not enough for our case.

1. For a memcg that has reached steady state (a common case being
when memory.current is below the policy target), the userspace
reclaimer may not invoke memory.reclaim on it for a long time,
and so no second-level offloading happens through
memory.reclaim. In this state we want
memory.zswap.proactive_writeback to write back entries that
have sat in zswap past an age threshold, to further reclaim
the DRAM still held by the compressed data.

2. Even when memory.reclaim is running, the fraction of zswap
residency that ends up reaching the backing swap device is
still very small for many of our workloads, and the userspace
reclaimer has no way to participate in or control the
granularity of zswap writeback. So in our deployment we prefer
to leave the zswap shrinker disabled, decouple LRU -> zswap
from zswap -> swap, and use a dedicated proactive-writeback
interface that lifts the writeback policy into userspace where
it can evolve independently of the kernel.

Thanks,
Hao

> Furthermore, we already have a way to detect the "twice cold" entries
> you mentioned: the referenced bit. This is analogous to the way we
> treat uncompressed pages.
> 
>>
>>
>>> +1, why do we need to specifically proactively reclaim the compressed memory?
>>>
>>> Also, if we do need to minimize the compressed memory and force higher
>>> writeback rates, we can do so with memory.zswap.max, right?
>>
>> Here are a few reasons why memory.zswap.max is not enough:
>>
>> 1. Writing memory.zswap.max itself does not trigger any writeback
>> immediately. For a memcg that has reached steady state (on which the
>> userspace reclaimer is no longer invoking
>> memory.reclaim), after enough time has passed, the reclaimer has no good
>> way to trigger proactive writeback for second-level offloading by
>> lowering memory.zswap.max, because in steady
>> state nothing drives the zswap_store() -> shrink_memcg() path. The
>> userspace reclaimer still has no control over when proactive writeback
>> happens.
>>
>> 2. memory.zswap.max currently triggers zswap writeback via zswap_store()
>> -> shrink_memcg(), and each over-limit event can write back at most
>> NR_NODES entries. If zswap residency is far
>> above memory.zswap.max, converging to the target size requires at least
>> O(over-limit pages / NR_NODES) zswap_store() events, with no batching —
>> proactive writeback therefore has
>> significant latency.
>>
>> 3. memory.zswap.max is a stateful interface. If the userspace reclaimer
>> crashes for any reason mid-operation, it may leave memory.zswap.max at
>> some set value, putting the application in a
>>    persistently throttled bad state.
>>
>> 4. Once the userspace reclaimer has lowered memory.zswap.max, if the
>> workload is rapidly expanding and triggers memory reclaim via
>> memory.high / kswapd / etc., the actual amount written
>> back can exceed what was intended.
> 
> One more reason: IIRC, when you set memory.zswap.max to a value other
> than 0 max, every zswap store incurs a pretty expensive check
> (obj_cgroup_may_zswap), which does a force flush
> (__mem_cgroup_flush_stats). That was pretty expensive last time some
> of our internal services played with it. So yeah, it's not ideal...
> 
> (if you're using this, might wanna profile this as well).
> 
>>
>> Thanks,
>> Hao
