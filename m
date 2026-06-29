Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF292765D7
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733027; cv=none; b=upNzSbzo/mgKV+8OXSi0JO5cLVqU29fJyXwWJs+l8kfw4cb4SmCv3WUze+y5+3DJ5XfoXC5RszpTbMT12KfseFNJmiUNJHu+LsP87tIrckz9FSHFAbBmLeUMqVQgOCFdKgxmI62ASANcQGQUklSDtSl7b2WFPTmdAa2uqb4lAp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733027; c=relaxed/simple;
	bh=iDCRbWuTzGPKPAF84DB5LVHydBbLuJ1mYtyMDohMEvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1qUjvuY+RvuLKvz8GqVzUBKWyWt2M28QcpiV6Qdgg41vby/2eALnXfcEC3CP9dDIMO7469FEOxk2RL56A+yPvsvGU/AHCuUZdggCFwLqsjYn5lQqyc1dyasH4fCD2s4BfNGhjaPfqE42FZYhYOQZOG+G3tgv+HfsZpV+nrl5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsPana00; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsPana00"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c7c61b5292so26939255ad.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782733026; x=1783337826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TUP1LM09mE01dTMgP9xd0rTmvGkZOWNWCmE4JCIidU=;
        b=AsPana006WgP+ITyLN0Bo8jugmTreaF/60l3Fre+/i/rOUOoHVdssghAiQg09Lggnh
         cU7xCHPETe9775Ic0SXmv0WQAVdXZGXQWZEzqYeldUY0MgB94MXebqE9nce6ROkiOou+
         6LbY5ftFFPV1jYDxYaeUXzg7bcxFzBRHuDH/1cJDlTpipeJNaiP6qO3VqN3V5Oanz+67
         Fg4Rr+lPep74EhSeIt0MuHPzkZzuD7ic3Stjj3ivlQHl4TTbBiXIE1KhfL7EKZAAZ6Uj
         BT9UCUZXJGenai/Ah/liEpO4nKxdsxLK3t6ki5LO6jnUhYek55hqFjhR3DTm3tuc4SMn
         yGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733026; x=1783337826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TUP1LM09mE01dTMgP9xd0rTmvGkZOWNWCmE4JCIidU=;
        b=e9uatQAq2ue+aYccVEUoca82jpT7DN0/RrMpMmc2iyb95yNpAVDoUG4tLdPfPM1LW/
         EslBz05eYnTYGnOayGvn3dzCWxTmkwMI5rX+n4dj7mhyDfw5izo0GELc0eVYB5TliILh
         X5unCj0iP4SJskVBY6L5lsyTlMsQeH13kZkPyW+XRu7v0H4B/xEbyFUUnHhfp2LSRJM9
         Qs0GofxyU4tHFgvVQvjTi05r2dSZeeRqjgCYHGz2/tQqxUCWNKCLL8nPt1fQ+YGmuyWN
         nrNvjIJjpgxuBOngp3fKan/PHY838PQ3SelqBgpiyVjgObqOdKysC/5D2mGKoc57MoIi
         wH6A==
X-Forwarded-Encrypted: i=1; AHgh+RpCfXPEVkXGyey5FZBXKm5ZzZu63K5qpJNjTT65SaXzLHFS2tGGPfC9A13fhIlOh/agvrQSzjYXO+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgbWrA6QNTeo/QHjJ4YXXpBck3/odhWC/NNKs1yyWIIcxExqv
	K1rDmLteClQc4JQHnq5IaBKMdnaKWm1sivJT25QDS5Ok1h3pqul7zokF
X-Gm-Gg: AfdE7cnhTkLgxtvYnCQjkUZIaCiqfqaSllh5GJhSK1utaGbjpuJS1+GVXejV5aFbuPt
	MIZrxCuzEZkgQse1fgY6FSh1E4/k3HAjsIgErzFESMFmNtKfBX/StIDATb5dPhNL45gDxYhXEZa
	uPb9towCninDinc5W/5XoKQVE7iHTczRrUM56DZ61U1nMhiNDUh4SaTs0+po5eRBtQrrKHJd7lJ
	zfn+lg8IYXAXxdUFpF8GQzEpXq6STYd8brCZVTz8QDOIyFmOIcfnerOLoyft459TVL8zqPBfJ8n
	uK9ZhBvNb7apsLvMTSJ8Id4xmPsA92qS5SdtGZhzEaGboEf6neD/vH1r4qSqXignQw7piTdm11i
	SqzUh64SIpO1a84nvCnzDMIYbWi1/+iwRHC70p2nnkL214xoRgLwblAMq/uoqMqUzSNxTskBdMG
	+fLvZmB/t3S8IQG+xqIhbKVCflU4t69kKM
X-Received: by 2002:a17:903:b48:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2c9e5ff9c0bmr40545955ad.31.1782733025674;
        Mon, 29 Jun 2026 04:37:05 -0700 (PDT)
Received: from [10.125.192.77] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b43af119sm43120405ad.48.2026.06.29.04.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:37:05 -0700 (PDT)
Message-ID: <db3b3d03-61a9-1c88-4e8e-c9319b048626@gmail.com>
Date: Mon, 29 Jun 2026 19:36:53 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/5] mm/zswap: Factor writeback loop out of
 shrink_worker()
To: Yosry Ahmed <yosry@kernel.org>
Cc: nphamcs@gmail.com, akpm@linux-foundation.org, tj@kernel.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org,
 mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-3-jiahao.kernel@gmail.com>
 <ajnGTt8tkbAWX8Oc@google.com>
 <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com>
 <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
 <91297bc0-268c-e9c2-57ae-6066eee5df2f@gmail.com>
 <CAO9r8zOYgjbuG5i+LrCcMK764nVpOS+muo-5Q45ZFdiVus-dTA@mail.gmail.com>
 <f1cd1ec9-48b0-1b03-0514-6c9958f3c77f@gmail.com>
 <CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/6/27 01:09, Yosry Ahmed wrote:
>>>> /*
>>>>     * Take one step of a memcg-tree writeback walk driven by the caller's
>>>>     * iterator, and fold the result into @s, the retry bookkeeping shared
>>>>     * across steps. @memcg is the iterator's current memcg, or NULL once
>>>>     * it has wrapped around after a full pass over the tree.
>>>>     *
>>>>     * The function returns -EAGAIN to signal the caller to abort the walk
>>>>     * after encountering the following conditions MAX_RECLAIM_RETRIES times:
>>>>     * - No writeback-candidate memcgs were found in a memcg tree walk.
>>>>     * - Shrinking a writeback-candidate memcg failed.
>>>
>>> Orthogonal to this patch, but I wonder if this can be simplified. I
>>> wonder if these two conditions can be replaced with "shrinking a memcg
>>> that has zswap entries failed". The "no writeback-candidate memcgs in
>>> the tree" case seems like we should abort right away instead of
>>> retrying?
>>>
>>> Nhat, WDYT?
>>>
>>
>> Perhaps something like the following is what you had in mind? I've
>> drafted the implementation below to make it easier for Nhat to compare
>> with the previous behavior.
> 
> Hmm I think if we pursue this it should be in a separate patch or even
> outside of this series, ideally with numbers/proof that it's not
> introducing regressions to the scenario that lead to its introduction.
> 

Got it. I will temporarily leave this part out of the current patch series.

>>
>>
>>>>     *
>>>>     * Return: The number of compressed bytes written back (>= 0), or -EAGAIN
>>>>     * once the retry budget is exhausted and the caller should abort the walk.
>>>>     */
>>>> static long zswap_shrink_one(struct mem_cgroup *memcg,
>>>
>>> Nit: zswap_shrink_one_memcg()
>>>
>>> BTW, the existing writeback logic has been broken for a while now when
>>> memcg is disabled. I think we constantly hit the !memcg case and run
>>> out of retries. Not sure if your patch changes this in any way, or if
>>> you want to fix that while you're at it :)
>>
>> Yes, I'd be happy to do that. However, would it be better to submit a
>> separate fix patch or combine it with this one?
> 
> A separate patch. Feel free to send it with this series to avoid
> conflicts, but probably as patch 1 as we'll want to CC stable on it.
> 

Done, and I've just submitted the v5 patch.

[v5] 
https://lore.kernel.org/all/20260629112032.20423-1-jiahao.kernel@gmail.com

Please take a look when you have a chance. Thank you very much for your 
review!

> [..]
> 
>> /* Track progress of a memcg-tree writeback walk. */
>> struct zswap_shrink_state {
>>       int scans;
>>       int failures;
>> };
>>
>> /*
>>    * Take one step of a memcg-tree writeback walk driven by the caller's
>>    * iterator, and fold the result into @s, the retry bookkeeping shared
>>    * across steps. @memcg is the iterator's current memcg, or NULL once
>>    * it has wrapped around after a full pass over the tree.
>>    *
>>    * The function returns -EBUSY to signal the caller to abort the walk when
>>    * either of the following occurs:
>>    * - A full pass over the tree found no writeback-candidate memcg.
>>    * - Shrinking a writeback-candidate memcg failed MAX_RECLAIM_RETRIES
>> times.
>>    *
>>    * When memory cgroup is disabled, the iterator always yields NULL. All
>>    * zswap entries then live on the root list_lru, so NULL is treated as the
>>    * root memcg and shrunk directly rather than as a completed tree pass.
> 
> I think this chunk should be moved above the code returning -EBUSY
> when mem_cgroup_disabled() is true, and probably made more succinct as
> it should be obvious.

Done in v5.

> 
>>    *
>>    * Return: The number of compressed bytes written back (>= 0), or -EBUSY
>>    * when the caller should abort the walk.
>>    */
>> static long zswap_shrink_one_memcg(struct mem_cgroup *memcg,
>>                      struct zswap_shrink_state *s)
>> {
>>       bool disabled = mem_cgroup_disabled();
> 
> No need to store this in a variable AFAICT, it's a static branch and
> it's clearer to just call it directly in both call sites imo.

Done, and I've just submitted the v5 patch.

Thanks,
Hao
> 
>>       long shrunk;
>>
>>       /*
>>        * If the iterator has completed a full pass, update the shrink state
>>        * and check whether we should keep going.
>>        * With memcg disabled the iterator always yields NULL, so fall through
>>        * and shrink the root memcg directly instead.
>>        */
>>       if (!memcg && !disabled) {
>>           /*
>>            * Abort if no writeback-candidate memcgs in the last tree walk.
>>            * Otherwise reset the scans count and continue.
>>            */
>>           if (!s->scans)
>>               return -EBUSY;
>>           s->scans = 0;
>>           return 0;
>>       }
>>
>>       shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>>
>>       /*
>>        * There are no writeback-candidate pages in the memcg. With memcg
>>        * enabled this is not an issue as long as we can find another memcg
>>        * with pages in zswap, so skip without counting it as a candidate.
>>        * With memcg disabled the root LRU is the only target, so we should
>>        * abort if it has no writeback-candidate pages.
>>        */
>>       if (shrunk == -ENOENT)
>>           return disabled ? -EBUSY : 0;
>>       s->scans++;
>>
>>       if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
>>           return -EBUSY;
>>
>>       return shrunk;
>> }

