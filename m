Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D760C5519F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC49A221E9
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgKLSAl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgKLR73 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 12:59:29 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5617BC0613D1;
        Thu, 12 Nov 2020 09:59:29 -0800 (PST)
Received: from ip4d145e30.dynamic.kabel-deutschland.de ([77.20.94.48] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kdGsa-00076N-1N; Thu, 12 Nov 2020 18:59:28 +0100
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 18/26] docs: reporting-bugs: let users optimize their notes
Date:   Thu, 12 Nov 2020 18:58:55 +0100
Message-Id: <086bd8741d409b6c60b7199596651695366f722e.1605203187.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605203187.git.linux@leemhuis.info>
References: <cover.1605203187.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1605203969;0e5b1c25;
X-HE-SMSGID: 1kdGsa-00076N-1N
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The reader now users the mainline kernel and is getting closer to
reporting the issue, so it's a good point to let people recheck and
optimize their notes how to reproduce the issue. It's also a good moment
to make them search again for existing reports, as they might have
learned something in the previous steps.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/admin-guide/reporting-bugs.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
index 60a84f52724c..7af4e7a6e797 100644
--- a/Documentation/admin-guide/reporting-bugs.rst
+++ b/Documentation/admin-guide/reporting-bugs.rst
@@ -820,6 +820,25 @@ head over to the section "Details about reporting issues only occurring in
 older kernel version lines" below.
 
 
+Optimize description to reproduce issue
+---------------------------------------
+
+    *Optimize your notes: try to find and write the most straightforward way to
+    reproduce your issue. Make sure the end result has all the important
+    details, and at the same time is easy to read and understand for others
+    that hear about it for the first time. And if you learned something in this
+    process, consider searching again for existing reports about the issue.*
+
+An unnecessarily complex report will make it hard for others to understand your
+report. Thus try to find a reproducer that's straight forward to describe and
+thus easy to understand in written form. Include all important details, but at
+the same time try to keep it as short as possible.
+
+In this in the previous steps you likely have learned a thing or two about the
+issue you face. Use this knowledge and search again for existing reports
+instead you can join.
+
+
 .. ############################################################################
 .. Temporary marker added while this document is rewritten. Sections above
 .. are new and dual-licensed under GPLv2+ and CC-BY 4.0, those below are old.
-- 
2.28.0

