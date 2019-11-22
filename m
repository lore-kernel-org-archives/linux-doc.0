Return-Path: <SRS0=mcri=ZO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D51C43215
	for <linux-doc@archiver.kernel.org>; Fri, 22 Nov 2019 07:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 947B32070A
	for <linux-doc@archiver.kernel.org>; Fri, 22 Nov 2019 07:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfKVHny (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:43:54 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36223 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfKVHnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Nov 2019 02:43:45 -0500
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=leda.hi.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <rsc@pengutronix.de>)
        id 1iY3bS-0002i8-0Q; Fri, 22 Nov 2019 08:43:42 +0100
Received: by leda.hi.pengutronix.de (Postfix, from userid 1006)
        id EC63A2C877E6; Fri, 22 Nov 2019 08:43:40 +0100 (CET)
From:   Robert Schwebel <r.schwebel@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 2/5] docs: networking: nfc: change block diagram to sphinx syntax
Date:   Fri, 22 Nov 2019 08:43:03 +0100
Message-Id: <20191122074306.78179-3-r.schwebel@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122074306.78179-1-r.schwebel@pengutronix.de>
References: <20191122074306.78179-1-r.schwebel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: rsc@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change the block diagram to match the sphinx syntax. This will make it
possible to switch this file to rst in the future.

Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
---
 Documentation/networking/nfc.txt | 49 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/Documentation/networking/nfc.txt b/Documentation/networking/nfc.txt
index c053610bfadc..b6056e597e20 100644
--- a/Documentation/networking/nfc.txt
+++ b/Documentation/networking/nfc.txt
@@ -26,30 +26,31 @@ The control operations are available to userspace via generic netlink.
 The low-level data exchange interface is provided by the new socket family
 PF_NFC. The NFC_SOCKPROTO_RAW performs raw communication with NFC targets.
 
-
-             +--------------------------------------+
-             |              USER SPACE              |
-             +--------------------------------------+
-                 ^                       ^
-                 | low-level             | control
-                 | data exchange         | operations
-                 |                       |
-                 |                       v
-                 |                  +-----------+
-                 | AF_NFC           |  netlink  |
-                 | socket           +-----------+
-                 | raw                   ^
-                 |                       |
-                 v                       v
-             +---------+            +-----------+
-             | rawsock | <--------> |   core    |
-             +---------+            +-----------+
-                                         ^
-                                         |
-                                         v
-                                    +-----------+
-                                    |  driver   |
-                                    +-----------+
+.. code-block:: none
+
+        +--------------------------------------+
+        |              USER SPACE              |
+        +--------------------------------------+
+            ^                       ^
+            | low-level             | control
+            | data exchange         | operations
+            |                       |
+            |                       v
+            |                  +-----------+
+            | AF_NFC           |  netlink  |
+            | socket           +-----------+
+            | raw                   ^
+            |                       |
+            v                       v
+        +---------+            +-----------+
+        | rawsock | <--------> |   core    |
+        +---------+            +-----------+
+                                    ^
+                                    |
+                                    v
+                               +-----------+
+                               |  driver   |
+                               +-----------+
 
 Device Driver Interface
 =======================
-- 
2.24.0

