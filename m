Return-Path: <SRS0=J8tN=EK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EEAC2D0A3
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 22:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA76B2074B
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 22:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qi4eAzLw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732131AbgKDWHD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Nov 2020 17:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgKDWHD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Nov 2020 17:07:03 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DCAC0613D3;
        Wed,  4 Nov 2020 14:07:02 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRLNF0XJ9z9sVD;
        Thu,  5 Nov 2020 09:06:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604527618;
        bh=XNrDkiWCKc4iCIZ3KeqYm4bkz+Kp3eURpmIVbbP0CmQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qi4eAzLwSgoTvmNevqeXAknL/UDcy6E14Sx3nkthZre3VjBBqULpmHX5j+wAKKGLT
         ipqLXT4Jb0qBDsr3At11FLGpGh0JDSUe/uPB3iLFjBy5l23rWHExudPiiQ6AtF//BQ
         G/zkRA/Xcqnk2mJVWh73NeFpCJDxm5RH3W8RhMvV5zG08EmxY2ENbgmaHL8jEaM/EB
         DxrGKF8OBz6weRyovbSBQLncMAWu4uJht1RjG2tjf9WGpSXhLmCZKwK0GJLZPSTtA1
         ew6oQyjjxVYQwYQ+Z1N/brHOVQp03w2Urz0gYil7+97SmZ/Ry32EcFpLprwbZCEWTq
         gmy8ZlEa0p+aQ==
Date:   Thu, 5 Nov 2020 09:06:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL] Docs-build warning fixes for 5.10-rc3
Message-ID: <20201105090652.003eb7bf@canb.auug.org.au>
In-Reply-To: <CAHk-=wghhw0SpqSKKUqt5eum=UfLD3Qa0suoRxLy_cJc4hChug@mail.gmail.com>
References: <20201103124420.46bf5a37@lwn.net>
        <CAHk-=wghhw0SpqSKKUqt5eum=UfLD3Qa0suoRxLy_cJc4hChug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ecORw=5CeK5vORwvDFwXsH+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/ecORw=5CeK5vORwvDFwXsH+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 3 Nov 2020 13:18:27 -0800 Linus Torvalds <torvalds@linux-foundation=
.org> wrote:
>
> On Tue, Nov 3, 2020 at 11:44 AM Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > This pull contains a series of warning fixes from Mauro; once applied, =
the
> > number of warnings from the once-noisy docs build process is nearly zer=
o.
> > Getting to this point has required a lot of work; once there, hopefully=
 we
> > can keep things that way. =20
>=20
> I wonder if it is quiet enough that we could make new doc build noise
> trigger some kind of linux-next warning?
>=20
> I know Stephen was at least looking at doc build warnings justding by
> the thread a couple of weeks ago.

What I am currently doing is a "make htmldocs" on your tree and then again
on the whole linux-next release and reporting changes.

There is currently one message produced in your tree (after I add all
the "pending fixes") and I have reported that this morning.  So things
are looking pretty good now - a lot of good work over the past couple
of releases.

--=20
Cheers,
Stephen Rothwell

--Sig_/ecORw=5CeK5vORwvDFwXsH+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jJfwACgkQAVBC80lX
0Gzxuwf+JpGXNXFZbWpCRtB04o2eTjMf+hFrlK3ZDRJ4Q+ADrAf9N5/q4/cryqsZ
GoV4Mjh6eJe3tsAgAStL3D6uRs7VVGQLrCfsEiarMkCofyqnAglxsGrZh+3XptyQ
SzIV7G3SlLkMEaVSbXlQaFjaRVBKbyTHdNV3O/iGaiN6tkv+WBAsoRO1bgO+gCyv
3qzaZAbLETHubnEWEX1WWQ/7tV4rQsrhzHdrLNIvCVNt7p/W6b3pI5mMULe9NN+T
ZjNPtwJhMi89t5RxyIn+slzkNcFUYeqPDD0IJoQ/3/wyWmh+o747W6Ilni0fj8Tz
klftHvgE11NNOZpYXyL+jr5WHooLqA==
=UprJ
-----END PGP SIGNATURE-----

--Sig_/ecORw=5CeK5vORwvDFwXsH+--
