Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C0BB7E279
	for <lwn-linux-doc@archive.lwn.net>; Sun, 22 Apr 2018 10:00:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751234AbeDVKAf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 22 Apr 2018 06:00:35 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58547 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751053AbeDVKAe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Apr 2018 06:00:34 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2041B8039B; Sun, 22 Apr 2018 12:00:33 +0200 (CEST)
Date:   Sun, 22 Apr 2018 12:00:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] [v2] docs: clarify security-bugs disclosure policy
Message-ID: <20180422100032.GA18114@amd>
References: <20180307214624.D4361772@viggo.jf.intel.com>
 <20180309204526.56301f43@alans-desktop>
 <CA+55aFw5+KjVqKUpAMF+-BfE6NuXSNb8qdRtmAWDq6apK2v+sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <CA+55aFw5+KjVqKUpAMF+-BfE6NuXSNb8qdRtmAWDq6apK2v+sA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri 2018-03-09 13:15:31, Linus Torvalds wrote:
> On Fri, Mar 9, 2018 at 12:45 PM, Alan Cox <gnomes@lxorguk.ukuu.org.uk> wr=
ote:
> >
> > If you want to be taken seriously then I think minimum you also need to
> > - Give a GPG key for messages to the list
>=20
> Oh, I don't want to be taken seriously by people who use gpg
> encrypted email.

Heh. I see that gpg has some usability problems, but we do encrypt our
http connections, and email is at least as sensitive.

> > - State what security is in place (encryption etc) to protect the list
> >   itself
>=20
> That could be stated, but it's worth noting the other rules.
>=20
> If you have some long corrupt vendor disclosure period and are worried
> about any good guys finding out (the bad guys probably already have
> it), we're not the list for you anyway.
>=20
> Keep your "we'll keep security problems under wraps so that they can
> be exploited for a long time" emails to yourself, or send them to
> /dev/null.

Umm, they will not sent it to /dev/null, as that is not encrypted :-).

I guess I can act as this kind of /dev/null. It might be useful to
note the issues, and for the serious ones notify you few days before
the "long" embargo is going to expire...

Best regards,

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrcXUAACgkQMOfwapXb+vLi2QCbBRWS347sf1bbosIBKDAAw8KK
FGcAnAttXd3u+EJx2kS05Umez4/P6Nsu
=2kt8
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
