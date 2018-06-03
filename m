Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AAEF7D048
	for <lwn-linux-doc@archive.lwn.net>; Sun,  3 Jun 2018 18:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750996AbeFCSRn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 3 Jun 2018 14:17:43 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:38598 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750952AbeFCSRm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 3 Jun 2018 14:17:42 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id 63EF744442;
        Sun,  3 Jun 2018 20:17:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id b4SWPCNwNmqf; Sun,  3 Jun 2018 20:17:40 +0200 (CEST)
From:   Michael Rodin <michael-git@rodin.online>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Rodin <michael-git@rodin.online>
Subject: [PATCH] Documentation/process/howto.rst: add a missing cross-reference
Date:   Sun,  3 Jun 2018 20:17:33 +0200
Message-Id: <20180603181733.7093-1-michael-git@rodin.online>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a missing cross-reference from Documentation/process/howto.rst
to Documentation/admin-guide/README.rst.

Signed-off-by: Michael Rodin <michael-git@rodin.online>
---
 Documentation/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 3df55811b916..130bf0f48875 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -85,7 +85,7 @@ linux-api@vger.kernel.org.
 Here is a list of files that are in the kernel source tree that are
 required reading:
 
-  README
+  :ref:`Documentation/admin-guide/README.rst <readme>`
     This file gives a short background on the Linux kernel and describes
     what is necessary to do to configure and build the kernel.  People
     who are new to the kernel should start here.
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
