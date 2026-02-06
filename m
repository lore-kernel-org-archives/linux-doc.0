Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA4E21D596;
	Fri,  6 Feb 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387408; cv=none; b=N6BP6g1e9K7PJC1RggjzMalrpuztCUkDrsDyHjDr0QScY7HYtmaVU1CY4FN8Kdc6DZRzB5ClQsxtgn8mmJUs+akUhfe4SMEUxn4HSjsyI5B147r3eoNm2ETYwpfOlZQiqpU8mL8osYWlgf9NTKjczq6ZdIDUB2uXb4Vnd7BhSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387408; c=relaxed/simple;
	bh=MfIveAnEmTvNIhWdwWFVHgbqL0PUK4fowKip9CXPScQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qq60VGiUfZCc1vMn+3vDh+BqJkWZDgaA0XgNU1RdxTbqMeB7K15RtTBEeFd4nUpnGHRwxCsq7B/sys/ZX3yofL/rnyH1m1Wg4HOPQgdFupN0jJNsNJgXM7FO+Y24IF+yqE/pnof60q7iXCfAUUxr57LGzUy41xnAUkXKaa6sWQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqAG13Ki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqAG13Ki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809F7C19422;
	Fri,  6 Feb 2026 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387408;
	bh=MfIveAnEmTvNIhWdwWFVHgbqL0PUK4fowKip9CXPScQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqAG13Ki/PxUK25l81q/gCxQQUhF5YZLzbsMjFAd9AD62JjQ0BP4KF/yQjIX1pCdj
	 GEaQc7Vw3zC0OiUbJZUYWogj3DZDZaY7ZHRZxuuEaT0F20SQkdBr6bqqoAZD6KXEmr
	 Wc6+06DvEl0ohNgz4FIOLKxMElgkIKBq/+RQI/LdpQlO9eZgvYsOPSJ4FML292n3gl
	 LyfPybUivMrshDxho9PbqZN6QpaabH12EvmoeDA0pkcYcKqBkqIB6MT6EeavTbEmVk
	 O3FEK0j8xWWU+OrFhnHZuetsvL99aeJAZPSb2JTanjNSNDGHESoZ35ZcvCaDeZkG6h
	 zZ586z4h/v/lQ==
Date: Fri, 6 Feb 2026 15:16:45 +0100
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
Subject: Re: [PATCH v7 05/22] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <20260206-accurate-wealthy-badger-45b4a8@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-5-ef790dae780c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2cbwiwfic3gmdzk2"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-5-ef790dae780c@collabora.com>


--2cbwiwfic3gmdzk2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 05/22] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

On Wed, Jan 21, 2026 at 03:45:12PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
>=20
> Implement it by checking whether the property is set and set to
> something other than auto. If so, pass the requested color format, and
> otherwise set RGB.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index a1d16762ac7a..1ea3b9c93aa5 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -649,11 +649,21 @@ hdmi_compute_config(const struct drm_connector *con=
nector,
>  	unsigned int max_bpc =3D clamp_t(unsigned int,
>  				       conn_state->max_bpc,
>  				       8, connector->max_bpc);
> +	enum hdmi_colorspace hdmi_colorspace =3D
> +		drm_color_format_to_hdmi_colorspace(conn_state->color_format);
>  	int ret;
> =20
>  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> -				      HDMI_COLORSPACE_RGB);
> +				      hdmi_colorspace);

I still think we shoud be more explicit there, with something like

if (conn_state->color_format !=3D DRM_COLOR_FORMAT_AUTO) {
	return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, drm_c=
olor_format_to_hdmi_colorspace(conn_state->color_format))
}

ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
    			      HDMI_COLORSPACE_RGB);

Otherwise, it's pretty easy to get confused between the behaviour
drm_color_format_to_hdmi_colorspace() to return RGB when it get AUTO...

>  	if (ret) {
> +		/* If a color format was explicitly requested, don't fall back */
> +		if (conn_state->color_format) {

=2E.. or that auto is actually 0 in that enum.

Or between the auto and non-auto code path.

Maxime

--2cbwiwfic3gmdzk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYX3zAAKCRAnX84Zoj2+
drVqAYD2nzrDJAH0F0tKkx6Xcr+H2Zmy7gmPm/i9E/xOmEWV2OyB+eO07FcK6njD
RjLDZpQBgMFQ9IdOGUZJR8znQp3cHRX9Aenj9f8l6mh6cJupKXlHogjQrki2a8Ft
pLSQR3GN1A==
=LCPG
-----END PGP SIGNATURE-----

--2cbwiwfic3gmdzk2--
