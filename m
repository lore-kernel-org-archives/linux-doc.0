Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 06FFB7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfABUCc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:02:32 -0500
Received: from wes1-so2.wedos.net ([46.28.106.16]:50030 "EHLO
        wes1-so2.wedos.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbfABUCc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:02:32 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so2.wedos.net (Postfix) with ESMTPSA id 43VMQt3RrVztn;
        Wed,  2 Jan 2019 21:02:30 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:02:27 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 6/8] doc: scsi: remove reference to tmscsim.txt file
Message-ID: <a7e4bb18f9363ff42f257414d8aea36f465e4256.1546457947.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The tmscsim.txt doc file was removed in c121107d0f84.

Fixes: c121107d0f84 ("scsi: documentation: Obsolete documentation reference=
s")
Signed-off-by: Otto Sabart <ottosabart@seberm.com>
---
 drivers/scsi/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index f38882f6f37d..6cbc391689ad 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -1196,8 +1196,6 @@ config SCSI_AM53C974
 	  PCscsi/PCnet (Am53/79C974) solutions.
 	  This is a new implementation base on the generic esp_scsi driver.
=20
-	  Documentation can be found in <file:Documentation/scsi/tmscsim.txt>.
-
 	  Note that this driver does NOT support Tekram DC390W/U/F, which are
 	  based on NCR/Symbios chips. Use "NCR53C8XX SCSI support" for those.
=20
--=20
2.17.2

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGNIACgkQgjuumfi+
HjyHhRAAh8h/UmcXENQ89yqL+8Dpdsd+wSAYxK1ILEScDxI0SL3iih1SxHussNa8
yJGGCGofZp4NNNnvnpcU6sa8a5lZjaNcEQEEyzY5XZ5nYoAe1sT6CysoJcNWMyoo
eQy4I40NaknNlmp5G/c2EyFYpBBE7dBvG6qwKXLeE0iddeIEY7dvb4+6v/QRMymN
BnWM0rDC7GdmKYTBVK/SLwQ5kNR6+z6eL5YkU73mjxJTS4uhmYH/9QvqI9Cs6SJE
PJeiB4Qv/uSUi4WAUTxFUowhoKDnesJicTNPv12rzgdwF4I2yF45T2OtqILlojQ5
8MDquK+rwTvXyi5YtuDrVxUNeJAAWg3AZ2ra/fbsCT7je+JZ7cfqw13OeksbF6RK
6ItN4Y57VAY30VLkzqj6v4A07i/UjwjRloM5TecQV5s4kLwmPtGp4XA/6JKRcjG4
ZkRn8drXeDdgBsLg47t2bWovpbDpgDignmUEsFJ0nyJaG27yxTlkRTYk2PAjOtsg
/RZ+3LBzvnk1mgf7jvSqpFWffJkcZd8YVA9ZJWOtPL5fTKJQVp1orpPuWOCSQ+vT
tj0b9nWL2CnuvSEZXw3O9MJ7CZsS/QCKb64bbjJiZxi3ei6FPr2SHiWa+qXl7MZD
tcL+tN2gsNLx48oI1xe0ZkyS0qrn6IMo7h3is2G0DtFnFplXzuE=
=9XLX
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
