Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEC2C48BE5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 15:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63256613EE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 15:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbhFKP2U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 11:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhFKP2S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 11:28:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D13C061574
        for <linux-doc@vger.kernel.org>; Fri, 11 Jun 2021 08:26:20 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id y7so6500694wrh.7
        for <linux-doc@vger.kernel.org>; Fri, 11 Jun 2021 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0fXaAQCav4JMHqqDLTmJAA9vL2ofAn8LFVDAYy3FosU=;
        b=RxaoGZB9PdBO2obWWr9Son1CIQ7DAYfphJ4uKNVobOiYpJ+mmavn7NB0YtCHIT1l1D
         oQsizyYQ4FJRefvQAFJO/0AJOav1E/ofoqH4paJ297oy93lpQ3e896974RQ7zKVhhvb1
         oqY38pf1DVDLn5a35cw/r70vfWSV/1SHhcR0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0fXaAQCav4JMHqqDLTmJAA9vL2ofAn8LFVDAYy3FosU=;
        b=d5XOickvhI3ZtxUKnL1ZYIf4E31j1LW4rSOJk/Wz7NEsLarpPh0E17cQNhPdpNTcpw
         JXUUxoR418ftD0UwqoOSVkjzDjaKU5ESBOKYOSiMtVPBCGoqoweaaFAf/gy/EzDJVr8g
         uS5KlOeR8vqmW9LRTOdqP7z4wSkvIIIgyJ9fE0I9uOcQeRDQ0ri1b/f0w3ywRBXc5xsG
         hgIS3kwtobKShwFN5KMb1swmdeYNk+bEf4B5+Q8uFbPaYguY3rDoUEH1fx8HIGob2SIs
         Z4IFqc3zsdAzha+GmRLzg2RjdNT0zP6SSfAk9Mzk3/pJzE6HP99P78ZB1GJD7lyvO6oS
         5Mwg==
X-Gm-Message-State: AOAM531+UvHP3cRkly4bPkb90DNmFPk4C3zzK0XxLZKk8uAU9k4mgOJI
        85O7Q/+H1clZx6sxZLVzzrUklQ==
X-Google-Smtp-Source: ABdhPJw2KFr1zO8QQtfKE4YD9azGDVISyK9XC85GcDukXzrthZ23Yp2apTf9M28mUBh5xZI3M9Pdgw==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr4768390wrq.82.1623425179113;
        Fri, 11 Jun 2021 08:26:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h11sm6267937wmq.34.2021.06.11.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 08:26:18 -0700 (PDT)
Date:   Fri, 11 Jun 2021 17:26:14 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
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
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMOAlqwTE6exJtQA@phenom.ffwll.local>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <20210611055407.aoeams62wbalodrj@gilmour>
 <1cac781e-122f-568b-5f5a-7e0ceb94bd0b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cac781e-122f-568b-5f5a-7e0ceb94bd0b@ideasonboard.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 09:53:19AM +0300, Tomi Valkeinen wrote:
> On 11/06/2021 08:54, Maxime Ripard wrote:
> > Hi,
> > 
> > On Thu, Jun 10, 2021 at 11:00:05PM +0200, Daniel Vetter wrote:
> > > On Thu, Jun 10, 2021 at 7:47 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > 
> > > > New KMS properties come with a bunch of requirements to avoid each
> > > > driver from running their own, inconsistent, set of properties,
> > > > eventually leading to issues like property conflicts, inconsistencies
> > > > between drivers and semantics, etc.
> > > > 
> > > > Let's document what we expect.
> > > > 
> > > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: Alison Wang <alison.wang@nxp.com>
> > > > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > > Cc: Brian Starkey <brian.starkey@arm.com>
> > > > Cc: Chen Feng <puck.chen@hisilicon.com>
> > > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > > > Cc: Eric Anholt <eric@anholt.net>
> > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > > Cc: "Heiko Stübner" <heiko@sntech.de>
> > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > > > Cc: Inki Dae <inki.dae@samsung.com>
> > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > > > Cc: Joel Stanley <joel@jms.id.au>
> > > > Cc: John Stultz <john.stultz@linaro.org>
> > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > > > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > > Cc: Marek Vasut <marex@denx.de>
> > > > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > > Cc: "Noralf Trønnes" <noralf@tronnes.org>
> > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > > Cc: Paul Cercueil <paul@crapouillou.net>
> > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Cc: Qiang Yu <yuq825@gmail.com>
> > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > Cc: Robert Foss <robert.foss@linaro.org>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Roland Scheidegger <sroland@vmware.com>
> > > > Cc: Russell King <linux@armlinux.org.uk>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Sandy Huang <hjc@rock-chips.com>
> > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: Stefan Agner <stefan@agner.ch>
> > > > Cc: Steven Price <steven.price@arm.com>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Tian Tao <tiantao6@hisilicon.com>
> > > > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > > Cc: Tomi Valkeinen <tomba@kernel.org>
> > > > Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> > > > Cc: Xinliang Liu <xinliang.liu@linaro.org>
> > > > Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > > > Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> > > > Cc: Zack Rusin <zackr@vmware.com>
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > 
> > > > ---
> > > > 
> > > > Changes from v2:
> > > >    - Take into account the feedback from Laurent and Lidiu to no longer
> > > >      force generic properties, but prefix vendor-specific properties with
> > > >      the vendor name
> > > 
> > > I'm pretty sure my r-b was without this ...
> > 
> > Yeah, sorry. I wanted to tell you on IRC that you wanted to have a
> > second look, but I shouldn't have kept it and caught you by surprise
> > indeed.
> > 
> > > Why exactly do we need this? KMS is meant to be fairly generic (bugs
> > > throw a wrench around here sometimes, and semantics can be tricky). If
> > > we open up the door to yolo vendor properties in upstream, then that
> > > goal is pretty much written off. And we've been there with vendor
> > > properties, it's a giantic mess.
> > > 
> > > Minimally drop my r-b, I'm definitely not in support of this idea.
> > 
> > So the argument Lidiu and Laurent made was that in some cases, getting a
> > generic property right with only a couple of users is hard. So they
> > advocated for the right to keep non-generic properties. I can get the
> > argument, and no-one else said that was wrong, so it felt like the
> > consensus was there.
> 
> I also think that (maybe mainly on embedded side) we may have 1) esoteric HW
> features which perhaps can't even be made generic, and 2) features which may
> or may not be generic, but for which support cannot be added to any common
> opensource userspace projects like X or Weston, as the only use cases for
> the features are specialized low level apps (often customer's closed-source
> apps).
> 
> While I agree with Daniel's "gigantic mess" problem, it would also be quite
> nice to have a way to support all the HW features upstream instead of
> carrying them in vendor trees.

So this means to be able to accomodate this "vendor properties are totally
fine, go wild" exception we also need to throw "open source userspace
user, fully reviewed and tested" into the drink?

At least my experience from what I've seen with funky vendor properties
isn't so much that we can't figure out a reasonable way to expose them.
The problem is that the userspace tends to be a (often closed source)
vendor fork of a random compositor somewhere. So if that requirement is
somehow a problem, we need to talk about _that_.

Not promising we'll totally merge some vendor properties without spelling
out what exactly this means. All that ensures is that people submit
patches and then get annoyed because they still can't be merged because
the userspace situation is all the same.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
