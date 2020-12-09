Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5F0C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 05:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1486023B16
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 05:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgLIFT7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 00:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgLIFT7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 00:19:59 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549FDC0613CF;
        Tue,  8 Dec 2020 21:19:19 -0800 (PST)
Received: from ip4d149f6e.dynamic.kabel-deutschland.de ([77.20.159.110] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kmrsg-0005wp-FX; Wed, 09 Dec 2020 06:19:14 +0100
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: reporting-issues: move 'outdated, need help' note to proper place
Date:   Wed,  9 Dec 2020 06:19:14 +0100
Message-Id: <d3894ba4a302beed661304cbcdc062c6dcfe3e58.1607489877.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1607491159;8cd44f12;
X-HE-SMSGID: 1kmrsg-0005wp-FX
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the 'this section is a placeholder for now and needs help by
someone with domain knowledge' note one section upwards to the place
where it belongs: the 'Decode failure messages' section.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
Brown paper bag fixup :-/

---
 .../admin-guide/reporting-issues.rst          | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 5cbb1b5f4a52..07879d01fe68 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -923,18 +923,6 @@ instead you can join.
 Decode failure messages
 -----------------------
 
-    *If the failure includes a stack dump, like an Oops does, consider decoding
-    it to find the offending line of code.*
-
-When the kernel detects an error, it will print a stack dump that allows to
-identify the exact line of code where the issue happens. But that information
-sometimes needs to get decoded to be readable, which is explained in
-admin-guide/bug-hunting.rst.
-
-
-Special care for regressions
-----------------------------
-
 .. note::
 
    FIXME: The text in this section is a placeholder for now and quite similar to
@@ -953,6 +941,18 @@ Special care for regressions
 
 ..
 
+    *If the failure includes a stack dump, like an Oops does, consider decoding
+    it to find the offending line of code.*
+
+When the kernel detects an error, it will print a stack dump that allows to
+identify the exact line of code where the issue happens. But that information
+sometimes needs to get decoded to be readable, which is explained in
+admin-guide/bug-hunting.rst.
+
+
+Special care for regressions
+----------------------------
+
     *If your problem is a regression, try to narrow down when the issue was
     introduced as much as possible.*
 

base-commit: 547f574fd9d5e3925d47fd44decbf6ab6df94b0e
-- 
2.29.2

