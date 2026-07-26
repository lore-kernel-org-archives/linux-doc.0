Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E42FE060
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 02:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785033560; cv=none; b=d2c6mOTTFMSRiA4PLDmV+bFNJw9gYkw3JzLK3jl5ETpkk72HkkyiyH1pdQVf1zAFtkUurAExYXyXFFjITNuL1XuGtIGVDzmsg4ho1rJzNBEW7n9+3lGnKCeL/HmUBrxi3nx0KCVcZSTDGnvq8b/+X5ozozdNZOKStds6udlvLUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785033560; c=relaxed/simple;
	bh=RcEU889zGukc8WJKW192LY8xZpf6eS+gT9uL8AjBJQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnSPkyyGFX9418997xbpnwV7D4mBXYUMXkyd5JCjdSOcsloPfXOFkYm/VKDrkIFrjeqmpMKYRqhQ+Vsdv8z/e679TU9h5FZszBWpk3DAmEo2h7z/XroXYz7LlS1ysR7Ny0UMgwMoUH/JyPNPAEQkAyDucBy4h8/NkHVGOi3d6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m93mesJw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m93mesJw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceae1ed204so16725425ad.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 19:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785033558; x=1785638358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tW+wiTCoYSaXX59UFoOal4WDMR2PcNiHO7r7ABZvv94=;
        b=m93mesJwkHuYozb5B5tm6miA2tFsttfAkRg924XG9/bjO+wuzk41oHRRwKl1UVkRcx
         pF2QgOuf5n3BqhA3kV+9s4WhxgV3cZvYq5+zNFzL2MayRWCXM0Inqb5Nb3wFMepG8hkt
         Yqh2rwCIhynrKh4ZclckqyGTimujl2ejeqkS6B/NEbeGcUk57tjnFkE1LY50rku5lDkN
         tSTkjLqTNkTmp97M+KRJ8DM1CUeLAgqPM10oYrTLu8qF49fiDKjT58uCd/TcLEfMItV0
         br4LgXSrcQPzUxatEatu4eSbb2rZMme8Gg6t5VSYoSchF7WsMFycSOuqxN1fqH981dfs
         6DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785033558; x=1785638358;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW+wiTCoYSaXX59UFoOal4WDMR2PcNiHO7r7ABZvv94=;
        b=baLs1KQMIy1/gTplBA954i8osGAVxw82y/lQuuSqjbMQwPwzyMDoX3B+HDyRQjt7Y/
         B63vEy3tquYkIigKsLmazuii30NtIGIwyyodHAFqdENL1FzupmCfx+obHmKy69JjBmL/
         GhXzeFA0+PfOMSjDfx1jmy7uWfnyjfFZgZBMpQD2lWyEYRlkUQa0qFO3+Q1r1Vl/jrwt
         Z+4EPXXRwvuVIS0BC18Io25TSImXq1JbFzPd+todCwDJvuT9C0isBu84IpPC6zr5wqFv
         aav6kuNBq2hEcLU9V4lryZ2Vgm4YnFds0dX+OcRZOxa+By0AfG2N522J2OBntqTj4auc
         bLGA==
X-Forwarded-Encrypted: i=1; AHgh+Rqj4tsFLu4ntkAT+mKLGXvPDDy6XgOjCuGdOaVelbu8KwDGtBFC9xmhEBHpFxMZFg7sXS1dSl+r+1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9AH7NMIxekJ775DIkLj66RPeQGubSXkIrNyJ4uAq18yEvhHr
	O/Nhd8L87saOTNyBHBuJs4esfJqEh9qo7veajCF5s9TkaA7GHZ53S0yW
X-Gm-Gg: AR+sD11K9ujG10YjPtGnbMlrTO/wiSr7Ce4KkAV842WI3Kzj7EyHdh1Efw6Iuzv4aG0
	/GDTFBEncIpc+fFsoCd9Wt/unK6/u1qPz7OElU35LGx+Kq2bJla/gTXumPZURSPthzw+AVhKoJD
	xbc2GihQ+PJREsXuOcvDhNObv1pGUpoPE4bzODxVaUAcMQKjBGSbkj8zvt+wil/gsitgiBto5oC
	RjBg/9j5wz7HWVWVTfmYuEENNqN5E+6u/9T5XhnC4Ac/3oMbX4zcmemby46dZG5bK6TgUlnPU4U
	M7eXZYtUJBlZBRsuD+C3naoTHV93pkSwQmPN6IYxbEZrPYIAKLdsGIqoNIqvg37zpbJAcpPedU/
	KTNRgx9KIBG/aGTn8fmUbFs+pWpsNIVK32P0Fvdj4YDD33aRqEeTXeUOpq5a63CG3mWiLcRU/so
	N4HqR17Ty2bdt8cXPv2U2w0g==
X-Received: by 2002:a17:903:1aa7:b0:2cb:2b84:f431 with SMTP id d9443c01a7336-2cfde8a6856mr36446495ad.47.1785033558387;
        Sat, 25 Jul 2026 19:39:18 -0700 (PDT)
Received: from [10.240.225.60] ([114.111.24.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc585sm15263525ad.51.2026.07.25.19.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 19:39:17 -0700 (PDT)
Message-ID: <f60fe501-7605-64dd-0572-77f7f3060f35@gmail.com>
Date: Sun, 26 Jul 2026 10:37:50 +0800
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
To: Yosry Ahmed <yosry@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, tj@kernel.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
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
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zMgVmgQET+PUGexAgNqCZavA2YoTTXKSbWWoUv=A=ytSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/25 06:22, Yosry Ahmed wrote:
> On Fri, Jul 24, 2026 at 12:35 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>>
>> On Fri, Jul 24, 2026 at 11:39:41AM -0700, Yosry Ahmed wrote:
>>> On Fri, Jul 24, 2026 at 11:37 AM Nhat Pham <nphamcs@gmail.com> wrote:
>>>>
>>>> On Fri, Jul 24, 2026 at 10:57 AM Yosry Ahmed <yosry@kernel.org> wrote:
>>>>>
>>>>> The numbers generally look good, the store rejection rate is
>>>>> decreasing and we are naturally doing more writeback which makes
>>>>> sense. The store rejection rate actually increases when the batch size
>>>>> increases to 64, maybe aggressive writeback is more likely to fail and
>>>>> cause a store rejection, so that also makes sense.
>>>>>
>>>>> The only part I can't immediately reason about is pswpin. How are we
>>>>> reading from physical swap more than we ever wrote to it?
>>>>
>>>> The same page can be swapped out once, and swap in multiple times :)
>>>>
>>>> Unlike zswap, physical swap in is not necessarily exclusive. You load
>>>> the page in memory, but if the swapfile is not full, etc. etc. you
>>>> don't invalidate the copy of the data on the swapfile. At reclaim
>>>> time, we notice the page is not dirty, so we just skip (z)swapout.
>>>
>>> Oh right, I forgot about that, thanks.
>>>
>>> I still don't fully understand why pswpin is significantly increased
>>> with batching here. I would hope that with less LRU inversion we end
>>> up with less disk swapin. Probably the test access patterns are just
>>> too random compared to real workloads?
>>
>> Maybe more time in zswap for those tail entries left behind with the
>> smaller batch?
>>
>> That's a 32 entry window that could zswpin with the smaller batch but
>> pswpin with the larger one.
> 
> Oh I was talking about going from no batching to batch=32. pspwin
> increased by 387,400 (~30%). We are writing back 272,880 more pages
> but we also have 209,837 less store rejections. So overall ~ 63,043
> more pages should end up on disk, which doesn't explain the increase
> in pspwin.
> 

In my previous runs, I also collected zswpin. could the following 
explanation help account for what we are seeing?

Assuming stress-ng maintains a roughly similar memory access rate, 
batching flushes significantly more pages back to disk (meaning pages in 
the zswap pool are evicted faster, keeping zswap pool residency lower). 
As a result, when stress-ng accesses swapped memory, it is more likely 
to fault pages in from disk (pswpin) rather than hit zswap (zswpin).

In fact, zswpin in batch-32 dropped by 143,425 compared to 
baseline—which aligns with batching having a lower zswpin and a higher 
pswpin.

To be frank, under the Test Case 2 workload, we cannot strictly 
guarantee that the total volume of page reads and writes remains 
consistent across all three runs within the same time window.

                      baseline-cgroup   batch-all-32-cgroup 
batch-all-64-cgroup
shrink_worker wakeups       7,238             766                 367
shrink_memcg calls     12,059,142       1,961,194             983,878
written_back               28,277         301,157             327,997
zswap_store calls        1,349,572       1,168,190          1,114,549
    store succeeded           492,861       521,315           459,246
    store rejected            856,712       646,875           655,303
    store reject rate           ~63%           ~55%               ~58%
pool_limit_hit             510,130          50,096             57,715
pswpout                    884,989         948,032            983,300
pswpin                   1,251,268       1,638,668          1,878,453
zswpout                    492,861         521,314            459,245
zswpin                     309,631         166,206            84,977 <-

Thanks,
Hao
> The only explanation I can think of is that the test is just randomly
> accessing memory, so it ends up accessing colder memory that we moved
> to disk more than hotter memory that we kept in zswap. IOW, the access
> patterns do not conform to a "normal" workload that benefits from the
> LRU.
