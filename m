Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0BE438FED
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511051; cv=none; b=L2Izu7/IWVu89Cp6yZfrjt569PIEjbjjgAUo4j/n7eWPHPWlUSCA1CSx7xJDzwbcYcOG8+z8lBycnEFQmANf8W0aV5N7whcYpEsIID3mIyPHfYzP6phLMv9WYDrOkS+S4Eagm9RsAHsnWWJY9LsSb7jBYd+lLwBAP6sc4itXC98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511051; c=relaxed/simple;
	bh=+rFvkEUVHhGnakXT2C6RjvEvZP/YK7EI2KDjrY+pLTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBNkKxIQtNtuAj89giqVryKuYSpSdzqI1xowZqvp1X/GGC5qhBZmTzhLW9N7AP8fn7p0966gGX9TQJ9QucSrCsxfeGlATwrwlVRzILsJYS+fvIND6j+yLfyhpTZpyw3LfP4rYSQidwemhAGblJsAWfu17mUQorhg3yKhAhMtfQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=l+qni/mP; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="l+qni/mP"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e53581361so58947785a.1
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1785511046; x=1786115846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QOdikcJRo1h3a9sD/t/2mX2tsaLsS7uHoOpBXELRAPI=;
        b=l+qni/mPZhyD2qhOfY9jSD+O3c67kN0v4qlSbk3nYOiP093IK+6iRwvcqTk7tUFDSr
         Cht7FNDsK7dq4uKkI0U2csJvCfYDmLYOJy3qBlikFEZLUsuvvjcyfACGADoP3Csrw+NB
         Gz77NU1BUGF9sYKZzjHgWTQM2DSpYNTUbmI8cKtZ9MEhkzGl05vBWBtqbi7cYOI0RhLQ
         EYOeIridFN81expdfRnP/9krXW5RPGwsYVTs83EHYdH2ZQpNq1m9WwOsoHNtXSTrHLi2
         VMdroKmiCmYgT+SpTpejMQjQOjK3Nq9bEeI1oe1X5DPAnyhFRr+LWsagN41mkTZYKrVV
         +8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511046; x=1786115846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOdikcJRo1h3a9sD/t/2mX2tsaLsS7uHoOpBXELRAPI=;
        b=QhbirxTm9TwvfHBWGgA2VmXGVTDvI0YPlJXfmIAxBm3ZHzvjbeC2TdODDbsNf0Z2O2
         +va2qJzxW2+/40PSnYQRxjeTf9GtQQPLDLlIgPQXQOYD5Lw6lldc8bXkVvx8GseGoibN
         HVmNM48GV4iS8rnJkFzv4Fo/Byh64gOoWJbepFdNqY2X/+16oBE6c/h/WYKnP4/6kNVm
         zgWdyWyAeIWgCujiFmR3tPsOCnZfujcTMZHt6ibj3wg127y8QDS8mx/inDIqAGAFezaY
         aX33wHYREZn2yEu64p9IwLCZ7G4u5ub9qxyEV29pBrpfwGIag7vDq84D6bDaQZPDyfZZ
         Sf+w==
X-Forwarded-Encrypted: i=1; AHgh+RpQRkuUgqTchV8pOg99enRA5rQQjxOV/mynG1b9LTWTMoplcaHHbJRLbNuKhfOvr1me0EHnOP/qLig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0u0qn19qI/w7/M/B1yGt8i2SR60lFGQCggnkAJLhXVis/M8xW
	zBHULvIc4sD6zYddyeU0AhLj3Vrgy7+8OkCNROVgy9jhizIq1EaFsI95Xy+Ln6d8RJI=
X-Gm-Gg: AR+sD10b1qRA00ULH0d4dlaJSERiOgKn0zAlEWB9DWl2Buh5710TGNIpQ26UMdKhFR5
	WcmDLS3uY1H4r6irhyVTMF8U6MEcXBkunVEmBbWbu7KMfs2HT8pTYMlX4Beio/dprPEKWIhSsGL
	ES0Eq0nPQJ3cxcENV58gE8PJrtmI9xsPIMwGFKYeYq2uZuREZPvfz7oSfG/nQR/UF4wRVGE0LK/
	cBQGbCxtFh4k0rRsZM/JUkPzJu6jM3G5IiAu7pQWj71E7HmlsCnpMtJRZMtB4QApjxKdPWpLnjj
	VnaipEI6OyhW2FgVgYsnQ8VfnS629N53ZS/Y8/WmXQTQ7tZLqOYZFuslZ1b6gjDpYvp+Zee2UP3
	rPasSjdUCuht2yj4TiSi7uki2FKwXA1vb1TSQEqhsS1RjeOllwtJDmgwtwhBnvzN8Bdicgt7iej
	PO6T+Tqz1q3XiAO+e4yQyRJORgc8EjViV0mnR7xHkI5TIUszAHUpOTzEIZLvI=
X-Received: by 2002:a05:620a:1003:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-934a08b94e9mr67580585a.21.1785511045509;
        Fri, 31 Jul 2026 08:17:25 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349c199e03sm73739985a.30.2026.07.31.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:17:23 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:17:20 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev,
	jiahao1@lixiang.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@kernel.org,
	mkoutny@suse.com, muchun.song@linux.dev, nphamcs@gmail.com,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	stable@vger.kernel.org, tj@kernel.org, yosry@kernel.org
Subject: Re: [PATCH v3 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
Message-ID: <amy8gAN33W4QsM5R@cmpxchg.org>
References: <amufiuAaZbuDdKkQ@cmpxchg.org>
 <20260731071900.38942-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731071900.38942-1-jiahao.kernel@gmail.com>

On Fri, Jul 31, 2026 at 03:19:00PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> Currently, shrink_memcg() writes back at most one entry per-node during
> its traversal. This makes shrink_worker() inefficient, as it must
> repeatedly re-enter shrink_memcg() to make any substantial progress.
> Under high memory pressure, this can cause the writeback speed to be
> too slow to keep up with refaults, leading to zswap store failures and
> forcing pages to skip zswap and go directly to disk, which results in
> an LRU inversion.
> 
> To address this, extend shrink_memcg() and rewrite its LRU iteration logic,
> enabling batch writeback for both the shrink_worker() and zswap_store() paths.
> To prevent shrink unfairness across NUMA nodes caused by a shared global scan
> quota, limit scanning to up to SWAP_CLUSTER_MAX pages per node and write back
> any reclaimable entries found.
> 
> Test Setup:
> - Total memory: 32 GB, 1 NUMA node.
> - zswap settings: accept_threshold_percent=50, shrinker_enabled=N.
> 
> Test Case 1:
> Set max_pool_percent=1, allocate 512MB of anonymous pages, and fill them
> with random data (to avoid compression). Then, use cgroup memory.reclaim
> to force a large amount of anonymous pages into zswap. At an interval of
> 2ms, allocate a 4K anonymous page where the first 4 bytes are random numbers
> and the rest are zeros, and then trigger reclamation of this 4K page through
> cgroup memory.reclaim. When the pool threshold is reached, shrink_memcg()
> will be triggered.
> The test data after running for 120s is as follows:
>                                 Baseline      Patched
> shrink_worker wakeups              5,363          169
> shrink_memcg calls            11,373,201      350,703
> written_back pages                40,212       40,241
> zswap_store calls                161,190      163,753
>    store succeeded (ret=1)       102,743      117,183
>    store rejected (ret=0)         58,447       46,570
>    store reject rate                ~36%        ~28%
> pool_limit_hit delta              55,826       33,760
> pswpout                           98,659       86,811
> pswpin                                 2            0
> 
> Test Case 2:
> We evaluated the following two sub-configurations using stress-ng inside
> a cgroup capped at memory.max=1G for 120 seconds:
>   Test Case 2a (max_pool_percent=1): Continuously triggers the global
>   zswap pool limit, thereby waking up shrink_worker() to perform asynchronous
>   shrinking.
>   Test Case 2b (zswap.max=320M, max_pool_percent=50): Continuously triggers
>   the cgroup's zswap.max limit, thereby invoking synchronous shrinking.
> Command executed for both setups:
>    bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
>    exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t \
> 120s -q'
> 
> Test Case 2a (max_pool_percent=1):
>                                 Baseline       Patched
> shrink_worker wakeups              5,640         1,308
> shrink_memcg calls             8,481,500     3,140,972
> written_back pages                   260       468,216
> zswap_store calls              2,742,756     2,011,269
>    store succeeded (ret=1)       934,640       947,988
>    store rejected (ret=0)      1,808,116     1,063,281
>    store reject rate                ~66%          ~52%
> pool_limit_hit delta           1,181,310       196,882
> pswpout                        1,808,376     1,531,497
> pswpin                         4,288,497     3,635,365
> Test Case 2b (zswap.max=320M, max_pool_percent=50):
>                                 Baseline       Patched
> shrink_worker wakeups                 0              0
> shrink_memcg calls              687,608         54,002
> written_back pages              639,176        846,663
> zswap_store calls             1,224,222      1,228,548
>    store succeeded (ret=1)      992,816      1,208,123
>    store rejected (ret=0)       231,431         20,425
>    store reject rate               ~19%            ~2%
> pool_limit_hit delta                  0              0
> pswpout                         870,745        867,360
> pswpin                        1,707,823      1,216,814
> 
> Under identical workloads and runtimes, batched zswap shrinking
> exhibits a significant reduction in both shrink_worker() wakeups
> and shrink_memcg() calls. Furthermore, the sharp drop in both pswpin
> and zswap_store() rejections demonstrates that batching zswap shrink
> operations effectively mitigates zswap_store() failures caused by
> hitting the pool limit. This significantly prevents pages from bypassing
> zswap and falling back directly to disk, thereby reducing LRU inversion.
> 
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Acked-by: Yosry Ahmed <yosry@kernel.org>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---
>  mm/zswap.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 48fc7b575e24..d406c14925d8 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1275,6 +1275,21 @@ static struct shrinker *zswap_alloc_shrinker(void)
>  	return shrinker;
>  }
>  
> +/*
> + * Scan up to SWAP_CLUSTER_MAX pages on each per-node zswap LRU of @memcg
> + * and write back the reclaimable ones.
> + *
> + * Since the second-chance algorithm rotates referenced entries to the
> + * LRU tail, the per-node scan is capped at the current LRU length so
> + * each entry is scanned at most once per call. It is up to the caller
> + * to handle retries, deciding whether to scan another memcg to complete
> + * the full iteration, or to rescan the current memcg to drain its zswap
> + * entries.
> + *
> + * Return: 0 if at least one entry was written back, -EAGAIN if entries
> + * were scanned but none could be written back, or -ENOENT if @memcg has
> + * writeback disabled, is a zombie cgroup, or has empty zswap LRUs.
> + */
>  static int shrink_memcg(struct mem_cgroup *memcg)
>  {
>  	int nid, shrunk = 0, scanned = 0;
> @@ -1290,13 +1305,24 @@ static int shrink_memcg(struct mem_cgroup *memcg)
>  		return -ENOENT;
>  
>  	for_each_node_state(nid, N_NORMAL_MEMORY) {
> -		unsigned long nr_to_walk = 1;
> +		unsigned long nr_to_walk, node_budget;
> +
> +		/*
> +		 * Cap the scan at the per-node LRU length so each entry is
> +		 * scanned at most once per call.
> +		 */
> +		node_budget = min(SWAP_CLUSTER_MAX,
> +			     list_lru_count_one(&zswap_list_lru, nid, memcg));

AFAICS you can just do unsigned long nr_to_walk = SWAP_CLUSTER_MAX.

__list_lru_walk_one() does a list_for_each_safe() that will exit the
same way whether you hit !nr_to_walk or run out of items.

> +		if (!node_budget)
> +			continue;
>  
> +		nr_to_walk = node_budget;
>  		shrunk += list_lru_walk_one(&zswap_list_lru, nid, memcg,
>  					    &shrink_memcg_cb, NULL, &nr_to_walk);
> -		scanned += 1 - nr_to_walk;
> +		scanned += node_budget - nr_to_walk;

scanned += SWAP_CLUSTER_MAX - nr_to_walk;
