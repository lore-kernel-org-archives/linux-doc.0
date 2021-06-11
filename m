Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCE7C48BE0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 12:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A12CB613CD
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 12:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhFKMFK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 08:05:10 -0400
Received: from foss.arm.com ([217.140.110.172]:56524 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229785AbhFKMFJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Jun 2021 08:05:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81BD41396;
        Fri, 11 Jun 2021 05:03:11 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CBC53F85F;
        Fri, 11 Jun 2021 05:03:11 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id CF3FB682B70; Fri, 11 Jun 2021 13:03:09 +0100 (BST)
Date:   Fri, 11 Jun 2021 13:03:09 +0100
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Simon Ser <contact@emersion.fr>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
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
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
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
        Joel Stanley <joel@jms.id.au>,
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
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Russell King <linux@armlinux.org.uk>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Yannick Fertr e <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Robert Foss <robert.foss@linaro.org>,
        Qiang Yu <yuq825@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 08:14:59AM +0000, Simon Ser wrote:
> On Thursday, June 10th, 2021 at 23:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> > If there's a strong consensus that we really need this then I'm not
> > going to nack this, but this really needs a pile of acks from
> > compositor folks that they're willing to live with the resulting
> > fallout this will likely bring. Your cc list seems to have an absence
> > of compositor folks, but instead every driver maintainer. That's
> > backwards. We make uapi for userspace, not for kernel driver
> > maintainers!
> 
> In wlroots we have a policy of only allowing standard KMS properties to
> be used. Any vendor-specific property is going to be less well-defined,
> less widely useful, potentially have more design issues, potentially
> overlap in functionality with other vendor-specific properties, likely
> have some hardware-specific assumptions, etc.
> 
> What matters here is discussing with other driver & user-space folks to
> make sure the new property's design is sound. Designing uAPI is hard.
> 
> If kernel folks are struggling with a user-space implementation, they
> should discuss with user-space folks to see which project would be
> interested. There's a chance a compositor will be interested in the new
> property and will just do the user-space part for you, if not we can
> suggest candidate projects.
> 
> tl;dr strong agree with Daniel here.

I think the assumption you and Daniel are making is that the first implementation of
a new KMS property can be made standard from day one and that it will work for any
late comer driver as is, without having to make changes to its behaviour in a
significant way. In my experience that is not the case.

I think we have moved from the times when we were trying to implement in the Linux
world features that were available in the hardware but needed a kernel and userspace
API. The set of properties that exist in KMS cover a lot of needed functionality and
I don't expect to see new properties for stuff that is already supported by hardware.

What I'm expected to see in the future is new functionality that gets implemented by
one hardware vendor and the kernel developers trying to enable that for userspace. It
could be that the new property is generic, but there is no way of testing that on
more than one implementation yet, so I'd say we are generous calling it "standard
property". When the second or third hardware vendor comes along and starts supporting
that property with their own set of extra requirements, then we can call it
"standard". Then comes the effort cost: would it be easier to start with a vendor
property that only the vendor needs to support (and can submit patches into the
compositors to do so) and when the standard property gets added moves to that, or
should we start with a generic property that gets implemented by the compositors
(maybe, but then only one vendor supports it) and then later when we actually
standardise the property we will have to carry backwards compatibility code in the
kernel to handle the old behaviour for old userspace? My proposal to Maxime was for
the former option to be reflected in the documentation, but I would like to hear your
thoughts.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
