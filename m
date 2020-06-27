Return-Path: <SRS0=fZPN=AI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255BBC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 27 Jun 2020 09:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1027320768
	for <linux-doc@archiver.kernel.org>; Sat, 27 Jun 2020 09:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgF0JXH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Jun 2020 05:23:07 -0400
Received: from sym2.noone.org ([178.63.92.236]:35032 "EHLO sym2.noone.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbgF0JXH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 27 Jun 2020 05:23:07 -0400
X-Greylist: delayed 471 seconds by postgrey-1.27 at vger.kernel.org; Sat, 27 Jun 2020 05:23:06 EDT
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 49v7Zs3vMTzvjc1; Sat, 27 Jun 2020 11:23:00 +0200 (CEST)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/features: Add kcov
Date:   Sat, 27 Jun 2020 11:23:00 +0200
Message-Id: <20200627092300.29438-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an arch support status file for kcov (ARCH_HAS_KCOV).

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 .../features/debug/kcov/arch-support.txt      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/features/debug/kcov/arch-support.txt

diff --git a/Documentation/features/debug/kcov/arch-support.txt b/Documentation/features/debug/kcov/arch-support.txt
new file mode 100644
index 000000000000..52f23baca45d
--- /dev/null
+++ b/Documentation/features/debug/kcov/arch-support.txt
@@ -0,0 +1,34 @@
+#
+# Feature name:          kcov
+#         Kconfig:       ARCH_HAS_KCOV
+#         description:   arch supports kcov for coverage-guided fuzzing
+#
+    -----------------------
+    |         arch |status|
+    -----------------------
+    |       alpha: | TODO |
+    |         arc: | TODO |
+    |         arm: |  ok  |
+    |       arm64: |  ok  |
+    |         c6x: | TODO |
+    |        csky: | TODO |
+    |       h8300: | TODO |
+    |     hexagon: | TODO |
+    |        ia64: | TODO |
+    |        m68k: | TODO |
+    |  microblaze: | TODO |
+    |        mips: |  ok  |
+    |       nds32: | TODO |
+    |       nios2: | TODO |
+    |    openrisc: | TODO |
+    |      parisc: | TODO |
+    |     powerpc: |  ok  |
+    |       riscv: |  ok  |
+    |        s390: |  ok  |
+    |          sh: | TODO |
+    |       sparc: | TODO |
+    |          um: |  ok  |
+    |   unicore32: | TODO |
+    |         x86: |  ok  |
+    |      xtensa: | TODO |
+    -----------------------
-- 
2.27.0

