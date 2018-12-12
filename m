Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E6127D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 16:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbeLLQ1c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Dec 2018 11:27:32 -0500
Received: from mga09.intel.com ([134.134.136.24]:15352 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbeLLQ1b (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 Dec 2018 11:27:31 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2018 08:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,344,1539673200"; 
   d="asc'?scan'208";a="283032975"
Received: from jtkirshe-desk1.jf.intel.com ([134.134.177.96])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2018 08:27:31 -0800
Message-ID: <1f0fdfbc345052633adae5f2adc41324c962bca1.camel@intel.com>
Subject: Re: [PATCH] docs/networking: fix formatting of Intel drivers
 documentation
From:   Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Reply-To: jeffrey.t.kirsher@intel.com
To:     David Miller <davem@davemloft.net>, rppt@linux.ibm.com
Cc:     corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org
Date:   Wed, 12 Dec 2018 08:28:00 -0800
In-Reply-To: <20181211.225049.1058545043529020701.davem@davemloft.net>
References: <1544371791-31192-1-git-send-email-rppt@linux.ibm.com>
         <20181211.225049.1058545043529020701.davem@davemloft.net>
Organization: Intel
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-v9U6KiVK+gaCKQbujl1T"
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--=-v9U6KiVK+gaCKQbujl1T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-12-11 at 22:50 -0800, David Miller wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Sun,  9 Dec 2018 18:09:51 +0200
>=20
> > The documentation of Intel drivers is missing the heading adornment
> > for
> > document titles.
> >=20
> > This causes the generated html to have TOC entries from these
> > documents to
> > appear as top level TOC entries:
> >=20
> > * Linux* Base Driver for Intel(R) Ethernet Network Connection
> > * Contents
> > * Identifying Your Adapter
> > * Command Line Parameters
> >   * AutoNeg
> >   * Duplex
> >   ...
> >=20
> > Add overline heading adornment to document titles.
> >=20
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>=20
> Jeff, I am assuming you picked this up.
>=20
> Let me know if you haven't and you want me to integrate it.

I got it covered, thanks!

--=-v9U6KiVK+gaCKQbujl1T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiTyZWz+nnTrOJ1LZ5W/vlVpL7c4FAlwRNxAACgkQ5W/vlVpL
7c4UhA/9EXuylAdB8zh57fOKOm3s420IgTtIrTe3hVAecCVoh7zQr38mbn61dCVm
8xyZ5qTy354YJhJSygu5C+TUQwCGSLh788VLGtrkUijoBmZPQOH4S8Rs9bnFlE3C
1hgBTYUJq4QFZQsjhcVYu9oSYJhOLGmAPpMYecbjuRnH76w4glnSCZhWsBk+0+CV
RA3qAlq/QXd5HFq9wZJlxD4aAsx/id1J/xsGXi7bzGyQTnCnPCEKhAY94X31Wd3v
+6WSxKJdup56JtSzLE3TDwY0l+4ZDe3h+jKkbtgfZNKNgXsT69Yp9bznbjNVcXmP
ck5TPpXxxQsyDgjgx33WC7OtAyQ+u7mNol9Ir4LiP+4mtEPBdYu+hAXF62TSOcjF
QkrQJlOEx6VWOztvhH+SpPK6fWu2K6tlKbQ7etNNzc8/prdgTWsWemyYXHFaSiDr
hv2zl6FIs29o3eoAtXGTwiUrvMPPpEnWeDZnOXRyWb3gyN+f0zwBwb0Pa/y50wBb
PYNkefwbHFluL0rD4dJJDHLktGzzobXx2e+MaS3PMiLVVZVgvJHeYDFkWx+YN+JK
4d1G9ALxW4AvVHPWkyVONtb9cfNE0b5aHJ0jQQxs5NbUspYeAFoLNLEu3SZr5HeY
oE4Q0CLJc2LgEHnuzNk5WCtHs09TcGre3hTJe/spukJzdjV+A0o=
=DhcH
-----END PGP SIGNATURE-----

--=-v9U6KiVK+gaCKQbujl1T--

