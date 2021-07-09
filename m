Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26618C07E9B
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 08:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CFDD613C3
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 08:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhGIIFR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jul 2021 04:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbhGIIFR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jul 2021 04:05:17 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6455C0613DD
        for <linux-doc@vger.kernel.org>; Fri,  9 Jul 2021 01:02:33 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id k4so4634191wrc.8
        for <linux-doc@vger.kernel.org>; Fri, 09 Jul 2021 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BmTuoSrjVrvLnQBYawgcyJ5HdUbJDDYaqDoQW9Mc7SY=;
        b=dR4HlZmdA8k5eONrJN/VaYgpUpSsX++4j7UioFUJCEayHxGuxa8z/QhPJO5IYdWxyH
         zc7+WN2H5YJxt3ExBIjmC1mhMJjx71lJZfGIEiZLr1LPtFGh/iaBoy9uqGz/VNm32rpl
         Ft1Q3tH36sMKvvmRSTHbGHD+hZy8xKNNKpDDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BmTuoSrjVrvLnQBYawgcyJ5HdUbJDDYaqDoQW9Mc7SY=;
        b=M7Qzf1kQQsq3VToauNMBLEPb4Qzs+wAmatnr2po/IxN26YpRgVsEyatWF3FtXxtGVq
         XPE1iVIf6pg4jZap57nK0E5Y/uDvfSuDAQ//r60dm/VWDSS0dz/+k/3jmFHJ74zzZB8J
         aNKv+f3N0dGob9IV7GchIhvUxZtHZ3utKKXsI6dbV1cizy4lr4887HoqIZDT43pCAYvw
         ClWCcCQtiTtFosAIT8MSYeZ6oxDxEdnehWIMGqF1oS+e2kOEcjU7xV2XyJVnEk7hErQJ
         xGHr/fH/XXF1hsXmcgF3GHrUt1tX3U0al/35G1JGOZwMBrBUZbULhjmJaK5L9PVUNSqc
         WcGw==
X-Gm-Message-State: AOAM532RPQ2Q3FBSQnf9HwrVUBPpS5hY6h+LDZIrl/I49Uf2sndLhpXz
        3GIs/JNg71aBWTX3cS2HrLYZPg==
X-Google-Smtp-Source: ABdhPJzIBkieQHc9PjOpsuJ6CI5QANcRmne2ZWNze4X1SeO0kkq8Z+AU42eLrjQVsNANiTFEkEMD4Q==
X-Received: by 2002:a5d:6b8d:: with SMTP id n13mr9642717wrx.258.1625817752223;
        Fri, 09 Jul 2021 01:02:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z13sm4701195wro.79.2021.07.09.01.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 01:02:31 -0700 (PDT)
Date:   Fri, 9 Jul 2021 10:02:28 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Pekka Paalanen <ppaalanen@gmail.com>
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
        Chen-Yu Tsai <wens@csie.org>,
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
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Robert Foss <robert.foss@linaro.org>,
        Qiang Yu <yuq825@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH v5] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YOgClII3UwckkPkb@phenom.ffwll.local>
References: <20210706161244.1038592-1-maxime@cerno.tech>
 <20210709102444.7a72a029@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709102444.7a72a029@eldfell>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 09, 2021 at 10:24:44AM +0300, Pekka Paalanen wrote:
> On Tue,  6 Jul 2021 18:12:44 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
> 
> > New KMS properties come with a bunch of requirements to avoid each
> > driver from running their own, inconsistent, set of properties,
> > eventually leading to issues like property conflicts, inconsistencies
> > between drivers and semantics, etc.
> > 
> > Let's document what we expect.
> 
> ...
> 
> > Changes from v4:
> >   - Changes suggested by Pekka
> > 
> > Changes from v3:
> >   - Roll back to the v2
> >   - Add Simon and Pekka in Cc
> > 
> > Changes from v2:
> >   - Take into account the feedback from Laurent and Lidiu to no longer
> >     force generic properties, but prefix vendor-specific properties with
> >     the vendor name
> > 
> > Changes from v1:
> >   - Typos and wording reported by Daniel and Alex
> > ---
> >  Documentation/gpu/drm-kms.rst | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index 87e5023e3f55..47994890fd1e 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -463,6 +463,36 @@ KMS Properties
> >  This section of the documentation is primarily aimed at user-space developers.
> >  For the driver APIs, see the other sections.
> >  
> > +Requirements
> > +------------
> > +
> > +KMS drivers might need to add extra properties to support new features.
> > +Each new property introduced in a driver need to meet a few
> > +requirements, in addition to the one mentioned above:
> > +
> > +* It must be standardized, documenting:
> > +
> > +  * The full, exact, name string;
> > +  * If the property is an enum, all the valid variants name;
> 
> Hi,
> 
> "variant" feels a little off to me, I would have used "value name
> strings".
> 
> > +  * What values are accepted, and what these values mean;
> > +  * What the property does and how it can be used;
> > +  * How the property might interact with other, existing properties.
> > +
> > +* It must provide a generic helper in the core code to register that
> > +  property on the object it attaches to.
> > +
> > +* Its content must be decoded by the core and provided in the object's
> > +  associated state structure. That includes anything drivers might want
> > +  to precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for
> > +  planes.
> > +
> > +* Its initial state must match the behavior prior to the property
> > +  introduction. This might be a fixed value matching what the hardware
> > +  does, or it may be inherited from the state the firmware left the
> > +  system in during boot.
> 
> I'd like to point out that this rule should apply also to
> properties that already exist in general, but are newly exposed in a
> driver for hardware that didn't expose the property before.

I think we should just make this a very strong recommendation, and in
general encourage people to use the tests against their driver?

Otherwise a small "I'll just enable this" thing can become a huge project.
And in general I think grandfathering existing things in is the pragmatic
choice.

But maybe that could be a follow-up patch?
-Daniel

> 
> > +
> > +* An IGT test must be submitted where reasonable.
> > +
> >  Property Types and Blob Property Support
> >  ----------------------------------------
> >  
> 
> Regardless of my comments above:
> 
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> 
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
