Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D437C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 03:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343812AbiDSDE5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Apr 2022 23:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbiDSDE4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Apr 2022 23:04:56 -0400
Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 8BC3FE0D1
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 20:02:15 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650337335; h=Content-Type: MIME-Version: Message-ID:
 Subject: Subject: To: To: From: From: Date: Sender: Sender;
 bh=1rL2vp7V7+wKoQ87BcU2C7fDdhb8wqUApGLXA1ggxm4=; b=ScQWv/e7Y9B35bI1i1tPLc7aMYXjy7Xz4IpX4FrnfAxrKZveDApD9FRJbmAwNHBVKksUzqx5
 hpuiT4Lz8xAqId2Sb3L4XOeHnIxdUjmrm02+lo5IpH1zH5Z1UvX/+KULS2lWFSdk7yzlW/3Z
 RDvrzYYSayoJmYjlGytePvYU7sylFjI7y2oXrzbJkZV9ojzz3O1+NNJAegQtDWdoOjBTzSD/
 qZfRAfrse1ttqe4eJRZQ9kLka3OCk192sEXxwU89cbtwSHP7lLGTGthugWx8MV8p/sloamA5
 SXWTaNYuBtkg7dX8x3zsP44rM2jr3q9liH0imB8iVtNsg9y7xWaJdQ==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyJkNWI4MiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWM2ZCJd
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 625e2507487c9ee854800175 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 19 Apr 2022 02:57:11 GMT
Sender: codeagain@codeagain.dev
Date:   Mon, 18 Apr 2022 23:57:06 -0300
From:   Bruno Moreira-Guedes <codeagain@codeagain.dev>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
        Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH 0/2] Docs: Update information at changes.rst
Message-ID: <cover.1650336366.git.codeagain@codeagain.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bpzzsdc6houvacyh"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--bpzzsdc6houvacyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add and update information at 'Documentation/process/changes.rst'. The
text has outdated kernel version and misses the 'cpio' build
requirement, necessary for the `kernel/gen_kheaders.sh` script called by
the install target.

The PATCH 1/2 fixes the missing cpio requirement, while PATCH 2/2 fixes
the kernel version.

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
Bruno Moreira-Guedes (2):
  Docs: Add cpio requirement to changes.rst
  Docs: Update kernel series in changes.rst

 Documentation/process/changes.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--=20
2.35.3


--bpzzsdc6houvacyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl4lAgAKCRAZtd3tyEY2
kpd3AP9O+BHCyMUtLB86c1qgQEfZhDCee86AS1T4mqPw/ZIdOAD+KaTrWFtyqDTT
7m3mQ+XzO7ShHw1XylPSkQr76iV3sgQ=
=zLsk
-----END PGP SIGNATURE-----

--bpzzsdc6houvacyh--
