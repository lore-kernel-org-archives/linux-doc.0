Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 920A57D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Jan 2019 21:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbfAIVED (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Jan 2019 16:04:03 -0500
Received: from ms.lwn.net ([45.79.88.28]:38528 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728002AbfAIVEC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 Jan 2019 16:04:02 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 383682CD
        for <linux-doc@vger.kernel.org>; Wed,  9 Jan 2019 21:04:02 +0000 (UTC)
Date:   Wed, 9 Jan 2019 14:04:01 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Subject: [PATCH] docs: don't try to get comments from rcupdate_wait.h or
 rcutree.h
Message-ID: <20190109140401.3419bdef@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Neither file contains any kerneldoc comments, so including them generates
these warnings in the docs build:

  ./include/linux/rcupdate_wait.h:1: warning: no structured comments found
  ./include/linux/rcutree.h:1: warning: no structured comments found

Remove them and make life a little quieter.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/kernel-api.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index cdd24943fbcc..71f5d2fe39b7 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -356,10 +356,6 @@ Read-Copy Update (RCU)
 
 .. kernel-doc:: include/linux/rcupdate.h
 
-.. kernel-doc:: include/linux/rcupdate_wait.h
-
-.. kernel-doc:: include/linux/rcutree.h
-
 .. kernel-doc:: kernel/rcu/tree.c
 
 .. kernel-doc:: kernel/rcu/tree_plugin.h
-- 
2.20.1

