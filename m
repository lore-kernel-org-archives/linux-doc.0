Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AED3A1DB;
	Thu,  2 Jan 2025 12:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735819416; cv=none; b=jsj8Po6I6PStns7pgt7cAm2oTYoUi5Feh/RXmFoY0ciAekQ7zaW3qtSFHwCdW95ryNU/4pKVd7J0KJebCmB4ecg89Qu8SdCx5/OOE0rZO1J83IUbBFAS4iQxpIfnNO/ZBejvNndPKvafRzGks3+GeIBcITTHmGbqtJcGbqWpyog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735819416; c=relaxed/simple;
	bh=IsC+ohYaYMgpTyjL8FgeM2kzQNhqpoJY7eysH9xxCt8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JKF+ivNNSL1K2fkzgpMz+y0NLeHKr84EwX/xpRSrq0xF+PgW699+Z5hZgUQIwSi2oTCxtMSzy8BguLYgDMY4gr39rdBsDeL6o3IOEfLD0bu8JSfHW0xnjgkAL/rsVhaimyJYyc6K+MZra7PTMe2ijtRoXgL+IrP4i/6gdYNBCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m4ivbl7y; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m4ivbl7y"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C2241C0004;
	Thu,  2 Jan 2025 12:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735819406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ppo3X6Dgf+YhWkInAvRD7rU04s+pC1rYIdOP2DFVKyk=;
	b=m4ivbl7yU+1H67REpSnJ29fJAW2hC7FjV73U6PgL257jNZMneDwPHoRx3P02z6bcXSOPEy
	AvmyxhSPTOdXqgKEBbZdw/KVye0S3a3MwhM9VV5lC5Uwj0evj+3vNsigsTqe5cupuU2Xp9
	+gHVXLYWpCxGXbIdd19E9SxgFfv+fa57V3Pqncw7f8sl2YWHuaCbecHFcWu6o0Gn2OE2x9
	rBDuLnRCBwOLWubFEr7K8014jElyCsIYXyzDBrovBREizdKl62VIX12zOnRfriZGNIJ9g4
	tB0PzCOf1DXZjBOD3dK29WcA9AfgzLlbNgldKGpbyoxhoOy9XY0stAg2BhuTMw==
Date: Thu, 2 Jan 2025 13:03:19 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 03/10] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250102130319.2e8079a9@booty>
In-Reply-To: <87seq4nm3g.fsf@intel.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com>
	<87seq4nm3g.fsf@intel.com>
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

Hello Jani,

thanks for your review.

On Tue, 31 Dec 2024 13:11:31 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Tue, 31 Dec 2024, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > DRM bridges are currently considered as a fixed element of a DRM card, and
> > thus their lifetime is assumed to extend for as long as the card
> > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > require DRM bridges to be added and removed to a DRM card without tearing
> > the card down. This is possible for connectors already (used by DP MST), so
> > add this possibility to DRM bridges as well.
> >
> > Implementation is based on drm_connector_init() as far as it makes sense,
> > and differs when it doesn't. A difference is that bridges are not exposed
> > to userspace,hence struct drm_bridge does not embed a struct
> > drm_mode_object which would provide the refcount and the free_cb. So here
> > we add to struct drm_bridge just the refcount and free_cb fields (we don't
> > need other struct drm_mode_object fields here) and instead of using the
> > drm_mode_object_*() functions we reimplement from those functions the few
> > lines that drm_bridge needs for refcounting.
> >
> > The function to enroll a private bridge driver data structure into
> > refcounting is based on drm_connector_init() and so called
> > drm_bridge_init() for symmetry, even though it does not initialize anything
> > except the refcounting and the funcs pointer which is needed to access
> > funcs->destroy.
> >
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >
> > ---
> >
> > This patch was added in v5.
> > ---
> >  drivers/gpu/drm/drm_bridge.c |  87 ++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_bridge.h     | 102 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 189 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index b1f0d25d55e23000521ac2ac37ee410348978ed4..6255ef59f73d8041a8cb7f2c6e23e5a67d1ae926 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -198,6 +198,85 @@
> >  static DEFINE_MUTEX(bridge_lock);
> >  static LIST_HEAD(bridge_list);
> >  
> > +static void drm_bridge_put_void(void *data)
> > +{
> > +	struct drm_bridge *bridge = (struct drm_bridge *)data;
> > +
> > +	drm_bridge_put(bridge);
> > +}
> > +
> > +static void drm_bridge_free(struct kref *kref)
> > +{
> > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > +
> > +	DRM_DEBUG("bridge=%p\n", bridge);
> > +
> > +	WARN_ON(!bridge->funcs->destroy);  
> 
> Please don't add new DRM_DEBUG or WARN_ON where you can use the
> drm_dbg_* or drm_WARN_ON variants.

Good point. However drm_WARN_ON() cannot be used because it needs a
non-NULL struct drm_drm_device pointer which is not always available
here: in case of -EPROBE_DEFER it usually isn't. I guess I'll go for
drm_dbg_core() or drm_warn[_once](), even though none of them prints a
stack trace and I find that would be useful.

This is raising a loosely-related question about the DRM_DEBUG()s this
patch is adding, such as the one quoted above: would it make sense to
add a new drm_debug_category value for the bridge refcounting
functions? Or for bridges altogether? They are pretty different from
the core messages, and it may be useful to see only the refcounting
messages or only the core messages.

DRM_UT_BRIDGE?
DRM_UT_BRIDGE_REFCOUNT?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
