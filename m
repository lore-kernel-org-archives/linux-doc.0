Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFA0C48BE5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 08:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52593613AE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 08:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhFKIRI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 04:17:08 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:39832 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229777AbhFKIRH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 04:17:07 -0400
Date:   Fri, 11 Jun 2021 08:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1623399303;
        bh=LXrQUMsq4zcmYpPR/J5q0e+ciaGERkxMWGdrR9hM6tk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=kVMSxOyOs8TOhI8W65hcCQhveG8YX+BcfbWqtHQTA73WRuOo230rSfTwC184RAX9p
         ndnBnNK/H4eAkIMrlzQPnkP/EgFrbrt7kFTjGo9Buod5H8wcOa4hkuBe2Jwk+2x84z
         yX7gNwq2695WOS2KKv1ddsmiHvX9wgaySUjwTGvPh1/s8gVaYFPpNXGNShPcoAYSc+
         XRagAqfd946FnrUjFpVmYXPC8sn2/Jw5otjsajpEp636FKgGJa5UG6KJdeYghJxN6y
         hMe4/eH8auB3L4I/pA+6+oAdTmXcIt8MQFlTZX+KFSdo9Wt1PeHyNph6RSBeLWYs0O
         UWGinWICE8EtA==
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
From:   Simon Ser <contact@emersion.fr>
Cc:     Maxime Ripard <maxime@cerno.tech>,
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
        =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
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
        =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
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
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Robert Foss <robert.foss@linaro.org>,
        Qiang Yu <yuq825@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new properties
Message-ID: <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
In-Reply-To: <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
References: <20210610174731.1209188-1-maxime@cerno.tech> <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thursday, June 10th, 2021 at 23:00, Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:

> If there's a strong consensus that we really need this then I'm not
> going to nack this, but this really needs a pile of acks from
> compositor folks that they're willing to live with the resulting
> fallout this will likely bring. Your cc list seems to have an absence
> of compositor folks, but instead every driver maintainer. That's
> backwards. We make uapi for userspace, not for kernel driver
> maintainers!

In wlroots we have a policy of only allowing standard KMS properties to
be used. Any vendor-specific property is going to be less well-defined,
less widely useful, potentially have more design issues, potentially
overlap in functionality with other vendor-specific properties, likely
have some hardware-specific assumptions, etc.

What matters here is discussing with other driver & user-space folks to
make sure the new property's design is sound. Designing uAPI is hard.

If kernel folks are struggling with a user-space implementation, they
should discuss with user-space folks to see which project would be
interested. There's a chance a compositor will be interested in the new
property and will just do the user-space part for you, if not we can
suggest candidate projects.

tl;dr strong agree with Daniel here.
