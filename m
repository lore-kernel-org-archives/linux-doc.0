Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2472B7E686
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 22:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754742AbeCGWL1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 17:11:27 -0500
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59391 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754039AbeCGWL0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 17:11:26 -0500
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 12AAD8028C; Wed,  7 Mar 2018 23:11:24 +0100 (CET)
Date:   Wed, 7 Mar 2018 23:11:24 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
        gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
        benh@kernel.crashing.org, andrew@lunn.ch,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180307221124.GD10438@amd>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
 <33bf6563-b220-7ff9-8b04-84e9bd781b3f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <33bf6563-b220-7ff9-8b04-84e9bd781b3f@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Are these SoCs x86-based?
>=20
> Yes, these are ARM SoCs. Please see Andrew's answer as well.

Understood, thanks.

> >>+	Read sampling point selection. The whole period of a bit time will be
> >>+	divided into 16 time frames. This value will determine which time fra=
me
> >>+	this controller will sample PECI signal for data read back. Usually in
> >>+	the middle of a bit time is the best.
> >
> >English? "This value will determine when this controller"?
> >
>=20
> Could I change it like below?:
>=20
> "This value will determine in which time frame this controller samples PE=
CI
> signal for data read back"

I guess... I'm not native speaker, I guess this could be improved some
more.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqgY4wACgkQMOfwapXb+vKkpwCgxIl38neoJCtEDSh34sHCjHMb
QxUAnRhNCAIzVU8cgKZ4g2D+qFLjBZM8
=gl0E
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
