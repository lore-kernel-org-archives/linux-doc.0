Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0139A047
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578371; cv=none; b=YcHgF8cV9BZWy2Us3IdqEnWgdanQXA2U9Yh2ACW8CuZGYubaOkMWwMg9cGtGp91azLbn1mMp5y2Ns6n6VyjGmckgsUafOGjRSBUxC5h/fbuSvs3dHD3duVCcRn5QJcJlrsc7U7MQyM7T/H7rlpagAjjZtZsapWLtezJUUiKHM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578371; c=relaxed/simple;
	bh=qTCm4e0SDhDs36LOqJFzDbvP5Osv9iHCn/M3glWmsfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljHBjZh4MXzcOABlyrjA87pslAk7kl/c88ZaO9+BzE15+BV9pCmvG88h6HUCN7Y6NFdwFtACP4xB6l9bsrAJ5flQA+fWQwYH2+6il7UiGSSqD5b0bESFtQojULGO0RN+MKbLdmPMs9zHL700lU4UuQzbF7cTVsjLlrwQYwT4m60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzgZEhAK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzgZEhAK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b4650d5f5cso20564615ad.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778578369; x=1779183169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G6+bx80FRHpgHi4yg0luQJohBPaG8COWz9arYdTBtw=;
        b=WzgZEhAKlp2IfpXWQqZjmSzf3m24/YZSQZC2Oe1KwBs9/FLrL0REYj9vEGxoZ911jP
         cKLc16W2EqMT/Bct4YcDaqQrSKIqdCIdBRBAXVEzOKAYzqIR7T/obW6ZmSEgAH4bhrlc
         BHEdKCVmlxE+96GDq8aZ8A1AV+tZZvyQJCPkbP1QdDXEN69RanD/5+yvl8V+CLYE0dqu
         tkHpgCMd7nlHmw0jUDH/mPZUjVCC32Soe5Z+T0yTuRVuYVisYl7yRFnu++EuYu+aUNZw
         jLZ0EfRMwl50b3ZMJcyoVy+bJC6Bzkaa0n+STCIvUbg9yR2CQ/2/VLI8DGqRyolH+0bu
         b5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578369; x=1779183169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5G6+bx80FRHpgHi4yg0luQJohBPaG8COWz9arYdTBtw=;
        b=isVqt5ccLWFUtHbmr2UgSn3GrJS/HotbvPWW5IBVfsi0R67LpFWVAYSxmI2c4HsQ0v
         0uB30sZjGUnbMpBiWguUIzPr4baGSCqWc/a2HuFlMQC3D3SHk0t4z3jPXCNgyLRB6xfW
         hfv1hHJdEgXwS3wOqfBrH+KRzl1kUHA5il/gsERo9ZUhpFoER6w87574EehWXkCl41iR
         mqrs5S7gpLnRcrwHxYvmUvNOa6QRZnpdmk8Dy/EIo2tW73GPK9jbM5kzi+gfSZ2TcigQ
         GjRgH2ekoU1u4et4daWy7a+JAIwX7KNZhckFrknEB2erTK2bcQ3U/UwtZEPkF5/gN5nC
         8AmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iSrUJJONve4SxmVdJF6ssZEcHhrhv6N3aXMT7x2UG8BNzvKNVDCAB0JrorQr86LljyxpgaUAtDpU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxonkq/EQqMIAvbnt2AYzbriDX8OFWSYX1a4q0Ae0o+Bggq8qg6
	g4v2HlkIGUP7QWd5Ug4yqpZe9fKehXjg32qAMNGbjmLR/mM+aFh4yPX3
X-Gm-Gg: Acq92OGVs8K72jQ5g0oTDsuZwnxtwiWzgCWwbVU6TBuFyHicKM01RPT5b1xV9yren5R
	R5zHCaS4BsT8SNwK44qFd4aYKEjQT9x4Cpff9eykl5W8FH5W9ZuMcfuo8uJq4VkZU0b1JAux+9L
	q6L1tgQ5bFtOh+vndI0TJghPsAtCLOyVaGuILcs5XhET2IT8mdrYfaLQRsXnS9gEGTcBpxi4IDZ
	5TKminoBCXIQTly9L6gqsBiA+Dq9q1F8/oQ9BJ1myw08gJ4lDQCYf1ZrBSDTyLXr1E2cSVkQPlm
	tyOTf/s5AcKCnxAGgRAZ9ALPA7fV/0RKaz7HxY7IXtTp0KrQVukM/HV1Ee83n/AH9V6YAI+EmXT
	tyOa4kNhTZPsjviwTj01bKxGvDslrvrFsOLYa9Xrgj5YLZ7V3932x068WDJ4toiWO9kL2EyyVD1
	2uOrnU/IOz4PosXfqV8rK9cPtlqNRGL2zOlKZr9Gsh3kA=
X-Received: by 2002:a17:903:1d2:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2ba7908bfb1mr288266195ad.13.1778578369221;
        Tue, 12 May 2026 02:32:49 -0700 (PDT)
Received: from [10.125.192.65] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebe0e8sm137692965ad.76.2026.05.12.02.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:32:47 -0700 (PDT)
Message-ID: <12e4784e-2add-d849-7e54-bde8abfa6e78@gmail.com>
Date: Tue, 12 May 2026 17:32:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <20260511105149.75584-3-jiahao.kernel@gmail.com>
 <CAKEwX=PLFRkfUvZyaYfwBv0QJ-8KAktvZvGA02Hod04H-RsS-Q@mail.gmail.com>
 <CAO9r8zNOPdpJuTmccvQ6ZAVS+tXxp-_ofA765DbnfaUZOPPO-g@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zNOPdpJuTmccvQ6ZAVS+tXxp-_ofA765DbnfaUZOPPO-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/12 03:57, Yosry Ahmed wrote:
> On Mon, May 11, 2026 at 12:49 PM Nhat Pham <nphamcs@gmail.com> wrote:
>>
>> On Mon, May 11, 2026 at 3:52 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>
>>> From: Hao Jia <jiahao1@lixiang.com>
>>>
>>> Zswap currently writes back pages to backing swap devices reactively,
>>> triggered either by memory pressure via the shrinker or by the pool
>>> reaching its size limit. This reactive approach offers no precise
>>> control over when writeback happens, which can disturb latency-sensitive
>>> workloads, and it cannot direct writeback at a specific memory cgroup.
>>> However, there are scenarios where users might want to proactively
>>> write back cold pages from zswap to the backing swap device, for
>>> example, to free up memory for other applications or to prepare for
>>> upcoming memory-intensive workloads.
>>>
>>> Therefore, implement a proactive writeback mechanism for zswap by
>>> adding a new cgroup interface file memory.zswap.proactive_writeback
>>> within the memory controller.
>>

Thanks Nhat, Yosry — let me address both comments together.

>>
>> We already have memory.reclaim, no? Would that not work to create
>> headroom generally for your use case? Is there a reason why we are
>> treating zswap memory as special here?
> 

Apologies for the lack of detailed explanation in the patch description, 
which led to the confusion.

While we are already utilizing memory.reclaim, it does not fully address 
our requirements.

Our deployment runs a userspace proactive reclaimer that drives 
memory.reclaim based on the system's runtime state (memory/CPU/IO 
pressure, refault rate, ...) and workload-specific
policy. That first stage compresses cold anon pages into zswap. Entries 
that then remain in zswap past a policy-defined age threshold are 
considered "twice cold", and the reclaimer wants
to write them back to the backing swap device at a moment of its own 
choosing, to further reclaim the DRAM still held by the compressed data.

This is the "second-level offloading" pattern described in Meta's TMO 
paper [1]. zswap proactive writeback is what this series introduces to 
address that second-level offloading stage.

[1] https://www.pdl.cmu.edu/ftp/NVM/tmo_asplos22.pdf


> +1, why do we need to specifically proactively reclaim the compressed memory?
> 
> Also, if we do need to minimize the compressed memory and force higher
> writeback rates, we can do so with memory.zswap.max, right?

Here are a few reasons why memory.zswap.max is not enough:

1. Writing memory.zswap.max itself does not trigger any writeback 
immediately. For a memcg that has reached steady state (on which the 
userspace reclaimer is no longer invoking
memory.reclaim), after enough time has passed, the reclaimer has no good 
way to trigger proactive writeback for second-level offloading by 
lowering memory.zswap.max, because in steady
state nothing drives the zswap_store() -> shrink_memcg() path. The 
userspace reclaimer still has no control over when proactive writeback 
happens.

2. memory.zswap.max currently triggers zswap writeback via zswap_store() 
-> shrink_memcg(), and each over-limit event can write back at most 
NR_NODES entries. If zswap residency is far
above memory.zswap.max, converging to the target size requires at least 
O(over-limit pages / NR_NODES) zswap_store() events, with no batching — 
proactive writeback therefore has
significant latency.

3. memory.zswap.max is a stateful interface. If the userspace reclaimer 
crashes for any reason mid-operation, it may leave memory.zswap.max at 
some set value, putting the application in a
  persistently throttled bad state.

4. Once the userspace reclaimer has lowered memory.zswap.max, if the 
workload is rapidly expanding and triggers memory reclaim via 
memory.high / kswapd / etc., the actual amount written
back can exceed what was intended.

Thanks,
Hao
