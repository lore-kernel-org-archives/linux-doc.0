Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A57C64EC4
	for <linux-doc@archiver.kernel.org>; Wed,  8 Mar 2023 18:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjCHScW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Mar 2023 13:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjCHScV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 13:32:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB8194F54
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 10:32:18 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZyaE-0005Rb-NE; Wed, 08 Mar 2023 19:32:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZyaC-002mNl-Ow; Wed, 08 Mar 2023 19:32:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZyaB-003MEg-Qu; Wed, 08 Mar 2023 19:32:11 +0100
Date:   Wed, 8 Mar 2023 19:32:11 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Rientjes <rientjes@google.com>, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: rebasing-and-merging: Drop wrong statement about
 git
Message-ID: <20230308183211.dm6jbxuenrnyr4at@pengutronix.de>
References: <20230228134657.1797871-1-u.kleine-koenig@pengutronix.de>
 <875yblzjoe.fsf@meer.lwn.net>
 <20230308073058.ipiudixcn2fpwaus@pengutronix.de>
 <87v8jbl32t.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r2l6atz6gk6oh6uj"
Content-Disposition: inline
In-Reply-To: <87v8jbl32t.fsf@meer.lwn.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--r2l6atz6gk6oh6uj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 07:39:38AM -0700, Jonathan Corbet wrote:
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
>=20
> > On Tue, Feb 28, 2023 at 12:14:41PM -0700, Jonathan Corbet wrote:
> >> So the patch is worth applying, but I may tweak the changelog some.
> >
> > I spotted a414684e3b735a4114c19295a07e8cb2eb889dae in next now. You made
> > the changelog read:
> >
> > 	The "^0" syntax is no longer needed to fast-forward to a mainline comm=
it
> >
> > I'm willing to bet that ^0 was never needed to force a fast-forward and
> > using it was never had an advantage.
>=20
> https://lore.kernel.org/lkml/CA+55aFwaxsNZ0ACQkASdDTbSrdcHMJpFPtswK485tEW=
RBVVYrA@mail.gmail.com/
>=20
> Git has since been changed, as I said before, so that it's no longer
> necessary to use the ^0 notation.  So I maintain that, while the doc
> change was good, the changelog wasn't quite right.

Hmm, seems I'd have lost my bet. So it seems there was a time when git
made a ff to merge a commit, but it didn't when it was asked to merge a
signed tag that points to the same commit.

TIL! Seems I have to withdraw my objections to your wording.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--r2l6atz6gk6oh6uj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQI1KgACgkQwfwUeK3K
7Aks2gf+MOQ1qGaWTWG3K4UnALqGPXGSCqxaOlPCjIl+MBlE8XTNwXa1xBHRT+rv
odKhWRQk3VyuREOHD3zqTWYMXJNzxm/mmpKLQX8W4UtcdJWJSzVJM4BAcHOmHamy
dyZ/TBO8IR79qzzbr2URCAGGd2HKeuXUDX42xhitHI69HEmncwLRuJVhY6dD7UIx
stNKQvytMxOVKsA8NZwSwzJDb66rXgNSB+xz9UA7oI/h6mOu4NyQ8iUrE3ZodjWt
zQ3SGhNU47z/63AeR5U9bGdr+ew7IP7xjg1voiHSGz6tZYzCvukz9WLZX/Oc53Li
d1IqNjeQlvPQLho6CqLlffFok3eglQ==
=zqRx
-----END PGP SIGNATURE-----

--r2l6atz6gk6oh6uj--
