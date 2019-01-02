Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8754B7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfABUB1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:01:27 -0500
Received: from wes1-so1-b.wedos.net ([46.28.106.43]:55018 "EHLO
        wes1-so1.wedos.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726089AbfABUB1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:01:27 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so1.wedos.net (Postfix) with ESMTPSA id 43VMPc71Ysz3Mv;
        Wed,  2 Jan 2019 21:01:24 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:01:21 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 2/8] doc: filesystems: fix bad references to nonexistent
 ext4.rst file
Message-ID: <dd6f9b732fa6c8b76e5d42f413b49a0106b2815f.1546457947.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ext4.rst file does not exist anymore. This patch changes all references
to point to the whole ext4 directory.

Fixes: d3091215921b ("docs: move ext4 administrative docs to admin-guide/")
Signed-off-by: Otto Sabart <ottosabart@seberm.com>
---
 Documentation/filesystems/dax.txt  | 2 +-
 Documentation/filesystems/ext2.txt | 2 +-
 MAINTAINERS                        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/dax.txt b/Documentation/filesystems/=
dax.txt
index bc393e0a22b8..6d2c0d340dea 100644
--- a/Documentation/filesystems/dax.txt
+++ b/Documentation/filesystems/dax.txt
@@ -75,7 +75,7 @@ exposure of uninitialized data through mmap.
=20
 These filesystems may be used for inspiration:
 - ext2: see Documentation/filesystems/ext2.txt
-- ext4: see Documentation/filesystems/ext4/ext4.rst
+- ext4: see Documentation/filesystems/ext4/
 - xfs:  see Documentation/filesystems/xfs.txt
=20
=20
diff --git a/Documentation/filesystems/ext2.txt b/Documentation/filesystems=
/ext2.txt
index a45c9fc0747b..a19973a4dd1e 100644
--- a/Documentation/filesystems/ext2.txt
+++ b/Documentation/filesystems/ext2.txt
@@ -358,7 +358,7 @@ and are copied into the filesystem.  If a transaction i=
s incomplete at
 the time of the crash, then there is no guarantee of consistency for
 the blocks in that transaction so they are discarded (which means any
 filesystem changes they represent are also lost).
-Check Documentation/filesystems/ext4/ext4.rst if you want to read more abo=
ut
+Check Documentation/filesystems/ext4/ if you want to read more about
 ext4 and journaling.
=20
 References
diff --git a/MAINTAINERS b/MAINTAINERS
index 076288b9a133..f6d7a69a9002 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5695,7 +5695,7 @@ W:	http://ext4.wiki.kernel.org
 Q:	http://patchwork.ozlabs.org/project/linux-ext4/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git
 S:	Maintained
-F:	Documentation/filesystems/ext4/ext4.rst
+F:	Documentation/filesystems/ext4/
 F:	fs/ext4/
=20
 Extended Verification Module (EVM)
--=20
2.17.2

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGJEACgkQgjuumfi+
HjzNlg/+JJnKVK3II5m4IVegoCaYgsh2qcZADbhKsTM9bjrEeJBlOcgv7WOCuJ9Z
qWq0DCBcoiGfl6UJ78UuWX/vzFNqoyfnptE9nhY02y0ZmAyPCFufe+tkPvSL3muf
MFFucEzRckEJU0labOx+jOaoxU0myeFapt/ZH+Tmdm/PWfeeKM43KXoSVwB4Hsd6
Agf5hHMCNkx9iYfJWzpfOdUct0gYiZ9oVEuStIAuZIPiH2976XJogIrb20Mex9uZ
73+jP1BHcC4Qn566GIROlfJKfoudoSnDB6i5EWDqkNHvUhI7RRKF0FSMrBmrAWnN
RnWCnY+MMABpqAOaNWKA/+fbVeKF/8NOdill9w3CLMnEy0Pfg7L0Vpz/sQjeq7Ui
zP18CW1GgSIXNuSx5OTbSSA5+8SD2fCqOUAzVZHFnrAymBW3zPUN5MdWotuOK2cs
C72KTK/reAhIv8NekFs+ghwfao1L4D65OOlvhgJxqCtsknla6CgOCbcW1FLwzlMa
DVYLWLiKdXKA2nM+Yy7iUb66ApREHFjqLCvUCukLrYzIo1S2galWb8NMjsOmG3/l
8/nZq6K671Pqzpf3Ym0T5NxTiUAzgFkaWrb6QXXO03fFffGOJWIH1AeZb55GQukR
jAf2CBeOKFzniqZkyIDqUwqZuSCuUAaEKLRohp10OASUF6GgXQk=
=wBe7
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
