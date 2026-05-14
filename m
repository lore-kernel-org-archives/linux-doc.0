Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083DC34753C
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746554; cv=none; b=mp598Vmfd0Gr0wsFNmfUA6PFGH5Kc1TcgeyrZSUOr8X9ij1Oz1qVv53n1sShIyw4ZBDJ4WU0DqjO+crWkuIxUrLXUk9EXjAvW529KBvB1h1UUgIWPgA4/2vSzX7U+50nFT4tSHO4HNfj6FQZ/Zja4ZSXNVWm9qDDuFwt1ootWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746554; c=relaxed/simple;
	bh=7Z/NwcymrhYIiU3OiOkmhZfTp/A7Ppd2eX4VhsjVR7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6nTyS7gYfMykacB+QlyCsrDN+rUl6s42K3GRW3d1Vx6w0zAfE3poSjyjSjUQVXa2vj6ata0XLp4koHkWLRAf2q9BIGIrwvTS7p9xRWvWJc/Jch6gKPQlSWGur3SsFB9UHFJI0nHnHC31PpCYD3Fh4AtA/Op/XBsaMJBawd/6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saaYkCvq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saaYkCvq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-834f1075805so5377335b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778746552; x=1779351352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUhzM6fW54CIjEhJ1LOogiKkg+75ePaMhcH2tPJszfQ=;
        b=saaYkCvqTfKdAPuezCypyErIsnKn+TOOSUu4Ccn3j0cxGHW1do7AR/tIAj1y46KInO
         ZLh7VxSw8M2XEYFD8qSYJSVwN4Hhz6vdC1qvOLP4Rl5eZsxTvOYymVgbD3/F0ig4zpUc
         SmbF78sxZZqLlF6iOY/13EM8LJq0/xKwnJ+m63lq48EbUBBqrAZUlslGoNLJv26SD17t
         zeuenmWvVANHYFr0rxQJAUULltF5dK+BKMs5zAAehNtUdnVjxyhB8GigCWjb8cj1w8zH
         /gcsvmrxsSAeAGcq6Ryt4L53nBYPUe1iUBNzNdBMbLg5YXdyxPgpxTUO2I02JBcUOqhl
         NJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746552; x=1779351352;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUhzM6fW54CIjEhJ1LOogiKkg+75ePaMhcH2tPJszfQ=;
        b=how/KFfXpjQ3WDvl4UlInePQk1uGDxOQRLV8yGczbRkYAeptDetHy6AQ0CsqPkNtWx
         w1sgMywkJ7e0k8Es62P5qnPLGi/T0I8MjmwRPl5FogXnrdVWEDJeHE1k08aBtGGfZ0rl
         ZoTRqw1Lqp0Zg1DHmsjQJ2+jkiazy1ss7Cg86Ct9fnSJsl5kySDLn8D44DRsumdveTmH
         bjRC2gYKIY6rVfrh1ZbH/pj/Gx6/fV+G2uDNePSszmVKcMtkLter1S7RruDOu67RzOBf
         481xwCwYJq9vuaPFH3WP4H6r6kN61oTOf7pzHXAKw5rlTgxznb2QLa08wYnl3cv2Mbmq
         jQpg==
X-Forwarded-Encrypted: i=1; AFNElJ9GXInm7XyziwWwWItA9/OT2A6J/lPC4WJuL92fBVJwp32ucTRS81Ui2+frXK9eFtFdEKtlicazPZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJE0UPPeHV6naU1FSepfqedcot0BHUsvvjSDTMy4hGzLCtOljz
	6c5FV8v79GTjqpl2jD1lrViFSxkBk7VaHFN/NA569p4VnmK4L3eQorQb
X-Gm-Gg: Acq92OFDRHSkJx0CNfBTk4fZ8puC+YngApRq+Qrn+9hL2u9c7qQkz1iwSXr0zoavXRX
	j27/lTHHi7fVZhe7XhAqdSVewC+VA7ya6W/TIUb+Y+6C7LKwSeLiYpWFMdeq9vOcpyKZHjM7lSW
	r2IveV5c2/XV/a6O3/cEPVWwzmTKncHT7o0FmK/w1ChiZrtaNx42qYBX0QXc449rAhPnBHkRDBa
	pN8sEWbSZ8EF5ezxM+yiRq64cl7KNXTbII2MSOzGwAQeENixJiB3Nss+GJk6HSHUEGsTzbC7Rv/
	GkscBXwIt2ykqYbJ2nHzy6jjc99SH5d2mfFa4vhJF0wGbHjvp5P2plRTSl58q2CmEJ/pypA81dQ
	0/jAD4ef2fKatk87XMpX4NDJ1P2N5eTzgH2xRcciGguBj3DcNAxEN7iM483U9NMnk3mUlXGKhv0
	HRMEoWGmK657/vt9nvGiaZuhE8FvFmj+z6FGJoXvzR25g=
X-Received: by 2002:a05:6a00:2192:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-83f0546c39dmr6362403b3a.19.1778746551489;
        Thu, 14 May 2026 01:15:51 -0700 (PDT)
Received: from [10.125.192.65] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977c494sm1854182b3a.21.2026.05.14.01.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 01:15:50 -0700 (PDT)
Message-ID: <6c531b1a-ab35-e5a3-b9ca-40a639cca55f@gmail.com>
Date: Thu, 14 May 2026 16:15:38 +0800
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
 <6fc7fdf0-368c-5129-038e-623f9db2aa88@gmail.com>
 <CAKEwX=M=6AQVYA7ROM0YOP7irpxbdMrEOAHKGKYo0Qgr+-uhSw@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=M=6AQVYA7ROM0YOP7irpxbdMrEOAHKGKYo0Qgr+-uhSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/14 05:09, Nhat Pham wrote:
> On Wed, May 13, 2026 at 1:04 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/5/12 23:47, Nhat Pham wrote:
>>> On Tue, May 12, 2026 at 2:32 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2026/5/12 03:57, Yosry Ahmed wrote:
>>>>> On Mon, May 11, 2026 at 12:49 PM Nhat Pham <nphamcs@gmail.com> wrote:
>>>>>>
>>>>>> On Mon, May 11, 2026 at 3:52 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>>>>>
>>>>>>> From: Hao Jia <jiahao1@lixiang.com>
>>>>>>>
>>>>>>> Zswap currently writes back pages to backing swap devices reactively,
>>>>>>> triggered either by memory pressure via the shrinker or by the pool
>>>>>>> reaching its size limit. This reactive approach offers no precise
>>>>>>> control over when writeback happens, which can disturb latency-sensitive
>>>>>>> workloads, and it cannot direct writeback at a specific memory cgroup.
>>>>>>> However, there are scenarios where users might want to proactively
>>>>>>> write back cold pages from zswap to the backing swap device, for
>>>>>>> example, to free up memory for other applications or to prepare for
>>>>>>> upcoming memory-intensive workloads.
>>>>>>>
>>>>>>> Therefore, implement a proactive writeback mechanism for zswap by
>>>>>>> adding a new cgroup interface file memory.zswap.proactive_writeback
>>>>>>> within the memory controller.
>>>>>>
>>>>
>>>> Thanks Nhat, Yosry — let me address both comments together.
>>>>
>>>>>>
>>>>>> We already have memory.reclaim, no? Would that not work to create
>>>>>> headroom generally for your use case? Is there a reason why we are
>>>>>> treating zswap memory as special here?
>>>>>
>>>>
>>>> Apologies for the lack of detailed explanation in the patch description,
>>>> which led to the confusion.
>>>>
>>>> While we are already utilizing memory.reclaim, it does not fully address
>>>> our requirements.
>>>>
>>>> Our deployment runs a userspace proactive reclaimer that drives
>>>> memory.reclaim based on the system's runtime state (memory/CPU/IO
>>>> pressure, refault rate, ...) and workload-specific
>>>> policy. That first stage compresses cold anon pages into zswap. Entries
>>>> that then remain in zswap past a policy-defined age threshold are
>>>> considered "twice cold", and the reclaimer wants
>>>> to write them back to the backing swap device at a moment of its own
>>>> choosing, to further reclaim the DRAM still held by the compressed data.
>>>>
>>>> This is the "second-level offloading" pattern described in Meta's TMO
>>>> paper [1]. zswap proactive writeback is what this series introduces to
>>>> address that second-level offloading stage.
>>>>
>>>> [1] https://www.pdl.cmu.edu/ftp/NVM/tmo_asplos22.pdf
>>>
>>> Yeah that's what we've been trying to work on as well :) We are
>>> working on a couple of improvements to the mechanism side of this path
>>> (cc Alex) - hopefully it will help your use case too!
>>>
>>> Anyway, back to my original inquiry: I understand your use case. It's
>>> pretty similar to our goal. What I'm not getting is why is
>>> memory.reclaim (which you already use) not sufficient for zswap ->
>>> disk swap offloading too?
>>>
>>> Zswap objects are organized into LRU and exposed to the shrinker
>>> interface. Echo-ing to memory.reclaim should also offload some zswap
>>> entries, correct? Are there still cold zswap entries that escape this,
>>> somehow?
>>>
>>
>> Yes, the memory.reclaim path does drive some zswap writeback, but
>> it is not enough for our case.
>>
>> 1. For a memcg that has reached steady state (a common case being
>> when memory.current is below the policy target), the userspace
>> reclaimer may not invoke memory.reclaim on it for a long time,
>> and so no second-level offloading happens through
>> memory.reclaim. In this state we want
>> memory.zswap.proactive_writeback to write back entries that
>> have sat in zswap past an age threshold, to further reclaim
>> the DRAM still held by the compressed data.
>>
>> 2. Even when memory.reclaim is running, the fraction of zswap
>> residency that ends up reaching the backing swap device is
>> still very small for many of our workloads, and the userspace
>> reclaimer has no way to participate in or control the
>> granularity of zswap writeback. So in our deployment we prefer
>> to leave the zswap shrinker disabled, decouple LRU -> zswap
>> from zswap -> swap, and use a dedicated proactive-writeback
>> interface that lifts the writeback policy into userspace where
>> it can evolve independently of the kernel.
> 
> I see. It's interesting - we've been dealing with the opposite
> problems (reclaiming too much from zswap) that it's refreshing to see
> the other end of the spectrum :) We should invest more into this to
> see why we are not reclaiming enough, but I see the value of adding a
> knob to hit zswap exclusively.
> 
> Regarding age-based reclaim, I agree with Yosry here. Let us try to
> land an interface to do targeted reclaim on compressed memory first. I
> do see the value of age information: with it, you can track zswap
> entries ages and the distribution of refault ages, and only reclaim
> the tail. However, I wonder if you can just build a system that adapt
> the reclaim request size based on PSI, refault rate etc. similar to
> how you're adjusting memory.reclaim on uncompressed memories with a
> senpai-like system. Something along the line of - if we are swapping
> in too much from disk (or if IO pressure is high), back off, and if
> not, stealing a bit more from zswap pool (perhaps with a bigger step
> size), etc. Is there a reason why zswap cannot adopt a similar
> strategy?

I'm not sure, as we haven't tested the case of tuning proactive zswap 
writeback without using age. As you pointed out, age provides a 
deterministic target that allows the userspace reclaimer to converge 
faster in a closed-loop, which helps avoid performance jitters.

That said, using age as a zswap writeback parameter indeed warrants 
further independent discussion. So I'll remove the age-related parts in v2.

Thanks,
Hao
