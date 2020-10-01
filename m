Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C8EC47426
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D0A3208B6
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731664AbgJAIke (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731662AbgJAIke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 04:40:34 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B57C0613D0
        for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2020 01:40:34 -0700 (PDT)
Received: from ip4d14bc8c.dynamic.kabel-deutschland.de ([77.20.188.140] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kNu8e-0000gU-SU; Thu, 01 Oct 2020 10:40:32 +0200
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 14/26] docs: reporting-bugs: make users write notes, one for each issue
Date:   Thu,  1 Oct 2020 10:39:35 +0200
Message-Id: <bf99a4e5af05e7076795e33beb6d48f95571328e.1601541165.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601541165.git.linux@leemhuis.info>
References: <cover.1601541165.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1601541634;20d0f7c0;
X-HE-SMSGID: 1kNu8e-0000gU-SU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tell users to write some rough notes how to reproduce the issue. They
will need those notes soon once they have to reproduce the issue with
the latest mainline kernel. At the same time they can serve as basis for
the report later.

While at it point out that each report should focus on one issue, as
that is a good time for it: it will make the notes more straight forward
if the reader deal with multiple issues at once.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/admin-guide/reporting-bugs.rst | 35 +++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
index 2292b79cf462..f99d92a05bca 100644
--- a/Documentation/admin-guide/reporting-bugs.rst
+++ b/Documentation/admin-guide/reporting-bugs.rst
@@ -617,6 +617,32 @@ should minimize it:
    look like a regression.
 
 
+Document how to reproduce issue
+-------------------------------
+
+    *Write down coarsely how to reproduce the issue. If you deal with multiple
+    issue at once, create separate notes for each of them and make sure they
+    work independently on a freshly booted system. That's needed, as each issue
+    needs to get reported to the kernel developers separately, unless they are
+    strongly entangled.*
+
+If you deal with multiple issue at once, you'll have to report each of them
+separately, as they might be handled by different developers. Describing various
+issues in one report also makes it quite difficult for others to tear it apart.
+Hence, only combine issues in one report if they are strongly entangled.
+
+Additionally, during the reporting process you will have to test if the issue
+happens with other kernel versions. Therefore, it will make your work easier if
+you know exactly how to reproduce it quickly on a freshly booted system.
+
+Note: it's often fruitless to debug issues that only happened once, as they
+might be caused by a bit flip due to cosmic radiation. That's why you should try
+to rule that out by reproducing the issue before going further. Feed free to
+ignore this if you are experienced enough to tell a one-time error due to faulty
+hardware apart from a kernel issue that rarely happens and thus is hard to
+reproduce.
+
+
 .. ############################################################################
 .. Temporary marker added while this document is rewritten. Sections above
 .. are new and dual-licensed under GPLv2+ and CC-BY 4.0, those below are old.
@@ -639,15 +665,6 @@ How to report Linux kernel bugs
 ===============================
 
 
-Tips for reporting bugs
------------------------
-
-It's REALLY important to report bugs that seem unrelated as separate email
-threads or separate bugzilla entries.  If you report several unrelated
-bugs at once, it's difficult for maintainers to tease apart the relevant
-data.
-
-
 Gather information
 ------------------
 
-- 
2.26.2

