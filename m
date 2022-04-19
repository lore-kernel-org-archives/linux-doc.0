Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41EAC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 14:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351305AbiDSOvG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352193AbiDSOvE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 10:51:04 -0400
Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 858D73A1B1
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 07:48:20 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650379700; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=uM5EMjf3NP4QzCk0UqXPKFMY+n748Cl/JUdN11a6lQk=; b=ZZAPByZW9F/NdRf0zcIisTwTD2ZHwnDAQY+ytfMz5bOQwAnS1/Tr9CgJ9EEOVTvbLiAFQ4Xo
 0h23dgM9vaE77jMfWuGRVfLy5o1T0tlSXr9PI7lOrzFb52xqFd6TGkgWn49tdxs9Gt8Ehhqx
 XC2v6YVoctKOMQ+GZlcbcUXL768KkZHYK23kbr1pTcag1MDsl0V/6Hvs6mstq7aNBYNKlAhu
 LX/ZamIy3P1Lxjw0Sryijan6/Mo62XtecIgRCvjA7ekQuYjDZGIPGNzlDTZZb17HaJazPK9/
 2ECLgSiKuFToIi9teBrdWKAut+7ITLp21eyiO8/u4GfxC+0Vmc5Jyg==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyJkNWI4MiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWM2ZCJd
Received: from AN5Bruno (dynamic-user.170.84.57.33.mhnet.com.br
 [170.84.57.33]) by smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 625ecbb3c172fc5066005441 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 19 Apr 2022 14:48:19 GMT
Sender: codeagain@codeagain.dev
Date:   Tue, 19 Apr 2022 11:48:15 -0300
From:   Bruno Moreira-Guedes <codeagain@codeagain.dev>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
        Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v2 1/2] Docs: Add cpio requirement to changes.rst
Message-ID: <16abd8eb6a5c8398a030ae5d8919d5c8e92e2af1.1650376049.git.codeagain@codeagain.dev>
References: <cover.1650376049.git.codeagain@codeagain.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ro2gw6s6psca55fi"
Content-Disposition: inline
In-Reply-To: <cover.1650376049.git.codeagain@codeagain.dev>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--ro2gw6s6psca55fi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The install target requires cpio to run the `kernel/gen_kheaders.sh`
script, but it's missing in the requirements list at
'Documentation/process/changes.rst'. This patch adds it to the list.

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 Documentation/process/changes.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/chan=
ges.rst
index a337e8eabfe1..41a44e5f47e6 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -56,6 +56,7 @@ iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
 bc                     1.06.95          bc --version
 Sphinx\ [#f1]_         1.7              sphinx-build --version
+cpio                   any              cpio --version
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -458,6 +459,11 @@ mcelog
=20
 - <http://www.mcelog.org/>
=20
+cpio
+----
+
+- <https://www.gnu.org/software/cpio/>
+
 Networking
 **********
=20
--=20
2.35.3


--ro2gw6s6psca55fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl7LrwAKCRAZtd3tyEY2
khKiAPwMG6OI0lpf1AqUjruuyLLHmrs28B7fL3Coejgkddt3ywEAlONSYrtnoWbg
xSXIjuZTI63w/6yE6VW9SjVVJ1KOFws=
=juu4
-----END PGP SIGNATURE-----

--ro2gw6s6psca55fi--
