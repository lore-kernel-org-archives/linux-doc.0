Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4120C48BE6
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 16:14:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 919C6613DE
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 16:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbhFNQQu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 12:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhFNQQt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 12:16:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC179C061574
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 09:14:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEB83A59;
        Mon, 14 Jun 2021 18:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623687284;
        bh=3oqxFLl+la1zV0k6JYVn4HnzpR9K2fHk6CzrLjHstKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rMDFxaMVDGbnAbdX9I9ozMwKOM8AsOjJx+jS7G0FSBB1f6cfeOH7w6QZJ+6VCzGj4
         nLOuE3k487521wwxiRZQT/3uRaGyRJN08IKEoJZyOIzlKwSzPg1M+99yMzPmbaM1n9
         pcVLSBsNuuLyIGK3sTtXYTN+FbDoC8dS2mcsgiS4=
Date:   Mon, 14 Jun 2021 19:14:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
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
Message-ID: <YMeAYEA0lTrCpV8L@pendragon.ideasonboard.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <20210611055407.aoeams62wbalodrj@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210611055407.aoeams62wbalodrj@gilmour>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 07:54:07AM +0200, Maxime Ripard wrote:
> On Thu, Jun 10, 2021 at 11:00:05PM +0200, Daniel Vetter wrote:
> > On Thu, Jun 10, 2021 at 7:47 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > New KMS properties come with a bunch of requirements to avoid each
> > > driver from running their own, inconsistent, set of properties,
> > > eventually leading to issues like property conflicts, inconsistencies
> > > between drivers and semantics, etc.
> > >
> > > Let's document what we expect.
> > >
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Alison Wang <alison.wang@nxp.com>
> > > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > Cc: Brian Starkey <brian.starkey@arm.com>
> > > Cc: Chen Feng <puck.chen@hisilicon.com>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > > Cc: Eric Anholt <eric@anholt.net>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > Cc: "Heiko Stübner" <heiko@sntech.de>
> > > Cc: Huang Rui <ray.huang@amd.com>
> > > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Cc: Inki Dae <inki.dae@samsung.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > > Cc: Joel Stanley <joel@jms.id.au>
> > > Cc: John Stultz <john.stultz@linaro.org>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > Cc: Marek Vasut <marex@denx.de>
> > > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > Cc: "Noralf Trønnes" <noralf@tronnes.org>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > Cc: Paul Cercueil <paul@crapouillou.net>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Qiang Yu <yuq825@gmail.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Robert Foss <robert.foss@linaro.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Roland Scheidegger <sroland@vmware.com>
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Sandy Huang <hjc@rock-chips.com>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Tian Tao <tiantao6@hisilicon.com>
> > > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > Cc: Tomi Valkeinen <tomba@kernel.org>
> > > Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> > > Cc: Xinliang Liu <xinliang.liu@linaro.org>
> > > Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > > Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> > > Cc: Zack Rusin <zackr@vmware.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > ---
> > >
> > > Changes from v2:
> > >   - Take into account the feedback from Laurent and Lidiu to no longer
> > >     force generic properties, but prefix vendor-specific properties with
> > >     the vendor name
> > 
> > I'm pretty sure my r-b was without this ...
> 
> Yeah, sorry. I wanted to tell you on IRC that you wanted to have a
> second look, but I shouldn't have kept it and caught you by surprise
> indeed.
> 
> > Why exactly do we need this? KMS is meant to be fairly generic (bugs
> > throw a wrench around here sometimes, and semantics can be tricky). If
> > we open up the door to yolo vendor properties in upstream, then that
> > goal is pretty much written off. And we've been there with vendor
> > properties, it's a giantic mess.
> > 
> > Minimally drop my r-b, I'm definitely not in support of this idea.
> 
> So the argument Lidiu and Laurent made was that in some cases, getting a
> generic property right with only a couple of users is hard. So they
> advocated for the right to keep non-generic properties. I can get the
> argument, and no-one else said that was wrong, so it felt like the
> consensus was there.

My argument was two-fold. On one hand, there's the issue of
standardizing properties when we have a single example. I don't have a
good solution for that chicken-and-egg issue, when we tell vendor they
should standardize properties, and when they ask how, we tell them we
don't know as it hasn't been done before. The option for allowing a
staging playground for vendor properties here isn't something I like,
but we'll need something similar one way or another. Perhaps at the cost
of not guaranteeing userspace ABI for those properties, and converting
them later to something standard (it won't be received well by vendor of
course, and will make a push for mainline more difficult to sell, so
it's not a great solution).

On the other hand, there are esoteric vendor-specific features for which
standardization really doesn't make sense. For those, I think
vendor-specific properties are fine, as long as they're properly
documented, with a design documentation merged at the same time as the
property. A vendor prefix is really just a namespace clash handling tool
here.

> > If there's a strong consensus that we really need this then I'm not
> > going to nack this, but this really needs a pile of acks from
> > compositor folks that they're willing to live with the resulting
> > fallout this will likely bring. Your cc list seems to have an absence
> > of compositor folks, but instead every driver maintainer. That's
> > backwards. We make uapi for userspace, not for kernel driver
> > maintainers!
> 
> Right, but it's mostly about in-kernel rules though? And you're the one
> who mentionned CC'ing the driver maintainers in the first iteration?
> 
> > ltdr; I'd go back to v2. And then cc compositor folks on this to get
> > their ack.
> 
> So, Pekka, Simon, is there anyone else I should Cc?

-- 
Regards,

Laurent Pinchart
