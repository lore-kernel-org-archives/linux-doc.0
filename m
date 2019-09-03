Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D6AA67D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Sep 2019 16:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbfICQIu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Sep 2019 12:08:50 -0400
Received: from tartarus.angband.pl ([54.37.238.230]:46552 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbfICQIu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Sep 2019 12:08:50 -0400
Received: from [2a02:a31c:853f:a300::4] (helo=valinor.angband.pl)
        by tartarus.angband.pl with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <kilobyte@angband.pl>)
        id 1i5BML-0005on-BJ; Tue, 03 Sep 2019 18:08:47 +0200
Received: from kilobyte by valinor.angband.pl with local (Exim 4.92.1)
        (envelope-from <kilobyte@valinor.angband.pl>)
        id 1i5BMK-000EhM-Ch; Tue, 03 Sep 2019 18:08:44 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Adam Borowski <kilobyte@angband.pl>
Date:   Tue,  3 Sep 2019 18:08:40 +0200
Message-Id: <20190903160840.56652-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a02:a31c:853f:a300::4
X-SA-Exim-Mail-From: kilobyte@angband.pl
Subject: [PATCH] Documentation: sysrq: don't recommend 'S' 'U' before 'B'
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on tartarus.angband.pl)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This advice is obsolete and slightly harmful for filesystems from this
millenium: any modern filesystem can handle unexpected crashes without
requiring fsck -- and on the other hand, trying to write to the disk when
the kernel is in a bad state risks introducing corruption.

For ext2, any unsafe shutdown meant widespread breakage, but it's no longer
a reasonable filesystem for any non-special use.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 Documentation/admin-guide/sysrq.rst | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 7b9035c01a2e..72b2cfb066f4 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -171,22 +171,20 @@ It seems others find it useful as (System Attention Key) which is
 useful when you want to exit a program that will not let you switch consoles.
 (For example, X or a svgalib program.)
 
-``reboot(b)`` is good when you're unable to shut down. But you should also
-``sync(s)`` and ``umount(u)`` first.
+``reboot(b)`` is good when you're unable to shut down, it is an equivalent
+of pressing the "reset" button.
 
 ``crash(c)`` can be used to manually trigger a crashdump when the system is hung.
 Note that this just triggers a crash if there is no dump mechanism available.
 
-``sync(s)`` is great when your system is locked up, it allows you to sync your
-disks and will certainly lessen the chance of data loss and fscking. Note
-that the sync hasn't taken place until you see the "OK" and "Done" appear
-on the screen. (If the kernel is really in strife, you may not ever get the
-OK or Done message...)
+``sync(s)`` is handy before yanking removable medium or after using a rescue
+shell that provides no graceful shutdown -- it will ensure your data is
+safely written to the disk. Note that the sync hasn't taken place until you see
+the "OK" and "Done" appear on the screen.
 
-``umount(u)`` is basically useful in the same ways as ``sync(s)``. I generally
-``sync(s)``, ``umount(u)``, then ``reboot(b)`` when my system locks. It's saved
-me many a fsck. Again, the unmount (remount read-only) hasn't taken place until
-you see the "OK" and "Done" message appear on the screen.
+``umount(u)`` can be used to mark filesystems as properly unmounted. From the
+running system's point of view, they will be remounted read-only. The remount
+isn't complete until you see the "OK" and "Done" message appear on the screen.
 
 The loglevels ``0``-``9`` are useful when your console is being flooded with
 kernel messages you do not want to see. Selecting ``0`` will prevent all but
-- 
2.23.0

