Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF0317DE76
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 09:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751872AbeCVJyY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 05:54:24 -0400
Received: from osg.samsung.com ([64.30.133.232]:44739 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751784AbeCVJyY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Mar 2018 05:54:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 8DE65256B0;
        Thu, 22 Mar 2018 02:54:23 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SQ3zhHW7p7tb; Thu, 22 Mar 2018 02:54:22 -0700 (PDT)
Received: from smtp.s-opensource.com (unknown [179.183.96.62])
        by osg.samsung.com (Postfix) with ESMTPSA id 51A742569D;
        Thu, 22 Mar 2018 02:54:22 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1eywvL-0006GH-Ki; Thu, 22 Mar 2018 06:54:19 -0300
From:   Mauro Carvalho Chehab <mchehab@s-opensource.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-doc <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonas Oberg <jonas@fsfe.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>
Subject: [PATCH 1/2] COPYING: create a new file with points to the Kernel license files
Date:   Thu, 22 Mar 2018 06:54:13 -0300
Message-Id: <20180322095414.24019-2-mchehab@s-opensource.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180322095414.24019-1-mchehab@s-opensource.com>
References: <20180322095414.24019-1-mchehab@s-opensource.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the addition of SPDX patchset, the contents of COPYING file
is now duplicated at two other files under LICENSE:
	LICENSES/preferred/GPL-2.0
	LICENSES/exceptions/Linux-syscall-note

It is easy to check that the contents of the licence written on
those files are identical with COPYING using:

	$ diff -upr COPYING LICENSES/preferred/GPL-2.0
	$ diff -upr COPYING LICENSES/exceptions/Linux-syscall-note|less

Also, a new file was added, with describes how SPDX should work at
the Kernel source files:
	Documentation/process/license-rules.rst

Instead fo having it copying the contents of two files, and not
even mentioning the third one, replace it by a file whose content
points to the other tree files, preserving the Kernel's license.

Adjust license-rules.rst accordingly.

Please notice that this file preserves the Kernel license as
is, without any changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 COPYING.new                             | 18 ++++++++++++++++++
 Documentation/process/license-rules.rst | 20 +++++++++++---------
 2 files changed, 29 insertions(+), 9 deletions(-)
 create mode 100644 COPYING.new

diff --git a/COPYING.new b/COPYING.new
new file mode 100644
index 000000000000..da4cb28febe6
--- /dev/null
+++ b/COPYING.new
@@ -0,0 +1,18 @@
+The Linux Kernel is provided under:
+
+	SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+
+Being under the terms of the GNU General Public License version 2 only,
+according with:
+
+	LICENSES/preferred/GPL-2.0
+
+With an explicit syscall exception, as stated at:
+
+	LICENSES/exceptions/Linux-syscall-note
+
+In addition, other licenses may also apply. Please see:
+
+	Documentation/process/license-rules.rst
+
+for more details.
diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 408f77dc6157..bba178e68a0c 100644
--- a/Documentation/process/license-rules.rst
+++ b/Documentation/process/license-rules.rst
@@ -4,15 +4,17 @@ Linux kernel licensing rules
 ============================
 
 The Linux Kernel is provided under the terms of the GNU General Public
-License version 2 only (GPL-2.0), as published by the Free Software
-Foundation, and provided in the COPYING file.  This documentation file is
-not meant to replace the COPYING file, but provides a description of how
-each source file should be annotated to make the licensing it is governed
-under clear and unambiguous.
-
-The license in the COPYING file applies to the kernel source as a whole,
-though individual source files can have a different license which is
-required to be compatible with the GPL-2.0::
+version 2 only (GPL-2.0), as written at LICENSES/preferred/GPL-2.0,
+with an explicit syscall exception described at
+LICENSES/exceptions/Linux-syscall-note, as described in the COPYING file.
+
+This documentation file is not meant to replace the Kernel's license,
+but provides a description of how each source file should be annotated
+to make the licensing it is governed under clear and unambiguous.
+
+The license described in the COPYING file applies to the kernel source
+as a whole, though individual source files can have a different license
+which is required to be compatible with the GPL-2.0::
 
     GPL-1.0+  :  GNU General Public License v1.0 or later
     GPL-2.0+  :  GNU General Public License v2.0 or later
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
