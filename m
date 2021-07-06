Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C493CC07E96
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 21:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A300661CB6
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 21:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhGFV6r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jul 2021 17:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhGFV6q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jul 2021 17:58:46 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9427FC061574
        for <linux-doc@vger.kernel.org>; Tue,  6 Jul 2021 14:56:06 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id j34so471554wms.5
        for <linux-doc@vger.kernel.org>; Tue, 06 Jul 2021 14:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iKB6HrB8g29SVIpwGM01O+Jln+X6mmTMmrUNdgf9M7Q=;
        b=Vh/Hse7z3K8hdZy4GLsIIhi2Rp9MgcPDRt1km4yyIYkipxRtRR1RVRL54+U6wIG3b/
         fwtgEyeK7IfTKYlgnYn3rIIzClvQsg1x2SlKgzmaJXHDD4d/yi8E6ry8TMfMbEY9zs2s
         FdR36DUihPfw4G7nOKRk6c37N1ejl7MTynjpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iKB6HrB8g29SVIpwGM01O+Jln+X6mmTMmrUNdgf9M7Q=;
        b=Ugtnt/iWW6toGSqvEfq2lqNQ+J1uG8ty1ZQ2hwmkpR3bAvRrMWrm+jkjVjpWcPZ2w7
         IE6YRumdWoYl5Ye3r5Q+DgF/qLf1t6UrhoJtzUF2BMXHK8Ywle1mqOt7PwR88TiaJMS0
         HQfAW59k+KCSPSnB53vvVfHZdcA/+sr97R3xulEcSBNi1KXIci0xxBqA3x+pITOCxOva
         G5DPLh3lYnyV8YRJdecXOEuIIyL9vP/Z0ysJCKu5JMUnL9dtEqX/47ScSNsVxA8j0df7
         S0upxZCfttRoCAv1xTmjzh/3Il/aUAZY7+F2LEcOjwJCZAMdWRbTSG6At871EsfrFslq
         4O4Q==
X-Gm-Message-State: AOAM53087Rytl1AHW2vmeUbrT8gkz+AtruFQMq0HXyhLS5PLU2Um+DwR
        TD5rS0TrBU4trbKNeCWdjRA0Cg==
X-Google-Smtp-Source: ABdhPJwuNVMCgJJcQpMcqhiFNZuMsLj1WIndhsM808heNcT/i3bs+XkVLobyN8RFo/ReYlxepNIFrQ==
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr3054068wmh.5.1625608565191;
        Tue, 06 Jul 2021 14:56:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f9sm18574300wrm.48.2021.07.06.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 14:56:04 -0700 (PDT)
Date:   Tue, 6 Jul 2021 23:56:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
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
        Maxime Ripard <mripard@kernel.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
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
        Simon Ser <contact@emersion.fr>,
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
        Zack Rusin <zackr@vmware.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YOTRcFhg6jlcOBO7@phenom.ffwll.local>
References: <20210706161244.1038592-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706161244.1038592-1-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 06, 2021 at 06:12:44PM +0200, Maxime Ripard wrote:
> New KMS properties come with a bunch of requirements to avoid each
> driver from running their own, inconsistent, set of properties,
> eventually leading to issues like property conflicts, inconsistencies
> between drivers and semantics, etc.
> 
> Let's document what we expect.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alison Wang <alison.wang@nxp.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Edmund Dea <edmund.j.dea@intel.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v4:
>   - Changes suggested by Pekka
> 
> Changes from v3:
>   - Roll back to the v2
>   - Add Simon and Pekka in Cc
> 
> Changes from v2:
>   - Take into account the feedback from Laurent and Lidiu to no longer
>     force generic properties, but prefix vendor-specific properties with
>     the vendor name
> 
> Changes from v1:
>   - Typos and wording reported by Daniel and Alex

Bunch of typos, but still lgtm.

> ---
>  Documentation/gpu/drm-kms.rst | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 87e5023e3f55..47994890fd1e 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -463,6 +463,36 @@ KMS Properties
>  This section of the documentation is primarily aimed at user-space developers.
>  For the driver APIs, see the other sections.
>  
> +Requirements
> +------------
> +
> +KMS drivers might need to add extra properties to support new features.
> +Each new property introduced in a driver need to meet a few

s/need/needs/

> +requirements, in addition to the one mentioned above:
> +
> +* It must be standardized, documenting:
> +
> +  * The full, exact, name string;
> +  * If the property is an enum, all the valid variants name;

I think that should be "variant's names" but not 100% sure.

> +  * What values are accepted, and what these values mean;
> +  * What the property does and how it can be used;
> +  * How the property might interact with other, existing properties.
> +
> +* It must provide a generic helper in the core code to register that
> +  property on the object it attaches to.
> +
> +* Its content must be decoded by the core and provided in the object's
> +  associated state structure. That includes anything drivers might want
> +  to precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for

Stuff auto-hyperlinks even in .rst files nowadays, so just sturct
drm_clip_rect should be enough here. See

https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#cross-referencing-from-restructuredtext

> +  planes.
> +
> +* Its initial state must match the behavior prior to the property
> +  introduction. This might be a fixed value matching what the hardware
> +  does, or it may be inherited from the state the firmware left the
> +  system in during boot.

I like this addition.

Cheers, Daniel

> +
> +* An IGT test must be submitted where reasonable.
> +
>  Property Types and Blob Property Support
>  ----------------------------------------
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
