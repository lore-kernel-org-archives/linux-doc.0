Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B86C2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 16:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9717B613D9
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 16:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhFNQ0T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 12:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233044AbhFNQ0S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 12:26:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB477C061574
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 09:24:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49A52A59;
        Mon, 14 Jun 2021 18:24:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623687853;
        bh=DJSLGOY9tbIQ4kQyUzJsZbfvx55crZSawEGsubblm+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y0tVKLt7Mwie1rj3RTnQmypSOg8q2rpS4cgdvoy5aVf0h/VfG/SZZSRO8eIvFSdkY
         MCL79UzALdoFyVLGZXqBs5dmztIqdEGo8PYtBfrocigt2FrVvfNYRTV5mRU+b1pbf+
         LNqEeMBfwl8oTIw13+BO5PlSvmyRysVfNHFUN5mY=
Date:   Mon, 14 Jun 2021 19:23:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Liviu Dudau <liviu.dudau@arm.com>
Cc:     Alyssa Rosenzweig <alyssa@collabora.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Russell King <linux@armlinux.org.uk>,
        Melissa Wen <melissa.srw@gmail.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Steven Price <steven.price@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Qiang Yu <yuq825@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alison Wang <alison.wang@nxp.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>, Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Huang Rui <ray.huang@amd.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Yannick Fertr e <yannick.fertre@foss.st.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Robert Foss <robert.foss@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Noralf Tr??nnes <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian K??nig <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMeCmcyFHO91hPi7@pendragon.ideasonboard.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <YMNdZCkyaVoH+WAd@maud>
 <20210611133418.mwjabkd4zzcgekti@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210611133418.mwjabkd4zzcgekti@e110455-lin.cambridge.arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 02:34:18PM +0100, Liviu Dudau wrote:
> On Fri, Jun 11, 2021 at 08:56:04AM -0400, Alyssa Rosenzweig wrote:
> > > What I'm expected to see in the future is new functionality that gets implemented by
> > > one hardware vendor and the kernel developers trying to enable that for userspace. It
> > > could be that the new property is generic, but there is no way of testing that on
> > > more than one implementation yet, so I'd say we are generous calling it "standard
> > > property". When the second or third hardware vendor comes along and starts supporting
> > > that property with their own set of extra requirements, then we can call it
> > > "standard". Then comes the effort cost: would it be easier to start with a vendor
> > > property that only the vendor needs to support (and can submit patches into the
> > > compositors to do so) and when the standard property gets added moves to that, or
> > > should we start with a generic property that gets implemented by the compositors
> > > (maybe, but then only one vendor supports it) and then later when we actually
> > > standardise the property we will have to carry backwards compatibility code in the
> > > kernel to handle the old behaviour for old userspace? My proposal to Maxime was for
> > > the former option to be reflected in the documentation, but I would like to hear your
> > > thoughts.
> > 
> > Just my 2c - if the mainline kernel isn't willing to commit to a feature
> > for upstream userspace to use, why does that feature belong in the
> > kernel at all? I don't see much value in exposing hardware for the sake
> > of exposing it when, practically, Linux userspace /can't/ use it as-is.
> > 
> > Might these vendor properties be used on downstream Android userspaces?
> > That's not generally an upstream goal to support.
> 
> I think the assumption is that we are willing to commit to supporting a feature for
> userspace, just that (I personally) lack the confidence that I will be getting the
> feature right on the first attempt and using only one vendor hardware. And that
> supporting potential mistakes I might've made in the first version is harder if the
> feature was deemed "standard".

There's also the issue that the first developer to try to upstream a
standard property for a new feature often gets ignored as nobody else
has experience with that feature, and thus lack personal interest.
That's not a pure technical issue, there's a management problem there
too. The right solution may ne to figure out a good process to
standardize new property without making it so difficult that everybody
will give up and only use downstream kernels. I've heard too many times
already from vendors that upstream isn't something they can target as
the bar to entry is too high, and when I convince them to submit patches
to extend APIs, those patches get ignored (I'm not talking about DRM/KMS
only here).

> I'm talking from my experience with the writeback connector. We almost committed the
> feature twice before more people chipped in and asked us for changes, but that was lucky.

-- 
Regards,

Laurent Pinchart
