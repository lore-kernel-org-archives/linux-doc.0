Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7831F992
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784168494; cv=none; b=TX12s6z7YYjtG70m8pOainE6l3LQmZcWeQew/Qc917hy9EEfPTGPwFsMgexL5HIiWjIpkqeQ2HQfxzPc2+yqDAFAWx32SEiKltMaqxxRNYEY0iGyxDw55Wr2wO70AxHG+0TA1+xtGLoUvnsnnNXWWuK5QjQTj8AxvSkarPT/N5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784168494; c=relaxed/simple;
	bh=4xnAas/mNVP8Dx0YmUY95pU1rpf60kqOtiatCadZ/LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sH/1gLn75ZmkQ/4JhJeHq9j2LaMyBF3urxvn57pZTyfGoYLuYuU1A0AkYLJ0mZ2lo9/Lr+HCH/80eWCHyXk9hfbceIo4HiHYsybsOSO7aeHVnE1WaDTixN+hnHqmT90tnKFDa39BX04oHFWbJQ6tl3wtQjw97HxLqVEkEeIjMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUlOuah+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUlOuah+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381ed661712so6521700a91.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784168492; x=1784773292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hEDMeStux/KKDKh9A+CKQwEHTpzd0skTIZYkeBHU1Ew=;
        b=mUlOuah+9/NZ8kbceCHa04FhwXAqj6h7+OMKY9WX9ix1XarDnIvxYe9eO8O6da4F1c
         itnaPJu3N0qHo/Pk3Cb5jmI+GBZW+PSackISqMw0iWccViXjd1bITFnK/k+pA3EA8arN
         B1xjMOs+6iR4qqyD8ASBqI7wTig0q3IYRP3rKRrIS2QFtzzXQHoKGzaqBU2zBhqdFkTK
         vZWiYdGC/q1+ElQvrw1ONbA0tzVh4x6H0oUPlHSU/LRuCM36dVJgyAJNYnSbBETG8Rzq
         GRvGif8I7g9Syx1dRoUEnJGuKia1RAB4dVi7LsCuqvwHssgobIPg5UD7brUlZhgmo4fU
         LDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784168492; x=1784773292;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEDMeStux/KKDKh9A+CKQwEHTpzd0skTIZYkeBHU1Ew=;
        b=DvUlzmfR72/QniGzb+blN5jYqLL9zDPdlchnFX496MGuKwfkzwRAFRSpVoQe8DXs1z
         gRutkhrcgfyjL7G64gNQi5M03XGbP2V9YUA8IYmTsfzyDOYfEI9QQtWqYGJ/eHyVfIUy
         hqi7g+S5764MiKGJgz6lvgkkIvJeHHphcgnOcqoiSPIN4cu6IW/hD2NgsTvB4uGLxpLf
         Wq5HlLqCZ5HuvRuEy9TcNkgLiT+OfNsdMGV2w3Lt+hzU8Y+g1U8OK0pWvoM1tMH3lVDt
         p8YNDhmocs8czuzS4bckQ80dmLAiKdDrStC1SRNn230fV/Ixz3pZ/eZ3/MIIzDGWSZbT
         8R/A==
X-Forwarded-Encrypted: i=1; AHgh+RrTxcjmjXWd/2SObxIzfOmhV3pFL4x7KNBSAwfpLyNsyyMWWAlEOhFSrx2y2rQCy2/+1XwAFH8ir1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7TeyWDMLNwdHeR1RPmPmGA5LQMrWXuI7Bj7twWidzvwSx16A
	i+u/fHZwYtcaSX5Jmt2riTlc4CpWayUnYwZrOaXc3Qhx4Xg60w9QxnbM
X-Gm-Gg: AfdE7cmzT3JrN9wlZ/HQjTe/XReV/UKlIIqkMXLFIjj8kPHsBmaUuzmPRR9LcCgXYZZ
	tue/8VgRvJDVxcYRmlWgahJ1FwG1iqXs8aWpqiPrsM9OxYrvN5WRNh3XYdIUC8ZpTp8q4bF8WLl
	YBZXT4PTAM7qQU8UC51ZF8BJlSK6D61NwlwOpzN+Lxp79BeqKuyHfZYgVKnPyzU5h9544TGI/KY
	mEmPYEJDIbqk4lpm4FShMTjE7MVkyJI7jNxew5OVjC50I+IQLJg8FfNFMx/nbi2/D/WWtucZCb+
	SHchSWT6ffvCwTkDkgKm5Lae5JWFwmr8pt2NoqIuA/JlAFuzvJOMhTODHz53uO0O5qcxlHwMBrw
	grEn+h4i4NrR75aEwYHDKCkXdv5xiZd3q9iW2PXuh6ZsYwUK871rS5GhcJq0BK7x3C0LGwPeFxE
	oKqjU1BTblv0EiunjKKrbuMJr+TC0to/bK+g==
X-Received: by 2002:a17:90b:3c43:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-38e1ae56689mr8553199a91.17.1784168491732;
        Wed, 15 Jul 2026 19:21:31 -0700 (PDT)
Received: from [10.125.192.114] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a100753sm459147a91.13.2026.07.15.19.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 19:21:31 -0700 (PDT)
Message-ID: <7b35fd4e-7662-10ae-159b-303350e4e59c@gmail.com>
Date: Thu, 16 Jul 2026 10:21:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] mm/zswap: Fix global shrinker when memory cgroup is
 disabled
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, nphamcs@gmail.com,
 tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev,
 muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-2-jiahao.kernel@gmail.com>
 <CAO9r8zM5nzDqNcx5UoDgGexvR6jf8MmJV9SomM4AS7n-rZ2o5Q@mail.gmail.com>
 <20260714193129.f81711f516504b659d544741@linux-foundation.org>
 <7a1fe347-7ca6-4768-9308-420bf1251f54@gmail.com>
 <CAO9r8zMDndmoxi_XvQv3rkkhCfb+aW3=8JdE3gAv2YOKiyiFSA@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zMDndmoxi_XvQv3rkkhCfb+aW3=8JdE3gAv2YOKiyiFSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/16 00:13, Yosry Ahmed wrote:
> On Wed, Jul 15, 2026 at 5:31 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/7/15 10:31, Andrew Morton wrote:
>>> On Tue, 14 Jul 2026 09:52:59 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
>>>
>>>>> When memory cgroup is disabled, mem_cgroup_iter() always returns NULL.
>>>>> Therefore, the global shrinker shrink_worker() always takes the !memcg
>>>>> branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply gives up,
>>>>> so it fails to write back anything.
>>>>>
>>>>> Therefore, when memory cgroup is disabled, fall through with the !memcg
>>>>> branch and shrink the root memcg directly.
>>>>>
>>>>> With memcg disabled, shrink_memcg() only returns -ENOENT when the root
>>>>> LRU is empty, which means the total pages are already below thr. The
>>>>> loop then safely bails out via the zswap_total_pages() <= thr check.
>>>>> For any other return value from shrink_memcg(), the loop is guaranteed
>>>>> to terminate, either after MAX_RECLAIM_RETRIES failures or once the
>>>>> threshold is met.
>>>>>
>>>>> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
>>>>> Cc: stable@vger.kernel.org
>>>>> Suggested-by: Nhat Pham <nphamcs@gmail.com>
>>>>> Acked-by: Nhat Pham <nphamcs@gmail.com>
>>>>> Acked-by: Yosry Ahmed <yosry@kernel.org>
>>>>> Reported-by: Yosry Ahmed <yosry@kernel.org>
>>>>> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
>>>>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
>>>>
>>>> Patch 2 doesn't really depend on this one, right?
>>>>
>>>> If that's the case I think this can (and should be) picked up
>>>> separately as a hotfix. Andrew, WDYT?
>>>
>>> Please update the changelog to clearly describe the userspace-visible
>>> effects of the bug, thanks.
>>
>> I am not entirely sure if my understanding is correct here, but maybe I
>> should add something like this to the commit message?
>>
>> When cgroup_disable=memory is used (or with CONFIG_MEMCG=n), the global
>> shrinker fails to write back any pages. Consequently, the zswap pool
>> fills up to its limit and rejects further storage, preventing memory
>> pressure from being offloaded to the backing swap device.
> 
> I think you can simply write that zswap writeback when the limit is
> hit is broken when memcg is disabled.
Will do. Thanks!

> 
>>
>>> Also, AI review has flagged several possible issues, all appear to be
>>> serious:
>>>        https://sashiko.dev/#/patchset/20260714081510.16895-1-jiahao.kernel@gmail.com
>>
>> For AI review comments on this patch:
>> I suspect this scenario might only exist in theory. For zswap LRU to be
>> empty while zswap_total_pages() > thr holds true, it would require a
>> prolonged state where there are always more than thr zswap entries on
>> the zswap LRU whenever zswap_total_pages() > thr is evaluated, yet the
>> zswap LRU happens to be empty during shrink_memcg(root_memcg).
>>
>> If we want to fix this, perhaps we could do something like this?
>>
>> Yosry, Nhat, what are your thoughts on this?
> 
> Do we need to do this? The last paragraph in your changelog explains
> why this can't happen because zswap_total_pages() should be 0 in this
> case. Did I miss something?

The loop would require the following sequence to repeat indefinitely:

1、zswap_total_pages() > thr evaluates to true.
2、During shrink_memcg(root_memcg), the zswap LRU is concurrently drained 
to empty.
3、Before zswap_total_pages() > thr is evaluated again, the zswap LRU is 
heavily refilled such that zswap_total_pages() > thr holds true once more.

For our case to manifest, it would require zswap_total_pages() and the 
zswap LRU state to repeatedly hit this exact window with perfect 
alignment over a **prolonged period**. Therefore, I suspect this 
scenario might only exist in theory.

Thanks,
Hao
