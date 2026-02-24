Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059EF23AB87;
	Tue, 24 Feb 2026 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944067; cv=none; b=NFMUAoJh0NEq3y4nRCg7YKkS35k4KhjlWMOk9767PtfhZAO7oq6mKOu+EvTononvv7y3Ax+lNqIzX9RV5S/KID33YsHaUzp2KHL7kJ4PuwncPfYS0gkMbztryCo6TyyVrYlsmiejm87+INk6nR7Im7uubkEyu1DEsx7VgvNR/Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944067; c=relaxed/simple;
	bh=dCGqyI+rHlM3XyQ2QUXSu5nZVqUPyjQmE2WK/m+d8es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5lrI8a047W5XdVRh6p5pvqKyhge00qotm4+tnqi3q3fdq9JzLHvcVkY+brdPo6m5WCFiMh24VvsadHbSCWoUONs3y036CXRFHrT6WXHjR5JFfy56e6X7gHrCJ7pi6n02GWiJBxNIyfPmhCRZdqlIQ3HU3lk/FLP7AjstHDEmX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gA+g57Qa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gA+g57Qa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125EFC116D0;
	Tue, 24 Feb 2026 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771944066;
	bh=dCGqyI+rHlM3XyQ2QUXSu5nZVqUPyjQmE2WK/m+d8es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gA+g57QadLSgYtZf5xm7d+YH2vzWtEJsVtb2Yjxr294TnnPP+klHUGgRSnbPFMw4x
	 vN4u/6wEExddpZypJjzNjT69Biz0S7GhYqq6J0L/D89mD25k39ddaOwSfiHZFcORpB
	 MHAPLNeeqHAbnixkSvJidVV++YvN2rxpS7uIXzEFvqc3bY9BP8iOs2FUowmNn8CRfI
	 s/uC/D5eHcKGqEVAipY4dqrtOP1JEAMVx/Cvtg+rY5lZdhIuEVymyUaO3aPbTphh/1
	 0Aa45VuNgSw1tFOaTKc4DSFTJ5elMVbaSEJ5PHaSLECpTUgsK5Gs42ik0H0ntIdmDW
	 VG5P3hlMYHljA==
Date: Tue, 24 Feb 2026 15:41:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 05/20] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <20260224-hot-adaptable-sawfish-dd0f7a@houat>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
 <20260216-color-format-v8-5-5722ce175dd5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5cwb2y5kukdqwgqq"
Content-Disposition: inline
In-Reply-To: <20260216-color-format-v8-5-5722ce175dd5@collabora.com>


--5cwb2y5kukdqwgqq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 05/20] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

On Mon, Feb 16, 2026 at 02:01:19PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
>=20
> Implement it by translating the requested drm_color_format_enum to an
> hdmi_colorspace enum value. Auto is translated to RGB, and a fallback to
> YUV420 is only performed if the original color format was auto.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++=
++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index a1d16762ac7a..3ba752200984 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -649,10 +649,34 @@ hdmi_compute_config(const struct drm_connector *con=
nector,
>  	unsigned int max_bpc =3D clamp_t(unsigned int,
>  				       conn_state->max_bpc,
>  				       8, connector->max_bpc);
> +	enum hdmi_colorspace fmt;
>  	int ret;
> =20
> -	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> -				      HDMI_COLORSPACE_RGB);
> +	switch (conn_state->color_format) {
> +	case DRM_COLOR_FORMAT_ENUM_AUTO:
> +	case DRM_COLOR_FORMAT_ENUM_RGB444:
> +		fmt =3D HDMI_COLORSPACE_RGB;
> +		break;
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR444:
> +		fmt =3D HDMI_COLORSPACE_YUV444;
> +		break;
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR422:
> +		fmt =3D HDMI_COLORSPACE_YUV422;
> +		break;
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR420:
> +		fmt =3D HDMI_COLORSPACE_YUV420;
> +		break;
> +	default:
> +		drm_dbg_kms(connector->dev, "HDMI does not support color format '%s'.\=
n",
> +			    drm_get_color_format_name(conn_state->color_format));
> +		return -EINVAL;
> +	}
> +
> +	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, f=
mt);
> +
> +	if (conn_state->color_format !=3D DRM_COLOR_FORMAT_ENUM_AUTO)
> +		return ret;
> +

This should also be greatly simplified since you don't need to deal with
hdmi_colorspace anymore, and thus you'll just be able to use the
construct I hinted at in the previous version.

Maxime

--5cwb2y5kukdqwgqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ24fwAKCRAnX84Zoj2+
dh+wAXwKmT5KayIifDoxyitEKWs6EiYUCC2SA4Bg4ruLTVA9Xs//EiWw+hYVo/kQ
7bFTr10BgODaA1IvjwBbTyIPz0upLTeNeVbfqL/ghdTyMm5jaRR3hNM7V9lXYvtY
SsWWbJGYdQ==
=YUqC
-----END PGP SIGNATURE-----

--5cwb2y5kukdqwgqq--
