Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 95C017E279
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 09:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752093AbeEGJjo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 05:39:44 -0400
Received: from osg.samsung.com ([64.30.133.232]:47007 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752457AbeEGJgG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 05:36:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 790BE23433;
        Mon,  7 May 2018 02:36:05 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mAU8-tbymtGv; Mon,  7 May 2018 02:36:04 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.109.86.dynamic.adsl.gvt.net.br [177.41.109.86])
        by osg.samsung.com (Postfix) with ESMTPSA id 4942B233E2;
        Mon,  7 May 2018 02:36:01 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fFcYp-00087s-10; Mon, 07 May 2018 06:35:59 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 12/18] time: timer.c: adjust a kernel-doc comment
Date:   Mon,  7 May 2018 06:35:48 -0300
Message-Id: <f02e6a0ce27f3b5e33415d92d07a40598904b3ee.1525684985.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those three warnings can easily solved by using :: to indicate a
code block:

	./kernel/time/timer.c:1259: WARNING: Unexpected indentation.
	./kernel/time/timer.c:1261: WARNING: Unexpected indentation.
	./kernel/time/timer.c:1262: WARNING: Block quote ends without a blank line; unexpected unindent.

While here, align the lines at the block.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 kernel/time/timer.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4a4fd567fb26..cc2d23e6ff61 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1251,18 +1251,18 @@ EXPORT_SYMBOL(try_to_del_timer_sync);
  *
  * Note: For !irqsafe timers, you must not hold locks that are held in
  *   interrupt context while calling this function. Even if the lock has
- *   nothing to do with the timer in question.  Here's why:
+ *   nothing to do with the timer in question.  Here's why::
  *
  *    CPU0                             CPU1
  *    ----                             ----
- *                                   <SOFTIRQ>
- *                                   call_timer_fn();
- *                                     base->running_timer = mytimer;
- *  spin_lock_irq(somelock);
+ *                                     <SOFTIRQ>
+ *                                       call_timer_fn();
+ *                                       base->running_timer = mytimer;
+ *    spin_lock_irq(somelock);
  *                                     <IRQ>
  *                                        spin_lock(somelock);
- *  del_timer_sync(mytimer);
- *   while (base->running_timer == mytimer);
+ *    del_timer_sync(mytimer);
+ *    while (base->running_timer == mytimer);
  *
  * Now del_timer_sync() will never return and never release somelock.
  * The interrupt on the other CPU is waiting to grab somelock but
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
