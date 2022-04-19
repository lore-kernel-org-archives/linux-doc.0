Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8C2C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 14:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345605AbiDSPBm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 11:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242560AbiDSPBl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 11:01:41 -0400
Received: from m228-62.mailgun.net (m228-62.mailgun.net [159.135.228.62])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 23EE93B029
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 07:58:58 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650380338; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=GjGIZv1fDSI8+XOsFgpIg9UmNpf9tCa3JfKCPZn26Ls=; b=EnZCf3hKa7r4xBhcDpsqM4iTHzMxLNHms8kJhjhfkQ7ymFL8tVeoZckEz78rnzzoVA/RVQHk
 hP2B2XaAGAI2d8Vz86I1HJ6qrt2FTo8b8nFvAjhPL1/AiSy4ZfLwO1IlFxwPXAoMbTwIVrUD
 JMRkaLygskDXISY2ijihbJJgGL1xzUz8YV/DcjST7jOf4ZbVKGyyekTX5/zHTu/AdIqMjZbt
 m3qnss6rGCbfI+H5RiPAU4Uk18ywoLj3xjdCxPylMG26P9mK/apZtLA04HAEOW3qMGflTCnE
 NFUx7ZDoXzaGLv5ri7V7UxGjDzvNYlrQz3DdVZX1DgLOnWHHFNx6Eg==
X-Mailgun-Sending-Ip: 159.135.228.62
X-Mailgun-Sid: WyJkNWI4MiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWM2ZCJd
Received: from AN5Bruno (dynamic-user.170.84.57.33.mhnet.com.br
 [170.84.57.33]) by smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 625ecbd8487c9ee854b06237 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 19 Apr 2022 14:48:56 GMT
Sender: codeagain@codeagain.dev
Date:   Tue, 19 Apr 2022 11:48:52 -0300
From:   Bruno Moreira-Guedes <codeagain@codeagain.dev>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
        Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v2 2/2] Docs: Replace version by 'current' in changes.rst
Message-ID: <664bdcbb2b33b866de200ac9c05fa020ecb27ffd.1650376049.git.codeagain@codeagain.dev>
References: <cover.1650376049.git.codeagain@codeagain.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="smwaj257h7s7n5bg"
Content-Disposition: inline
In-Reply-To: <cover.1650376049.git.codeagain@codeagain.dev>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--smwaj257h7s7n5bg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The file 'Documentation/process/changes.rst' states the listed
requirements are for the 4.x kernel version. However, there are
requirements updated for the 5.x version, as there might be in other
future versions. This patch updates it to 'latest' so the document won't
be outdated in the future.

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 Documentation/process/changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/chan=
ges.rst
index 41a44e5f47e6..34415ae1af1b 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -7,7 +7,7 @@ Intro
 =3D=3D=3D=3D=3D
=20
 This document is designed to provide a list of the minimum levels of
-software necessary to run the 4.x kernels.
+software necessary to run the current kernel version.
=20
 This document is originally based on my "Changes" file for 2.0.x kernels
 and therefore owes credit to the same people as that file (Jared Mauch,
--=20
2.35.3


--smwaj257h7s7n5bg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl7L1AAKCRAZtd3tyEY2
kjxuAQC2/iSX96CmxkNiFSJlO8cmjxx+nY1jpNuRRBKM/h1rKwEAkBFye8E5g73s
zA5bJaF1FVz9nhBQP1YPEpjT6CgxcAY=
=ytKt
-----END PGP SIGNATURE-----

--smwaj257h7s7n5bg--
