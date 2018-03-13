Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CB81C7E686
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 22:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932257AbeCMWnr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 18:43:47 -0400
Received: from aibo.runbox.com ([91.220.196.211]:52464 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932240AbeCMWnq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Mar 2018 18:43:46 -0400
X-Greylist: delayed 2561 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Mar 2018 18:43:46 EDT
Received: from [10.9.9.212] (helo=mailfront12.runbox.com)
        by mailtransmit03.runbox with esmtp (Exim 4.86_2)
        (envelope-from <kballou@devnulllabs.io>)
        id 1evs0d-0007Ri-GL; Tue, 13 Mar 2018 23:03:03 +0100
Received: from [63.148.111.126] (helo=localhost)
        by mailfront12.runbox.com with esmtpsa  (uid:818882 )  (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.82)
        id 1evrzq-0006Is-DG; Tue, 13 Mar 2018 23:02:14 +0100
From:   Kenny Ballou <kballou@devnulllabs.io>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     Kenny Ballou <kballou@devnulllabs.io>
Subject: [PATCH] doc: fs: sysfs-pci: remove trailing whitespace
Date:   Tue, 13 Mar 2018 16:02:02 -0600
Message-Id: <20180313220202.16872-1-kballou@devnulllabs.io>
X-Mailer: git-send-email 2.16.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove the trailing whitespace found in
`Documentation/filesystems/sysfs-pci.txt`.

Signed-off-by: Kenny Ballou <kballou@devnulllabs.io>
---
 Documentation/filesystems/sysfs-pci.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/sysfs-pci.txt b/Documentation/filesystems/sysfs-pci.txt
index 06f1d64c6f70..093bb0fa630f 100644
--- a/Documentation/filesystems/sysfs-pci.txt
+++ b/Documentation/filesystems/sysfs-pci.txt
@@ -67,11 +67,11 @@ don't support mmapping of certain resources, so be sure to check the return
 value from any attempted mmap.  The most notable of these are I/O port
 resources, which also provide read/write access.
 
-The 'enable' file provides a counter that indicates how many times the device 
+The 'enable' file provides a counter that indicates how many times the device
 has been enabled.  If the 'enable' file currently returns '4', and a '1' is
 echoed into it, it will then return '5'.  Echoing a '0' into it will decrease
 the count.  Even when it returns to 0, though, some of the initialisation
-may not be reversed.  
+may not be reversed.
 
 The 'rom' file is special in that it provides read-only access to the device's
 ROM file, if available.  It's disabled by default, however, so applications
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
