Return-Path: <SRS0=mcri=ZO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF33C432C0
	for <linux-doc@archiver.kernel.org>; Fri, 22 Nov 2019 07:43:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85D6420708
	for <linux-doc@archiver.kernel.org>; Fri, 22 Nov 2019 07:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfKVHnv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:43:51 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58799 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVHnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Nov 2019 02:43:45 -0500
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=leda.hi.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <rsc@pengutronix.de>)
        id 1iY3bS-0002i7-0R; Fri, 22 Nov 2019 08:43:42 +0100
Received: by leda.hi.pengutronix.de (Postfix, from userid 1006)
        id E07C62C877E3; Fri, 22 Nov 2019 08:43:40 +0100 (CET)
From:   Robert Schwebel <r.schwebel@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 1/5] docs: networking: nfc: change headlines to sphinx syntax
Date:   Fri, 22 Nov 2019 08:43:02 +0100
Message-Id: <20191122074306.78179-2-r.schwebel@pengutronix.de>
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

The headlines in this file do are not in the standard kernel docu-
mentation headline format. Change it, so this file can be switched to
rst in the future.

Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
---
 Documentation/networking/nfc.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/nfc.txt b/Documentation/networking/nfc.txt
index b24c29bdae27..c053610bfadc 100644
--- a/Documentation/networking/nfc.txt
+++ b/Documentation/networking/nfc.txt
@@ -1,3 +1,4 @@
+===================
 Linux NFC subsystem
 ===================
 
@@ -8,7 +9,7 @@ This document covers the architecture overview, the device driver interface
 description and the userspace interface description.
 
 Architecture overview
----------------------
+=====================
 
 The NFC subsystem is responsible for:
       - NFC adapters management;
@@ -51,7 +52,7 @@ PF_NFC. The NFC_SOCKPROTO_RAW performs raw communication with NFC targets.
                                     +-----------+
 
 Device Driver Interface
------------------------
+=======================
 
 When registering on the NFC subsystem, the device driver must inform the core
 of the set of supported NFC protocols and the set of ops callbacks. The ops
@@ -64,7 +65,7 @@ callbacks that must be implemented are the following:
 * data_exchange - send data and receive the response (transceive operation)
 
 Userspace interface
---------------------
+===================
 
 The userspace interface is divided in control operations and low-level data
 exchange operation.
-- 
2.24.0

