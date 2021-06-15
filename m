Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614DEC48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 12:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DDAD61437
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 12:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhFOMLN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 08:11:13 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:43524 "EHLO
        mail-0201.mail-europe.com." rhost-flags-OK-OK-FAIL-FAIL)
        by vger.kernel.org with ESMTP id S229557AbhFOMLN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 08:11:13 -0400
Date:   Tue, 15 Jun 2021 12:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1623758945;
        bh=YJUJp4Q3PTfAsAozfjNBg2Qiq1NH8gfHy3zUV3I6ykw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=dYFcPeWpaUBdkw1JKTaAHFdT5Kx7xZ12j+tq3ZZe1E9YtIXyrLNaYqE6AoZ6o83pc
         w9ClPdf06c02nbhLuuDWKxgMAmVXZatdSzVFsCuOVyIFxgKPCktbAkArSZNncfuBzA
         jAAHwL1d90a9f+9ftr1JXv7y/KdLneIrpTv6RRCcusjBL/o5MVUJBpSBBykQTAlLNT
         gwR9LIzJn60JkmTiuN3nv1/25ChBrU2Q6li/ISMwfs21e8Uq53fehyFjqolNoMCY7n
         FpIWwmM19v0ac9Qez/6NMzuPNdj1KKch0HOUMJW5FaEfzxB8jPaczEiub3w44vzjJ4
         yeRKAvVrreUlw==
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
Message-ID: <ESSpFFHaoQjjviok-WoxyLRRwcFnRT0XXVAS8mB0jvCxmHNLfJKD9QELUXNs3SEn5Z6IU0j0mQDs3qjvkoOo8QiZP6q3MCQgr2vX8C4x_9Q=@emersion.fr>
In-Reply-To: <20210615131656.2ecefdc4@eldfell>
References: <20210610174731.1209188-1-maxime@cerno.tech> <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com> <20210614174912.15a49336@eldfell> <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com> <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com> <20210615100335.0b8f96d5@eldfell> <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr> <YMh21WBrADbZDcbp@pendragon.ideasonboard.com> <20210615131656.2ecefdc4@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tuesday, June 15th, 2021 at 12:16, Pekka Paalanen <ppaalanen@gmail.com> =
wrote:

> Good reminder about CRCs. CRCs have zero tolerance, so they are not
> useful for testing properties that have any leeway, are they?

IIRC, IGT's alpha blending test currently computes the CRC for all
possible roundings, then checks that the hw returns one of the
acceptable CRCs.

With more complex color management properties, this approach might not
be possible and write-back support in hw drivers would really help.
