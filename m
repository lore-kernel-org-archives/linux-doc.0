Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7385FC4332F
	for <linux-doc@archiver.kernel.org>; Sun,  6 Nov 2022 09:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiKFJqB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Nov 2022 04:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiKFJqA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Nov 2022 04:46:00 -0500
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C102F006
        for <linux-doc@vger.kernel.org>; Sun,  6 Nov 2022 01:45:59 -0800 (PST)
Date:   Sun, 6 Nov 2022 17:45:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1667727957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6rzO8Ay4pY0eb2YPo03cOkhzeRWTYPaU1CCSr66ORzA=;
        b=M8yizAGpHIS+bA68+tvQ7WiyMcpRc1qJ2R5fUjOdWh6LW5gPQGSSWAST0+HYEPpwo0gVS1
        5ebSYSM3AO/ZQ6hqU39xvDIRrBoBezxJr6zjfkMjx5bxN+K3745qRsR8TPgc1rTlSFGlU1
        GWylxB/1XWPgLwA7SD5X2h06rGVyBq0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 0/3] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 2)
Message-ID: <Y2eCPuo3z69kzK+1@bobwxc.mipc>
References: <cover.1666689138.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qjmZhms1L+YcV7fg"
Content-Disposition: inline
In-Reply-To: <cover.1666689138.git.zhoubinbin@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--qjmZhms1L+YcV7fg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

2022-11-06 (=E6=97=A5) 14:57:47 +0800 Binbin Zhou =E6=9B=B0=EF=BC=9A
> Hi all:
>=20
> Sorry, it may have been a while since the V2 patchset. Thanks to Alex
> for his comments.
>=20
> As a continuation of the previous patchset
> (https://lore.kernel.org/all/cover.1660881950.git.zhoubinbin@loongson.cn/=
),
> this patchset contains the Chinese translations of the remaining three fi=
les.
>=20
> As follows:
>=20
> this_cpu_ops.rst
> timekeeping.rst
> errseq.rst
>=20
> So far, the docs for section "Data structures and low-level utilities" of
> the core-api has been translated completely.
>=20
> Thanks.
>=20
> Changes since V2:
> - Take Alex's advices, thanks.
>=20
> Details:=20
> https://lore.kernel.org/all/CAJy-Am=3DmtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRL=
GQLxUPgQ@mail.gmail.com/
>=20
> Changes since V1:
> - Take Xiangcheng's advices, thanks.
>=20
> Details:=20
> https://lore.kernel.org/all/Y0wsWoI+BXXCuRbF@bobwxc.mipc/
> https://lore.kernel.org/all/Y02EcgD3E0%2FlML5H@bobwxc.mipc/
>=20
> Binbin Zhou (3):
>   docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
>   docs/zh_CN: core-api: Add timekeeping Chinese translation
>   docs/zh_CN: core-api: Add errseq Chinese translation

v2 has been merged into jc/docs-next, see:

commit 4cbf848f07d85170bb78040e50762673ab799693
commit d24c911bd031a299de39863f67ae7290d450d56e
commit 797e75617b98e4c50d98372787427716cb532761

Please rebase on newest docs-next if any further modification.

Thanks,

>=20
>  .../translations/zh_CN/core-api/errseq.rst    | 145 +++++++++
>  .../translations/zh_CN/core-api/index.rst     |   5 -
>  .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
>  .../zh_CN/core-api/timekeeping.rst            | 177 +++++++++++
>  4 files changed, 607 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_op=
s.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping=
=2Erst
>=20
> --=20
> 2.31.1
>=20

--=20
Wu XiangCheng	0x32684A40BCA7AEA7


--qjmZhms1L+YcV7fg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmNngjoACgkQtlsoEiKC
sIW0Jgv9FlvciJOTQcakTRc0vEVL+k+eVsENdU1sJrIkW7WTNpe/20tTCofRe/t1
qp00i9WblRzJWl7UkAS8X9DXfWKX8yxFoeD9AT5PNyTIA9RdJL+gJhpvrZ6mwXu8
NAKvrUJvqs9jKO6k+cNVtJLPdXx2chpfQsoRoyUMfSIyvK3r4LCcZni06hbIqjLL
RiHkJo1Wl6MWsE5JAtXYcRQqgwmTW6KwocNNZbdrIi15N3wJgpACOh2KtREd/ele
jtIxTc3mKQ9/zmAgO/P6bY2FxJJfSDkxxpo+6H8TAA9PfN2fTYQFSp1bKaX+yAxi
h2lhaz/YGgsgJquvJj9ueRW1kPj3Qs/YzdpnxufejGZEU9vEjTRgLHJfMy3UYUg4
R0pcYE+iVrHg7GjE16o4dYqwftDnwSKbgU/RTIeWqqClOM/GrP0+maYE8YeCLV8F
x0/GW3Nz+fFjaMI/SaUkHb6Z2meBUV9U1SR5wtTDuaLbpccTNJksHCnRuYwrPq/v
r0zZEvaG
=gMkE
-----END PGP SIGNATURE-----

--qjmZhms1L+YcV7fg--
