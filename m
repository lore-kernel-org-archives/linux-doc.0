Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB2187D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 Aug 2018 20:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbeHTXrA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 Aug 2018 19:47:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:53541 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbeHTXrA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Aug 2018 19:47:00 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Aug 2018 13:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,266,1531810800"; 
   d="asc'?scan'208";a="78532573"
Received: from jtkirshe-desk1.jf.intel.com ([134.134.177.59])
  by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2018 13:29:53 -0700
Message-ID: <933f909db5ae9bc96c5be2bb503081eb5714adbc.camel@intel.com>
Subject: Re: Checkpatch False positive
From:   Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Reply-To: jeffrey.t.kirsher@intel.com
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        netdev <netdev@vger.kernel.org>,
        Linux Docs <linux-doc@vger.kernel.org>
Date:   Mon, 20 Aug 2018 13:32:33 -0700
In-Reply-To: <20180820202250.GA6345@bombadil.infradead.org>
References: <8cf91e5fb848eecd98a2f9493387906b3a5f1506.camel@intel.com>
         <20180820202250.GA6345@bombadil.infradead.org>
Organization: Intel
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-XgcmMa4YPwKUbiydiA20"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--=-XgcmMa4YPwKUbiydiA20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-08-20 at 13:22 -0700, Matthew Wilcox wrote:
> On Mon, Aug 20, 2018 at 01:21:30PM -0700, Jeff Kirsher wrote:
> > Checkpatch.pl should probably exclude *.rst files from the SPDX
> > License
> > Identifier check, since they are documentational files, like
> > *.txt.=20
>=20
> They're still copyrighted work, so they should still have SPDX tags
> to identify their license.
>=20
> checkpatch has:
>=20
>                                 } elsif ($realfile =3D~ /\.rst$/) {
>                                         $comment =3D '..';
>=20
> so we're explicitly including rst files in the checking for now.

Ah, sorry.  I did not catch that they started to include SPDX-License-
Identifiers for RST files, thanks Matthew.

--=-XgcmMa4YPwKUbiydiA20
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiTyZWz+nnTrOJ1LZ5W/vlVpL7c4FAlt7JWEACgkQ5W/vlVpL
7c78XQ/8D2fNNd1OEzfizlb9OiWOq4v149lCWTbm4Bnpwo0yY+SKoQpvYlVT4FWR
0w0KGPQDSb/7MWsZl6hC3eFVp2D/0YCki5pfwv7Ep33QErtAHh2bK6DyTPC7DQ/h
HxbujapZD9V1CD2Ks1oLNqUdn2bLwJp0U+dql9KCRoO7qhnv+lvjRXnofXvw49kS
MdadseH2K8ej36nQBOu+ge1i9Gh2OhwoOI5f7p35nOGOsDIUS4PYWW7DaslvtKna
WwutyBR4aMpE0w8C6aXL4BBUUvvn+XSIEMD3Cprwnr6Gn67N57OaQqKWi4IPXJTe
BMwwoXWpwl6qdcMnrUj6erg/QHVqUeYlefbmWW6U7kCHgzzj5q5cpMHkoGveO1BF
Iik0HGJ0YL51lRejDI/aEl/VNf5bfCMmTEOK2AK9GeOiN80q7mDRF8jTXJ/O6Wyq
wUMKvnOZA1tl1/0acCoYfCPMHB07z3eGPWxAhna2H+L/7ixBD+zd/0CgHMapxtJi
tgk5gDwHEJA7UryU4cu4k1pE54VDznYjvoBoxrlcn8cB0NSFqYP8VbXWUhXcqjJE
gU791hLOR1YOMsTbEifla1Isc67jLNOxp1fOHi+NgtxnXv/b0S4JGXlhyeZDXhrK
EVkuSYunDqFcZws6YCN8KEqkJxjZZCri4s2DYZG7Y9LHY7a//cQ=
=U0ww
-----END PGP SIGNATURE-----

--=-XgcmMa4YPwKUbiydiA20--

