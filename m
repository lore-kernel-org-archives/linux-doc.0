Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57BC346E6C
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312079; cv=none; b=Bg3a6nBBgM7rpnP1wasxK9y9OjR3YczIgre7pqMSxFbV+izNB7uGvdtreIOAEd+ygDOg9izwAsCUiVizpceQzt//8eXVeOUsVryDEsOiqkZakRLrcKFPDdt3askYIqTBTT4RkqLJ+8jV9Qf08FGedb1rMqejY+kvc0E8lvPFiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312079; c=relaxed/simple;
	bh=rcUHPa2Utkg2qJhsQAPGPqiFCC8vSAwthtAZw8HMx0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqmRtaYOqUDUmKWGSWy4v33BQUeOwZb2sooJxvFJEkuqNQGyrv5k16xaG8Vo2+4wpNEtohPs0Wk+RahmwGeN6u8gvlJO3sR3aMnwhfLW78nybGhEcVenwD0K4CnPbRvtvk5gbl3vvKWI+UmOEeUYXxzHueZM43oB8ZyZITRDFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJU5S+cl; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJU5S+cl"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso828803b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312078; x=1780916878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tMRr0555UkSJVpwevwwfR/bu9FaT1rWJqjveLdcveY=;
        b=pJU5S+clkHKm2xT0spxPXWej3z9/XozPb81eCUvJQdPnOZoZmt/8jdVtla3CUYZl39
         hGszEu9Zlzw4NH8gEfmL4Xs4GYxAO4WM9bldkwDgIXJMBCKkCKROfVlFAcHo0Y/GEOo8
         KODpkulcdM0kTEyh45wBj26QujY/vLzad6NkOzGKvnPMSGsaUa5GZOWQQ4oK7B1lScC2
         6dWbBml8ag4wJf6XQdcOBKXi4tNUridWTP7HJiGpYylBgDx0JTNj6l6L2GiWjlLnex+d
         +sCxJ1x71sGERjmlfEGFjHkrZMo+VoSDl0uV3ERoUWojLHCGvqWL82BRr5180NIuUXdA
         Luew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312078; x=1780916878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tMRr0555UkSJVpwevwwfR/bu9FaT1rWJqjveLdcveY=;
        b=pMIbr4PIkiRI7YXio8+edq2O0cOyi/j6LKgP6nJQZVHujA0iTkcqSHyYb01St2VfLf
         w70HHGt2qNXbM0cU/JmW6iIJCxB1P1TiB8sm8tTQe7g3qf4ls0T6wWG+jcuSsf/COzNs
         Zl0tTm3YGeDJEFeL53iU8yleJZiOb+NUwfCQkbXzssqW3qBX+lIpE/ABgJZOQpVSWigX
         EuXEa8plMcZokNGAz4vHyLLG1aV03Sw6LZamWGM+t0p2/ESPc2b3hevjCjOit8UVtQsV
         bWx0Oh3eaC3fFFQBlLMXy5kPTAKrppXNscCzk/j5sKhVSSNnGaQRLeYl1KbcCzFTSD1B
         yDCQ==
X-Forwarded-Encrypted: i=1; AFNElJ99fH0BS/DJ+mBDoZHUPKPQEgjv/zCFTqoes5Wn+28vEZ5FVNOO6y77dM+gQ8IgHuiq7vp9ypnPR4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmndJxsiLCxpR/RgbMKnGT55VzOW/osY8QUIXzwAn+Y7VYcnfa
	EAOWt/ks2kdGTUJp4r2wYYtLGzZKoq/B3qmbxpK377Qp+Cp6ncnfXxcV
X-Gm-Gg: Acq92OG82QZ7GxfUO+n6hgn1qlI+9Jcq22z48zUhqyK4jMLX0UWudOgVQawWy2nlb+W
	/q6Xr4NzGO22KanHejp2bRZWHy/yCaRxelJ/+qtZplpyxOrWxqVPnD7S02ftbYj0LVhN0OHLMoO
	bACbs4mEV1UtPITxxgm7Sq4ZJet8m5qtRywNRgdFs7TuoyFXLm4BRwCrBB7vBEsH0wHwoxEASzm
	0+H8pAvSU3gnIwL0HFcv0mLLsGjgisjCJKyIffb6Sc06f6TI8W7tQkDEUDwyVxqsbHG+NzZ9GTA
	foC+D4apaheacUZWOp75h0Ikd2VizaLf1+mgt1ADR9Ft7RmLDHDLPw9982DTnYuSpz5IEMbfIlC
	maZEYOBZ4EP+Q7xINUu9pImTWWsHhM/gha+DaxHDpF0Da0xjSzYX4DfInrO3Uk0kIqOJFwf5b+K
	u8jApyihXRNuQ7K6TBSg5+mK18k3ryb9RO8XgSaxs1K7dfbktGDb7h8wQ99HjPP64T
X-Received: by 2002:a05:6a00:190f:b0:842:4612:55f4 with SMTP id d2e1a72fcca58-84246127062mr5297173b3a.31.1780312077721;
        Mon, 01 Jun 2026 04:07:57 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce9cebsm9839131b3a.52.2026.06.01.04.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 04:07:56 -0700 (PDT)
Message-ID: <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
Date: Mon, 1 Jun 2026 19:07:45 +0800
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
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <aho7nepN5jZtKmef@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/5/30 09:24, Yosry Ahmed wrote:
> On Tue, May 26, 2026 at 07:45:58PM +0800, Hao Jia wrote:
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> The zswap background writeback worker shrink_worker() uses a global
>> cursor zswap_next_shrink, protected by zswap_shrink_lock, to round-robin
>> across the online memcgs under root_mem_cgroup.
>>
>> Proactive writeback also wants a similar per-memcg cursor that is
>> scoped to the specified memcg, so that repeated invocations against
>> the same memcg make forward progress across its descendant memcgs
>> instead of restarting from the first child memcg each time.
> 
> Is this a problem in practice?
> 
> Is the concern the overhead of scanning memcgs repeatedly, or lack of
> fairness? I wonder if we should just do writeback in batches from all
> memcgs, similar to how reclaim does it, then evaluate at the end if we
> need to start over?
>

Not using a per-cgroup cursor will cause issues for "repeated 
small-budget calls" cases. For example, repeatedly triggering a 2MB 
writeback might result in only writing back pages from the first few 
child memcgs every time. In the worst-case scenario (where the writeback 
amount is less than WB_BATCH), it might only ever write back from the 
first child memcg.

Similar to how memory reclaim uses mem_cgroup_iter() (via struct 
mem_cgroup_reclaim_iter) and the old shrink_worker() used 
zswap_next_shrink, we need a shared cursor here.


>>
>> Naturally, group the cursor and its protecting spinlock into a
>> zswap_wb_iter struct, and make it a member of struct mem_cgroup to
>> realize per-memcg cursor management. Accordingly, shrink_worker() now
>> uses the lock and cursor in root_mem_cgroup->zswap_wb_iter.
> 
> If we really need to have per-memcg cursors (I am not a big fan), I
> think we can minimize the overhead by making the cursor updates use
> atomic cmpxchg instead of having a per-memcg lock.
> 

Because mem_cgroup_iter() always calls css_put(&prev->css), we cannot 
simply update zswap_wb_iter.pos via cmpxchg() after calling it. Doing so 
could lead to a double css_put() issue on prev->css.

Therefore, if we switch to the cmpxchg() approach, we wouldn't be able 
to reuse the existing mem_cgroup_iter() logic. We would have to write a 
new function similar to cgroup_iter(), and its implementation might end 
up looking a bit obscure/complex.

Currently, this lock is only used in shrink_memcg(), proactive 
writeback, and mem_cgroup_css_offline(). Note that shrink_memcg() only 
acquires the lock of the root cgroup, and mem_cgroup_css_offline() is 
unlikely to be a hot path.

So, should we keep the spin_lock or go with the cmpxchg() approach?
Yosry and Nhat, what are your thoughts on this?



>>
>> Because the cursor is now per-memcg, the offline cleanup must visit
>> every ancestor that could be holding a reference to the dying memcg.
>> Factor out __zswap_memcg_offline_cleanup() and walk from dead_memcg up
>> to the root.
> 
> Another reason why I don't like per-memcg cursors. There is too much
> complexity and I wonder if it's warranted. If we stick with per-memcg
> cursors please do the refactoring in separate patches to make the
> patches easier to review.


Sorry about that. I will try to keep each patch as simple as possible in 
the next version.


Thanks,
Hao


