Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE41DFFB;
	Mon, 16 Mar 2026 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677784; cv=none; b=PliYfnAR1OtMftNg6XkdY5MCGTfya3c33naAh6VPuKNnK9QNk/1afIHSZDc5xBeIOBVqMonA1jRBPkXL4LIlDvxOc+rOwsq6LWrvWVnXeaxGgybdywa+qCdjdl0HfrV3CelZ8ZvvR25uJ1kBwjff3SJiHnrz9KIGeF914iRtwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677784; c=relaxed/simple;
	bh=IXo0vBVE3pGzsWgWziX8G4a7BS05yGec8qQFLaz5dxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvgZjbYyDMiIOU3jcfTke6AsXLPaIDBOFRfe3d1H+oj3ADqstner09/xyg2Hl2gw3/qOnNhpGvyNHLIWRNNWrU5/WIVbwcOUqlim2N5vO+6V2jrsVUysrE1o2C6EAvfhHiGVkga2FPP3DdTGjnSxhnP9TTdaESxyIqtbw6Oa1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m4AQiTQa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m4AQiTQa"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 954E3B1A;
	Mon, 16 Mar 2026 17:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773677708;
	bh=IXo0vBVE3pGzsWgWziX8G4a7BS05yGec8qQFLaz5dxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4AQiTQagpy6MkLxgZrgmZPNPh1f368ItOxQJbQnKKjupRUSMJjFkHEy648NIzGMp
	 XQGl1CfPIDLVqyTw/0+91sNWA+jOdrES9tIk2jDnprMYwwSg3CqhtA57BZP6q5kLVn
	 7OKDRbn2tMWPAMZoUc9sDkV27RWbBiLKCBYxJq1Y=
Date: Mon, 16 Mar 2026 18:16:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/14] drm/plane: Add new atomic_create_state callback
Message-ID: <20260316161618.GG31616@killaraus.ideasonboard.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-5-de7397c8e1cf@kernel.org>
 <477e022a-d336-4995-a3bc-f12c7d233b0d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <477e022a-d336-4995-a3bc-f12c7d233b0d@ideasonboard.com>

On Wed, Mar 11, 2026 at 09:13:18AM +0200, Tomi Valkeinen wrote:
> On 10/03/2026 18:06, Maxime Ripard wrote:
> > Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> > to drm_private_obj") introduced a new pattern for allocating drm object
> > states.
> > 
> > Instead of relying on the reset() callback, it created a new
> > atomic_create_state hook. This is helpful because reset is a bit
> > overloaded: it's used to create the initial software tate, reset it, but

s/tate/state/

> > also reset the hardware.
> > 
> > It can also be used either at probe time, to create the initial state
> > and possibly reset the hardware to an expected default, but also during
> > suspend/resume.
> > 
> > Both these cases come with different expectations too: during the
> > initialization, we want to initialize all states, but during
> > suspend/resume, drm_private_states for example are expected to be kept
> > around.
> > 
> > And reset() isn't fallible, which makes it harder to handle
> > initialization errors properly.
> > 
> > And this is only really relevant for some drivers, since all the helpers
> > for reset only create a new state, and don't touch the hardware at all.
> > 
> > It was thus decided to create a new hook that would allocate and
> > initialize a pristine state without any side effect:
> > atomic_create_state to untangle a bit some of it, and to separate the
> > initialization with the actual reset one might need during a
> > suspend/resume.
> > 
> > Let's continue the transition to the new pattern with planes.
> > 
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c | 41 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_mode_config.c         | 18 ++++++++++++++
> >  include/drm/drm_atomic_state_helper.h     |  4 +++
> >  include/drm/drm_plane.h                   | 13 ++++++++++
> >  4 files changed, 76 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index a1abf4247c348eca21da348c3893dd843b9ed391..898e168eeae1c3899121ffd13c79fae7803fcd2a 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -318,10 +318,29 @@ void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
> >  
> >  	plane->state = plane_state;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
> >  
> > +/**
> > + * __drm_atomic_helper_plane_create_state - initializes plane state
> > + * @plane: plane object
> > + * @state: new state to initialize
> > + *
> > + * Initializes the newly allocated @state, usually required when
> > + * initializing the drivers.
> > + *
> > + * @state is assumed to be zeroed.
> > + *
> > + * This is useful for drivers that subclass @drm_plane_state.
> > + */
> > +void __drm_atomic_helper_plane_create_state(struct drm_plane *plane,
> > +					    struct drm_plane_state *state)
> > +{
> > +	__drm_atomic_helper_plane_reset(plane, state);
> > +}
> > +EXPORT_SYMBOL(__drm_atomic_helper_plane_create_state);
> > +
> 
> This calls __drm_atomic_helper_plane_reset(), which does "plane->state =
> plane_state". From the description I understood this would be without
> side effects. Is that not a side effect? Or should this call
> __drm_atomic_helper_plane_state_reset() instead?

If you want to dedicate the word "reset" to code paths that reset the
hardware or initialize the state based on the hardware state, I would
also rename __drm_atomic_helper_plane_state_reset() to
__drm_atomic_helper_plane_state_init(), as its purpose is to initialize
a new state.

> Same thing for the next two patches too.
> 
> >  /**
> >   * drm_atomic_helper_plane_reset - default &drm_plane_funcs.reset hook for planes
> >   * @plane: drm plane
> >   *
> >   * Resets the atomic state for @plane by freeing the state pointer (which might
> > @@ -337,10 +356,32 @@ void drm_atomic_helper_plane_reset(struct drm_plane *plane)
> >  	if (plane->state)
> >  		__drm_atomic_helper_plane_reset(plane, plane->state);
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_plane_reset);
> >  
> > +/**
> > + * drm_atomic_helper_plane_create_state - default &drm_plane_funcs.atomic_create_state hook for planes
> > + * @plane: plane object
> > + *
> > + * Initializes a pristine @drm_plane_state.
> > + *
> > + * This is useful for drivers that don't subclass @drm_plane_state.
> > + */
> > +struct drm_plane_state *drm_atomic_helper_plane_create_state(struct drm_plane *plane)
> > +{
> > +	struct drm_plane_state *state;
> > +
> > +	state = kzalloc_obj(*state);
> > +	if (!state)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	__drm_atomic_helper_plane_reset(plane, state);
> > +
> > +	return state;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_plane_create_state);
> > +
> >  /**
> >   * __drm_atomic_helper_plane_duplicate_state - copy atomic plane state
> >   * @plane: plane object
> >   * @state: atomic plane state
> >   *
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index 54c27376f9894ef5eee378bb5b1e5fc7049de922..43fe64540b8ec4df4bb823d96db607e6bfe58824 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -180,10 +180,26 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
> >  	drm_connector_list_iter_end(&conn_iter);
> >  
> >  	return ret;
> >  }
> >  
> > +static int drm_mode_config_plane_create_state(struct drm_plane *plane)
> > +{
> > +	struct drm_plane_state *plane_state;
> > +
> > +	if (!plane->funcs->atomic_create_state)
> > +		return 0;
> > +
> > +	plane_state = plane->funcs->atomic_create_state(plane);
> > +	if (IS_ERR(plane_state))
> > +		return PTR_ERR(plane_state);
> > +
> > +	plane->state = plane_state;
> 
> And this one sets the plane->state, so maybe .atomic_create_state() is
> not supposed to do that.
> 
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * drm_mode_config_reset - call ->reset callbacks
> >   * @dev: drm device
> >   *
> >   * This functions calls all the crtc's, encoder's and connector's ->reset
> > @@ -207,10 +223,12 @@ void drm_mode_config_reset(struct drm_device *dev)
> >  		drm_colorop_reset(colorop);
> >  
> >  	drm_for_each_plane(plane, dev)
> >  		if (plane->funcs->reset)
> >  			plane->funcs->reset(plane);
> > +		else if (plane->funcs->atomic_create_state)
> > +			drm_mode_config_plane_create_state(plane);

While at it I'd add curly braces for the loop.

> >  
> >  	drm_for_each_crtc(crtc, dev)
> >  		if (crtc->funcs->reset)
> >  			crtc->funcs->reset(crtc);
> >  
> > diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> > index 900672c6ea90ba9cb87e38a7c84225972aee43c5..f56a91fca20e778d8ccb1767301dc00783bf40f3 100644
> > --- a/include/drm/drm_atomic_state_helper.h
> > +++ b/include/drm/drm_atomic_state_helper.h
> > @@ -51,12 +51,16 @@ struct drm_crtc_state *
> >  drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
> >  void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
> >  void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
> >  					  struct drm_crtc_state *state);
> >  
> > +void __drm_atomic_helper_plane_create_state(struct drm_plane *plane,
> > +					    struct drm_plane_state *state);
> >  void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
> >  					   struct drm_plane *plane);
> > +struct drm_plane_state *
> > +drm_atomic_helper_plane_create_state(struct drm_plane *plane);
> >  void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
> >  				     struct drm_plane_state *state);
> >  void drm_atomic_helper_plane_reset(struct drm_plane *plane);
> >  void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
> >  					       struct drm_plane_state *state);
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > index 703ef4d1bbbcf084c43aa5e127d28691878061c4..4d4d511b681d50c17fbc593cce9f706d63e04a52 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -386,10 +386,23 @@ struct drm_plane_funcs {
> >  	 * 0 on success or a negative error code on failure.
> >  	 */
> >  	int (*set_property)(struct drm_plane *plane,
> >  			    struct drm_property *property, uint64_t val);
> >  
> > +	/**
> > +	 * @atomic_create_state:
> > +	 *
> > +	 * Allocates a pristine, initialized, state for the plane object
> > +	 * and returns it.
> > +	 *
> > +	 * RETURNS:
> > +	 *
> > +	 * A new, pristine, plane state instance or an error pointer
> > +	 * on failure.
> > +	 */
> > +	struct drm_plane_state *(*atomic_create_state)(struct drm_plane *plane);
> > +
> >  	/**
> >  	 * @atomic_duplicate_state:
> >  	 *
> >  	 * Duplicate the current atomic state for this plane and return it.
> >  	 * The core and helpers guarantee that any atomic state duplicated with
> > 
> 

-- 
Regards,

Laurent Pinchart
