Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCF41FDE2B;
	Wed,  8 Jan 2025 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349884; cv=none; b=Y8BGAPjqf8CPj2fx3C5BVqtqqdZySCg79QB4pgYgLBxk6vBN2VCEEz/o2p9tu6f5d0DQukqkJEoO3yHc3o5hcEFNQMzMa+PMzxyF7048uCseRZKMJmJmy2/SiVOTiXXKTMsCd/cPejP8aBtPfnB60uYLiuj4DSb5zddmZdcVEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349884; c=relaxed/simple;
	bh=+cg/LzlC5Kqnd6R7npT3CHNbUr4IJtM6sGhURs3OgF0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ElpF1SM5zOVQhnt3+nHoyTPXqCRFWLnyxxzGEFoDLzKxvTpCXIlKVlvwnn561X2EhrlnozpMuX7Z+JMFSXrZ82/LADuEwavmz7vMHqfTNWSQp+cp6T9R/KwUoSwrjzUMkPXdBKZpPFZOMJP0YiqQgSWH8mHW7HXIp30zDiQtm1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I2PdzC/t; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I2PdzC/t"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1EA1E0009;
	Wed,  8 Jan 2025 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736349879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uo/7cjqL6hb31VqXRe6MdL3FpNNsU+pvNS7IaAOCj5c=;
	b=I2PdzC/tFXuwIbeh4EPPNIcAobKUPu0JYNvqpfdw2E9C1K4nC2qZVSN2zFxpHAci1hPwrm
	25ueGWMhlRtaoK3yw0Qo0mjH37/+xZoF8JrPMe+Q+lodqgUBlTZBN5kbmck6VwXbVUsOZu
	q9OXI2RkC1EwpKcyOg/Qmxi5m8ehQCFU7fOkLKz7krUC6zdoXAAYRzR5pxBlsPYhYghDuE
	+4iNtBC6vo8rUAK/Dq0FznV5tMGVPXZRyVap270uB8GRv9DCbslhnf7hRzFUL8QLtPwtpc
	5RyOO90a+Zvn1bvbK+a+Ndl7hvfhFLEaOt+tC+gs/4rOv5NA2VwZxrqbO5F6nw==
Date: Wed, 8 Jan 2025 16:24:34 +0100
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
Message-ID: <20250108162434.79268de1@booty>
In-Reply-To: <2ay7s3nokg2yyks2t7df6niee7z3a2jhgqw7elumk3lirdvjbk@qqrnkbwcfqly>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
	<20250106-vigorous-talented-viper-fa49d9@houat>
	<CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
	<20250106-quick-exuberant-jellyfish-cddde2@houat>
	<2ay7s3nokg2yyks2t7df6niee7z3a2jhgqw7elumk3lirdvjbk@qqrnkbwcfqly>
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

On Tue, 7 Jan 2025 12:35:15 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Mon, Jan 06, 2025 at 03:49:48PM +0100, Maxime Ripard wrote:
> > On Mon, Jan 06, 2025 at 02:24:00PM +0200, Dmitry Baryshkov wrote:  
> > > On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:  
> > > >
> > > > Hi,
> > > >
> > > > Most of these comments affect your earlier patches, but let's work on
> > > > the API-level view.
> > > >
> > > > On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:  
> 
> > > >         if (IS_ERR(priv))
> > > >            return ERR_PTR(priv);
> > > >         bridge = &priv->bridge;
> > > >
> > > >         ...
> > > >
> > > >         drm_bridge_add(bridge);
> > > > }
> > > >
> > > > Would work just as well.
> > > >
> > > > I also don't think we need explicit (at least for the common case)
> > > > drm_bridge_get and drm_bridge_put calls for bridge users.
> > > > drm_bridge_attach and drm_bridge_detach can get/put the reference
> > > > directly.  
> > > 
> > > As I wrote previously, I think drm_bridge_attach() might be too late for that.
> > > It sounds like drm_of_get_panel_or_bridge() and of_drm_find_bridge
> > > should increment the refcount, possibly adding a devres action to put
> > > the reference.  
> > 
> > We probably need both. drm_bridge_attach adds the bridge pointer to the
> > encoder bridge_chain list, so if we had something like
> > 
> > bridge = drm_of_find_bridge();
> > drm_bridge_attach(encoder, bridge);
> > drm_bridge_put(bridge);
> > 
> > We could have a dangling pointer.  
> 
> Yes... So, both drm_bridge_attach and drm_of_find_bridge() should take
> the refcount.

Exactly, just like drm_bridge_add/remove() do.

> Just as an idea, it might be nice to add refcounting to bridges_show(),
> so that we can easily verify that refcounting works correctly.

Good point, cheap and useful, adding that too!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
