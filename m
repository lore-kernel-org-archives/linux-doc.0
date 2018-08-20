Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D34187D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 Aug 2018 20:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbeHTXfw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 Aug 2018 19:35:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:35276 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbeHTXfw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Aug 2018 19:35:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Aug 2018 13:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,266,1531810800"; 
   d="asc'?scan'208";a="66737207"
Received: from jtkirshe-desk1.jf.intel.com ([134.134.177.59])
  by orsmga008.jf.intel.com with ESMTP; 20 Aug 2018 13:18:50 -0700
Message-ID: <8cf91e5fb848eecd98a2f9493387906b3a5f1506.camel@intel.com>
Subject: Checkpatch False positive
From:   Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Reply-To: jeffrey.t.kirsher@intel.com
To:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc:     netdev <netdev@vger.kernel.org>,
        Linux Docs <linux-doc@vger.kernel.org>
Date:   Mon, 20 Aug 2018 13:21:30 -0700
Organization: Intel
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Zj6dTE/inR32q4gAsWeR"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--=-Zj6dTE/inR32q4gAsWeR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Checkpatch.pl should probably exclude *.rst files from the SPDX License
Identifier check, since they are documentational files, like *.txt.=20
Here is the warning message I got on a recent documentation patch I
created.

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#28: FILE: Documentation/networking/fm10k.rst:1:
+Linux* Base Driver for Intel(R) Ethernet Multi-host Controller

total: 0 errors, 1 warnings, 0 checks, 162 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-
inplace.

.apply/v4-Documentation-fm10k-Add-kernel-documentation.patch has style
problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

--=-Zj6dTE/inR32q4gAsWeR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiTyZWz+nnTrOJ1LZ5W/vlVpL7c4FAlt7IsoACgkQ5W/vlVpL
7c5NTA/+MG99h5O1dc507JtRFykv/67ENLnVFlczVoQM1y6bbvEFds5P8rnkfflz
hVnrrsQoSBKpLbRJaLn/tKltKuN/Y1l93AfOjFhE0WTI4zlOaEom4k9tQ3N9KfLi
YzqQHshrsSwqTGucR2iVCkvSRQoazl4VihvBazUUUzaFsPNg/Kv2VfPCsKgByzw/
rHUSTuTV/tlJLkz90PXPxjI4xCz58LYC6i2M+7u1iQKfjR5Lbd9m/FJ6JoDfU+bQ
DJrVxdZZQPC+cYvOPNj7hX/qyoVsgjsKExlpPfuQELyczhkUEQ8r7LqwLNE7Jou4
eyfW20bV7f58r/HSkwXfKF1SXFwl1l+id3C2eVAwTz6MnPCattDpozRj+ItTHRXM
MttTHHZ4HNvQYRx+Zyumb/19hxeXCGbAFjGzTaM1TzvH1qeWQn2SxuNX3BLyMeTD
m+cEW/YGVu2/NQq+EZd+cjHGe5B9EjWUaaDEWCBpPRFiiT/T6ri2qMxBqfQIutuf
FbQqW6a9P+YLo45YmzhSlrsuRpVYOXMB+m5VndSaIe//3g+MAsfHm/0ZsDDXXd0c
qBlttU1FJsrXASwmqN2TnlSnRuT/vEhZbmtILO6GCElpuAyMf65lhtMXPs8vz0iS
VjduoIRQTrq//hX/WhiWzA9L2wS7Vb9//p6jtEp/IdifEpHCdW0=
=Hd99
-----END PGP SIGNATURE-----

--=-Zj6dTE/inR32q4gAsWeR--

