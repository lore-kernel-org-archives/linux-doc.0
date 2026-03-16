Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED6A3B8951;
	Mon, 16 Mar 2026 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676501; cv=none; b=tC2EPtkWf/2HfplAGkleq/azJE8D607hoPUbVeHG9Fe/4b5+8fpETureb+29rEFbY7QTIOjlXD/aYvCEk3/ME3m5bm4ez5dAu8jX1m/faOXTv7zKSnRBET2tNyKvINJOTHD5r4/u90jhtON3+HBkk1NSSLIXAjoCUFfGsSYMHzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676501; c=relaxed/simple;
	bh=qJl9aeXpMuXMFSGDN66/VVC0JMyVjc+XX9UPptjkBVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOR8ZLEAiDPMNILoMFX+/fBsAouj3irBHsIMrYqE8KQ0u9c7SX0Chipau1SNo7teBdAocbvwQECm74I9lhQc5JCWdM/WujoAkNMHncRJ921d+XtH2lXqRfhBGAYbOkNnl49g1ZpE3eSQKGl4kBhB+MhQ8oPAI+C39sLuujJIQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gt8hKzOw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gt8hKzOw"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B2542C6C;
	Mon, 16 Mar 2026 16:53:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773676424;
	bh=qJl9aeXpMuXMFSGDN66/VVC0JMyVjc+XX9UPptjkBVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gt8hKzOwk0waOCTGNhVuP4xt+u6rejx0a6BoWaahRZIK0W9ImmpQrrMCq4lt1nm01
	 eOcReA5aRkxJJFb8vUlziqwE71M46jJ46aM2mWC5ymIEl7LLTBe83UouSW9sbzWWpa
	 4GpIjmHHJ3gcO29DHzt6jnw24WyqawOYTc2tvzQg=
Date: Mon, 16 Mar 2026 17:54:54 +0200
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
Subject: Re: [PATCH 04/14] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
Message-ID: <20260316155454.GL31604@killaraus.ideasonboard.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-4-de7397c8e1cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-drm-mode-config-init-v1-4-de7397c8e1cf@kernel.org>

On Tue, Mar 10, 2026 at 05:06:56PM +0100, Maxime Ripard wrote:
> A typo has slipped through in the __drm_atomic_helper_plane_reset()
> documentation, probably due to copy and paste. It will not assign
> drm_crtc state pointer, but rather the drm_plane's.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 323abc9926e084ad595768c06d5c5ee28c22c014..a1abf4247c348eca21da348c3893dd843b9ed391 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -302,11 +302,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
>   * __drm_atomic_helper_plane_reset - reset state on plane
>   * @plane: drm plane
>   * @plane_state: plane state to assign
>   *
>   * Initializes the newly allocated @plane_state and assigns it to
> - * the &drm_crtc->state pointer of @plane, usually required when
> + * the &drm_plane->state pointer of @plane, usually required when

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   * initializing the drivers or when called from the &drm_plane_funcs.reset
>   * hook.
>   *
>   * This is useful for drivers that subclass the plane state.
>   */
> 

-- 
Regards,

Laurent Pinchart
