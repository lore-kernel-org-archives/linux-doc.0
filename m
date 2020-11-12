Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D88BC5519F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46FE1221E9
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgKLSAP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgKLR73 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 12:59:29 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77094C0613D4;
        Thu, 12 Nov 2020 09:59:29 -0800 (PST)
Received: from ip4d145e30.dynamic.kabel-deutschland.de ([77.20.94.48] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kdGsa-00076N-7J; Thu, 12 Nov 2020 18:59:28 +0100
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 19/26] docs: reporting-bugs: decode failure messages [need help!]
Date:   Thu, 12 Nov 2020 18:58:56 +0100
Message-Id: <a9ecc09a907a07e10720d4fa0dcd5dd39ff6d294.1605203187.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605203187.git.linux@leemhuis.info>
References: <cover.1605203187.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1605203969;0e5b1c25;
X-HE-SMSGID: 1kdGsa-00076N-7J
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This part is quite similar to the old text and just a placeholder for
now. It and the referenced document afaics need to be revisited, as they
seem outdated to me. But I'm not really familiar with the current state
of things in that area and thus didn't feel qualified to write down
anything better quickly.

So consider this a request for help for those that know this area. Could
you maybe write something that would fit in here? Or outline the current
situation roughly in a reply (when is scripts/decode_stacktrace.sh
enough?), as that will make it easier for me or others to write
something? It should answer questions like "when is this actually
needed", "what .config options to ideally set to make this step easy or
unnecessary (CONFIG_UNWINDER_ORC when available, otherwise
CONFIG_UNWINDER_FRAME_POINTER)?".

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/admin-guide/reporting-bugs.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
index 7af4e7a6e797..be866dd1e6b6 100644
--- a/Documentation/admin-guide/reporting-bugs.rst
+++ b/Documentation/admin-guide/reporting-bugs.rst
@@ -839,6 +839,18 @@ issue you face. Use this knowledge and search again for existing reports
 instead you can join.
 
 
+Decode failure messages
+-----------------------
+
+    *If the failure includes a stack dump, like an Oops does, consider decoding
+    it to find the offending line of code.*
+
+When the kernel detects an error, it will print a stack dump that allows to
+identify the exact line of code where the issue happens. But that information
+sometimes needs to get decoded to be readable, which is explained in
+admin-guide/bug-hunting.rst.
+
+
 .. ############################################################################
 .. Temporary marker added while this document is rewritten. Sections above
 .. are new and dual-licensed under GPLv2+ and CC-BY 4.0, those below are old.
@@ -870,9 +882,7 @@ step-by-step instructions for how a user can trigger the bug.
 
 If the failure includes an "OOPS:", take a picture of the screen, capture
 a netconsole trace, or type the message from your screen into the bug
-report.  Please read "Documentation/admin-guide/bug-hunting.rst" before posting your
-bug report. This explains what you should do with the "Oops" information
-to make it useful to the recipient.
+report.
 
 This is a suggested format for a bug report sent via email or bugzilla.
 Having a standardized bug report form makes it easier for you not to
-- 
2.28.0

