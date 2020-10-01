Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4414CC47420
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EFD120BED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgJAIjv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgJAIjv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 04:39:51 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4408C0613D0
        for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2020 01:39:50 -0700 (PDT)
Received: from ip4d14bc8c.dynamic.kabel-deutschland.de ([77.20.188.140] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kNu7w-0006b9-1W; Thu, 01 Oct 2020 10:39:48 +0200
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 01/26] docs: reporting-bugs: temporary markers for licensing and diff reasons
Date:   Thu,  1 Oct 2020 10:39:22 +0200
Message-Id: <889e4cfbc55e552b8100d9f54c10260cdc9826ed.1601541165.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601541165.git.linux@leemhuis.info>
References: <cover.1601541165.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1601541591;15880b4a;
X-HE-SMSGID: 1kNu7w-0006b9-1W
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two temporary markers for the transition to the rewritten document.

Both tell users that the document is incomplete and partly inconsistent
before all patches from the series got applied. It also points out the
new text is dual-licensed under GPLv2+ and CC-BY 4.0. The latter is
better for documentation in general. It's also more liberal, which is a
nice-to-have for a document like this, as other that makes it possible
for websites and books to republish it or build upon it.

The second marker separates old and new text, which makes diffs a lot
more readable. It's also there for licensing reasons, as it makes is
obvious that all old text is gone in the end. Then a proper SPDX license
tag will get added as well.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

= RFC =

Let me know if you think dual-licensing was a bad idea or if CC-BY-4.0 is a bad
choice here.
---
 Documentation/admin-guide/reporting-bugs.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
index 42481ea7b41d..4bbb9132782b 100644
--- a/Documentation/admin-guide/reporting-bugs.rst
+++ b/Documentation/admin-guide/reporting-bugs.rst
@@ -3,6 +3,19 @@
 Reporting bugs
 ++++++++++++++
 
+.. ############################################################################
+.. Temporary marker added while this document is rewritten. The sections below
+.. up to a second marker of this kind are new and dual-licensed under GPLv2+
+.. and CC-BY 4.0. Both sections are incomplete as of now and thus might be
+.. inconsistent/not make sense before all patches of the rewrite got applied.
+.. ###########################################################################
+
+.. ############################################################################
+.. Temporary marker added while this document is rewritten. Sections above
+.. are new and dual-licensed under GPLv2+ and CC-BY 4.0, those below are old.
+.. Both sections are incomplete as of now and thus sometimes inconsistent.
+.. ###########################################################################
+
 Background
 ==========
 
-- 
2.26.2

