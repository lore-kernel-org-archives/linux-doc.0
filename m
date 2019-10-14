Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B38937D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Oct 2019 15:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732015AbfJNP7t convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Oct 2019 11:59:49 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:46583 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731960AbfJNP7t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Oct 2019 11:59:49 -0400
Received: from gau.home (lfbn-1-1117-73.w86-252.abo.wanadoo.fr [86.252.183.73])
        (Authenticated sender: romuald@chivil.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4E2C3200006;
        Mon, 14 Oct 2019 15:59:47 +0000 (UTC)
From:   Romuald Brunet <romuald@chivil.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: [PATCH] docs: Add reference in binfmt-misc.rst
Message-Id: <16A12D5F-582C-447E-8071-0867610C8F22@chivil.com>
Date:   Mon, 14 Oct 2019 17:59:46 +0200
Cc:     trivial@kernel.org
To:     linux-doc@vger.kernel.org
X-Mailer: Apple Mail (2.3445.9.1)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While looking at the binfmt-misc documentation I noticed that there is a
reference to the “java” example that could be a direct link.

This patch simply adds the link without changing the HTML output.

Signed-off-by: Romuald Brunet <romuald@chivil.com>

diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
index 97b0d792707..4fb665e7d8a 100644
--- a/Documentation/admin-guide/binfmt-misc.rst
+++ b/Documentation/admin-guide/binfmt-misc.rst
@@ -140,8 +140,8 @@ Hints
 -----
 
 If you want to pass special arguments to your interpreter, you can
-write a wrapper script for it. See Documentation/admin-guide/java.rst for an
-example.
+write a wrapper script for it.
+See :doc:`Documentation/admin-guide/java.rst <./java>` for an example.
 
 Your interpreter should NOT look in the PATH for the filename; the kernel
 passes it the full filename (or the file descriptor) to use.  Using ``$PATH`` can


-- 
Romuald Brunet

