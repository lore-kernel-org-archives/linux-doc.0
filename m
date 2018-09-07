Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 67DAA7D923
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 10:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbeIGPKs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 11:10:48 -0400
Received: from sauhun.de ([88.99.104.3]:52734 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727617AbeIGPKs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Sep 2018 11:10:48 -0400
Received: from localhost (p54B3324C.dip0.t-ipconnect.de [84.179.50.76])
        by pokefinder.org (Postfix) with ESMTPSA id 5E5BB2C27DA;
        Fri,  7 Sep 2018 12:30:27 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-doc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/2] MAINTAINERS: sort excludes for Documentation
Date:   Fri,  7 Sep 2018 12:30:21 +0200
Message-Id: <20180907103022.2258-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.18.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Helps reading and hopefully avoids duplicates. Also, consistently add
the trailing '/' to make clear those are directories.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ad052aeac39..2698ee553008 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4485,11 +4485,11 @@ S:	Maintained
 F:	Documentation/
 F:	scripts/kernel-doc
 X:	Documentation/ABI/
+X:	Documentation/acpi/
 X:	Documentation/devicetree/
-X:	Documentation/acpi
-X:	Documentation/power
-X:	Documentation/spi
-X:	Documentation/media
+X:	Documentation/media/
+X:	Documentation/power/
+X:	Documentation/spi/
 T:	git git://git.lwn.net/linux.git docs-next
 
 DOCUMENTATION/ITALIAN
-- 
2.18.0

