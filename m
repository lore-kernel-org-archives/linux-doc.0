Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 587867DE77
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 14:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751398AbeC2O7J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 10:59:09 -0400
Received: from osg.samsung.com ([64.30.133.232]:59385 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751219AbeC2O7J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Mar 2018 10:59:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 310503F024;
        Thu, 29 Mar 2018 07:59:09 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nW0dH9neZDU2; Thu, 29 Mar 2018 07:59:03 -0700 (PDT)
Received: from smtp.s-opensource.com (177.205.88.90.dynamic.adsl.gvt.net.br [177.205.88.90])
        by osg.samsung.com (Postfix) with ESMTPSA id 2E48A3F00E;
        Thu, 29 Mar 2018 07:59:03 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1f1Z12-0001pF-Sl; Thu, 29 Mar 2018 10:59:00 -0400
From:   Mauro Carvalho Chehab <mchehab@s-opensource.com>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        corbet@lwn.net, johannes@sipsolutions.net
Subject: [PATCH] docs: kernel-doc: fix parsing of arrays
Date:   Thu, 29 Mar 2018 10:58:59 -0400
Message-Id: <d5892e146872e40717117da6cc01e57525a063d2.1522335536.git.mchehab@s-opensource.com>
X-Mailer: git-send-email 2.14.3
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The logic with parses array has a bug that prevents it to
parse arrays like:
	struct {
	...
		struct {
			u64 msdu[IEEE80211_NUM_TIDS + 1];
			...
	...

Fix the parser to accept it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index fee8952037b1..4356afda5afb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1062,7 +1062,7 @@ sub dump_struct($$) {
 					# Handle bitmaps
 					$arg =~ s/:\s*\d+\s*//g;
 					# Handle arrays
-					$arg =~ s/\[\S+\]//g;
+					$arg =~ s/\[.*\]//g;
 					# The type may have multiple words,
 					# and multiple IDs can be defined, like:
 					#	const struct foo, *bar, foobar
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
