Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B012BEFE8
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 01:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769704; cv=none; b=LwdAo9wWsxcEL8rPANLjKVA1gnvD1JGCRWZ/MU4YVxRdcpEIk4hMYeLJAkUOO9+acRiSdcyxGLFszq5Wa8LCxCkOdZ3HUdWfI/Nnz6LMp3YmXAitnSMjV34Pdv616DZSdN8nzmIOk+Eu2P8zNkxmzc0cDQhVkxdUft2Cn5lHrCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769704; c=relaxed/simple;
	bh=iEgRgLweARdYMWe7OfHFWTnuSW4hZWWSuYMaDP/0PKw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P3V6amXIJQU9oDUFG86rM/N5s0JDQtUXBZTPoh+MvQ9RCusQrauKLtABCa+fRkdIAiFOFcVL2ybx1IGToPSk5Rl7QETjYmqvzdENjBi2JTrhv11AfzC8BruupVUXVgJZRUQdkx14pp0QvRJoHzxPGalUiaVNrO4l8Nxjs9+uCHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9ac3uA+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9ac3uA+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so99372a91.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769703; x=1785374503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kjWq0EX3NUE2ngLrdLfPnZ0UVshpvVZocotK3ZKx2ZQ=;
        b=j9ac3uA+38am2Sw+MBpPQ3kuLO/1BVNJnVdFo9UCuzUzYYr2OdS53N67oHv6mMvW5g
         XOoGeaC7h+hvgBrKyHp6cTdUgQwgauo7SIZVNwVNAT9YHH2+qmC/t22jO69Wb0v++q1J
         aMliZyULndeMMivNjvZKKQv1rE9MjHKCuXOAhd/L/zhOsVjjeCvb+Tv75YpKjL95m/DF
         kKnuDM1reXxEpn/CTOhwmGwF0LomWlCh6hG1JIJrzX/SAmvvvjDg6ZqkfoVmBYd1Or1Z
         k1Fyv/GKiuYSIGm7HVJbavltcTRHq6eWNIS5yP/9HuID7le3sdbi4WJ6ve+ZF3UoKAKn
         l3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769703; x=1785374503;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjWq0EX3NUE2ngLrdLfPnZ0UVshpvVZocotK3ZKx2ZQ=;
        b=i+mb6Ylu7c6+gEJ2o1K7QqxgpC3WGdjSrdnTPnqK3ka0fyi7KpBKK/sNXatlmXPrL3
         AK3vvNoCGbZrqHy6Sk7WdNSzugnqDdp4SVagwdaUbK/ElfcoJTQOqBpqOz8An9W66Idq
         ZkGRUz/pBDuTdvQEaFO3EGr17fMcGQLTzmwBZAyyq0Xf8R1qovVVKRu63kqcZTO/9RNy
         /fGRz6IyhkflDs4t7GW96NfsvzTwei69wUAzcyo7qQj9S2A52XgsN9wDJtphUpBcmXfy
         YCBpkZUWSalSL3WsjuZYPNY0J62PVbgcxb3sPfHHRBkeF629eZPr6KGsR6/u0/THH7uP
         OALQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7TSOIpiRVQDYawMiF/AkdZMTNdxEY0riutaIbxkNN8SRFY3oGhW/GT1guyxGDeljUwynBFwHaTZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1qpPDF+4HevSU6moLWeLENIRmnmFbCzLaYML/RVWVroFrgdrn
	lsFCkw/i9QJ8L3NMuS+ioBsealhSvthKwWD4ceR4aMLMtXLKF5SKvyFJ
X-Gm-Gg: AR+sD13Df4HOS1KAvlRW8JrZcOxrGur408+t1Or98AXrKwjZAWut7OTOGRn+LvYA0KA
	v0Gpdum/Fb89zl+2Bl9J0Er5TeXCicBQOJw9VCv09mB1oLf69GLYe7ZBSu4kUMqNye7EbSJqbp/
	KyYeQ+4iOOZXEeFp70bUi1lwx0fqpI6AP4FRiluJsp97moWL2WoBDnsQxM0iWYKEtlsSfJV5Rag
	4RnyuJdqFyjla+A2cr2ZSUIHOlkv17teeHbxerr0Zj45U3wyIVtu6nckGpiJOu5N2Uomj0wCOkU
	jUvqYDjvaJHrCYZbUvLN4oqhk9qM+3sqVdRMfC3ILgAvCiHegacsy39jnkvw2TBuZrv1zglJM4R
	tXKt02fFCPW+jNY4vCQigCZJgMNXIh0feBuPwQGjDJAvCCIMNJe6AziQILwdMDqqcb4BQ1fuGj6
	lUYsK1yjVg3jG9AqBuNSqvw6rxhoM=
X-Received: by 2002:a17:90b:5241:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-38ec651c1f4mr1027418a91.16.1784769702664;
        Wed, 22 Jul 2026 18:21:42 -0700 (PDT)
Received: from [10.125.192.96] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea41f32fasm1418972a91.0.2026.07.22.18.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 18:21:42 -0700 (PDT)
Message-ID: <0a96b7ec-0d8d-2abd-afaa-739c562bc985@gmail.com>
Date: Thu, 23 Jul 2026 09:21:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global
 shrinker
From: Hao Jia <jiahao.kernel@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed
 <yosry@kernel.org>, nphamcs@gmail.com
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev,
 muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
 <CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
 <20260717214031.8b22e9a37ea3b0c564b466f0@linux-foundation.org>
 <7dbde343-fbbf-6a1d-1785-ebf9f5a04f6b@gmail.com>
In-Reply-To: <7dbde343-fbbf-6a1d-1785-ebf9f5a04f6b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/20 09:26, Hao Jia wrote:
> 
> 
> On 2026/7/18 12:40, Andrew Morton wrote:
>> On Fri, 17 Jul 2026 18:28:04 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
>>
>>>>
>>>> The [1/2] changelog lacks a description of how the flaw impacts users.
>>>> Please describe this fully and maintain that info within the
>>>> changelogging.  This info helps -stable maintainers and others
>>>> understand why we're proposing a backport and helps myself and others
>>>> with timing decisions.
>>>
>>> The first line in the changelog should be sufficient imo: "Zswap
>>> writeback on hitting the pool limit is broken when memory cgroup is
>>> disabled"
>>
>> "broken"?  Perhaps this means "fails to occur".
>>
>> But what is the userspace-visible impact?  IOW, why are we proposing a
>> backport?
>>
> 
> Perhaps the first paragraph of the commit1 message could be modified as 
> follows? I have added a description of the issues that occur without 
> this patch.
> 

Hi Andrew, Yosry, and Nhat,
Any thoughts on this change?

Thanks,
Hao
> Zswap writeback on hitting the pool limit fails to occur when memory 
> cgroup is disabled, because mem_cgroup_iter() always returns NULL. 
> Therefore, the global shrinker shrink_worker() always takes the !memcg 
> branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply gives 
> up, so it fails to write back anything. As a result, once the pool 
> reaches the zswap limit, every subsequent zswap shrink work run is a 
> no-op. This leads to zswap store failures, forcing pages to bypass zswap 
> and be written directly to the backing swap device, which can trigger 
> issues such as LRU inversion.
> 
> 
> Thanks,
> Hao
