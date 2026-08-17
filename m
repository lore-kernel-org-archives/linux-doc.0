Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502634A77D
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962668; cv=none; b=Xjdxg+Y+zNIMIl7D7NYvQELt6NmxZrq4PM3SK7laRiJZcPOrQD3HV+IlOhyAcuctGeRMCP4ddrgMiR8YjsYeM/KBCNL38JzF2foaccmDinrk9ORGJ+kCIfbWhlz334D3CT2ex3kO7RaD7e36CYsVmlmLNbn30H6GzL0ZQXnqQFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962668; c=relaxed/simple;
	bh=PHSNppafh7ZvoaPW4R/vyyDgd1aWKargi1a4hgkd6Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfexyrzBrc8FrmmQF+2NbYMQqSyXq9Df2D0DLDSc+uaTq1Tiyp1Qg7Ym+N/vnUK0JjLHCQUORAZ4DV2Tdw6+EGFuwkCiuf0CX+Vxw1eMGWm1ueOMN9vSu2RkUEtRITcMyAtCXPRZnRTQEbHwBlglp9ZaN9u0l20FmPaekYOVH9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qjS4pM6x; arc=none smtp.client-ip=91.218.175.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qjS4pM6x"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PHSNppafh7ZvoaPW4R/vyyDgd1aWKargi1a4hgkd6Qs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786962663; v=1; x=1787567463;
 b=qjS4pM6xZxdi6Uzm+fNMBWhmSaLCCvztEOOgWVvSym5YH2mFb2UJsWYIstUTdfacb919Xto0
 yiAtJvOoM8W5z6xMRqHIFe6ev0/E2MNhWsGZxyTvmRsANkNKJP6e9bJA1A2fsvb3FiTuac+J73C
 J4QtYtCd46GpdER5NJWLlAmA=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from fedora (117.129.78.49)
	by smtp.migadu.com with ESMTPS id 688d5662f1f063b2;
	Mon, 17 Aug 2026 10:31:02 +0000
X-Migadu-Flow: FLOW_OUT
Date: Mon, 17 Aug 2026 18:30:51 +0800
From: Hao Li <hao.li@linux.dev>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm/slub: preserve one previous object lifetime
Message-ID: <aoLcw91-afP2Mjtb@fedora>
References: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
 <20260813161244.74476-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813161244.74476-1-pengpeng@iscas.ac.cn>

On Fri, Aug 14, 2026 at 12:12:44AM +0800, Pengpeng Hou wrote:
> SLAB_STORE_USER replaces the allocation track when an object is reused.  A
> later stale free can then replace the free track as well, leaving the
> report without the completed lifetime that created the stale reference.
> 
> Store one additional alloc/free pair.  Before recording a new allocation,
> copy the current pair to the previous slots only when both records exist.
> Keep the current free track intact to preserve existing SLAB_STORE_USER
> behavior during the reuse window.
> 
> Print the previous pair when available.  These records are diagnostic
> history and do not infer semantic ownership.
> 
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  mm/slub.c | 45 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 0653def0fe36..355fbffb981f 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -329,7 +329,13 @@ struct track {
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
>  #ifdef SLAB_SUPPORTS_SYSFS
>  static int sysfs_slab_add(struct kmem_cache *);
> @@ -1074,12 +1080,23 @@ static void set_track_update(struct kmem_cache *s, void *object,
>  	p->when = jiffies;
>  }
>  
> -static __always_inline void set_track(struct kmem_cache *s, void *object,
> -				      enum track_item alloc, unsigned long addr, gfp_t gfp_flags)
> +static __always_inline void set_alloc_track(struct kmem_cache *s, void *object,
> +					    unsigned long addr, gfp_t gfp_flags)
>  {
>  	depot_stack_handle_t handle = set_track_prepare(gfp_flags);
> +	struct track *alloc = get_track(s, object, TRACK_ALLOC);
> +	struct track *free = get_track(s, object, TRACK_FREE);
> +	struct track *prev_alloc;
> +	struct track *prev_free;
> +
> +	if (alloc->addr && free->addr) {
> +		prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
> +		prev_free = get_track(s, object, TRACK_PREV_FREE);
> +		*prev_alloc = *alloc;
> +		*prev_free = *free;
> +	}
>  
> -	set_track_update(s, object, alloc, addr, handle);
> +	set_track_update(s, object, TRACK_ALLOC, addr, handle);
>  }
>  
>  static void init_tracking(struct kmem_cache *s, void *object)
> @@ -1113,12 +1130,22 @@ static void print_track(const char *s, struct track *t, unsigned long pr_time)
>  
>  void print_tracking(struct kmem_cache *s, void *object)
>  {
> +	struct track *prev_alloc;
>  	unsigned long pr_time = jiffies;
> +
>  	if (!(s->flags & SLAB_STORE_USER))
>  		return;
>  
>  	print_track("Allocated", get_track(s, object, TRACK_ALLOC), pr_time);
>  	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);

When object is in allocated state, under normal case, this "Freed" line
duplicates with the "Freed" line under "Previous object lifetime:"

Would it make sense to add a check here? something like:

if ("free track" isn't the same as "prev_free track")
	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);

> +
> +	prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
> +	if (!prev_alloc->addr)
> +		return;
> +
> +	pr_err("Previous object lifetime:\n");
> +	print_track("Allocated", prev_alloc, pr_time);
> +	print_track("Freed", get_track(s, object, TRACK_PREV_FREE), pr_time);
>  }
>  
>  static void print_slab_info(const struct slab *slab)
> @@ -1366,8 +1393,8 @@ check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
>   *
>   * [Metadata starts at object + s->inuse]
>   *   - A. freelist pointer (if freeptr_outside_object)
> - *   - B. alloc tracking (SLAB_STORE_USER)
> - *   - C. free tracking (SLAB_STORE_USER)
> + *   - B. current alloc/free tracking (SLAB_STORE_USER)
> + *   - C. previous alloc/free tracking (SLAB_STORE_USER)
>   *   - D. original request size (SLAB_KMALLOC && SLAB_STORE_USER)
>   *   - E. KASAN metadata (if enabled)
>   *
> @@ -2024,8 +2051,8 @@ static inline void slab_pad_check(struct kmem_cache *s, struct slab *slab) {}
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
> @@ -4493,7 +4520,7 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>  
>  success:
>  	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
> -		set_track(s, object, TRACK_ALLOC, ac->caller_addr, gfpflags);
> +		set_alloc_track(s, object, ac->caller_addr, gfpflags);
>  
>  	return object;
>  }
> -- 
> 2.50.1 (Apple Git-155)
> 

-- 
Thanks,
Hao
