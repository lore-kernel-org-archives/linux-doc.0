Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0760890;
	Mon,  6 Jan 2025 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174991; cv=none; b=UB2ShoyE7O6gT3aeWvC5AuDaPJhODB5Yc0VgaCUMe+R0MGQ0E0xJtPJopVoHFhuaXn4zGtYPYSd0sKanmJJ79wq9hHgS0ycQei8VL9T3p8TgyXfCwPboc4fpVdVetAgEq3TjS6KvvGqmu9SgZXQBabRCF2FxqUE+vrJ6asVIjvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174991; c=relaxed/simple;
	bh=hv5pZy+7yQLbAjC2su/ajqsFY/ju6Lj3BN23KsHWCHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uY617s5BxqhRWvLqVGojEh/JW8mKVsz9kmlrNt8ONVIxYNVfB3VeuYRvHfslzXy0MrHiyiyeFS38WDEASqxxbaW/M0QglUtz67VH6Ct0iDJM8wS0QZzlpWcPSGdVLP/7IOQa4uiEktQrx1UI8bKrRzP/lmwSLuHXrIXByws3JJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUEOBRgl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUEOBRgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14468C4CED6;
	Mon,  6 Jan 2025 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736174990;
	bh=hv5pZy+7yQLbAjC2su/ajqsFY/ju6Lj3BN23KsHWCHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUEOBRglfyqj3YsygVL1RdULQ/V4Q3vDdAZrUQwPRRRA60RKC+yMbR0dF1loNSdGM
	 ImDbSs+OGQAz9TrYoSYboG3duGfONjvyvDDHqusfUcJkmb3eqQlDkg/G2gM64dAvS6
	 k7OcoVDxAZh7ydDCkcIbVeLMe6MDMwzfaf/YkzFspX630WrCBFV43artg7d4uR4R9e
	 n7hW0DdaibccVPAh5+71TB/7T1qecbPD5zv7BYGJuih8CnKGm7ghkNa1qD0xaTLaRk
	 b6DKeweUNeCItfTYMOE7A1tivb0vwMcPbV5BAiZbTTul+MM5PH72GHH3pNnfjUg83U
	 b+pZOq6IcMBxQ==
Date: Mon, 6 Jan 2025 15:49:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <20250106-quick-exuberant-jellyfish-cddde2@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nomgha4eilw4izvu"
Content-Disposition: inline
In-Reply-To: <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>


--nomgha4eilw4izvu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
MIME-Version: 1.0

On Mon, Jan 06, 2025 at 02:24:00PM +0200, Dmitry Baryshkov wrote:
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
> > > + * ``drmm_`` allocation), call drm_bridge_init() immediately afterwa=
rds to
> > > + * transfer lifecycle management to the DRM bridge core, and impleme=
nt a
> > > + * ``.destroy`` function to deallocate the ``struct my_bridge``, as =
in this
> > > + * example::
> > > + *
> > > + *     static void my_bridge_destroy(struct drm_bridge *bridge)
> > > + *     {
> > > + *         kfree(container_of(bridge, struct my_bridge, bridge));
> > > + *     }
> > > + *
> > > + *     static const struct drm_bridge_funcs my_bridge_funcs =3D {
> > > + *         .destroy =3D my_bridge_destroy,
> > > + *         ...
> > > + *     };
> > > + *
> > > + *     static int my_bridge_probe(...)
> > > + *     {
> > > + *         struct my_bridge *mybr;
> > > + *         int err;
> > > + *
> > > + *         mybr =3D kzalloc(sizeof(*mybr), GFP_KERNEL);
> > > + *         if (!mybr)
> > > + *             return -ENOMEM;
> > > + *
> > > + *         err =3D drm_bridge_init(dev, &mybr->bridge, &my_bridge_fu=
ncs);
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
> > > + *         struct my_bridge *mybr =3D ...;
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
> >   3) Most bridges structures are allocated through devm_kzalloc, and th=
ey
> >      one that aren't are freed at remove time anyway, so the allocated
> >      structure will be gone when the device is removed.
> >
> >   4) To properly track users, each user that will use a drm_bridge needs
> >      to take a reference.
>=20
> 5) Handle the disappearing next_bridge problem: probe() function gets
> a pointer to the next bridge, but then for some reasons (e.g. because
> of the other device being removed or because of some probe deferral)
> the next_bridge driver gets unbdound and the next_bridge becomes
> unusable before a call to drm_bridge_attach().

Oh, right. We need to plumb it in drm_of_find_bridge somehow too.

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
> >         priv =3D devm_drm_bridge_alloc(dev, struct driver_priv, bridge);
>=20
> Ah... And devm-cleanup will just drop a reference to that data,
> freeing it when all refs are cleaned? Nice idea.

Yup.

> >         if (IS_ERR(priv))
> >            return ERR_PTR(priv);
> >         bridge =3D &priv->bridge;
> >
> >         ...
> >
> >         drm_bridge_add(bridge);
> > }
> >
> > Would work just as well.
> >
> > I also don't think we need explicit (at least for the common case)
> > drm_bridge_get and drm_bridge_put calls for bridge users.
> > drm_bridge_attach and drm_bridge_detach can get/put the reference
> > directly.
>=20
> As I wrote previously, I think drm_bridge_attach() might be too late for =
that.
> It sounds like drm_of_get_panel_or_bridge() and of_drm_find_bridge
> should increment the refcount, possibly adding a devres action to put
> the reference.

We probably need both. drm_bridge_attach adds the bridge pointer to the
encoder bridge_chain list, so if we had something like

bridge =3D drm_of_find_bridge();
drm_bridge_attach(encoder, bridge);
drm_bridge_put(bridge);

We could have a dangling pointer.

Maxime

--nomgha4eilw4izvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3vtiwAKCRAnX84Zoj2+
dpeUAX4r6EM9phLPf0l4sF/WhbNOJ3qT4YgdUwxgVp2TnPBAMKJJarldFgZ+hdfJ
cAdoKigBfiGzn8D3vdC0gVNa9ln6gKzupgvZRmFMRk0PQbp3Gw3wQR9TeCO9AduV
lOcnenoq+Q==
=2QY/
-----END PGP SIGNATURE-----

--nomgha4eilw4izvu--
