Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981CBC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 14:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351072AbiDSOuc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351049AbiDSOub (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 10:50:31 -0400
Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id AB5B72AC65
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 07:47:47 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650379667; h=Content-Type: MIME-Version: Message-ID:
 Subject: Subject: To: To: From: From: Date: Sender: Sender;
 bh=t6kTMyvUWlvIMDWuRhK4XgWIlIwiKrKDcGeXHhzBiD8=; b=Wnh8QODCJfJblj5R9KAOgpXXeQK1B499hUJ2PpV0mSU+oT+8hhUfO3vsxyMAaTr8bJ8YSC6C
 0zdYHZm8+yFTBEOaKtg7e0FOlk6voCKf4W0YoKRDiRRRb6o7r2hZM0BMSszb2n7BKujlHa2b
 H/JGGlEoSZnjj0lFoxX9zfHu30UEtvmnkD+/yUDDJKHJytu9dDl55Pt3JmEEu4BuWIfOE0Sk
 HCamm1mmLbhKoP0ipQrBxYV83NmvceOqpFhfxrJl+s1cFrpGS+OCp2NH8lP5qtuudelnmx1q
 3ZsOmHHtdF/Vvq7HQDbTbOhwH3XsqTqI+unM/PFySpSmcGcsUt2h7A==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyJkNWI4MiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWM2ZCJd
Received: from AN5Bruno (dynamic-user.170.84.57.33.mhnet.com.br
 [170.84.57.33]) by smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 625ecb8f225c4690820943de (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 19 Apr 2022 14:47:43 GMT
Sender: codeagain@codeagain.dev
Date:   Tue, 19 Apr 2022 11:47:38 -0300
From:   Bruno Moreira-Guedes <codeagain@codeagain.dev>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
        Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v2 0/2] Docs: Update information at changes.rst
Message-ID: <cover.1650376049.git.codeagain@codeagain.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dir4xtje6p7ta4sv"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--dir4xtje6p7ta4sv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add and update information at 'Documentation/process/changes.rst'. The
text has outdated kernel version and misses the 'cpio' build
requirement, necessary for the `kernel/gen_kheaders.sh` script called by
the install target.

The PATCH 1/2 fixes the missing cpio requirement, while PATCH 2/2 fixes
the kernel version reference.

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
CHANGE SUMMARY
   version: v1  v2
[PATCH 1/2] *   -
[PATCH 1/2] *   *

CHANGELOG
[PATCH 1/2] Docs: Add cpio requirement to changes.rst
        v2:
                - No changes
[PATCH 2/2] Docs: Replace version by 'current' in changes.rst
        v2:
                - Renamed from 'Docs: Update kernel series in
                changes.rst'
                - Changed approach from the original, replacing 4.x by
                5.x, to using 'current', as suggested by Matthew Wilcox.
---
Bruno Moreira-Guedes (2):
  Docs: Add cpio requirement to changes.rst
  Docs: Replace version by 'current' in changes.rst

 Documentation/process/changes.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--
2.35.3


--dir4xtje6p7ta4sv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl7LigAKCRAZtd3tyEY2
klMEAQD7GhNwW69LkRR+NiYprOk0un5iHf7yuuhTWrDAsi8v3QEArHCMNqA6rFQt
uW9gRYzpdqGJa979zNlFM32xj9Zacww=
=XfWs
-----END PGP SIGNATURE-----

--dir4xtje6p7ta4sv--
