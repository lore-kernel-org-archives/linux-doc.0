Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368F34CFD0;
	Wed, 20 May 2026 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305956; cv=pass; b=fvhwD+quVUx5ew9V4TKUwWFdgN5cmqqb6SSO6MetTQVm0hHkvtjzYuKvcb5blR8klWIgB/SmY3hbdUQEczfTjzFgb7nwOUHsLm11gS2fx0b2dkXqlDYzBJtBuveYHLrXUhd5tr9Y8CObjnTdBPXd7AzNLwI9sVvfegJJGyBOBDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305956; c=relaxed/simple;
	bh=wa/eSO51cjVraGetzoLReZjL02YLBPGbKcEZ3wzjzZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZlXMiGmmMlhNTObyM/2Lt4jcUNIMMN3nFdG6WWAFr9GQlw2ZFi0ctw+xYFX6htP1lyzUYnBW8d8hfmJGXqpgZWuskGpz6GqY2Vp83/0kMlJMkNKhGkmgyf64/McNP2SHsvQddilB+bulOyfgw7BUGBBUNH/L7JKCmcsqBe+3tRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=dMfkET/J; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="dMfkET/J"
ARC-Seal: i=1; a=rsa-sha256; t=1779305929; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j7WkbUzZxmK80/mpBtA/BGjr8nZm2Ri8U0HaFIy+AEPIFTv7pRE3tzHTZb34JC7ZtzoGLM58zxT9ntF0whAjsMmw3vNqPUc4zs8qGxd/UoOz3XI0mYaw6Y8cGdchenUbRNMtchmKhhGMixMI5q26daUq6dq/Th43e8WivJxY0kA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779305929; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WozJt0Sg1lqTUay3cOfibv54xoEopg26MgfL9FMGpwo=; 
	b=kPv5hxmp4JznmV7jlWqG/f89rAmWAGegRQ36mypuHKO7yd3xLvNMeA8hxj3fagg1lDYeYDYDhNegjvyjSkgBwuDIACFKN6ppRvnAnw6JhnNjkT8Lgu3mksfBfDpL6ecP30mxVBQxlsVmGdD4UcOrXk69TJr9r9czVLvLrgVufmw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779305929;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=WozJt0Sg1lqTUay3cOfibv54xoEopg26MgfL9FMGpwo=;
	b=dMfkET/JG4ZbtfaHpqg1InqY4oXWpN/PQqrJ/F3L/SDb62IbMs/KJfg4oWf5Pey1
	LYR5oQceEGZiDaKN9uW3bBUEL45OZMvqzmOqzInbA2rH+5aRu0SyUy7v/b1wVdm91NW
	d+1lqCQEzh5Qe3DXMOOAqD9eSLIvwfx0XT2UnZ9Y=
Received: by mx.zohomail.com with SMTPS id 1779305926725287.99990591929713;
	Wed, 20 May 2026 12:38:46 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] drm/fdinfo: Add "evicted" memory accounting
Date: Wed, 20 May 2026 21:38:41 +0200
Message-ID: <J0t78_M-TDCxz-OeUDvFdA@collabora.com>
In-Reply-To: <7c7242b8-eb22-41b1-8f04-f7abda62bb28@ursulin.net>
References:
 <20260520-panthor-bo-reclaim-observability-v4-0-a47ab61cb80d@collabora.com>
 <20260520-panthor-bo-reclaim-observability-v4-1-a47ab61cb80d@collabora.com>
 <7c7242b8-eb22-41b1-8f04-f7abda62bb28@ursulin.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello Tvrtko,

On Wednesday, 20 May 2026 16:19:12 Central European Summer Time Tvrtko Ursulin wrote:
> 
> On 20/05/2026 14:04, Nicolas Frattaroli wrote:
> > Currently, there's no way to know for certain how much GPU memory was
> > swapped out. The difference between total and resident memory would
> > include newly allocated pages, which are not resident, but also aren't
> > swapped out.
> > 
> > Add a new drm_gem_object_status so drivers can signal when an object has
> > been evicted to swap, and add a new "evicted" counter to
> > drm_memory_stats.
> > 
> > Due to how the supported_flags bitmask is determined, the "evicted"
> > count won't be printed to fdinfo if there's no swapped out pages.
> > 
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   Documentation/gpu/drm-usage-stats.rst | 6 ++++++
> >   drivers/gpu/drm/drm_file.c            | 8 ++++++++
> >   include/drm/drm_file.h                | 2 ++
> >   include/drm/drm_gem.h                 | 2 ++
> >   4 files changed, 18 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> > index 70b7cfcc194f..ac1dbf52d96d 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -202,6 +202,12 @@ One practical example of this could be the presence of unsignaled fences in a
> >   GEM buffer reservation object. Therefore, the active category is a subset of the
> >   resident category.
> >   
> > +- drm-evicted-<region>: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that have been evicted and are no longer pinned by the
> > +device. Only present if there are buffers that are currently evicted, and if the
> > +driver implements reporting of this type of memory.
> 
> The semantics as tricky to make work in an obvious way.
> 
> On one hand the text above is almost exactly the semantics of 'total' - 
> 'resident'. Almost meaning it was resident at some point, but isn't any 
> more. Whereas raw 'total' - 'resident' can also mean it never has been 
> instantiated.

Yes, that is the difference. You cannot tell them apart otherwise.

> You could even have a "workaround" where you report a 'swap' memory 
> region and then don't need to add anything new to the spec.

I get the idea that technically, swap is its own memory region, but
evicted is counting memory that panthor knows is currently evicted,
not necessarily memory that is in swap. Counting pages that would
*actually* be in swap would probably involve breaking several
abstractions that shouldn't be broken.

> 
> Next problem - on paper evicted could be useful to replace driver legacy 
> keys such as 'amd-evicted-ram'. But that "evicted" is defined as "not in 
> a the preferred placement". While your evicted is more like "no current 
> placement" (as in, no GPU accessible backing storage).
> 
> Is it possible to find a definition of this new category which makes 
> sense for different GPUs/drivers, be it integrated or discrete.

Sure, we can make this definition as loose as you need it to be to use
it in a different driver. I think the difference between "not in a
preferred placement" and "no current placement (but had a placement in
the past)" is not a big one for the users of this information; the goal
is to see how much of the GPU memory of a process has been made non-
resident by a shrinker.

> Or would simply going for 'drm-total-swap:' (or resident?) work for 
> panthor? Advantage being it would also work unambiguously for discrete 
> drivers.

Panthor itself doesn't really know whether something is in swap or
has just been made non-resident by the drm shrinker. It could be
somewhere between swap and resident, as Steven Price pointed out.

> 
> Like the ones which support multiple TTM placements, for example VRAM + 
> SYSTEM and then next step is swapping out so an extreme example on a 
> 16GiB GPU + 16GiB RAM machine with a 32GiB gfx workload could be like:
> 
> drm-total-vram:		32GiB
> drm-resident-vram:	16GiB
> drm-resident-system:	15GiB
> drm-total-swap:		1GiB
> 
> Does this look clear enough? Whereas with the "evicted" category it 
> would be:
> 
> drm-total-vram:		32GiB
> drm-resident-vram:	16GiB
> drm-evicted-vram:	16GiB # portion which got demoted to system RAM
> drm-resident-system:	15GiB
> drm-evicted-system:	1GiB  # portion which got demoted to swap
> 
> Where drm-evicted-vram is redundant to "total - resident". And it is 
> overloaded semantics as it where does evicted go depending on the 
> GPU/driver/region.

"drm-evicted-vram" is only redundant to "total - resident" if objects
that have never been packed by any pages aren't counted in total. This
is not the case, so I'm trying to fix it by adding evicted to it for
pages that were backed at some stage, but now aren't backed anymore.

I think "evicted" solves this problem generally in your second example,
without me having to worry about whether a page is in swap or AMD's
memory model.

So, to summarise:
- Panthor does not know how much of the memory that was reclaimed by the
  shrinker is actually in swap space, so "drm-total-swap" wouldn't work
  here.
- "total - resident" measures the wrong thing. Objects that have never
  been backed are not evicted.
- I am completely fine with AMD not using this fdinfo memory type due
  to having more complex eviction handling, but I don't see why it
  could not be used in this form.

> 
> Thoughts, opinions?
> 
> Regards,
> 
> Tvrtko
> 
> > +
> >   Implementation Details
> >   ======================
> >   
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index ec820686b302..5078172976c0 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -868,6 +868,7 @@ int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
> >   		stats->private == 0 &&
> >   		stats->resident == 0 &&
> >   		stats->purgeable == 0 &&
> > +		stats->evicted == 0 &&
> >   		stats->active == 0);
> >   }
> >   EXPORT_SYMBOL(drm_memory_stats_is_zero);
> > @@ -901,6 +902,10 @@ void drm_print_memory_stats(struct drm_printer *p,
> >   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> >   		drm_fdinfo_print_size(p, prefix, "purgeable", region,
> >   				      stats->purgeable);
> > +
> > +	if (supported_status & DRM_GEM_OBJECT_EVICTED)
> > +		drm_fdinfo_print_size(p, prefix, "evicted", region,
> > +				      stats->evicted);
> >   }
> >   EXPORT_SYMBOL(drm_print_memory_stats);
> >   
> > @@ -954,6 +959,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
> >   
> >   		if (s & DRM_GEM_OBJECT_PURGEABLE)
> >   			status.purgeable += add_size;
> > +
> > +		if (s & DRM_GEM_OBJECT_EVICTED)
> > +			status.evicted += add_size;
> >   	}
> >   	spin_unlock(&file->table_lock);
> >   
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index 6ee70ad65e1f..7e4cb45a52c3 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -500,6 +500,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
> >    * @resident: Total size of GEM objects backing pages
> >    * @purgeable: Total size of GEM objects that can be purged (resident and not active)
> >    * @active: Total size of GEM objects active on one or more engines
> > + * @evicted: Total size of GEM objects that have been evicted
> >    *
> >    * Used by drm_print_memory_stats()
> >    */
> > @@ -509,6 +510,7 @@ struct drm_memory_stats {
> >   	u64 resident;
> >   	u64 purgeable;
> >   	u64 active;
> > +	u64 evicted;
> >   };
> >   
> >   enum drm_gem_object_status;
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 86f5846154f7..799588a2762a 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -53,6 +53,7 @@ struct drm_gem_object;
> >    * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
> >    * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
> >    * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
> > + * @DRM_GEM_OBJECT_EVICTED: object is evicted and no longer pinned by driver
> >    *
> >    * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
> >    * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
> > @@ -67,6 +68,7 @@ enum drm_gem_object_status {
> >   	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
> >   	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
> >   	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
> > +	DRM_GEM_OBJECT_EVICTED   = BIT(3),
> >   };
> >   
> >   /**
> > 
> 
> 




