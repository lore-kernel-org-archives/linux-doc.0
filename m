Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA73339872;
	Mon, 16 Mar 2026 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678874; cv=none; b=BiUnO0J4y2UhZ8MDU60XmRHoMoKBhoncno6zYRs5VVH05us/X1WOga5KcByEQau/G+R56IzzLhbi7QxVbO4Ibs0ms9o6APU5GsjDWSc7xtxU4aHmQ0f/hJxwmQwR7Hr58JXc5lpjvh7F4c3Unst34poqb5TjcYa1TNfti0zJ+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678874; c=relaxed/simple;
	bh=PsYgSXQGk8BFCayvk58j+THY+BZLAGCU8qiWICk6vbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSH1X9zwFJDHsoaz0CxdSmTlDOwS0TDUBaD+WK2w41e5H6qYI92kYNIjj5aNDAVl4pW7L7AL/PiJUT9EQqkYPpDqY9KhVBf8/nfCjYpa2kXDBDzhbSuII9zTM2K0HE2rIWiyIMHDnSOVEHx+LxNhWNMWLCtTA/Lekipzd8J6ktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G/cbQ2Lu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G/cbQ2Lu"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F34F0BD2;
	Mon, 16 Mar 2026 17:33:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773678800;
	bh=PsYgSXQGk8BFCayvk58j+THY+BZLAGCU8qiWICk6vbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/cbQ2LuTQvse07oW6Z0/uu+igZEbOgAF6vC/IWsuBxo0CpIIEtaiz/HG7dirG7kU
	 glemvrM9xcJdEvZCTdvdc9m0c+vFJ8iEDzktgEWg+Nb3a2ZlrL4qedD7R62vLp1S66
	 rLMJUvIT+O9V0x8SY+C/RVzho174FI7b1a4AWLAg=
Date: Mon, 16 Mar 2026 18:34:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/14] drm/atomic: Drop private obj state allocation
Message-ID: <20260316163425.GO31604@killaraus.ideasonboard.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-10-de7397c8e1cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-drm-mode-config-init-v1-10-de7397c8e1cf@kernel.org>

On Tue, Mar 10, 2026 at 05:07:02PM +0100, Maxime Ripard wrote:
> Now that drm_dev_register() calls drm_mode_config_create_state() for
> every modeset driver, the private obj states will be initialized at
> driver registration automatically if they haven't already.
> 
> Thus, the explicit initial allocation we have in
> drm_atomic_private_obj_init() is now redundant, and we can remove it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_atomic.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index d1885f895cce78725419b6291f4dbe5563e3b240..e8dc019364d27123c3a682a10323fba9ff76f9df 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -991,25 +991,18 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>   */
>  int drm_atomic_private_obj_init(struct drm_device *dev,
>  				struct drm_private_obj *obj,
>  				const struct drm_private_state_funcs *funcs)
>  {
> -	struct drm_private_state *state;
>  	memset(obj, 0, sizeof(*obj));
>  
>  	drm_modeset_lock_init(&obj->lock);
>  
>  	obj->dev = dev;
>  	obj->funcs = funcs;
>  	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
>  
> -	state = obj->funcs->atomic_create_state(obj);
> -	if (IS_ERR(state))
> -		return PTR_ERR(state);
> -
> -	obj->state = state;
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_private_obj_init);
>  
>  /**
> 

-- 
Regards,

Laurent Pinchart
