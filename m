Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1866E2690C0
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532365; cv=pass; b=Z6feU/lEJuDpi9ZCzuEuc5y3qTnk1AH36TDgDA4HCD57U+O6DJGVbNHxU4gMcSYfU/QYTL5rxQb8avzZVj+raXek1TyKyLrawu4K8iJDrTmVLRgKlRuXvluJ4eMTLmBWJbqAtfAIXCSatxO88n1bHMgZTDq9vZcm5d+9IF+vG+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532365; c=relaxed/simple;
	bh=lDThtI5tHDw806UdHpQ7Q2LmZNKcyLvERAtOXI9vGWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YfEkjBs5NFCK0brvwKbwWqTeDhJJ4M/e0JcXzng8+B1FZYlILKg8Mhny/AJpiJptNFCdKI0u6P2eUlVigSs23bfe2Xg1xuy2OnpoPeS1+43efGVcLFgq/nCYv91BcNw/i3am2ag994YHAqn7U9XZ6unnrBSgVAGjWJ5FL5UdN7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HQ51rL31; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HQ51rL31"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7982c3b7dfcso10070177b3.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 06:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774532362; cv=none;
        d=google.com; s=arc-20240605;
        b=QPQM697lbrONZOdD52IagoW9gAA22kr1S/95ljnHudlCz45U5RQs2OPW565sYr2NuV
         x2LrkoWcTn1fzr76J1jqFkYo2D4cutwwt4kSzdOzDxosCfwcGfowHgc4I+zC5ufBx2l4
         WmAuT0nSXHwLOMuqH2UFWd/zOCymojazeD33XGu08XGnngItTBD4ZOzjIxghbQTvDpYL
         Du0qWtGxcJhzHDN1/dOBQatuSEJV9cy4R0gM8iXQlPpSnq/sJDuh4fOdERgiMx6C6Xi/
         v8FswabQPpoylLZsKbduTGdFOGCHrTZZrZSd1FgUx5R0AstrHOQTqhjl7NK/LsgncoWP
         s/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IWnlq3YY7P2VGUr2BUkZ+fGGbSx856WYxcxWvnN8cGU=;
        fh=uf8pmn0ZQGcjaO8HLd49uisHfGDG4pVfcqDFo6DWi6A=;
        b=R0mc8Kbm+DThwv/2BvsSLDW02SY9D2amez+cF/LNostPwQrFNyXFDHayDqapD+q8Tu
         v19m4JKDYoN4c0nISV3jlMQOQZj2rWFAA06ZFOCVgu2NhVY/LDarcfNhhbYpjOXCq3uK
         QoBNTM1sd6kTTT+sh9nal+w/uUKbN/PtSYdHR4CzKRIJf9ji+5ewOqAnU6HlFartJH4F
         Hr7cVxPImNzKKgXZ2kHe0092ndDQnClJHJyn9/gnfPofQpjVdfzwNMFE++PAmrc8LIOi
         5hYJuoAJjOArl4547BtxBH1bdbGAwnkf6/Ar8gu8ZwwK9mzFtcJrVDGvB10cKxvMWPVj
         avMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774532362; x=1775137162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWnlq3YY7P2VGUr2BUkZ+fGGbSx856WYxcxWvnN8cGU=;
        b=HQ51rL315N8ktews4OJeY18ouhlXWwgrMB4si9uL7/rkgTDOH512J7qITgsw9fEFjq
         0inDdOU/Af3QPcCoix3C5SWdLgW51i2i2UUsOSa8Lse7HR3IZcwBTuVzcXSZAJgOeaD9
         qr7Z75zCwFbMMxHsdQOg7pxWCQPWxF+HDWYzeUysq2JTG2fWNgLEaeoDLRwp4s16yYqu
         z45ZdFt4ouaOm7mzhHU2iAP4AqWJV6F66OObKj6OInivUohd2TC8zcns6pr4yrBGU9XG
         qT6yVYfawWf+cLTQ/MFTnzC79DjcfRjchDeeSR7kkxdmK1iFGvS7GopCiwwJEAggoN4B
         wslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532362; x=1775137162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWnlq3YY7P2VGUr2BUkZ+fGGbSx856WYxcxWvnN8cGU=;
        b=Oq9rwM9PjyJKxwta+w9GPSlZaVpuphZd9vFzlo7I3TwpijSL5VotYPantB/R/gX2wE
         95yNdfx7TMCQ3LhRDALs0nE8tBHYqpnOGeQQCc+kilg3kZYhtFG+hRgPi55+GcfvsrWH
         iqCQhPhoX0kdTp66kAVNrVrMdGyfd8d8/jDJZgiOAyCaOkfHiFe/G8Xmbd5w8+JuTl4T
         +gWqN0CvpDL5SJmVyzE7s5nPO4NkYfsacJzPU+ktkZhmMAzfNsdWd2ZZf/AKy+ex/s6u
         Zm4bOCMKOhho1ZYqWEspieGKzv01vIeYMeG5eFA7UjAr4Ld+iec93JVRma4Dh5n90NFc
         BcWA==
X-Forwarded-Encrypted: i=1; AJvYcCVYosYATmxD+zW6XyLKauuv+50ELcTp/wCgIHxzMTypgxHhHCL/zbxhx5KfXjTwcSMvQKx7MpmuxaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynebkOjKt960cKIqqsOBLjRnIY0vjEhl1HYrNRBLPfMH8l7FLM
	d7eaPbWkgAJjGA23xPNQU+CMv5izvRRYkNwNr5Xf+yru0ka4GmV3VgN2gJ4lNXx4SkZTwRHtL42
	bnPxCULnm7xEU1uAMpvkB2xC6wiemR3+/paH3x6k9gw==
X-Gm-Gg: ATEYQzxjvy6FdeMLWoFL2dbunX3nDIDih2B3zXo2AnLlFmbnGF5Wq51opi4y4t3jlbc
	pjfx14iN9W0XhSDvNWlAhTgmDh6jPKkIqhBiNcytsV0Yt4s4ymQOK7ikKMowhWkr7GpFjitUi6V
	ec/bn4ZeFin1HoEEm3geRumb9hAH+X80KsttexYNhM004Uo6q7vrR5cPFR4GPRPXxuZqpx875CY
	GE7nyjkUW338zuFYV1Rz/M3v9cUj7KKxlRNHxBAYpG4N3uw2txp13DBszGGZrBs0e97cX4Q5ZGY
	G/JC5kf0H4DLz7hPv+y+D6rn1VbYyzdife/LSQo=
X-Received: by 2002:a05:690c:6086:b0:799:1d0a:aca8 with SMTP id
 00721157ae682-79acf391fcamr83445117b3.19.1774532361939; Thu, 26 Mar 2026
 06:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com> <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
 <acPmcMbUvzWMzC-Q@intel.com> <CAPY8ntCRPgN_ayHMGXFv9OrJrdyakUcUT0rvgY5J=FvdCFb6eA@mail.gmail.com>
 <acUi6NEPJ0p48a3U@intel.com>
In-Reply-To: <acUi6NEPJ0p48a3U@intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 26 Mar 2026 13:39:04 +0000
X-Gm-Features: AQROBzC-fzB7pltEtFba3kfrVDmyhycx0P3xOtZmVXy7A1SvRy2ZJPGwTUQXf-A
Message-ID: <CAPY8ntDZ30NWmYaptMQzOuXPoi8wzEObzAL=oqhxuq8jSvv2mQ@mail.gmail.com>
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

On Thu, 26 Mar 2026 at 12:13, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Mar 26, 2026 at 11:16:12AM +0000, Dave Stevenson wrote:
> > On Wed, 25 Mar 2026 at 13:43, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Wed, Mar 25, 2026 at 12:49:19PM +0000, Dave Stevenson wrote:
> > > > On Tue, 24 Mar 2026 at 16:02, Nicolas Frattaroli
> > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > >
> > > > > Add a new general DRM property named "color format" which can be =
used by
> > > > > userspace to request the display driver to output a particular co=
lor
> > > > > format.
> > > > >
> > > > > Possible options are:
> > > > >     - auto (setup by default, driver internally picks the color f=
ormat)
> > > > >     - rgb
> > > > >     - ycbcr444
> > > > >     - ycbcr422
> > > > >     - ycbcr420
> > > > >
> > > > > Drivers should advertise from this list which formats they suppor=
t.
> > > > > Together with this list and EDID data from the sink we should be =
able
> > > > > to relay a list of usable color formats to users to pick from.
> > > > >
> > > > > Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> > > > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > > > Co-developed-by: Andri Yngvason <andri@yngvason.is>
> > > > > Signed-off-by: Andri Yngvason <andri@yngvason.is>
> > > > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.c=
om>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
> > > > >  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
> > > > >  drivers/gpu/drm/drm_connector.c     | 108 ++++++++++++++++++++++=
++++++++++++++
> > > > >  include/drm/drm_connector.h         | 104 ++++++++++++++++++++++=
++++++++++++
> > > > >  4 files changed, 228 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/dr=
m/drm_atomic_helper.c
> > > > > index 26953ed6b53e..b7753454b777 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > @@ -737,6 +737,11 @@ drm_atomic_helper_check_modeset(struct drm_d=
evice *dev,
> > > > >                         if (old_connector_state->max_requested_bp=
c !=3D
> > > > >                             new_connector_state->max_requested_bp=
c)
> > > > >                                 new_crtc_state->connectors_change=
d =3D true;
> > > > > +
> > > > > +                       if (old_connector_state->color_format !=
=3D
> > > > > +                           new_connector_state->color_format)
> > > > > +                               new_crtc_state->connectors_change=
d =3D true;
> > > > > +
> > > > >                 }
> > > > >
> > > > >                 if (funcs->atomic_check)
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/=
drm_atomic_uapi.c
> > > > > index 5bd5bf6661df..dee510c85e59 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > @@ -935,6 +935,15 @@ static int drm_atomic_connector_set_property=
(struct drm_connector *connector,
> > > > >                 state->privacy_screen_sw_state =3D val;
> > > > >         } else if (property =3D=3D connector->broadcast_rgb_prope=
rty) {
> > > > >                 state->hdmi.broadcast_rgb =3D val;
> > > > > +       } else if (property =3D=3D connector->color_format_proper=
ty) {
> > > > > +               if (val > INT_MAX || !drm_connector_color_format_=
valid(val)) {
> > > > > +                       drm_dbg_atomic(connector->dev,
> > > > > +                                      "[CONNECTOR:%d:%s] unknown=
 color format %llu\n",
> > > > > +                                      connector->base.id, connec=
tor->name, val);
> > > > > +                       return -EINVAL;
> > > > > +               }
> > > > > +
> > > > > +               state->color_format =3D val;
> > > > >         } else if (connector->funcs->atomic_set_property) {
> > > > >                 return connector->funcs->atomic_set_property(conn=
ector,
> > > > >                                 state, property, val);
> > > > > @@ -1020,6 +1029,8 @@ drm_atomic_connector_get_property(struct dr=
m_connector *connector,
> > > > >                 *val =3D state->privacy_screen_sw_state;
> > > > >         } else if (property =3D=3D connector->broadcast_rgb_prope=
rty) {
> > > > >                 *val =3D state->hdmi.broadcast_rgb;
> > > > > +       } else if (property =3D=3D connector->color_format_proper=
ty) {
> > > > > +               *val =3D state->color_format;
> > > > >         } else if (connector->funcs->atomic_get_property) {
> > > > >                 return connector->funcs->atomic_get_property(conn=
ector,
> > > > >                                 state, property, val);
> > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/dr=
m_connector.c
> > > > > index 47dc53c4a738..e848374dee0b 100644
> > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > @@ -1388,6 +1388,18 @@ static const u32 hdmi_colorspaces =3D
> > > > >         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> > > > >         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
> > > > >
> > > > > +static const u32 hdmi_colorformats =3D
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> > > > > +
> > > > > +static const u32 dp_colorformats =3D
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> > > > > +
> > > > >  /*
> > > > >   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Enco=
ding/Colorimetry
> > > > >   * Format Table 2-120
> > > > > @@ -2940,6 +2952,102 @@ int drm_connector_attach_colorspace_prope=
rty(struct drm_connector *connector)
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_connector_attach_colorspace_property);
> > > > >
> > > > > +/**
> > > > > + * drm_connector_attach_color_format_property - create and attac=
h color format property
> > > > > + * @connector: connector to create the color format property on
> > > > > + * @supported_color_formats: bitmask of bit-shifted &enum drm_ou=
tput_color_format
> > > > > + *                           values the connector supports
> > > > > + *
> > > > > + * Called by a driver to create a color format property. The pro=
perty is
> > > > > + * attached to the connector automatically on success.
> > > > > + *
> > > > > + * @supported_color_formats should only include color formats th=
e connector
> > > > > + * type can actually support.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative errno on error
> > > > > + */
> > > > > +int drm_connector_attach_color_format_property(struct drm_connec=
tor *connector,
> > > > > +                                              unsigned long supp=
orted_color_formats)
> > > > > +{
> > > > > +       struct drm_device *dev =3D connector->dev;
> > > > > +       struct drm_prop_enum_list enum_list[DRM_CONNECTOR_COLOR_F=
ORMAT_COUNT];
> > > > > +       unsigned int i =3D 0;
> > > > > +       unsigned long fmt;
> > > > > +
> > > > > +       if (connector->color_format_property)
> > > > > +               return 0;
> > > > > +
> > > > > +       if (!supported_color_formats) {
> > > > > +               drm_err(dev, "No supported color formats provided=
 on [CONNECTOR:%d:%s]\n",
> > > > > +                       connector->base.id, connector->name);
> > > > > +               return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       if (supported_color_formats & ~GENMASK(DRM_OUTPUT_COLOR_F=
ORMAT_COUNT - 1, 0)) {
> > > > > +               drm_err(dev, "Unknown color formats provided on [=
CONNECTOR:%d:%s]\n",
> > > > > +                       connector->base.id, connector->name);
> > > > > +               return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       switch (connector->connector_type) {
> > > > > +       case DRM_MODE_CONNECTOR_HDMIA:
> > > > > +       case DRM_MODE_CONNECTOR_HDMIB:
> > > > > +               if (supported_color_formats & ~hdmi_colorformats)=
 {
> > > > > +                       drm_err(dev, "Color formats not allowed f=
or HDMI on [CONNECTOR:%d:%s]\n",
> > > > > +                               connector->base.id, connector->na=
me);
> > > > > +                       return -EINVAL;
> > > > > +               }
> > > > > +               break;
> > > > > +       case DRM_MODE_CONNECTOR_DisplayPort:
> > > > > +       case DRM_MODE_CONNECTOR_eDP:
> > > > > +               if (supported_color_formats & ~dp_colorformats) {
> > > > > +                       drm_err(dev, "Color formats not allowed f=
or DP on [CONNECTOR:%d:%s]\n",
> > > > > +                               connector->base.id, connector->na=
me);
> > > > > +                       return -EINVAL;
> > > > > +               }
> > > > > +               break;
> > > > > +       }
> > > > > +
> > > > > +       enum_list[0].name =3D "AUTO";
> > > > > +       enum_list[0].type =3D DRM_CONNECTOR_COLOR_FORMAT_AUTO;
> > > > > +
> > > > > +       for_each_set_bit(fmt, &supported_color_formats, DRM_OUTPU=
T_COLOR_FORMAT_COUNT) {
> > > > > +               switch (fmt) {
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_RGB444;
> > > > > +                       break;
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_YCBCR444;
> > > > > +                       break;
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_YCBCR422;
> > > > > +                       break;
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_YCBCR420;
> > > > > +                       break;
> > > > > +               default:
> > > > > +                       drm_warn(dev, "Unknown supported format %=
ld on [CONNECTOR:%d:%s]\n",
> > > > > +                                fmt, connector->base.id, connect=
or->name);
> > > > > +                       continue;
> > > > > +               }
> > > > > +               enum_list[i].name =3D drm_hdmi_connector_get_outp=
ut_format_name(fmt);
> > > > > +       }
> > > > > +
> > > > > +       connector->color_format_property =3D
> > > > > +               drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,=
 "color format",
> > > > > +                                        enum_list, i + 1);
> > > > > +
> > > > > +       if (!connector->color_format_property)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       drm_object_attach_property(&connector->base, connector->c=
olor_format_property,
> > > > > +                                  DRM_CONNECTOR_COLOR_FORMAT_AUT=
O);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_connector_attach_color_format_property);
> > > > > +
> > > > >  /**
> > > > >   * drm_connector_atomic_hdr_metadata_equal - checks if the hdr m=
etadata changed
> > > > >   * @old_state: old connector state to compare
> > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connec=
tor.h
> > > > > index af8b92d2d5b7..bd549f912b76 100644
> > > > > --- a/include/drm/drm_connector.h
> > > > > +++ b/include/drm/drm_connector.h
> > > > > @@ -571,14 +571,102 @@ enum drm_colorspace {
> > > > >   *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
> > > > >   * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > > > >   *   YCbCr 4:2:0 output format (ie. with horizontal and vertical=
 subsampling)
> > > > > + * @DRM_OUTPUT_COLOR_FORMAT_COUNT:
> > > > > + *   Number of valid output color format values in this enum
> > > > >   */
> > > > >  enum drm_output_color_format {
> > > > >         DRM_OUTPUT_COLOR_FORMAT_RGB444 =3D 0,
> > > > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
> > > > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
> > > > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> > > > > +       DRM_OUTPUT_COLOR_FORMAT_COUNT,
> > > > >  };
> > > > >
> > > > > +/**
> > > > > + * enum drm_connector_color_format - Connector Color Format Requ=
est
> > > > > + *
> > > > > + * This enum, unlike &enum drm_output_color_format, is used to s=
pecify requests
> > > > > + * for a specific color format on a connector through the DRM "c=
olor format"
> > > > > + * property. The difference is that it has an "AUTO" value to sp=
ecify that
> > > > > + * no specific choice has been made.
> > > > > + */
> > > > > +enum drm_connector_color_format {
> > > > > +       /**
> > > > > +        * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or displa=
y protocol
> > > > > +        * helpers should pick a suitable color format. All imple=
mentations of a
> > > > > +        * specific display protocol must behave the same way wit=
h "AUTO", but
> > > > > +        * different display protocols do not necessarily have th=
e same "AUTO"
> > > > > +        * semantics.
> > > > > +        *
> > > > > +        * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:=
2:0 if the
> > > > > +        * bandwidth required for full-scale RGB is not available=
, or the mode
> > > > > +        * is YCbCr 4:2:0-only, as long as the mode and output bo=
th support
> > > > > +        * YCbCr 4:2:0.
> > > >
> > > > Is there a reason you propose dropping back to YCbCr 4:2:0 without
> > > > trying YCbCr 4:2:2 first? Minimising the subsampling is surely
> > > > beneficial, and vc4 for one can do 4:2:2 but not 4:2:0.
> > >
> > > On HDMI 4:2:2 is always 12bpc, so it doesn't save any bandwidth
> > > compared to 8bpc 4:4:4.
> >
> > It does save bandwidth against 10 or 12bpc RGB 4:4:4.
> >
> > Or is the implication that max_bpc =3D 12 and
> > DRM_CONNECTOR_COLOR_FORMAT_AUTO should drop bpc down to 8 and select
> > RGB in preference to selecting 4:2:2?
>
> Yeah, YCbCr has all kinds of extra complications compared to RGB, so
> the policy is to use RGB if possible, and only fall back to YCbCr as a
> last resort. And in that case 4:2:0 is the only thing that can help.

So a media player wanting to do 12bpc HDR playback at 4k60 over HDMI
2.0 ends up with 8bpc RGB regardless. That sucks.
I guess at least an override is being added so userspace can take control.

I'd missed that vc4 had its behaviour changed with the
drm_hdmi_state_helper update :-(

  Dave
