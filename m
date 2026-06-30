Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492740D56E;
	Tue, 30 Jun 2026 00:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782778884; cv=none; b=ZRsXypMnTy9SkMAOl76L6gKM7cTmu2CWpEHjXJ/wLK3Rl8pK7gfOu1DxRs4veFr8B8MLGJ4r7fhPUZiMQA+4pKBT644N+OzWzbqJ4GB6LCPsCU2HekFRNdb+2RH/oy8cVZuz/ACoRZI7gxiL1uhiA1rJxUchEuUZUCMHDmqkqVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782778884; c=relaxed/simple;
	bh=svZTC27/HfcWhHXOxCXFEqj1QkR700/F7jZCYTCPn4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3/fEk8+YDg49f6YuhXNBkPx4ZCYrNqjnwi8SxcE0FQnPgiIzSBhn90Af8JWf/r7kJrNFcmKjyCOmdTh2yCrvvvVVrlrbpnp8nYRzYYb2QTezsTsJSLg4ddqUGkQldvR9kqteyQW28cuOGJRGGhknehF3k8nB0kL2ECkr6MNpR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYRxfn9j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYRxfn9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83901F000E9;
	Tue, 30 Jun 2026 00:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782778882;
	bh=h1/03gzz0ds6TJ32gK+FBdEfAwHCvhh8gu24bRY2Uww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZYRxfn9jVr+A5PLaXrQF9dGV/f3hx+W7pEF9cfhnxwTqN1zqjfwYFHLeWdnR0tbRo
	 iUT8bKmz5Nr+vxL/dvb7aSuUiEsSAMokytDA+DSSNqpJMEhOCylC5unlyYFdELEI9q
	 FKXRlMfi3EajzpE8QpInWzV6BiM0w+cIVuFp5FsIci4P8+4E6ZUeRMYc3DB8uDu7Fn
	 8Np6LRlexJW08bCuLavHNtIm54x/S1acgbTAh05wg1HsLXU3W2pNIT8MPGBDdvlsqq
	 j83wjtCeA0F1RrYNFQUNCPwwhbpw27sHoPb9sfRQKiYYQSPxTzwWUiprGe+gsdl2Fj
	 zvF2KaIwwWXlQ==
Date: Tue, 30 Jun 2026 00:21:20 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v5 2/6] mm/zswap: Support batch writeback in
 shrink_memcg()
Message-ID: <akMK9z_GOarOZWHz@google.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-3-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629112032.20423-3-jiahao.kernel@gmail.com>

On Mon, Jun 29, 2026 at 07:20:28PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> Currently, shrink_memcg() writes back at most one entry per-node during
> its traversal. This makes shrink_worker() inefficient, as it must
> repeatedly re-enter shrink_memcg() to make any substantial progress.
> 
> To address this, extend shrink_memcg() and rewrite its LRU iteration logic
> to support batch writeback. Introduce the nr_to_scan parameter to bound how
> many pages are scanned per call. This enables batch writeback in the
> shrink_worker() path, while maintaining a low scan budget in the
> zswap_store() path.
> 
> Additionally, to prepare for future proactive writeback, update the return
> value semantics of shrink_memcg(): a positive value now represents the
> actual number of compressed bytes written back, 0 indicates that candidates
> existed but no writeback succeeded, and a negative value represents an
> error code.
> 
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---
>  mm/zswap.c | 89 ++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 69 insertions(+), 20 deletions(-)
> 
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 0f8f04f22888..e2c2a3f1e061 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -160,6 +160,11 @@ struct zswap_pool {
>  	char tfm_name[CRYPTO_MAX_ALG_NAME];
>  };
>  
> +struct zswap_shrink_walk_arg {
> +	unsigned long bytes_written;
> +	bool encountered_page_in_swapcache;
> +};
> +
>  /* Global LRU lists shared by all zswap pools. */
>  static struct list_lru zswap_list_lru;
>  
> @@ -1089,8 +1094,9 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>  				       void *arg)
>  {
>  	struct zswap_entry *entry = container_of(item, struct zswap_entry, lru);
> -	bool *encountered_page_in_swapcache = (bool *)arg;
> +	struct zswap_shrink_walk_arg *walk_arg = arg;
>  	swp_entry_t swpentry;
> +	unsigned int length;
>  	enum lru_status ret = LRU_REMOVED_RETRY;
>  	int writeback_result;
>  
> @@ -1133,10 +1139,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>  
>  	/*
>  	 * Once the lru lock is dropped, the entry might get freed. The
> -	 * swpentry is copied to the stack, and entry isn't deref'd again
> -	 * until the entry is verified to still be alive in the tree.
> +	 * needed fields are copied to the stack, and entry isn't deref'd
> +	 * again until it is verified to still be alive in the tree.
>  	 */
>  	swpentry = entry->swpentry;
> +	length = entry->length;
>  
>  	/*
>  	 * It's safe to drop the lock here because we return either
> @@ -1155,12 +1162,13 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>  		 * into the warmer region. We should terminate shrinking (if we're in the dynamic
>  		 * shrinker context).
>  		 */
> -		if (writeback_result == -EEXIST && encountered_page_in_swapcache) {
> +		if (writeback_result == -EEXIST) {
>  			ret = LRU_STOP;
> -			*encountered_page_in_swapcache = true;
> +			walk_arg->encountered_page_in_swapcache = true;
>  		}
>  	} else {
>  		zswap_written_back_pages++;
> +		walk_arg->bytes_written += length;
>  	}
>  
>  	return ret;
> @@ -1169,8 +1177,11 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
>  static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
>  		struct shrink_control *sc)
>  {
> +	struct zswap_shrink_walk_arg walk_arg = {
> +		.bytes_written = 0,
> +		.encountered_page_in_swapcache = false,
> +	};
>  	unsigned long shrink_ret;
> -	bool encountered_page_in_swapcache = false;
>  
>  	if (!zswap_shrinker_enabled ||
>  			!mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
> @@ -1179,9 +1190,9 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
>  	}
>  
>  	shrink_ret = list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_memcg_cb,
> -		&encountered_page_in_swapcache);
> +		&walk_arg);
>  
> -	if (encountered_page_in_swapcache)
> +	if (walk_arg.encountered_page_in_swapcache)
>  		return SHRINK_STOP;
>  
>  	return shrink_ret ? shrink_ret : SHRINK_STOP;
> @@ -1275,9 +1286,31 @@ static struct shrinker *zswap_alloc_shrinker(void)
>  	return shrinker;
>  }
>  
> -static int shrink_memcg(struct mem_cgroup *memcg)
> +#define NR_ZSWAP_WB_BATCH	64UL
> +
> +/*
> + * Scan up to @nr_to_scan pages across the per-node zswap LRUs of @memcg
> + * and write back the reclaimable ones.
> + *
> + * Since the second-chance algorithm rotates referenced entries to the
> + * LRU tail, the per-node scan is capped at the current LRU length so
> + * each entry is scanned at most once per call. It is up to the caller
> + * to handle retries, deciding whether to scan another memcg to complete
> + * the full iteration, or to rescan the current memcg to drain its zswap
> + * entries.
> + *
> + * Return: The number of compressed bytes written back (>= 0), or -ENOENT
> + * if @memcg has writeback disabled, is a zombie cgroup, or has empty
> + * zswap LRUs.
> + */
> +static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
>  {
> -	int nid, shrunk = 0, scanned = 0;
> +	struct zswap_shrink_walk_arg walk_arg = {
> +		.bytes_written = 0,
> +		.encountered_page_in_swapcache = false,
> +	};
> +	unsigned long nr_remaining = nr_to_scan;
> +	int nid;
>  
>  	if (!mem_cgroup_zswap_writeback_enabled(memcg))
>  		return -ENOENT;
> @@ -1290,24 +1323,40 @@ static int shrink_memcg(struct mem_cgroup *memcg)
>  		return -ENOENT;
>  
>  	for_each_node_state(nid, N_NORMAL_MEMORY) {
> -		unsigned long nr_to_walk = 1;
> +		unsigned long nr_to_walk;
>  
> -		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
> -					    &shrink_memcg_cb, NULL, &nr_to_walk);
> -		scanned += 1 - nr_to_walk;
> +		/*
> +		 * Cap the scan at per-node LRU length so each entry is scanned
> +		 * at most once per call.
> +		 */
> +		nr_to_walk = min(nr_remaining,
> +				 list_lru_count_one(&zswap_list_lru, nid, memcg));
> +		if (!nr_to_walk)
> +			continue;
> +
> +		nr_remaining -= nr_to_walk;
> +		list_lru_walk_one(&zswap_list_lru, nid, memcg, &shrink_memcg_cb,
> +				  &walk_arg, &nr_to_walk);
> +		/* Return the unused share of the budget to the pool. */
> +		nr_remaining += nr_to_walk;
> +
> +		if (!nr_remaining)
> +			break;
>  	}
>  
> -	if (!scanned)
> +	/* Nothing was scanned: every LRU under @memcg was empty. */
> +	if (nr_remaining == nr_to_scan)
>  		return -ENOENT;
>  
> -	return shrunk ? 0 : -EAGAIN;
> +	return walk_arg.bytes_written;
>  }
>  
>  static void shrink_worker(struct work_struct *w)
>  {
>  	struct mem_cgroup *memcg;
> -	int ret, failures = 0, attempts = 0;
> +	int failures = 0, attempts = 0;
>  	unsigned long thr;
> +	long ret;
>  
>  	/* Reclaim down to the accept threshold */
>  	thr = zswap_accept_thr_pages();
> @@ -1373,7 +1422,7 @@ static void shrink_worker(struct work_struct *w)
>  			goto resched;
>  		}
>  
> -		ret = shrink_memcg(memcg);
> +		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>  		/* drop the extra reference */
>  		mem_cgroup_put(memcg);
>  
> @@ -1394,7 +1443,7 @@ static void shrink_worker(struct work_struct *w)
>  		}
>  		++attempts;
>  
> -		if (ret && ++failures == MAX_RECLAIM_RETRIES)
> +		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
>  			break;
>  resched:
>  		cond_resched();
> @@ -1504,7 +1553,7 @@ bool zswap_store(struct folio *folio)
>  	objcg = get_obj_cgroup_from_folio(folio);
>  	if (objcg && !obj_cgroup_may_zswap(objcg)) {
>  		memcg = get_mem_cgroup_from_objcg(objcg);
> -		if (shrink_memcg(memcg)) {
> +		if (shrink_memcg(memcg, num_node_state(N_NORMAL_MEMORY)) <= 0) {

Why not just 1? 

I guess the current behavior will try each node. But this doesn't really
match it, as we may reclaim everything from the first node. Right?

I think it's probably fine to just do 1 here, fairness is not the main
concern in this code path, we're really just trying to free up some
space to free up some space for the incoming page. I doubt these limits
are actually being used extensively anyway, so we can revisit this later
if needed.

>  			mem_cgroup_put(memcg);
>  			goto put_objcg;
>  		}
> -- 
> 2.34.1
> 
