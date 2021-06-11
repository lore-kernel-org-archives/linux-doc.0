Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE35C4743D
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 05:54:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A3A7613C3
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 05:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhFKF4R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 01:56:17 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53787 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230001AbhFKF4Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 01:56:16 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id B2601580972;
        Fri, 11 Jun 2021 01:54:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 11 Jun 2021 01:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=/Pyj13OF+Qaljusxk4DglvTTwIF
        GdmYwXFiKzdPBMAA=; b=BjQI2uxL4uWJkXhofPmtHx9UWV9MojOKjRJFeizY+sm
        9bweN282i577gej2oRxE/uHrpIMThWCZsJIuv+6xa3nbpua4a+kJHxxSHkqDQMOO
        kL+lkt6Ib3MSTN8SPAlABsrK46/Ec0G+DZSqCTcxFUAz7rucVhlrprUfQYXUyM/S
        B9JmYzaMFK68ExSwU6cZyA2bIgei0g1RG9goudolftQt9FFGQu9E0bV/MRDQsLWp
        2fLnF4IELjSkR5S0uIt8cQI88gC3Bvfysdh/XPC0eSXQwblUvWSfrb+Mq+Vh7IA+
        gPy8qQLDTkJGRTyNEtL+H/CZx/lErpOmanygwTPOXoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/Pyj13
        OF+Qaljusxk4DglvTTwIFGdmYwXFiKzdPBMAA=; b=Xp8SJ2SkR2PtIJnb1W2CHo
        h/RsSztdkUiblozlkHMVPh/WvjcNLpDAnSn1G6MTolkiR1haZ1BrA7I2iP3iivCh
        tJiVYUyy4FiDbZY/tL43CCQhqJ942GSsG6pg1JxWDCBJAADayuZqWC+kt7VFJH1h
        nP9dZ+enhOBYlj86z40dcATQVmEO2THhMSboV9sV1i+xm3Z/DQ7BuyCEzDL7dqF3
        WnNjNh5zD2XzAFoSgxMilqfx7k2Qg9OCg4CP4+f/nRyadDUGOYi5t7ELGaANpi77
        dR7FbZU3W59YigDDZtgU/lRXoBnApU4U0aGB6gO8wMhFlsHEn8l9FB1dyqCAJ8KA
        ==
X-ME-Sender: <xms:g_rCYISLJ-_Kn4nFp6JbKrQ3I_OIKIZRycHj7A14zBtyHZlkGaLrww>
    <xme:g_rCYFwb1bjti2srqtjY-XZXQGwAT5MImay6yweWMdrbsf5ybhlSfgCVzxZ6_Aomo
    0XN8KYFXq1MiNQf5Vs>
X-ME-Received: <xmr:g_rCYF2mgSGhIqjwIDbQj4s---gCuGKc4hxmRd29mPJUaN419VOB7OVwVHewW4LRx_ROCdHPk_X9pNS5Kn5RvkXzMm_6poTmVAei>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:g_rCYMDPSggh8GuUHKAgeNd5EzP8t3RXSCTx55mPvFSAYiSn_sU5DQ>
    <xmx:g_rCYBi5xP-xQqoOLyzy5gXGPgVVvJtAOqXEuftj4Xtt_O3VZYvmzQ>
    <xmx:g_rCYIr7FJiLeyWCZ8xPQbZC-Oh_ASjwF8BPNxZaGa5pq3OG-oa8KA>
    <xmx:ivrCYMZ3sVoueNBkDfK5DtTyHWsoXLpYN-yZ1iZbPuO3SU1IoxMSfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 01:54:10 -0400 (EDT)
Date:   Fri, 11 Jun 2021 07:54:07 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alison Wang <alison.wang@nxp.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Brian Starkey <brian.starkey@arm.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        John Stultz <john.stultz@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Marek Vasut <marex@denx.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Steven Price <steven.price@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210611055407.aoeams62wbalodrj@gilmour>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nd2s7he5im2epank"
Content-Disposition: inline
In-Reply-To: <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--nd2s7he5im2epank
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 10, 2021 at 11:00:05PM +0200, Daniel Vetter wrote:
> On Thu, Jun 10, 2021 at 7:47 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > New KMS properties come with a bunch of requirements to avoid each
> > driver from running their own, inconsistent, set of properties,
> > eventually leading to issues like property conflicts, inconsistencies
> > between drivers and semantics, etc.
> >
> > Let's document what we expect.
> >
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Alison Wang <alison.wang@nxp.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Chen Feng <puck.chen@hisilicon.com>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: "Heiko St=FCbner" <heiko@sntech.de>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Qiang Yu <yuq825@gmail.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Roland Scheidegger <sroland@vmware.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Sandy Huang <hjc@rock-chips.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Tian Tao <tiantao6@hisilicon.com>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Tomi Valkeinen <tomba@kernel.org>
> > Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> > Cc: Xinliang Liu <xinliang.liu@linaro.org>
> > Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> > Cc: Zack Rusin <zackr@vmware.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> >
> > Changes from v2:
> >   - Take into account the feedback from Laurent and Lidiu to no longer
> >     force generic properties, but prefix vendor-specific properties with
> >     the vendor name
>=20
> I'm pretty sure my r-b was without this ...

Yeah, sorry. I wanted to tell you on IRC that you wanted to have a
second look, but I shouldn't have kept it and caught you by surprise
indeed.

> Why exactly do we need this? KMS is meant to be fairly generic (bugs
> throw a wrench around here sometimes, and semantics can be tricky). If
> we open up the door to yolo vendor properties in upstream, then that
> goal is pretty much written off. And we've been there with vendor
> properties, it's a giantic mess.
>=20
> Minimally drop my r-b, I'm definitely not in support of this idea.

So the argument Lidiu and Laurent made was that in some cases, getting a
generic property right with only a couple of users is hard. So they
advocated for the right to keep non-generic properties. I can get the
argument, and no-one else said that was wrong, so it felt like the
consensus was there.

> If there's a strong consensus that we really need this then I'm not
> going to nack this, but this really needs a pile of acks from
> compositor folks that they're willing to live with the resulting
> fallout this will likely bring. Your cc list seems to have an absence
> of compositor folks, but instead every driver maintainer. That's
> backwards. We make uapi for userspace, not for kernel driver
> maintainers!

Right, but it's mostly about in-kernel rules though? And you're the one
who mentionned CC'ing the driver maintainers in the first iteration?

> ltdr; I'd go back to v2. And then cc compositor folks on this to get
> their ack.

So, Pekka, Simon, is there anyone else I should Cc?

Thanks!
Maxime

--nd2s7he5im2epank
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYML6fwAKCRDj7w1vZxhR
xSkxAQDROz22RNLpAfVMNaKZojDzxWqNEcCy9BAXL0pJY3wZkAD9GzMg2AOQhwFO
tvz4LRXIsYEIrjPzpAD08FepWZrtlgE=
=vegP
-----END PGP SIGNATURE-----

--nd2s7he5im2epank--
