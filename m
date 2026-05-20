Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879702BE7AB;
	Wed, 20 May 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287647; cv=none; b=hlu9DjqAXMiE1evmi1ThnSKWT5VmbIRmJPWRwV2NcD3WWTkRU+UlkDGjs57AHO8o9XPs9y21kyHDSWbIv0aLV4J0Ma2PJ6novulBagv1HAgOWNXNNh6yL6rhB8nCUpQ19OGslKIcRyzzHuovIhHM4+uQQ2YAfCAJzsQykNlYfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287647; c=relaxed/simple;
	bh=Z9ehc0o77iczHKPKhQAgq61UC0W4OHTwJYBEEbgaOZY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxQwcldWSyLajesr9JEbEZ/6YXekO7onUfTZlZcIEWnMQxg9Z15syssoZHAPZ1fWw9WhhEshS6G0Yp2UsBansABJYYLl7DAXX6oZYFBEzAD2h6laTpIB7TrxwGOn2GAWEbRjD1lhdDSmFxchN78DttUCimJ9Vl1ijJGZkkfWOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dlYlcTir; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dlYlcTir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779287643;
	bh=Z9ehc0o77iczHKPKhQAgq61UC0W4OHTwJYBEEbgaOZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dlYlcTirU16xr9XsNcZlpLFhI/q5XMHMhPDfN2v03pnhK2jIRBfcKjq7IXM5HeZdH
	 GaR6jyTa4PcZlQFJYhP1QjHOBeBEZ3MtX/9Ng2yafYGn15d1weGxTnjyejesEUUryK
	 0rJDhXFC45q3rklsB4baroEXtxDZ0Y1vRVutSVQ0onPD0KZKOMhrbZ/mDObKMbsENu
	 d1X5ngskFfCTiV1Zhq646Hf/xzFrJMfT9b4n9G5z2M8R+yhZSWye4/E5/S7oT8yVbs
	 33f0Vs9d8FMWHtM7sa7WvN1+g+cdkd3o703XJljEeoqJD9p1pvgRXl2di1SQL8Aj11
	 wZWOjgJOdJvXQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BF0517E0411;
	Wed, 20 May 2026 16:34:03 +0200 (CEST)
Date: Wed, 20 May 2026 16:33:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm/panthor: Implement evicted status for GEM
 objects
Message-ID: <20260520163351.702034ce@fedora>
In-Reply-To: <20260520-panthor-bo-reclaim-observability-v4-2-a47ab61cb80d@collabora.com>
References: <20260520-panthor-bo-reclaim-observability-v4-0-a47ab61cb80d@collabora.com>
	<20260520-panthor-bo-reclaim-observability-v4-2-a47ab61cb80d@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 May 2026 15:04:49 +0200
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

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
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 18 ++++++++++++++----
>  drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 13295d7a593d..068aa935c8fc 100644
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

Could we drop that change so we can at least have patch 2 and 3 merged
while the discussion on the fdinfo semantics is going on?

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

