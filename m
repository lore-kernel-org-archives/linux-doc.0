Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20993C6377C
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 15:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 084DC610CC
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 15:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbhGTOYB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jul 2021 10:24:01 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:37787 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239685AbhGTNzV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jul 2021 09:55:21 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id EB78C58163F;
        Tue, 20 Jul 2021 10:35:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 20 Jul 2021 10:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm3; bh=8d3zppFVdwGuGLFhPfwVFySC3u
        OuzVXX0I8FJz2/A0w=; b=ndtTPryC5MEvxCMsHG3lo2V3s9M6y6hiUsb7YYdd95
        RTf0crHdrUjSdBwOvvO8BpYJ2HNKPMyAMbUkVfhapx9XJmteRtpdt8SvpEzS+ZbQ
        FnV9EU3dbZCtlb6V4l81gsIf9xrPjs0SbjZ+hhkijtEqh56N/6GbkF2kzNUnrOEW
        cXCWaDvH2caMaf7GQu+ncOxZ7m3TXM6wZEqI+CdhcbeZsvAeXl5TALZj0VD0esAH
        ZlDi5TSGMQCUD2rViWCA2D8ilKQKYOvFMY+e1vmbgyb1XzCszxhBG5/zscFw9lzM
        Y6XTM0Ii4DBXGk9ovl+5LN82jXWWK65fUjS17iO3EUlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8d3zpp
        FVdwGuGLFhPfwVFySC3uOuzVXX0I8FJz2/A0w=; b=PqB7lpk3A/DKDC67QUWSTT
        B9OQaYUaNbLr4bnzPDs0m/U7FXx8AGjuxxpOzOAGr5kU3cuoYBwSOXI2HwgcCeSb
        9MgKu04Lt52t49aEZhopWeCNV8V8nmYlpMbdI6uvypGGsFR0f9Wyv5S1SbGw6OSq
        MvtUbBvBs2RTut7PU+Rd2+N1LzUt7xklyP08z3c0zR4PwojMrIQilh0Ju6WixTdS
        t+8BQR/RYr1d2CCyGFMeLRHQ1MzAEyDQvHN75GCzsp9iJV417Df9QrpwYNe0xbie
        bD/PMAd7vETPI51YkdJrS412/LadOuBL3TOkr4w11LrXoudrIbsXU8/qEo6USppQ
        ==
X-ME-Sender: <xms:Rd_2YKlKOkKfn2v0b-K2Aoc9CM0WFTKvw-AlRW61Cc2MZ1sc3l67rw>
    <xme:Rd_2YB28pzuvm14AwzcMRt1BzUWjF1rxzXQIRQRkrG_toqYEsVZl-GtxrnG2wFYdI
    KFhL92uuPFzpZridK4>
X-ME-Received: <xmr:Rd_2YIp-iaEKLM3yn96gLaRnyzxDUqtFqzsf0douCDhcdwAozkkYBFRBOv5frcz0LmtoXnjbxIFfHdRV62p06gMNbMssNGG0yXSY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhephedvgfeujefgfefhleefjedtteduvdfftdetgffgfedtgfffkeelfeejvdegiefh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
    himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Rd_2YOlIVudryxhI_c-917tbrIiBHp4T6t8V4HqFXjY9Rj_6v3_4MQ>
    <xmx:Rd_2YI0lToYfmPjHhx0LM9AVT0rLJI_uNq6vF3u1Ytf2ebvK2csJYg>
    <xmx:Rd_2YFtH5cmy7w2pAmLDfhjae3_E5Vj3b34k7JXewHuMOrXHVr1_Vg>
    <xmx:Tt_2YLeVbxAJHIBTPIPbUluVTzd35ZJfmJg07rzZ9UhRwg9XXAB1EQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 10:35:48 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
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
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
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
Subject: [PATCH v6] Documentation: gpu: Mention the requirements for new properties
Date:   Tue, 20 Jul 2021 16:35:44 +0200
Message-Id: <20210720143544.571760-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

New KMS properties come with a bunch of requirements to avoid each
driver from running their own, inconsistent, set of properties,
eventually leading to issues like property conflicts, inconsistencies
between drivers and semantics, etc.

Let's document what we expect.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alison Wang <alison.wang@nxp.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Edmund Dea <edmund.j.dea@intel.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sean Paul <sean@poorly.run>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simon Ser <contact@emersion.fr>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Zack Rusin <zackr@vmware.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v5:
  - Typos fixes suggested by Pekka and Daniel
  - Added Pekka Reviewed-by

Changes from v4:
  - Changes suggested by Pekka

Changes from v3:
  - Roll back to the v2
  - Add Simon and Pekka in Cc

Changes from v2:
  - Take into account the feedback from Laurent and Lidiu to no longer
    force generic properties, but prefix vendor-specific properties with
    the vendor name

Changes from v1:
  - Typos and wording reported by Daniel and Alex
---
 Documentation/gpu/drm-kms.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 87e5023e3f55..12e25119e563 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -463,6 +463,35 @@ KMS Properties
 This section of the documentation is primarily aimed at user-space developers.
 For the driver APIs, see the other sections.
 
+Requirements
+------------
+
+KMS drivers might need to add extra properties to support new features. Each
+new property introduced in a driver needs to meet a few requirements, in
+addition to the one mentioned above:
+
+* It must be standardized, documenting:
+
+  * The full, exact, name string;
+  * If the property is an enum, all the valid value name strings;
+  * What values are accepted, and what these values mean;
+  * What the property does and how it can be used;
+  * How the property might interact with other, existing properties.
+
+* It must provide a generic helper in the core code to register that
+  property on the object it attaches to.
+
+* Its content must be decoded by the core and provided in the object's
+  associated state structure. That includes anything drivers might want
+  to precompute, like struct drm_clip_rect for planes.
+
+* Its initial state must match the behavior prior to the property
+  introduction. This might be a fixed value matching what the hardware
+  does, or it may be inherited from the state the firmware left the
+  system in during boot.
+
+* An IGT test must be submitted where reasonable.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.31.1

