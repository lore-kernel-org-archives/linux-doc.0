Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE632FD69E
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466460; cv=none; b=q+qCIOrEOBuSp9sxFPqTEJxsZw8rAWQh79/HCFJYw809K/fS0yIlQ6KZ8KDNs08XnXsco6akhITBJREcOgUbE9cL7aYsYMdJVnMke2RsQtmdMXH3bmNx9VmJB6v94h/Lv2bOdtMjNQ6jmeUMZt1c4ey2eybWjWZbSI1XnSCdIqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466460; c=relaxed/simple;
	bh=TDzI4dOQQiK4WNVfl1/D8Y+N505lEh6TcCSCINCHuqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8rt+rppJYxTlOfSvk8VY0s1RuiTLKIvZX7BKKu8ElG+9sNGBIT5aABtqkKMl9Us76P5gXycw96+Xx8QFAJewpQXibmwvEJ/fkd7g2b929QtEp9onS7WUR0jbD1Uo6ghYQn5oLmBYGgrG03VmOMVePHo1Y+51kyFM1zeYYfGpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuY9FohE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuY9FohE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c818fe1f24so2554645ad.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782466456; x=1783071256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6q0TWmjkzL+X7mudBOsj/WPO6I7LcjT/WtCR6sSA4M=;
        b=OuY9FohEK6pJtGGGsMHtvDDv+iIL44K4FpEVRYZAV8KAM6CqPasnJ6hYQuPm7aqX1i
         0rWPRHIx2NOlZEQx7ZExVaXnwcVYSxkbUx5frcHFGX1zJHEefTrxHf4rJ3cTOL9JvmHZ
         5psTeCGXDKYEnPRo+3Yqvi7ti08QJtSMQ/DJAEIKRxmwU5gdmb2IDsP0+ndQu1EnFmfE
         J/B2jWOg9MLdzUUsZaYuDrLhm5VSIWw17DEDgEJPzN+jVugTpgnXombhe2/RWBI7m22v
         n7TFJAA5IVuVB1xpFMJmiLlc9NqZVtiGzlauiCeS0nLKxdcHAka5jUDHCz7qzuZPGX3l
         iYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466456; x=1783071256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6q0TWmjkzL+X7mudBOsj/WPO6I7LcjT/WtCR6sSA4M=;
        b=bGMmoUyI2UUmo3phrwiKMqaf5+ISCuqNKLEzxma+91MD7yuLq+MMAhPVrIk82f1M/J
         PkzmnBuT2NOzsEGM8deLCxDzmrM+5UnxwbSvG7LdjSxW3f9KwvF2VNv6fMWnLDfPmCWz
         zJXU3VDEGkKEi7UIZMovX8a11xbWMsPJf2UylruSs7aqbk5zvPlmGWNE+OVxg/4TS4aN
         I1GXCutZ/q4BSpcNBAu2KOWtCHsKVfTKPGG7VPE4Yc/lVMNCnJ6Iuqg9NpwZmduJhjq6
         Ryy1fRo23FlGUonRtfKXnxcKg57MMLHtCDFhqBKxWMel0Pd72TJ0NviP+7Gm+E47x0Dv
         cIMg==
X-Forwarded-Encrypted: i=1; AHgh+RqmU9fljsYRdyHNYunwiCJIgpPWhoKBF+zG/x2LxWCz9IEmK4OIPAifjQjpcbcCWWEPrB3EQ6v9w1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJMhY37MlcfsaaXEb4pgpVaNztNQJtGFBqkmXekAKYR2eK/c6
	kkvZrhEEuzFgTIiTicrjP88ovL6IKrwoJ9yDXWC5HNqHncnah/gP24TM
X-Gm-Gg: AfdE7cmT/6cMM1V5kvXYXSsK4X6ktOETC84mUZTlIpYotDEAkQES5nXfDHfKgvH3td4
	/e38UTQbDDpWledEGltjbe03VKu6ESt975K8OowKsu1iCeQ+1S97BKVD+/k1869XV9DGUS8dK22
	V9mnTgEu2GvAfH//RnJhfjpTrAHIdJz4H3KW/6pRblTO0v1djXXLnNudcOKBvnv+3tYO6C7Tayf
	p59pehQv6ZDgyBy8ypw7E81ROi/wxvWwU9v913a7TCHEhqWehhGr/6EYeI4XQHFxKVkWaztg84Q
	7OkVUUB7p1NsiPaS0Apt31MkURVK7eftg74e8uRZ6L8Y6ru1wJOaNPPRul0HgH9m9crbsYCmOyt
	XKrQJo1Lcd/PCWDl0jTdBIOsg3JcOlCqUXK5bb1gHL3DPQZb9jqyGfVak5KPCNuSZ4WZMg3JOGd
	rNcEkI5EohaGkc9Xr5dPPYyf+K7I8dames
X-Received: by 2002:a17:903:946:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2c7c400fd16mr121554335ad.26.1782466456241;
        Fri, 26 Jun 2026 02:34:16 -0700 (PDT)
Received: from [10.125.192.89] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f65082ddsm35597065ad.78.2026.06.26.02.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 02:34:15 -0700 (PDT)
Message-ID: <f1cd1ec9-48b0-1b03-0514-6c9958f3c77f@gmail.com>
Date: Fri, 26 Jun 2026 17:34:05 +0800
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
To: Yosry Ahmed <yosry@kernel.org>, nphamcs@gmail.com
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-3-jiahao.kernel@gmail.com>
 <ajnGTt8tkbAWX8Oc@google.com>
 <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com>
 <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
 <91297bc0-268c-e9c2-57ae-6066eee5df2f@gmail.com>
 <CAO9r8zOYgjbuG5i+LrCcMK764nVpOS+muo-5Q45ZFdiVus-dTA@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zOYgjbuG5i+LrCcMK764nVpOS+muo-5Q45ZFdiVus-dTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/6/26 01:59, Yosry Ahmed wrote:
>>>> static long zswap_shrink_one(struct mem_cgroup *memcg,
>>>>                     struct zswap_shrink_state *s)
>>>> {
>>>>        long shrunk;
>>>>
>>>>        shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>>>>        if (shrunk == -ENOENT)
>>>>            return 0;
>>>>
>>>>        s->attempts++;
>>>>        if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
>>>>            s->stop = true;
>>>
>>> Do we need 'stop' or can we just return a value here to indicate that
>>> we should stop (e.g. -EBUSY)?
>>>
>>
>> Perhaps we could return -EAGAIN instead of -EBUSY? This would align with
>> the semantics of the memory.reclaim interface, which returns -EAGAIN
>> when it reclaims fewer bytes than requested.
> 
> Hmm but -EAGAIN tells the caller to try again, while here -EAGAIN
> tells the caller *not* to try again because we exhausted all retries?
> 

Okay, let's go with -EBUSY.

>>>
>>> I think splitting the shrink/retry logic over 2 functions makes it
>>> more difficult to follow, so yeah I think fold
>>> zswap_shrink_no_candidate() into zswap_shrink_one(). Then the callers
>>> only need to iterate memcgs (depending on the context) and call
>>> zswap_shrink_one() for each of them.
>>
>> So, something like this?
> 
> Yeah, something like this :)
> 
>> /* Track progress of a memcg-tree writeback walk. */
>> struct zswap_shrink_state {
>>       int attempts;
> 
> While at it, I think "attempts" is really the number of scans, right?
> Should we rename it? Maybe "scans" or similar?
> 
>>       int failures;
>> };
>>
>> /*
>>    * Take one step of a memcg-tree writeback walk driven by the caller's
>>    * iterator, and fold the result into @s, the retry bookkeeping shared
>>    * across steps. @memcg is the iterator's current memcg, or NULL once
>>    * it has wrapped around after a full pass over the tree.
>>    *
>>    * The function returns -EAGAIN to signal the caller to abort the walk
>>    * after encountering the following conditions MAX_RECLAIM_RETRIES times:
>>    * - No writeback-candidate memcgs were found in a memcg tree walk.
>>    * - Shrinking a writeback-candidate memcg failed.
> 
> Orthogonal to this patch, but I wonder if this can be simplified. I
> wonder if these two conditions can be replaced with "shrinking a memcg
> that has zswap entries failed". The "no writeback-candidate memcgs in
> the tree" case seems like we should abort right away instead of
> retrying?
> 
> Nhat, WDYT?
> 

Perhaps something like the following is what you had in mind? I've 
drafted the implementation below to make it easier for Nhat to compare 
with the previous behavior.


>>    *
>>    * Return: The number of compressed bytes written back (>= 0), or -EAGAIN
>>    * once the retry budget is exhausted and the caller should abort the walk.
>>    */
>> static long zswap_shrink_one(struct mem_cgroup *memcg,
> 
> Nit: zswap_shrink_one_memcg()
> 
> BTW, the existing writeback logic has been broken for a while now when
> memcg is disabled. I think we constantly hit the !memcg case and run
> out of retries. Not sure if your patch changes this in any way, or if
> you want to fix that while you're at it :)

Yes, I'd be happy to do that. However, would it be better to submit a 
separate fix patch or combine it with this one?

> 
>>                    struct zswap_shrink_state *s)
>> {
>>       long shrunk;
>>
>>       /*
>>        * If the iterator has completed a full pass, update the shrink state
>>        * and check whether we should keep going.
>>        */
>>       if (!memcg) {
>>           /*
>>            * Continue shrinking without incrementing failures if we found
>>            * candidate memcgs in the last tree walk.
>>            */
>>           if (!s->attempts && ++s->failures == MAX_RECLAIM_RETRIES)
>>               return -EAGAIN;
>>           s->attempts = 0;
>>           return 0;
>>       }
>>
>>       shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>>
>>       /*
>>        * There are no writeback-candidate pages in the memcg. This is not an
>>        * issue as long as we can find another memcg with pages in zswap. Skip
>>        * this without incrementing attempts and failures.
>>        */
>>       if (shrunk == -ENOENT)
>>           return 0;
>>       s->attempts++;
>>
>>       if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
>>           return -EAGAIN;
>>
>>       return shrunk;
>> }
>>
>> static void shrink_worker(struct work_struct *w)
>> {
>>       struct zswap_shrink_state s = {};
>>       unsigned long thr;
>>
>>       /* Reclaim down to the accept threshold */
>>       thr = zswap_accept_thr_pages();
>>
>>       while (zswap_total_pages() > thr) {
>>           struct mem_cgroup *memcg;
>>           long ret;
>>
>>           cond_resched();
>>
>>           memcg = zswap_iter_global();
> 
> Do we still need this helper? Or should we just keep the memcg
> iteration open-coded?

Done.
> 
>>           ret = zswap_shrink_one(memcg, &s);
>>           /* drop the extra reference taken by zswap_iter_global() */
>>           mem_cgroup_put(memcg);
>>           if (ret == -EAGAIN)
>>               break;
>>       }
>> }


/* Track progress of a memcg-tree writeback walk. */
struct zswap_shrink_state {
     int scans;
     int failures;
};

/*
  * Take one step of a memcg-tree writeback walk driven by the caller's
  * iterator, and fold the result into @s, the retry bookkeeping shared
  * across steps. @memcg is the iterator's current memcg, or NULL once
  * it has wrapped around after a full pass over the tree.
  *
  * The function returns -EBUSY to signal the caller to abort the walk when
  * either of the following occurs:
  * - A full pass over the tree found no writeback-candidate memcg.
  * - Shrinking a writeback-candidate memcg failed MAX_RECLAIM_RETRIES 
times.
  *
  * When memory cgroup is disabled, the iterator always yields NULL. All
  * zswap entries then live on the root list_lru, so NULL is treated as the
  * root memcg and shrunk directly rather than as a completed tree pass.
  *
  * Return: The number of compressed bytes written back (>= 0), or -EBUSY
  * when the caller should abort the walk.
  */
static long zswap_shrink_one_memcg(struct mem_cgroup *memcg,
                    struct zswap_shrink_state *s)
{
     bool disabled = mem_cgroup_disabled();
     long shrunk;

     /*
      * If the iterator has completed a full pass, update the shrink state
      * and check whether we should keep going.
      * With memcg disabled the iterator always yields NULL, so fall through
      * and shrink the root memcg directly instead.
      */
     if (!memcg && !disabled) {
         /*
          * Abort if no writeback-candidate memcgs in the last tree walk.
          * Otherwise reset the scans count and continue.
          */
         if (!s->scans)
             return -EBUSY;
         s->scans = 0;
         return 0;
     }

     shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);

     /*
      * There are no writeback-candidate pages in the memcg. With memcg
      * enabled this is not an issue as long as we can find another memcg
      * with pages in zswap, so skip without counting it as a candidate.
      * With memcg disabled the root LRU is the only target, so we should
      * abort if it has no writeback-candidate pages.
      */
     if (shrunk == -ENOENT)
         return disabled ? -EBUSY : 0;
     s->scans++;

     if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
         return -EBUSY;

     return shrunk;
}

static void shrink_worker(struct work_struct *w)
{
     struct zswap_shrink_state s = {};
     unsigned long thr;

     /* Reclaim down to the accept threshold */
     thr = zswap_accept_thr_pages();

     /*
      * Global reclaim will select cgroup in a round-robin fashion from all
      * online memcgs, but memcgs that have no pages in zswap and
      * writeback-disabled memcgs (memory.zswap.writeback=0) are not
      * candidates for shrinking.
      *
      * We save iteration cursor memcg into zswap_next_shrink,
      * which can be modified by the offline memcg cleaner
      * zswap_memcg_offline_cleanup().
      *
      * Since the offline cleaner is called only once, we cannot leave an
      * offline memcg reference in zswap_next_shrink.
      * We can rely on the cleaner only if we get online memcg under lock.
      *
      * If we get an offline memcg, we cannot determine if the cleaner has
      * already been called or will be called later. We must put back the
      * reference before returning from this function. Otherwise, the
      * offline memcg left in zswap_next_shrink will hold the reference
      * until the next run of shrink_worker().
      */
     while (zswap_total_pages() > thr) {
         struct mem_cgroup *memcg;
         long ret;

         cond_resched();
         /*
          * Start shrinking from the next memcg after zswap_next_shrink.
          * When the offline cleaner has already advanced the cursor,
          * advancing the cursor here overlooks one memcg, but this
          * should be negligibly rare.
          *
          * If we get an online memcg, keep the extra reference in case
          * the original one obtained by mem_cgroup_iter() is dropped by
          * zswap_memcg_offline_cleanup() while we are shrinking the
          * memcg.
          */
         spin_lock(&zswap_shrink_lock);
         do {
             memcg = mem_cgroup_iter(NULL, zswap_next_shrink, NULL);
             zswap_next_shrink = memcg;
         } while (memcg && !mem_cgroup_tryget_online(memcg));
         spin_unlock(&zswap_shrink_lock);

         ret = zswap_shrink_one_memcg(memcg, &s);
         /* drop the extra reference taken above */
         mem_cgroup_put(memcg);
         if (ret == -EBUSY)
             break;
     }
}


Thanks,
Hao
