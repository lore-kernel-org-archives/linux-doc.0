Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8C215098A
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460675; cv=none; b=R0L5i2cct245os7KsUIDliakn5WfBNDFBKbgrbVRjRqUJEblL7vALGy2mfdy2fHN9ou74L4wMiYxfK7jMEZzWLu88KOijQ0Y9kF0C7xkDJgpOjzgge8yvkMOdrbamCMD4MUilydnAsGdskfTIrzYChbximidQ0vJB6hT///j4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460675; c=relaxed/simple;
	bh=wjaw046mx0CwfInjFIsERp61sxaxf8lF/27Y8kugYFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II6WamnycvcYTYi6EUWiNcJHuzDhT38DT58ROqY3sEs5T/6VK+OcoEoaumY2baOWQ12o1uipPXZpUnSol+wHhM0Hy579c4oxI4Ei3zJGCClcINJ3jKbTGBEsmiea9MT6iOBph/hV0og3OV0h3Mdm0i11OdqC+1w+H9CXe52XEus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHYCXRm7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHYCXRm7"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so59124811fa.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 03:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737460672; x=1738065472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1SAFX7H1LuRl0ShcXdmRg9sr7Em0tM/5O3qe+btbqhM=;
        b=cHYCXRm7hfJtzfq8v++eOKjKULXz5JzXsPL2rk7wYW2lexdQkFGh6Lmh2/E/k4ut+l
         kFCsvIPuZ5u9enmbIH1yiOdJVYWMVO+G3GKFcwuAvzCjybQw2epIsZXelWRwV+hrEE0z
         h/sh+fsGVtGyc54RBzgsep9SKUqYmAJVT1NO1LZfq8fJhKJteoSbZtwoIVBcALjufomb
         cO5mM7Xk0qdgjMYd+yVPqhjm2FcDBvd+8tDap0+O/gzkymPiZ/f8higmhQcfJNlCrcK1
         plB8bvoy+qJrQc8DVfBVoKe2o1CAFxkXUdmezoZ9gnQxfBJzI9bzw9ksi2BM6GHQsSjj
         beXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737460672; x=1738065472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SAFX7H1LuRl0ShcXdmRg9sr7Em0tM/5O3qe+btbqhM=;
        b=plJlWDWiPR21jYgOqw73vMIx80StaKxXesR2khZY2aT4CSnG7Gw8vHIOcfZzxj8/6w
         WOOqdONoMvzRqRZScWBUdWDu+LQtI4+siFQekR/qBPzqyRPgL1tVRxEDdgLr8uiGi8ym
         kDTwnXcO7t7m4SdYmFPUM7hoDgj5UfSknz24CgZfA505E04y64FzIMSn2btx94quIZy7
         pdJFVC6uZAEu2ZBfByovOSEC07/64diFp6pzXvF1TZukZJIxRbvsxT1iCCO+B0mgQ+dj
         U8KLn06GrApE/1+XorG/xYbQU5uNIYat9zUOBxSdQ1aDkeWJ3HQtudbuwbF3JLvy9MYR
         NsJA==
X-Forwarded-Encrypted: i=1; AJvYcCXc2YQN9JmvfT+iQ0UzR2as7zkJLkIpWTWqLsY9SWtbVrvZgJgJVD2/jrViJk9YUDq5ZSdef1Aq8fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8LNwYbFexqcg2myqUWAvTxJ+NnWFlygMXY0tAOUfzBurz1s3W
	Nh7U3uS3M+CivYyp2IqW7zflq7nIn5rI/TYBkmqex0zrZVUc3nVB74EEktIeZ1w=
X-Gm-Gg: ASbGncs9NT+N/gjY7Ff3mzyw0fF+cNWZD8/dZqzqEDZyTfN36xWqoaWRCxJPfi69F1S
	abm3Nw48MBD0C5jieCQz+1591P4MVzx6fmOjxzKERMnT5WSyUdHu31LkS2+hbBFDpUkmY4NWa74
	UGdkeH78IbreRQcIFjK/N/8FRGyCwTBDC6qMH7LtvZ8wdWiqAG+8oziTWNZwBfXJ70T3duLyL8k
	bIAhdEfgyOghEuqc7GUvZO/oLNxKlZX/Hd+jtcem+t5YYPWwyMgsR0dzK+NvVf792j2OjVboI1p
	LaT06cAv5JqUwQXE6LA/Fhy+u1EWxpbAp13ErN56yClJi7DYzg==
X-Google-Smtp-Source: AGHT+IF8KkuX72ssiXat7VhOyndxwdOiTOiJJAWuGArrnCGES9N/kA5O4JMJCNQl9GYhF/0BHHp78g==
X-Received: by 2002:a05:651c:1551:b0:302:3021:9b29 with SMTP id 38308e7fff4ca-3072ca5da83mr69186151fa.4.1737460671594;
        Tue, 21 Jan 2025 03:57:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330886sm21235751fa.8.2025.01.21.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:57:50 -0800 (PST)
Date: Tue, 21 Jan 2025 13:57:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <lwqv5nukfchusbi2vep2cx3vu6oxj4r5jd7oe3wo4nxtpxadh2@wjyt2c2r46kn>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty>
 <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
 <emuj2innmp6zmzd7pyakqzjqpdzhly6qfhakya3ydwmd63pl26@5jwxaidpikjw>
 <20250121122718.48502262@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121122718.48502262@booty>

On Tue, Jan 21, 2025 at 12:27:18PM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Thu, 16 Jan 2025 12:56:25 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> [...]
> 
> > > Idea 3: 
> > > 
> > > The idea is that if the panel driver framework always creates a panel
> > > bridge, it will never need to be created on the fly automagically by
> > > its consumers, so the whole problem would disappear. It also would be
> > > better modeling the hardware: still wrapping a panel with a drm_bridge
> > > that does not exist in the hardware, but at least having it created by
> > > the provider driver and not by the consumer driver which happens to
> > > look for it.  
> > 
> > I think this is the best option up to now.
> 
> Thanks for sharing your opinion. However a few points are not clear to
> me, see below.
> 
> > > This looks like a promising and simple idea, so I tried a quick
> > > implementation:
> > > 
> > >  void drm_panel_init(struct drm_panel *panel, struct device *dev,
> > >                     const struct drm_panel_funcs *funcs, int connector_type)
> > >  {
> > > +       struct drm_bridge *bridge;
> > > +
> > >         INIT_LIST_HEAD(&panel->list);
> > >         INIT_LIST_HEAD(&panel->followers);
> > >         mutex_init(&panel->follower_lock);
> > >         panel->dev = dev;
> > >         panel->funcs = funcs;
> > >         panel->connector_type = connector_type;
> > > +
> > > +       bridge = devm_drm_panel_bridge_add(panel->dev, panel);
> > > +       WARN_ON(!bridge);
> > >  }
> > > 
> > > This is somewhat working but it requires more work because:
> > > 
> > >  * as it is, it creates a circular dependency between drm_panel and the
> > >    panel bridge, and modular builds will fail:
> > > 
> > >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> > > 
> > >  * The panel bridge implementation should be made private to the panel
> > >    driver only (possibly helping to solve the previous issue?)  
> > 
> > Or merge drm_panel.c into bridge/panel.c.
> 
> Not sure here you mean exactly what you wrote, or the other way around.
> It looks more correct to me that the panel core (drm_panel.c) starts
> exposing a bridge now, and not that the panel bridge which is just one
> of many bridge drivers starts handling all the panel-related stuff.

No, I actually meant what I wrote: merge drm_panel.c into
bridge/panel.c. Indeed we have some drivers that use panel directly.
However drm_bridge is a more generic interface. So, yes, I propose to
have a bridge driver which incorporates panel support.

> 
> > The panel bridge already
> > exports non-standard API, so it should be fine to extend / change that
> > API. Likewise we might move drm_panel.c to drm_kms_helper.o, also
> > resolving the loop.
> 
> Again I'm not following I'm afraid. It would seem more logical to me to
> move things from the helper into drm.o as they become more necessary
> for common cases, rather than moving things out to a helper module and
> then force all panel drivers to depend on the helper module.

There are a lot of DRM drivers which do not use panels (nor bridges).
Merging that code into drm.ko means that everybody ends up having that
piece of code in memory. Moving drm_panel.o out of drm.ko and
bridge/panel.o out of drm_kms_helper.ko would make the kernel slightly
smaller for those desktop-only users.

> 
> Apologies, I'm perhaps not following your reasoning here. :(
> 
> > There will be a need for a Kconfig update in both
> > cases.
> > 
> > >  * Many drivers currently call devm_drm_panel_bridge_add() directly,
> > >    they should probably call drm_of_get_bridge instead  
> > 
> > I'd say, make it a stub that calls drm_of_get_bridge() with a possible
> > deprecation warning.
> 
> I get the idea, but it would need to be implemented differently because
> drm_of_get_bridge() calls devm_drm_panel_bridge_add(). They would loop

If the drm_bridge is added during drm_panel_add(), then there is no need
to call devm_drm_panel_bridge_add() from drm_of_get_bridge().

> into each other. I think we might simply add a check at the beginning
> of drm_panel_bridge_add_typed(), as in (pseudocode):
> 
> drm_panel_bridge_add_typed(struct drm_panel *panel, ...)
> {
>     if (panel_has_a_panel_bridge(panel))
>         return panel->panel_bridge.bridge;
> 
>     // existing code
> }
> 
> But that reopens the same issue: drm_panel_bridge_add_typed() would not
> always call drm_bridge_add(), so the caller doesn't know how to dispose
> of the returned pointer.
> 
> I think idea 3 can only work if the code understands that the panel
> bridge is created by the panel and they _never_ have to create it
> themselves. So handling the transition for all drivers would be quite
> painful.

That's why I suggested just stubbing existing functions just to lookup
and return a bridge: drivers can transition one-by-one. The bridge will
be already there, created by the panel support code.

> 
> > >  * drm_of_find_panel_or_bridge() should disappear: other drivers would
> > >    just look for a bridge  
> > 
> > Please keep it for now.
> > 
> > Some of the drivers think that it returns literally panel-or-bridge (but
> > not both). However if panel bridge is already created, it will return
> > both. So those drivers need to be updated.
> 
> I really believe it never returns both. The *bridge is set only when
> ret != 0 here [0], which can happen only if a panel was not found.
> Despite the slightly intricate logic of that function, I don't see how
> it could return both in its current implementation.

Indeed. You are right, I skipped the if(ret) condition. More boilerplate
code in the drivers :-(

> 
> [0]
> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/drm_of.c#L273
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
