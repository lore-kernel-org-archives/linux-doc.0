Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FAFC3DA78
	for <linux-doc@archiver.kernel.org>; Sun, 15 Jan 2023 11:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjAOL4l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 15 Jan 2023 06:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjAOL4l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Jan 2023 06:56:41 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAB1EC57
        for <linux-doc@vger.kernel.org>; Sun, 15 Jan 2023 03:56:39 -0800 (PST)
Date:   Sun, 15 Jan 2023 19:56:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1673783797;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IR/1jaqsPZqnCGMubVw+uvLLIDfYUZXfUD9LkTZHNP4=;
        b=leABjeIH3bPkaU3Zw5FSdmJPd2nlEv5M1vSTmLZXN1BP9UB06qMAYoowEVTcuUOBFF+aD1
        N+/8XpiNOb4EV0tMnH182HOqzzihT04heE+2L2BMhzseCdDLBOx/x/jrrcaHdHg4rOfTkM
        BMQgv59bp4PBdhCuqMap5L/gLzZD3uI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        tangyeechou@gmail.com, me@lirui.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2] docs/zh_CN: Add a glossary of Chinese translation
 terms
Message-ID: <Y8Pp4TBTGJ5KpyxP@bobwxc.mipc>
References: <20230112130355.696111-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fvT068tl+HuxFt/4"
Content-Disposition: inline
In-Reply-To: <20230112130355.696111-1-siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--fvT068tl+HuxFt/4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

2023-01-12 (=E5=9B=9B) 21:03:55 +0800 Yanteng Si =E6=9B=B0=EF=BC=9A
> As more and more documents are translated and some English
> words are translated into different Chinese, it seems that
> we need a glossary of Chinese translation terms.

Simply add it. If we meet other problems later, an out-tree glossary is
also accepted.

>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Acked-by: Wu XiangCheng <bobwxc@email.cn>

> ---
> v2:
>=20
> * Add more word entries under Yizhou's advice.
> * =E5=AE=9E=E4=BD=93=E8=B4=9F=E8=BD=BD=E8=B7=9F=E8=B8=AA=E6=9C=BA=E5=88=
=B6 -> =E5=AE=9E=E4=BD=93=E8=B4=9F=E8=BD=BD=E8=B7=9F=E8=B8=AA.
>=20
>  Documentation/translations/zh_CN/glossary.rst | 36 +++++++++++++++++++
>  Documentation/translations/zh_CN/index.rst    |  9 +++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/glossary.rst
>=20

--=20
Wu XiangCheng	0x32684A40BCA7AEA7


--fvT068tl+HuxFt/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmPD6dcACgkQtlsoEiKC
sIWH6Av9FF67CIOfYmom5JgEX1cYX1/zj61kXduInlHUWoL1e+p+OAGflwgLzEbl
8fckdSoRMgUKNGM2obAObErcWPtS8OH9KpHB77cFO3XEJvuEEviCA+611gzAzEw2
llHQrbFslHTSnYyq1szzdSsf7mCQNpjb2e3kPbgU9ZKqqTrDHjoYZ+zdjdQffvLe
AhBWzKlexgMuegMHjgsxacKv1kMs74ciRiS67sOqqCPp7AcEFn4fmW7jm1BLawI1
yoUT5oOLnPmAfsH7V+X/5LvniM72gT/eEROG/1SNL3WA0X4r8njl3D0equXR3QBa
Si26gtBJB7oRq0EgyTyN/0n0xRUNheFZkqcsNzrN2RRND/znsC3gzAGNBEutbskW
UXjJLTgVgGt7pKVgI19nANd0GqLZX5fKoT/4KH5nglujg9RwEP+Sq9M6mi+aTAww
K4ZF5cN7ZVslGrNo5299dmvB4V4fRBV7hWx99zbsS9givVwIKargZDksjChD4Iyo
G3Bb5ZEr
=7cim
-----END PGP SIGNATURE-----

--fvT068tl+HuxFt/4--
