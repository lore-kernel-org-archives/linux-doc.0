Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A713A3ED;
	Mon, 16 Mar 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681370; cv=none; b=Z8sQD7wZLqjqePHpbOy/j2K1gpt1r/sXM7YpmXJtVMSmkkAa8WkDUP2mA7Qkty4hGTRb4zWqPcQwsO9qEcplLCQgxD/FZ3UTGqVr6H5wXeQPXfDYSkdQvhiLF4Bco96Z1P5jdnUpPHvNGdKCzso5YccCBP+5Lkq+wV0/RW4wU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681370; c=relaxed/simple;
	bh=6LmWPTZ/Wg2pBGtohG0Ur/9CqBjO5FCLHf+6zdpUR6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKErxlS5puEUSs1mL1zub3GrF0NB1pMK3ZI/Qni/2+wIJ5rtXWP60v8kYD5tiAtsao5QH2SFHFpH8hN8MfCKcnteBMbqMJ3BrzQKAGsX3Q7V9u7M2Y0F28H6feU28jHa9A92h0dqPXazxQluFKNo4e6z4x6de50g1bltSZ8vcDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lV3o+FQK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lV3o+FQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C87C19421;
	Mon, 16 Mar 2026 17:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773681370;
	bh=6LmWPTZ/Wg2pBGtohG0Ur/9CqBjO5FCLHf+6zdpUR6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lV3o+FQKmNNn7HspUM9dsacv+6GjqRIAdGFLZM6/mwsB1VNXctFqXUJSk04vZLgly
	 E9FXbaW1d24eD+MJeX+CR2lGzj4/iNFw6bCt+VoPV3AsWCzGTz3RUH8RQJdpwFiaH4
	 L9eMi/E5vBHU7BqItJA7zmT3v8h/nHIbhF5YUA3ueh02HCSxOdtnsGIGA/h6P+N/Zj
	 QWlpmBNxDUoFd9gcBUsSs/He+4VH8Xei98P/uCpeIQq5OnN+aEAJZHixJTnyL9MZSY
	 3GvgA2sgf496joKi/RTQ1wrMW9lWkYvFnMtF/dw/dxqGnyNxiBlfr4xSKaV7u7YNuH
	 ynUwHLz7cqq9w==
Date: Mon, 16 Mar 2026 18:16:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] drm/atomic: Drop drm_private_state.obj assignment
 from create_state
Message-ID: <20260316-lumpy-jackdaw-of-downpour-10a890@houat>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-2-de7397c8e1cf@kernel.org>
 <20260316154913.GE31616@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="oun657mnxvl2buei"
Content-Disposition: inline
In-Reply-To: <20260316154913.GE31616@killaraus.ideasonboard.com>


--oun657mnxvl2buei
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 02/14] drm/atomic: Drop drm_private_state.obj assignment
 from create_state
MIME-Version: 1.0

Hi Laurent,

Thanks for your review

On Mon, Mar 16, 2026 at 05:49:13PM +0200, Laurent Pinchart wrote:
> On Tue, Mar 10, 2026 at 05:06:54PM +0100, Maxime Ripard wrote:
> > The initial intent of the atomic_create_state helper was to simply
> > allocate a proper drm_private_state and returning it, without any side
> > effect.
> >=20
> > However, the __drm_atomic_helper_private_obj_create_state() introduces a
> > side effect by setting the drm_private_obj.state to the newly allocated
> > state.
> >=20
> > This assignment defeats the purpose, but is also redundant since
> > the only caller, drm_atomic_private_obj_init(), will also set this
> > pointer to the newly allocated state.
>=20
> __drm_atomic_helper_bridge_reset() is called in many places. Most of
> them are .atomic_create_state() handlers, called from
> drm_atomic_private_obj_init() only. The only exception is
> __drm_atomic_helper_bridge_reset().

__drm_atomic_helper_bridge_reset (and any bridge reset implementation)
is also called through atomic_create_state and
drm_atomic_private_obj_init(), so there's nothing special about it.

Maxime

--oun657mnxvl2buei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabg60wAKCRAnX84Zoj2+
dnU4AYCuEyiXgv3cybTH7SWACE5/V+hfw6e2wgFRaG9UpIXSl7/mSglBbkRVOA/v
kT/T7x0Bf3bTigOLUzyCx6DbYn3+Xek8KAsMkBq0mNX5eoDVDR8cPjnVVqphtvff
kp9Uhw3c1Q==
=8w94
-----END PGP SIGNATURE-----

--oun657mnxvl2buei--
