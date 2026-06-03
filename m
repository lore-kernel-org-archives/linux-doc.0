Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A63FF893
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486056; cv=none; b=lkydGbEKlrJt8oFUBA1Q9Fxbhy5f+ePfZQdgq8ohxtQmFSNfMz6nWcMK/Z4MkjeQzMh5kcf3jyh5qTMkheHmrf2AXc/Ts8DPk9V53xpsnLclnFexr53/G3vjRINaMqSUuhy/NTLTIpYZ2zmcTiPAfvNspf0eAgzEpO+y1Uvo85Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486056; c=relaxed/simple;
	bh=Q5A+OD1aTiK+w+fKTenLE03+HWkfz3WlJe8SMvbsefQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4gdtUgCb8S6VK42gwd4BfqkH6ka17GgkzJ3TuccQPcIFYXRyMB2JbqH3DwvpE0wsWUDCeeuoDLD6ZGhDQDZ0dAUIJNjFY6GuYECXQNAQYeyGRvcacrPjMHg2liKZUp7ESpY5Ufqrhu2xQrVEgGWK5GF2NWc4NnIIzNaSmtF20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJHgPWhs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJHgPWhs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0b944f6edso37451475ad.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 04:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780486052; x=1781090852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGeTlR7gBa/MmVgFAbV0MjIRnlhQQbkpnIke5FnciGo=;
        b=bJHgPWhsiOZDPsrhutFGNl3bNiBIxCo7Kh/JVmjKEsGPaGtxERT0jrYa0Vy7VqjfQL
         9i1BqtUYGk/t11zBsru1TFuEaA2TCCd7Aw9Fm0Oz3OyWMDKNpjECkxQgGtkde+LhiysM
         FtxXZloAdvhEPyocmid3Rj2CZLHtl/tof8dzq8yIPnm+nkH7768wrOZWQ6G2dHfA1Oto
         z/PTTQ2Nb9I8GscRGVpPWwkDXQ4GQa0kelRYQgbZZKuLjVWmrcMYCcMSzVMRt9Ey8B6X
         RMt8KbfpxvhTvAc0f/dyrn0yBt1oRNP/X4/1xB2gQdXZU2cFaH6hCNRrvsoAmssmDMfJ
         zrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486052; x=1781090852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGeTlR7gBa/MmVgFAbV0MjIRnlhQQbkpnIke5FnciGo=;
        b=oYASfgASH9MB1dGAGHDaqrTyuNe76BpO8FnrEDf8DA2ITgW306NycLTOVwSWcGO8+u
         aR1xcCKQWX0n3HG4CvK0WXbzxRlD3TIP35UTXAe6xFsrc7WO9WrkKw8O2bUHaqfc8LvX
         ZSKSPPULYDJKDstHR/AhpijqdEZZ3pytOJpxlliJoKacSHsagrReB3lnXhKKzDzIVGrA
         4XYHpSzTeFZKNg/VLvm3ulrH8MbtWHPiTv0qCCoyyZPX3UD86bCxwluQvXAmqZ7Sou1N
         gWxAFhmHiPkzkiSNxjlmfonHDKQ7Q7A0X6M9gfK6DDuNW0ICUGkgNSGModhpV3L87dyC
         9y3w==
X-Forwarded-Encrypted: i=1; AFNElJ9IUKWpik3zsu8nkjb+m91z20tfcAMvZUkVGAP37M/C+JfJu64snFzfBRAcfCocAgHdAxyYlFevmVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdsZnK6/w4ZPI6q7g00kxnpjRycGFZDblk8T0VqUr/GcMKPVB1
	6G4Rz13sG1M2GkMtoY8Ef1rCAsq/B35LfCbWvpOJv6lk1uzzsjaP77V/9nCqFg==
X-Gm-Gg: Acq92OERduiySLKdbZWcbBioeN5/QN/8B0Gb743aTrqCMkvFv/L0wEEkeP7vzsj73Rl
	oJHXvqSZdfFe5NgKMy5dEZ3w2DnKBbQ06wA/uOsatKnhz0CCftGK82dxySD3ER5a5j7Dz4asBTe
	ai1qHIIWzYHP1M0MHJSnzKC5rfKrYGbC32nyvqRuve3YINQNQ/B4BXTOYq6ssBAlBQW3EWFt0t9
	7oF6foagvKN+Uj6uo6+PAKLq/2CPmoLBW2x36Y8cgCCuzyO/41q0FkFNiMdg654/xTyhKKp/IDc
	Rv7gM4b/W7oT6V0XrR0C/eIXrjH1jZ0w5Tziq9VRC5fPsGuAzCOW0kIjkkAgMGAZP7g89j++fLV
	PbzZU9zvCl1x5Nxs/OeZFEOy2v46A7sKydCXptxklcw/uF7rg9BgomfgmeGA0cmnC1N7ZRwvfxD
	VlB7qJXI+NmzpeifbhyPHuGjhaPyrD834962TsE0oyJBmAmSIuf9jKJA==
X-Received: by 2002:a17:902:f60b:b0:2bf:160f:7043 with SMTP id d9443c01a7336-2c1644b2994mr34374485ad.34.1780486052378;
        Wed, 03 Jun 2026 04:27:32 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f88473sm25004435ad.25.2026.06.03.04.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:27:31 -0700 (PDT)
Message-ID: <ea2c1323-1440-e927-f14a-0eac54a245bf@gmail.com>
Date: Wed, 3 Jun 2026 19:27:22 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com>
 <aho-Z6wshceTAYd9@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <aho-Z6wshceTAYd9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/5/30 09:37, Yosry Ahmed wrote:
> On Tue, May 26, 2026 at 07:45:59PM +0800, Hao Jia wrote:
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> Zswap currently writes back pages to backing swap reactively, triggered
>> either by the shrinker or when the pool reaches its size limit. There is
>> no mechanism to control the amount of writeback for a specific memory
>> cgroup. However, users may want to proactively write back zswap pages,
>> e.g., to free up memory for other applications or to prepare for
>> memory-intensive workloads.
>>
>> Introduce a "zswap_writeback_only" key to the memory.reclaim cgroup
>> interface. When specified, this key bypasses standard memory reclaim
>> and exclusively performs proactive zswap writeback up to the requested
>> budget. If omitted, the default reclaim behavior remains unchanged.
>>
>> Example usage:
>>    # Write back 100MB of pages from zswap to the backing swap
>>    echo "100M zswap_writeback_only" > memory.reclaim
>>
>> Note that the actual amount written back may be less than requested due
>> to the zswap second-chance algorithm: referenced entries are rotated on
>> the LRU on the first encounter and only written back on a second pass.
>> If fewer bytes are written back than requested, -EAGAIN is returned,
>> matching the existing memory.reclaim semantics.
>>
>> Internally, extend user_proactive_reclaim() to parse the new
>> "zswap_writeback_only" token and invoke the dedicated handler. Add
>> zswap_proactive_writeback() to walk the target memcg subtree via the
>> per-memcg writeback cursor, draining per-node zswap LRUs through
>> list_lru_walk_one() with the shrink_memcg_cb() callback.
>>
>> Suggested-by: Yosry Ahmed <yosry@kernel.org>
>> Suggested-by: Nhat Pham <nphamcs@gmail.com>
>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst |  18 +++-
>>   Documentation/admin-guide/mm/zswap.rst  |  11 +-
>>   include/linux/zswap.h                   |   7 ++
>>   mm/vmscan.c                             |  14 +++
>>   mm/zswap.c                              | 138 ++++++++++++++++++++++++
>>   5 files changed, 185 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 6efd0095ed99..6564abf0dec5 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -1425,9 +1425,10 @@ PAGE_SIZE multiple when read back.
>>   
>>   The following nested keys are defined.
>>   
>> -	  ==========            ================================
>> +	  ====================  ==================================================
>>   	  swappiness            Swappiness value to reclaim with
>> -	  ==========            ================================
>> +	  zswap_writeback_only  Only perform proactive zswap writeback
>> +	  ====================  ==================================================
>>   
>>   	Specifying a swappiness value instructs the kernel to perform
>>   	the reclaim with that swappiness value. Note that this has the
>> @@ -1437,6 +1438,19 @@ The following nested keys are defined.
>>   	The valid range for swappiness is [0-200, max], setting
>>   	swappiness=max exclusively reclaims anonymous memory.
>>   
>> +	The zswap_writeback_only key skips ordinary memory reclaim and
>> +	writes back pages from zswap to the backing swap device until
>> +	the requested amount has been written or no further candidates
>> +	are found. This is useful to proactively offload cold pages from
>> +	the zswap pool to the swap device. It is only available if
>> +	zswap writeback is enabled. zswap_writeback_only cannot be combined
>> +	with swappiness; specifying both returns -EINVAL.
>> +
>> +	Example::
>> +
>> +	  # Write back up to 100MB of pages from zswap to the backing swap
>> +	  echo "100M zswap_writeback_only" > memory.reclaim
> 
> 
> memcg folks need to chime in about the interface here. An alternative
> would be a separate interface (e.g. memory.zswap.do_writeback or
> memory.zswap.writeback.reclaim or sth).
> 
>> diff --git a/mm/zswap.c b/mm/zswap.c
>> index 73e64a635690..7bcbf788f634 100644
>> --- a/mm/zswap.c
>> +++ b/mm/zswap.c
>> @@ -1679,6 +1679,144 @@ int zswap_load(struct folio *folio)
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Maximum LRU scan limit:
>> + * number of entries to scan per page of remaining budget.
>> + */
>> +#define ZSWAP_PROACTIVE_WB_SCAN_RATIO	16UL
>> +/*
>> + * Batch size for proactive writeback:
>> + * - As the per-memcg writeback target in the outer memcg loop.
>> + * - As the per-walk budget passed to list_lru_walk_one().
>> + */
>> +#define ZSWAP_PROACTIVE_WB_BATCH	128UL
>> +
>> +/*
>> + * Walk the per-node LRUs of @memcg to write back up to @nr_to_write pages.
>> + * Returns the number of pages written back, or -ENOENT if @memcg is a
>> + * zombie or has writeback disabled.
>> + */
>> +static long zswap_proactive_shrink_memcg(struct mem_cgroup *memcg,
>> +					 unsigned long nr_to_write)
>> +{
>> +	unsigned long nr_written = 0;
>> +	int nid;
>> +
>> +	if (!mem_cgroup_zswap_writeback_enabled(memcg))
>> +		return -ENOENT;
>> +
>> +	if (!mem_cgroup_online(memcg))
>> +		return -ENOENT;
>> +
>> +	for_each_node_state(nid, N_NORMAL_MEMORY) {
>> +		bool encountered_page_in_swapcache = false;
>> +		unsigned long nr_to_scan, nr_scanned = 0;
>> +
>> +		/*
>> +		 * Cap by LRU length: bounds rewalks when referenced
>> +		 * entries keep rotating to the tail.
>> +		 */
>> +		nr_to_scan = list_lru_count_one(&zswap_list_lru, nid, memcg);
>> +		if (!nr_to_scan)
>> +			continue;
>> +
>> +		/*
>> +		 * Cap by SCAN_RATIO * remaining budget: bounds scan cost
>> +		 * to the remaining writeback budget.
>> +		 */
>> +		nr_to_scan = min(nr_to_scan,
>> +				 (nr_to_write - nr_written) * ZSWAP_PROACTIVE_WB_SCAN_RATIO);
>> +
>> +		while (nr_scanned < nr_to_scan) {
>> +			unsigned long nr_to_walk = min(ZSWAP_PROACTIVE_WB_BATCH,
>> +						       nr_to_scan - nr_scanned);
>> +
>> +			if (signal_pending(current))
>> +				return nr_written;
>> +
>> +			/*
>> +			 * Account for the committed budget rather than the walker's
>> +			 * actual delta. If the list is emptied concurrently, the
>> +			 * walker visits nothing and nr_scanned would never advance.
>> +			 */
>> +			nr_scanned += nr_to_walk;
>> +
>> +			nr_written += list_lru_walk_one(&zswap_list_lru, nid, memcg,
>> +							&shrink_memcg_cb,
>> +							&encountered_page_in_swapcache,
>> +							&nr_to_walk);
>> +
>> +			if (nr_written >= nr_to_write)
>> +				return nr_written;
>> +			if (encountered_page_in_swapcache)
>> +				break;
>> +
>> +			cond_resched();
>> +		}
>> +	}
>> +
>> +	return nr_written;
>> +}
>> +
>> +int zswap_proactive_writeback(struct mem_cgroup *memcg,
>> +			      unsigned long nr_to_writeback)
>> +{
>> +	struct mem_cgroup *iter_memcg;
>> +	unsigned long nr_written = 0;
>> +	int failures = 0, attempts = 0;
>> +
>> +	if (!memcg)
>> +		return -EINVAL;
>> +	if (!nr_to_writeback)
>> +		return 0;
>> +
>> +	/*
>> +	 * Writeback will be aborted with -EAGAIN if we encounter
>> +	 * the following MAX_RECLAIM_RETRIES times:
>> +	 * - No writeback-candidate memcgs found in a subtree walk.
>> +	 * - A writeback-candidate memcg wrote back zero pages.
>> +	 */
>> +	while (nr_written < nr_to_writeback) {
>> +		unsigned long batch_size;
>> +		long shrunk;
>> +
>> +		if (signal_pending(current))
>> +			return -EINTR;
>> +
>> +		iter_memcg = zswap_mem_cgroup_iter(memcg);
>> +
>> +		if (!iter_memcg) {
>> +			/*
>> +			 * Continue without incrementing failures if we found
>> +			 * candidate memcgs in the last subtree walk.
>> +			 */
>> +			if (!attempts && ++failures == MAX_RECLAIM_RETRIES)
>> +				return -EAGAIN;
>> +			attempts = 0;
>> +			continue;
>> +		}
>> +
>> +		batch_size = min(nr_to_writeback - nr_written,
>> +				 ZSWAP_PROACTIVE_WB_BATCH);
>> +		shrunk = zswap_proactive_shrink_memcg(iter_memcg, batch_size);
>> +		mem_cgroup_put(iter_memcg);
>> +
>> +		/* Writeback-disabled or offline: skip without counting. */
>> +		if (shrunk == -ENOENT)
>> +			continue;
>> +
>> +		++attempts;
>> +		if (shrunk > 0)
>> +			nr_written += shrunk;
>> +		else if (++failures == MAX_RECLAIM_RETRIES)
>> +			return -EAGAIN;
>> +
>> +		cond_resched();
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> 
> There is a lot of copy+paste from shrink_worker() and shrink_memcg()
> here. We really should be able to reuse shrink_memcg().
> 

I will do some consolidation and code reuse in the next version.

> Is the main difference that we are scanning in batches here? I think we
> can have shrink_memcg() do that too. If anything, it might make the
> shrinker more efficient. Over-reclaim is ofc a concern, and especially
> in the zswap_store() path as the overhead can be noticeable. Maybe we
> can parameterize the batch size based on the code path.
> 
> Nhat, what do you think?

Nhat, since we now have the referenced-based second chance algorithm, 
should we consider doing batch writeback for shrink_memcg() as well?

Of course, we could pass a parameter to control whether batch writeback 
is needed, so as to preserve the original behavior of shrink_memcg().

Thanks,
Hao
