Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3DB19F133;
	Wed,  8 Jan 2025 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349884; cv=none; b=taNDh7aM3RHus1LzW3ONRm6tXHZ6QIIssZ+KpyE7R3+vq0krRtvMW/oscsUPpPaXCsb8gTQk6YiT/sttxY6SBn+RE39jy6+n8HyCoW5lCmgHk/sXqXZ6/0qSpPoKPHSw5X/X1y2h0KI7VLuJTlNLe4/FpPA/ffH1NRDjM4yIFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349884; c=relaxed/simple;
	bh=OlcLb18jOT9/xMX/VPyf7qf3V1Qlk9K/H08onYEQ94o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IM+zYzhFin6jewFwtoN4rwJQjwItU9PxlfIMe6FzHW0VWJxPWSsK1yEaqyd0lQ2zfniFeeC+lK8g7XnpoAUrALMggrbiq18NcdW85ePP7PRwaWeDB55xfl66UpUU502Bb5iIYnFW8l9y21+YRnX4tkCtErRAK/vjd9RxkE1+edw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AIYyyrDi; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AIYyyrDi"
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEC90FF80B;
	Wed,  8 Jan 2025 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736349873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIM7UPvCpMsXyf+6sEngjDEzqEoTr2YHUQTUK4lg6Qo=;
	b=AIYyyrDikLpBO0qSXSEd1AFqBN9Xnfs4V2oEBC3vy1bfATtkJ1EhBLecNwBIm88DB0lGoZ
	Hk1A8jRXY0jXI0vANaMKBKFdtfW4J7/ot9KYO5gGsQZjjI03mG6tiHeJR0IVkVQYd8MFCm
	Sny+U4HmzIEecYTS0twtwEvChFvQtUl2hWcSLudUqmUdLYZnXHm3A2XkmvlYzFrnkDJY4u
	B/+7DJjkD+UJTSQg2aG7kCcm8xrStwbQY2GhtIKDHADojBVZPB9m3gE9vWo2k8RcserXUw
	uXyo8wjB5F0+j7F3f4bBtDS2xrOYNRYPmqgTlnJYtJtElR1RtF7JPV0eWMgSmA==
Date: Wed, 8 Jan 2025 16:24:29 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Thompson <danielt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Paul
 Kocialkowski <contact@paulk.fr>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <20250108162429.53316041@booty>
In-Reply-To: <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
	<20250106-vigorous-talented-viper-fa49d9@houat>
	<CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime, Dmitry,

thanks both for the useful review!

On Mon, 6 Jan 2025 14:24:00 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > Most of these comments affect your earlier patches, but let's work on
> > the API-level view.
> >
> > On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:  
> > > + * When using refcounted mode, the driver should allocate ``struct
> > > + * my_bridge`` using regular allocation (as opposed to ``devm_`` or
> > > + * ``drmm_`` allocation), call drm_bridge_init() immediately afterwards to
> > > + * transfer lifecycle management to the DRM bridge core, and implement a
> > > + * ``.destroy`` function to deallocate the ``struct my_bridge``, as in this
> > > + * example::
> > > + *
> > > + *     static void my_bridge_destroy(struct drm_bridge *bridge)
> > > + *     {
> > > + *         kfree(container_of(bridge, struct my_bridge, bridge));
> > > + *     }
> > > + *
> > > + *     static const struct drm_bridge_funcs my_bridge_funcs = {
> > > + *         .destroy = my_bridge_destroy,
> > > + *         ...
> > > + *     };
> > > + *
> > > + *     static int my_bridge_probe(...)
> > > + *     {
> > > + *         struct my_bridge *mybr;
> > > + *         int err;
> > > + *
> > > + *         mybr = kzalloc(sizeof(*mybr), GFP_KERNEL);
> > > + *         if (!mybr)
> > > + *             return -ENOMEM;
> > > + *
> > > + *         err = drm_bridge_init(dev, &mybr->bridge, &my_bridge_funcs);
> > > + *         if (err)
> > > + *             return err;
> > > + *
> > > + *         ...
> > > + *         drm_bridge_add();
> > > + *         ...
> > > + *     }
> > > + *
> > > + *     static void my_bridge_remove()
> > > + *     {
> > > + *         struct my_bridge *mybr = ...;
> > > + *         drm_bridge_remove(&mybr->bridge);
> > > + *         // ... NO kfree here!
> > > + *     }  
> >
> > I'm a bit worried there, since that API is pretty difficult to get
> > right, and we don't have anything to catch bad patterns.
> >
> > Let's take a step back. What we're trying to solve here is:
> >
> >   1) We want to avoid any dangling pointers to a bridge if the bridge
> >      device is removed.
> >
> >   2) To do so, we need to switch to reference counted allocations and
> >      pointers.
> >
> >   3) Most bridges structures are allocated through devm_kzalloc, and they
> >      one that aren't are freed at remove time anyway, so the allocated
> >      structure will be gone when the device is removed.
> >
> >   4) To properly track users, each user that will use a drm_bridge needs
> >      to take a reference.  
> 
> 5) Handle the disappearing next_bridge problem: probe() function gets
> a pointer to the next bridge, but then for some reasons (e.g. because
> of the other device being removed or because of some probe deferral)
> the next_bridge driver gets unbdound and the next_bridge becomes
> unusable before a call to drm_bridge_attach().
> 
> >
> > AFAIU, the destroy introduction and the on-purpose omission of kfree in
> > remove is to solve 3.
> >
> > Introducing a function that allocates the drm_bridge container struct
> > (like drmm_encoder_alloc for example), take a reference, register a devm
> > kfree action, and return the pointer to the driver structure would solve
> > that too pretty nicely.
> >
> > So, something like:
> >
> >
> > struct driver_priv {
> >        struct drm_bridge bridge;
> >
> >        ...
> > }
> >
> > static int driver_probe(...)
> > {
> >         struct driver_priv *priv;
> >         struct drm_bridge *bridge;
> >
> >         ....
> >
> >         priv = devm_drm_bridge_alloc(dev, struct driver_priv, bridge);  
> 
> Ah... And devm-cleanup will just drop a reference to that data,
> freeing it when all refs are cleaned? Nice idea.

I like the idea. It's basically a macro wrapping the calls to kzalloc()
+ drm_bridge_init() that I proposed in this series. I had thought about
such an idea initially but I haven't seen such a macro in
drm_connector.h I didn't follow the idea.

I don't love the _alloc name though because it will be doing much more
than allocating. What about devm_drm_bridge_new()?

I understand _alloc is coherent with the drmm_encoder_alloc() and I
could survive that... but what about renaming that one to
drmm_encoder_new()?

Or maybe _create instead of _new, because _new is used for atomic
states, in opposition to _old.

> > And we'll also need some flag in drm_bridge to indicate that the device
> > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > because now your bridge driver sticks around for much longer than your
> > device so the expectation that your device managed resources (clocks,
> > registers, etc.) are always going to be around.  

Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
drm_bridge.c will need to be sprinkled with them I guess.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
