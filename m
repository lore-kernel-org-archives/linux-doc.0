Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8983D544;
	Sat,  7 Feb 2026 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770494178; cv=pass; b=LIIS8WRV+h+hJiu3C/OCdtnwoe51aF+poa3UadCxYK4V/4LRNqCHui5qSQdP/krYapTDkA7Vak8OQ8b7hAp6xy8dsbLzqHRekWJx+rxvGPyvpj5zrnlkWXfp1sYMzBXaGbHT+hdCiYls+Vf4+dicSLxqjmHDV7ezPC29Usx47rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770494178; c=relaxed/simple;
	bh=VuUqiTOi/4fs33O+h2a97qFFWmO4dfPwoa1Uxdi/HWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fa3lz2enIk7T+Kk6gNvRoA4MERvucEjcUlWPQyjn4FguQlKxkXiLXVB14Ucf8w4KzYO+oxM95M4YUwpAlXthyxtT+C6GxkaNpRTJiYzCcB19vpARiequrGwKVGWwYuIfN0N1hNJNi27GMCcLD0uTJStw9JDs1mP94Gi/uHECj3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=JOoHFpCT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="JOoHFpCT"
ARC-Seal: i=1; a=rsa-sha256; t=1770494126; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n4LRiWNq2inbtnEDaGm8SCKsvD4xJsBno1k9RblkDTlSnrmM7T5RomJRKcVz7qlnSyX+XB5gcCiOls661iJUhymLCiIjeN72IK/cD66LT++uSRvt9TF4QxH2bTShBFlnNUYSuGKLCa1LHBFEWql+mGQ8ywTO1YKteUSuM+lfRgM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770494126; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NZHbWmG7r3R1HZrqlrB+rsVe8cKm23D2EhBP2uD85pY=; 
	b=m9DHWb9oRABg90RbzT9vh6KvuTKLtEXAdJ57eFkpEklx/nIh1x+etiXzb+qCMEqcWHdvpY5UutZsocwDmANMP8/hjzV1lnd4fUDmlh1VFL4IxUxOPu+KaP97H1aAchVLYfIIro5mWnhNNTodSQSkR2pbpqhpKdc7sWY5fiurS3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770494125;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=NZHbWmG7r3R1HZrqlrB+rsVe8cKm23D2EhBP2uD85pY=;
	b=JOoHFpCTlEuC9nka6aLZlVjLCh9/KJnx6zCh6/QAWYNhunIRZvOINl/ALSVN9LX8
	Px9UDqdcYooOf10d9+OcQv3Ac0mmJYq8fUQjNfcW3fqlPzY0dnoNDyWXSuIfPoagt6z
	YUOgoVGCDfpKWU/mEhmm0pCRW2EXcTPuo8RGvxxs=
Received: by mx.zohomail.com with SMTPS id 177049412353238.2831936561422;
	Sat, 7 Feb 2026 11:55:23 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Marius Vlad <marius.vlad@collabora.com>
Subject:
 Re: [PATCH v7 03/22] drm: Add enum conversions between DRM_COLOR_FORMAT and
 HDMI_COLORSPACE
Date: Sat, 07 Feb 2026 20:55:16 +0100
Message-ID: <2028270.PYKUYFuaPT@workhorse>
In-Reply-To: <20260206-angelic-crimson-bug-aaab40@houat>
References:
 <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-3-ef790dae780c@collabora.com>
 <20260206-angelic-crimson-bug-aaab40@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 6 February 2026 15:08:46 Central European Standard Time Maxime Ripard wrote:
> On Wed, Jan 21, 2026 at 03:45:10PM +0100, Nicolas Frattaroli wrote:
> > While the two enums have similar values, they're not identical, and
> > HDMI's enum is defined as per the HDMI standard.
> > 
> > Add a simple conversion function from DRM to HDMI. Unexpected inputs
> > aren't handled in any clever way, DRM_COLOR_FORMAT_AUTO and any other
> > value that doesn't cleanly map to HDMI just gets returned as
> > HDMI_COLORSPACE_RGB.
> > 
> > Add a second conversion function that gets a DRM_COLOR_FORMAT from an
> > HDMI_COLORSPACE as well. In this case, reserved HDMI values that can't
> > be converted will result in an -EINVAL return value.
> > 
> > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  include/drm/drm_connector.h | 54 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> > 
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index b5604dca728a..ffeb42f3b4a3 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -2612,6 +2612,60 @@ int drm_connector_attach_color_format_property(struct drm_connector *connector);
> >  
> >  const char *drm_get_color_format_name(enum drm_color_format color_fmt);
> >  
> > +/**
> > + * drm_color_format_to_hdmi_colorspace - convert DRM color format to HDMI
> > + * @fmt: the &enum drm_color_format to convert
> > + *
> > + * Convert a given &enum drm_color_format to an equivalent
> > + * &enum hdmi_colorspace. For non-representable values and
> > + * %DRM_COLOR_FORMAT_AUTO, the value %HDMI_COLORSPACE_RGB is returned.
> > + *
> > + * Returns: the corresponding &enum hdmi_colorspace value
> > + */
> > +static inline enum hdmi_colorspace __pure
> > +drm_color_format_to_hdmi_colorspace(enum drm_color_format fmt)
> > +{
> > +	switch (fmt) {
> > +	default:
> > +	case DRM_COLOR_FORMAT_AUTO:
> > +	case DRM_COLOR_FORMAT_RGB444:
> > +		return HDMI_COLORSPACE_RGB;
> 
> I don't think that's correct. What auto ends up as totally depends on
> the atomic state it comes with.
> 
> At the very least, you should output a warning there, because that case
> should never happen.

Yeah, my hope was to keep this function __pure so that the compiler
has maximum freedom to do whatever. With a WARN, it's got side-effects
now, and we're no longer pure. With a status return value and an output
parameter, it's no longer pure either, because the output parameter is
not local memory.

The limiting factor here is that as I understand correctly, I can't
really extend the hdmi_colorspace enum, as it's basically 1:1 from
the standard. Doing this would be the ideal solution, because we'd
keep the function pure and without surprise conversions happening.

Looking at hdmi_colorspace_get_name in drivers/video/hdmi.c, it returns
"Invalid" for any value not in the enum itself. Would it be allowable
to tack an HDMI_COLORSPACE_INVALID at the end of the enum with perhaps
a negative value, or is there a different approach you'd prefer?

I agree that the AUTO-to-RGB conversion shouldn't happen here, that's
a recipe for things implicitly relying on this behaviour, which isn't
great. (And I think I even do this in "hdmi-state-helper: Act on color
format DRM property", where thinking about it again I agree this isn't
super obvious and should be done explicitly instead.)

> > +	case DRM_COLOR_FORMAT_YCBCR444:
> > +		return HDMI_COLORSPACE_YUV444;
> > +	case DRM_COLOR_FORMAT_YCBCR422:
> > +		return HDMI_COLORSPACE_YUV422;
> > +	case DRM_COLOR_FORMAT_YCBCR420:
> > +		return HDMI_COLORSPACE_YUV420;
> > +	}
> > +}
> > +
> > +/**
> > + * drm_color_format_from_hdmi_colorspace - convert HDMI color format to DRM
> > + * @fmt: the &enum hdmi_colorspace to convert
> > + *
> > + * Convert a given &enum hdmi_colorspace to an equivalent
> > + * &enum drm_color_format. For non-representable values,
> > + * %-EINVAL is returned.
> > + *
> > + * Returns: the corresponding &enum drm_color_format value, or %-EINVAL
> > + */
> > +static inline enum drm_color_format __pure
> > +drm_color_format_from_hdmi_colorspace(enum hdmi_colorspace fmt)
> > +{
> > +	switch (fmt) {
> > +	default:
> > +		return -EINVAL;
> 
> Wait, what?
> 
> -EINVAL is not a valid value for your enum.

Not the only part of the kernel where we rely on the int-ness of
enums, but your complaint has been noted :) I guess this means
this approach won't fly for the opposite direction. Thankfully,
in this direction, we can extend the drm_color_format enum to
have an error value.

Kind regards,
Nicolas Frattaroli

> 
> Maxime
> 




