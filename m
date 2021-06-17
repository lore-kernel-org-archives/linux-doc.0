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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F7CC2B9F4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 09:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93F5E6023F
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 09:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhFQJMf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 05:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbhFQJMe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 05:12:34 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11B0C061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 02:10:26 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e22so2282007wrc.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=2HjwvT+SV5+/NgCoeu9k5QwUA4VIDEdumWwRrwq0kqk=;
        b=IjG2/5BOiWh4J/EZL9lyBLtOQ+l9zGj2pUo5V1uoSqPKU3/qS1ogqr4zGXA1b5MfiW
         Bm911EzAiCBQ/NtAPLLVk1GRQjSHxuZKl+tEoC41CiuUWUJPucyfvooFrXjLW7cYSf1P
         qMKwR746tIAP49KzjmemjSmUPkj8rxKR0aYaK95R0m5KYow/gCJpNevDMsraxp7jv/lq
         alwx/jqb0U/RTgo6/WBJ/gZtTxJXCKNYayb34AKQnFwO6ydxFuyv9QLtv/lp7ZMao/4y
         LTga6unHMop7t5uLyyO3JDfjOs/5h7byspS+IGF3NAIfpZ8+/DjvFaeZeYaFwforhOXI
         SFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=2HjwvT+SV5+/NgCoeu9k5QwUA4VIDEdumWwRrwq0kqk=;
        b=l6RWrNYTEytclyWhXoNHgYWjMDtv0+X7n9gv77f2Y0FbKODRFOMFbkv61rsshn8H//
         SKFW+XKDPS2i2CJ/teyLrtgR1jBDXKyei/AF7Tqwlvc6H+mCJ2Nnk851l4U/zj6DREq9
         SClus+H4BNeSm2zOJH0IGb+bv6Rz7s2HaJ81L67tKTHw9Jm/CanuHBuXo7FXVIbaUWoS
         iXhaoRlBxX7gOXdB8GZXwRW2+snmmXtmsBMz+dUE5Qzb28Hamt5TEu5MiBSbFM7u4upu
         JWm6x16CKlmy8CDhHO+yV2vtRNzn04pCMhKVd8+q6d6o194zDpgliCDL1U01uXi7tVWg
         l/Eg==
X-Gm-Message-State: AOAM533xisK9WDa99x7K/NjPnPpawrmrKKdMktcIGMv1TN/oOLXb+85L
        8kdJbGu8KjQ4YJfkxCmiZOs=
X-Google-Smtp-Source: ABdhPJzU1Ppf+JWgqlR+K1m3CQOUVFDedVECYutiw3EohMlCte3llAtBfNmj9OVMU1JFefVOsM9PZA==
X-Received: by 2002:a19:6a0e:: with SMTP id u14mr3010213lfu.184.1623914835517;
        Thu, 17 Jun 2021 00:27:15 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id c9sm546233ljr.104.2021.06.17.00.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 00:27:15 -0700 (PDT)
Date:   Thu, 17 Jun 2021 10:27:01 +0300
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
Message-ID: <20210617102701.28f820b2@eldfell>
In-Reply-To: <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
References: <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
        <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
        <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
        <20210614174912.15a49336@eldfell>
        <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
        <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
        <20210615100335.0b8f96d5@eldfell>
        <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
        <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
        <20210615131656.2ecefdc4@eldfell>
        <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d.Guy7TlX58IGrQiolhw1zS"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/d.Guy7TlX58IGrQiolhw1zS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Jun 2021 00:05:24 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:
> > On Tue, 15 Jun 2021 12:45:57 +0300 Laurent Pinchart wrote: =20
> > > On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote: =20
> > > > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen wrote:
> > > >    =20
> > > > > indeed it will, but what else could one do to test userspace KMS
> > > > > clients in generic CI where all you can have is virtual hardware?=
 Maybe
> > > > > in the long run VKMS needs to loop back to a userspace daemon that
> > > > > implements all the complex processing and returns the writeback r=
esult
> > > > > via VKMS again? That daemon would then need a single upstream, li=
ke the
> > > > > kernel, where it is maintained and correctness verified.   =20
> > > >=20
> > > > The complex processing must be implemented even without write-back,=
 because
> > > > user-space can ask for CRCs of the CRTC.
> > > >    =20
> > > > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtu=
al
> > > > > stuff in userspace? Didn't someone already have something like th=
at?
> > > > > It would need to be lifted to be a required part of kernel UAPI
> > > > > submissions, I suppose like IGT is nowadays.   =20
> > > >=20
> > > > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near=
 a full
> > > > software implementation with write-back connectors, but allows to e=
xpose
> > > > virtual planes and check atomic commits in CI.
> > > >=20
> > > > [1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm=
_mock.c
> > > >    =20
> > > > > For compositor developers like me knowing the exact formulas woul=
d be a huge
> > > > > benefit as it would allow me to use KMS to off-load precision-sen=
sitive
> > > > > operations (e.g.  professional color management). Otherwise, comp=
ositors
> > > > > probably need a switch: "high quality color management? Then do n=
ot use KMS
> > > > > features."   =20
> > > >=20
> > > > I think for alpha blending there are already rounding issues depend=
ing on the
> > > > hardware. I wouldn't keep my hopes up for any guarantee that all hw=
 uses the
> > > > exact same formulae for color management stuff.   =20
> > >=20
> > > Good, because otherwise you would be very quickly disappointed :-)
> > >=20
> > > For scaling we would also need to replicate the exact same filter tap=
s,
> > > which are often not documented. =20
> >=20
> > That is where the documented tolerances come into play. =20
>=20
> This is something I've experimented with a while ago, when developing
> automated tests for the rcar-du driver. When playing with different
> input images we had to constantly increases tolerances, up to a point
> where the tests started to miss real problems :-(

What should we infer from that? That the hardware is broken and
exposing those KMS properties is a false promise?

If a driver on certain hardware cannot correctly implement a KMS
property over the full domain of the input space, should that driver
then simply not expose the KMS property at all?

But I would assume that the vendor still wants to expose the features
in upstream kernels, yet they cannot use the standard KMS properties
for that. Should the driver then expose vendor-specific properties with
the disclaimer that the result is not always what one would expect, so
that userspace written and tested explicitly for that hardware can
still work?

That is, a sufficient justification for a vendor-specific KMS property
would be that a standard property already exists, but the hardware is
too buggy to make it work. IOW, give up trying to make sense.

I would like to move towards a direction where *hardware* design and
testing is eventually guided by Linux KMS property definitions and
their tests. If we could have a rule that if a driver cannot correctly
implement a property then it must not expose the property, maybe in the
long term that might start having an effect?

My underlying assumption is that generic userspace will not use
vendor-specific properties.

Or, since we have atomic commits with TEST_ONLY, should it be driver's
responsibility to carefully inspect the full state and reject the
commit if the hardware is incapable of implementing it correctly?
Vendor-specific userspace would know to avoid failing configurations to
begin with. I suppose that might put an endless whack-a-mole game on
drivers though.


Thanks,
pq

--Sig_/d.Guy7TlX58IGrQiolhw1zS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDK+UUACgkQI1/ltBGq
qqd4jg/9Gz/McKt8xwdcttPaWFXB9ivvFWRu0kt8hZTrY263TnycqkKFoG66ZY3X
Apy1WGcub+AJdi/ajH+AexOSwViT5cO6CUHVBc9MldtPjQFjtxbZxh3GVYW+Pg5Y
OM1HqI8pDA2z0qEMgWvzb+v3nimdgdlRAw47tXWIoj1xlbtjEhJTSTyb6YrlmJq5
KfiFQ6iC26gUY9UFyDrg5zkzvjYzVFt6+B4fLJovNzsZN3funJkrh1kWiHckpcHk
YfeT7Z03FAcWp/L2PrLOskCe6aJ8ds4DzLAmxPCJVoSR6MdQX49ZmRKiNHryiXg7
K//IDmhM59dDfuFIllv0XqM1/xeEiycZ9E5rS0wwZp9MnHUppmV58r6hg9NkrU2Q
sRIkh0gcFDTz55o5Pc3gULoQh6klV3LIKUjbqm0ulynSDpe7yfRAISwYDhJTUmSu
HPWfSJN2duDXV8OKZNDQHTBqqhgQENkjfJNAswZxGAstWo+KaXCjNdg0cUV91Ick
wsUZd7CVoLtsalDN0BmD/IdvwppwqxBjEJg4g+PhvxSLojUlxxf+rkf+jM9SYknW
2FYhEZ4pI88Z9XpJy8MlPicW0EqL6UppWyECGwTFjPPd7IEsT+IRvxWV+GjegOtN
YjAmqWraLFf0RiTwF1Qq3riHAmcGqG5rMQNnAnRVrD4SLP6nCsQ=
=XQ+7
-----END PGP SIGNATURE-----

--Sig_/d.Guy7TlX58IGrQiolhw1zS--
