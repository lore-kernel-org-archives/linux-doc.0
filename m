Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF0CD7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 18:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfAGShN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 13:37:13 -0500
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48861 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfAGShN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 13:37:13 -0500
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D05B2808E2; Mon,  7 Jan 2019 19:37:06 +0100 (CET)
Date:   Mon, 7 Jan 2019 19:37:11 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Consistent capitalization of "device tree"?
Message-ID: <20190107183711.GA5671@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Is it "Device Tree" or "device tree"?
   =20
 pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
 235
 pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
 595
   =20
I guess it would be nice to make it consistent. I guess "device tree"
is preffered?

Should we do something like this?
								Pavel

Signed-off-by: Pavel Machek <pavel@ucw.cz>
   =20
diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/dev=
icetree/overlay-notes.txt
index 725fb8d..cc5f507 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -8,7 +8,7 @@ companion document to Documentation/devicetree/dynamic-reso=
lution-notes.txt[1]
 How overlays work
 -----------------
=20
-A Device Tree's overlay purpose is to modify the kernel's live tree, and
+A device tree's overlay purpose is to modify the kernel's live tree, and
 have the modification affecting the state of the kernel in a way that
 is reflecting the changes.
 Since the kernel mainly deals with devices, any new device node that result

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwznFcACgkQMOfwapXb+vIgYwCfTmcj844BEmwus3pL2tHXVvih
hKwAn3Q//DngNjgqZmiFNmNlFCYcuUey
=aXsV
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
