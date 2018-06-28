Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3DE387D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 10:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933361AbeF1KnW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 06:43:22 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:44061 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933048AbeF1KnU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 06:43:20 -0400
Received: by mail-wr0-f193.google.com with SMTP id p12-v6so4993664wrn.11
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hQ//zhiZWIt8rr8pvRe5K1025w5pjvmiQs6dBAXdJ6E=;
        b=dBNKqcpvPnJgoqL6heoq+LBAx6kt1if09DseQ5RNb/dhdp1NZKW3o36MZfnHzjNnV/
         TItjdM+UODZzc9rk/iCKTtlwolZfB1g/aA9J/GPs/Nc/jWKszLzjfyvCWurWnCCAoebN
         fZqPEZkJ2wdeqeduV8w8QmYxrfUCbnSTjnQig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hQ//zhiZWIt8rr8pvRe5K1025w5pjvmiQs6dBAXdJ6E=;
        b=dsd0mU6VFjU+aK1TQNBrA8mJ9plK8F4AXVtOHFVFCHW6IHhhY6lcGmTuqsFpEko75J
         hAK5guEXeBebb/vjzQHA2a4uQd8azckxXMI1PZpW3ERbGGkr4Pyvq3SgjRAehODgZk5G
         tSCObHZtkw0fnQaAQf88/lai5tjeAVUVG1JNGcx1GmeIu+MICXaM5Y9Hp+gRcT3eEcW0
         M0VIVE9bPLw0kTUiUn6tk9dY+0TJmCYrlcLMuMSxowcdUtSZUhNS0GqLx13AvatX4LK+
         YGYe8iIOk+bZkwdOUzikCFewjokY7qSgCQ+OVWIKZ9Z87NJQ1XRxBZTfaAJehQRS2nxp
         9pTA==
X-Gm-Message-State: APt69E3osR+A3Er4RA6rKj+yOFe60NXvNHDfKoiDiaguvexpysGNDqxf
        BFYyHLdZ05Lo/PNyYQ/ztx6Fvg==
X-Google-Smtp-Source: AAOMgpdMnHBvPDu7njcZUb6CPc/x/VzEJCZzoTCxZ1QAfCg23/GYraKwexMuG89RtO0E/54rswfItw==
X-Received: by 2002:adf:fac6:: with SMTP id a6-v6mr7960408wrs.74.1530182599246;
        Thu, 28 Jun 2018 03:43:19 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id 14-v6sm9257298wmh.8.2018.06.28.03.43.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 03:43:18 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [PATCH 1/3] sched: Use smp_mb() in wake_woken_function()
Date:   Thu, 28 Jun 2018 12:41:18 +0200
Message-Id: <1530182480-13205-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

wake_woken_function() synchronizes with wait_woken() as follows:

  [wait_woken]                       [wake_woken_function]

  entry->flags &= ~wq_flag_woken;    condition = true;
  smp_mb();                          smp_wmb();
  if (condition)                     wq_entry->flags |= wq_flag_woken;
     break;

This commit replaces the above smp_wmb() with an smp_mb() in order to
guarantee that either wait_woken() sees the wait condition being true
or the store to wq_entry->flags in woken_wake_function() follows the
store in wait_woken() in the coherence order (so that the former can
eventually be observed by wait_woken()).

The commit also fixes a comment associated to set_current_state() in
wait_woken(): the comment pairs the barrier in set_current_state() to
the above smp_wmb(), while the actual pairing involves the barrier in
set_current_state() and the barrier executed by the try_to_wake_up()
in wake_woken_function().

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <<paulmck@linux.vnet.ibm.com>
---
 kernel/sched/wait.c | 47 +++++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 928be527477eb..a7a2aaa3026a6 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -392,35 +392,36 @@ static inline bool is_kthread_should_stop(void)
  *     if (condition)
  *         break;
  *
- *     p->state = mode;				condition = true;
- *     smp_mb(); // A				smp_wmb(); // C
- *     if (!wq_entry->flags & WQ_FLAG_WOKEN)	wq_entry->flags |= WQ_FLAG_WOKEN;
- *         schedule()				try_to_wake_up();
- *     p->state = TASK_RUNNING;		    ~~~~~~~~~~~~~~~~~~
- *     wq_entry->flags &= ~WQ_FLAG_WOKEN;		condition = true;
- *     smp_mb() // B				smp_wmb(); // C
- *						wq_entry->flags |= WQ_FLAG_WOKEN;
- * }
- * remove_wait_queue(&wq_head, &wait);
+ *     // in wait_woken()			// in woken_wake_function()
  *
+ *     p->state = mode;				wq_entry->flags |= WQ_FLAG_WOKEN;
+ *     smp_mb(); // A				try_to_wake_up():
+ *     if (!(wq_entry->flags & WQ_FLAG_WOKEN))	   <full barrier>
+ *         schedule()				   if (p->state & mode)
+ *     p->state = TASK_RUNNING;			      p->state = TASK_RUNNING;
+ *     wq_entry->flags &= ~WQ_FLAG_WOKEN;	~~~~~~~~~~~~~~~~~~
+ *     smp_mb(); // B				condition = true;
+ * }						smp_mb(); // C
+ * remove_wait_queue(&wq_head, &wait);		wq_entry->flags |= WQ_FLAG_WOKEN;
  */
 long wait_woken(struct wait_queue_entry *wq_entry, unsigned mode, long timeout)
 {
-	set_current_state(mode); /* A */
 	/*
-	 * The above implies an smp_mb(), which matches with the smp_wmb() from
-	 * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
-	 * also observe all state before the wakeup.
+	 * The below executes an smp_mb(), which matches with the full barrier
+	 * executed by the try_to_wake_up() in woken_wake_function() such that
+	 * either we see the store to wq_entry->flags in woken_wake_function()
+	 * or woken_wake_function() sees our store to current->state.
 	 */
+	set_current_state(mode); /* A */
 	if (!(wq_entry->flags & WQ_FLAG_WOKEN) && !is_kthread_should_stop())
 		timeout = schedule_timeout(timeout);
 	__set_current_state(TASK_RUNNING);
 
 	/*
-	 * The below implies an smp_mb(), it too pairs with the smp_wmb() from
-	 * woken_wake_function() such that we must either observe the wait
-	 * condition being true _OR_ WQ_FLAG_WOKEN such that we will not miss
-	 * an event.
+	 * The below executes an smp_mb(), which matches with the smp_mb() (C)
+	 * in woken_wake_function() such that either we see the wait condition
+	 * being true or the store to wq_entry->flags in woken_wake_function()
+	 * follows ours in the coherence order.
 	 */
 	smp_store_mb(wq_entry->flags, wq_entry->flags & ~WQ_FLAG_WOKEN); /* B */
 
@@ -430,14 +431,8 @@ EXPORT_SYMBOL(wait_woken);
 
 int woken_wake_function(struct wait_queue_entry *wq_entry, unsigned mode, int sync, void *key)
 {
-	/*
-	 * Although this function is called under waitqueue lock, LOCK
-	 * doesn't imply write barrier and the users expects write
-	 * barrier semantics on wakeup functions.  The following
-	 * smp_wmb() is equivalent to smp_wmb() in try_to_wake_up()
-	 * and is paired with smp_store_mb() in wait_woken().
-	 */
-	smp_wmb(); /* C */
+	/* Pairs with the smp_store_mb() in wait_woken(). */
+	smp_mb(); /* C */
 	wq_entry->flags |= WQ_FLAG_WOKEN;
 
 	return default_wake_function(wq_entry, mode, sync, key);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
