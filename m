Return-Path: <SRS0=s6Rs=ZN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F666C43215
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 15:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37BF820692
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 15:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKUPzL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Nov 2019 10:55:11 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56917 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfKUPzK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Nov 2019 10:55:10 -0500
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=leda.hi.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <rsc@pengutronix.de>)
        id 1iXonT-0002x4-0a; Thu, 21 Nov 2019 16:55:07 +0100
Received: by leda.hi.pengutronix.de (Postfix, from userid 1006)
        id BDF7D2C877E7; Thu, 21 Nov 2019 16:55:05 +0100 (CET)
From:   Robert Schwebel <r.schwebel@pengutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 4/5] docs: networking: nfc: fix code block syntax
Date:   Thu, 21 Nov 2019 16:55:02 +0100
Message-Id: <20191121155503.52019-4-r.schwebel@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121155503.52019-1-r.schwebel@pengutronix.de>
References: <20191121155503.52019-1-r.schwebel@pengutronix.de>
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

Silence this warning:

Documentation/networking/nfc.rst:113: WARNING: Definition list ends without
a blank line; unexpected unindent.

Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
---
 Documentation/networking/nfc.txt | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/nfc.txt b/Documentation/networking/nfc.txt
index af69b3a90eaa..63e483f6afb4 100644
--- a/Documentation/networking/nfc.txt
+++ b/Documentation/networking/nfc.txt
@@ -105,12 +105,14 @@ LOW-LEVEL DATA EXCHANGE:
 The userspace must use PF_NFC sockets to perform any data communication with
 targets. All NFC sockets use AF_NFC:
 
-struct sockaddr_nfc {
-       sa_family_t sa_family;
-       __u32 dev_idx;
-       __u32 target_idx;
-       __u32 nfc_protocol;
-};
+.. code-block:: none
+
+        struct sockaddr_nfc {
+               sa_family_t sa_family;
+               __u32 dev_idx;
+               __u32 target_idx;
+               __u32 nfc_protocol;
+        };
 
 To establish a connection with one target, the user must create an
 NFC_SOCKPROTO_RAW socket and call the 'connect' syscall with the sockaddr_nfc
-- 
2.24.0

