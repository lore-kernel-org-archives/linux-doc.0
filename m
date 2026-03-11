Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9333B27E4;
	Wed, 11 Mar 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215212; cv=none; b=n0PKlt/oQDfgVYifg+M5583yDfamFuxqim8OHXxC0wW31vrSpRLKhiBzCHmXbM5YqSDHxPRyfbvCFPHYWMlX98NK1xSehci/gmXJMYS2NcYbTLQCEynHkcIiX0GUwkqlgJAPG9I3neV7a3YNYaY8jX4jIXPAT24g0gP9b6JEy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215212; c=relaxed/simple;
	bh=8fnZ+0vlGUQHSAPBQ3cPtnOLJECaqexxmyl6U0P3am8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaiDcYmSPA3ABrgghsEInhHvquHaW//0IddOSmKvzsTZ0UiE0AhgPUkpsVWvwew1nrcNbz9c59Q8K/AC3uoS29Wi6qXnXPSnd/cS74n9n8lm5WM2lqS1nGptE4iqcIaU8lKkXNaikUsweq/1vht6ngYikX2mQJMY4I0o3FU2Kig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhcyubLV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhcyubLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED03C4CEF7;
	Wed, 11 Mar 2026 07:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773215211;
	bh=8fnZ+0vlGUQHSAPBQ3cPtnOLJECaqexxmyl6U0P3am8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhcyubLVy14T7d+l9Zv77PMKDfillm2IXF1gCisdnBFOpN/xn1c3N4dr7wML+wkd6
	 Hos9S4CzBHvYgbM+Brs1bBj+Lco4KRG3+nhcjkzRTaJ0Bvtky1FUDuyWRYqJwu9W5p
	 nqUbInRQdyFkKlvWWucJBAi65OSclYSvOHYk7FlL3DJN8CrTMuo+4v9xDc3zS+8+PZ
	 VSjb2JGGVn0eyWm//j5nW3DExwsMx+7EdZ69h9BPiTQEjYydly8qkJ5GkyWuFmu3kK
	 KcVKMTOT4cKKj/VwtdNmt4eczGN9Jtb/oFBI27/7x2ChcPMu9g2n76ZMhV2t3Dovae
	 /Lns7k3tI9Ocg==
Date: Wed, 11 Mar 2026 08:46:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/14] drm/plane: Add new atomic_create_state callback
Message-ID: <20260311-garrulous-jovial-muskox-f8db0d@houat>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-5-de7397c8e1cf@kernel.org>
 <477e022a-d336-4995-a3bc-f12c7d233b0d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mx4kkis2clzlv4m2"
Content-Disposition: inline
In-Reply-To: <477e022a-d336-4995-a3bc-f12c7d233b0d@ideasonboard.com>


--mx4kkis2clzlv4m2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/14] drm/plane: Add new atomic_create_state callback
MIME-Version: 1.0

Hi,

On Wed, Mar 11, 2026 at 09:13:18AM +0200, Tomi Valkeinen wrote:
> On 10/03/2026 18:06, Maxime Ripard wrote:
> > Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> > to drm_private_obj") introduced a new pattern for allocating drm object
> > states.
> >=20
> > Instead of relying on the reset() callback, it created a new
> > atomic_create_state hook. This is helpful because reset is a bit
> > overloaded: it's used to create the initial software tate, reset it, but
> > also reset the hardware.
> >=20
> > It can also be used either at probe time, to create the initial state
> > and possibly reset the hardware to an expected default, but also during
> > suspend/resume.
> >=20
> > Both these cases come with different expectations too: during the
> > initialization, we want to initialize all states, but during
> > suspend/resume, drm_private_states for example are expected to be kept
> > around.
> >=20
> > And reset() isn't fallible, which makes it harder to handle
> > initialization errors properly.
> >=20
> > And this is only really relevant for some drivers, since all the helpers
> > for reset only create a new state, and don't touch the hardware at all.
> >=20
> > It was thus decided to create a new hook that would allocate and
> > initialize a pristine state without any side effect:
> > atomic_create_state to untangle a bit some of it, and to separate the
> > initialization with the actual reset one might need during a
> > suspend/resume.
> >=20
> > Let's continue the transition to the new pattern with planes.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c | 41 +++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/drm_mode_config.c         | 18 ++++++++++++++
> >  include/drm/drm_atomic_state_helper.h     |  4 +++
> >  include/drm/drm_plane.h                   | 13 ++++++++++
> >  4 files changed, 76 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index a1abf4247c348eca21da348c3893dd843b9ed391..898e168eeae1c3899121ffd=
13c79fae7803fcd2a 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -318,10 +318,29 @@ void __drm_atomic_helper_plane_reset(struct drm_p=
lane *plane,
> > =20
> >  	plane->state =3D plane_state;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
> > =20
> > +/**
> > + * __drm_atomic_helper_plane_create_state - initializes plane state
> > + * @plane: plane object
> > + * @state: new state to initialize
> > + *
> > + * Initializes the newly allocated @state, usually required when
> > + * initializing the drivers.
> > + *
> > + * @state is assumed to be zeroed.
> > + *
> > + * This is useful for drivers that subclass @drm_plane_state.
> > + */
> > +void __drm_atomic_helper_plane_create_state(struct drm_plane *plane,
> > +					    struct drm_plane_state *state)
> > +{
> > +	__drm_atomic_helper_plane_reset(plane, state);
> > +}
> > +EXPORT_SYMBOL(__drm_atomic_helper_plane_create_state);
> > +
>=20
> This calls __drm_atomic_helper_plane_reset(), which does "plane->state =3D
> plane_state". From the description I understood this would be without
> side effects. Is that not a side effect? Or should this call
> __drm_atomic_helper_plane_state_reset() instead?

Yeah, this was supposed to be the latter. Thanks!
Maxime

--mx4kkis2clzlv4m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabEd5QAKCRAnX84Zoj2+
dsUYAX9xpMcjJWQ5Em9fCpKl1nrlOjaWH3jykwYayAtHljoCVqUmfstbnX929KhY
d8P9ztQBgIrSWA2GdDAMyRME3wq1GannWOu0EwK9T0UufUiwgPOyPD/+YCXtgshH
tc68vJMdfw==
=ukZG
-----END PGP SIGNATURE-----

--mx4kkis2clzlv4m2--
