Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607F6C48BE8
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 20:39:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0C6613C1
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 20:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhFPUl5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 16:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbhFPUl4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 16:41:56 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C8DC061574
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 13:39:50 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id b24-20020a4a34180000b029024b199e7d4dso694506ooa.4
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMcYalmCAHylGdhbg1IVp3Bs2x8m0iHlc/lzRXUM0HU=;
        b=htoR91a3QnMRSu6n34Lez7gNPl5jTDFDopua7XbvonDZMTt0D1/rpVqdZZ3esJ2kLC
         FALEJvTCoI49RoBJFWwAjdVho4tEu59KBmWww0r39Mi42xLCdXCd4i6bU00GeTaMFl0L
         N/TxuTnsj+lK1DJR61Lm8nkI0DHDruodZ/qA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMcYalmCAHylGdhbg1IVp3Bs2x8m0iHlc/lzRXUM0HU=;
        b=OWmNX3WjVA07iW+jnu5BakYE/D5dKixtln/dsgr7RX+Af/WAo/oRgxeWqrM2RKu7te
         gtGYREYdnk4RWFOXyMnGktjt597BO3TU6vkM/2JQaALFyTF7GpM58GU4n8hXgNjcxKcG
         ooBCbIiSKkzwLvpEYUrM84V107mHSg45Otim/laTPohGZT2jFUeBuxrOPvHg+kZdBVdC
         bZbxLaj+SaGntn0i5Wdg52BKxSMXQNVrWwrESUudfY4SpDwUD5MT0VLU8ynbD7+hDOCJ
         Qhz2scKbt2s9MDS4Lw2059GGTucyN+PGY5v9WtoR9LjY2wUt5jL2f14gh0yOrnzzdywm
         PgYw==
X-Gm-Message-State: AOAM530iODHmr62rmZxBnlcriqzCj8vV1SCQ0gyUNV3Kzy4asSfFYGfp
        QLQX4rCCgzptR1ZGvbiSrqMEyMgoqhq9gsKFmpwSHg==
X-Google-Smtp-Source: ABdhPJwDD/zT6kJIKvO4ayePA1R6nD7IZD+SzvyTh12qM5egyqQSXfFOwPMoWgmByXCoF0ISXyZzGIwha/OsCv8QQh4=
X-Received: by 2002:a4a:8802:: with SMTP id d2mr1538686ooi.28.1623875989469;
 Wed, 16 Jun 2021 13:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210610174731.1209188-1-maxime@cerno.tech> <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell> <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com> <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com> <20210615131656.2ecefdc4@eldfell>
 <ESSpFFHaoQjjviok-WoxyLRRwcFnRT0XXVAS8mB0jvCxmHNLfJKD9QELUXNs3SEn5Z6IU0j0mQDs3qjvkoOo8QiZP6q3MCQgr2vX8C4x_9Q=@emersion.fr>
In-Reply-To: <ESSpFFHaoQjjviok-WoxyLRRwcFnRT0XXVAS8mB0jvCxmHNLfJKD9QELUXNs3SEn5Z6IU0j0mQDs3qjvkoOo8QiZP6q3MCQgr2vX8C4x_9Q=@emersion.fr>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 16 Jun 2021 22:39:36 +0200
Message-ID: <CAKMK7uEWYgbugkhEe0iDhpiGj+n+JgYG-Gn_M_H3_JLHJbHzoQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new properties
To:     Simon Ser <contact@emersion.fr>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
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
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 15, 2021 at 2:09 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, June 15th, 2021 at 12:16, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> > Good reminder about CRCs. CRCs have zero tolerance, so they are not
> > useful for testing properties that have any leeway, are they?
>
> IIRC, IGT's alpha blending test currently computes the CRC for all
> possible roundings, then checks that the hw returns one of the
> acceptable CRCs.
>
> With more complex color management properties, this approach might not
> be possible and write-back support in hw drivers would really help.

Yeah CRC based tests have severe limits, and even if you only try to
test the extreme stuff there's enough busted hw out there that they
will fail. E.g. when scaling I'm sure there's hw that bleeds in pixels
from outside the bounding box and can't be fixed, or there's some
intel hw where the alpha blending gets the mapping between [0, 0xff]
<-> [0.0, 1.0] and you get a nice faint ghost instead of full
transparency or opaqueness.

I think for those broken hw is just broken, nothing we can do.

Also writeback isn't supported by enough display hw, and not everyone
has access to chamelium or similar.

I think best we can do is that relevant igt have an interactive mode
(built-in for crc tests, so you can pause and look at the screen) and
then perhaps compare with the vkms reference implementation manually.
That's not great, and vkms is also not anywhere near close enough for
this either (and like currently you can't even look at it, we'd first
need a v4l output mode).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
