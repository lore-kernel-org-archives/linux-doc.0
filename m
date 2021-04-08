Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BBDC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 08:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 906C46115B
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 08:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhDHIOK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 04:14:10 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58159 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229566AbhDHIOK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 04:14:10 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6FC4F5808E6;
        Thu,  8 Apr 2021 04:13:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 08 Apr 2021 04:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=b5tqEuBPnKIHC4ZOjCxiVu2+gGB
        7jOK9/b/QhbhakyA=; b=ZxdMGSLgwJRdhcoCzOk2yU2XyQW8Rek/nZkYnlKNl3z
        x6Fgk4osGdHuSlXui+BVQ/jA3aK3pCkNF7VQ5BinaY3Wro3JbulsK8671aT/e5lw
        L0jndnhDBbQB+8I2j0XWtwV10vDj+vA4M2T4aTEJMtVQmKUZNKvcK+wXPoo178md
        4j6ZeyhVEVHD4dkzF+odyVQM+x5w8QAx/P9r2kK3CM6ve+V7QaiWEuV/Fyvyva3A
        Mg1CNtT22eYkizPaRyfycrcH85HKcQUXUGxzWopPMUbdOxkrMSWIpv4XMvsFtNPr
        5TBey+/KPALfK0vFPQnn3vFx1ybfwE9YVlwRQXeLwsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=b5tqEu
        BPnKIHC4ZOjCxiVu2+gGB7jOK9/b/QhbhakyA=; b=NynEPbWaw4LK6CFVdUxvsk
        XnEy5fePwemwzm+YJhcwOwDqYGtqyWTWOVwgRHDDq56LwO2Ztui+zLcTYxsUHNa9
        WB3bKwyR63Ojl5060SFYIIJfhL4hiCefDiLqNoNJ/vCUdOtrK9a8pERBALfeg6Fr
        ODgQsSF0u60umNd05twbJt+WUBrh3gn6GItmiPe+d1oF8AzPBGqntBJyqjGITiO5
        3aS6d1WNufPyI3r9c4iZO6/zaUYa5vAHNXEQLLNfdc5dITzpIaXIbRnN73rJtVzb
        bHzVDrSF4Mv2L7VhZP8wUIybjvLeoBkJhQu486OnygKejM5OdzOGdK9wVLTojHCg
        ==
X-ME-Sender: <xms:Q7tuYFGJA_EFBHgG-VD79iemj4nArLHFpPqvdCME8mEo2gmA43ZjtA>
    <xme:Q7tuYKVZgug42gvkxpXK79sXHfG2o7M_ZeZ9ifKb0SO3zSwcx2KDZzPnf4l0aV6hE
    sTKKlBSXY12Ws9rHtI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Q7tuYHLBhs1rubvoKYlCXyEzFfemWecVqMhuFFu-gtUWkjHNSAvwfg>
    <xmx:Q7tuYLE1KArs3Lbb-k9DzOqXi9gxv02PfRCpE_BAydpRQ5grN7OI2Q>
    <xmx:Q7tuYLWmy6xDFwogKQacz1Mr_LI2STITSB7DjCARb0O0-inHunaV3Q>
    <xmx:RrtuYMvUweMQgoNRT-tm5oCXpiiA3Gu4GT3HPBdgmgCjHtN05EnKtQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 85FF524005C;
        Thu,  8 Apr 2021 04:13:55 -0400 (EDT)
Date:   Thu, 8 Apr 2021 10:13:53 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, kraxel@redhat.com,
        corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
        sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
        geert+renesas@glider.be, hdegoede@redhat.com,
        bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device
 node
Message-ID: <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kic7zoudgl7hee6e"
Content-Disposition: inline
In-Reply-To: <20210318102921.21536-9-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--kic7zoudgl7hee6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 18, 2021 at 11:29:19AM +0100, Thomas Zimmermann wrote:
> Make sure required hardware clocks are enabled while the firmware
> framebuffer is in use.
>=20
> The basic code has been taken from the simplefb driver and adapted
> to DRM. Clocks are released automatically via devres helpers.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>

Even though it's definitely simpler to review, merging the driver first
and then the clocks and regulators will break bisection on the platforms
that rely on them

Another thing worth considering is also that both drivers will probe if
they are enabled (which is pretty likely), which is not great :)

I guess we should make them mutually exclusive through Kconfig

Maxime

--kic7zoudgl7hee6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG67QQAKCRDj7w1vZxhR
xZ6VAQDtY09IxlLn3UJzycSlVWDilIefmaJ4MNMz0qDXaviB7wEAlVwtu8GYBmpN
wkIzSptIhbbsnq7fbNHk3LrvpN4N0g8=
=X3Xj
-----END PGP SIGNATURE-----

--kic7zoudgl7hee6e--
