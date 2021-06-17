Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C09C48BE5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 19:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20313613E7
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 19:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhFQTKO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 15:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbhFQTKN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 15:10:13 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94684C061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 12:08:04 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id n7so7967240wri.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IR6nqqUmGXk7IYRuhjjxlGaJI9czVlUrwb18e4SwsPA=;
        b=ePy97Wnyuf3Buo2r5hDPx4yZ07dOXcP51cxRlHQLUztYssgAubhYwtVW/83jWKr5Oq
         YAM95BJTr/4p+aDYgmO/ynMW7k+tJd2E6YRyuIeQuCud7iKbG8mFYQjVPg+OzLWdgyBW
         UL3chClOGb1/PJfjz57zFbIuvAXUpzJ/8eU+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IR6nqqUmGXk7IYRuhjjxlGaJI9czVlUrwb18e4SwsPA=;
        b=hEwKkxRa7mo/eyKVmC7x9sq87P4leSQbeyOpyZaGG1hB6ulBKHAz2WjTRU4LGM8T9Y
         +PchC8AA0yDiXLtE0eCRMDaRnLl3XoRb4NlWqySN2DwpIU+7EhvnGbPSLUWKkXnMTOHz
         8MoMqwx21PmDmGbaAO8OYkvzq+GgXeHm4RSaLrIr/bALHKPlKZ7Q2IkpjlKhw2C4xqzC
         fVZxTjxm/YLHTVwY1l3ifkA4gjXqWn7OucRUSt6c32IjoCH46ueJC8WbfuHHAChtXsO2
         uGk2XSfJJGwkiSlhTYEydnGxtaVKtrghL85en2WAFJKGe9ORzdJozUGDDGNktDRQ2gPl
         sW4A==
X-Gm-Message-State: AOAM5301z71orVsYPvHISVsF3i2kU1Y32hxZNPhL7EJ1e0hgRp8fAjjd
        FG7i7g4rvBD2xPZMC12yZhjtdw==
X-Google-Smtp-Source: ABdhPJytFXJtFAejmTkA7Of1m7BvEw9I3gYWSEalInUTunTXyu+jv1k5OhtkfQUsT7Dntrx4boToYQ==
X-Received: by 2002:a05:6000:1888:: with SMTP id a8mr7472604wri.11.1623956883179;
        Thu, 17 Jun 2021 12:08:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b15sm7537016wrr.27.2021.06.17.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 12:08:02 -0700 (PDT)
Date:   Thu, 17 Jun 2021 21:07:59 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Philippe CORNU <philippe.cornu@foss.st.com>
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
        Raphael GALLAIS-POU <raphael.gallais-pou@foss.st.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
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
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Russell King <linux@armlinux.org.uk>,
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
Message-ID: <YMudjzouG6PuXPk4@phenom.ffwll.local>
References: <20210616143842.632829-1-maxime@cerno.tech>
 <9a994b75-7578-d7b1-db3f-5625f121c740@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a994b75-7578-d7b1-db3f-5625f121c740@foss.st.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 17, 2021 at 05:38:36PM +0200, Philippe CORNU wrote:
> 
> 
> On 6/16/21 4:38 PM, Maxime Ripard wrote:
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
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: "Heiko Stübner" <heiko@sntech.de>
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
> > Cc: "Noralf Trønnes" <noralf@tronnes.org>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
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
> > Cc: Simon Ser <contact@emersion.fr>
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
> > Changes from v3:
> >    - Roll back to the v2
> >    - Add Simon and Pekka in Cc
> > 
> > Changes from v2:
> >    - Take into account the feedback from Laurent and Lidiu to no longer
> >      force generic properties, but prefix vendor-specific properties with
> >      the vendor name
> > 
> > Changes from v1:
> >    - Typos and wording reported by Daniel and Alex
> > ---
> >   Documentation/gpu/drm-kms.rst | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index 87e5023e3f55..c28b464dd397 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -463,6 +463,25 @@ KMS Properties
> >   This section of the documentation is primarily aimed at user-space developers.
> >   For the driver APIs, see the other sections.
> > +Requirements
> > +------------
> > +
> > +KMS drivers might need to add extra properties to support new features.
> > +Each new property introduced in a driver need to meet a few
> > +requirements, in addition to the one mentioned above.:
> > +
> > +- It must be standardized, with some documentation to describe how the
> > +  property can be used.
> > +
> > +- It must provide a generic helper in the core code to register that
> > +  property on the object it attaches to.
> > +
> > +- Its content must be decoded by the core and provided in the object's
> > +  associated state structure. That includes anything drivers might want to
> > +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for planes.
> > +
> > +- An IGT test must be submitted where reasonable.
> > +
> >   Property Types and Blob Property Support
> >   ----------------------------------------
> > 
> 
> Hi,
> 
> Regarding properties, we have a “case study example” related in a certain
> way to this documentation update :-)
> 
> The use case: on a front desk at an exhibition, there is a welcome screen
> you can touch for searching various information. When this welcome screen is
> in idle, a small logo is displayed at its center (around 20% of the
> fullscreen). The logo has a white background color. We want to reduce the
> ddr usage for lowering the power (the board is battery powered) so the idea
> is to use a white background color around this logo, produced by the drm
> CRTC so the image in ddr is only the size of the logo.
> 
> Reading the thread
> https://lists.freedesktop.org/archives/dri-devel/2019-October/239733.html
> dissuade us from coding a generic solution, so we started to implement a
> "STM_" private background color property, it works... but we are not at all
> convince this is the right way and we clearly prefer mainline/generic sw for
> both kernel & userland.
> 
> So now, what are our options... well, this v4 documentation update is I
> think clear enough: we have to document + provide a generic helper in the
> core code (similar to the original patch) + update IGT test, right?

Yeah, also background color has been talked about for a while (lots of hw
can do it), it's just that no one ever found a use-case to make the
background somethign else than "black". There's a pile of drivers who
could expose this, so definitely makes sense to have this generic.
-Daniel

> 
> Thanks
> Philippe :-)
> 
> Note: It is really a pleasure to read such interesting thread, exposing the
> “complexity” of our job, dealing with various hw and sw... thank you to all
> of you.
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
