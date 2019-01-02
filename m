Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D8967D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfABUB4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:01:56 -0500
Received: from wes1-so2.wedos.net ([46.28.106.16]:49415 "EHLO
        wes1-so2.wedos.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfABUB4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:01:56 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so2.wedos.net (Postfix) with ESMTPSA id 43VMQB5NjxztR;
        Wed,  2 Jan 2019 21:01:54 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:01:51 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 4/8] doc: trace: fix reference to cpuidle documentation file
Message-ID: <a28e6e4d36382459a34be8d027db4cdc1deb8dcb.1546457947.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Old cpuidle/sysfs.txt file was replaced in aa5eee355b46. So, refer to
an updated file.

Fixes: aa5eee355b46 ("Documentation: admin-guide: PM: Add cpuidle document")
Signed-off-by: Otto Sabart <ottosabart@seberm.com>
---
 Documentation/trace/coresight-cpu-debug.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/coresight-cpu-debug.txt b/Documentation/tr=
ace/coresight-cpu-debug.txt
index 89ab09e78e8d..f07e38094b40 100644
--- a/Documentation/trace/coresight-cpu-debug.txt
+++ b/Documentation/trace/coresight-cpu-debug.txt
@@ -165,7 +165,7 @@ Do some work...
 The same can also be done from an application program.
=20
 Disable specific CPU's specific idle state from cpuidle sysfs (see
-Documentation/cpuidle/sysfs.txt):
+Documentation/admin-guide/pm/cpuidle.rst):
 # echo 1 > /sys/devices/system/cpu/cpu$cpu/cpuidle/state$state/disable
=20
=20
--=20
2.17.2

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGK8ACgkQgjuumfi+
Hjxp5w//dKSMdZAcFmAUvYjut4yOU/b5ATlDpcmoGKompUUdAZW2SaXGE5WfB854
A9W2fTdkU139UtrT2HwBSsnEGwgjcbaYFucjebzHjXl7h7R6ydQ+xI9yi/w7M6S6
N4jShpVtMeRGZL4CMiYP1k0cktXwJf8//5dVeptVGMxQagbo4btfwWlvodzYBgYN
2cF4puRXwOzIm6kr4o/0okhrM4/ok6Tz3fEBWKhf9ztkizefzEnny1zz2y+cMnke
NwQx5PpblQoHfOHNK36B2Av8ktqsiEubsM+olvmLespUYONHEodZVg4UcTnH+elG
tc+v5e/Wfcq3VmYbdYtBwgWUMJ3ECTK44P9l13DGpIrrN4VytQMkl+oFZqMScHD0
ftA68cMaPoa3kHOBTM/adLDZvU5FkfmhHUvYLpmp1uATK2gT5f3KubZX9gYmbDh4
Dsdo4ghCTCNCI99VJ0rm03f1wIy78zBYrLRw20tQtIV7mtpKGe9XK3+jd6KSlQoI
qDC4H7hYPFMXSRoanz0gaE6DpaxQdvGmroGzRt4sVYWHPBeMWFjBeXCL+3Muz6Hx
gU5mKhJJ/N7TEFrIkU0Im0p9g64PStr6OXgXJwzHtRFNThe+xfrv6fX2bSEnBXCk
+T1DGCd7Y7tf6klX3tGHRoOf69irX7ql3YjpMqJJgaBrkn1yuHo=
=1yvA
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
