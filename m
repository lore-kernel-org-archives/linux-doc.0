Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88847DD47
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578417; cv=none; b=fHqi2vLq/O4/Xpf9vhbXmWcePXFzrxUSVyZcEAVa3AgUcyufSN/b1zq/9csPWWji4Q7W6+TCLP7dTVyb+dA5zmZZz1Eby676sYuksaudl/OUBEZEEqYIocsTMn3HJ+NQHuWK9yMgokNVFogxN0dBj8M+U+l2Lcw/LLzqP0ylr9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578417; c=relaxed/simple;
	bh=wRbCF69wlx67VwicjostQ42SihvIU2JiEg8O7U3Nwyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZ16/NFHFkmzbAMzYAOP7uN5LORAS5ltolao990GPwxrLoDiqbRxBuOkUawuYiBVLYuYI2S+M4FnEaI2ZmBfSLtKShUz7bj5YgnzuBSTJv8SfwfWgDs6zO4q3VMdWFOPcRaV5VI72+L529TKFTEJFkLfwXIz7uwtlXxuGUstenM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1ts5vak; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1ts5vak"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so343837a91.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 06:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780578415; x=1781183215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/V6RPepsyqoQUt2D3lkrhZmC+vMiyf2WaK9hrkxCm4=;
        b=J1ts5vakIYSwW7lGar4RSiIYRA6yKQkJvTCaeGuiFHGWM235fn8ul3kNp/CpYx+Vh3
         DTNsJxgCvd7ub8MJAHC8884ys5ZSTzxbq/hv7RJTHMwPxNg3WlIsFjaw327KeykrL2+A
         Rq3tNntFtFR1ZFS5HaU+h8TvooTvkW0Y9jsYAcmiV2Fjb1mxM1XOesRCd/OW+dojaUne
         9MsTGgUiY5A6sEyRsprLph4EV8E9KEdmsSO/HwgdtyPo8Nqg4mR8V5D2tbsAq6fHFKH0
         uFTZnORdn3VMa+oFkPbfIqduKHf2yk5gFN83wjDV3cQpBXHhvN9QkTiH9xPD0gydXTQw
         w84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578415; x=1781183215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/V6RPepsyqoQUt2D3lkrhZmC+vMiyf2WaK9hrkxCm4=;
        b=PdD8Rdo4wNgrePxlY+hETLWXuLxUT9WtxPN8nucfgJbPh9vqqEhfHqhYA8W6rany0B
         yEd76Dyy9iwllWANVj9nQoVkTRlqDnekHSQ9hL7cQG1GwwGf1PSmi/dXEUChqPehWcOT
         9Yn3uZyHH6xQ/0nnCnu53EikLkxVHpoWnLcf5oyBK/lYGfY3fsNLewHL3tit154ns9u1
         XbXDmI3gXzXzqt3ouQ23AjzrD++yJ0H+/pdcI3F28bONGq4y4pA6jRTiRebCicPaWIbp
         eBiYEz2gWnXe5WemaNC83QH/qfrASElpgKVVlU4Qe/mb+584nVEU092Wy49qdiNQro4j
         x99A==
X-Forwarded-Encrypted: i=1; AFNElJ/SU0HfeC6USeS54zz7bx0sT93G+nWPAZYulXcfyqUi7np9Doed2Fvn93fMq5Br1irAjQS1/cbAuZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9tvZQIkRB4mz5Uy4rN1CkkREPuf40dxAduC1pdbkhgqqCaLFk
	6935cBX3YBOfzRpJa5/kqd52hSbeZr1nbBwPfI0wZwhj9Gqy2mM2dgtE
X-Gm-Gg: Acq92OFHROnEacnWRc4mr5D/hyly09pOJb4ut8i2C5J+4vTjldP7BGcRb9nwmP518Eh
	HN+YrWnnH2tV+y8Xqv2nOFYzNBLbtKKznMgRiwDE5eIOVvqJkyG/bPcxpFcbZa5zQ5fcQi8VHDo
	JVMneisJ8gDFqpKREDkCmow3bffKd+mULfFZbmd75MOZ2NxDxf2Kj6+6ZyKAtVleIkZCL8JppQx
	RamaCuqkfWXvzuV9g9NibBO5YlO/mt4JNRymQoh9oj7DCiJDnNLpYfInHZCK1Q18wTcYXVXKLhr
	CV/7DSExW1awAgsxd5dRTaWyRI1HSKxX0S+3Lq/hHCpSHB/kyWzNjAqMDeKOhLIJmwOSIIQZ9ht
	Q0FUbJMx4r7nY/vg3G9KShTdZW8g+jXhGJm6l9yZj9/UJK7n0ImT/a0oeMSUFoRmnhfgFTwhhwS
	pbrPsATzIbBV955WBaAnhloAKZg/Hh57xxvmzUEoD55Q/nzMQ87A+HSw==
X-Received: by 2002:a17:90b:2d8d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36e32288dc4mr8152975a91.16.1780578415000;
        Thu, 04 Jun 2026 06:06:55 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm3942710a91.4.2026.06.04.06.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:06:54 -0700 (PDT)
Message-ID: <a60eedb6-f3fd-4092-b726-04a17a695ace@gmail.com>
Date: Thu, 4 Jun 2026 21:06:43 +0800
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
 <9898f83d-fae9-e284-6b85-c7f4089840a0@gmail.com>
 <CAO9r8zPBH6-0SQ6-_ZOhTQeyu=rz4F=ugikCrU-JR_skm6fEWA@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zPBH6-0SQ6-_ZOhTQeyu=rz4F=ugikCrU-JR_skm6fEWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/4 13:34, Yosry Ahmed wrote:
>>>> For instance, suppose a parent memcg has two children, memcg1 and memcg2,
>>>> each with 200MB of zswap (100MB inactive). Triggering proactive writeback on
>>>> the parent memcg will exhaust memcg1's inactive zswap pages. After that,
>>>> even though memcg2 still has plenty of inactive zswap pages, it will
>>>> continue to write back memcg1's active zswap pages. Writing back active
>>>> zswap pages causes the user-space agent to prematurely abort the writeback
>>>> because it detects that certain memcg metrics have exceeded predefined
>>>> thresholds.
>>>
>>> This will only happen if the reclaim size is smaller than the batch
>>> size, right? Otherwise the kernel should reclaim more or less equally
>>> from both memcgs?
>>>
>>
>> I gave it some thought. Not using a cursor could lead to unfairness
>> issues with certain writeback sizes:
>>
>>    - If the writeback size is an odd multiple of WB_BATCH (e.g.,
>> triggering a writeback of 3 * WB_BATCH), with 2 child cgroups, the
>> writeback ratio might end up being 2:1.
>>    - If a memcg has 5 child cgroups and a writeback of 2 * WB_BATCH is
>> triggered, it might repeatedly write back from only the first 2 child
>> cgroups.
>>
>> Although setting a smaller WB_BATCH might mitigate this unfairness, it
>> could hurt writeback efficiency. Let's just use per-memcg cursors to
>> completely fix these corner cases.
> 
> Exactly, the batch size should be small enough that any unfairness is
> not a problem. I would honestly just do batching without a per-memcg
> cursor, unless we have numbers to prove that the efficiency is
> affected when we use a small batch size. Let's only introduce
> complexity when needed please.


If you prefer not to use per-cgroup cursors, do we still need to keep 
the global cursor (i.e., the root cgroup's cursor) zswap_next_shrink?
I found this part to be quite tricky when trying to reuse the main logic 
of shrink_worker() in zswap_proactive_writeback().

Of course, I think we could also keep zswap_next_shrink and write a 
small helper to check if it's the root cgroup, allowing us to use 
different memcg iteration methods.


Thanks，
Hao
