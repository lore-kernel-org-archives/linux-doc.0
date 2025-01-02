Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507651B3954;
	Thu,  2 Jan 2025 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735819329; cv=none; b=jIfN9L8GaWOyk/LPKZxRQPuoVhhRTU+qsAB4fnpBnu4SsBidtzxbFAqJvLQLVCBwoo80p7Irx20BrNst1uIltTe3rl3RxUXJIDMv0PsbRUS27tguKPFYr6wrDM/8W2QgsN9pk+w4AAu6+4Th8pTzWNYfyfuNqgqj4w+Oh7J/Q7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735819329; c=relaxed/simple;
	bh=zumKLbVIoLQADhsw1Zftg5t1d+mAmHOzmH6YpkGIi3c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFug1wKkF1UzAWzDInw9d4MptLw0WdfmZR5foZPZokO/P5cUYX9ZYxdz2NKWGc8omtkNsje5jLjiRBe/68S9yS3YCrrh5+cT5qoQ2+v2am0JQn/jzuSA0BpPaEwixF6UVNMXwzTKsmx108/LmMC7fTT0StHdskPjh98k5cC3bqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p4c6KQHS; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p4c6KQHS"
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B2326C16DB;
	Thu,  2 Jan 2025 12:01:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0931460003;
	Thu,  2 Jan 2025 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735819305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ns5gVE3WJ7XMJdDLsRxKcEqR9i92LnnO5bYuNJNN3VU=;
	b=p4c6KQHSsJ54irO7s0y08Y+b1iKaVf9K4mz2tFSfnhZ4yVB2lor3CUzXYdx7qpHeOyrC7M
	y64Peim3eUbU/POtUFAVDf/5z9fOxTA/oDCG6kIWDCvFWrZWEpSA/a9kdexOiI6Lnt+TVL
	YXDE6fsu/IYAPep3pcf+dnuT6X1czkV2tuZN1i5ZIITT+KPreiiXKqqjpFtejhuSfWx/Wc
	GfigElCb2vPMD1jd26WExscanP8R26lzcy6uzOPGVm2XCJjQbNIjgVybGi2YMIpy+JaAcj
	k21GH+4aiTNaXGAJB6EaU6clYITn+5I3Vx19ED87bJTHPmqSMrVvm/wnP0QO3g==
Date: Thu, 2 Jan 2025 13:01:40 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 10/10] drm/bridge: hotplug-bridge: add driver to
 support hot-pluggable DSI bridges
Message-ID: <20250102130140.59363125@booty>
In-Reply-To: <ourjepuvkhzpemhak3t6do3or6shrj4cq2plhii4afgej4qhkk@p6tvptupr3ey>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-10-173065a1ece1@bootlin.com>
	<ourjepuvkhzpemhak3t6do3or6shrj4cq2plhii4afgej4qhkk@p6tvptupr3ey>
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

Hi Dmitry,

On Tue, 31 Dec 2024 17:29:52 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Tue, Dec 31, 2024 at 11:40:04AM +0100, Luca Ceresoli wrote:
> > This driver implements the point of a DRM pipeline where a connector allows
> > removal of all the following bridges up to the panel.
> > 
> > The DRM subsystem currently allows hotplug of the monitor but not preceding
> > components. However there are embedded devices where the "tail" of the DRM
> > pipeline, including one or more bridges, can be physically removed:
> > 
> >  .------------------------.
> >  |   DISPLAY CONTROLLER   |
> >  | .---------.   .------. |
> >  | | ENCODER |<--| CRTC | |
> >  | '---------'   '------' |
> >  '------|-----------------'
> >         |
> >         |               HOTPLUG
> >         V              CONNECTOR
> >    .---------.        .--.    .-.        .---------.         .-------.
> >    | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
> >    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
> >    |         |        |  |    | |        |         |         |       |
> >    '---------'        '--'    '-'        '---------'         '-------'
> > 
> >  [--- fixed components --]  [----------- removable add-on -----------]
> > 
> > This driver supports such a device, where the final segment of a MIPI DSI
> > bus, including one or more bridges, can be physically disconnected and
> > reconnected at runtime, possibly with a different model.
> > 
> > The add-on supported by this driver has a MIPI DSI bus traversing the
> > hotplug connector and a DSI to LVDS bridge and an LVDS panel on the add-on.
> > Hovever this driver is designed to be as far as possible generic and
> > extendable to other busses that have no native hotplug and model ID
> > discovery.
> > 
> > This driver does not itself add and remove the bridges or panel on the
> > add-on: this needs to be done by other means, e.g. device tree overlay
> > runtime insertion and removal. The hotplug-bridge gets notified by the DRM
> > bridge core after a removable bridge gets added or before it is removed.
> > 
> > The hotplug-bridge role is to implement the "hot-pluggable connector" in
> > the bridge chain. In this position, what the hotplug-bridge should ideally
> > do is:
> > 
> >  * communicate with the previous component (bridge or encoder) so that it
> >    believes it always has a connected bridge following it and the DRM card
> >    is always present
> >  * be notified of the addition and removal of the following bridge and
> >    attach/detach to/from it
> >  * communicate with the following bridge so that it will attach and detach
> >    using the normal procedure (as if the entire pipeline were being created
> >    or destroyed, not only the tail)
> >  * instantiate two DRM connectors (similarly to what the DisplayPort MST
> >    code does):
> >    - a DSI connector representing the video lines of the hotplug connector;
> >      the status is always "disconnected" (no panel is ever attached
> >      directly to it)
> >    - an LSVD connector representing the classic connection to the panel;
> >      this gets added/removed whenever the add-on gets
> >      connected/disconnected; the status is always "connected" as the panel
> >      is always connected to the preceding bridge  
> 
> I'd rather have just a single connector. MST connectors can be added and
> gone as there is fit, so should be your LVDS panel-related connector.

The plan we discussed at LPC 2024 is to eventually get rid of the first
connector (see "Roadmap and current status" in the cover letter), so
you can consider this legacy code. However the current implementation
won't work without this connector, so it is still there for the time
being. Pointing this out in a note in the commit message of this patch
would probably be useful to avoid future misunderstanding, so I'm
adding one for v6.

Thanks for reviewing!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
