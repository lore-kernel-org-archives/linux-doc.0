Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CF4473C9F
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117771; cv=none; b=mQLsALyjBOWkdW0yMue52sipLsAY3p45fLIP8AURii5vkQfLrdfEevgJL3M9yIHO2ANJQYRXbSz1mW/NhJpgCdVdIGy2Wjp+gqv5+5BKtypy2prZdQ7fKg2DHhgsk6+ZpDP3BNLbES2FqmHhDKC9VDjZViSVtt8gkn4iqhrxbNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117771; c=relaxed/simple;
	bh=yp1hs+SwwFUDahLN4JScNiWQyiGFo5VleKvlH38FXIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJafYemLWuGrlCWjpCkr+qS0Nepv6xmqnBejI8v8rCYhU0ESZh1XcGFy7ZqVaTY2huoURFnMyXlDLeLgLyfhZVO00nnc4Xe8pg6JfkB193Qt+LsIi4tvBW1liDu7Xj1vGA6V9Kc4PKz0sx+FN4C1Zs6JdIIc1opWjx1zBpncP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=U6ahlEey; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="U6ahlEey"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso15526626d6.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1786117766; x=1786722566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEn2KGn5WZDKTdyZCzrkPMcKy/ABJR6AC0QsaSC3OWk=;
        b=U6ahlEeyF2MnVY8m39vPbNNBnICbh/f241swDAZID7b72hcArcVJZqwXAwMbfgQFJg
         rJ9AIYLxV8hNNcWewi1KR9FA4GiKnm9BG9ObTh7eIkVgxbcjTxUQrdKF7labVAgCx3Qd
         9U/hCipVyVQiyGb5DvtOshXjVht1UibJkLHJtr3cNUIE2DrDkYNfvBD9lSML1384su6/
         pq7zOh4WqUfKk1u/86Td2e/kA4fKrU2ggQ2rzo4aZRe15qvLl5YR/gAVlFazKInK/Qn9
         d5Z9178HSMDMq1ggjaA+p3+KopCkhgzevnpnOvpqA1ck+gfKaBEyoVVJ4/45KouSXQyo
         ilnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117766; x=1786722566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEn2KGn5WZDKTdyZCzrkPMcKy/ABJR6AC0QsaSC3OWk=;
        b=n0gzOaEpZVqJDV3mHX47Mj7j0Xqn8lcG0cBblwTuLieEgQzPrgUsFwsji8rOvL+2s1
         Cd5FvutLjMBrxXRjSkpZu6UnpYLJa/0mCkxae54IJwYfzGrzC4t6zuOANVa6brpOViZk
         T9Ecmoc08O02RRS0lsK5XvM1Mt4o86tSPts+CDAkmSXJ/TurD/jaxlRZn2HFA5XQWnX1
         91e606P+YIZaoT4fIBDWipehKfl8z9FSilGileKO0Ht2lcI7aXi0uWH3AqorIeu0i0dQ
         /K22RBgae+X7IOQ9CUTk7HsbgBrLZD2QXRKSXDHsWkd6B4eLUdikEp5/1MEJgFqherLi
         focA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8wVM9TY05vCMez1E4h2dWftlPDMV81MZ6U5HLR4ttdPj0DHzMXAgsspjhdAcTyxqy+xhgPB2/zQo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0Dv9U2u0ajx9dDMzw5Lyjia7UoDxfNW2934wtn7CFOvuEV86
	OG9NNJtzFFBPHDrpPoZV+KMdxIaanKbFSXDTUbvETxDvcAdZASVSSi5BDWqEKE45VAQ=
X-Gm-Gg: AR+sD1347ps/NxJQhhmRfbyUaYhBuTFG+jCU1DcHzsbcYQJEWTR9xrC6gZzYqyYEM6H
	vvz6Dyioeda8egyvLnxW4Grc00o373ElVRXopB+cLpXo9r+UY2yAUFO4HIEkVvDR8qmF3DU+U0R
	jLF2OMt+dU09wQJQH/Wd2Ju/W6LSUKTzhI5RT1iPUz4CHcDfLca8XN+BGRGMr/5rGZm9zds1zT4
	4HpqH8U2RbARIjKguAXsnhIs127nu57b3lk8rFRd8+kVrj5klW6RraDlH7YG6Goh5BK6+L84CNn
	ey5r9f5O0/4OIZwJNiyWpiJMDcZRToEwtY5ChOqf35Ik8DdelsshgHJkEb8U43AKMO7TbfLPzdf
	UPErbbWDWiZuSz0g6EciSzNqEghAVBmskhevQUd7qpeFMMzXSc7V9kuchAW0jG9aAW4qrL0drbc
	5B1yE/A6eRziLo9P2+ip9RNCFb13XLpQwY+kbQZU7QvFlMa9F7QC3SIQ+mXCs=
X-Received: by 2002:a05:6214:450e:b0:907:bf1e:f888 with SMTP id 6a1803df08f44-9088f9ec72amr206847166d6.17.1786117766300;
        Fri, 07 Aug 2026 08:49:26 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff8c6sm11404806d6.28.2026.08.07.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:49:24 -0700 (PDT)
Date: Fri, 7 Aug 2026 11:49:21 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev,
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org,
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, riel@surriel.com,
	gourry@gourry.net, haowenchao22@gmail.com, corbet@lwn.net,
	kernel-team@meta.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [PATCH v3 01/11] mm, swap: add virtual swap device infrastructure
Message-ID: <anX-ga41DMNWF6-2@cmpxchg.org>
References: <20260806184254.3790858-1-nphamcs@gmail.com>
 <20260806184254.3790858-2-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806184254.3790858-2-nphamcs@gmail.com>

Hello Nhat,

This looks pretty clean to me overall. Nice. A few comments inline:

On Thu, Aug 06, 2026 at 11:42:44AM -0700, Nhat Pham wrote:
> @@ -276,8 +277,21 @@ struct swap_info_struct {
>  	struct list_head discard_clusters; /* discard clusters list */
>  	struct plist_node avail_list;   /* entry in swap_avail_head */
>  	const struct swap_ops *ops;
> +	struct xarray cluster_info_pool; /* Xarray for vswap dynamic cluster info */
>  };
>  
> +#ifdef CONFIG_VSWAP
> +static inline bool swap_is_vswap(struct swap_info_struct *si)
> +{
> +	return si->flags & SWP_VSWAP;
> +}
> +#else

I think what could make sense is have

- CONFIG_VSWAP
- CONFIG_VSWAP_DEFAULT_ENABLED
- a boot flag that's = CONFIG_VSWAP_DEFAULT_ENABLED

Then you can use jump labels to cut runtime overhead to 0 if it isn't
enabled at boot.

This way distributions can ship it with no overhead out of the box,
while allowing users to opt in for early testing.

IMO this is more valuable than a runtime toggle.

It should be part of this patch if you add it.

> +static inline bool swap_is_vswap(struct swap_info_struct *si)
> +{
> +	return false;
> +}
> +#endif
> +
>  static inline swp_entry_t page_swap_entry(struct page *page)
>  {
>  	struct folio *folio = page_folio(page);
> @@ -402,6 +416,8 @@ void swap_free_hibernation_slot(swp_entry_t entry);
>  
>  static inline void put_swap_device(struct swap_info_struct *si)
>  {
> +	if (swap_is_vswap(si))
> +		return;
>  	percpu_ref_put(&si->users);
>  }
>  
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 331daf7fcfab..32d38b552845 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -19,6 +19,16 @@ menuconfig SWAP
>  	  used to provide more virtual memory than the actual RAM present
>  	  in your computer.  If unsure say Y.
>  
> +config VSWAP
> +	bool "Virtual swap device"
> +	depends on SWAP && 64BIT
> +	help
> +	  Adds a virtual swap layer that decouples swap entries in page
> +	  tables from physical backing storage. Swap entries are allocated
> +	  from a virtual swap device and can be backed by zswap, a physical
> +	  swapfile, or kept in memory - with the backing changeable at
> +	  runtime without invalidating page table entries.

IMO this is difficult for a user to decide.

If we want to make this as a config, then IMO the help text should be
about not requiring a swapfile to use zswap, zerofill pages etc.

From where I'm standing, though, this code is no longer a separate
vswap.c feature like it used to be. It's pretty integrated into the
swapcode, and it looks like a good chunk of the core datastructures
aren't conditional either.

At that point, the usefulness of the config option is limited. If you
go with the jump label and there is no runtime overhead, it might make
sense to just keep the option on what the JL should default to.

> @@ -143,9 +150,19 @@ static inline struct swap_info_struct *__swap_entry_to_info(swp_entry_t entry)
>  static inline struct swap_cluster_info *__swap_offset_to_cluster(
>  		struct swap_info_struct *si, pgoff_t offset)
>  {
> +	unsigned int cluster_idx = offset / SWAPFILE_CLUSTER;
> +
>  	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
>  	VM_WARN_ON_ONCE(offset >= roundup(si->max, SWAPFILE_CLUSTER));
> -	return &si->cluster_info[offset / SWAPFILE_CLUSTER];
> +
> +	if (swap_is_vswap(si)) {
> +		struct swap_cluster_info_dynamic *ci_dyn;
> +
> +		ci_dyn = xa_load(&si->cluster_info_pool, cluster_idx);
> +		return ci_dyn ? &ci_dyn->ci : NULL;
> +	}
> +
> +	return &si->cluster_info[cluster_idx];
>  }

This now requires rcu. IMO a kdoc explaining that would be good.

> @@ -733,6 +765,11 @@ static void free_cluster(struct swap_info_struct *si, struct swap_cluster_info *
>  		return;
>  	}
>  
> +	if (swap_is_vswap(si)) {
> +		vswap_free_cluster(si, ci);
> +		return;
> +	}
> +
>  	__free_cluster(si, ci);

Should this be part of __free_cluster() instead?

- swap_cluster_assert_empty() seems useful.
- move_cluster() handles the list linkage and could do the list_del().
- swap_cluster_free_table() is the same.

The other caller is the discard path. That one isn't relevant, but it
shouldn't hurt. The layering would still be a bit cleaner this way.

> @@ -835,14 +872,21 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
>   * stolen by a lower order). @usable will be set to false if that happens.
>   */
>  static bool cluster_reclaim_range(struct swap_info_struct *si,
> -				  struct swap_cluster_info *ci,
> +				  struct swap_cluster_info **pcip,
>  				  unsigned long start, unsigned int order,
>  				  bool *usable)
>  {
> +	struct swap_cluster_info *ci = *pcip;
>  	unsigned int nr_pages = 1 << order;
>  	unsigned long offset = start, end = start + nr_pages;
>  	unsigned long swp_tb;
>  
> +	/*
> +	 * Take RCU read lock before releasing the cluster lock to keep ci
> +	 * alive - for vswap dynamic clusters, ci is freed via kfree_rcu
> +	 * and the grace period could otherwise elapse in the window.
> +	 */
> +	rcu_read_lock();
>  	spin_unlock(&ci->lock);

Since you replace the naked spin_lock() below with
swap_cluster_lock(), change this to swap_cluster_unlock() as well?

>  	do {
>  		swp_tb = swap_table_get(ci, offset % SWAPFILE_CLUSTER);
> @@ -852,7 +896,15 @@ static bool cluster_reclaim_range(struct swap_info_struct *si,
>  			if (__try_to_reclaim_swap(si, offset, TTRS_ANYWAY) < 0)
>  				break;
>  	} while (++offset < end);
> -	spin_lock(&ci->lock);
> +	rcu_read_unlock();
> +
> +	/* Re-lookup: dynamic cluster may have been freed while lock was dropped */
> +	ci = swap_cluster_lock(si, start);
> +	*pcip = ci;
> +	if (!ci) {
> +		*usable = false;
> +		return false;
> +	}
>  
>  	/*
>  	 * We just dropped ci->lock so cluster could be used by another

> @@ -1146,6 +1239,12 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
>  			goto done;
>  	}
>  
> +	if (swap_is_vswap(si)) {
> +		found = alloc_swap_scan_dynamic(si, folio);
> +		if (found)
> +			goto done;
> +	}

The name and the composability look off to me.

Can you make this a pure allocation function - vswap_alloc_cluster()
or something - that links it to &si->free_clusters, then jump back and
use the existing alloc_swap_scan_list() sites?

There is a new_cluster: label upstream you could use for the retry.

> +
>  	if (!(si->flags & SWP_PAGE_DISCARD)) {
>  		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
>  		if (found)
> @@ -1264,6 +1363,13 @@ static void add_to_avail_list(struct swap_info_struct *si, bool swapon)
>  			goto skip;
>  	}
>  
> +	/*
> +	 * Keep vswap off the avail list - it is not allocated from by
> +	 * the physical swap allocator (swap_alloc_fast/slow).
> +	 */
> +	if (swap_is_vswap(si))
> +		goto skip;

This is describing what the code does, followed by a why not.

Describe the why: Vswap space is only allocated through [...], not [...]

> @@ -3528,10 +3668,43 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
>  				    unsigned long maxpages)
>  {
>  	unsigned long nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
> -	struct swap_cluster_info *cluster_info;
> +	struct swap_cluster_info *cluster_info = NULL;
> +	struct swap_cluster_info_dynamic *ci_dyn;
>  	int err = -ENOMEM;
>  	unsigned long i;
>  
> +	/* For SWP_VSWAP files, initialize Xarray pool instead of static array */
> +	if (swap_is_vswap(si)) {
> +		/*
> +		 * Pre-allocate cluster 0 and mark slot 0 (header page)
> +		 * as bad so the allocator never hands out page offset 0.
> +		 */
> +		ci_dyn = kzalloc_obj(*ci_dyn, GFP_KERNEL);
> +		if (!ci_dyn)
> +			goto err;
> +		spin_lock_init(&ci_dyn->ci.lock);
> +		INIT_LIST_HEAD(&ci_dyn->ci.list);
> +
> +		nr_clusters = 0;

But it's one, not zero. And only the first slot is bad. Why is the
rest not usable and the cluster on the nonfull_clusters list?

I think you can make the integration a bit more organic in general:

Don't do the DIV_ROUND_UP per default only to overwrite it here again
e.g.

If you come out of this branch with cluster_info == &ci_dyn->ci, you
should be able to reuse the existing swap_cluster_setup_bad_slot(0).

swap_header && i < swap_header->info.nr_badpages should skip that loop
as well.

Your maxpages is SWAPFILE_CLUSTER aligned, so that

	for (i = maxpages; i < round_up(maxpages, SWAPFILE_CLUSTER); i++) {

loop is skipped as well.

> +		xa_init_flags(&si->cluster_info_pool, XA_FLAGS_ALLOC);
> +		err = xa_insert(&si->cluster_info_pool, 0, ci_dyn, GFP_KERNEL);
> +		if (err) {
> +			kfree(ci_dyn);
> +			goto err;
> +		}
> +
> +		err = swap_cluster_setup_bad_slot(si, &ci_dyn->ci, 0, false);
> +		if (err) {
> +			xa_erase(&si->cluster_info_pool, 0);
> +			swap_cluster_free_table(&ci_dyn->ci);
> +			kfree(ci_dyn);

IMO it would be nicer to make this part of free_swap_cluster_info()
instead of duplicating it.

> +			xa_destroy(&si->cluster_info_pool);

That one probably doesn't matter. If these allocations fail at boot,
the system is in trouble.

> +			goto err;
> +		}
> +
> +		goto setup_cluster_info;
> +	}
> +
>  	cluster_info = kvzalloc_objs(*cluster_info, nr_clusters);
>  	if (!cluster_info)
>  		goto err;
> @@ -3556,6 +3729,10 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
>  	err = swap_cluster_setup_bad_slot(si, cluster_info, 0, false);
>  	if (err)
>  		goto err;
> +
> +	if (!swap_header)
> +		goto setup_cluster_info;

Is this reachable?

> @@ -3949,3 +4127,51 @@ static int __init swapfile_init(void)
>  	return 0;
>  }
>  subsys_initcall(swapfile_init);
> +
> +#ifdef CONFIG_VSWAP
> +struct swap_info_struct *vswap_si;
> +
> +/* vswap does no IO on its own. */
> +static const struct swap_ops vswap_ops = { };
> +
> +static int __init vswap_init(void)
> +{
> +	struct swap_info_struct *si;
> +	unsigned long maxpages;
> +	int err;
> +
> +	si = alloc_swap_info();
> +	if (IS_ERR(si))
> +		return PTR_ERR(si);
> +
> +	maxpages = min(swapfile_maximum_size,
> +		       ALIGN_DOWN((unsigned long)UINT_MAX, SWAPFILE_CLUSTER));
> +	si->flags |= SWP_VSWAP | SWP_SOLIDSTATE | SWP_WRITEOK;

Please add a comment on the flag choices besides SWP_VSWAP.
