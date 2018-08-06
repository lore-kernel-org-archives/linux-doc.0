Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD0D77E3B8
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 15:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbeHFRxl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 13:53:41 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:42156 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729724AbeHFRxl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 13:53:41 -0400
Received: from [218.187.130.120] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fmhfp-0005Eh-QI; Mon, 06 Aug 2018 16:43:58 +0100
Received: from ben by deadeye with local (Exim 4.91)
        (envelope-from <ben@decadent.org.uk>)
        id 1fmhfm-0002at-Mf; Mon, 06 Aug 2018 23:43:54 +0800
Message-ID: <ddfcefe68752226f906a28de2973f73962e180c9.camel@decadent.org.uk>
Subject: Re: Bug#905116: [PATCH v2] scripts/kernel-doc: Escape all literal
 braces in regexes
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Jonathan Corbet <corbet@lwn.net>, 905116@bugs.debian.org
Cc:     linux-doc@vger.kernel.org, valdis.kletnieks@vt.edu
Date:   Mon, 06 Aug 2018 23:43:54 +0800
In-Reply-To: <20180806071421.081598c4@lwn.net>
References: <20180805164108.GC18030@decadent.org.uk>
         <20180731104946.GA28861@estella.local.invalid>
         <20180806071421.081598c4@lwn.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-sdID1ChDi8OfF2QU5umi"
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 218.187.130.120
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--=-sdID1ChDi8OfF2QU5umi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-08-06 at 07:14 -0600, Jonathan Corbet wrote:
> On Sun, 5 Aug 2018 17:41:09 +0100
> Ben Hutchings <ben@decadent.org.uk> wrote:
>=20
> > Commit 720ac2ef479d ("PATCH scripts/kernel-doc") fixed the two
> > instances of literal braces that Perl 5.28 warns about, but there are
> > still more than it doesn't warn about.
>=20
> So where can I find this commit of which you speak?  I can't find it in
> mainline, -next, or -stable... =20
>=20
> The patch looks good, I'd like to get it in this coming merge window if
> possible.

Sorry, that was the wrong commit hash.  I mean commit 701b3a3c0ac4.

Ben.

--=20
Ben Hutchings
Larkinson's Law: All laws are basically false.

--=-sdID1ChDi8OfF2QU5umi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAltobLoACgkQ57/I7JWG
EQla/g/8Ct3hRi11DzGTHXX3REeBiLK6mKEkPcY2kvc+uhd5TxyzJ2GRu7zD/+Hz
RsaQQGR2K1vgXL/qnHMpRLdxyXagMb6mN7aSGpMrp94XSRf9wQxcOZ2AVXY9QUrJ
3qPW8Hvb42w5KQQyRIY3MdmjcyriRrQukYGRBsZD9+fz60AbP77zzSGwM1THQ4t6
aHWt6c4Gfm1IJBlOjbe5DQgWwu0ylh6v4LXa9fyE1MirV9DlvGjF+dq/Y51Y1j75
hHZKYhvVGi9XEYwRrl4XC1jnfKipd51vR5M/d2jmB2btSEvw1phVX0SpPwf6cGfG
PbaexDY6lL5Qll9KB+OE1kRGZb1n7XRDvIy+FM5vUletjv9/+1yAqJgjND1k1T3a
FnObXOQFcV0sqAqC84P1jQ3JgIC7e+wMXpJcmnoXzqrrpyuJbw/S10Yo8mROOi03
SUdaa1BuS0i6xxQqNuge3QiTqsH9dRCoVf8JrPCbRQqbnlg1vWw1aWg+hlyiACyS
CF5TNUxc8x10k7/nTT4zQfNtD34JNAioY/wRhGr/m+cPQsOCZEJtRUCxQq3RtpQx
r/g49c3Y5/jGo17TGMy+pPJoselXk7KoZM8InzofRVKcZV8gAN8f4Te9gch9jwVp
2uniC8O0bdTuFQjrdGHpsGpGRqjiNQk8W5ZqednI/B+bSkV+LdY=
=sU4X
-----END PGP SIGNATURE-----

--=-sdID1ChDi8OfF2QU5umi--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
