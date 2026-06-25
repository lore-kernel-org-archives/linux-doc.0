Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D413DA5CF
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387112; cv=none; b=b9uwTz4clLH6SWwIPuKYBlVegidDMN1IwxoQdh7cUOnEnLeaqGM7SohADGPlf2SfbjobfonVKUnDMYHlFgifSL/VEH9IGBKObGs8khunX12YV1yM0jl6Hu+GeUIakgHFEI+wc4kOqF3roAlWabIdFthcy6qXBObgRN3Gkve/KVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387112; c=relaxed/simple;
	bh=HRZK7bcBdh3G0SoIR6huU1RJZv7lplMi8PSHmslCqc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL+OT+0BJ65rMuEny+XaoRnc9E3mO/eV10V8jTRgIHUzz9SgLX6Hk6KmTYBy8vQeVCpU008AToYWK2XtP/SfSyqujSvcBtEJ9dS7nqpEc/LHlXjZWsanr871ycKN+x1mT75spDNxQi4x5toDh2YUya7V9yaKB9ZDjc92ibuX6YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdHbNMAY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdHbNMAY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c890110acdaso829346a12.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782387111; x=1782991911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok1cwbmp8dJ1uoK/AXAMwxzmJvYss0SZo3EXCeeNnlE=;
        b=TdHbNMAY4sSgqReBh+StspST9SKQuv3eIqSsXFP5BDEYo1ZpXybLT55BMtZM5i5SzG
         VKaIcHofuQw42HeQZj5vqPnHhVcxh5a1G7dKVXERbElx2nvXqM3Ccx2U4UA48drUG/jq
         dqURrdMkhhNBAyx2xgN9zgUSXY9mQfHVZiW26S55U2bEjlgPLIpudhQjFRol0l5IUpWp
         JzUNkSoRqBawOIV9POu1yxb6RaV8xH0y0jdWdNXs0ITZF/SnXV4zDfhLn+GDNLdRZo6w
         q1vXXSnKEOmA79LVSbhIDb+pjeciV2rLYh8pULUyhfM5P220zFIxICrl+uPXspwNQ0N2
         XFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387111; x=1782991911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ok1cwbmp8dJ1uoK/AXAMwxzmJvYss0SZo3EXCeeNnlE=;
        b=qsYHYM2bwYBtonPGljisi5w9DJpZeoS9y5i+FgfDiSubAHU8aZjOmNeTB/+tu1UlVu
         t1OCNjw5ojbOJW822TFAvACh5B96xxGdqvOkuTQRgMEzsF0G41QJVZJtYeKt1+iFGabi
         cd30odeh4Ftgq1VcWWXSi+lAgEQeTkRY1Sc5PHgUiGKMS1bES8npB17LEhaW/UId1T92
         zaF8D507a2MlwvqL4HFriyE4b5Nf4iKHi4ponO76ash1Nq74edWuM+m4uQo4b+yV6wp7
         jAQWC1AtJ2Hbss1C0vZWxscXsqFxnd4FYk1PjB8Wb9DiB1VOa2iHyi6NiZmGl5KCCoYd
         O8pg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZGJvmbLNoIlDat9U7UOXV8VoiOOUlxz5MwK0RbAxAyPj2IYGXQve3GpBexV5uv9Q15gWe+wPanfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbqHet4eRme/A+dFi9GHZdUKLxS14YlnuomQpHwe8XZNVRBIQ8
	Oh2LQ7SKYKoZCMP4l0gDBHzr0SdcDjbCe7oPQCXd/t9+FoFRg9Ay4J6x
X-Gm-Gg: AfdE7cm7LS+3elF+ytujiBVRRfvSqQLapSu78fKMz6/mm+vHVNrXWdkBbYOe7PYouec
	a9XqbE/R+9P9iN2WhV0RyNXes4WcH93nFQiXxa1v/NKaZ1HgY1t6+5GkbgeaWl4Hxv03+KQqiue
	oRHssMeR4bT23vLMO5qTCgbMAYwIjfDNRgVOKr6QsEWD2YPFNj2glWGKizFsDvQfFcjph2CTNkJ
	sB4wGnUnmEfexOfDZrNgJEYLqOaJR/xEqUQlsForSJcUtw2QdJ0NPnpJHLSP3qfc+Icd/WU4Oit
	Zzf4mAtKb9d1u1WtgpbDGvuG3Sv7gsihPHueSRqsUrshi/gaN1mstCPNDrYRo2CqFyoIi2xIdvp
	K1uBF0zzP3zWRXV2ckQD7gvbMsrkbblVPtZwKoZ4S+pSlMs4DreQLb89RtXDaZXxntOZ3ZoS8Ju
	qNuZoQ1H2tz1Vp6bJqRauZkl00ZAiBKNGK
X-Received: by 2002:a05:6a21:9d45:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3bd4afbcefcmr2587154637.38.1782387110797;
        Thu, 25 Jun 2026 04:31:50 -0700 (PDT)
Received: from [10.125.192.89] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd26a52esm1482636a12.29.2026.06.25.04.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:31:50 -0700 (PDT)
Message-ID: <1358cfd4-7d3f-1238-e4a8-b2301dc16702@gmail.com>
Date: Thu, 25 Jun 2026 19:31:40 +0800
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
 <057ea303-4c27-1a6e-08de-cce26c699097@gmail.com>
 <CAO9r8zMmnYkXocZ9Fb9DL_rdAHt5xtT_FLMxJD1bHcM3B4wTFw@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zMmnYkXocZ9Fb9DL_rdAHt5xtT_FLMxJD1bHcM3B4wTFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/6/25 00:57, Yosry Ahmed wrote:
>>
>> /*
>>    * Scan up to @nr_to_scan pages across the per-node zswap LRUs of @memcg
>>    * and write back the reclaimable ones.
>>    *
>>    * Since the second-chance algorithm rotates referenced entries to the
>>    * LRU tail, the per-node scan is capped at the current LRU length so
>>    * each entry is scanned at most once per call. It is up to the caller
>>    * to handle retries, deciding whether to scan the next memcg to complete
> 
> Nit: "whether to scan another memcg to complete.."

Will fix in the next version.

> 
>>    * the full iteration, or to rescan the current memcg to drain its zswap
>>    * entries.
>>    *
>>    * Return: The number of compressed bytes written back (>= 0), or -ENOENT
>>    * if @memcg has writeback disabled, is a zombie cgroup, or has empty
>>    * zswap LRUs.
>>    */
>> static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
>> {
>>       struct zswap_shrink_walk_arg walk_arg = {
>>           .bytes_written = 0,
>>           .encountered_page_in_swapcache = false,
>>       };
>>       unsigned long nr_remaining = nr_to_scan;
>>       int nid;
>>
>>       if (!mem_cgroup_zswap_writeback_enabled(memcg))
>>           return -ENOENT;
>>
>>       /*
>>        * Skip zombies because their LRUs are reparented and we would be
>>        * reclaiming from the parent instead of the dead memcg.
>>        */
>>       if (memcg && !mem_cgroup_online(memcg))
>>           return -ENOENT;
>>
>>       for_each_node_state(nid, N_NORMAL_MEMORY) {
>>           unsigned long nr_to_walk;
>>
>>           /*
>>            * Cap the walk at the current LRU length to ensure each entry is
>>            * scanned at most once per call. Referenced entries are rotated
>>            * to the tail for a second chance, and this bound prevents them
>>            * from being revisited within a single call. Retries are left to
>>            * the caller, which can choose to rescan the current memcg or
>>            * move on to the next one.
>>            */
> 
> Nit: Make this more concise since it's already explained above.
> 

Will fix in the next version. Thanks a lot for the review!

Thanks,
Hao

> Otherwise this looks good to me, thank you!
> 
>>           nr_to_walk = min(nr_remaining,
>>                    list_lru_count_one(&zswap_list_lru, nid, memcg));
>>           if (!nr_to_walk)
>>               continue;
>>
>>           nr_remaining -= nr_to_walk;
>>           list_lru_walk_one(&zswap_list_lru, nid, memcg, &shrink_memcg_cb,
>>                     &walk_arg, &nr_to_walk);
>>           /* Return the unused share of the budget to the pool. */
>>           nr_remaining += nr_to_walk;
>>
>>           if (!nr_remaining)
>>               break;
>>       }
>>
>>       /* Nothing was scanned: every LRU under @memcg was empty. */
>>       if (nr_remaining == nr_to_scan)
>>           return -ENOENT;
>>
>>       return walk_arg.bytes_written;
>> }
>>

