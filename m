Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360C4C11F66
	for <linux-doc@archiver.kernel.org>; Tue, 29 Jun 2021 14:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B11761DC2
	for <linux-doc@archiver.kernel.org>; Tue, 29 Jun 2021 14:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhF2OT1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Jun 2021 10:19:27 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:34053 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234387AbhF2OTX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jun 2021 10:19:23 -0400
Received: (Authenticated sender: cengiz@kernel.wtf)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 64B52E0005;
        Tue, 29 Jun 2021 14:16:51 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cengiz Can <cengiz@kernel.wtf>
Subject: [PATCH] Documentation: sysrq: convert to third person
Date:   Tue, 29 Jun 2021 17:15:09 +0300
Message-Id: <20210629141508.52229-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Two parts of the sysrq documentation have sentences written from a first
person's point of view.

Documentation is generally written from a third person's view in a
formal way.

Convert those senteces to be less personal and generic.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 Documentation/admin-guide/sysrq.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 60ce5f5ebab6..0a178ef0111d 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -72,7 +72,7 @@ On PowerPC
 
 On other
 	If you know of the key combos for other architectures, please
-        let me know so I can add them to this section.
+	submit a patch to be included in this section.
 
 On all
 	Write a character to /proc/sysrq-trigger.  e.g.::
@@ -205,10 +205,12 @@ frozen (probably root) filesystem via the FIFREEZE ioctl.
 Sometimes SysRq seems to get 'stuck' after using it, what can I do?
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-That happens to me, also. I've found that tapping shift, alt, and control
-on both sides of the keyboard, and hitting an invalid sysrq sequence again
-will fix the problem. (i.e., something like :kbd:`alt-sysrq-z`). Switching to
-another virtual console (:kbd:`ALT+Fn`) and then back again should also help.
+When this happens, try tapping shift, alt and control on both sides of the
+keyboard, and hitting an invalid sysrq sequence again. (i.e., something like
+:kbd:`alt-sysrq-z`).
+
+Switching to another virtual console (:kbd:`ALT+Fn`) and then back again
+should also help.
 
 I hit SysRq, but nothing seems to happen, what's wrong?
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.32.0

