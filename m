Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CAC797D043
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Jun 2018 15:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752480AbeFFPpv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Jun 2018 11:45:51 -0400
Received: from osg.samsung.com ([64.30.133.232]:62585 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932158AbeFFPpK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 6 Jun 2018 11:45:10 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id A8A2B3B829;
        Wed,  6 Jun 2018 08:45:09 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7K_G58LmZn8v; Wed,  6 Jun 2018 08:45:08 -0700 (PDT)
Received: from smtp.s-opensource.com (177.43.29.180.dynamic.adsl.gvt.net.br [177.43.29.180])
        by osg.samsung.com (Postfix) with ESMTPSA id 8CD013B81F;
        Wed,  6 Jun 2018 08:45:08 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.87)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1dAbPD-0000yR-4T; Tue, 16 May 2017 09:16:47 -0300
From:   Mauro Carvalho Chehab <mchehab@s-opensource.com>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Cyrille Pitchen <cyrille.pitchen@atmel.com>,
        linux-mtd@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 50/53] fs: fix the location of the kernel-api book
Date:   Tue, 16 May 2017 09:16:42 -0300
Message-Id: <e1511a840a33f84bfbcfa00029fa841c211d32bf.1494935649.git.mchehab@s-opensource.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel-api book is now part of the core-api. Update its
location.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 fs/debugfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index e892ae7d89f8..77440e4aa9d4 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -9,7 +9,7 @@
  *	2 as published by the Free Software Foundation.
  *
  *  debugfs is for people to use instead of /proc or /sys.
- *  See Documentation/DocBook/kernel-api for more details.
+ *  See ./Documentation/core-api/kernel-api.rst for more details.
  *
  */
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
