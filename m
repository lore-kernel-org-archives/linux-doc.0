Return-Path: <SRS0=Qg7B=3X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12665C35247
	for <linux-doc@archiver.kernel.org>; Mon,  3 Feb 2020 20:17:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D76E320721
	for <linux-doc@archiver.kernel.org>; Mon,  3 Feb 2020 20:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgBCURP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Feb 2020 15:17:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38440 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgBCURP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Feb 2020 15:17:15 -0500
Received: from fencepost.gnu.org ([2001:470:142:3::e]:45307)
        by eggs.gnu.org with esmtp (Exim 4.71)
        (envelope-from <lxsameer@gnu.org>)
        id 1iyi9c-0007kM-7k; Mon, 03 Feb 2020 15:17:08 -0500
Received: from [46.7.45.31] (port=50322 helo=localhost.localdomain)
        by fencepost.gnu.org with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.82)
        (envelope-from <lxsameer@gnu.org>)
        id 1iyi9b-0006DK-4G; Mon, 03 Feb 2020 15:17:07 -0500
From:   Sameer Rahmani <lxsameer@gnu.org>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, Sameer Rahmani <lxsameer@gnu.org>
Subject: [PATCH] Documentation: build warnings related to missing blank lines after explicit markups has been fixed
Date:   Mon,  3 Feb 2020 20:15:43 +0000
Message-Id: <20200203201543.24834-1-lxsameer@gnu.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix for several documentation build warnings related to missing blank lines
after explicit mark up.

Exact warning message:
 WARNING: Explicit markup ends without a blank line; unexpected unindent.

Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
---
 Documentation/doc-guide/contributing.rst       | 1 +
 Documentation/doc-guide/maintainer-profile.rst | 1 +
 Documentation/trace/kprobetrace.rst            | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
index 10956583d22e..67ee3691f91f 100644
--- a/Documentation/doc-guide/contributing.rst
+++ b/Documentation/doc-guide/contributing.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+
 How to help improve kernel documentation
 ========================================
 
diff --git a/Documentation/doc-guide/maintainer-profile.rst b/Documentation/doc-guide/maintainer-profile.rst
index aee2f508cc89..5afc0ddba40a 100644
--- a/Documentation/doc-guide/maintainer-profile.rst
+++ b/Documentation/doc-guide/maintainer-profile.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+
 Documentation subsystem maintainer entry profile
 ================================================
 
diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kprobetrace.rst
index 55993055902c..cc4c5fc313df 100644
--- a/Documentation/trace/kprobetrace.rst
+++ b/Documentation/trace/kprobetrace.rst
@@ -97,6 +97,7 @@ which shows given pointer in "symbol+offset" style.
 For $comm, the default type is "string"; any other type is invalid.
 
 .. _user_mem_access:
+
 User Memory Access
 ------------------
 Kprobe events supports user-space memory access. For that purpose, you can use
@@ -252,4 +253,3 @@ And you can see the traced information via /sys/kernel/debug/tracing/trace.
 Each line shows when the kernel hits an event, and <- SYMBOL means kernel
 returns from SYMBOL(e.g. "sys_open+0x1b/0x1d <- do_sys_open" means kernel
 returns from do_sys_open to sys_open+0x1b).
-
-- 
2.25.0

