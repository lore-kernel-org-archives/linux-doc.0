Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68EA3264CB
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220994; cv=none; b=jzylWcykRkDThY1PjVk9xqGnAJKh6P/Kq/wbrNwD0YQanfH/7YiYp/ev5RGPrrgJl4H/egNbbs0YjS4DmWXrolRfGbJ0kdIenADfpWbIWP883QvYxQ3c+IjPyhBGdRLQI+f/1c33wLoT/u1lRr83y4QX/uKTiOegBDXzKNrk0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220994; c=relaxed/simple;
	bh=fKgm6VUtRB78PwSTtfBELUqSGwPBw+i3nlL7PXJNvs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckP0l+GKnEInpMAi2q7RwehuWBUGJmGGwRLmxrq7vDslmIVVLOCQvtcgme8DJFOkHZZI9cNtHjxZ1aa81TXcV/K5LZu5G4Sk7Pm6R98YBUletWJ62JjQA9gHH9U7nZQwhow4DT/2ytb+FIq6KeiP/Ymydp0zl6yag2Lh8Zn7cVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGjBoWFU; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGjBoWFU"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a0e4f0342aso2138343eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220991; x=1782825791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QloDB+XeabkMLlJLsdcpDwsjdd7YtMclccAzwToO5bM=;
        b=OGjBoWFUz9Tc3mNJvX0wGxXwqHep3BGyI3Wnsa1PO878drNdCo+/yKUF5e/ztqu4mV
         71U2oLyLB4nBkcYMrujd7X4z+1dmFQL2XN+OLtX5PHLhul2uAbNPgwDaV4x5rHivH806
         WnPNHkzeaPcakHnZ/0mQTF8x7faHTWodlkCV8+w0ZWaSW6ERjT0Cev17G0GICGSxw7gD
         8DXgWmCrymUYF2htNWiIk8KMe/NQMSpw5UOT9wBInWmY5eELfmaiQQCtKC6exEtggxw0
         4YaEu+FtXDzdissGh+zWd4an/h1Xvv3ejwHL3FYEe+flRdHLTO727qL61iPsgP+7JvZY
         3dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220991; x=1782825791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QloDB+XeabkMLlJLsdcpDwsjdd7YtMclccAzwToO5bM=;
        b=FcRKCBacyHq0PzpFBjf3aMDy8lfIdi9VIaPP2Ti0BGLBPHZ7uhWg6fB4kgZbbKogOk
         SJvNIwTqGLrCrucqUeZbFkP6wIalWHUzfMtDRArq1hC8xzEnZToLKoREPsayyriciZcS
         WmFoaIAz5NX+JZ/UlvF0GyPCSVveIvPd/0UnDIKNtm1bX1xz42fFTMZ7O9iRQxLdQ8YL
         22u4BG7Nljr/a0lgDmms/0ekkXjSi/wcPyM5tIU5/XbWynqk0pnumqHg3H3GfRLhCjrV
         e/MAOCxB4t5CfqTJTb/lg9+xXtB9082Ruj+gdlzQaoGbwL6KNULFsDxb7G36SKBjxQ/q
         HcCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+D9Li2s4IsSK6xb9Wfqt0okWdeW2O6D5/oXwbLyl8ZTw/iCqUhzoo0xuCFm8ypqYQC+xBcDT4dij0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZB4yOK/Bn7VJBOWjoTW87ck8wd9C891ZklD0ND/f4/4A23lk
	3B3AI9rP+wIxNkiWgfqRZ4oJKecU+DUg2SptJqn6CtR0WLczz0MvzRvI4jj93A==
X-Gm-Gg: AfdE7cnud+7PsajPV3wPyivuUIHWJLDAhnHmMRJ3LnwhN/zi9h79uoj0Hr3MQEVRGpk
	wtK8RPr3hi6XzL5FBpz1JWZ0Upwl657afoGa0e0IpOJqBxpfcsYr9BnKW2VGUHeWK3NP/wUNsOj
	/KBdtJ2ltI0KqQeiPi2gift9+a08yITk3gxpsKW//szPNs1He8cTHgTUxvtoGkg2Y2F0R3BBL85
	f4yZ3jpBS5Sn0baKq6Q+y9vSri0Q2JdcaKSJ0tBX0iXWtmHQ9SyMRIqLxCqMUZAB2jUS43OANUt
	v10nEJKH1grAmg46tG9EkrsEQNdzNtyeOOsenRoRspQ6KHf6Y2ljn3uqqtcLFJxmDZU7fl/2LsX
	G5LkntUmCP2zh86IJW2SvXRVSJAGyVkI0mqUz1VlZH48WJ5Bt6BGjxPQKiunqnOxw++cEu7J+8D
	cU9s9JjKkGLFh0iQ7X1gZ8Q5pkokaP5DSs
X-Received: by 2002:a05:6820:4b01:b0:69e:ab0:3f4e with SMTP id 006d021491bc7-6a0d8d1b549mr15833025eaf.46.1782220990771;
        Tue, 23 Jun 2026 06:23:10 -0700 (PDT)
Received: from [10.125.192.89] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472f0475e3sm8211821fac.16.2026.06.23.06.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 06:23:10 -0700 (PDT)
Message-ID: <d0f05c35-457a-4b2c-6faa-7a83d4bdec01@gmail.com>
Date: Tue, 23 Jun 2026 21:22:58 +0800
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
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <ajnB8IZrFZwbIr9P@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/6/23 07:33, Yosry Ahmed wrote:
> On Thu, Jun 18, 2026 at 12:48:53PM +0800, Hao Jia wrote:
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> diff --git a/mm/zswap.c b/mm/zswap.c
>> index 761cd699e0a3..d7d031dee4cd 100644
>> --- a/mm/zswap.c
>> +++ b/mm/zswap.c
>> @@ -160,6 +160,11 @@ struct zswap_pool {
>>   	char tfm_name[CRYPTO_MAX_ALG_NAME];
>>   };
>>   
>> +struct zswap_shrink_walk_arg {
>> +	unsigned long bytes_written;
>> +	bool encountered_page_in_swapcache;
>> +};
>> +
>>   /* Global LRU lists shared by all zswap pools. */
>>   static struct list_lru zswap_list_lru;
>>   
>> @@ -1089,8 +1094,9 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>>   				       void *arg)
>>   {
>>   	struct zswap_entry *entry = container_of(item, struct zswap_entry, lru);
>> -	bool *encountered_page_in_swapcache = (bool *)arg;
>> +	struct zswap_shrink_walk_arg *walk_arg = arg;
>>   	swp_entry_t swpentry;
>> +	unsigned int length;
>>   	enum lru_status ret = LRU_REMOVED_RETRY;
>>   	int writeback_result;
>>   
>> @@ -1135,8 +1141,13 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>>   	 * Once the lru lock is dropped, the entry might get freed. The
>>   	 * swpentry is copied to the stack, and entry isn't deref'd again
>>   	 * until the entry is verified to still be alive in the tree.
>> +	 *
>> +	 * entry->length is also copied while the lock is held, because
>> +	 * zswap_writeback_entry() frees the entry on success and we still
>> +	 * need its compressed size to account for writeback.
> 
> Hmm that's unnecessary, just update "The swpentry is copied to the
> stack.." above to "Copy neded fields to the stack.." or something.

I'll do this, thanks.

> 
>>   	 */
>>   	swpentry = entry->swpentry;
>> +	length = entry->length;
>>   
>>   	/*
>>   	 * It's safe to drop the lock here because we return either
>> @@ -1155,12 +1166,13 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>>   		 * into the warmer region. We should terminate shrinking (if we're in the dynamic
>>   		 * shrinker context).
>>   		 */
>> -		if (writeback_result == -EEXIST && encountered_page_in_swapcache) {
>> +		if (writeback_result == -EEXIST) {
>>   			ret = LRU_STOP;
>> -			*encountered_page_in_swapcache = true;
>> +			walk_arg->encountered_page_in_swapcache = true;
>>   		}
>>   	} else {
>>   		zswap_written_back_pages++;
>> +		walk_arg->bytes_written += length;
>>   	}
>>   
>>   	return ret;
>> @@ -1169,8 +1181,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>>   static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
>>   		struct shrink_control *sc)
>>   {
>> +	struct zswap_shrink_walk_arg walk_arg = {
>> +		.bytes_written = 0,
>> +		.encountered_page_in_swapcache = false,
>> +	};
>>   	unsigned long shrink_ret;
>> -	bool encountered_page_in_swapcache = false;
>>   
>>   	if (!zswap_shrinker_enabled ||
>>   			!mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
>> @@ -1179,9 +1194,9 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
>>   	}
>>   
>>   	shrink_ret = list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_memcg_cb,
>> -		&encountered_page_in_swapcache);
>> +		&walk_arg);
>>   
>> -	if (encountered_page_in_swapcache)
>> +	if (walk_arg.encountered_page_in_swapcache)
>>   		return SHRINK_STOP;
>>   
>>   	return shrink_ret ? shrink_ret : SHRINK_STOP;
>> @@ -1275,10 +1290,32 @@ static struct shrinker *zswap_alloc_shrinker(void)
>>   	return shrinker;
>>   }
>>   
>> -static int shrink_memcg(struct mem_cgroup *memcg)
>> -{
>> -	int nid, shrunk = 0, scanned = 0;
>> +/*
>> + * The maximum acceptable scan cost factor for writing back
>> + * PAGE_SIZE bytes of compressed data.
>> + */
>> +#define ZSWAP_WB_SCAN_FACTOR	16UL
>> +#define NR_ZSWAP_WB_BATCH	64UL
>>   
>> +/*
>> + * Iterate over the per-node zswap LRUs of @memcg in batches, writing back
>> + * up to @nr_to_writeback * PAGE_SIZE bytes of compressed data.
>> + *
>> + * Return: The number of bytes written back, or -ENOENT if @memcg has
>> + * writeback disabled, is a zombie cgroup, or has empty zswap LRUs.
>> + */
>> +static long shrink_memcg(struct mem_cgroup *memcg,
>> +			 unsigned long nr_to_writeback)
> 
> 
> Is nr_to_writeback supposed to be the number of pages we want to
> writeback (regardless of their compressed size), or the compressed bytes
> we want to writeback divided by PAGE_SIZE?
> 
> The way it's being used below seems like it's the latter, but the batch
> size should be in terms of scanned pages (i.e. uncompressed pages). So
> this is confusing.
> 
> The zswap_store() path expects to reclaim one uncompressed page, but
> this will reclaim PAGE_SIZE worth of compressed memory when passing 1
> IIUC (actually maybe more, see below).
> 
>> +{
>> +	struct zswap_shrink_walk_arg walk_arg = {
>> +		.bytes_written = 0,
>> +		.encountered_page_in_swapcache = false,
>> +	};
>> +	u64 bytes_to_writeback = nr_to_writeback << PAGE_SHIFT;
>> +	bool memcg_list_is_empty = true;
>> +	int nid;
>> +
>> +	/* Memcg with zswap writeback disabled are not candidates. */
> 
> The comment is unnecessary here, it should be obvious.

I'll do this, thanks.
> 
>>   	if (!mem_cgroup_zswap_writeback_enabled(memcg))
>>   		return -ENOENT;
>>   
>> @@ -1290,24 +1327,65 @@ static int shrink_memcg(struct mem_cgroup *memcg)
>>   		return -ENOENT;
>>   
>>   	for_each_node_state(nid, N_NORMAL_MEMORY) {
>> -		unsigned long nr_to_walk = 1;
>> +		unsigned long nr_to_scan, nr_scanned = 0;
>> +		unsigned long remain;
>> +		walk_arg.encountered_page_in_swapcache = false;
>> +		/*
>> +		 * Cap by LRU length: bounds rewalks when referenced
>> +		 * entries keep rotating to the tail.
>> +		 */
>> +		nr_to_scan = list_lru_count_one(&zswap_list_lru, nid, memcg);
>> +		if (!nr_to_scan)
>> +			continue;
> 
> Hmm generally if we are running out of pages to scan then we should scan
> the rotated entries, and reclaim them on the second pass, right? So this
> should be working as intended. But I guess this doesn't work well when
> iterating multiple memcgs, as we don't want to drain referenced entries
> in one memcg before reclaiming already rotated entries on another.
> 
> So I think the assumption here is that the caller will retry if needed,
> handling balancing scanning between multiple memcgs if needed. Maybe we
> should document this in the function doc above? We should explain that
> referenced entries will be rotated but not reclaimed as part of the same
> call.
> 
>> +		memcg_list_is_empty = false;
>> +
>> +		/*
>> +		 * Cap by SCAN_FACTOR * remain budget: bounds scan cost
>> +		 * to the remaining writeback budget.
>> +		 */
>> +		remain = DIV_ROUND_UP(bytes_to_writeback - walk_arg.bytes_written, PAGE_SIZE);
>> +		nr_to_scan = min(nr_to_scan,
>> +				 remain * ZSWAP_WB_SCAN_FACTOR);
> 
> For the zswap_store() path bytes_to_writeback=PAGE_SIZE, so remain will
> initially be 1. But then we multiply by this factor and now to scan 16
> pages? Also, where did this factor and equation come from?
> 
> We'll also loop over nodes, so we may end up scanning 32 or more pages
> depending on the number of nodes in the system.
> 
> If this is just a heuristic, we should really just start simple and add
> heuristics later as needed. The caller should probably pass in the
> number of pages to scan (i.e. uncompressed pages), and leave it to the
> caller to decide when to retry if the actual memory savings are
> realized.
> 
>>   
>> -		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
>> -					    &shrink_memcg_cb, NULL, &nr_to_walk);
>> -		scanned += 1 - nr_to_walk;
>> +		while (nr_scanned < nr_to_scan) {
>> +			unsigned long nr_to_walk = min(NR_ZSWAP_WB_BATCH,
>> +						       nr_to_scan - nr_scanned);
>> +
>> +			/*
>> +			 * Account for the committed budget rather than the walker's
>> +			 * actual delta. If the list is emptied concurrently, the
>> +			 * walker visits nothing and nr_scanned would never advance.
>> +			 */
>> +			nr_scanned += nr_to_walk;
>> +
>> +			list_lru_walk_one(&zswap_list_lru, nid, memcg,
>> +					  &shrink_memcg_cb,
>> +					  &walk_arg,
>> +					  &nr_to_walk);
>> +
>> +			if (walk_arg.bytes_written >= bytes_to_writeback)
>> +				return walk_arg.bytes_written;
>> +
>> +			if (walk_arg.encountered_page_in_swapcache)
>> +				break;
>> +
>> +			cond_resched();
>> +		}
> 
> If the caller is expected to have a retry loop anyway, should we
> simplify this and just scan each per-node LRU once?
> 
> We should also probably bail early if the number of scanned pages has
> already been reached? Currently shrink_memcg() scans one page at a time,
> so if it scans a bit more to balance between the nodes it's probably
> fine.
> 
> But with batching, we could end up scanning hundres of extra pages just
> to balance between all nodes. Is node imbalance a real issue?
> 

My initial thought was that if cold memory is evenly distributed across 
nodes and we are doing a large writeback, it would be better to balance 
the zswap entry writeback across all nodes rather than just draining 
node 0 first. However, since we currently lack a proper metric to 
represent hot/cold memory (such as age-based tracking), doing this 
probably doesn't make much sense right now.

So, perhaps we want something like this? Please correct me if I'm wrong.

static long shrink_memcg(struct mem_cgroup *memcg,
        unsigned long nr_to_scan)
{
   struct zswap_shrink_walk_arg walk_arg = {
     .bytes_written = 0,
     .encountered_page_in_swapcache = false,
   };
   unsigned long nr_remaining = nr_to_scan;
   bool memcg_list_is_empty = true;
   int nid;

   if (!mem_cgroup_zswap_writeback_enabled(memcg))
     return -ENOENT;

   if (memcg && !mem_cgroup_online(memcg))
     return -ENOENT;

   for_each_node_state(nid, N_NORMAL_MEMORY) {
     unsigned long nr_to_walk;

     /*
      * Cap the per-node scan by the current LRU length. A referenced
      * entry is only rotated to the tail (second chance) and may be
      * revisited within a single walk; without this cap those rotated
      * entries could drain the shared scan budget on one node.
      */
     nr_to_walk = min(nr_remaining,
          list_lru_count_one(&zswap_list_lru, nid, memcg));
     if (!nr_to_walk)
       continue;
     memcg_list_is_empty = false;

     nr_remaining -= nr_to_walk;
     list_lru_walk_one(&zswap_list_lru, nid, memcg,
           &shrink_memcg_cb, &walk_arg, &nr_to_walk);
     /* Return the unused share of the budget to the pool. */
     nr_remaining += nr_to_walk;

     /* Bail out once the whole scan budget has been spent. */
     if (!nr_remaining)
       break;

     cond_resched();
   }

   if (memcg_list_is_empty)
     return -ENOENT;

   return walk_arg.bytes_written;
}

Thanks,
Hao
