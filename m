Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FEC3B27D8
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393102; cv=none; b=ckLLR+7wgq10e+eg6Im+UjcrEc3clZawHFcsGq/0AhCnN2y6UlP3IMqT/72mNj9nDGKPe/wx5HRF/o56vYCSoJDQG/P5z35eiBb5RYyc0UIntH5h4Z8UGk68zBOPkVn1LKXVyi4Srd2B9rHHPmxQextgnoSQEiqgqnGZp0B/t6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393102; c=relaxed/simple;
	bh=5t+GoX/aPLaTLKFvhZLJ22G0+ryWXHjxjIuHVP6Qtfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0Zd+++sGWg3I/p8rWljGJg0LCBC86WCoLGbRSansvilgnjmmqdWnF4MHWrszCD/NVuEpnmm/C2OFta4k+oF2NgU3B8eqRsYnsLdbYTPDyU4G+JHvKzNRu21h9rCNmoxS7eDl/f88cYAZUbqA5SjAUBl+ZSw5T4ld6FMp35DGZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1NAAIfu; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1NAAIfu"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2032004b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 23:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785393099; x=1785997899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOvMF22l5yq9rb3H7AnJyb7Yc8S/1iRInoiHq1DCJyQ=;
        b=r1NAAIfuu6kF5KLbYliv4PFcQcFXqe0sMQEIDXnFjTG2X4Za09sGn+nnxyk6nadmKy
         MMdBjNpCgNUXgD/iyzizOHtaswcTG3vO/uZ+42kQas6VAyWvlG+5nQglvX1+3oEdtnpy
         R2TW5f51P1W9jHw5OOGincLhSWQ43jxDDOJRG58ag0Q+PrKI7FPQxPcuWMMYhWKnfAsx
         EmSdFrhE8pzSPgnttzmL1TZAkoyAt0QJX9oSicfI4sFQwSVH1cjWZ/mLrfvLHkYJLzK3
         BCzB+c9BGNpOYdBsOm3LlpW4iMxR8sPqUnnQol4JNVTuxHKCTxCGQbWJ1a/UJA6QPZOG
         bf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393099; x=1785997899;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOvMF22l5yq9rb3H7AnJyb7Yc8S/1iRInoiHq1DCJyQ=;
        b=cYVvWO0GwHpte2O0o3FsatDQ/ud/wF+Y4HwsKgfpAoFJHGWgSSR7BNq6lDYpXn1Tkg
         QToA0RrIiRvL40qHEySbPC7lRDu7IYaJ88pE89U6QbPl8wJWWwa+Rr/lMiK5IHrSsDpo
         VEnwnQp8Mqh+6UOndKU4MGzBWCMYh6P3AUHKT2zlJab6g0BjWnvsaXNRNJOvocrim63o
         ZcXjAMz8qorHtDAL4+yXbrqcGMLsqp9qhtp6A+kG0ljhHoqb3II2VgXkF4xObe+6gxem
         VoHUPEy7O8SacunAOz0jiRl5SHB5AFvD5DGMuMRMyp7nuCNGmX6ghtDGmMXTRwEdxpd8
         yD4g==
X-Forwarded-Encrypted: i=1; AHgh+RrRTSR72qBEAb7S4yGu6I86eWE9LSa6hPJFMvLyJoLy9231irbgETv0eKlvzQWj9BubzdHFQkpJwEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFnhsmqgsfa8DIOm5BLBm4tYOdEhqJ+pFnHP6XkVIW9npKxVr0
	vdkqEbCErQOskxLfPy1p9rbmvh9ckdUmWDf4166Pe5xwkxHo3gkd1S2l
X-Gm-Gg: AR+sD11+wrS4E4fgQCUTh6OoM+KyTgjS7fjVA/mFZMUoH8IQkWJhoL5H2T3iR+Itcho
	lTBd958ZvC0/s78LJAlbTEz4gko7OLkzIVzX1gzvU4HCqOeTcTN7CofRBbLkPMIHBXEBgXfcjBW
	v5H6wEeXscHWguQhNvTSIIefiCRdTtq/4gX0+EbTEBrdlyYB6VCmBduOge7DuDb+SlviLYIR6QA
	m0MIO/QNu6sYVNM01qmed4V88XOZPIBvePzAB/jtmMQPOdOczWC9ozoSsaGon7Gi7kI2hw8PYyd
	Raru6+N2/uTH81fxNSpm1wrqNQ17bLiq41HGC09bXp/jT0dIzu4sxsq73NpKOhdMgAsSkYCQeKX
	e1n7xq7kYl0Es92gBU05MrLuY4HKt4Ui6t9AyyYjvtTUYEV1IWXglTd6WMJF9D22DrWuRfS1Dx8
	Pk8bpHvnXwAJG/2KIGt3paeXlN0o+WMH7QMMkP+AwOgPPk2V369P1yCZmJJD8A6o/ITGFacngHq
	FAbLVzltCz7i/lwnCO4
X-Received: by 2002:a05:6a00:2e95:b0:845:d284:9e14 with SMTP id d2e1a72fcca58-84ebc468c9cmr1404273b3a.59.1785393099312;
        Wed, 29 Jul 2026 23:31:39 -0700 (PDT)
Received: from [10.125.192.117] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0052e04sm2418453b3a.22.2026.07.29.23.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:31:38 -0700 (PDT)
Message-ID: <c4c95102-72e2-a44f-f16e-4134ba6bb060@gmail.com>
Date: Thu, 30 Jul 2026 14:31:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Yosry Ahmed <yosry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
References: <20260729084206.77793-1-jiahao.kernel@gmail.com>
 <20260729084206.77793-2-jiahao.kernel@gmail.com>
 <20260729155858.c7aabff48166a9bca4d68ac3@linux-foundation.org>
 <CAO9r8zNhBCghP8T_98z2p==Cfs_=kamcRN_3ROxaj3R8PN2Qvw@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zNhBCghP8T_98z2p==Cfs_=kamcRN_3ROxaj3R8PN2Qvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/30 08:30, Yosry Ahmed wrote:
> On Wed, Jul 29, 2026 at 3:58 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> On Wed, 29 Jul 2026 16:42:05 +0800 Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>> Zswap writeback when the global pool limit is hit fails when memory
>>> cgroup is disabled. The pool remains full until it is organically
>>> drained by swapins or memory freeing, leading to zswap store failures
>>> and pages bypassing getting written directly to the backing swap device,
>>> causing LRU inversion (hotter pages with higher fault latency).
>>>
>>> This happens because mem_cgroup_iter() always returns NULL when
>>> memory cgroups are disabled. As a result, the global shrinker
>>> shrink_worker() repeatedly takes empty walks. After MAX_RECLAIM_RETRIES
>>> failed attempts, the worker gives up without writing back any pages.
>>>
>>> Therefore, when memory cgroup is disabled, fall through with the !memcg
>>> branch and shrink the root memcg directly.
>>>
>>> With memcg disabled, shrink_memcg() only returns -ENOENT when the root
>>> LRU is empty, which means the total pages are already below thr. In the
>>> absence of heavy concurrent zswap stores, the loop then safely bails out
>>> via the zswap_total_pages() <= thr check; otherwise, it will resume
>>> shrinking the memcg after processing the reschedule check. For any other
>>> return value from shrink_memcg(), the loop is guaranteed to terminate,
>>> either after MAX_RECLAIM_RETRIES failures or once the threshold is met.
>>>
>>> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
>>> Cc: stable@vger.kernel.org
>>
>> How does this affect users?  What behavior do they observe when it
>> occurs?
> 
> I think the first paragraph sums it up pretty well, especially the
> last sentence "hotter pages with higher fault latency".
> 
>>
>>> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
>>
>> hm, that isn't really a bug report and doesn't answer the above
>> question.
> 
> Yeah, it isn't. Probably we should drop "Closes". I assume Hao added
> it because checkpatch annoyingly complains if you add "Reported-by"
> without "Closes", so Hao just linked to the thread where I pointed out
> the bug.

Yeah, checkpatch will complain if it's missing.

> 
>>
>> AI review asked a couple of questions:
>>          https://sashiko.dev/#/patchset/20260729084206.77793-1-jiahao.kernel@gmail.com
> 
> The review on patch #1 is something theoretical, we discussed it at
> length in previous versions.
> 
> For patch #2:
> 
>> Does this batching logic break NUMA fairness?
>>
>> Because for_each_node_state() always starts from the lowest node
>> ID and breaks when the scan budget is exhausted, subsequent
>> calls to shrink_memcg() will restart at the lowest node ID again.
>>
>> If the lowest node (typically Node 0) consistently has enough
>> items to exhaust the scan budget, wouldn't we exclusively evict
>> pages from it while ignoring older pages on other nodes? Could
>> this cause LRU inversion across nodes, keeping older pages in
>> memory on Node 1 while hot pages on Node 0 are evicted?
> 
> Yes, unfairness is possible.
> 
> For global shrinking, it's probably not an issue. We reclaim until we
> hit the acceptance threshold and it's very unlikely this will happen
> before iterating all nodes (given that the batch size is 32 pages).
> However, with the shrink_memcg() path, we only reclaim one batch, so
> there's a chance we'll always reclaim it from node 0.
> 
> Maybe we should just drop the early bailout and accept potentially
> doing more writeback than needed. Hao, WDYT?
> 
If we scan and attempt to write back SWAP_CLUSTER_MAX zswap entries per 
node, it might lead to excessive writeback on machines with many NUMA 
nodes. Furthermore, I'm concerned about introducing higher latency in 
synchronous shrink paths like zswap_store()—especially on systems with a 
large number of NUMA nodes, where it could end up writing back hundreds 
of pages in a single call.

Maybe we could do something like this instead? That way, in the 
worst-case scenario, it falls back to the baseline behavior without 
introducing any extra latency risks.

  static int shrink_memcg(struct mem_cgroup *memcg)
  {
-       int nid, shrunk = 0, scanned = 0;
+       unsigned long node_batch, scanned = 0;
+       int nid, shrunk = 0;

         if (!mem_cgroup_zswap_writeback_enabled(memcg))
                 return -ENOENT;
@@ -1289,14 +1313,26 @@ static int shrink_memcg(struct mem_cgroup *memcg)
         if (memcg && !mem_cgroup_online(memcg))
                 return -ENOENT;

+       node_batch = max(1UL, SWAP_CLUSTER_MAX / 
num_node_state(N_NORMAL_MEMORY));
         for_each_node_state(nid, N_NORMAL_MEMORY) {
-               unsigned long nr_to_walk = 1;
+               unsigned long nr_to_walk, budget;
+
+               /*
+                * Cap the scan at the per-node LRU length so each entry is
+                * scanned at most once per call.
+                */
+               budget = min(node_batch,
+                            list_lru_count_one(&zswap_list_lru, nid, 
memcg));
+               if (!budget)
+                       continue;

+               nr_to_walk = budget;
                 shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
                                             &shrink_memcg_cb, NULL, 
&nr_to_walk);
-               scanned += 1 - nr_to_walk;
+               scanned += budget - nr_to_walk;
         }

+       /* Nothing was scanned: every LRU under @memcg was empty. */
         if (!scanned)
                 return -ENOENT;

Thanks,
Hao
> If you respin, please also drop the batch size argument to
> shrink_memcg() as it's now always SWAP_CLUSTER_MAX.
