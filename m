Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 634207DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 13:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752096AbeC0NAY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 09:00:24 -0400
Received: from mout01.posteo.de ([185.67.36.65]:37652 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752026AbeC0NAX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Mar 2018 09:00:23 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 3515521241
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 15:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1522155621; bh=gcPtQkK4IDZjeP4FOvS/HWxzrEfoU2Uo3IR4ShWu1NY=;
        h=From:To:Cc:Subject:Date:From;
        b=oWwEdiZoZGMa6e/sfstIZ3Xa94nbu2pC5tHkZ1IUS3s2Ed9yAwE+G7owDSvE3SbqA
         h5B7TQbi+KC5kVFVJxPh70mSrVUURjCsvJtIiykHMaAs65scfdtpNRGR/QdvtCeevU
         neX+NEwqXxTV38By5l+lXAmiCQErDDSgkJl9f2lKdyD4CtHL0I44nJk2D9isFkK6Fj
         rxysWdfaKMBOcCyDEjkxjLUVPg6xAsiQZp8QXomeTMrBX8DIN4dDwBsVyI7FlsZcvF
         IMUBjimmv9W+gv15r+5gPzHty2itbZUEviLG54Z8qnHeKaShGHyMNOZ5cuSYzW+DmT
         vWkG0Zun3Z7Ig==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 409WMP6VD9z9rxj;
        Tue, 27 Mar 2018 15:00:17 +0200 (CEST)
From:   Martin Kepplinger <martink@posteo.de>
To:     corbet@lwn.net
Cc:     mchehab@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] Documentation/process: update FUSE project website
Date:   Tue, 27 Mar 2018 14:59:50 +0200
Message-Id: <20180327125950.717-1-martink@posteo.de>
X-Mailer: git-send-email 2.14.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

According to the old project site, https://sourceforge.net/projects/fuse/
the project has moved to https://github.com/libfuse/ so we update the
link to point to the latest libfuse release.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 Documentation/process/changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 4f19a9725f76..ddc029734b25 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -430,7 +430,7 @@ udev
 FUSE
 ----
 
-- <http://sourceforge.net/projects/fuse>
+- <https://github.com/libfuse/libfuse/releases>
 
 mcelog
 ------
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
