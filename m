Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713D2459FE
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108544; cv=none; b=Zm2yO168DMzntQ6NnR56ONs7mjr2mVD1Vjox3lJ4Gxw5cHsWk7YhiosuIJkI/RTU6l8rsWdZtKNTD7853rAagWLTIQqkrrLkgm9V5qirPrKVxtThyjvxRLLn5nMLp+FYpeuuOrOaYbqIQCTfWowMrWdzotRVjGDub8iFn9g83BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108544; c=relaxed/simple;
	bh=j0ghxMbYr8jEJoTKNvaw8fBGWbXTL00SNTBGLV/dx4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFpAwkXLNqa2F1ZhO4ZCX7o9CySynPvL2iKcVSFO0OkrZoiIMK4gVapnsXVVTK2i+Kte0Ium2rjkS3UIVsLknH5McStWUXUxZ6nMHqMGGBEjr7Z4VMBfVoDyRh4+CkLM2EHCTWG23vyozxvWYjQWJ7BU5Xsu904U43es/h0afAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuAAO3Nr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuAAO3Nr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso44490775ad.0
        for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782108543; x=1782713343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDyp+nco3B5NIcQm8dnJlrIpz1rH5PTwVnURehE3SCs=;
        b=RuAAO3Nr6EVZvmLj/sNqT8L9jtsGeCKWKeakxoq+ewTPtOu/pYMb6HLcBD8/zj4eSo
         Q6UZiZs/oYNN4+ioaUy/j03NqnQxcsAyTiRhG8NXCtFVbdNS2znpciO0rQQT2XlTlSZb
         TPCKNY9Nlwk/iD+ZXuGwa8ds1RNdFfnSufjRZ8ByVRnh7CGD+lDv5sLBOc2IR1Tvbtif
         ad2lOdQ4tUM0d97qOdwzScYrP1wE2Co3BNdynCn2BXjFOLiFZDHQQA6ClBSEwrj5AWWQ
         V3ASiuoQSOs3Qsr2jSkoK6LK/EJwXeCL14mI4m5WoOF8c4wMHdBHXyOG5ZJ639q6ckrp
         Lmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108543; x=1782713343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDyp+nco3B5NIcQm8dnJlrIpz1rH5PTwVnURehE3SCs=;
        b=JKDGh9vlBG0aTyZ9PlBY5An1zPpBB52V4DJq3aURbUU+ljaM7skE+YEbjn6e5slaRO
         5xW+XR7E4OR6d2qF+CPniPAOc9l75yT5TapmzQjRdFnjb2R1vh3bs14D4OCeh9+kEivv
         7K+ymglCvMAU/N2Tf8LCiMspd9eyd5d6ZafHEMd6KyzYPrmEy8RqPgzLQ96twOAMUWH/
         gBOIwJ/WKp+IRlXGpxVlQyniX5iJ3vU7SZiLvJC0acNpv9LVS5T0gsvS86o+vAm8myw/
         rI0+5UYOJyyM8ujxdmVSbzSekc6Qj0GFgMXMOPqLSAx5o1/NlW4tGZasZLbqRrQoYkfP
         VdaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc0JYFwWxeJPP5FFxTNdT2YnCB0UKwzeuOiQnlV/JhwjB/YlyqLPfogyvxqo3MQUxDNsnr1dhBv3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW8QzHeUyEmXZpWZc7uFfPooKhb8U4jHaA+tkEyOUrmnXgiAXS
	0RKEp5H+vHai+VcnbAZUhXWdLuAhO1ax/3xvRceZfKbfyL16Au9Uwrol
X-Gm-Gg: AfdE7cmjRJyePsLqtdYf1YTDAqg6U85BitqKh4BReF8F5AboRhcQLclRRkTjEASZOs4
	LmjptOJXzcXyYya873PuGP30u3o/tJ05Ip8ZGK8c/8MksbXl4KM3UkzWU0WykruBcX7ZcS6WBUF
	lqNWjVm61y3yNrA6UDoSbLRd6nhrRIrqkpjlwXx2Jiapa6Fu0Fr9R8oXigJw6p10VCObJIWdEo8
	4hn+djzcmv5VgUUNKR8sQ6yP3o3vllfMXxEIA85n++V9NKdQMOypxuhTt0sFP1P3YXOrD8sTHjy
	Mxru8I1i2Dsf3zrBlDt7FcPI1FaoyDV3qisd5PzEt9FWmMZ1h6vzNss751Y6rJjAzM7+arKIqk3
	DZfbFhXMSjCdhuGaHyC58ZAtqMd/Af2u9OSgwtesZgHPfAh3AkK01T/348V/I+DdHqVFJHkmcGv
	hGHaJUu1ibbm19XURy106KjTgrihLUfvBk
X-Received: by 2002:a17:902:db0c:b0:2bd:8dbb:293e with SMTP id d9443c01a7336-2c725bf2b83mr132353945ad.14.1782108542643;
        Sun, 21 Jun 2026 23:09:02 -0700 (PDT)
Received: from [10.125.192.89] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f6395sm67323825ad.28.2026.06.21.23.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 23:09:02 -0700 (PDT)
Message-ID: <26a034b3-9cfa-e4f5-eea1-e69fbfff02b4@gmail.com>
Date: Mon, 22 Jun 2026 14:08:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 0/5] mm/zswap: Implement per-cgroup proactive writeback
To: Muchun Song <muchun.song@linux.dev>, youngjun.park@lge.com,
 yosry@kernel.org
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <CAAAF57B-7DE9-45EA-8AB6-DE6CFAF60F47@linux.dev>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAAAF57B-7DE9-45EA-8AB6-DE6CFAF60F47@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/21 12:20, Muchun Song wrote:
> 
> 
>> On Jun 18, 2026, at 12:48, Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> Zswap currently writes back pages to backing swap reactively, triggered
>> either by the shrinker or by the pool reaching its size limit. Although
>> proactive memory reclaim can automatically write back a portion of zswap
>> pages via the shrinker, it cannot explicitly control the amount of
>> writeback for a specific memory cgroup. Moreover, proactive memory reclaim
>> may not always be triggered during a steady state.
>>
>> In certain scenarios, it is desirable to trigger writeback in advance to
>> free up memory. For example, users may want to prepare for an upcoming
>> memory-intensive workload by flushing cold memory to the backing storage
>> when the system is relatively idle.
>>
>> This patch series introduces a "zswap_writeback_only" key to memory.reclaim
>> cgroup interface, allowing users to proactively write back cold compressed
>> data from zswap to the backing swap device. When specified, this key
>> bypasses standard memory reclaim and exclusively performs proactive zswap
>> writeback up to the requested budget. If omitted, the default reclaim
>> behavior remains unchanged.
>>
>> Example usage:
>>   # Write back 10MB of compressed data from zswap to the backing swap
>>   echo "10M zswap_writeback_only" > memory.reclaim
> 
> I’m not entirely sure if other candidate names were already brought up
> in previous discussions, so my apologies if I'm repeating something here!
> I do think expanding memory.reclaim is a great approach. That said, I
> was wondering if we could make the interface a bit more concise while
> keeping it flexible for future extensions.
> 
> Essentially, what we want is to control the specific targets of the reclaim
> process—such as file, anon, or zswap. What do you think about using
> something like "source=zswap"? For instance, if we want to reclaim 10M from
> zswap, the command would look like this:
> 
> 	echo "10M source=zswap" > memory.reclaim
> 

Thanks for the suggestion. TBH, I personally think your approach makes 
more sense than "zswap_writeback_only".


Hi YoungJun and Yosry,

I am not sure if this suggestion from Muchun could decouple zswap 
proactive writeback from the swap tiers, or make it easier to migrate to 
swap tiers in the future:

     echo "10M source=zswap" > memory.reclaim

For now, we only specify the source. Later on, the swap tiers feature 
could extend this to control whether to demote to SSD swap, HDD swap, or 
other tiers.

Thanks,
Hao


> If we only want to reclaim 10M from file pages, we could easily extend the
> syntax:
> 
> 	echo "10M source=file" > memory.reclaim
> 
> And of course, we could even combine them down the road:
> 
> 	echo "10M source=anon,file" > memory.reclaim
> 
> to only reclaim anon and file but bypass zswap.
> 
> Just some thoughts of mine.
> 
> Muchun,
> Thanks

