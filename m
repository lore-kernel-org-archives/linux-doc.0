Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973EAC48BE5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 08:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B99B86144E
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 08:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhFQIWx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 04:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhFQIWw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 04:22:52 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D81C061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 01:20:43 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id p7so8987465lfg.4
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 01:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=jgo6J2SBrHBhQENwEXMEreYNwgNFuwQjq+RqFaUrE8w=;
        b=LWCshauwp7B3AmI0T9VuBBgVOF0vOhh7zVI2s00clSiFc6mU/L2ScptQD/NG8SdiPD
         s0ZCwN6QQyrjfL4hkU6K77DVrJbTnDpVnmm4ehTpj3ec3ZUoah0ER0SFkPPTfGL6dtFS
         WrDuagLNEzHFbtPkf1a6RATWdq0hPrZi9N6CsGNesUxPuAOVUdhEnain2cw1iSenag3L
         pm5tuYpDWyhNIYfbhvgAWU3u202qjHJWMT+Qa9vzkdOQbCshb0B6Hvp0TPinmoc9GJJQ
         A7vrfTSw07Lk2B25kz6H3YNjqDjx388KWq9T80ZfZ7t6N3ZhA+51koY7fohsvsaB1bXK
         cJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=jgo6J2SBrHBhQENwEXMEreYNwgNFuwQjq+RqFaUrE8w=;
        b=T5nYiJA2oYE7epplDi0pW/xm5JBjL6TiXFee6eC+G3/7+Q5Hem0MBtay4yrRQw3z4m
         SIwsZ4PlrpA5v/EdvkpAni5PBxv4W+HaAHZ2788pYAlyeFY5JSBSC93afy+fmEzglsid
         ybHQ3brbrMbQGHmqjZPkor4LM28jZdTerRwqjjhn9FYU3zwMy+XAlbT2lcULlrWwKQJY
         fMv2OdOOKeudv2Suy7kaqI50D0CbPgzj7VIRPsYkh+lTHCpok53H2yOTZZeoLu1XxK+B
         k+fRN3wPl/y8lAReUgvyCQE9ByLR/X2jh64LZDzzH5leVjF7mbIkkv4KoRqbXNKt9XiZ
         /sfw==
X-Gm-Message-State: AOAM533u7tHtYUIvs2Zj3iBK6+qjc6CbyYxZZmCLWiCMosMXGfxx9UmH
        n5lr9zeSnIyMSboKqOYJh1c=
X-Google-Smtp-Source: ABdhPJxd4m0CHlmyX4LzvPFI/OB/2b4IBvrQmF5alJGuDE4wS+1O1M4miceuqwKkdkTlJblSbAbGFg==
X-Received: by 2002:a19:7711:: with SMTP id s17mr3188500lfc.430.1623918041920;
        Thu, 17 Jun 2021 01:20:41 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id y24sm581255ljk.79.2021.06.17.01.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 01:20:41 -0700 (PDT)
Date:   Thu, 17 Jun 2021 11:20:36 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-doc@vger.kernel.org, Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Steven Price <steven.price@arm.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Chen Feng <puck.chen@hisilicon.com>,
        Alison Wang <alison.wang@nxp.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Russell King <linux@armlinux.org.uk>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH v4] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210617112036.7373fdab@eldfell>
In-Reply-To: <20210616143842.632829-1-maxime@cerno.tech>
References: <20210616143842.632829-1-maxime@cerno.tech>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TOEUb_8y9EUP7W_Bs0va22D"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/TOEUb_8y9EUP7W_Bs0va22D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Jun 2021 16:38:42 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> New KMS properties come with a bunch of requirements to avoid each
> driver from running their own, inconsistent, set of properties,
> eventually leading to issues like property conflicts, inconsistencies
> between drivers and semantics, etc.
>=20
> Let's document what we expect.
>=20
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alison Wang <alison.wang@nxp.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Edmund Dea <edmund.j.dea@intel.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> ---
>=20
> Changes from v3:
>   - Roll back to the v2
>   - Add Simon and Pekka in Cc
>=20
> Changes from v2:
>   - Take into account the feedback from Laurent and Lidiu to no longer
>     force generic properties, but prefix vendor-specific properties with
>     the vendor name
>=20
> Changes from v1:
>   - Typos and wording reported by Daniel and Alex
> ---
>  Documentation/gpu/drm-kms.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 87e5023e3f55..c28b464dd397 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -463,6 +463,25 @@ KMS Properties
>  This section of the documentation is primarily aimed at user-space devel=
opers.
>  For the driver APIs, see the other sections.
> =20
> +Requirements
> +------------
> +
> +KMS drivers might need to add extra properties to support new features.
> +Each new property introduced in a driver need to meet a few
> +requirements, in addition to the one mentioned above.:
> +
> +- It must be standardized, with some documentation to describe how the
> +  property can be used.

Hi,

I might replace "some" with "full" documentation. Also not only how it
can be used but also what it does.

FYI, some common things that tend to be forgotten IME:
- Spell out exactly the name string for the property in the
  documentation so that it is unambiguous what string userspace should
  look for.
- The same for string names of enum values.
- Explicitly document what each enum value means, do not trust that the
  value name describes it well enough.
- Explain how the property interacts with other, existing properties.

Not sure if these should be written down here or anywhere though.
Interaction with other properties is kind of important.

> +
> +- It must provide a generic helper in the core code to register that
> +  property on the object it attaches to.
> +
> +- Its content must be decoded by the core and provided in the object's
> +  associated state structure. That includes anything drivers might want =
to
> +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for pl=
anes.
> +
> +- An IGT test must be submitted where reasonable.

Would it be too much to replace "where reasonable" with "if it is at
all possible to write a test."?

> +

How about adding the following somewhere?

- The initial state of the property (set during driver initialization)
  must match how the driver+hardware behaved before introducing this
  property. It may be some fixed value or it may be inherited from e.g.
  the firmware that booted the system. How the initial state is
  determined must also be documented, that is, where does it come from.

The initial state must not be called "default", because I want to
reserve the term default for something else if possible: the phrase
"reset everything to defaults", which is a whole another discussion.

How about also saying that fbcon/fbdev must set this property when
taking over? That sounds to be like a common omission leading to funky
KMS state in fbcon. The value fbdev sets it to only needs to make
sense to fbdev, and it does not need to be ~~the initial value~~ nor the
default value. Or are we hoping to kill fbcon in favor of a userspace
kmscon soon? ;-)

Ooh, maybe the KMS property documentation should also say what value
fbdev will set the property to. That's kind of UABI, because userspace
probably implicitly relies on it in many cases. ...which means fbdev
should set the property to its initial value, otherwise userspace will
break.


Thanks,
pq

--Sig_/TOEUb_8y9EUP7W_Bs0va22D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDLBdQACgkQI1/ltBGq
qqc2gA//TPUvfpqj0olVFxH3SsY1dSaOlBtYQTvYnOUuUgVQ4O1x1DHbXJMI6isT
ZYkDcTLdq7thOdJBJVtvCKdgxJzN93luqqvCLh8ZPmWEcyGMazKG3XjcURDezS1h
20BGf51GNsLSEmNugKBBT2FG3469+pJUvudEY41s6jRLYvg21hkLrRBbQ3GjiwuD
c8KMQIrwORE++2olOtWwTsMvJo+dMw/DvjaDWr2+uBc7FXmx8c6YvgD0gdFdKUro
DYogPs3jkG9MWveaxsEU5EzLF2OvzJHpvcKdGRQDI4PAUSiJ6nsJO5Pll9kZDLoc
wOxA6wyiaL5fF8kzjcMprh3VCwkjXnVEkN5xfe+BtdYQkmyOFw6A92yoEDhKKe8G
uO5a/ooyrXmsAzFvTTJB07Ag4t6EdQvN99T0Iz6D3W/DyBNL8sg/lyo6Hjm9wNbd
56BKiz9JneJeoDE+8+Pn4W2gxqAKuKF/ypuE+X25YyaFS7xerDVkLAeeZzf2gPEA
FiFRlbNkmppR+T1QnX32QbuDmcGhNJpDEw1/ntxrI5npb9gl2ozj4gAmCZfQrBbU
Qk339zr3dNcBzsMDOSfmV7WfcsFbTubTs5wHr61ZtML9YFpZKBk6Hw+lR/HLVMtm
Cnxx/iGOCCznjTghZ6YTjZ5fut7VeA1KJfcBd1rnsHVJBph4kjk=
=1y2U
-----END PGP SIGNATURE-----

--Sig_/TOEUb_8y9EUP7W_Bs0va22D--
