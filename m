Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117FB36124
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 03:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897287; cv=none; b=JWj+QictPY/KqFFlKXPp9tbfT7pnNO0VNEku8c8hPZHwXuej3NXDg8bB4u06BDed5lNZ7/rVTC2UW5oVwtSFrb0rApUYI7kjAinMxPom3WSEdhYrFgE072RBbt5UESwbi6PeKlL+a1MZdwWpxwOU5SyaWOR8uFL0ZosFWHNwisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897287; c=relaxed/simple;
	bh=gJh0Lv3WVGZyLCoutcMcGnow+aK2BupFtmH5zSujVIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlmT8Bl+Mcm7+YNdFOUut8XBluIJUXLFTvtAANHHeu+3ih3MnDmPjmc2mDf0MYtVD7q4t7w7pS3O2u69qzJyVncQxvoAEnFjvPekNrtQBVaus8rMRm/q0uVIhFJggoJPABl+Sja//hT4orEzT2RZ9RI7b8uNl0r0PezL4WWwXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUPiE6Zo; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUPiE6Zo"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307325f2436so14357641fa.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 19:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738897283; x=1739502083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
        b=TUPiE6ZomkptDoUmK5LqPp+AtT4vn5y13yBebHrHZgV9oIY58xCIYKM9kVAUFUoYOj
         ezTanc8Sr6o7ORqc3BAOScyqYFrxWfzSwtmlZAvE7lalTt0G96nNJEMuexc2bAuyfUym
         SOiflJ3mzIU4W+J6KmENxChp0Gh/eJAzO2R8mBN2xD2CUN0ouvpO0Wxf/wauyItfxNGx
         ATXCKeY3Mwb0SXhd9wpkm+XNQzVHGga9Kvo0+dXDOL72VoTQZ6iRCHAghmsSH/VyJ2uD
         DyylZXe1Bd3JW6t2qgJS3RYoB3nAW2zeNX3wEx3VuQ1bDXE46R9CKQ/LDOqsofE0HA4d
         kR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738897283; x=1739502083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
        b=BjZHf72gUrg2LOFBc0Z5N4MG58X3rcXllujG67XEuP1yLWdx9K3l5AafsJRUX0Mxfy
         8pTHT5AY2LWWf0Lk7dlwf6fxCIWqgJwCZmN48SYU5CoC+bNCTtivPOhSIZ7M0HaqdJOY
         I4l4FrQO0dGE1yl0E4zP+VA34/JvWEeAsf49fIUY4obdBzxE+4IDYk15xD5jcZLZNOna
         EVCK/weA4PfQ1bhR7lI+1FzcHDx3neA2eE29NMt3HMDJbPIkcX9LwC+dtbqDYy4SadvE
         2jOI3RLt6NOCoDby5x7uWI9Y2Lke+7fy2qT06kqUB72/xm4NfwNcSiGTxqtGnibUjMS3
         AAhw==
X-Forwarded-Encrypted: i=1; AJvYcCWNzhEZ/YlIfecMPTR8EGW6E6Di4OCEkZXRfZ+m+jtunxzsJElHE4I+6fxMSqgLL2JSVhfcNYmcUCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7pGg3exGOq0Je94IjgKLAyl47nlnr0UCOxqQeXm7a+zUgQn4
	aFF/pWSbaVGwUgFgWsUb+WzonHd305or7N1LGxXlzBWixBeRcTUfAxv2eehVzXc=
X-Gm-Gg: ASbGncvam0njGbGFosJxu4riRo+1yvRWHi5HBsHZUIAjxnSF0QL761AOtae4zN94wjB
	hskQAJHU4YrJ3FP9fM5K0qvVt248VbvTABp98/QJTAMQDzFBUJKt5z+peKOUXHgES97qVfEd4CH
	G1QIB+DLGJt2OnJ+QGW0YycTBZjdbPR2AgqvaGpf1vfOk3PF8TEE3bgu4fkH2+ynxKPVoh9zopc
	GXpgiAbMfQN32AOTeE3jOEMvFky4iSkvxaCtQwMF4AUL/+rKZvoODgN1A114SHRpbMl3SWqIgBY
	yf4q2ybKcVAt3OSaOfuZ8ZGL09va6fUWdlFR29aR/SQA+pI6Ei7IzDZArXCGCi6dotB7vVk=
X-Google-Smtp-Source: AGHT+IGDqEkE6OWYr0NcLlg1JR9sknC45WBuXsh87/ud3ljT7djhN2ztl5wAF/TJfj5OXo6RJ8lw+Q==
X-Received: by 2002:a2e:bc21:0:b0:302:244a:da2c with SMTP id 38308e7fff4ca-307e5a71d1amr2898811fa.31.1738897283014;
        Thu, 06 Feb 2025 19:01:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de18e48dsm2871441fa.27.2025.02.06.19.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:01:21 -0800 (PST)
Date: Fri, 7 Feb 2025 05:01:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 12/26] drm/bridge: allow bridges to be informed about
 added and removed bridges
Message-ID: <5roxoodskw3ieksvzqezs33gcwhppeqikagu5462wljc6zylif@5ls7bmdusmq5>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:27PM +0100, Luca Ceresoli wrote:
> In preparation for allowing bridges to be added to and removed from a DRM
> card without destroying the whole card, add a new DRM bridge function
> called on addition and removal of bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v6:
>  - rebased fixing conflicts
> 
> Changed in v5:
>  - fixed kerneldoc errors
> 
> This patch was added in v4.
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
>  include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b0834b8644284e5f7751cec81724af849b4180e7..1955a231378050abf1071d74a145831b425c47c5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -207,12 +207,18 @@ LIST_HEAD(bridge_list);
>   */
>  void drm_bridge_add(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_init(&bridge->hpd_mutex);
>  
>  	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
>  		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
>  					       BIT(HDMI_COLORSPACE_YUV420));
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD, bridge);
> +
>  	mutex_lock(&bridge_lock);
>  	list_add_tail(&bridge->list, &bridge_list);
>  	mutex_unlock(&bridge_lock);
> @@ -249,10 +255,16 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>   */
>  void drm_bridge_remove(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_lock(&bridge_lock);
>  	list_del_init(&bridge->list);
>  	mutex_unlock(&bridge_lock);
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
> +

I think the order should be different: notify about the added bridge
after adding to the list, notify about bridge removal before removing it
from the list.

>  	mutex_destroy(&bridge->hpd_mutex);
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1561347c4991dac6022319774510f9560c9283c3..ad7ba444a13e5ecf16f996de3742e4ac67dc21f1 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -56,6 +56,11 @@ enum drm_bridge_attach_flags {
>  	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
>  };
>  
> +enum drm_bridge_event_type {
> +	DRM_EVENT_BRIDGE_ADD,
> +	DRM_EVENT_BRIDGE_REMOVE,
> +};
> +
>  /**
>   * struct drm_bridge_funcs - drm_bridge control functions
>   */
> @@ -729,6 +734,24 @@ struct drm_bridge_funcs {
>  				      struct drm_bridge *bridge,
>  				      bool enable, int direction);
>  
> +	/**
> +	 * @bridge_event_notify:
> +	 *
> +	 * Notify that another bridge is being added or removed.
> +	 *
> +	 * This callback is optional. Bridges implementing it must always
> +	 * check whether the event refers to a bridge they actually need to
> +	 * interact with.
> +	 *
> +	 * @bridge: bridge being notified
> +	 * @event: event happened (add/remove bridge)
> +	 * @event_bridge: the bridge mentioned by the event (i.e. the
> +	 * bridge being added or removed)
> +	 */
> +	void (*bridge_event_notify)(struct drm_bridge *bridge,
> +				    enum drm_bridge_event_type event,
> +				    struct drm_bridge *event_bridge);
> +

This creates a small issue. It requires drivers to have a bridge, even
if they don't need one - e.g. the drm_encoder doesn't get notifications
about the added bridges.

I'm not sure if that can be solved in an efficient way.

>  	/**
>  	 * @debugfs_init:
>  	 *
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
