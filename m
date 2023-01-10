Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1364FC54EBE
	for <linux-doc@archiver.kernel.org>; Tue, 10 Jan 2023 05:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjAJFNa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Jan 2023 00:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjAJFN3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Jan 2023 00:13:29 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7047A101
        for <linux-doc@vger.kernel.org>; Mon,  9 Jan 2023 21:13:21 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.97.169]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MS3r9-1pMRH510xf-00TTj4; Tue, 10 Jan 2023 06:07:16 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id EB5363C0CA;
        Tue, 10 Jan 2023 06:07:13 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id B9D62311; Tue, 10 Jan 2023 06:07:11 +0100 (CET)
Date:   Tue, 10 Jan 2023 06:07:11 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc:     masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
        corbet@lwn.net, cristian.ciocaltea@collabora.com,
        gregkh@linuxfoundation.org, vipinsh@google.com,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND] scripts/tags.sh: choose which directories to
 exclude from being indexed
Message-ID: <Y7zyf+d6JSPUsIDt@bergen.fjasle.eu>
References: <Y7SKBqxULPofEry7@mail.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KFxLv6UZoDjtwEPS"
Content-Disposition: inline
In-Reply-To: <Y7SKBqxULPofEry7@mail.google.com>
Jabber-ID: nicolas@fjasle.eu
X-Operating-System: Debian GNU/Linux bookworm/sid
X-Provags-ID: V03:K1:q6indz7A98W6UrJv1GbsvbIAX9Z7z1Kks6ZWm4aDpR651pFkWBo
 o07uRYCoN/BUM9RYBbpunTMGKkHhlzAlXC7HClFP1Wef8yLTwNs9paxQ+qwnV/Ryk8RVhnZ
 I67erprlGi9ADXlHv506UE0ECp0kAh9QA6oJr4NTD6SxdIZL0P7IObqr65YNmT6G9OZjSVC
 vnoXGFFpTGl0R0yDkI6Qg==
UI-OutboundReport: notjunk:1;M01:P0:l21X+JzdrOQ=;ojijBSJQVBUSDizCQrskusv3aRq
 CLKGr1QgQ7Dwwpj1NoORygnHbVh5LGzDmO5gH8OqCaIQ6GiSe/Bw+7xqRG/lXR2lx0oal28QC
 ZVqH5Y6XbtP4/tnyDup2gkhIWYso9Wdq7EoPHuYU/56k47CfJ+f17n6Zzya7SOPItThKkYDL8
 +SeTpdWW4xpAPEFNlWol127G5sl5Ml39GakK9+Zo/YIdKyFzxrAAmZPVbFv9/Av1MEZRWzLzk
 prmOx5BWZWonHMPdAzgwOP6XGahwLRe5nkbM1oV5sA0LbPMkY27QFBS2sVa2LKOLj5AcCOTuY
 CrTiR5piTa2uLLCkGsCRCzQZ6rtLZK5Q0MM0mbQljwa2ZnRJ3A237g+kzoUxZZ8BZunMNaxVk
 qllz0fUQrc6xdI1homuQzPrts5xCKDXXKvRViffaqCwZTThOazP2pB7IzqknGBjn39GLEof2i
 rT3et/rJtE/TYFdYeWyUVZd5oFCSV3xbn5pVDD29YENZmvCBp6GIUVh9X8Oma+3KBZPXiNnJ1
 U3/zwP87C8jIGCExUZSWo4ThCCT4TW+i38IpwVM+3sjP+EE1A9m4sExuucG6bUHLAwZD1WEHT
 Kf5qu7atPvT1rp32AMRNzKTuvGSBXrIioOAhVWZSjGvvm0xER2uuQguGbdgAMv8JF0SL28QQH
 j13l9kE29yagV8fu2qlFv1RZ9ICgtl6GBECN1Be6/w==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--KFxLv6UZoDjtwEPS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 04 Jan 2023 09:03:18 GMT, Paulo Miguel Almeida wrote:
> It's common for drivers that share same physical components to also
> duplicate source code (or at least portions of it). A good example is
> both drivers/gpu/drm/amdgpu/* and drivers/gpu/drm/radeon/* have a header
> file called atombios.h.
>=20
> While their contents aren't the same, a lot of their structs have
> the exact same names which makes navigating through the code base a bit
> messy as cscope will show up 'references' across drivers which aren't
> exactly correct.
>=20
> Add IGNORE_DIRS variable, which specifies which directories
> to be ignored from indexing.
>=20
> Example:
>         make ARCH=3Dx86 IGNORE_DIRS=3D"drivers/gpu/drm/radeon tools" csco=
pe
>=20
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.c=
om>
> ---
> Changelog:
>=20
> - v3: change commit message wording and rst syntax (Req Bagas Sanjaya)
>       change makefile variable scope to global, use blank space
>       separator and change variable name to IGNORE_DIRS.
>       (Req: Vipin Sharma)
> - v2: change approach to include everything unless specified by the=20
>   IGNOREDIRS variable: (Req: Vipin Sharma)
> - v1: https://lore.kernel.org/lkml/Y5OKDvbGk4Kro6MK@mail.google.com/
>=20
> Additional notes (if relevant):
> - Patch v3 was reviewed-by Vipin Sharma here:
>   https://lore.kernel.org/lkml/CAHVum0eNp5Dup_KyrS2N0zu5TfrtcCxphRnLuBFZa=
5PxahVg7A@mail.gmail.com/
> ---
>  Documentation/kbuild/kbuild.rst | 7 +++++++
>  scripts/tags.sh                 | 7 +++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuil=
d.rst
> index 08f575e6236c..5202186728b4 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -278,6 +278,13 @@ To get all available archs you can also specify all.=
 E.g.::
> =20
>      $ make ALLSOURCE_ARCHS=3Dall tags
> =20
> +IGNORE_DIRS
> +-----------
> +For tags/TAGS/cscope targets, you can choose which directories won't
> +be included in the databases, separated by blank space. E.g.::
> +
> +    $ make IGNORE_DIRS=3D"drivers/gpu/drm/radeon tools" cscope
> +

Thanks for the patch!

I think it might be good to add a note about that this is not ignoring=20
arch sources (here and in the commit message).  For kbuild.rst perhaps=20
something like: "For filtering-out sources below arch, see=20
ALLSOURCE_ARCHS above."

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

--KFxLv6UZoDjtwEPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmO88nkACgkQB1IKcBYm
EmkXwg//W6rxak5P/dyiiBoZ5nyGyi7VIwwz5G7f+1fo7jWqb8ao9i5Y0qczgVFL
7yhZvTWpBP5SBjEgifud+GYyCFND5rLLIPmQlBnN+Iv5yjuo7wOSfG1Mce98ANK4
CHydVZ32NtHjMsM5svwpvyJ7uOppBXIc2uANHSK4devVl4FcwFi1PibVDto3o2+W
IPgTbN2k9BNMyMc4CVrjjW2MyEDYIc8ckuv7voMZXUKOtIutnm0TEC95dorrDCmS
8EvzwT7WY4cMOYnL4/+EwUNaDdBUq1PwwmNf7FjgCFNIb8YZIYMINpUSKH6kLaml
rjen7As/hWwxMd28m06LhyDzTvkmU47WYyp/0k0aTscLWAcHN1QZzlejNQcIQt3s
iTuTrB5drlboL1G/Zu+IEDq7aDeImT+oVEGhZ6JQO1FNAiWPUMtSBTPxb9ez5P1j
EeuMoBicyymgWmwosJ+EfEjYgxp7MAB0zTHG9T9Osal7rcKSuG7iSRxQLChhZOj3
RalknxFYtT/vetdu0SR96pCkdvmqiB1U0hvjo7q5P5ltN8Pf2IDzjrytMPF4OwpG
g8CcC6OICBKPNOi1v/OziOk3pEME+fkLk6ACZW4E0L6BwO8SBs5D0PI4iH44zpql
NGnAkHvxyFhMSwYHBag9jn3vc5s1ecjlo2EEW5f9WWBBrF04bdQ=
=uoTl
-----END PGP SIGNATURE-----

--KFxLv6UZoDjtwEPS--
