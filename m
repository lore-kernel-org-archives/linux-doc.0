Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D97D87E279
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 23:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752455AbeDTXDA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 19:03:00 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:58991 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752392AbeDTXDA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 19:03:00 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1f9f3Q-0003nE-Lj; Sat, 21 Apr 2018 00:02:58 +0100
Date:   Sat, 21 Apr 2018 00:02:56 +0100
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>
Message-ID: <20180420230256.GK8564@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KHqYxKoy+XnO4RVf"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@decadent.org.uk
Subject: [PATCH] Documentation: Update references to
 drivers/base/firmware_class.c
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on shadbolt.decadent.org.uk)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--KHqYxKoy+XnO4RVf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This source file has been renamed in 4.17.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 Documentation/driver-api/firmware/request_firmware.rst | 10 +++++-----
 Documentation/driver-api/infrastructure.rst            |  2 +-
 Documentation/power/suspend-and-cpuhotplug.txt         |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/firmware/request_firmware.rst b/Docum=
entation/driver-api/firmware/request_firmware.rst
index cf4516dfbf96..20f21ed427a5 100644
--- a/Documentation/driver-api/firmware/request_firmware.rst
+++ b/Documentation/driver-api/firmware/request_firmware.rst
@@ -17,17 +17,17 @@ an error is returned.
=20
 request_firmware
 ----------------
-.. kernel-doc:: drivers/base/firmware_class.c
+.. kernel-doc:: drivers/base/firmware_loader/main.c
    :functions: request_firmware
=20
 request_firmware_direct
 -----------------------
-.. kernel-doc:: drivers/base/firmware_class.c
+.. kernel-doc:: drivers/base/firmware_loader/main.c
    :functions: request_firmware_direct
=20
 request_firmware_into_buf
 -------------------------
-.. kernel-doc:: drivers/base/firmware_class.c
+.. kernel-doc:: drivers/base/firmware_loader/main.c
    :functions: request_firmware_into_buf
=20
 Asynchronous firmware requests
@@ -41,7 +41,7 @@ in atomic contexts.
=20
 request_firmware_nowait
 -----------------------
-.. kernel-doc:: drivers/base/firmware_class.c
+.. kernel-doc:: drivers/base/firmware_loader/main.c
    :functions: request_firmware_nowait
=20
 Special optimizations on reboot
@@ -55,7 +55,7 @@ firmare to be loaded.
=20
 firmware_request_cache()
 -----------------------
-.. kernel-doc:: drivers/base/firmware_class.c
+.. kernel-doc:: drivers/base/firmware_loader/main.c
    :functions: firmware_request_cache
=20
 request firmware API expected driver use
diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/dr=
iver-api/infrastructure.rst
index 6d9ff316b608..bee1b9a1702f 100644
--- a/Documentation/driver-api/infrastructure.rst
+++ b/Documentation/driver-api/infrastructure.rst
@@ -28,7 +28,7 @@ Device Drivers Base
 .. kernel-doc:: drivers/base/node.c
    :internal:
=20
-.. kernel-doc:: drivers/base/firmware_class.c
+.. kernel-doc:: drivers/base/firmware_loader/main.c
    :export:
=20
 .. kernel-doc:: drivers/base/transport_class.c
diff --git a/Documentation/power/suspend-and-cpuhotplug.txt b/Documentation=
/power/suspend-and-cpuhotplug.txt
index 31abd04b9572..6f55eb960a6d 100644
--- a/Documentation/power/suspend-and-cpuhotplug.txt
+++ b/Documentation/power/suspend-and-cpuhotplug.txt
@@ -168,7 +168,7 @@ There are some interesting situations involving CPU hot=
plug and microcode
=20
 [Please bear in mind that the kernel requests the microcode images from
 userspace, using the request_firmware() function defined in
-drivers/base/firmware_class.c]
+drivers/base/firmware_loader/main.c]
=20
=20
 a. When all the CPUs are identical:

--KHqYxKoy+XnO4RVf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWtpxoOe/yOyVhhEJAQrHZw/9FBTRUCc5jTyw7l6D9HhQgRjscFNQ/mBC
/BzbSf8BPd3fimS2fujiXaus0gJdI6H/6PfVQOeGJTvPhVydjEoqBCQ8noL6NNAI
VqjS5A95dmxwgepSn2AdCPuy1FK19ehDD+qHlmyru25jH/lq9AJSUMN/QjtlxN7s
E9cnkaoZeRrdjfMnSmzU1cyofm3WPeRI2mkxIevvLyIdW9GTtPpRyH2aGzSsBBlI
t4YcbpDguyTU4KKfajaiswvxKuGyq+T97WqzG9A/QgyDt0GoI1BeRluYVmhoQSyh
pcIRG6Qy5Zu2eolg+8bOsPUxB9jT0QPeT7VQegy46jVWLXQeOtFFKO9iEIRHImGV
y3PP2RRXaEUXtpG2Z5mOvtMrTNjY9obDHrazLgDykwiEQihMEHZAUOM8sKHgVI/I
MSDeFSrOXsNCIhU3EB1gI+ulxcfJuNGtfXMTP1pWpEajcTWgL45HXOJwiJn9wqvX
36G91+GmxwuKJfm4zrFSlG2zfPq8lAOqERTiYcXjcAfU2bOtAWDrFxrsJAbw1LA0
TmjGfDtpJJgCsQ7o213exjIWG6Dg+3XA+7AXSDp3heQK2sI1j+w2Wa6es3sq95M2
jWUuhIwON+LQ9CrRfB1nyZc7ko2+sLaVDeY53vA2v5Z+Iywxa4RaquPWNv3qrzBE
mx/Am5OWmCk=
=Yw12
-----END PGP SIGNATURE-----

--KHqYxKoy+XnO4RVf--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
