Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997EBC64EC4
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 21:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjB1VrZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 16:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjB1VrX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 16:47:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847423598
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 13:47:08 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pX7oP-00073T-WF; Tue, 28 Feb 2023 22:47:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pX7oP-000xOM-94; Tue, 28 Feb 2023 22:47:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pX7oO-0017PX-8v; Tue, 28 Feb 2023 22:47:04 +0100
Date:   Tue, 28 Feb 2023 22:47:03 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        kernel@pengutronix.de, David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] docs: rebasing-and-merging: Drop wrong statement about
 git
Message-ID: <20230228214703.22tswl2ne6zssuy5@pengutronix.de>
References: <20230228134657.1797871-1-u.kleine-koenig@pengutronix.de>
 <875yblzjoe.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oy5hrz5low6rk2la"
Content-Disposition: inline
In-Reply-To: <875yblzjoe.fsf@meer.lwn.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--oy5hrz5low6rk2la
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Feb 28, 2023 at 12:14:41PM -0700, Jonathan Corbet wrote:
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
>=20
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >
> > The "^0" doesn't have the described effect to only do fast-forward merg=
es.
> > For example
> >
> > 	git checkout 055efab3120b
> > 	git merge v5.2-rc1^0
> >
> > creates a normal merge commit. In fact "v5.2-rc1^0" only refers to the
> > commit the tag v5.2-rc1 points to.
>=20
> So that pattern came straight from Linus, and it still works fine for me
> - just tried it and got the expected fast-forward.

Yes, git merge v5.2-rc1^0 creates a ff when done on a branch that is
fully merged into v5.2-rc1. But then so does

	git merge v5.2-rc1

, the "^0" has no influence there. In the example from my commit log
(that doesn't result in a ff) the only difference is the generated
commit log for the non-ff merge. At least for me I get

	Merge commit 'v5.2-rc1^0' into HEAD

with the ^0, and if I drop the ^0 I get:

	Merge tag 'v5.2-rc1' into HEAD

	Linux 5.2-rc1

and a valid signature. (So I'd say the variant without ^0 is better.)

> Maybe you have something in your git configuration that makes things
> behave differently?

I think the behaviour for me is the same as for you. "git merge
v5.2-rc1^0" isn't wrong per se, it does the right thing in the described
situation. But that's not because of the ^0.

> > Fixes: d95ea1a4e1fb ("docs: Add a document on repository management")
> > Signed-off-by: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> > ---
> >  Documentation/maintainer/rebasing-and-merging.rst | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/Documentation/maintainer/rebasing-and-merging.rst b/Docume=
ntation/maintainer/rebasing-and-merging.rst
> > index 09f988e7fa71..85800ce95ae5 100644
> > --- a/Documentation/maintainer/rebasing-and-merging.rst
> > +++ b/Documentation/maintainer/rebasing-and-merging.rst
> > @@ -213,11 +213,7 @@ point rather than some random spot.  If your upstr=
eam-bound branch has
> >  emptied entirely into the mainline during the merge window, you can pu=
ll it
> >  forward with a command like::
> > =20
> > -  git merge v5.2-rc1^0
> > -
> > -The "^0" will cause Git to do a fast-forward merge (which should be
> > -possible in this situation), thus avoiding the addition of a spurious =
merge
> > -commit.
> > +  git merge --ff-only v5.2-rc1
> > =20
>=20
> Git was fixed a couple of years or so ago to do the fast-forward by
> default when it can, so the original advice in this file is unnecessary
> - as is --ff-only (most of the time).  So the patch is worth applying,
> but I may tweak the changelog some.

I think mentioning --ff-only is good, because then git merge does the
right thing independant of the configuration. And it errors out if a ff
merge is not possible.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--oy5hrz5low6rk2la
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmP+dlQACgkQwfwUeK3K
7AnCBgf6A+uQr8yngICzVcuR88kPwK6twAfP6VQQAz0WYXanZJIFWmf9zjDgRjel
YEtO/sd1DHcWLq8dqj7d59ZbAzeFt/xBTnDMjWSzkp8D22A3EhbVe1KwFp6Y64pT
xXLkqV0OFN59aAPp3bKT5QCuKa/xR9Y+3geyudvaaeDhTP4JX8DucZU8o9V64PQb
qgNBFAHBheBcbfs3EQ3XvfRmNDD30iiObX7P80ZO0MPqnI2+25fgIG/TuRxe/pfF
x7RNK16OlNHOCvIlN1xjUiYWAtC1/mvkowJ0sxg5DRZ1JbBFZmSTHz1xW4arzphI
ManONmy7XutThNm4tO5x1trKNgwstQ==
=17jd
-----END PGP SIGNATURE-----

--oy5hrz5low6rk2la--
