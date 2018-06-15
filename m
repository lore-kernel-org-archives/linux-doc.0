Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E15D97D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 11:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965713AbeFOLO1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 07:14:27 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33809 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965626AbeFOLO0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jun 2018 07:14:26 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id EA1D38037D; Fri, 15 Jun 2018 13:14:24 +0200 (CEST)
Date:   Fri, 15 Jun 2018 13:14:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 5/5] Documentation/x86: Add CET description
Message-ID: <20180615111424.GA4473@amd>
References: <20180607143544.3477-1-yu-cheng.yu@intel.com>
 <20180607143544.3477-6-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20180607143544.3477-6-yu-cheng.yu@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-06-07 07:35:44, Yu-cheng Yu wrote:
> Explain how CET works and the noshstk/noibt kernel parameters.
>=20
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |   6 +
>  Documentation/x86/intel_cet.txt                 | 161 ++++++++++++++++++=
++++++

Should new files be .rst formatted or something like that?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsjn5AACgkQMOfwapXb+vIrLACdF8+Q8AQ/dM8fzyRDyCCmwlJ/
HQUAoKPtdfC/Lj3jXlarYZh5kidBqA/B
=z2+S
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
