Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 713DE7D048
	for <lwn-linux-doc@archive.lwn.net>; Sun,  3 Jun 2018 18:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750996AbeFCSQw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 3 Jun 2018 14:16:52 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:24524 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750952AbeFCSQw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 3 Jun 2018 14:16:52 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 2D11E40FD6;
        Sun,  3 Jun 2018 20:16:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id 1xhDm8XKWeRd; Sun,  3 Jun 2018 20:16:48 +0200 (CEST)
From:   Michael Rodin <michael-git@rodin.online>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Rodin <michael-git@rodin.online>
Subject: [PATCH] Documentation/admin-guide/README.rst: add a label for cross-referencing
Date:   Sun,  3 Jun 2018 20:16:09 +0200
Message-Id: <20180603181609.7015-1-michael-git@rodin.online>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a label to the top of the file to allow cross-referencing.
Currently it's not possible to cross-reference this file from
Documentation/process/howto.rst because of the missing label.

Signed-off-by: Michael Rodin <michael-git@rodin.online>
---
 Documentation/admin-guide/README.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 02caa7efd5ef..15ea785b2dfa 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -1,3 +1,5 @@
+.. _readme:
+
 Linux kernel release 4.x <http://kernel.org/>
 =============================================
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
