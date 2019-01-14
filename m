Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2E9B17D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 10:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfANKIR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 05:08:17 -0500
Received: from Galois.linutronix.de ([146.0.238.70]:38985 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfANKIR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jan 2019 05:08:17 -0500
Received: from localhost ([127.0.0.1] helo=bazinga.breakpoint.cc)
        by Galois.linutronix.de with esmtp (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1gizAE-0001f6-Kf; Mon, 14 Jan 2019 11:08:14 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, tglx@linutronix.de,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] Documentation/dev-tools: Use gcc version number instead svn revision number
Date:   Mon, 14 Jan 2019 11:08:07 +0100
Message-Id: <20190114100807.7322-1-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

svn commit 231296 matches commit d29e939c63b71 ("Add fuzzing coverage
support") in the gcc git. The change is part of gcc 6.1.0.

Replace the svn commit number with a gcc version which everyone can
easily compare.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/dev-tools/kcov.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index c2f6452e38ed0..42b6126777998 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -22,7 +22,7 @@ Prerequisites
 
         CONFIG_KCOV=y
 
-CONFIG_KCOV requires gcc built on revision 231296 or later.
+CONFIG_KCOV requires gcc 6.1.0 or later.
 
 If the comparison operands need to be collected, set::
 
-- 
2.20.1

