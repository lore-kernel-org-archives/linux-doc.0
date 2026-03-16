Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA853B8926;
	Mon, 16 Mar 2026 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676440; cv=none; b=GNUQ+MAw1pjgy0FjuZJTXLuTo75VQl+BumwOZkizX3PCe0Y0wvUy8QXsKpH3pJUQNsCl52igQYMKnPf1EH3sX3asEtiEU9j5PWyDYNYs9fL6xY96G5/+zwkYyEJAVCa87rnVzItrm9DQe3elB2pV8FaVbO1W3yureRvjQ+VuU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676440; c=relaxed/simple;
	bh=nefS1Nl7jufl9v5V3tpA0vWdgfXt0Ga9N7ObiJRukwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acqqme80JIQGDAQq7hYUy07DVNg3j4zpsoy32FoVoBcQOWSSU+1I7emRFZ0EHgdPhzd6Ug6IOqxjXCT2eSqSTg7iLHytJhf8ybkjvJM46aYsqkLTJywQYcWmpZEY4EJcPWZcTl2YsbKloXk8lkZ2c5jZKgH2pdzFvFeL7Ij9EHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DuT2/HE1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DuT2/HE1"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F03F7C6C;
	Mon, 16 Mar 2026 16:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773676362;
	bh=nefS1Nl7jufl9v5V3tpA0vWdgfXt0Ga9N7ObiJRukwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuT2/HE1oA3ZPWNkOLEzbOjAdkEBfKhiD/G9bhfG29Q3BUkYdcUY3mhGHntLcQtIZ
	 Z1keo5lWUrVYla5+PYfj1cpYtCTtLjNBJAOAd/ILnVGnnQ5W6MQIedzI8aG9CtrSrF
	 XScpokjZiEinPXmWcIS01TrK84YbNwEepP54LnHM=
Date: Mon, 16 Mar 2026 17:53:52 +0200
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
Subject: Re: [PATCH 03/14] drm/mode-config: Mention drm_mode_config_reset()
 culprits
Message-ID: <20260316155352.GF31616@killaraus.ideasonboard.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-3-de7397c8e1cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-drm-mode-config-init-v1-3-de7397c8e1cf@kernel.org>

On Tue, Mar 10, 2026 at 05:06:55PM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() has the expectation that drm_private_states are
> not reset.

I initially misinterpreted that. I don't think it's an "expectation".
The function simply does not reset the private objects states. If you
want to keep "expectation", you can write

drm_mode_config_reset() has the expectation that drm_private_states do
not need to be reset.

> This is especially significant for the DP MST and tunneling code that
> expect to be preserved across a suspend/resume cycle, where
> drm_mode_config_reset() is also used.
> 
> Let's document this expectation.
> 
> Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 84ae8a23a36786705fea7c0eafd7f20813b7c8f9..54c27376f9894ef5eee378bb5b1e5fc7049de922 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>   * @dev: drm device
>   *
>   * This functions calls all the crtc's, encoder's and connector's ->reset
>   * callback. Drivers can use this in e.g. their driver load or resume code to
>   * reset hardware and software state.
> + *
> + * It's worth noting that @drm_private_obj structures are expected to be

s/It's worth noting/Note/

> + * stable across suspend/resume cycles, and @drm_mode_config_reset()
> + * will not affect these structures.

s/will/does/

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   */
>  void drm_mode_config_reset(struct drm_device *dev)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_colorop *colorop;
> 

-- 
Regards,

Laurent Pinchart
