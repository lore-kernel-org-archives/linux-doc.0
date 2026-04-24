Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554E02E8B9B;
	Fri, 24 Apr 2026 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043962; cv=none; b=YkDGRrDHQUzpS1ofPh+pdtmg9Gb4ca4LMaTo8flAAKNbtYPXkAfOZAddntCyAjNlvrDmS2UxVGo4pJuSMuRlBLKesgxvqN6JCtrHC3EhRLBvggi04d7tf/27oHEUet8ynLqTiJn2mUh+K4YZNNkFJ3wrNhZwiCUBFr5O6ekGVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043962; c=relaxed/simple;
	bh=cEi4t4R7z5qw7S83+FnxUKjQs4TGfmgaCpSsRrd+oWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vau0cUKmJdxrsnr4R/uzUl4LeNtGF1ThKoPiutkN6+EekECP7f6E2d80j0nEmWAqj095wS114K7Q1eDepbfp92ee/oPtAkqrRnfZD4dDggDbML5j19QN35IscAQPgsL5Z+LZ7NFR/isQh9WaYiVY5mzezcWMTGclblOV70USJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e6Kq0Vb6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e6Kq0Vb6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 608B4358A;
	Fri, 24 Apr 2026 08:19:07 -0700 (PDT)
Received: from [10.1.26.15] (e122027.cambridge.arm.com [10.1.26.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57D733F7B4;
	Fri, 24 Apr 2026 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777043952; bh=cEi4t4R7z5qw7S83+FnxUKjQs4TGfmgaCpSsRrd+oWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e6Kq0Vb6k+R0Yqtpabc6n8T2gQya3cHrC8F4K3qrqnW9RLg9750Z9Skd5hsfL/L4f
	 P7XMVWG54EFWNhgQw8SKanLkpB88MkYN8BdG4TmbqcLEZpOOfGW/xIltJT3qrneJwO
	 wRWCx66HHiLghfcYnARi95AnXovVArijMz0fo7Ig=
Message-ID: <145ed843-37c9-45cd-8f07-604d03fdc5df@arm.com>
Date: Fri, 24 Apr 2026 16:19:06 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/panthor: Implement evicted status for GEM
 objects
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-doc@vger.kernel.org
References: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
 <20260423-panthor-bo-reclaim-observability-v3-2-60af32164a4f@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260423-panthor-bo-reclaim-observability-v3-2-60af32164a4f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2026 13:33, Nicolas Frattaroli wrote:
> For fdinfo to be able to fill its evicted counter with data, panthor
> needs to keep track of whether a GEM object has ever been reclaimed.
> Just checking whether the pages are resident isn't enough, as newly
> allocated objects also won't be resident.
> 
> Do this with a new atomic_t member on panthor_gem_object. It's increased
> when an object gets evicted by the shrinker, and saturates at INT_MAX.
> This means that once an object has been evicted at least once, its
> reclaim counter will never return to 0.
> 
> Due to this, it's possible to distinguish evicted non-resident pages
> from newly allocated non-resident pages by checking whether
> reclaimed_count is != 0
> 
> Use this new member to then set the appropriate DRM_GEM_OBJECT_EVICTED
> status flag for fdinfo.
> 
> Also add a new column and status flag to the panthor gems debugfs: the
> column is the number of times an object has been evicted, whereas the
> flag indicates whether it currently is evicted.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 18 ++++++++++++++----
>  drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 69cef05b6ef7..b6fe20b7e6d0 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -687,6 +687,8 @@ static void panthor_gem_evict_locked(struct panthor_gem_object *bo)
>  	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
>  		return;
>  
> +	atomic_add_unless(&bo->reclaimed_count, 1, INT_MAX);
> +
>  	panthor_gem_dev_map_cleanup_locked(bo);
>  	panthor_gem_backing_cleanup_locked(bo);
>  	panthor_gem_update_reclaim_state_locked(bo, NULL);
> @@ -788,6 +790,8 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
>  
>  	if (drm_gem_is_imported(&bo->base) || bo->backing.pages)
>  		res |= DRM_GEM_OBJECT_RESIDENT;
> +	else if (atomic_read(&bo->reclaimed_count))
> +		res |= DRM_GEM_OBJECT_EVICTED;
>  
>  	return res;
>  }
> @@ -1595,6 +1599,7 @@ static void panthor_gem_debugfs_print_flag_names(struct seq_file *m)
>  	static const char * const gem_state_flags_names[] = {
>  		[PANTHOR_DEBUGFS_GEM_STATE_IMPORTED_BIT] = "imported",
>  		[PANTHOR_DEBUGFS_GEM_STATE_EXPORTED_BIT] = "exported",
> +		[PANTHOR_DEBUGFS_GEM_STATE_EVICTED_BIT] = "evicted",
>  	};
>  
>  	static const char * const gem_usage_flags_names[] = {
> @@ -1625,6 +1630,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>  {
>  	enum panthor_gem_reclaim_state reclaim_state = bo->reclaim_state;
>  	unsigned int refcount = kref_read(&bo->base.refcount);
> +	int reclaimed_count = atomic_read(&bo->reclaimed_count);
>  	char creator_info[32] = {};
>  	size_t resident_size;
>  	u32 gem_usage_flags = bo->debugfs.flags;
> @@ -1638,16 +1644,20 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>  
>  	snprintf(creator_info, sizeof(creator_info),
>  		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
> -	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd0x%-16lx",
> +	seq_printf(m, "%-32s%-16d%-16d%-11d%-16zd%-16zd0x%-16lx",
>  		   creator_info,
>  		   bo->base.name,
>  		   refcount,
> +		   reclaimed_count,
>  		   bo->base.size,
>  		   resident_size,
>  		   drm_vma_node_start(&bo->base.vma_node));
>  
>  	if (drm_gem_is_imported(&bo->base))
>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
> +	else if (!resident_size && reclaimed_count)
> +		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EVICTED;
> +
>  	if (bo->base.dma_buf)
>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
>  
> @@ -1671,8 +1681,8 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
>  
>  	panthor_gem_debugfs_print_flag_names(m);
>  
> -	seq_puts(m, "created-by                      global-name     refcount        size            resident-size   file-offset       state      usage       label\n");
> -	seq_puts(m, "----------------------------------------------------------------------------------------------------------------------------------------------\n");
> +	seq_puts(m, "created-by                      global-name     refcount        evictions  size            resident-size   file-offset       state      usage       label\n");
> +	seq_puts(m, "---------------------------------------------------------------------------------------------------------------------------------------------------------\n");
>  
>  	scoped_guard(mutex, &ptdev->gems.lock) {
>  		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
> @@ -1680,7 +1690,7 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
>  		}
>  	}
>  
> -	seq_puts(m, "==============================================================================================================================================\n");
> +	seq_puts(m, "=========================================================================================================================================================\n");
>  	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
>  		   totals.size, totals.resident, totals.reclaimable);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index ae0491d0b121..56d63137b4eb 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -19,12 +19,16 @@ struct panthor_vm;
>  enum panthor_debugfs_gem_state_flags {
>  	PANTHOR_DEBUGFS_GEM_STATE_IMPORTED_BIT = 0,
>  	PANTHOR_DEBUGFS_GEM_STATE_EXPORTED_BIT = 1,
> +	PANTHOR_DEBUGFS_GEM_STATE_EVICTED_BIT = 2,
>  
>  	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED: GEM BO is PRIME imported. */
>  	PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED = BIT(PANTHOR_DEBUGFS_GEM_STATE_IMPORTED_BIT),
>  
>  	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED: GEM BO is PRIME exported. */
>  	PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED = BIT(PANTHOR_DEBUGFS_GEM_STATE_EXPORTED_BIT),
> +
> +	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_EVICTED: GEM BO is evicted to swap. */
> +	PANTHOR_DEBUGFS_GEM_STATE_FLAG_EVICTED = BIT(PANTHOR_DEBUGFS_GEM_STATE_EVICTED_BIT),
>  };
>  
>  enum panthor_debugfs_gem_usage_flags {
> @@ -172,6 +176,12 @@ struct panthor_gem_object {
>  	/** @reclaim_state: Cached reclaim state */
>  	enum panthor_gem_reclaim_state reclaim_state;
>  
> +	/**
> +	 * @reclaimed_count: How many times object has been evicted to swap.
> +	 * The count saturates at %INT_MAX and will never wrap around to 0.
> +	 */
> +	atomic_t reclaimed_count;
> +
>  	/**
>  	 * @exclusive_vm_root_gem: Root GEM of the exclusive VM this GEM object
>  	 * is attached to.
> 

