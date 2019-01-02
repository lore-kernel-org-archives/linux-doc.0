Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DD157D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfABUCL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:02:11 -0500
Received: from wes1-so2.wedos.net ([46.28.106.16]:40538 "EHLO
        wes1-so2.wedos.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfABUCK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:02:10 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so2.wedos.net (Postfix) with ESMTPSA id 43VMQS64bbztR;
        Wed,  2 Jan 2019 21:02:08 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:02:05 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 5/8] doc: gpio-mvebu: fix broken reference  to
 cp110-system-controller0.txt file
Message-ID: <31435d5b8036734f6568c24037e417dc2a400d13.1546457947.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The cp110-system-controller0.txt file was renamed to
cp110-system-controller.txt.

Fixes: 4aa5496980e4 ("dt-bindings: cp110: rename cp110 syscon file")
Signed-off-by: Otto Sabart <ottosabart@seberm.com>
---
 Documentation/devicetree/bindings/gpio/gpio-mvebu.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt b/Docume=
ntation/devicetree/bindings/gpio/gpio-mvebu.txt
index 38ca2201e8ae..2e097b57f170 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
@@ -14,8 +14,6 @@ Required properties:
=20
     "marvell,armada-8k-gpio" should be used for the Armada 7K and 8K
     SoCs (either from AP or CP), see
-    Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0=
=2Etxt
-    and
     Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.=
txt
     for specific details about the offset property.
=20
--=20
2.17.2

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGLwACgkQgjuumfi+
HjxNeg//dqOuDZq4fDHCdkFA7W6rOFTqTtOfOusJwCa8YnMiw+E5XxHPRcW7kwH5
91Uz/p7/lKXzyPuzrwm206rzrN+8m2AoOzbFNQagxjZ1p/ZDaa9pfJO0XBEWv3fi
Nm7RtSZ9F1n384Gqhsb/cZ72nWrctuiiOoIeQNlfchHe3sZHD3DWdJyE3pg3Wzrb
Val3QcrBkxIKaKY5DkoKe70K0/ev1ITjD2rVFaqOztE1JcvXzlLbSsxJUQOR8dN2
qOmsvdRuopnmybB1dkPN57NYvdI+qEepfT7kT1FNxUCRvWlVg+WNTInK/N1hGAmN
xmYwSG4tCCgwDAQHpiXBp9rWvk8F9gp+iZEiiHs9kcepMlfU5LAMFxXcoMMdqVbG
pgo+zpczi+N8QHJ4c8dhUbiSeBHIgew480RXSxclAzgV34QZFENcjXU9AAzwBgl/
vjwhxMMZwM/fnIce4/3qnoNRtp1NMrFmLiFHrtcUM/YO5qP0FokXrrhax5aCXQKA
IKzGFHXGQSCbajYFEtwsYkMuSqEcminiIYsg1V54R8dPjlPKKcr315WiKRpwzR3N
iN3E5vRAgAMXUVShJ2dCSbwYqXlK17SPi+a5t9AocS0C2N8VNcIyqrT2i8XhuHLB
pwCq2y5VOjh875RTHAxgam59B7liHtqIirWbpddGiBvB4UxuLUM=
=WPyM
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
