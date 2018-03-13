Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4C067E66E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 11:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932980AbeCMLdZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 07:33:25 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:40644 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932903AbeCMLdX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Mar 2018 07:33:23 -0400
X-Greylist: delayed 957 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Mar 2018 07:33:23 EDT
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
        by Forcepoint Email with ESMTPS id A53DF19CED907;
        Tue, 13 Mar 2018 11:17:22 +0000 (GMT)
Received: from localhost.localdomain (10.60.4.28) by hhmail02.hh.imgtec.org
 (10.100.10.21) with Microsoft SMTP Server (TLS) id 14.3.382.0; Tue, 13 Mar
 2018 11:17:24 +0000
From:   Eric Engestrom <eric.engestrom@imgtec.com>
To:     <linux-kernel@vger.kernel.org>
CC:     Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: [trivial PATCH] Documentation/sparse: fix typo
Date:   Tue, 13 Mar 2018 11:10:58 +0000
Message-ID: <20180313111128.5803-1-eric.engestrom@imgtec.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.60.4.28]
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Eric Engestrom <eric.engestrom@imgtec.com>
---
 Documentation/dev-tools/sparse.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/sparse.rst b/Documentation/dev-tools/sparse.rst
index 78aa00a604a009071361..c401c952a340a50fa769 100644
--- a/Documentation/dev-tools/sparse.rst
+++ b/Documentation/dev-tools/sparse.rst
@@ -67,7 +67,7 @@ __releases - The specified lock is held on function entry, but not exit.
 
 If the function enters and exits without the lock held, acquiring and
 releasing the lock inside the function in a balanced way, no
-annotation is needed.  The tree annotations above are for cases where
+annotation is needed.  The three annotations above are for cases where
 sparse would otherwise report a context imbalance.
 
 Getting sparse
-- 
Cheers,
  Eric

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
