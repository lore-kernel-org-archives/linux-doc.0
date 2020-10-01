Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064FDC4727E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C02D320B1F
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731649AbgJAIke (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731067AbgJAIke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 04:40:34 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F8BC0613E2
        for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2020 01:40:33 -0700 (PDT)
Received: from ip4d14bc8c.dynamic.kabel-deutschland.de ([77.20.188.140] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kNu8e-0000gU-7g; Thu, 01 Oct 2020 10:40:32 +0200
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 11/26] docs: reporting-bugs: remind people to back up their data
Date:   Thu,  1 Oct 2020 10:39:32 +0200
Message-Id: <9dab33e548f62cd3916f68c51629a6cd92b31ab9.1601541165.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601541165.git.linux@leemhuis.info>
References: <cover.1601541165.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1601541633;cbdb7f0a;
X-HE-SMSGID: 1kNu8e-0000gU-7g
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a small reminder that users are best of preparing for emergencies.
Doesn't cost us much and might prevent data-loss for a few people, as
disabling DKMS, installing mainline and other tasks this guide suggest
can break the system in you're unlucky.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/admin-guide/reporting-bugs.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
index 4828e8924136..05de4e0259cb 100644
--- a/Documentation/admin-guide/reporting-bugs.rst
+++ b/Documentation/admin-guide/reporting-bugs.rst
@@ -549,6 +549,19 @@ See the section 'Duties after the report went out' for details how to get
 properly involved.
 
 
+Prepare for emergencies
+-----------------------
+
+    *Create a fresh backup and put system repair and restore tools at hand.*
+
+Reminder, you are dealing with computers, and they sometimes do unexpected
+things, especially if you fiddle with crucial parts like the kernel of its
+operating system. That's what you are about to do in this process. Thus, make
+sure to create a fresh backup; also ensure you have all tools at hand to repair
+or reinstall the operating system as well as everything you need to restore the
+backup.
+
+
 .. ############################################################################
 .. Temporary marker added while this document is rewritten. Sections above
 .. are new and dual-licensed under GPLv2+ and CC-BY 4.0, those below are old.
-- 
2.26.2

