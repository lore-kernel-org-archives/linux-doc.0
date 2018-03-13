Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D4967E686
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 22:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752598AbeCMWre (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 18:47:34 -0400
Received: from aibo.runbox.com ([91.220.196.211]:52720 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752054AbeCMWrd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Mar 2018 18:47:33 -0400
Received: from [10.9.9.210] (helo=mailfront10.runbox.com)
        by mailtransmit03.runbox with esmtp (Exim 4.86_2)
        (envelope-from <kballou@devnulllabs.io>)
        id 1evryh-0007KU-PD; Tue, 13 Mar 2018 23:01:03 +0100
Received: from [63.148.111.126] (helo=localhost)
        by mailfront10.runbox.com with esmtpsa  (uid:818882 )  (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.82)
        id 1evryQ-0001xW-SE; Tue, 13 Mar 2018 23:00:47 +0100
From:   Kenny Ballou <kballou@devnulllabs.io>
To:     linux-doc@vger.kernel.org
Cc:     bhelgaas@google.com, corbet@lwn.net, googlegot@yahoo.com,
        Kenny Ballou <kballou@devnulllabs.io>
Subject: [PATCH] doc: sysfs-pci: update enable 'rom' file instructions
Date:   Tue, 13 Mar 2018 15:58:52 -0600
Message-Id: <20180313215852.14338-1-kballou@devnulllabs.io>
X-Mailer: git-send-email 2.16.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the instructions for enabling and disabling read access to the
special sysfs 'rom' file for PCI devices.  The function that interprets
user data for enabling and disabling the device actually expects _at
least_ 2 bytes, more than what is expressly implied by "1" or "0".

It should also be noted, that the code path for enabling read access to
the special file can receive any length of input as long as it doesn't
start with "0".  However, this is not added to the documentation as this
is, perhaps, not a "feature" of the file system we want to encourage.

This patch is submitted in place of accepting [pci: use kstrtobool over
ad hoc string parsing][0] as to not break existing functionality.
Similarly, this patch is in reference to a bugzilla report: [Sysfs PCI
rom file functionality does not match documentation][1].

[0]: https://www.spinics.net/lists/linux-pci/msg69073.html
[1]: https://bugzilla.kernel.org/show_bug.cgi?id=111301

Reported-by: googlegot@yahoo.com
Signed-off-by: Kenny Ballou <kballou@devnulllabs.io>
---
 Documentation/filesystems/sysfs-pci.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/sysfs-pci.txt b/Documentation/filesystems/sysfs-pci.txt
index 06f1d64c6f70..0cc9a32ebab0 100644
--- a/Documentation/filesystems/sysfs-pci.txt
+++ b/Documentation/filesystems/sysfs-pci.txt
@@ -75,8 +75,8 @@ may not be reversed.
 
 The 'rom' file is special in that it provides read-only access to the device's
 ROM file, if available.  It's disabled by default, however, so applications
-should write the string "1" to the file to enable it before attempting a read
-call, and disable it following the access by writing "0" to the file.  Note
+should write the string "1\n" to the file to enable it before attempting a read
+call, and disable it following the access by writing "0\n" to the file.  Note
 that the device must be enabled for a rom read to return data successfully.
 In the event a driver is not bound to the device, it can be enabled using the
 'enable' file, documented above.
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
