Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 054417D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfABUBm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:01:42 -0500
Received: from wes1-so2.wedos.net ([46.28.106.16]:51338 "EHLO
        wes1-so2.wedos.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfABUBm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:01:42 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so2.wedos.net (Postfix) with ESMTPSA id 43VMPw0wS7zhT;
        Wed,  2 Jan 2019 21:01:40 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:01:37 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 3/8] doc: bindings: fix bad reference to ARM CPU bindings
Message-ID: <e37cabca16342ce3889957b606274e6588254682.1546457947.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The primecell.txt and cpus.txt files were converted into YAML. This
patch updates old references with new ones.

Fixes: d3c207eeb905 ("dt-bindings: arm: Convert primecell binding to json-s=
chema")
Fixes: 672951cbd1b7 ("dt-bindings: arm: Convert cpu binding to json-schema")
Signed-off-by: Otto Sabart <ottosabart@seberm.com>
---
 Documentation/devicetree/bindings/arm/cpu-capacity.txt          | 2 +-
 Documentation/devicetree/bindings/arm/idle-states.txt           | 2 +-
 Documentation/devicetree/bindings/arm/sp810.txt                 | 2 +-
 Documentation/devicetree/bindings/arm/topology.txt              | 2 +-
 Documentation/devicetree/bindings/display/arm,pl11x.txt         | 2 +-
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpu-capacity.txt b/Docum=
entation/devicetree/bindings/arm/cpu-capacity.txt
index 84262cdb8d29..96fa46cb133c 100644
--- a/Documentation/devicetree/bindings/arm/cpu-capacity.txt
+++ b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
@@ -235,4 +235,4 @@ cpus {
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 [1] ARM Linux Kernel documentation - CPUs bindings
-    Documentation/devicetree/bindings/arm/cpus.txt
+    Documentation/devicetree/bindings/arm/cpus.yaml
diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Docume=
ntation/devicetree/bindings/arm/idle-states.txt
index 8f0937db55c5..45730ba60af5 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -684,7 +684,7 @@ cpus {
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 [1] ARM Linux Kernel documentation - CPUs bindings
-    Documentation/devicetree/bindings/arm/cpus.txt
+    Documentation/devicetree/bindings/arm/cpus.yaml
=20
 [2] ARM Linux Kernel documentation - PSCI bindings
     Documentation/devicetree/bindings/arm/psci.txt
diff --git a/Documentation/devicetree/bindings/arm/sp810.txt b/Documentatio=
n/devicetree/bindings/arm/sp810.txt
index 1b2ab1ff5587..46652bf65147 100644
--- a/Documentation/devicetree/bindings/arm/sp810.txt
+++ b/Documentation/devicetree/bindings/arm/sp810.txt
@@ -4,7 +4,7 @@ SP810 System Controller
 Required properties:
=20
 - compatible:	standard compatible string for a Primecell peripheral,
-		see Documentation/devicetree/bindings/arm/primecell.txt
+		see Documentation/devicetree/bindings/arm/primecell.yaml
 		for more details
 		should be: "arm,sp810", "arm,primecell"
=20
diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documenta=
tion/devicetree/bindings/arm/topology.txt
index de9eb0486630..b0d80c0fb265 100644
--- a/Documentation/devicetree/bindings/arm/topology.txt
+++ b/Documentation/devicetree/bindings/arm/topology.txt
@@ -472,4 +472,4 @@ cpus {
=20
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
 [1] ARM Linux kernel documentation
-    Documentation/devicetree/bindings/arm/cpus.txt
+    Documentation/devicetree/bindings/arm/cpus.yaml
diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.txt b/Docu=
mentation/devicetree/bindings/display/arm,pl11x.txt
index ef89ab46b2c9..572fa2773ec4 100644
--- a/Documentation/devicetree/bindings/display/arm,pl11x.txt
+++ b/Documentation/devicetree/bindings/display/arm,pl11x.txt
@@ -1,6 +1,6 @@
 * ARM PrimeCell Color LCD Controller PL110/PL111
=20
-See also Documentation/devicetree/bindings/arm/primecell.txt
+See also Documentation/devicetree/bindings/arm/primecell.yaml
=20
 Required properties:
=20
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic=
-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3=
=2Etxt
index b83bb8249074..a3be5298a5eb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
@@ -78,7 +78,7 @@ Sub-nodes:
 PPI affinity can be expressed as a single "ppi-partitions" node,
 containing a set of sub-nodes, each with the following property:
 - affinity: Should be a list of phandles to CPU nodes (as described in
-Documentation/devicetree/bindings/arm/cpus.txt).
+  Documentation/devicetree/bindings/arm/cpus.yaml).
=20
 GICv3 has one or more Interrupt Translation Services (ITS) that are
 used to route Message Signalled Interrupts (MSI) to the CPUs.
--=20
2.17.2

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGKAACgkQgjuumfi+
HjzVaxAAqw6ckaypCRSYNTP60+cg1BKsWGfRDJpRo6uJEusQZ+VMg3RhVki37zIG
zJtnLOPuGABXUYVu82pegQjn4LV6VMdbNO+GfDu1K9P8WXzcbmFjLRmV7S9v6Psu
KOfn/T40iDtutqlgDFvjBQnEAjpXZidPGHgZ5o8rQbhzaIyKGWIk3rFzsX6HLJbb
mBPw7Oe58JuqKgEhberhyAnuCvv0rACi2JB3oF2z0KL54W3NLqnecWqUVMgHxDw0
zKltGLjcJ+6ElmYflF31UbMv43Ak+xU4pPsMmQq9W66yhyHPf4CmrYE0lAE1NclX
3Lj9HEalErVmOEv4FC9naiFQfzP2raykQ6bBjoYDCCHSSx+u0Ue9i4TPrJw6Ahg0
k55ysXO7H8tPmdFG+7yzg+jL0fCM+laAYunKR9wNEGFDXPYsoqcB89dor0JPp9wG
dHkjPwhjvy37Y7gA7mgVM/Ba0J6t7Mg4D6Yk7QOqY0V7AY9mDdUMiv2eGIfwV/zb
pEjmf0Kn+OWG+OWkXhdOoGSF+6lHcYJusR/NNaplC3lnW7a/P93pkfBrm2KZnTnF
6TIhCD91qRNTevpqHUprM9Oi8GdNqh5d2HTMR5V1YccctojRXVU55TZG/8fjPTQ0
tg30GcjKtpqmiFmN3zMcdwhkzdmljTyopLyIp3dSWWj0Od+UJiQ=
=DIVc
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
