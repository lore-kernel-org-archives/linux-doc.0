Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36486C07E99
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 09:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 115AE613D9
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 09:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhGIJLF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jul 2021 05:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhGIJLF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jul 2021 05:11:05 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DC8C0613DD
        for <linux-doc@vger.kernel.org>; Fri,  9 Jul 2021 02:08:21 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u18so12227273lfl.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Jul 2021 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=Ck6Fp21HaZ8Fw8Aq/aLZNLIJN6RtrQulV7xZ67HEXy4=;
        b=OJ7TOZpELL+rZYvA6XHTcYqwN6Xhj/XULq/Ii0Xby+izM+toALMls2ehA4PoLIyUMT
         CGY8aBRJhUWNJjZtuMIVDabRAyOPbfEFTnMS3ETcuveT2RFmz8ZtthwpyN4kHLiBDTW6
         k352WxdE61FTDnu6qL2DViQdIaiPBd/W73yqBxQlJWG2HfyyaqflTNdJ2DxfiTHxeQcN
         5ugN5mnZCc2F7ZnDoahY6lFJlNZdPPVL//7L5NSvCDKpj/XqxCcsMhWJbitgikcxScwj
         Mh7LTf3DGQj2SgyymtO+Kv/Y4ezNz3f9cGt/sRo6SrX1QCvwUJZ7PJf3Q+pimTlHxtRP
         jgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=Ck6Fp21HaZ8Fw8Aq/aLZNLIJN6RtrQulV7xZ67HEXy4=;
        b=LWKaFB2EfUxl/KpMhDCgI4WGe4oRAGEYblV6fngECwIq1f9c0ofH2R9D+gAYegFE3B
         atScEZC8gXtOoGoty7mB5Ag5sOzjFxn18vJxrAj5zA2bS+YF3UZ7aPPod3l1CfeWzdK0
         0/KfGWSecNC+KJfWcxfXjihWyooEMndjx69+Z9GxA/Os24C2maSAbM/CH81tL+ytGsG5
         Q2p+2ScGNOzoLakIPyXtWHqzZmubdpzYJYB9fZ4G4Hgi8CYdOrVrsOxLVPMxuXAEjBUD
         EB/VIAHkz9flJs/Tt0uy7+L14qa+3rhbiAEkbwnQ3ypEXmKVqiivebU/a/BpFSp+E6wb
         EDPQ==
X-Gm-Message-State: AOAM530b5zQ5jO3HqQ+7AOnky2n0+vewPlgjJwIEtl5JjGEWpDztzSQ4
        GcjMUb3NW6jn9fbZoBamfXA=
X-Google-Smtp-Source: ABdhPJzntzCC+/jClAg2JO0r0WzPoCDvDnWr6pcXTrMuEfl/T6M9wytrWxUlXMZrdrKdk/12Q6jd+g==
X-Received: by 2002:a05:6512:3458:: with SMTP id j24mr28032218lfr.366.1625821699464;
        Fri, 09 Jul 2021 02:08:19 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id j18sm493129lji.68.2021.07.09.02.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:08:18 -0700 (PDT)
Date:   Fri, 9 Jul 2021 12:08:14 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
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
        Chen-Yu Tsai <wens@csie.org>,
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
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Robert Foss <robert.foss@linaro.org>,
        Qiang Yu <yuq825@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH v5] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210709120814.48a90aa1@eldfell>
In-Reply-To: <YOgClII3UwckkPkb@phenom.ffwll.local>
References: <20210706161244.1038592-1-maxime@cerno.tech>
        <20210709102444.7a72a029@eldfell>
        <YOgClII3UwckkPkb@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m7jNGNA+=hMPjR5L.MzAv2S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/m7jNGNA+=hMPjR5L.MzAv2S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jul 2021 10:02:28 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Jul 09, 2021 at 10:24:44AM +0300, Pekka Paalanen wrote:
> > On Tue,  6 Jul 2021 18:12:44 +0200
> > Maxime Ripard <maxime@cerno.tech> wrote:
> >  =20
> > > New KMS properties come with a bunch of requirements to avoid each
> > > driver from running their own, inconsistent, set of properties,
> > > eventually leading to issues like property conflicts, inconsistencies
> > > between drivers and semantics, etc.
> > >=20
> > > Let's document what we expect. =20
> >=20
> > ...
> >  =20
> > > Changes from v4:
> > >   - Changes suggested by Pekka
> > >=20
> > > Changes from v3:
> > >   - Roll back to the v2
> > >   - Add Simon and Pekka in Cc
> > >=20
> > > Changes from v2:
> > >   - Take into account the feedback from Laurent and Lidiu to no longer
> > >     force generic properties, but prefix vendor-specific properties w=
ith
> > >     the vendor name
> > >=20
> > > Changes from v1:
> > >   - Typos and wording reported by Daniel and Alex
> > > ---
> > >  Documentation/gpu/drm-kms.rst | 30 ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >=20
> > > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-km=
s.rst
> > > index 87e5023e3f55..47994890fd1e 100644
> > > --- a/Documentation/gpu/drm-kms.rst
> > > +++ b/Documentation/gpu/drm-kms.rst
> > > @@ -463,6 +463,36 @@ KMS Properties
> > >  This section of the documentation is primarily aimed at user-space d=
evelopers.
> > >  For the driver APIs, see the other sections.
> > > =20
> > > +Requirements
> > > +------------
> > > +
> > > +KMS drivers might need to add extra properties to support new featur=
es.
> > > +Each new property introduced in a driver need to meet a few
> > > +requirements, in addition to the one mentioned above:
> > > +
> > > +* It must be standardized, documenting:
> > > +
> > > +  * The full, exact, name string;
> > > +  * If the property is an enum, all the valid variants name; =20
> >=20
> > Hi,
> >=20
> > "variant" feels a little off to me, I would have used "value name
> > strings".
> >  =20
> > > +  * What values are accepted, and what these values mean;
> > > +  * What the property does and how it can be used;
> > > +  * How the property might interact with other, existing properties.
> > > +
> > > +* It must provide a generic helper in the core code to register that
> > > +  property on the object it attaches to.
> > > +
> > > +* Its content must be decoded by the core and provided in the object=
's
> > > +  associated state structure. That includes anything drivers might w=
ant
> > > +  to precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>`=
 for
> > > +  planes.
> > > +
> > > +* Its initial state must match the behavior prior to the property
> > > +  introduction. This might be a fixed value matching what the hardwa=
re
> > > +  does, or it may be inherited from the state the firmware left the
> > > +  system in during boot. =20
> >=20
> > I'd like to point out that this rule should apply also to
> > properties that already exist in general, but are newly exposed in a
> > driver for hardware that didn't expose the property before. =20
>=20
> I think we should just make this a very strong recommendation, and in
> general encourage people to use the tests against their driver?
>=20
> Otherwise a small "I'll just enable this" thing can become a huge project.
> And in general I think grandfathering existing things in is the pragmatic
> choice.
>=20
> But maybe that could be a follow-up patch?

Sure, I don't mind. Just saying now that it came to mind. Drivers do
not arbitrarily change behaviour without exposing more properties
either, right?


Thanks,
pq


> -Daniel
>=20
> >  =20
> > > +
> > > +* An IGT test must be submitted where reasonable.
> > > +
> > >  Property Types and Blob Property Support
> > >  ----------------------------------------
> > >   =20
> >=20
> > Regardless of my comments above:
> >=20
> > Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >=20
> >=20
> > Thanks,
> > pq =20
>=20
>=20
>=20


--Sig_/m7jNGNA+=hMPjR5L.MzAv2S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDoEf4ACgkQI1/ltBGq
qqf1tQ/+OlmEQCBd2x61wdinsQBtNDzcCZe63mmxfySolGB8JZOJjPli0E6OSV2V
l7vT2Bs7X9l9lTh4cfv1M0H6Ezg8vSV8pQfB0tJzIo7Nir6M10HRt+aYrGAmkFBJ
d2zU2TeM5inDbSNczQIZwJgvHrezzMUO1nqQjX5d4ejg+2Ga5EgOZg15gg46n5hS
Bg73JU/u8pOJTP4bhkLUMLX/02oBbTP/YMzdqmgRQUaVLa11skcv63vYC1gEcekA
FWWVlJsnJKPVf+X+c+2vGIVnQiUyI+SKCOPD4XsFK4XQG5NweUOqgpn40CRFNdeH
PR0Z8eh5fuFhz3iqy68PgOMB+QKHp3F7MiNZgoHr58yn2hUnwNLZqYXIReEbeaPx
3eix5nUErEwHApXFbKq/ERqPq24DhKPeH7kBqEIcWduF3mZRkD8iHEZC8LCS80Eg
vaVPtbxLNJ4h7aYYrr6p8/T8u4GdoiEeLlqoIj1Rj7WQ0sKMopbZPIiG+J2fbQLM
rLoN2EdA+a20hFPQhl0k8FhlhDlANahAVAJ7Vkobqus5RnKW+QZL/syGRZzOiWj1
MELDhbCzodSacx31dFWjaqQgJBmkSfhVUXwYpBrx1/5B8JS0EgzEkR4OfJJUT7bP
nL+2xVkGp5Crso/gCQFS7rMM/bvzNgzq+xtACEcwh6yyw1CTDnM=
=IUaf
-----END PGP SIGNATURE-----

--Sig_/m7jNGNA+=hMPjR5L.MzAv2S--
