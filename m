Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1405A7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 09:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752518AbeEGJgK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 05:36:10 -0400
Received: from osg.samsung.com ([64.30.133.232]:52363 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752376AbeEGJgE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 05:36:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 33F1E23419;
        Mon,  7 May 2018 02:36:04 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WLXmYCpbF7Bt; Mon,  7 May 2018 02:36:03 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.109.86.dynamic.adsl.gvt.net.br [177.41.109.86])
        by osg.samsung.com (Postfix) with ESMTPSA id 3D54B233DE;
        Mon,  7 May 2018 02:36:01 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fFcYp-00087w-1p; Mon, 07 May 2018 06:35:59 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx warnings
Date:   Mon,  7 May 2018 06:35:49 -0300
Message-Id: <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The flow diagram should be inside a code-block to avoid those
warnings:
	./include/linux/wait.h:110: WARNING: Block quote ends without a blank line; unexpected unindent.
	./include/linux/wait.h:113: WARNING: Unexpected indentation.
	./include/linux/wait.h:115: WARNING: Block quote ends without a blank line; unexpected unindent.

This is easily done by using "::" instead of just ":".

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index d9f131ecf708..d907ed761a7f 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -101,7 +101,7 @@ init_waitqueue_func_entry(struct wait_queue_entry *wq_entry, wait_queue_func_t f
  * lead to sporadic and non-obvious failure.
  *
  * Use either while holding wait_queue_head::lock or when used for wakeups
- * with an extra smp_mb() like:
+ * with an extra smp_mb() like::
  *
  *      CPU0 - waker                    CPU1 - waiter
  *
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
