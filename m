Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245FFC48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:15:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C45B613DB
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhFOHRb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 03:17:31 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:39378 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229613AbhFOHRb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 03:17:31 -0400
Date:   Tue, 15 Jun 2021 07:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1623741323;
        bh=zAvKKg8XYRllgucKJPAAx6Hwc3GHyOslF2EqoYChAU4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qIC2eamU+xceUl39cfpo+Bhho6rVi/vXhoahbkzyuqB4fwHA2HzLwevsTcI1Db9xs
         BX32j+PX6lz6SBs/Z67DzyFA9lkF3Wh3OHUQGgQNgk+mzda5QgFPNcUuTQjRSND5Gr
         sXDpgIxNmOBgIy/iVvqIj+v3zRbkZgrkTr2l0JD3RbdUyopl20Cth6IXBcs3KRuH9y
         g1In7HEdKt3KPgWaHMeBwZgfR2i8pbnuJTjS+ZibNwYCjg+lTFntI5RMy2tp0P3cCg
         Ap52jKaW2WLFk99bqh0CyuNUmVhgNtQ3aZjuK5RtApLs7ZfWBNTJ+9wCl4DRfCPg+D
         k/TImS8zk8pMA==
To:     Pekka Paalanen <ppaalanen@gmail.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
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
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Huang Rui <ray.huang@amd.com>,
        Yannick Fertr e <yannick.fertre@foss.st.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Robert Foss <robert.foss@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new properties
Message-ID: <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
In-Reply-To: <20210615100335.0b8f96d5@eldfell>
References: <20210610174731.1209188-1-maxime@cerno.tech> <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com> <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr> <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com> <20210614174912.15a49336@eldfell> <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com> <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com> <20210615100335.0b8f96d5@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen <ppaalanen@gmail.com> =
wrote:

> indeed it will, but what else could one do to test userspace KMS
> clients in generic CI where all you can have is virtual hardware? Maybe
> in the long run VKMS needs to loop back to a userspace daemon that
> implements all the complex processing and returns the writeback result
> via VKMS again? That daemon would then need a single upstream, like the
> kernel, where it is maintained and correctness verified.

The complex processing must be implemented even without write-back, because
user-space can ask for CRCs of the CRTC.

> Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtual
> stuff in userspace? Didn't someone already have something like that?
> It would need to be lifted to be a required part of kernel UAPI
> submissions, I suppose like IGT is nowadays.

FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near a full
software implementation with write-back connectors, but allows to expose
virtual planes and check atomic commits in CI.

[1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm_mock.c

> For compositor developers like me knowing the exact formulas would be a h=
uge
> benefit as it would allow me to use KMS to off-load precision-sensitive
> operations (e.g.  professional color management). Otherwise, compositors
> probably need a switch: "high quality color management? Then do not use K=
MS
> features."

I think for alpha blending there are already rounding issues depending on t=
he
hardware. I wouldn't keep my hopes up for any guarantee that all hw uses th=
e
exact same formulae for color management stuff.
