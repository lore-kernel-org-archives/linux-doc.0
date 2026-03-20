Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C367632470F;
	Fri, 20 Mar 2026 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992381; cv=none; b=DL2jAhTNwFUuGIOL0bOF1kTpIH+i5WGADQx9TldRRD9l2AKkZjV/picTyNneAWI4HaTp2g/NACbZH5jHSTtjVReTs1JwfczVAmbhlQhKORdVVfbxXYZpFc4DcR86Bt19bcGRWgBQFcuo5Aui+LY2xBviU/Z1rElneRpSoJJmTFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992381; c=relaxed/simple;
	bh=n1ojk/knpzJCwWCCkSbtt8pMtBwEak2zvKb/7ad2iqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGk7U593Z6Xvs5KXP+Ty3I7v2X4J6UhTBO4LkOnWK81vNOdk+xlva9WHZ/woHGph7S9ZkVLlb2h/Jk2x5IjLuluUDl1biMXdly1N84Gr0sSqzervl7qD6902+7aBOzE4lXRSMT4Iwpb1uCkjB1jWhXe66J9rwWnQHx2BTdS4mZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqWIeU72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqWIeU72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF05C4CEF7;
	Fri, 20 Mar 2026 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773992381;
	bh=n1ojk/knpzJCwWCCkSbtt8pMtBwEak2zvKb/7ad2iqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tqWIeU72FcOkqHnypzWpQnac6ys1fMihxvS5dqV2RPxnwCpOAiHKlajazbRBzPznH
	 jAKS+0yYiT//uJfOBawT9Nb1YgL8vCXE6SlI08jQLPmGfTqwDjw4Li1mxWe26PE+K4
	 M7nurEswZnjekfhp+YrDcgJwitpgRDZ6JW3NuolNuilo3ZSFPrc1lZ014VJ6F6x+lp
	 4CNGpol2rJMZAUMwaKBdJjmq0mku2TXruEIZW19yikelwJ/BpByLgWBPmyKXVPf/xv
	 wkSJ/4SEL31dqNZt/9q+DeNTS4MxU2TrHiKwiUhatSkZ2xhRegzs0Dq0YeyWG0J9A3
	 kP6zf9VYScj/A==
Date: Fri, 20 Mar 2026 08:39:32 +0100
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
Subject: Re: [PATCH 09/14] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <20260320-competent-voracious-wapiti-0c5afd@houat>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-9-de7397c8e1cf@kernel.org>
 <20260316163354.GN31604@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="v3xz3evb7ocxp25y"
Content-Disposition: inline
In-Reply-To: <20260316163354.GN31604@killaraus.ideasonboard.com>


--v3xz3evb7ocxp25y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 09/14] drm/drv: Call drm_mode_config_create_state() by
 default
MIME-Version: 1.0

On Mon, Mar 16, 2026 at 06:33:54PM +0200, Laurent Pinchart wrote:
> On Tue, Mar 10, 2026 at 05:07:01PM +0100, Maxime Ripard wrote:
> > Almost all drivers, and our documented skeleton, call
> > drm_mode_config_reset() prior to calling drm_dev_register() to
> > initialize its DRM object states.
> >=20
> > Now that we have drm_mode_config_create_state() to create that initial
> > state if it doesn't exist, we can call it directly in
> > drm_dev_register(). That way, we know that the initial atomic state will
> > always be allocated without any boilerplate.
>=20
> Should most drivers now stop calling drm_mode_config_reset() at probe
> time ?

Yes, that's my intention. For the vast majority of them, reset is just
about allocating and committing a blank state anyway.

However, for the drivers that do need to reset the hardware, we should
keep the door open (and / or provide an alternative mechanism).

Maxime

--v3xz3evb7ocxp25y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabz5rAAKCRAnX84Zoj2+
dlZ+AYCXhYUlSHS3aPweeg6UAszhTRFM61WUjtxJqCkgQRcuQ5SSzc0Ibn0cq0zK
EZbMNcQBgNQvMBgYrqRHUCNC4Fny7NDb8Shi7gQHVBUCzJne0gtY8jRdd/DWQ+IN
GYxAXRJafA==
=S1NW
-----END PGP SIGNATURE-----

--v3xz3evb7ocxp25y--
