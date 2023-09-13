Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8C8EE020A
	for <linux-doc@archiver.kernel.org>; Wed, 13 Sep 2023 19:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjIMTzs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Sep 2023 15:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjIMTzs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Sep 2023 15:55:48 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DC29E
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 12:55:42 -0700 (PDT)
Received: from leknes.fjasle.eu ([46.142.99.40]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N4yuK-1rhSFF1ufU-010y5j; Wed, 13 Sep 2023 21:48:45 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 96B483E928; Wed, 13 Sep 2023 21:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1694634522; bh=dNCzMB7kZKbtu0SVV6D5vezQPGOeLJzdXPIlY9nn0HY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=geeh/i7seOFMHSGVnQ+Sj/uRyKKjwcvJl5CNhOXyrSrFDp6gwJvkdktKjxdM1rF6b
         X7smwIJYI2wKSqnwC9zKw/vql8yLkMlXw1WEr6FhD3NTpbxsrtPqt7orN/y5DktjwA
         3AEXv8Dw7URUCG3krehbxcFdeomCZq3ShPrvM4jQ=
Date:   Wed, 13 Sep 2023 21:48:42 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: explain handling optional
 dependencies
Message-ID: <ZQISGujwlH00B8KJ@fjasle.eu>
References: <20230913113801.1901152-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qj5NqfuKdfJbnsCm"
Content-Disposition: inline
In-Reply-To: <20230913113801.1901152-1-arnd@kernel.org>
X-Provags-ID: V03:K1:iov+urfCVmemenuqZraQFTvmuNIwec5MwwsVygNgb5VgPZRcRFa
 QM7bFZWPE2qmRpIDd0eXsnnlb0iTv65I3DihInST+a7rHu/LeYuiHMMEwa0F8tszNYw4nP2
 ZO8hNBGZ/ApwY2MFMNkWF3pWdG0/SEZvHWo2PjPA5F7uQETqlzVhEuLTMB9MZmWXvRUk0nZ
 1+aq6jXzluTS8bI2UHYfA==
UI-OutboundReport: notjunk:1;M01:P0:zwMMSgXROPg=;hgaNmeCrlAM1JebQt4AH3BQdSoB
 BgxEfRsZyCVJyWtHRXc2OK3vKoWxFLKdlqDY8jGi8iwFksNZupkXshSoBjBO/IK5BvDQ42bNn
 j7F5QFbi0uQQYAMxoDEvPFNVa9iV+QpYnZu44dcnJYg9K5OanA0OabrO4HY/eRjwXtPtFJAiw
 vubw9FrVs/7EO5IBXQfI+YjPsQvewpicNWprLYa90u6JtsyOlbsHOXgz17ovKHTimzIUEJz+O
 6R0scKC2SXPUBx4pVW+0fGcP9HAba5WzC1aH2kOygkrHKUC41UBbKywcAhrCHEHyHrkcqI4qB
 AmTLSAs3NeCFP2Kz8Vm4mj5qpFvo8J9bQBhCDpt0oB1rN2IGchfR/lfkaUGL+EegRg7m5HDIU
 Mq40kdaR1rthzqwknkbCdUK82AvnY328w0Jvr9li9/zkEXW98u4h9xQYYeeY5Pve4W4YfgDEa
 XmHxiHs/hieEFppkx+9MSaNGgeczY7vEskwsdadHXSBJJJVd9kP3FFdNe/A7ITdX/UFTWvplh
 fpP11zfchy7ICOgkukisJYmEj/GQohV25AOJZCYR5muDeRsQzn9IrzWBJk1Xwnbv93GGKnxji
 Nb67o5+0bWzwWp1Sb75Na4Akcjjx/xpan6CLWHp+VHf2VoEQVSiyaoJ7csEWLeeGs0mAiJYzc
 QQaW6DqKKraGP9/DVPcdZXqu49pdrllsTauIxzVSCrOuDNINCiYL547wlYvrICdqtPWthhzc+
 ItxKkeIu93hhS8dO7IDUqyD0MgXVBY+cvzLY8Wb/YP5UvXye77TsJmOK/8NsDkWJOHi92c5Dd
 x+B9feXenEHUXqe42fwul0w6hcPXQt/WZHkUhXWD9m3lzSIwSTqzaV42fp8LFOLOR0uGzpIC4
 lsWTo8FLBEtOFKQ==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--qj5NqfuKdfJbnsCm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 01:37:52PM +0200 Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This problem frequently comes up in randconfig testing, with
> drivers failing to link because of a dependency on an optional
> feature.
>=20
> The Kconfig language for this is very confusing, so try to
> document it in "Kconfig hints" section.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Hi Arnd,

thanks for documenting this!  Three questions below:

>  Documentation/kbuild/kconfig-language.rst | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kb=
uild/kconfig-language.rst
> index 858ed5d80defe..89dea587a469a 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -573,6 +573,32 @@ above, leading to:
>  	bool "Support for foo hardware"
>  	depends on ARCH_FOO_VENDOR || COMPILE_TEST
> =20
> +Optional dependencies
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +Some drivers are able to optionally use a feature from another module
> +or build cleanly with that module disabled, but cause a link failure
> +when trying to use that loadable module from a built-in driver.
> +
> +The most common way to express this optional dependency in Kconfig logic
> +uses the slighly counterintuitive

slighly -> slightly

For better RST compliance: could you explicitly start the code block e.g. by
appending '::' as in "... counterintuitive::"?

> +
> +  config FOO
> +	bool "Support for foo hardware"
> +	depends on BAR || !BAR

are you sure that this is enough?  While testing, I needed to explicitly use
=3Dy|=3Dn:

    depends on BAR=3Dy || BAR=3Dn

to prevent FOO to be selectable iff BAR=3Dm.

> +
> +This means that there is either a dependency on BAR that disallows
> +the combination of FOO=3Dy with BAR=3Dm, or BAR is completely disabled.

For me, this sentence is hard to parse (but I am not a native speaker); what
about something like this:

This means that FOO can only be enabled, iff BAR is either built-in or
completely disabled.  If BAR is built as a module, FOO cannot be enabled.

Kind regards,
Nicolas

--qj5NqfuKdfJbnsCm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmUCEhkACgkQB1IKcBYm
EmmgJA/+Juye9CK9p1ddXxiVaMgnc0h6bNPW2duYWRcI3EvdQmVnb6RO0Obvf62D
fp/lSkg4z6DIGnW3/LKEcx/3AAi6bjSF/TLgrURxUY6gHnRwgkj0NWR067iAXLkJ
vXlzAOk6eNLk6NvewHxeLtsBK32lInNbHfg3hw3GpP20DY9HFevVVe/painn/a9r
9TM9XVjwdxMsWLgTvc5s7JicyDMk/PdW2ByZVFINZ7Q/86E9z1eeS5SvUszxsgX5
gZp2C8nKx90/nuT4Sif9EOMvqjRZvtXuQew8TYVh195J0Fry+zPMjcOyKOSv8Fub
SRKsPg8hheICkmD3tHFxprKbRash+TgUGEo1+Vzi1p/NhASH5kzLGxKadvy+54Z/
DJWPlMr6ZSj9vUJngeyqFxvwTVnts2i9oJpRpkQs9qcpmxyg84k5IDlCZxTAnNmp
1wmAtNH/F2LfQaybnFHshNDDgK+0b6Vz6cSyj2V3godwdsB4Ecq7wqpbKdE6ioeH
x78t0sWS7eeYcZmduJKxbspuAJ2KwUFZZjMPPwaFXvwNeetM8BsDwZ9Dqyv5owZI
DTCagFieqmdvIg+jy8KVkAk2BoR0+STsTTFpf5wDtvXYFZIk2/0aq02moN7snAbm
k23lPOWs9h/sRhXxXW+Hg5D10Jhh5zSqf1Fk0ba3SZb+nZbIT10=
=N9EP
-----END PGP SIGNATURE-----

--qj5NqfuKdfJbnsCm--
