Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474413451D6
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302351; cv=none; b=c4UZ11BmAc6/MhPhEIvQfXj9dpGTA+5KMFuQ8P60HUVDwCSOOs+fXwjb04SFycOikYbvm57Vw5NHQ88uBHOG7JSw5PHNjzxm56Nk//7fxndPw9O2ePbrCCP9g5UsgdDFAe8vYQ/oAh2sC/fSmFJNdvdIsL1cRIbHrtnmNfxTDP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302351; c=relaxed/simple;
	bh=ccQClhBTGN46P6fOnR9FdT0qUVPVTjjdYvY9i2Z/p0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geO7Ksuc7QlyixaZHAuX8Od1fdlnWS6yF7RbV8i89+XsFf9CFc7Eq6njgNRS3D7xJVqKAXwnY3FTA6Yi1EyvvJpYZ0dOkZjmIU59IU0OEAjA5TDx4vuLCdUO2BAlfwuvN+Dpl41Sf02WTq4ROgm97/b4f+rv2QCnCEeNt1xOegU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gu3LBpGk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gu3LBpGk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37cae11ba85so701157a91.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782302349; x=1782907149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcnLe+6H7fb08Bv+rWkSEkyMo+WogFkYHLdym+VtEGk=;
        b=Gu3LBpGkL33LgOqQsMS8o0NrdX0krXusnSZr0BZTd8jioYl9fuN8mSF79eJnrESzWt
         /HkTuG9mDxlHlXRYgjJr38XDBRV73glL9qO0OH6EKgq+2BmkhvM+O6tjaAA+i5v2jZCk
         1NJK39Hc0PnjNcqtswO6Ea84US0XJ/8TJH/ow0rZZKZ6zvXurEdSZfEEYz6pVJ5l5RY8
         7lVGClBwQZBEGX2yP0+f++Eh5zhjKDWTdoy8ubtUJOFl7be4R4gUxhEKhxEIU9Of6Dsn
         A7iYNun64ia+jJLGxaB8E4+ZrdYfQ6CtjunuKFXnFLEZTfrH950wW3oYyYk3f7my+o4N
         pX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302349; x=1782907149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcnLe+6H7fb08Bv+rWkSEkyMo+WogFkYHLdym+VtEGk=;
        b=c1cKP2v7jgQMXCn7osz0H/ZbtZpmy177t1wpu6YwXAhXabNu83Atblu9NISKar7d4W
         TVV1/fqgX4AD6Tf+AhZ9m8ZWYyTawKEm5iBOX/G1LGD8jMy/6Ugzb0rPSvuybn66IGEL
         UcF2SZ6aGpx6xJXmGxnXUQAdyIiZ+n8pb/0NuoHKHUnDkwujh/2P4f8e1jwMEx3H687c
         eGPEOJQyah085AhKObAJ6wsq2hyM8NPu+6FdJjBBIeVRFQ/KxAKGYhSYmzdoG262opwd
         YW4yZcNCNEOTpgOJBzVGbRwau30PjwWP0Jfpfs7lpRJFgoesn54R31bWtKzfcLKzHSvU
         8ndg==
X-Forwarded-Encrypted: i=1; AHgh+RpnV+Awo7+yB13XXUwgWOmW37FlShUG5gBFVF5b+I3uaxicuYcWw5R3LcLo86y+tTCUVAd5gS/l4n4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pwG8+GKVWrBTrawuDCTcw/fR6Uvz5bj8bLfKGegPwvHadgGf
	WgMvxrGCPOn1YYm5SnVGFeiPhoGDs8QJmT6FOop0KmMkqPmevJ8XJAce
X-Gm-Gg: AfdE7cmd7L/O7u/bLiBqSBUmEImpzGnfF+eVv4jQ+u3p0xsIcmuafkKvbo1iAFjdJCN
	l74Onep0b+BtmcLMbI918HgXbsZb+x2x0OTBhmCGY/kXFed4ok5CBee8YnaRnaKEMUB8jDA52Km
	mLz8vSjfybNaZRtob/FEHVo+UpC0F2srFIXW75+wW6XUsrCf4OAntmKjGp6GRXwhY4cW1qNgRg0
	cTvJGG9j2Y6+EcleSW6UK3AQ4JmOnomEVY4lqZA1v2LsH621Mt5TsZKvw8bVKPxJRDbu0KO4q3u
	LhQz1Cnu+CtNJgBo/FNsjrx6rM/WFSXWY9QNH6FycOjCiqJ6/F1SqVSzRBGZywJyggcipu4gp9F
	bzk9OVKjPO9sLEY13kQoaA365F9l7AUU6xfjhBpiJFQOybuCvZUrMvE0QAD0wGiKtglOkzTMi6g
	YLYUpfarZf50I/KqBWk7K5VrBrjBxe34LAm5aQHD28vX4=
X-Received: by 2002:a17:90b:520c:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-37de421db3emr3545553a91.14.1782302349378;
        Wed, 24 Jun 2026 04:59:09 -0700 (PDT)
Received: from [10.125.192.89] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3cf70b0sm2368408a91.11.2026.06.24.04.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:59:08 -0700 (PDT)
Message-ID: <057ea303-4c27-1a6e-08de-cce26c699097@gmail.com>
Date: Wed, 24 Jun 2026 19:58:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/5] mm/zswap: Extend shrink_memcg() writeback
 capability
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-2-jiahao.kernel@gmail.com>
 <ajnB8IZrFZwbIr9P@google.com>
 <d0f05c35-457a-4b2c-6faa-7a83d4bdec01@gmail.com>
 <CAO9r8zMgaqP=n6rmhnMU+qhp1Www1Y5kdbLTLX1v=fj_ybHyiw@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zMgaqP=n6rmhnMU+qhp1Www1Y5kdbLTLX1v=fj_ybHyiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/6/24 02:17, Yosry Ahmed wrote:
>> My initial thought was that if cold memory is evenly distributed across
>> nodes and we are doing a large writeback, it would be better to balance
>> the zswap entry writeback across all nodes rather than just draining
>> node 0 first. However, since we currently lack a proper metric to
>> represent hot/cold memory (such as age-based tracking), doing this
>> probably doesn't make much sense right now.
> 
> Yeah let's start simple and go from there.
> 
>>
>> So, perhaps we want something like this? Please correct me if I'm wrong.
>>
>> static long shrink_memcg(struct mem_cgroup *memcg,
>>          unsigned long nr_to_scan)
>> {
>>     struct zswap_shrink_walk_arg walk_arg = {
>>       .bytes_written = 0,
>>       .encountered_page_in_swapcache = false,
>>     };
>>     unsigned long nr_remaining = nr_to_scan;
>>     bool memcg_list_is_empty = true;
>>     int nid;
>>
>>     if (!mem_cgroup_zswap_writeback_enabled(memcg))
>>       return -ENOENT;
>>
>>     if (memcg && !mem_cgroup_online(memcg))
>>       return -ENOENT;
>>
>>     for_each_node_state(nid, N_NORMAL_MEMORY) {
>>       unsigned long nr_to_walk;
>>
>>       /*
>>        * Cap the per-node scan by the current LRU length. A referenced
>>        * entry is only rotated to the tail (second chance) and may be
>>        * revisited within a single walk; without this cap those rotated
>>        * entries could drain the shared scan budget on one node.
>>        */
> 
> The comment here is a bit misleading. It's not just about draining one
> node. One call to shrink_memcg() should only scan entries once. The
> caller can then choose to scan the memcg again, or scan a different
> one. In this case, the caller should iterate all memcgs first before
> retrying memcgs again and reclaiming rotated entries.

I have updated the comment. Please see below.
> 
>>       nr_to_walk = min(nr_remaining,
>>            list_lru_count_one(&zswap_list_lru, nid, memcg));
>>       if (!nr_to_walk)
>>         continue;
>>       memcg_list_is_empty = false;
>>
>>       nr_remaining -= nr_to_walk;
>>       list_lru_walk_one(&zswap_list_lru, nid, memcg,
>>             &shrink_memcg_cb, &walk_arg, &nr_to_walk);
>>       /* Return the unused share of the budget to the pool. */
>>       nr_remaining += nr_to_walk;
>>
>>       /* Bail out once the whole scan budget has been spent. */
> 
> The comment is unnecessary.

I'll do this, thanks.
> 
>>       if (!nr_remaining)
>>         break;
>>
>>       cond_resched();
> 
> Did you observe a problem here or did you just add this due to an
> abundance of caution?

The cond_resched() here was just out of caution. Given that both callers 
(shrink_worker() and zswap_proactive_writeback()) already have 
rescheduling checks, I suppose we can remove it from here."
> 
>>     }
>>
>>     if (memcg_list_is_empty)
> 
> Do we need memcg_list_is_empty? Can we just check if nr_remaining
> matches nr_to_scan?
> 

indeed.
>>       return -ENOENT;
>>
>>     return walk_arg.bytes_written;
>> }


/*
  * Scan up to @nr_to_scan pages across the per-node zswap LRUs of @memcg
  * and write back the reclaimable ones.
  *
  * Since the second-chance algorithm rotates referenced entries to the
  * LRU tail, the per-node scan is capped at the current LRU length so
  * each entry is scanned at most once per call. It is up to the caller
  * to handle retries, deciding whether to scan the next memcg to complete
  * the full iteration, or to rescan the current memcg to drain its zswap
  * entries.
  *
  * Return: The number of compressed bytes written back (>= 0), or -ENOENT
  * if @memcg has writeback disabled, is a zombie cgroup, or has empty
  * zswap LRUs.
  */
static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
{
     struct zswap_shrink_walk_arg walk_arg = {
         .bytes_written = 0,
         .encountered_page_in_swapcache = false,
     };
     unsigned long nr_remaining = nr_to_scan;
     int nid;

     if (!mem_cgroup_zswap_writeback_enabled(memcg))
         return -ENOENT;

     /*
      * Skip zombies because their LRUs are reparented and we would be
      * reclaiming from the parent instead of the dead memcg.
      */
     if (memcg && !mem_cgroup_online(memcg))
         return -ENOENT;

     for_each_node_state(nid, N_NORMAL_MEMORY) {
         unsigned long nr_to_walk;

         /*
          * Cap the walk at the current LRU length to ensure each entry is
          * scanned at most once per call. Referenced entries are rotated
          * to the tail for a second chance, and this bound prevents them
          * from being revisited within a single call. Retries are left to
          * the caller, which can choose to rescan the current memcg or
          * move on to the next one.
          */
         nr_to_walk = min(nr_remaining,
                  list_lru_count_one(&zswap_list_lru, nid, memcg));
         if (!nr_to_walk)
             continue;

         nr_remaining -= nr_to_walk;
         list_lru_walk_one(&zswap_list_lru, nid, memcg, &shrink_memcg_cb,
                   &walk_arg, &nr_to_walk);
         /* Return the unused share of the budget to the pool. */
         nr_remaining += nr_to_walk;

         if (!nr_remaining)
             break;
     }

     /* Nothing was scanned: every LRU under @memcg was empty. */
     if (nr_remaining == nr_to_scan)
         return -ENOENT;

     return walk_arg.bytes_written;
}


Thanks,
Hao
