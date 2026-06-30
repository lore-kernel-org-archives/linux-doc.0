Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DC26B2DA
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782784167; cv=none; b=fQtnpFAgZgBRj9MKvDnaNlVE5g9t1OvTOTTdrFxbLz5FYmUuFghOJZ+bGwjRMcvnHxAu3p5hNBwvfziS/RjPOZOeAhpqV6P/dRJ7Nomamnbc8SuhdcUTWLhWVN4+qjjb6FqFssUOMF7HgVfvzaAliB6gv83axmeS7AtYMYxH9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782784167; c=relaxed/simple;
	bh=ZW+mzUs7us6S8WDQel80JrAPYm1jQXd7jiXihFWGz24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A21YX+WJNXCSyXLWmi2sWKVCjBY663S1FnB+s8tMn4/Wbyf/wBiAhvRXnJL6ucSwm+EgwN0FnfOpLWp86CLzmKfsG46UQ0zlPaSjDRL+p97SapvTBDqEdmjexkMb/frexIWCxABM0D5D+qn4+2KlYIbmeR8ek1WlkKCm/u7HxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnGn9acz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnGn9acz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37fb434c547so1844606a91.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782784164; x=1783388964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGzb5I99oVjrLBb+VIXHECds+0MQ3SMiFwp7W65djH8=;
        b=VnGn9aczMX5cknPbaRmuYYrSThr7ITBKEiE6TwuTjfZfbBAof5bRGIDwHtiWRD9QCU
         rIFWN51XuVIDPuCc9vCoF6TDAXZoqaaB20sRP05EVP5tn4DGKYMck9rXBp9O+G87A50d
         WFwdPMj19tYNzFlIn5d/2CT3cn4U0LQY7/QAiOiEKkRlGEDI6oGTkueKVdmwHf3KFl+L
         0DLEm/tpqfJ55IVV3WjTMBs2yw6U6hsFwbUPukbAzqL89Q5sxGIE8f/GxMfs26ybXN0r
         2qfoY2nzPoH5ZIkpAKxmuq2gzeMBLRiVydv6TSM2EO2gHZ/HS6WlsxSia/J39y46Q7Om
         C7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782784164; x=1783388964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGzb5I99oVjrLBb+VIXHECds+0MQ3SMiFwp7W65djH8=;
        b=LOXvcZbF3y1Bnn+ir5rzakFfYFPyBmHur5helYt6pw7zHkbqU9NIKx9ykMUR9FCDf5
         lyoX8sNFA8puzMWiyYzP7D1WjTWOIXIYTz4UxxIc1zYSrGR9AiDD0/AT7OJ2S+Ga8xmo
         GDLkLY3AKM3amdd0RabfSzHy4O1ddEQtppkFqZMc2IqVrzf2F6EL7myr34dO1f2n6p9z
         W8M4EY9ZKMMPA54bDHmWaowa9VET6Oc7Nuo0FTwh61vAaMwvos3OadNj/HmTdi4tkWpM
         UlFBnX68iEcfobasZ/4WLywZDKzaikYtN+bwCrNK3xyLy8IbzfO2FVO7if8Gp2MeS5Hq
         QZqw==
X-Forwarded-Encrypted: i=1; AHgh+RpDmaGtP3zzwFZ0SsGNt8RgGY2eieZifvO6urpHhMRCGZkhrju/MKObS/n9ZlU+HnGkx+5QLnM9sdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/XXTNE2J6syZJrQcbP/mVfXFH4f+4okARJlPUtCBSt/kapBTb
	yZY45CEdIxY7aMwdmWpois9zL75q/pVKIPcGCWyBdRbL3zQUkhSIg1rg
X-Gm-Gg: AfdE7claGdji+H8hB7wg+pRRWFdIRQkvQV224TZw9126iUhsV31r1VNEI13S9A0cCt/
	IvuknHTcD6Lp1ivF+0VY1qH/Al8cTfu47g3fZO8yOyvrf/lOwdpHadOM3kIf1ZsF0GjHUBEGwk2
	z6CZnLZJCdEyXwDvkc4x9bB+epCgWHIi+clfD2iEJ9vyRYoAzW3oQ1oRECkQfcVfHv8m9x6W2JH
	JNKSrNNg1SH7NWWoPYJeWTytqJSKkecb4OoqAlPZMRAU+VeJAaEXQvf5cecg3NYmzzCjETcp5Qd
	UwZQU0lmUCg7hiXsgr5ct+ZkkOjxYZ0wslfmbohyRotkwOGT2Qccrd6RV36S5caf0f70KD9sQcQ
	wp9uGvRbdG1u8OJ3a1ebYd7qV+WugbsNWXPcf/GEHiT+1nsktXwgAg1zVb0NbLlqECrGQafbv7v
	vWtjoT+s5TkK9Ymhccx7zVUBSoaNEr0vL6
X-Received: by 2002:a17:90b:1d4c:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-380527a8520mr1156642a91.22.1782784164449;
        Mon, 29 Jun 2026 18:49:24 -0700 (PDT)
Received: from [10.125.192.77] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052737fbesm673824a91.0.2026.06.29.18.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 18:49:23 -0700 (PDT)
Message-ID: <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com>
Date: Tue, 30 Jun 2026 09:49:03 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com>
 <akMJ8UfeZXrVe5LN@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <akMJ8UfeZXrVe5LN@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/30 08:15, Yosry Ahmed wrote:
> On Mon, Jun 29, 2026 at 07:20:30PM +0800, Hao Jia wrote:
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> Zswap currently writes back pages to backing swap reactively, triggered
>> either by the shrinker or when the pool reaches its size limit. There is
>> no mechanism to control the amount of writeback for a specific memory
>> cgroup. However, users may want to proactively write back zswap pages,
>> e.g., to free up memory for other applications or to prepare for
>> memory-intensive workloads.
>>
>> Introduce a "source=" key to the memory.reclaim cgroup interface,
>> currently accepting the single value "zswap". When set to "zswap", it
>> bypasses standard memory reclaim and exclusively performs proactive
>> zswap writeback up to the requested budget. If omitted, the default
>> reclaim behavior remains unchanged.
>>
>> Example usage:
>>    # Write back 10MB of compressed data from zswap to the backing swap
>>    echo "10M source=zswap" > memory.reclaim
>>
>> Note that the actual amount of compressed data written back may be less
>> than requested due to the zswap second-chance algorithm: referenced
>> entries are rotated on the LRU on the first encounter and only written
>> back on a second pass. If fewer bytes are written back than requested,
>> -EAGAIN is returned, matching the existing memory.reclaim semantics.
>>
>> Internally, extend user_proactive_reclaim() to parse the new "source="
>> key and invoke the dedicated handler zswap_proactive_writeback() when it
>> is set to "zswap". This handler walks the target memcg subtree in a
>> round-robin fashion and drains each memcg's per-node zswap LRUs through
>> shrink_memcg(), accumulating the compressed bytes written back until the
>> requested budget is met.
>>
>> Suggested-by: Yosry Ahmed <yosry@kernel.org>
>> Suggested-by: Nhat Pham <nphamcs@gmail.com>
>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
>> ---
> 
> Before going through more versions we need to figure out if this will
> pivot to be a proactive demotion interfcae for swap tiering.
> 

Yes. Should I drop patches 4-6 in the next version and wait for swap 
tiering to be finalized?
We can try to get the non-memcg parts (patches 1-3) merged upstream 
first. This would also give them plenty of time to bake and catch any 
potential regressions. Thoughts?


>> @@ -7869,9 +7872,12 @@ int user_proactive_reclaim(char *buf,
>>   	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
>>   	unsigned long nr_to_reclaim, nr_reclaimed = 0;
>>   	int swappiness = -1;
>> +	bool zswap_writeback_only = false;
>>   	char *old_buf, *start;
>> +	char source[16];
>>   	substring_t args[MAX_OPT_ARGS];
>>   	gfp_t gfp_mask = GFP_KERNEL;
>> +	u64 nr_bytes;
>>   
>>   	if (!buf || (!memcg && !pgdat) || (memcg && pgdat))
>>   		return -EINVAL;
>> @@ -7879,7 +7885,8 @@ int user_proactive_reclaim(char *buf,
>>   	buf = strstrip(buf);
>>   
>>   	old_buf = buf;
>> -	nr_to_reclaim = memparse(buf, &buf) / PAGE_SIZE;
>> +	nr_bytes = memparse(buf, &buf);
>> +	nr_to_reclaim = nr_bytes / PAGE_SIZE;
> 
> Nit: if we keep this as part of memory.reclaim, we probably want to
> choose clearer names (e.g. pages_to_reclaim and bytes_to_reclaim).

Will do.
> 
>>   	if (buf == old_buf)
>>   		return -EINVAL;
>>   
>> @@ -7899,11 +7906,26 @@ int user_proactive_reclaim(char *buf,
>>   		case MEMORY_RECLAIM_SWAPPINESS_MAX:
>>   			swappiness = SWAPPINESS_ANON_ONLY;
>>   			break;
>> +		case MEMORY_RECLAIM_SOURCE:
>> +			if (match_strlcpy(source, &args[0], sizeof(source)) >= sizeof(source))
>> +				return -EINVAL;
>> +			/* Only zswap is supported as a reclaim source for now. */
>> +			if (strcmp(source, "zswap"))
>> +				return -EINVAL;
>> +			zswap_writeback_only = true;
>> +			break;
>>   		default:
>>   			return -EINVAL;
>>   		}
>>   	}
>>   
>> +	if (zswap_writeback_only) {
>> +		/* source=zswap and swappiness are mutually exclusive. */
>> +		if (swappiness != -1)
>> +			return -EINVAL;
>> +		return zswap_proactive_writeback(memcg, nr_bytes);
>> +	}
>> +
>>   	while (nr_reclaimed < nr_to_reclaim) {
>>   		/* Will converge on zero, but reclaim enforces a minimum */
>>   		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
>> diff --git a/mm/zswap.c b/mm/zswap.c
>> index ba01bf0e44e9..9cda96f05508 100644
>> --- a/mm/zswap.c
>> +++ b/mm/zswap.c
>> @@ -1713,6 +1713,56 @@ int zswap_load(struct folio *folio)
>>   	return 0;
>>   }
>>   
>> +int zswap_proactive_writeback(struct mem_cgroup *memcg, u64 bytes_to_writeback)
>> +{
>> +	struct zswap_shrink_state s = {};
>> +	struct mem_cgroup *iter = NULL;
>> +	u64 bytes_written = 0;
>> +	int ret = 0;
>> +
>> +	if (!memcg)
>> +		return -EINVAL;
> 
> Can this ever happen? It would be a bug in the caller.

IIRC，Writing the following to the NUMA node sysfs entry triggers this 
check:
echo "10M source=zswap" > /sys/devices/system/node/nodeN/reclaim

> 
>> +	if (!mem_cgroup_zswap_writeback_enabled(memcg))
>> +		return -EINVAL;
>> +	if (!bytes_to_writeback)
>> +		return 0;
> 
> Do we need this? I think the loop will just never enter and
> mem_cgroup_iter_break() will do nothing.

Will do.
> 
>> +
>> +	while (bytes_written < bytes_to_writeback) {
>> +		long shrunk;
>> +
>> +		cond_resched();
>> +
>> +		if (signal_pending(current)) {
>> +			ret = -EINTR;
>> +			break;
>> +		}
>> +
>> +		/*
>> +		 * Use a local iterator to walk the memcg and its online descendants
>> +		 * in a round-robin manner. Upon exiting the loop, mem_cgroup_iter_break()
>> +		 * must be called to drop the iterator reference.
>> +		 */
>> +		do {
>> +			iter = mem_cgroup_iter(memcg, iter, NULL);
>> +		} while (iter && !mem_cgroup_tryget_online(iter));
>> +
>> +		shrunk = zswap_shrink_one_memcg(iter, &s);
>> +		if (shrunk > 0)
>> +			bytes_written += shrunk;
>> +
>> +		/* drop the extra reference taken by mem_cgroup_tryget_online() */
>> +		mem_cgroup_put(iter);
> 
> 
> Can we just use mem_cgroup_online() instead since mem_cgroup_iter()
> already graps a ref?
> 
Will do.

Thanks,
Hao
