Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E15BC2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 14:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 733C86128B
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 14:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhFNOvh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 10:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbhFNOve (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 10:51:34 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC8CC061574
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 07:49:19 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id v22so21598719lfa.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=Y92uEa6Ng6L8nssFn3ifSjrubFH60zO3GKp2+iBw/qQ=;
        b=GY4N4KkKAumGPOM/b/0lzSXi40kXMP8bzKjynpVYem+oVqmCdpSKbfmVrji7/lNJe5
         VjpMMTX4fTeFbKN+BtJ8mgLEYSyYTaqODwAevMYF9BUtcOj9jc8djW9Yrt3foTB568p2
         wQPgZQntGN5ZZnFXN27gDHTgIwaAT0APKPyrGlEhYtCzGutXf1Vg6SDPGaZypojxISdY
         m5iMqXQBZ7UGdDHOcjuxzMS7TCPhFsqbQdR/xoj4asMLPkd8ZZLhvmOz5/acAEp9XL6v
         svP8iWbbaLLZeBqpE0aRJ/tDj1ytPUXjNBNCNJBs6l6lHuVx3Pv9BM++YR3cCg6ju6wT
         9+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=Y92uEa6Ng6L8nssFn3ifSjrubFH60zO3GKp2+iBw/qQ=;
        b=BkraU6uCwBcP+qw9O2DtGvPmIJn6Ivudf1R74Lc8cqGaeEJvG5lXtOfMDOs7HxtryS
         ynorDPWofHpWUtFF0ncJKtl54wmr1V8va9TMsHeEdsygvFVjXtbRM9FYiiq7aei35Fb2
         Ou6kJ61UNc2e6PTs1TOF4+pEECpcvkXI4N+y/MiBc8hy9nQ2zPPzFwFAhEZx8JBsDRHn
         kigUjzUZdpBjvdAniYsVgb+i2tfPgABtNd6/cBV/ZQRzjP9QLn2h2KptUnhQpsdELjyO
         6f8fH7T6u8k6300i9IEGtAeIcoJua9emjO8L2lMTlgryF66oGqV4LsD1ir8BH4WdGaoL
         eqlA==
X-Gm-Message-State: AOAM533j5kg1SOEphEolprEwLdDtCvUzpJBj91BcNAoNkL6Z9ZxsfYZR
        EDXafN6qgJXzFABpmdb/R5c=
X-Google-Smtp-Source: ABdhPJw0cEa/ci8Lg7+cwTs1zmvhFaYzrmwkLmfTPGFHNy4R09D/xkuCKqHRvew/BeM8LhfVNaB+6w==
X-Received: by 2002:ac2:4f92:: with SMTP id z18mr11796592lfs.343.1623682157956;
        Mon, 14 Jun 2021 07:49:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id y8sm1501618lfj.192.2021.06.14.07.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 07:49:17 -0700 (PDT)
Date:   Mon, 14 Jun 2021 17:49:12 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Liviu Dudau <liviu.dudau@arm.com>
Cc:     Simon Ser <contact@emersion.fr>,
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
Message-ID: <20210614174912.15a49336@eldfell>
In-Reply-To: <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
        <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
        <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
        <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s_k7/+lmfJUhN.4iHZeKmlr"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/s_k7/+lmfJUhN.4iHZeKmlr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Jun 2021 13:03:09 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Fri, Jun 11, 2021 at 08:14:59AM +0000, Simon Ser wrote:
> > On Thursday, June 10th, 2021 at 23:00, Daniel Vetter <daniel.vetter@ffw=
ll.ch> wrote:
> >  =20
> > > If there's a strong consensus that we really need this then I'm not
> > > going to nack this, but this really needs a pile of acks from
> > > compositor folks that they're willing to live with the resulting
> > > fallout this will likely bring. Your cc list seems to have an absence
> > > of compositor folks, but instead every driver maintainer. That's
> > > backwards. We make uapi for userspace, not for kernel driver
> > > maintainers! =20
> >=20
> > In wlroots we have a policy of only allowing standard KMS properties to
> > be used. Any vendor-specific property is going to be less well-defined,
> > less widely useful, potentially have more design issues, potentially
> > overlap in functionality with other vendor-specific properties, likely
> > have some hardware-specific assumptions, etc.
> >=20
> > What matters here is discussing with other driver & user-space folks to
> > make sure the new property's design is sound. Designing uAPI is hard.
> >=20
> > If kernel folks are struggling with a user-space implementation, they
> > should discuss with user-space folks to see which project would be
> > interested. There's a chance a compositor will be interested in the new
> > property and will just do the user-space part for you, if not we can
> > suggest candidate projects.
> >=20
> > tl;dr strong agree with Daniel here. =20
>=20
> I think the assumption you and Daniel are making is that the first implem=
entation of
> a new KMS property can be made standard from day one and that it will wor=
k for any
> late comer driver as is, without having to make changes to its behaviour =
in a
> significant way. In my experience that is not the case.
>=20
> I think we have moved from the times when we were trying to implement in =
the Linux
> world features that were available in the hardware but needed a kernel an=
d userspace
> API. The set of properties that exist in KMS cover a lot of needed functi=
onality and
> I don't expect to see new properties for stuff that is already supported =
by hardware.
>=20
> What I'm expected to see in the future is new functionality that gets imp=
lemented by
> one hardware vendor and the kernel developers trying to enable that for u=
serspace. It
> could be that the new property is generic, but there is no way of testing=
 that on
> more than one implementation yet, so I'd say we are generous calling it "=
standard
> property". When the second or third hardware vendor comes along and start=
s supporting
> that property with their own set of extra requirements, then we can call =
it
> "standard".

I agree that is a problem with trying to make generic anything. But it
does not mean you should not even try. Maybe trying really hard saves a
couple revisions.

What I think should be planned for is revisions. How to add new
properties that do the same thing but better, while documenting that a
userspace KMS client can use only one revision at a time. You never
remove old revisions, unless maybe with a DRM client cap they
could disappear from that file description if that is necessary for
seeing the new revision.

While designing this, one also needs to take into account that KMS
clients need to be able to save and restore properties *they do not
understand*. So exposing two revisions of the same feature
simultaneously would break save/restore is that's an error.

> Then comes the effort cost: would it be easier to start with a vendor
> property that only the vendor needs to support (and can submit patches in=
to the
> compositors to do so) and when the standard property gets added moves to =
that, or

But you can't move, you can only add? You can't delete the old property
in kernel if it was ever released with a kernel and anyone used it. In
the same sentence you also imply that there is a user of it, so
removing it will break that user. Then you'll have to track the
userspace lifetime to figure out which decade you can try removing it.

> should we start with a generic property that gets implemented by the comp=
ositors
> (maybe, but then only one vendor supports it) and then later when we actu=
ally
> standardise the property we will have to carry backwards compatibility co=
de in the
> kernel to handle the old behaviour for old userspace? My proposal to Maxi=
me was for
> the former option to be reflected in the documentation, but I would like =
to hear your
> thoughts.

You have to carry the backward compatibility in all cases, right?

Userspace OTOH can drop support for older less supported KMS properties
while taking advantage of a new revision. Userspace is not required to
support old kernels forever.


Here's a wild counter-proposal off a tangent:

How about we make "implemented in and testable with VKMS" the rule,
instead of "is generic" for new properties?

VKMS is what compositors (will) use in CI. I would feel hugely less bad
about using a property that only one hardware driver ever implements,
if also VKMS implements it in a way that compositor CI can observe it
working.

I don't expect this proposal to be accepted, but it's food for thought.
The major problem for compositor projects is testing as you usually
don't have the hardware, IMO. CI tends to not have any hardware.


Thanks,
pq

--Sig_/s_k7/+lmfJUhN.4iHZeKmlr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDHbGgACgkQI1/ltBGq
qqfSEw//XKYnCtuk195oOkuEK2xABCRkcU8MfJcqix8gWJlHQSmG9vtFvRJjNWAw
qUvXGeA5Mu9U44gOZJl6CerXdRY4bS2c7X6LYQYXUn6zljdZko1CfW9UUkatF/c/
NeZz9rTtze95on/3sm4/dJ4FQck4Cu/lbixPHddXw0lMDAKFK4B3gBqSRxrovq8r
8k/L1nmUIbZCjo/Iz3E4shNDzjpcHOtBQ/6fl+sp7sU6zrtZPmN7Ma9i/QRu0FN3
xtCR+ETEWmLPjBRw3s2UGbNYXgQookomn5Xl6rbUj2duG8FTz1wQLbm7QepcrqyQ
BZ8wWxYGNuswC1jTG9HekwaWQKfbvH6oCPQTYXxk5VCA4QiRt9vIZTrOla9qNfRq
XJ7L1ero2UVlQdXkgrRaj3h/OmUzrGibU2bnxZNxhtROyXDQ9Xahc0/wNThPddGS
mZRGiYFMp6KsfBQSf97AiiAwm4uSkseH6BTO0v1bJAcXQxqF+nmpKmByM6MR0Oc+
IDOQ4lLf22uODS0d7tGOsUTg1IMD8hO0NOoBvLndrzWBu4YnsuwBkMyhayJXpCOo
WPVNvYfleOgOjtkBmGqn50kdoXleckKaD9L11sQcmAh/UmGoobgz9X/ZB6bT5c6X
QenRvl/5ISefvKxitDWS9XGBgeMFi1ep8lEvGF4+svXI9nvK+ic=
=b1pN
-----END PGP SIGNATURE-----

--Sig_/s_k7/+lmfJUhN.4iHZeKmlr--
