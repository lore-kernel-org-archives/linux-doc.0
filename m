Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890882135B9;
	Wed, 22 Jan 2025 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562364; cv=none; b=bBama1VLNK1H8T4Tj4zT+bVm3VhRAvHgAG8cWrP0hYqm2RmF4LHzezlpQ0WgNv+3FcvVsFl8SEe26+JN7nOF6SbMBwrNYTIHQlr5oswnb3+I9ZVdT0JhTIcWGpuo7nTodDely+UW3AXSG6uP191xelry3NaCSdzYdwbbjV0i+Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562364; c=relaxed/simple;
	bh=uudeRDGykGnSjdD6vSzaXNVMOFO45K/FhIVyBV1fHwc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9CEu0EiUHRBB2fZ2nKswmdbqixZHWXg4SGbBlIc9lY+EFYB/6W92KDxRwmEV5EBDjEH70ReXfJXGGUBD6laph5LC7JlwAjAMBXLNzaGfCk4W2UE8n7p1jITm5ZNECvwJ2sDVuLFtOIuk9+qZVKiJvp0Na7qgdmlbT7jWTGF2Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p7C251Sf; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p7C251Sf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B3261C000F;
	Wed, 22 Jan 2025 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737562355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUhoqRqNTi+JvpW8VrhCgfqzUUgEFjEK0Fi5GnnU8aA=;
	b=p7C251SfaqCthIu1s+0NxFFMsaC8tuHLjxiN4XAXymcLB0kq+zWpgSG/vBalxh8Qfp3IDj
	RRQGmgOBzoCq2CygM0rSYnLlJBV/Y1Mv2o8/YY++cFK3Q4frqiFL7P9MoRgRMXvqKw9QXU
	561sReYr+vuqli0Z1oJRv+3B/UkXvHBX0GDXhBD86U5zOCH8evhUpGfrBn13+IrUsBUZ9g
	zr731BMgz8DylX74uXzMNJP4ypCrGL6Ianof2iK1Srq9gDTa0VrCvSOUh/tcnSSVV7JO96
	B9Q8Aj/IdsYGAr8E6i8hFE35PlPdHSmoH26ucRK1vD1pHRwR1HFWvvQfeGgmgg==
Date: Wed, 22 Jan 2025 17:12:30 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Simona Vetter
 <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, Andrzej Hajda
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
Message-ID: <20250122171230.30cf9b97@booty>
In-Reply-To: <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
	<20250106-vigorous-talented-viper-fa49d9@houat>
	<CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
	<20250108162429.53316041@booty>
	<20250108-astonishing-oarfish-of-energy-c0abbe@houat>
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

Hi Maxime,

On Wed, 8 Jan 2025 17:02:04 +0100
Maxime Ripard <mripard@kernel.org> wrote:

[...]

> > > > And we'll also need some flag in drm_bridge to indicate that the device
> > > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > > because now your bridge driver sticks around for much longer than your
> > > > device so the expectation that your device managed resources (clocks,
> > > > registers, etc.) are always going to be around.    
> > 
> > Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> > drm_bridge.c will need to be sprinkled with them I guess.  
> 
> The users would be the drivers, most likely. There's not much we can do
> at the framework level, unfortunately.

Back to the idea of a "gone" flag, or perhaps an "unplugged" flag to
be consistent with the struct drm_device naming, and
drm_bridge_enter()/drm_bridge_exit(), I did a few experiments and have
a question.

In case:

  a) there is a notification callback to inform about bridges
     being removed, and
  b) all entities owning a struct drm_bridge pointer stop using
     that pointer when notified


With the above, there should be no need for
drm_bridge_enter()/drm_bridge_exit(). Nobody will be using a pointer to
a bridge that is being removed.

Now, about a), patch 1 in this series implements such a mechanism to
inform all bridges when a bridge is being removed. Note that the
"unplugged" flag would be set immediately after the notifier callback
is currently called: "unplugged == true" will never happen before the
callback, and after the callback there will be no pointer at all.

Patch 1 however is only notifying bridges, so other entities (e.g.
encoders) cannot be notified with this implementation. However a
different notification mechanism can be implemented. E.g. until v3 this
series was using a generic struct notifier_block for this goal [0], so
any part of the kernel can be notified.

About b), the notification appears simpler to implement in the various
drivers as it needs to be added in one place per driver. Also adding
drm_bridge_enter()/exit() can be trickier to get right for non-trivial
functions.

Do you see any drawback in using a notification mechanism instead of
drm_bridge_enter()/exit() + unplugged flag?

[0] https://lore.kernel.org/all/20240510-hotplug-drm-bridge-v2-2-ec32f2c66d56@bootlin.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
