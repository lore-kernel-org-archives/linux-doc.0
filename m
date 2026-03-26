Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD2374759
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523795; cv=pass; b=SCFInGtNR7CP8IBRlsfNCbeFwTbHX6lWUFQNuhKl5P2Iy41cxENI5EhA4MSqppmtRy/0pXr42AgTHyjHWjZmewhHa5jbONah5cypcVNLU0qFDjBbqtGeIHnGtRRmKKW+yy2Fw30QbZJefcyYZaLGgIfuMzl1ZtgNWMb80puUv2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523795; c=relaxed/simple;
	bh=xL9Gzl7sHv+ZZAeItNzDHC+Ukig+Shwc2jo5HB/C+mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVedG7x+xX9JWVtpu/TPQ6XFDt1cgN4c5EMHgrdt9XWhPz5QMRkjXSN/SSGDVyPpfw17IO85cRvgDfAoOx8aPMWl2aBryAXFS3Odk0opt6NXeDOH9BKim4eU8uqAc8fJ+wL05FdHOkzhRqAChfT4i0ghujw3jV4gvN8VCn9ncZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=BcBmo7R5; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BcBmo7R5"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a76ba6a78so6428701fa.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 04:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774523790; cv=none;
        d=google.com; s=arc-20240605;
        b=lG1HTJXDLmoPeV08RT1/lLwU6IcE90+BkkDDI61JiE1zlZll30wJuzI/UrTBr4JVu0
         ol8zDiyILTwXNIJELoQuvwXtc1RKipkrVdQ0U75swL8L3vnZ07OYgOXQwhCMZGXKEDCn
         FWPuodRQ344RmtjzvxkE2m7AyZNE6JLwGfK4VS0/WldoCwNKDlhC2X9ngEhatRj9uDhU
         YDT7aG3XscJRMHlkReeS6v1bT9ErHS0qqYwWAdVZwRYBjrIi7mp0kfKCStpcxOgZXG/f
         F8o1o5uUWQPz8EIUM5UqOBJPVIuykcsEAopbUmPBOUcZz+noBEgpE1PphmDi+Ptkq2Bg
         OFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6rf/HnBT4sVRvVngZaBiBN8W+WY+3EMKSNCjcGGlMVE=;
        fh=gzIyHmo1BOg6ktFBL4pLOPKTk1NLSxfLZqpIQnFZ/Us=;
        b=fN9kx/WAk4CV2nkiIa2lvbH2KfadnxVVyOgnpBNsqPm+PoY1VC9eO69Pah9h+LieLT
         ofcsmmhN/9pv+NY7HebScl6fU+T3br5RmzTbaLnP6BrZqWSw7IuGZmbOIJCXt65hrDCN
         AP2EQjrrQovfZWK5328MTlN7z+XHUflsNEouN8WOEl9F/ky2xwBi4KvJER8pUtGziE+/
         YJmTuc2oEJK3vfNWDGiLppKyX3ksJz93/pVufgOVggYEOJb4ZE6tJiL9bLa0tCUndnLC
         xHlSexyTomB/kMqFW1eCXt0as7nq5smlvyuppvHi8locScMXLpLfujOIauoyNfsAM60u
         inYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774523790; x=1775128590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rf/HnBT4sVRvVngZaBiBN8W+WY+3EMKSNCjcGGlMVE=;
        b=BcBmo7R57if3tmtK/KPBry0gGoTLeTlUU8WMm7kDG8MfR+/neNzOxDqg9dktKCOsnu
         +ph7bYnSNvANhs+i5szUOHW18xraNGOudiTk13UTAYKt4C4I1tNiH2bjl2znuFPkT2G9
         Mrok7NG48er0xFYfG1hJTwvA9GUZMP0Q3Xlfb3KuG1G2+ZJEGByHeFIlH2VjLvh60pqD
         XhtoF4JJC93QcdGKnKp/OiFtPt+I9JL2ylWSZ4EPPMSDEhTgzGDxfek30+ZT57o6kc4y
         rrvBd6R6omfeG5fWJMw3FkrlsLg1IBR97zlt0T0M2VkHj6E2pl+tRKunwe7+V/Oowwzp
         yrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523790; x=1775128590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6rf/HnBT4sVRvVngZaBiBN8W+WY+3EMKSNCjcGGlMVE=;
        b=OcFsBV05Vl+/ThJU3ulHTna3789FEFPdpUjSvX0yKHEU9MN6kviBG59vY9oerTEV9/
         JRwQb7LbluBpMMfwxjXBbxjKLq7euy7E3h43wt8ifPlQ+OAsjrWFzCaueSfhQTwiwN2s
         5SYlWyBdQMMCHfhjNaazzhJJ3GtX98ixmIlAyV5pAEc8aMLs/ui4XEpBPhAaep1S77kl
         AYUTZqw3ZXZ4tB1dVJI8oh5CaJXFHXb0v6S6rpVutWnCh8DNPkXnmQPf+vWnnkVxY1uL
         d6kXrcmPRvuTmYXjm0+8c+MVWNROE+m3GFcZcCWLhxOBU5VZQgIV4c33Wwu8tDN4JIq1
         NhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCToIbxwgKoeKMI/by245Ps87ieyIvROhz5SNanIFrSHqG5saHwj+r/4qnTpYd+YtBxCks4dGcmZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEDoN9Sq98NeU3iIgCUWWCRM82z+5pENyGCfvccu1wvBO/iJVf
	M9oNz2NxijB7b4tSrINM7KGOwOyFSDlaVzZNjO8xpWAVXhoZUdO+4iNjt2o78Y6dphq7pjH6XBX
	INmzWJoP5p7AdfCaBD5qwvcX/OlRu/KQeeGNWSQ5AoA==
X-Gm-Gg: ATEYQzyNjLz1yK/YqA3Qux9wEj4pXxZkBlDK2PI4n1eLExWfZUvjuSegwTGtK0Cjyb3
	+HtXG6Yzly7gYVT9znUyCr9NGLGl60Hv3FT0npHv6OBz1v4mwhghwwet+UWj7aNqS/yCZuAUzcK
	FqaAhm3UuB9xTao0KkN7BocJ95ytvupKW5BmnxywG95Hm7nuL3hEfqUI6JLYVcj22p0cYipYLKd
	xRgKt6wLZDk6n5ri3Xyut7SRMvZFejTPLWymcn1bdINoDEABnnuvMaax5d9HjCCm3JX7ZuTFgbx
	PPAiKe/mDdJoE9VrRZ+9d7ZiAY1R3VHmrjRcGkU=
X-Received: by 2002:a05:6512:b8b:b0:5a1:2fa5:b98f with SMTP id
 2adb3069b0e04-5a29b9959c1mr3477197e87.26.1774523790279; Thu, 26 Mar 2026
 04:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com> <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
 <acPmcMbUvzWMzC-Q@intel.com>
In-Reply-To: <acPmcMbUvzWMzC-Q@intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 26 Mar 2026 11:16:12 +0000
X-Gm-Features: AQROBzDGajsKgoOGqGR1Gk-yLiqzdDdCXpeNLW8nQJu3ooxAvN__EfhXfmKn6Bk
Message-ID: <CAPY8ntCRPgN_ayHMGXFv9OrJrdyakUcUT0rvgY5J=FvdCFb6eA@mail.gmail.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Mar 2026 at 13:43, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Mar 25, 2026 at 12:49:19PM +0000, Dave Stevenson wrote:
> > On Tue, 24 Mar 2026 at 16:02, Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > Add a new general DRM property named "color format" which can be used=
 by
> > > userspace to request the display driver to output a particular color
> > > format.
> > >
> > > Possible options are:
> > >     - auto (setup by default, driver internally picks the color forma=
t)
> > >     - rgb
> > >     - ycbcr444
> > >     - ycbcr422
> > >     - ycbcr420
> > >
> > > Drivers should advertise from this list which formats they support.
> > > Together with this list and EDID data from the sink we should be able
> > > to relay a list of usable color formats to users to pick from.
> > >
> > > Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Co-developed-by: Andri Yngvason <andri@yngvason.is>
> > > Signed-off-by: Andri Yngvason <andri@yngvason.is>
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
> > >  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
> > >  drivers/gpu/drm/drm_connector.c     | 108 ++++++++++++++++++++++++++=
++++++++++
> > >  include/drm/drm_connector.h         | 104 ++++++++++++++++++++++++++=
++++++++
> > >  4 files changed, 228 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> > > index 26953ed6b53e..b7753454b777 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -737,6 +737,11 @@ drm_atomic_helper_check_modeset(struct drm_devic=
e *dev,
> > >                         if (old_connector_state->max_requested_bpc !=
=3D
> > >                             new_connector_state->max_requested_bpc)
> > >                                 new_crtc_state->connectors_changed =
=3D true;
> > > +
> > > +                       if (old_connector_state->color_format !=3D
> > > +                           new_connector_state->color_format)
> > > +                               new_crtc_state->connectors_changed =
=3D true;
> > > +
> > >                 }
> > >
> > >                 if (funcs->atomic_check)
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> > > index 5bd5bf6661df..dee510c85e59 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -935,6 +935,15 @@ static int drm_atomic_connector_set_property(str=
uct drm_connector *connector,
> > >                 state->privacy_screen_sw_state =3D val;
> > >         } else if (property =3D=3D connector->broadcast_rgb_property)=
 {
> > >                 state->hdmi.broadcast_rgb =3D val;
> > > +       } else if (property =3D=3D connector->color_format_property) =
{
> > > +               if (val > INT_MAX || !drm_connector_color_format_vali=
d(val)) {
> > > +                       drm_dbg_atomic(connector->dev,
> > > +                                      "[CONNECTOR:%d:%s] unknown col=
or format %llu\n",
> > > +                                      connector->base.id, connector-=
>name, val);
> > > +                       return -EINVAL;
> > > +               }
> > > +
> > > +               state->color_format =3D val;
> > >         } else if (connector->funcs->atomic_set_property) {
> > >                 return connector->funcs->atomic_set_property(connecto=
r,
> > >                                 state, property, val);
> > > @@ -1020,6 +1029,8 @@ drm_atomic_connector_get_property(struct drm_co=
nnector *connector,
> > >                 *val =3D state->privacy_screen_sw_state;
> > >         } else if (property =3D=3D connector->broadcast_rgb_property)=
 {
> > >                 *val =3D state->hdmi.broadcast_rgb;
> > > +       } else if (property =3D=3D connector->color_format_property) =
{
> > > +               *val =3D state->color_format;
> > >         } else if (connector->funcs->atomic_get_property) {
> > >                 return connector->funcs->atomic_get_property(connecto=
r,
> > >                                 state, property, val);
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 47dc53c4a738..e848374dee0b 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -1388,6 +1388,18 @@ static const u32 hdmi_colorspaces =3D
> > >         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> > >         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
> > >
> > > +static const u32 hdmi_colorformats =3D
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> > > +
> > > +static const u32 dp_colorformats =3D
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> > > +
> > >  /*
> > >   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding=
/Colorimetry
> > >   * Format Table 2-120
> > > @@ -2940,6 +2952,102 @@ int drm_connector_attach_colorspace_property(=
struct drm_connector *connector)
> > >  }
> > >  EXPORT_SYMBOL(drm_connector_attach_colorspace_property);
> > >
> > > +/**
> > > + * drm_connector_attach_color_format_property - create and attach co=
lor format property
> > > + * @connector: connector to create the color format property on
> > > + * @supported_color_formats: bitmask of bit-shifted &enum drm_output=
_color_format
> > > + *                           values the connector supports
> > > + *
> > > + * Called by a driver to create a color format property. The propert=
y is
> > > + * attached to the connector automatically on success.
> > > + *
> > > + * @supported_color_formats should only include color formats the co=
nnector
> > > + * type can actually support.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative errno on error
> > > + */
> > > +int drm_connector_attach_color_format_property(struct drm_connector =
*connector,
> > > +                                              unsigned long supporte=
d_color_formats)
> > > +{
> > > +       struct drm_device *dev =3D connector->dev;
> > > +       struct drm_prop_enum_list enum_list[DRM_CONNECTOR_COLOR_FORMA=
T_COUNT];
> > > +       unsigned int i =3D 0;
> > > +       unsigned long fmt;
> > > +
> > > +       if (connector->color_format_property)
> > > +               return 0;
> > > +
> > > +       if (!supported_color_formats) {
> > > +               drm_err(dev, "No supported color formats provided on =
[CONNECTOR:%d:%s]\n",
> > > +                       connector->base.id, connector->name);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       if (supported_color_formats & ~GENMASK(DRM_OUTPUT_COLOR_FORMA=
T_COUNT - 1, 0)) {
> > > +               drm_err(dev, "Unknown color formats provided on [CONN=
ECTOR:%d:%s]\n",
> > > +                       connector->base.id, connector->name);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       switch (connector->connector_type) {
> > > +       case DRM_MODE_CONNECTOR_HDMIA:
> > > +       case DRM_MODE_CONNECTOR_HDMIB:
> > > +               if (supported_color_formats & ~hdmi_colorformats) {
> > > +                       drm_err(dev, "Color formats not allowed for H=
DMI on [CONNECTOR:%d:%s]\n",
> > > +                               connector->base.id, connector->name);
> > > +                       return -EINVAL;
> > > +               }
> > > +               break;
> > > +       case DRM_MODE_CONNECTOR_DisplayPort:
> > > +       case DRM_MODE_CONNECTOR_eDP:
> > > +               if (supported_color_formats & ~dp_colorformats) {
> > > +                       drm_err(dev, "Color formats not allowed for D=
P on [CONNECTOR:%d:%s]\n",
> > > +                               connector->base.id, connector->name);
> > > +                       return -EINVAL;
> > > +               }
> > > +               break;
> > > +       }
> > > +
> > > +       enum_list[0].name =3D "AUTO";
> > > +       enum_list[0].type =3D DRM_CONNECTOR_COLOR_FORMAT_AUTO;
> > > +
> > > +       for_each_set_bit(fmt, &supported_color_formats, DRM_OUTPUT_CO=
LOR_FORMAT_COUNT) {
> > > +               switch (fmt) {
> > > +               case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COLOR_F=
ORMAT_RGB444;
> > > +                       break;
> > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COLOR_F=
ORMAT_YCBCR444;
> > > +                       break;
> > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COLOR_F=
ORMAT_YCBCR422;
> > > +                       break;
> > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COLOR_F=
ORMAT_YCBCR420;
> > > +                       break;
> > > +               default:
> > > +                       drm_warn(dev, "Unknown supported format %ld o=
n [CONNECTOR:%d:%s]\n",
> > > +                                fmt, connector->base.id, connector->=
name);
> > > +                       continue;
> > > +               }
> > > +               enum_list[i].name =3D drm_hdmi_connector_get_output_f=
ormat_name(fmt);
> > > +       }
> > > +
> > > +       connector->color_format_property =3D
> > > +               drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "co=
lor format",
> > > +                                        enum_list, i + 1);
> > > +
> > > +       if (!connector->color_format_property)
> > > +               return -ENOMEM;
> > > +
> > > +       drm_object_attach_property(&connector->base, connector->color=
_format_property,
> > > +                                  DRM_CONNECTOR_COLOR_FORMAT_AUTO);
> > > +
> > > +       return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_connector_attach_color_format_property);
> > > +
> > >  /**
> > >   * drm_connector_atomic_hdr_metadata_equal - checks if the hdr metad=
ata changed
> > >   * @old_state: old connector state to compare
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.=
h
> > > index af8b92d2d5b7..bd549f912b76 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -571,14 +571,102 @@ enum drm_colorspace {
> > >   *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
> > >   * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > >   *   YCbCr 4:2:0 output format (ie. with horizontal and vertical sub=
sampling)
> > > + * @DRM_OUTPUT_COLOR_FORMAT_COUNT:
> > > + *   Number of valid output color format values in this enum
> > >   */
> > >  enum drm_output_color_format {
> > >         DRM_OUTPUT_COLOR_FORMAT_RGB444 =3D 0,
> > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
> > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
> > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> > > +       DRM_OUTPUT_COLOR_FORMAT_COUNT,
> > >  };
> > >
> > > +/**
> > > + * enum drm_connector_color_format - Connector Color Format Request
> > > + *
> > > + * This enum, unlike &enum drm_output_color_format, is used to speci=
fy requests
> > > + * for a specific color format on a connector through the DRM "color=
 format"
> > > + * property. The difference is that it has an "AUTO" value to specif=
y that
> > > + * no specific choice has been made.
> > > + */
> > > +enum drm_connector_color_format {
> > > +       /**
> > > +        * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display pr=
otocol
> > > +        * helpers should pick a suitable color format. All implement=
ations of a
> > > +        * specific display protocol must behave the same way with "A=
UTO", but
> > > +        * different display protocols do not necessarily have the sa=
me "AUTO"
> > > +        * semantics.
> > > +        *
> > > +        * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 =
if the
> > > +        * bandwidth required for full-scale RGB is not available, or=
 the mode
> > > +        * is YCbCr 4:2:0-only, as long as the mode and output both s=
upport
> > > +        * YCbCr 4:2:0.
> >
> > Is there a reason you propose dropping back to YCbCr 4:2:0 without
> > trying YCbCr 4:2:2 first? Minimising the subsampling is surely
> > beneficial, and vc4 for one can do 4:2:2 but not 4:2:0.
>
> On HDMI 4:2:2 is always 12bpc, so it doesn't save any bandwidth
> compared to 8bpc 4:4:4.

It does save bandwidth against 10 or 12bpc RGB 4:4:4.

Or is the implication that max_bpc =3D 12 and
DRM_CONNECTOR_COLOR_FORMAT_AUTO should drop bpc down to 8 and select
RGB in preference to selecting 4:2:2?

  Dave

> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
