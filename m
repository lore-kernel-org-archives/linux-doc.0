Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B01627DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 14:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935661AbeEJOiX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 10:38:23 -0400
Received: from osg.samsung.com ([64.30.133.232]:64207 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935438AbeEJOiW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 May 2018 10:38:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id B39FA2ED42;
        Thu, 10 May 2018 07:38:21 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XGUZz3KXUMBh; Thu, 10 May 2018 07:38:20 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.96.165.dynamic.adsl.gvt.net.br [177.41.96.165])
        by osg.samsung.com (Postfix) with ESMTPSA id 243912ED30;
        Thu, 10 May 2018 07:38:20 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fGmi1-0005HI-OT; Thu, 10 May 2018 10:38:17 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 2/2] wait: add a keyword to indicate a diagram code block on a kernel-doc
Date:   Thu, 10 May 2018 10:38:17 -0400
Message-Id: <dfe40a6f75e9bd445ea36218dbcf367090b2367b.1525962971.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
References: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
In-Reply-To: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
References: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When handling code-blocks, usual parsing should be disabled.
Indicate it by using the keyword disagram.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index d9f131ecf708..653814475ee9 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -101,7 +101,7 @@ init_waitqueue_func_entry(struct wait_queue_entry *wq_entry, wait_queue_func_t f
  * lead to sporadic and non-obvious failure.
  *
  * Use either while holding wait_queue_head::lock or when used for wakeups
- * with an extra smp_mb() like:
+ * with an extra smp_mb() as shown in this diagram:
  *
  *      CPU0 - waker                    CPU1 - waiter
  *
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
