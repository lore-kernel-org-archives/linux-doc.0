Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D00FC07E9B
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 07:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D564611F1
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 07:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhGIH1o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIH1o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jul 2021 03:27:44 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF477C0613DD
        for <linux-doc@vger.kernel.org>; Fri,  9 Jul 2021 00:24:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z9so6571952ljm.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Jul 2021 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=v4Y7Y75b+/zQ8ONB6CRkPYT3gGf1WHJZwOXDaMU12sk=;
        b=p/bXWXucPYAL/B+DZNp/e0edv7FtSuLM+NS5FvPFDmYVqLtj+efSXs3H4hnUYNFcpt
         8PndW042WIJLTTmB3J6sfcZWdFDm96SfYe9dbTh8t3NN3aAXI2Xi8VE/SCMSYzeUkyhO
         haAwiTM2gKo9IStRt1oyvW7RP3qcxJ+Q1Gi+auFlQDTwy+1+FvuYy1NXBsRcNC+LAQi3
         JOhve92NzMo8RFhgFEmRV97Ex+5EXOB6lo9tGYB0iuv0KWDXPiSSNokyB6O2bEM1tLz1
         iO1x0w4tFHxxQ58ApuhnHsTrhtcyugG0pievveuZpqi/q7PEqfu9g5fokOX8OAchNIz1
         KkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=v4Y7Y75b+/zQ8ONB6CRkPYT3gGf1WHJZwOXDaMU12sk=;
        b=PKy6rjoB7WKWLqSUMTwihUW+igUQBkCWxA3/cg6LCOEl7UtNNQ8IbiMV+uu1FswqqL
         KhUBfbZY1k9VrQlvqcX04p7899nDfH/M2Kgh7YVKMUGeDAIYY6RkmNt0oVWaiX63qA/n
         66liBNE3cowCGyIdNw+3+FQ1iW2wNEEq5oXy7oj/ymZDYXdidPJnDUuWRsDwkTVIk4+O
         m2sbVlrzuWNiViYQC/bQiLV5XO67XLgkOsCJ3IIs4j8Nnv0iCG84LRqcw/tHoQ/NyfJq
         qPvJmo6sdpBNxTYGp/Bw3L6v/s7lS/8zRV5/RpJC0VygS9YNYGk47pSlHmPTVxXkZWK7
         a0kg==
X-Gm-Message-State: AOAM531Mh/LGIcbFkKGfQ9TbHezSrwSCYd97fYFlRBp857n8Zr3JnpUV
        goTcUcc5ppeioH/vRZB/NlM=
X-Google-Smtp-Source: ABdhPJwO/A77CTQzPMUiuTwiQpVIM+Rmyeo+tKs4S4dSAtBHSDqtNraWwbosLoQe5DKXX1SURNFeRA==
X-Received: by 2002:a2e:1447:: with SMTP id 7mr18760431lju.104.1625815498188;
        Fri, 09 Jul 2021 00:24:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id f2sm392068lft.225.2021.07.09.00.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 00:24:57 -0700 (PDT)
Date:   Fri, 9 Jul 2021 10:24:44 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel@lists.freedesktop.org,
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
        Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
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
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Message-ID: <20210709102444.7a72a029@eldfell>
In-Reply-To: <20210706161244.1038592-1-maxime@cerno.tech>
References: <20210706161244.1038592-1-maxime@cerno.tech>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lKQpGfP3g_qZ9ySMVoNCeNX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/lKQpGfP3g_qZ9ySMVoNCeNX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  6 Jul 2021 18:12:44 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> New KMS properties come with a bunch of requirements to avoid each
> driver from running their own, inconsistent, set of properties,
> eventually leading to issues like property conflicts, inconsistencies
> between drivers and semantics, etc.
>=20
> Let's document what we expect.

...

> Changes from v4:
>   - Changes suggested by Pekka
>=20
> Changes from v3:
>   - Roll back to the v2
>   - Add Simon and Pekka in Cc
>=20
> Changes from v2:
>   - Take into account the feedback from Laurent and Lidiu to no longer
>     force generic properties, but prefix vendor-specific properties with
>     the vendor name
>=20
> Changes from v1:
>   - Typos and wording reported by Daniel and Alex
> ---
>  Documentation/gpu/drm-kms.rst | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 87e5023e3f55..47994890fd1e 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -463,6 +463,36 @@ KMS Properties
>  This section of the documentation is primarily aimed at user-space devel=
opers.
>  For the driver APIs, see the other sections.
> =20
> +Requirements
> +------------
> +
> +KMS drivers might need to add extra properties to support new features.
> +Each new property introduced in a driver need to meet a few
> +requirements, in addition to the one mentioned above:
> +
> +* It must be standardized, documenting:
> +
> +  * The full, exact, name string;
> +  * If the property is an enum, all the valid variants name;

Hi,

"variant" feels a little off to me, I would have used "value name
strings".

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
> +  planes.
> +
> +* Its initial state must match the behavior prior to the property
> +  introduction. This might be a fixed value matching what the hardware
> +  does, or it may be inherited from the state the firmware left the
> +  system in during boot.

I'd like to point out that this rule should apply also to
properties that already exist in general, but are newly exposed in a
driver for hardware that didn't expose the property before.

> +
> +* An IGT test must be submitted where reasonable.
> +
>  Property Types and Blob Property Support
>  ----------------------------------------
> =20

Regardless of my comments above:

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/lKQpGfP3g_qZ9ySMVoNCeNX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDn+bwACgkQI1/ltBGq
qqeUOw/+IJDPAd/pNbohxB+6S5FFsAOYOUdd4tNrxxDrsJVxW8T9QQM2byBOlq2I
8sgo80RlrwjZDFRx+APmsAm+O1CNjjOzkjUaw1Wwd2h5VkRUs6YYOk/M9ma/MnkV
hHAUJyKZDlYpteFZn20CVBXr1oYVVOrSaoUvfHsjBaoIsSu7hgaBuk+K3r7zsxNx
NFiXgdJyeCzTqcbtHZ1M8CLnvkkhV0bWKSoFSfs8jiH4m4SFFN6qx/A+6m0jND47
I5ZYgN2MAroBBjfMdtWiJkLDmlD6rgyFSh/jnjVQTgKilwEaUItFdCxM2dG5q8S7
+Z6p5T2tIxeGurwC5Fpw9K8pWcCzQrgp+xgUgEv3EEnEE0D6+IpxPXz0dpUjdVaX
r1+7e2HTQ6pZ+qnBBnkYIbFzWcVCsNOZJdEUJrNtAfmNKjjmQIodwMBsf+NDkR1Z
Z/4UsKvaOSphp9XDZbsZWz6mIdi9ZESC8yFVXHvzLe64ZAPHgN4jKGWDzTMAwU5V
HUiiWRbE9goFYZVajbth50dAaP1VeWodqImJiiXmGspGRMOBMcwJTumyk7QsSg5e
IWfgtphLG40Dhq1zUJB/TkyHk11L7V231QwbVvrXPmkssmBhbjtJDrRm+M32BsWl
2SgQtsacV0bK35S25pDZZkOs+1zUEqIbX1LI/SSX/epeIyz3oLg=
=BPFa
-----END PGP SIGNATURE-----

--Sig_/lKQpGfP3g_qZ9ySMVoNCeNX--
