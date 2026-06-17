Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295A3BB66B
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682893; cv=none; b=R06pQ3dpn13m6366KhtpiLbzO5uDqbiX4OetIT3gUF6nfg9JpwIolx6r+wXIBSU+zsxNaCU4j/3wz1VtKX5RNu8j81rWDPqTWLsrVj72e+mU5KNvuz8RsrjWw5ciDlactdYQ0e2l6Ifj3difQadgFwNTIE8L4H+MJRS76Ykl4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682893; c=relaxed/simple;
	bh=pkQig09G+83f8ggTEBprYL+a5E/lnHoIEPN2lGVtmQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQgJEJk8l/FWqMMMVBq+iqdMsvv8YFrtydAHx4y3kKONyJ73MfJU/NE1mlPXnvrdsJu8kEguG8nlhEyE8UFr4oGCBJ8jZIf7C6YD58ZTB0O9H9WERfHN1DIlRZYohAMbvMuP6O3FE+eoRXTiKz1NkqRhhP7N84ROoneER2J35/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MItORZYP; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MItORZYP"
Date: Wed, 17 Jun 2026 15:54:37 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781682889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MWtYSes6tIGGuR+SZXDuYlRAGjOXZD/BHMUqdQhGjyg=;
	b=MItORZYPQB5EbHt4M+9GB1KAhkcS+MMAvZLJXzBqJsqjvpcm9DeRX6Tg2H5CQIWEfjVHWY
	UZEWyL9WIShc2Ar1Dr0zKLywX3jRRb62KeYUq7oKmL+ewMHCK0QP1xar9uLSi0qycxTVXO
	rCU7ilHgsA6gHpQ47KstM85VADdXBUg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, liam@infradead.org, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/slub: preserve previous object lifetime in user
 tracking
Message-ID: <ajJMzHe3W8a8NGqK@fedora>
References: <20260616141410.52117-1-pengpeng@iscas.ac.cn>
 <20260616141410.52117-3-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616141410.52117-3-pengpeng@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 16, 2026 at 10:14:08PM +0800, Pengpeng Hou wrote:
> SLAB_STORE_USER stores one allocation track and one free track for an
> object.  When that object is reused, the next allocation overwrites the
> allocation track.  If a stale pointer from the previous lifetime is later
> freed or otherwise reported, the free/check report can contain the victim
> allocation and the stale operation while the previous completed alloc/free
> pair has already been overwritten.
> 
> Keep one previous completed lifetime in the existing user tracking
> metadata.  When an object is allocated and the current allocation/free
> tracks both exist, copy that completed lifetime to the previous-lifetime
> slots before recording the new allocation.  Clear the current free track
> when the new allocation begins so the current lifetime does not continue
> to display a free from the old lifetime.
> 
> Print the previous object lifetime when it is available.  This is
> diagnostic information only; it does not infer semantic ownership or
> identify the root cause of a use-after-free.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  mm/slub.c | 66 +++++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 55 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 43d4febd5bf2..358f42e92207 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -327,7 +327,13 @@ struct track {
>  	unsigned long when;	/* When did the operation occur */
>  };
>  
> -enum track_item { TRACK_ALLOC, TRACK_FREE, TRACK_NR };
> +enum track_item {
> +	TRACK_ALLOC,
> +	TRACK_FREE,
> +	TRACK_PREV_ALLOC,
> +	TRACK_PREV_FREE,
> +	TRACK_NR,
> +};
>  
>  static inline unsigned int user_tracking_size(slab_flags_t flags)
>  {
> @@ -1080,12 +1086,37 @@ static void set_track_update(struct kmem_cache *s, void *object,
>  	p->when = jiffies;
>  }
>  
> -static __always_inline void set_track(struct kmem_cache *s, void *object,
> -				      enum track_item alloc, unsigned long addr, gfp_t gfp_flags)
> +static bool track_has_record(const struct track *t)
> +{
> +	return t->addr;
> +}

how about inline it

> +
> +static void clear_track(struct kmem_cache *s, void *object,
> +			enum track_item track)
> +{
> +	memset(get_track(s, object, track), 0, sizeof(struct track));
> +}
> +
> +static void save_previous_lifetime(struct kmem_cache *s, void *object)
> +{
> +	struct track *alloc = get_track(s, object, TRACK_ALLOC);
> +	struct track *free = get_track(s, object, TRACK_FREE);
> +
> +	if (!track_has_record(alloc) || !track_has_record(free))
> +		return;
> +
> +	*get_track(s, object, TRACK_PREV_ALLOC) = *alloc;
> +	*get_track(s, object, TRACK_PREV_FREE) = *free;

Maybe we can use memcpy instead of copying them one by one.

> +}
> +
> +static __always_inline void set_alloc_track(struct kmem_cache *s, void *object,
> +					    unsigned long addr, gfp_t gfp_flags)
>  {
>  	depot_stack_handle_t handle = set_track_prepare(gfp_flags);
>  
> -	set_track_update(s, object, alloc, addr, handle);
> +	save_previous_lifetime(s, object);
> +	set_track_update(s, object, TRACK_ALLOC, addr, handle);
> +	clear_track(s, object, TRACK_FREE);

sashiko has a comment:

https://sashiko.dev/#/patchset/20260616141410.52117-1-pengpeng%40iscas.ac.cn

It seems a simple fix could be removing clear_track() and allow the stale free
track.

>  }
>  
>  static void init_tracking(struct kmem_cache *s, void *object)
> @@ -1120,11 +1151,22 @@ static void print_track(const char *s, struct track *t, unsigned long pr_time)
>  void print_tracking(struct kmem_cache *s, void *object)
>  {
>  	unsigned long pr_time = jiffies;
> +	struct track *prev_alloc;
> +	struct track *prev_free;
> +
>  	if (!(s->flags & SLAB_STORE_USER))
>  		return;
>  
>  	print_track("Allocated", get_track(s, object, TRACK_ALLOC), pr_time);
>  	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);
> +
> +	prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
> +	prev_free = get_track(s, object, TRACK_PREV_FREE);
> +	if (track_has_record(prev_alloc) || track_has_record(prev_free)) {
> +		pr_err("Previous object lifetime:\n");
> +		print_track("Previously allocated", prev_alloc, pr_time);
> +		print_track("Previously freed", prev_free, pr_time);
> +	}
>  }
>  
>  static void print_slab_info(const struct slab *slab)
> @@ -1371,10 +1413,12 @@ check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
>   *
>   * [Metadata starts at object + s->inuse]
>   *   - A. freelist pointer (if freeptr_outside_object)
> - *   - B. alloc tracking (SLAB_STORE_USER)
> - *   - C. free tracking (SLAB_STORE_USER)
> - *   - D. original request size (SLAB_KMALLOC && SLAB_STORE_USER)
> - *   - E. KASAN metadata (if enabled)
> + *   - B. current alloc tracking (SLAB_STORE_USER)
> + *   - C. current free tracking (SLAB_STORE_USER)
> + *   - D. previous alloc tracking (SLAB_STORE_USER)
> + *   - E. previous free tracking (SLAB_STORE_USER)
> + *   - F. original request size (SLAB_KMALLOC && SLAB_STORE_USER)
> + *   - G. KASAN metadata (if enabled)
>   *
>   * [Mandatory padding] (if CONFIG_SLUB_DEBUG && SLAB_RED_ZONE)
>   *   - One mandatory debug word to guarantee a minimum poisoned gap
> @@ -2029,8 +2073,8 @@ static inline void slab_pad_check(struct kmem_cache *s, struct slab *slab) {}
>  static inline int check_object(struct kmem_cache *s, struct slab *slab,
>  			void *object, u8 val) { return 1; }
>  static inline depot_stack_handle_t set_track_prepare(gfp_t gfp_flags) { return 0; }
> -static inline void set_track(struct kmem_cache *s, void *object,
> -			     enum track_item alloc, unsigned long addr, gfp_t gfp_flags) {}
> +static inline void set_alloc_track(struct kmem_cache *s, void *object,
> +				   unsigned long addr, gfp_t gfp_flags) {}
>  static inline void add_full(struct kmem_cache *s, struct kmem_cache_node *n,
>  					struct slab *slab) {}
>  static inline void remove_full(struct kmem_cache *s, struct kmem_cache_node *n,
> @@ -4522,7 +4566,7 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>  
>  success:
>  	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
> -		set_track(s, object, TRACK_ALLOC, addr, gfpflags);
> +		set_alloc_track(s, object, addr, gfpflags);
>  
>  	return object;
>  }
> -- 
> 2.43.0
> 
-- 
Thanks,
Hao
