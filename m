Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A9A27D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 14:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933263AbeEWOG2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 10:06:28 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43269 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933254AbeEWOGX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 10:06:23 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 5467C8055C; Wed, 23 May 2018 16:06:21 +0200 (CEST)
Date:   Wed, 23 May 2018 16:06:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Yury Norov <ynorov@caviumnetworks.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>,
        Alexander Graf <agraf@suse.de>,
        Alexey Klimov <klimov.linux@gmail.com>,
        Andreas Schwab <schwab@suse.de>,
        Andrew Pinski <pinskia@gmail.com>,
        Bamvor Zhangjian <bamv2005@gmail.com>,
        Chris Metcalf <cmetcalf@mellanox.com>,
        Christoph Muellner <christoph.muellner@theobroma-systems.com>,
        Dave Martin <Dave.Martin@arm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Florian Weimer <fweimer@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        James Hogan <james.hogan@imgtec.com>,
        James Morse <james.morse@arm.com>,
        Joseph Myers <joseph@codesourcery.com>,
        Lin Yongting <linyongting@huawei.com>,
        Manuel Montezelo <manuel.montezelo@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
        Nathan_Lynch <Nathan_Lynch@mentor.com>,
        Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
        Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
        Ramana Radhakrishnan <ramana.gcc@googlemail.com>,
        Steve Ellcey <sellcey@caviumnetworks.com>,
        Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: Re: [PATCH 07/24] arm64: ilp32: add documentation on the ILP32 ABI
 for ARM64
Message-ID: <20180523140620.GA27215@amd>
References: <20180516081910.10067-1-ynorov@caviumnetworks.com>
 <20180516081910.10067-8-ynorov@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20180516081910.10067-8-ynorov@caviumnetworks.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-05-16 11:18:52, Yury Norov wrote:
> Based on Andrew Pinski's patch-series.
>=20
> Signed-off-by: Yury Norov <ynorov@caviumnetworks.com>

So Andrew's signoff should be here?

> ---
>  Documentation/arm64/ilp32.txt | 45 +++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/arm64/ilp32.txt
>=20
> diff --git a/Documentation/arm64/ilp32.txt b/Documentation/arm64/ilp32.txt
> new file mode 100644
> index 000000000000..d0fd5109c4b2
> --- /dev/null
> +++ b/Documentation/arm64/ilp32.txt
> @@ -0,0 +1,45 @@
> +ILP32 AARCH64 SYSCALL ABI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +This document describes the ILP32 syscall ABI and where it differs
> +from the generic compat linux syscall interface.

I was hoping to learn what ILP32 is / what is it good for, but no,
this does not tell me... it would be good to do a short explanation
here, and maybe reference it from cover letter of the series...
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsFdVwACgkQMOfwapXb+vIqwQCfYjjsUAivfLJZGZGD+OxZQomb
x7kAoKfYf3WV9YCXwGsSlCM1C9pUE3kr
=dVu7
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
