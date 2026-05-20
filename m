Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27AD175A6B;
	Wed, 20 May 2026 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283474; cv=none; b=pUa3ozj3SPaqbbybBrjEhBWoo0MKlh+G3BIMLXCuUTZHQ72WRCiTnKCVZK+4J2hxA4L0pkvD7uSYzSBIb6Oi1gqOz0pJG5Mg2/jXA1nltQrha/2qEOipTQ6dw4iM5hiyDvJre8kVHhtTpe0nLPdMHYbF2o6jwb34Isi+l7SvRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283474; c=relaxed/simple;
	bh=iANpU2wer4BKKpe+gZCpKE13Eip1fp/I6bIamcuEfrY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YRlUP+YBDEfjSn61fj13z6Ji2YpXNX7dMFEcge7W2/BlblUmcaW9fhPPnDyCKK6tlp2+JDIeBTZDMiW2v9WJtWZZteOdZAVSURzn9bwVJH4jRk8hlqt4q9nGzwmk+XIbbNkUuuqU4gWjZkzraEaSs/btHXC0tHSPe8WNOrb7iI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OnSPk9B0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OnSPk9B0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779283471;
	bh=iANpU2wer4BKKpe+gZCpKE13Eip1fp/I6bIamcuEfrY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OnSPk9B0L48bFnguwZmP4eGBMhFwba3shYWNjKcW6TwFfRjxpqTKVRjPBkfaz8gFI
	 1kQgx0a74gMyhJi4XG3h/a9b/dCdZqgYf2NghwmQgUkVOcvW1OS1GI4UEZP1fp/a9x
	 /b178LQ9OmIMk1RURdknuGUdQn/+FgJwQslNM5bbznOxPlCnZd8OC001qcFx7SpUMO
	 JeleuE9w1KX9BGEMMnux0a+ekI+NTw8SigHEHsruMJZ3hazELgwtRinFtPKZgCZf+u
	 LrKuL888HzQ8MCwgMtopWfLLL/iEOriJjlMigE7IlAPfPRWzfO5H0AngiFgiS/V2Wy
	 dC9vv4t8nV22w==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B8E017E02A3;
	Wed, 20 May 2026 15:24:30 +0200 (CEST)
Date: Wed, 20 May 2026 15:24:26 +0200
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
Message-ID: <20260520152426.4c5fef6c@fedora>
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

