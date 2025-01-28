Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9794F9F8;
	Tue, 28 Jan 2025 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738075767; cv=none; b=kUAZtSDDZiGTatmk5gh40w3SDgWmJjzPabA+ruJd/pP/+tjxNaVhIHHWJ3NgfmTgIduaGX5IurfoGXpyGxUGOQl1ynQdGFs2vS7snRrueAtzpr2F9si5PtRQop7tlHn2ua4GDy4cvCPqU+MmrRPGrFQR1lnzaF5b06WejTTolls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738075767; c=relaxed/simple;
	bh=+Ejniyab9jdWy8aG5N2vU/QcshCR48kbmtf/5OBPbRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA+/ZBPUYesBYaMOTRfHYxtoasQfGTKZDImjo1E7aMGaVktzIhqEbVXnkHK1KZP78rOiFIScwwFH9hE4n0LRegIdU0H6gE13DelExzx40Sc8TI1diW/0WHi/C75Dgs/52nywBhLY+t9mrItZ7CS05NGD4lKoLq9skm3mLPoW+eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrB/nTrH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrB/nTrH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63871C4CED3;
	Tue, 28 Jan 2025 14:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738075767;
	bh=+Ejniyab9jdWy8aG5N2vU/QcshCR48kbmtf/5OBPbRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrB/nTrHi+K4b9TUWdn26CTKLM20TG/2lA7NvP5IbBxo/eht1Ruo30tfHwD0x405e
	 g/oY8WfQbGRLbqcoOEbIhvsaEVRBeYi9Cim0aDnDPqpoxBHs7EN7F6xSdXBptNQ+Mb
	 6MG7jUgZpomKN62UxwaqCTu/Lk/zUQuJCG8LYOP6hyYvh0lWNLjgO+IDraU1/viaE5
	 H/S36AZMFoQI3tzLkwY7RwaV5JU1+XWwZtjPLB5UKWxIeMvSNVhms7szLIwuWz3ARm
	 Mo+6H63smH1nv0GRJpZKeIMCkSUkhgE3JS/SAomWic2HFSuGtpi9jPiTFm0sUonfRL
	 4SdPi7ZDtv5oQ==
Date: Tue, 28 Jan 2025 15:49:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
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
Message-ID: <jiwexbvzcrq7hywl5t25cojrgjnyv5q2wnb2kvgriucal6764w@hhrefcftcjza>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250108162429.53316041@booty>
 <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
 <20250122171230.30cf9b97@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="shqls32c37qtoxms"
Content-Disposition: inline
In-Reply-To: <20250122171230.30cf9b97@booty>


--shqls32c37qtoxms
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
MIME-Version: 1.0

Hi,

On Wed, Jan 22, 2025 at 05:12:30PM +0100, Luca Ceresoli wrote:
> On Wed, 8 Jan 2025 17:02:04 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> [...]
>=20
> > > > > And we'll also need some flag in drm_bridge to indicate that the =
device
> > > > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > > > because now your bridge driver sticks around for much longer than=
 your
> > > > > device so the expectation that your device managed resources (clo=
cks,
> > > > > registers, etc.) are always going to be around.   =20
> > >=20
> > > Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> > > drm_bridge.c will need to be sprinkled with them I guess. =20
> >=20
> > The users would be the drivers, most likely. There's not much we can do
> > at the framework level, unfortunately.
>=20
> Back to the idea of a "gone" flag, or perhaps an "unplugged" flag to
> be consistent with the struct drm_device naming, and
> drm_bridge_enter()/drm_bridge_exit(), I did a few experiments and have
> a question.
>=20
> In case:
>=20
>   a) there is a notification callback to inform about bridges
>      being removed, and
>   b) all entities owning a struct drm_bridge pointer stop using
>      that pointer when notified
>=20
>=20
> With the above, there should be no need for
> drm_bridge_enter()/drm_bridge_exit(). Nobody will be using a pointer to
> a bridge that is being removed.
>=20
> Now, about a), patch 1 in this series implements such a mechanism to
> inform all bridges when a bridge is being removed. Note that the
> "unplugged" flag would be set immediately after the notifier callback
> is currently called: "unplugged =3D=3D true" will never happen before the
> callback, and after the callback there will be no pointer at all.
>=20
> Patch 1 however is only notifying bridges, so other entities (e.g.
> encoders) cannot be notified with this implementation. However a
> different notification mechanism can be implemented. E.g. until v3 this
> series was using a generic struct notifier_block for this goal [0], so
> any part of the kernel can be notified.
>=20
> About b), the notification appears simpler to implement in the various
> drivers as it needs to be added in one place per driver. Also adding
> drm_bridge_enter()/exit() can be trickier to get right for non-trivial
> functions.
>=20
> Do you see any drawback in using a notification mechanism instead of
> drm_bridge_enter()/exit() + unplugged flag?

Yeah, because we're not considering the same thing :)

The issue you're talking about is that you want to be notified that the
next bridge has been removed and you shouldn't use the drm_bridge
pointer anymore.

A notification mechanism sounds like a good solution there.

The other issue we have is that now, we will have the drm_bridge pointer
still allocated and valid after its device has been removed.

In which case, you need to be able to tell the bridge driver whose
device got removed that the devm resources aren't there anymore, and it
shouldn't try to access them.

That's what drm_bridge_enter()/exit is here for.

Maxime

--shqls32c37qtoxms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5jucwAKCRAnX84Zoj2+
dr3/AX9yyXr/DcwkCCWNCkD8BOPxtQlcN0Dqx5XTUvqvGVPG/04wKXx7kg4cSput
ssff96ABf0XkC8RsvcERjbdZTGaOxLS1MVQ/4U6WwYMKeIiXM4Wmxg+K+WLH3qEd
cr8ksUj8LA==
=f7xe
-----END PGP SIGNATURE-----

--shqls32c37qtoxms--
