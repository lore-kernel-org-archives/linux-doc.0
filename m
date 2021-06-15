Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F17C48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 12:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B9BF61461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 12:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhFOMQE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 08:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhFOMQD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 08:16:03 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CA5C061574
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 05:13:58 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id g20so22300587ejt.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=1xUcdoU0rgH6jjTSj2XB1E78P9DWja+pl0vW8u+yUME=;
        b=loh2Rs1j+aBMTB7nwR1wvQdD871fGH12MVpbxkvb/HGtKVG5YUTUDbVx7OK9O23RHD
         CO0miiJiQwtvZ2Fizq52zvuPBeSfpHO2XkfnKUvu6P8nboa9/9qGPqVH7ov6QX0XBct5
         whgtfm1JxRtHiIcp4i9uB6ShT8tZkLSkFrmEvTn7kMbWQYapbcyOxKJ/rQlHwTQr941z
         v1aYcwND+61o78Dfd5AfNUjMVbz+6ucdAuQUdtrk+ANUquE8zOT1BUq9+v4zJt/lJKNF
         Imo1V3MbWn+DhBr3Xi1SDR30eAO2bqjLM0s928uFaSMDjyRHcvEiWJg932IIK9v8JBRM
         KPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=1xUcdoU0rgH6jjTSj2XB1E78P9DWja+pl0vW8u+yUME=;
        b=hq68biqReicqWlHpt7eZ0IDB9eQifAeGXl0Wz0IZAP0kDF2xPCUQoQiKUKPTlFWz9D
         GaA+L0rDZGH8GXDHbKoEIkj0taQLAcRs1RxXeYbd5S7IbSoBOdlUctPkMPjSs3kja1XZ
         k3xfQ5XNu8R1ePamUL6qR3OuWT84ss7mi5B5Vj0gsIraUgNmCsJdMumFFJjPOY2REl0W
         0CpzyxxNzrpM/2EKdn3PNgcUlj1lmq5fHHFx8ZYxE1iCDUtgPhcrxTVXpTksJt2B89qz
         om1fYZcr/Lw1PLc/d+vkIGnXFM9x6SjdSz0242zrYt8ylsbNnOJKnSLWqWo/zSPYLIS2
         SQDw==
X-Gm-Message-State: AOAM533nLdwFFQod4XWk4XF7wgHg7I3GUeo8awDupio1mFf1fpior/Ra
        lO3z1XyKCuChtluia11zu0I=
X-Google-Smtp-Source: ABdhPJyVl/Us4ycZpKhFtZUdcJ/KKU637NmPeEn55W0oyLi7vLmz4aF3vWo84Ws3DTmeFHKHVmceuA==
X-Received: by 2002:a19:7d82:: with SMTP id y124mr15068746lfc.76.1623752229076;
        Tue, 15 Jun 2021 03:17:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id z20sm2118351ljk.50.2021.06.15.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 03:17:08 -0700 (PDT)
Date:   Tue, 15 Jun 2021 13:16:56 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Simon Ser <contact@emersion.fr>, Liviu Dudau <liviu.dudau@arm.com>,
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
        Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210615131656.2ecefdc4@eldfell>
In-Reply-To: <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
        <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
        <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
        <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
        <20210614174912.15a49336@eldfell>
        <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
        <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
        <20210615100335.0b8f96d5@eldfell>
        <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
        <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aSclia/U0zdUZzWMZ0xn.Ur"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/aSclia/U0zdUZzWMZ0xn.Ur
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Jun 2021 12:45:57 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote:
> > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:
> >  =20
> > > indeed it will, but what else could one do to test userspace KMS
> > > clients in generic CI where all you can have is virtual hardware? May=
be
> > > in the long run VKMS needs to loop back to a userspace daemon that
> > > implements all the complex processing and returns the writeback result
> > > via VKMS again? That daemon would then need a single upstream, like t=
he
> > > kernel, where it is maintained and correctness verified. =20
> >=20
> > The complex processing must be implemented even without write-back, bec=
ause
> > user-space can ask for CRCs of the CRTC.
> >  =20
> > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtual
> > > stuff in userspace? Didn't someone already have something like that?
> > > It would need to be lifted to be a required part of kernel UAPI
> > > submissions, I suppose like IGT is nowadays. =20
> >=20
> > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near a f=
ull
> > software implementation with write-back connectors, but allows to expose
> > virtual planes and check atomic commits in CI.
> >=20
> > [1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm_moc=
k.c
> >  =20
> > > For compositor developers like me knowing the exact formulas would be=
 a huge
> > > benefit as it would allow me to use KMS to off-load precision-sensiti=
ve
> > > operations (e.g.  professional color management). Otherwise, composit=
ors
> > > probably need a switch: "high quality color management? Then do not u=
se KMS
> > > features." =20
> >=20
> > I think for alpha blending there are already rounding issues depending =
on the
> > hardware. I wouldn't keep my hopes up for any guarantee that all hw use=
s the
> > exact same formulae for color management stuff. =20
>=20
> Good, because otherwise you would be very quickly disappointed :-)
>=20
> For scaling we would also need to replicate the exact same filter taps,
> which are often not documented.

That is where the documented tolerances come into play.

Userspace projects need screenshot-based testing, and we need to know
how much tolerance we should allow or expect.

Good reminder about CRCs. CRCs have zero tolerance, so they are not
useful for testing properties that have any leeway, are they?


Thanks,
pq

--Sig_/aSclia/U0zdUZzWMZ0xn.Ur
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDIfhgACgkQI1/ltBGq
qqf9uw//Z7wP5lb4lQfPWOw5s+nFR9pu8B8zVwQzEuz2RTx5Vc/XXfa2Fc0rukCj
Y380sIPdp2+avUNDyitBKW8E7rU3mab7UmBdn6CmLnvZVM+BQ3vdtDvZ2WfezT7j
AkEzJYm9QhiYyqezwzCa1Jo2ugUJwSxT6TKQbVsT64vCCajdZIQJvDizCPy0HNvY
/dncTRXyWta650vMnzYle6YlWrYL+kJst8J/zU5+H3nffgJef6zpxz+o37Libz/w
WYZWYSJ7swv54xNCddkuJrSf60vs7KlwiXZuBEt5dSu2ro81unrU6FVpEazF8x1e
3jigPFgMppxYTIVOGtrjbQku7hJB1f9u+DNGjKTeH8HMc0QkAfcb+V7nrmaetZs6
02GvihbFh67ewL7hcIXVpNETdsfQD3pVCDz1Xz6w5A6bixa0HuH31C3ATBhUuKhH
tJNv99eZvmfBIaeuFNkCgPbxP2vdFmStT1x/bq06g+2RCG71+EzkKF6hX0JD+kRf
CqRqBDvwNy4sXgDkwz+ftpHrn+OvO7LrR4X5NtZUeo24VaXlrJTqqX5lSHr6OgZg
oREPacO/pUjTluJY+sb+qUBkxTcu9hP5MC5LnHvtiQ2yxWel2Wp+MOF42Sl2B98w
jTfx9rHSqauMN7hs33K2UBnAcpf2sswYagwmg0clpgF/ipcJ96k=
=4xXK
-----END PGP SIGNATURE-----

--Sig_/aSclia/U0zdUZzWMZ0xn.Ur--
