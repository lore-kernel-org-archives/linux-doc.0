Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691371426D
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481283; cv=none; b=ZdIPKlHSxKxGTrgVg37vA29CmUGBdTboCJp7Z2y6NwvahF1fAcYKiM5NCj6WeoPNk7Yh+epsHTUmFvgDbSTB7WOYAEvgzyvCYcNKGnzanTdngYpBae4oFOLyCfTIgnlM3/tihBtvoBm+XGlYh5FFY9+1nQplH59n/hX6wM+w4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481283; c=relaxed/simple;
	bh=0z4mu48nKm5Teb9yykqkFa896y2Ec3rfNH9510cwIK4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type; b=WtS+3LI0VFQbpeOZfmLPx5RKwr25+7BW5Acv2EoqdFmrgpTNBMG3hwvzYWo3agB6g3zrNLOI4wXEQ9qlGXo6cbxlLeZy0kqns0xVcErElYDGWG2jggrVqmvGU8KFj+iSokHEyh6aBzNPd6+qCbS+/YHe6r7hggHx8OmkPRLG+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKTs3/UO; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKTs3/UO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705481281; x=1737017281;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=0z4mu48nKm5Teb9yykqkFa896y2Ec3rfNH9510cwIK4=;
  b=IKTs3/UOsr0YTY+8GFcsmUsPPi2HHaIKkwY4zx3EYx5mbYyGARkYIO8u
   VqwhQBZlJeOlgCOeZMgmvCs2qSBjxIjHDx8iyxwXOcrNsdgH0oqZ75eFb
   ULcOJglUqrVs7/irlJmwchgajErxHnWXjQahFkBEGLkqL94NPRL1aT8nS
   zPNSniC+qDrkW/uzjPge9pxJhl5SA73CAdpybcL33R+CU28Z3qeKuVsOt
   oZz0fKFOAUGWEJF8AtfA+OPPphpnb3SABlne+d6aCJAmaTqDc2YVMV5RL
   VPOwzYytHS5ySYXvaTD2PeJ2OCgC9fxrB1iUCGYCelKKnUA0Cxfh3xR/9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="398982835"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="398982835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 00:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="760495150"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="760495150"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.230])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 00:47:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>
Subject: Re: [RFC PATCH 1/2] drm/vram-helper: Fix 'multi-line' kernel-doc
 comments
In-Reply-To: <20240116151456.48238-2-anna-maria@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240116151456.48238-1-anna-maria@linutronix.de>
 <20240116151456.48238-2-anna-maria@linutronix.de>
Date: Wed, 17 Jan 2024 10:47:51 +0200
Message-ID: <87frywqrbc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 16 Jan 2024, Anna-Maria Behnsen <anna-maria@linutronix.de> wrote:
> Reformat lines in kernel-doc comments, which make use of the backslash at
> the end to suggest it is a multi-line comment. kernel-doc is able to
> process e.g. the short description of a function properly, even if it is
> across two lines.
>
> No functional change.
>
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>

Should be sent to dri-devel.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
>  include/drm/drm_gem_vram_helper.h     | 16 +++++-----
>  2 files changed, 28 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index b67eafa55715..b7d42210fccc 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -260,8 +260,7 @@ static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
>  }
>  
>  /**
> - * drm_gem_vram_offset() - \
> -	Returns a GEM VRAM object's offset in video memory
> + * drm_gem_vram_offset() - Returns a GEM VRAM object's offset in video memory
>   * @gbo:	the GEM VRAM object
>   *
>   * This function returns the buffer object's offset in the device's video
> @@ -470,14 +469,15 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
>  EXPORT_SYMBOL(drm_gem_vram_vunmap);
>  
>  /**
> - * drm_gem_vram_fill_create_dumb() - \
> -	Helper for implementing &struct drm_driver.dumb_create
> + * drm_gem_vram_fill_create_dumb() - Helper for implementing
> + *				     &struct drm_driver.dumb_create
> + *
>   * @file:		the DRM file
>   * @dev:		the DRM device
>   * @pg_align:		the buffer's alignment in multiples of the page size
>   * @pitch_align:	the scanline's alignment in powers of 2
> - * @args:		the arguments as provided to \
> -				&struct drm_driver.dumb_create
> + * @args:		the arguments as provided to
> + *			&struct drm_driver.dumb_create
>   *
>   * This helper function fills &struct drm_mode_create_dumb, which is used
>   * by &struct drm_driver.dumb_create. Implementations of this interface
> @@ -575,8 +575,7 @@ static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
>   */
>  
>  /**
> - * drm_gem_vram_object_free() - \
> -	Implements &struct drm_gem_object_funcs.free
> + * drm_gem_vram_object_free() - Implements &struct drm_gem_object_funcs.free
>   * @gem:       GEM object. Refers to &struct drm_gem_vram_object.gem
>   */
>  static void drm_gem_vram_object_free(struct drm_gem_object *gem)
> @@ -591,12 +590,11 @@ static void drm_gem_vram_object_free(struct drm_gem_object *gem)
>   */
>  
>  /**
> - * drm_gem_vram_driver_dumb_create() - \
> -	Implements &struct drm_driver.dumb_create
> + * drm_gem_vram_driver_dumb_create() - Implements &struct drm_driver.dumb_create
>   * @file:		the DRM file
>   * @dev:		the DRM device
> - * @args:		the arguments as provided to \
> -				&struct drm_driver.dumb_create
> + * @args:		the arguments as provided to
> + *			&struct drm_driver.dumb_create
>   *
>   * This function requires the driver to use @drm_device.vram_mm for its
>   * instance of VRAM MM.
> @@ -639,8 +637,8 @@ static void __drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
>  }
>  
>  /**
> - * drm_gem_vram_plane_helper_prepare_fb() - \
> - *	Implements &struct drm_plane_helper_funcs.prepare_fb
> + * drm_gem_vram_plane_helper_prepare_fb() - Implements &struct
> + *					    drm_plane_helper_funcs.prepare_fb
>   * @plane:	a DRM plane
>   * @new_state:	the plane's new state
>   *
> @@ -690,8 +688,8 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
>  EXPORT_SYMBOL(drm_gem_vram_plane_helper_prepare_fb);
>  
>  /**
> - * drm_gem_vram_plane_helper_cleanup_fb() - \
> - *	Implements &struct drm_plane_helper_funcs.cleanup_fb
> + * drm_gem_vram_plane_helper_cleanup_fb() - Implements &struct
> + *					    drm_plane_helper_funcs.cleanup_fb
>   * @plane:	a DRM plane
>   * @old_state:	the plane's old state
>   *
> @@ -717,8 +715,8 @@ EXPORT_SYMBOL(drm_gem_vram_plane_helper_cleanup_fb);
>   */
>  
>  /**
> - * drm_gem_vram_simple_display_pipe_prepare_fb() - \
> - *	Implements &struct drm_simple_display_pipe_funcs.prepare_fb
> + * drm_gem_vram_simple_display_pipe_prepare_fb() - Implements &struct
> + *				   drm_simple_display_pipe_funcs.prepare_fb
>   * @pipe:	a simple display pipe
>   * @new_state:	the plane's new state
>   *
> @@ -739,8 +737,8 @@ int drm_gem_vram_simple_display_pipe_prepare_fb(
>  EXPORT_SYMBOL(drm_gem_vram_simple_display_pipe_prepare_fb);
>  
>  /**
> - * drm_gem_vram_simple_display_pipe_cleanup_fb() - \
> - *	Implements &struct drm_simple_display_pipe_funcs.cleanup_fb
> + * drm_gem_vram_simple_display_pipe_cleanup_fb() - Implements &struct
> + *						   drm_simple_display_pipe_funcs.cleanup_fb
>   * @pipe:	a simple display pipe
>   * @old_state:	the plane's old state
>   *
> @@ -761,8 +759,7 @@ EXPORT_SYMBOL(drm_gem_vram_simple_display_pipe_cleanup_fb);
>   */
>  
>  /**
> - * drm_gem_vram_object_pin() - \
> -	Implements &struct drm_gem_object_funcs.pin
> + * drm_gem_vram_object_pin() - Implements &struct drm_gem_object_funcs.pin
>   * @gem:	The GEM object to pin
>   *
>   * Returns:
> @@ -785,8 +782,7 @@ static int drm_gem_vram_object_pin(struct drm_gem_object *gem)
>  }
>  
>  /**
> - * drm_gem_vram_object_unpin() - \
> -	Implements &struct drm_gem_object_funcs.unpin
> + * drm_gem_vram_object_unpin() - Implements &struct drm_gem_object_funcs.unpin
>   * @gem:	The GEM object to unpin
>   */
>  static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index e18429f09e53..2938ba80750d 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -33,8 +33,8 @@ struct vm_area_struct;
>   * struct drm_gem_vram_object - GEM object backed by VRAM
>   * @bo:		TTM buffer object
>   * @map:	Mapping information for @bo
> - * @placement:	TTM placement information. Supported placements are \
> -	%TTM_PL_VRAM and %TTM_PL_SYSTEM
> + * @placement:	TTM placement information. Supported placements are %TTM_PL_VRAM
> + *		and %TTM_PL_SYSTEM
>   * @placements:	TTM placement information.
>   *
>   * The type struct drm_gem_vram_object represents a GEM object that is
> @@ -126,8 +126,8 @@ drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
>  				     struct drm_plane_state *old_state);
>  
>  /**
> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> - *	Initializes struct drm_plane_helper_funcs for VRAM handling
> + * DRM_GEM_VRAM_PLANE_HELPER_FUNCS - Initializes struct drm_plane_helper_funcs
> + *				     for VRAM handling
>   *
>   * Drivers may use GEM BOs as VRAM helpers for the framebuffer memory. This
>   * macro initializes struct drm_plane_helper_funcs to use the respective helper
> @@ -150,8 +150,8 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
>  	struct drm_plane_state *old_state);
>  
>  /**
> - * define DRM_GEM_VRAM_DRIVER - default callback functions for \
> -	&struct drm_driver
> + * define DRM_GEM_VRAM_DRIVER - default callback functions for
> + *				&struct drm_driver
>   *
>   * Drivers that use VRAM MM and GEM VRAM can use this macro to initialize
>   * &struct drm_driver with default functions.
> @@ -185,8 +185,8 @@ struct drm_vram_mm {
>  };
>  
>  /**
> - * drm_vram_mm_of_bdev() - \
> -	Returns the container of type &struct ttm_device for field bdev.
> + * drm_vram_mm_of_bdev() - Returns the container of type &struct ttm_device for
> + *			   field bdev.
>   * @bdev:	the TTM BO device
>   *
>   * Returns:

-- 
Jani Nikula, Intel
