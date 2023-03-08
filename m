Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BEDC678D5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Mar 2023 07:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjCHHbN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Mar 2023 02:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjCHHbM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 02:31:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D0C8F505
        for <linux-doc@vger.kernel.org>; Tue,  7 Mar 2023 23:31:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoGL-0006Zm-NY; Wed, 08 Mar 2023 08:31:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoGJ-002fEn-1K; Wed, 08 Mar 2023 08:30:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoGI-003EKH-9c; Wed, 08 Mar 2023 08:30:58 +0100
Date:   Wed, 8 Mar 2023 08:30:58 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        kernel@pengutronix.de, David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] docs: rebasing-and-merging: Drop wrong statement about
 git
Message-ID: <20230308073058.ipiudixcn2fpwaus@pengutronix.de>
References: <20230228134657.1797871-1-u.kleine-koenig@pengutronix.de>
 <875yblzjoe.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zjmtniuiayxcdqmt"
Content-Disposition: inline
In-Reply-To: <875yblzjoe.fsf@meer.lwn.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--zjmtniuiayxcdqmt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 12:14:41PM -0700, Jonathan Corbet wrote:
> So the patch is worth applying, but I may tweak the changelog some.

I spotted a414684e3b735a4114c19295a07e8cb2eb889dae in next now. You made
the changelog read:

	The "^0" syntax is no longer needed to fast-forward to a mainline commit

I'm willing to bet that ^0 was never needed to force a fast-forward and
using it was never had an advantage. The semantic of $rev^0 is and
always was: The commit related to $rev. If $rev is a commit, then $rev^0
is the same as $rev. If $rev is a tag, then $rev^0 is the tagged commit.

See:

	$ git rev-parse v5.2-rc1
	311e1ea1b63dc428575270b9d4801e3e6f96457b
	$ git cat-file -t 311e1ea1b63dc428575270b9d4801e3e6f96457b
	tag
	$ git rev-parse v5.2-rc1^0
	a188339ca5a396acc588e5851ed7e19f66b0ebd9
	$ git cat-file -t a188339ca5a396acc588e5851ed7e19f66b0ebd9
	commit

So v5.2-rc1 is a tag and v5.2-rc1^0 is a commit. And if you check the
output of git cat-file -p 311e1ea1b63dc428575270b9d4801e3e6f96457b you
see that v5.2-rc1 references a188339ca5a396acc588e5851ed7e19f66b0ebd9.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zjmtniuiayxcdqmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQIOa8ACgkQwfwUeK3K
7AkBQAf9GtWRH2c8aLYZl+05FR6LzyEe+zMx3yBfvGV8C92ar1UACaKEjGCVB4JG
cAK69JijcnNM8rtK/yWxoJctOsOt9QkTkwlfHMyVUgEA4LOTy/XeVZeJcQNmUEnb
vuxK0koXfCvVRsE4AtxgYWZ5C+R5OnO6DLBb2DApd1Y/zrUMVgxsPkFZIk+Ee0uI
lSP2sOAGsjrQAUfFApxG4WoMjoAjtolFrvAGXVv8pnH+aC+nRqJqkfmstvoGqQUe
WQjVaB9K2f66geNAPak8dNp6EvsD9dnf1qLG0SaOGFaoXIWaBcCKsaDvvFuAAVmd
ZoBMb6EfoB3/ICUHvO6nnxehSpYwuw==
=Q3w3
-----END PGP SIGNATURE-----

--zjmtniuiayxcdqmt--
