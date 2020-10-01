Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F60C47425
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:40:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A22F420B1F
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 08:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgJAIkN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731560AbgJAIkN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 04:40:13 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68A1C0613E2
        for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2020 01:40:12 -0700 (PDT)
Received: from ip4d14bc8c.dynamic.kabel-deutschland.de ([77.20.188.140] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kNu8I-0000Ew-Ih; Thu, 01 Oct 2020 10:40:10 +0200
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 07/26] docs: reporting-bugs: let users classify their issue
Date:   Thu,  1 Oct 2020 10:39:28 +0200
Message-Id: <d9917c1f15a965f75f20ca9f0db4ca3ae24c9e98.1601541165.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601541165.git.linux@leemhuis.info>
References: <cover.1601541165.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1601541613;ccdd3fdb;
X-HE-SMSGID: 1kNu8I-0000Ew-Ih
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Explicitly outline that some issues are more important than others and
thus need to be handled differently in some steps that are about to
follow. This makes things explicit and easy to find if you need to look
up what issues actually qualify as "regression" or a "severe problem".

The alternative would have been: explain each of the three types in the
place where it requires special handling for the first time. But that
makes it quite easy to miss and harder to find when you need to look it
up.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/admin-guide/reporting-bugs.rst | 39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
index 434e1a890dfe..430a0c3ee0ad 100644
--- a/Documentation/admin-guide/reporting-bugs.rst
+++ b/Documentation/admin-guide/reporting-bugs.rst
@@ -272,6 +272,45 @@ you want to circumvent it consider installing the mainline kernel yourself; just
 make sure it's the latest one (see below).
 
 
+Issue of high priority?
+-----------------------
+
+    *See if the issue you are dealing with qualifies as regression, security
+    issue, or a really severe problem: those are 'issues of high priority' that
+    need special handling in some steps that are about to follow.*
+
+Linus Torvalds and the leading Linux kernel developers want to see some issues
+fixed as soon as possible, hence these 'issues of high priority' get handled
+slightly different in the reporting process. Three type of cases qualify:
+regressions, security issues, and really severe problems.
+
+You deal with a 'regression' if something that worked with an older version of
+the Linux kernel does not work with a newer one or somehow works worse with it.
+It thus is a regression when a Wi-Fi driver that did a fine job with Linux 5.7
+somehow misbehaves with 5.8 or doesn't work at all. It's also a regression if
+an application shows erratic behavior with a newer kernel, which might happen
+due to incompatible changes in the interface between the kernel and the
+userland (like procfs and sysfs). Significantly reduced performance or
+increased power consumption also qualify as regression. But keep in mind: the
+new kernel needs to be build with a configuration that is similar to the one
+from the old kernel (see below how to archive that). That's because
+process is sometimes only possible by doing incompatible changes; but to avoid
+regression such changes have to be enabled explicitly during build time
+configuration.
+
+What qualifies as security issue is left to your judgment. Consider reading
+:ref:`Documentation/admin-guide/security-bugs.rst <securitybugs>` before
+proceeding.
+
+An issue is a 'really severe problem' when something totally unacceptable bad
+happens. That's for example the case when a Linux kernel corrupts the data it's
+handling or damages hardware it's running on. You're also dealing with a severe
+issue when the kernel suddenly stops working with an error message ('kernel
+panic') or without any farewell note at all. Note: do not confused a 'panic' (a
+fatal error where the kernels stop itself) with a 'Oops' (a recoverable error),
+as the kernel remains running after an 'Oops'.
+
+
 .. ############################################################################
 .. Temporary marker added while this document is rewritten. Sections above
 .. are new and dual-licensed under GPLv2+ and CC-BY 4.0, those below are old.
-- 
2.26.2

