Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207F32ED57;
	Fri,  6 Feb 2026 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770386929; cv=none; b=UnAJrkbwjMeIwzXcrNXGaGfcTLCk1bFAgKStOs3sKdbjb4TqPGrVvVyA9SgjezxzwdkCtCveYUImJo4/Yy7DLqnE6ugsAJE4bXui8V6PWvcP8c7ApR274HDFNLuJYwod32KIjFvbvZYwp0QXEvN8BtcZmfpVXieYYrKjZvb8qFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770386929; c=relaxed/simple;
	bh=+lIi82NYDZHy3722msFtnCnh1tdb9jn2hqegryuZsv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY43sIehQJ9joQu0OMAZjLJtseQ0g+7Iz0+5eKdOYDJan+28/Ccn39mX7bIV7ahA8j2/igviMykB90LyVJkYNb0vfIjjLwt1OR1IbySmLhZID++VFc9rEuiUPoexjmfFHv54D1DXjAMO3DHnpeRj0mp/tTmiZ0MSjg5XbEnDDTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4RMr14q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4RMr14q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831ACC19421;
	Fri,  6 Feb 2026 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770386929;
	bh=+lIi82NYDZHy3722msFtnCnh1tdb9jn2hqegryuZsv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4RMr14qRzstPqItXkr/5OrxYDpSQG71tOjhHOic63cYTk2SvrNErOgO5dHJfp3e+
	 w7mK5YUkXGNJsdh25Qt6kj+8LUHS80HPi0P5lONF4st4Nco+/Sofu1DKJuGM4rIyVK
	 ++miMRAzAaKZ+aYUde9ZK/SSUFkNgF7GDYMJGbJidLXVGRq/X/9SvV68gm3Mm1OolL
	 UQxfwaFyVy1yBltxH4sPXnnMsuuaLmfTlQtUHylW1jIt+1zqA6J+LKbJolNgvTMPSR
	 kCEyA7JrZKZFYDLSIcn+HvgY63cZPo4nIIpoFQ/M8EaON7rZbm/BPoEFaso2y0rDs2
	 OB1otDCYh9zwQ==
Date: Fri, 6 Feb 2026 15:08:46 +0100
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
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
Message-ID: <20260206-angelic-crimson-bug-aaab40@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-3-ef790dae780c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7kyo6gozxaybulie"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-3-ef790dae780c@collabora.com>


--7kyo6gozxaybulie
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
MIME-Version: 1.0

On Wed, Jan 21, 2026 at 03:45:10PM +0100, Nicolas Frattaroli wrote:
> While the two enums have similar values, they're not identical, and
> HDMI's enum is defined as per the HDMI standard.
>=20
> Add a simple conversion function from DRM to HDMI. Unexpected inputs
> aren't handled in any clever way, DRM_COLOR_FORMAT_AUTO and any other
> value that doesn't cleanly map to HDMI just gets returned as
> HDMI_COLORSPACE_RGB.
>=20
> Add a second conversion function that gets a DRM_COLOR_FORMAT from an
> HDMI_COLORSPACE as well. In this case, reserved HDMI values that can't
> be converted will result in an -EINVAL return value.
>=20
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  include/drm/drm_connector.h | 54 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 54 insertions(+)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b5604dca728a..ffeb42f3b4a3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2612,6 +2612,60 @@ int drm_connector_attach_color_format_property(str=
uct drm_connector *connector);
> =20
>  const char *drm_get_color_format_name(enum drm_color_format color_fmt);
> =20
> +/**
> + * drm_color_format_to_hdmi_colorspace - convert DRM color format to HDMI
> + * @fmt: the &enum drm_color_format to convert
> + *
> + * Convert a given &enum drm_color_format to an equivalent
> + * &enum hdmi_colorspace. For non-representable values and
> + * %DRM_COLOR_FORMAT_AUTO, the value %HDMI_COLORSPACE_RGB is returned.
> + *
> + * Returns: the corresponding &enum hdmi_colorspace value
> + */
> +static inline enum hdmi_colorspace __pure
> +drm_color_format_to_hdmi_colorspace(enum drm_color_format fmt)
> +{
> +	switch (fmt) {
> +	default:
> +	case DRM_COLOR_FORMAT_AUTO:
> +	case DRM_COLOR_FORMAT_RGB444:
> +		return HDMI_COLORSPACE_RGB;

I don't think that's correct. What auto ends up as totally depends on
the atomic state it comes with.

At the very least, you should output a warning there, because that case
should never happen.

> +	case DRM_COLOR_FORMAT_YCBCR444:
> +		return HDMI_COLORSPACE_YUV444;
> +	case DRM_COLOR_FORMAT_YCBCR422:
> +		return HDMI_COLORSPACE_YUV422;
> +	case DRM_COLOR_FORMAT_YCBCR420:
> +		return HDMI_COLORSPACE_YUV420;
> +	}
> +}
> +
> +/**
> + * drm_color_format_from_hdmi_colorspace - convert HDMI color format to =
DRM
> + * @fmt: the &enum hdmi_colorspace to convert
> + *
> + * Convert a given &enum hdmi_colorspace to an equivalent
> + * &enum drm_color_format. For non-representable values,
> + * %-EINVAL is returned.
> + *
> + * Returns: the corresponding &enum drm_color_format value, or %-EINVAL
> + */
> +static inline enum drm_color_format __pure
> +drm_color_format_from_hdmi_colorspace(enum hdmi_colorspace fmt)
> +{
> +	switch (fmt) {
> +	default:
> +		return -EINVAL;

Wait, what?

-EINVAL is not a valid value for your enum.

Maxime

--7kyo6gozxaybulie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYX17QAKCRAnX84Zoj2+
dhqKAX9uCw/1iLG+7nCh7iWCwrhqxfm0JVwIRRQh/zjRf8Wet9GKZ9b66ZGwYC8M
tXJZuowBgKH3e2XNrltRlENhX1pPWeDhYlezTP12g5E34y5OGMYep2YcNBUO0/Ck
6YOwGJvwTQ==
=PPqS
-----END PGP SIGNATURE-----

--7kyo6gozxaybulie--
