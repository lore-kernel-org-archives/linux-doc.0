Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EBCC4363D
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 07:14:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FC96235F8
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 07:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbgIYHOx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 03:14:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:60362 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbgIYHOx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Sep 2020 03:14:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 10650AE79;
        Fri, 25 Sep 2020 07:14:52 +0000 (UTC)
From:   NeilBrown <neilb@suse.de>
To:     Jonathan Corbet <corbet@lwn.net>
Date:   Fri, 25 Sep 2020 17:14:42 +1000
Subject: [PATCH] doc: seq_file: clarify role of *pos in ->next()
cc:     linux-doc@vger.kernel.org
Message-ID: <87eemqiazh.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


There are behavioural requirements on the seq_file next() function in
terms of how it updates *pos at end-of-file, and these are now enforced
by a warning.

I was recently attempting to justify the reason this was needed, and
couldn't remember the details, and didn't find them in the
documentation.

So I re-read the code until I understood it again, and updated the
documentation to match.

I also enhanced the text about SEQ_START_TOKEN as it seemed potentially
misleading.

Cc: Vasily Averin <vvs@virtuozzo.com>
Signed-off-by: NeilBrown <neilb@suse.de>
=2D--
 Documentation/filesystems/seq_file.rst | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/seq_file.rst b/Documentation/filesys=
tems/seq_file.rst
index 7f7ee06b2693..56856481dc8d 100644
=2D-- a/Documentation/filesystems/seq_file.rst
+++ b/Documentation/filesystems/seq_file.rst
@@ -129,7 +129,9 @@ also a special value which can be returned by the start=
() function
 called SEQ_START_TOKEN; it can be used if you wish to instruct your
 show() function (described below) to print a header at the top of the
 output. SEQ_START_TOKEN should only be used if the offset is zero,
=2Dhowever.
+however.  SEQ_START_TOKEN has no special meaning to the core seq_file
+code.  It is provided as a convenience for a start() funciton to
+communicate with the next() and show() functions.
=20
 The next function to implement is called, amazingly, next(); its job is to
 move the iterator forward to the next position in the sequence.  The
@@ -145,6 +147,22 @@ complete. Here's the example version::
 	        return spos;
 	}
=20
+The next() function should set ``*pos`` to a value that start() can use
+to find the new location in the sequence.  When the iterator is being
+stored in the private data area, rather than being reinitialized on each
+start(), it might seem sufficient to simply set ``*pos`` to any non-zero
+value (zero always tells start() to restart the sequence).  This is not
+sufficient due to historical problems.
+
+Historically, many next() functions have *not* updated ``*pos`` at
+end-of-file.  If the value is then used by start() to initialise the
+iterator, this can result in corner cases where the last entry in the
+sequence is reported twice in the file.  In order to discourage this bug
+from being resurrected, the core seq_file code now produces a warning if
+a next() function does not change the value of ``*pos``.  Consequently a
+next() function *must* change the value of ``*pos``, and of course must
+set it to a non-zero value.
+
 The stop() function closes a session; its job, of course, is to clean
 up. If dynamic memory is allocated for the iterator, stop() is the
 place to free it; if a lock was taken by start(), stop() must release
=2D-=20
2.28.0


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJCBAEBCAAsFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl9tmOMOHG5laWxiQHN1
c2UuZGUACgkQOeye3VZigbm7Xg//ZA49S6zR7jQMOfQxEaojxPNfwRowf4gGU2sF
hCzM20fcou/J986uPTKsSEaEccffoHTlRV0RCxOZ22O//wdN7HQCXilXGrUx+xyn
BXD+ug17UOj2D+uHxIMzEsn4DUkEF6My2aeZ8q05cFNoDBg2Ax6X5SPubFOo3wOL
7mVHw9lCy/BScfF/RDayAS4nc1yVe7hIAs814/0/sVqKYDqHLJNO61bXp2fNgC/u
ML0bc6lFa9VLOHT5+GMN3SKMvvUUY4VDbpzRvRFlOGFSE3QyNNhzNoCUfHnFVz93
UX1Tret8IG2Hn8E5Yme60J0VIzFnCB8a9EvPP5YPFNXI2ToNESuxuU80NW6VYLK1
14Fu2PWHzSmRdc9MHbdy3VORUMqEEHIxZ2TJRvqNfrKXyLIkUADa3cyX4ujl4wBS
44ToHfZTub8gTKNbQfwpC99LKRwu5Fdfw3yfOY11wNblTNYbRoCVyQOzwgYP+Swo
207HLZfS1zzOVZKpMp5Pg1u87UKGShh9vNpNdAfZChtHG1AAwS1a8Tb7UFAvBn3x
bFgZ0xya0X7QHQyUYOHf8dRO0tL9praK0DnNm42MGxBPhhOSH/sOuEjuwgz95tN2
T6tJjWr1n+deq49FHIYscQ+8mnzt71d43k+VXsf6MCq0IVE2DVUaymPfoWHi7VoH
rGmyTxk=
=LgO8
-----END PGP SIGNATURE-----
--=-=-=--
