Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C577C7EE26
	for <linux-doc@archiver.kernel.org>; Mon, 15 May 2023 02:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238025AbjEOC5i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 14 May 2023 22:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjEOC5e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 14 May 2023 22:57:34 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9BB1BEC
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 19:57:28 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3f392680773so43595911cf.0
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 19:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1684119447; x=1686711447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYmaRuKFkzMj5gjRDsV91RPkHqeO5wpmEeDsuTj5yKM=;
        b=tA+fhkPNslQmwh3JHhLY8rFF3qCZt8NNZQOF/RZUfiMV9y2ZP/tLyqzwAgaC3r4PUB
         GN2ZfPse12OOMyQEsZAM3iZso8OKdlnq+7YyeMIskfFmWJWS9K5dmj327IsLB6V5ViHX
         o9IxD3EAq7wy+/PAKZkWNwsN2h5YLfKvfs7Tzx5leIsbmjFpDRmWDUAHKDUlFxL2xizz
         INstPLtnVfCGe6lXvwe1ikyPt/ts3Cu5upyB49FajXeUF3DOCuTL/qTmkZWkivewaldr
         DdJ/5WDCSZUQOC7NZo26QNIygWAmE3j/4pOrnFJuBf8uK6r9eWtS0zWACLX5No7N5ihH
         Di6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684119447; x=1686711447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYmaRuKFkzMj5gjRDsV91RPkHqeO5wpmEeDsuTj5yKM=;
        b=UIDfSQsX2mDb7FNkAXLhhcQSSQpOnweBdc3ZdUvaoTOUjhpGFLInW+cyjUj9DmoC5v
         JQCRzsEQKxNvcYWk6WzDkNktao+zs6etiPGzljbKAVGV3K/yKob5EOOdPkZ6/0i5U46w
         QX2ZdGnkFxm1ZOWMqIMbUoH7T3MvBL79iU5knlhvszBtxTMrV+GTWi8jdxrHRJO4YvMN
         gaGQtXFENpfLJIpsi5UAEe6cSQVr5ooDAGGvVIUXEiV2OCm4YPWsT/oXMZGmWAz8/ACb
         HArdlkjCui9xdCrvGK3xGPrG0nbAknjLFDchWzFMgFC80VSRaSH0RNiyzevdcCyOGw9s
         tVZw==
X-Gm-Message-State: AC+VfDxqqIOUpv37ryto5gc4XnEn0hrsq1Q+bRFHYRNMOlWqkDFPjcRV
        zBiM90KVVyKAaMpCI3wJFsmqSQ==
X-Google-Smtp-Source: ACHHUZ4hOz2OdPHISWrsejcQ6hbcJ1Fco5dm89GXSD5nQJhKEVw9HRRSUwoO5imiWhUGek5jXfAkLg==
X-Received: by 2002:ac8:5ad5:0:b0:3f5:2eb1:a5d9 with SMTP id d21-20020ac85ad5000000b003f52eb1a5d9mr1820843qtd.63.1684119447185;
        Sun, 14 May 2023 19:57:27 -0700 (PDT)
Received: from vinz16.lan (c-73-143-21-186.hsd1.ma.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id c3-20020a05620a134300b007339c5114a9sm2308994qkl.103.2023.05.14.19.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 19:57:26 -0700 (PDT)
From:   Vineeth Pillai <vineeth@bitbyteword.org>
To:     luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>
Cc:     Vineeth Pillai <vineeth@bitbyteword.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 4/5] sched/deadline: Account for normal deadline tasks in GRUB
Date:   Sun, 14 May 2023 22:57:15 -0400
Message-Id: <20230515025716.316888-5-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515025716.316888-1-vineeth@bitbyteword.org>
References: <20230515025716.316888-1-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

GRUB algorithm assumes that all tasks participate in the reclaim. So
when there is a mix of normal deadline and SCHED_FLAG_RECLAIM tasks,
reclaiming the unused bandwidth is not accurate.

Running two deadline tasks on a cpu where one is SCHED_FLAG_RECLAIM
and other is a normal deadline task, we can see the utilization as
follows:

Task 1(Normal DL): (5, 10), Task 2(SCHED_FLAG_RECLAIM): (1, 10)
TID[673]: RECLAIM=0, (r=5ms, d=10ms, p=10ms), Util: 50.11
TID[672]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 15.93
TID[673]: RECLAIM=0, (r=5ms, d=10ms, p=10ms), Util: 50.01
TID[672]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 15.83

GRUB rule says, runtime is dpreciated as:
 "dq = -(max{u, (Umax - Uinact - Uextra)} / Umax) dt"
  Where Umax is the maximum allowed bandwidth for DL tasks
        Uinact is the inactive utilization for the runqueue
        Uextra is the free bandwidth available for reclaim

To account for a mix of normal deadline and SCHED_RECLAIM_FLAG tasks
running together, we do not consider the bandwidth of normal tasks in
the equation. So the equation becomes:
 "dq = -(max{u, (Umax_reclaim - Uinact - Uextra)} / Umax_reclaim) dt"

"Umax_reclaim" is the maximum allowed bandwidth for SCHED_FLAG_RECLAIM
tasks. When only SCHED_FLAG_RECLAIM tasks are running,
 "Umax_reclaim = Umax". Otherwise:
 "Umax_reclaim = Umax - running_bw + Ureclaim"
  Where Ureclaim is the total bandwidth of SCHED_FLAG_RECLAIM tasks in
        active state for this runqueue.

With this fix, the results of above test is as follows:
Task 1(Normal DL): (5, 10), Task 2(SCHED_FLAG_RECLAIM): (1, 10)
TID[591]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 45.11
TID[592]: RECLAIM=0, (r=5ms, d=10ms, p=10ms), Util: 50.18
TID[591]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 44.99
TID[592]: RECLAIM=0, (r=5ms, d=10ms, p=10ms), Util: 49.88

Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
---
 kernel/sched/deadline.c | 53 ++++++++++++++++++++++++++++++++---------
 kernel/sched/sched.h    | 11 +++++++++
 2 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 67c1138df43a..66a1b9365429 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -206,11 +206,13 @@ __dl_overflow(struct dl_bw *dl_b, unsigned long cap, u64 old_bw, u64 new_bw)
 }
 
 static inline
-void __add_running_bw(u64 dl_bw, struct dl_rq *dl_rq)
+void __add_running_bw(u64 dl_bw, struct dl_rq *dl_rq, bool reclaim_bw_se)
 {
 	u64 old = dl_rq->running_bw;
 
 	lockdep_assert_rq_held(rq_of_dl_rq(dl_rq));
+	if (reclaim_bw_se)
+		dl_rq->reclaim_bw += dl_bw;
 	dl_rq->running_bw += dl_bw;
 	SCHED_WARN_ON(dl_rq->running_bw < old); /* overflow */
 	SCHED_WARN_ON(dl_rq->running_bw > dl_rq->this_bw);
@@ -219,15 +221,19 @@ void __add_running_bw(u64 dl_bw, struct dl_rq *dl_rq)
 }
 
 static inline
-void __sub_running_bw(u64 dl_bw, struct dl_rq *dl_rq)
+void __sub_running_bw(u64 dl_bw, struct dl_rq *dl_rq, bool reclaim_bw_se)
 {
 	u64 old = dl_rq->running_bw;
 
 	lockdep_assert_rq_held(rq_of_dl_rq(dl_rq));
+	if (reclaim_bw_se)
+		dl_rq->reclaim_bw -= dl_bw;
 	dl_rq->running_bw -= dl_bw;
 	SCHED_WARN_ON(dl_rq->running_bw > old); /* underflow */
-	if (dl_rq->running_bw > old)
+	if (dl_rq->running_bw > old) {
+		dl_rq->reclaim_bw = 0;
 		dl_rq->running_bw = 0;
+	}
 	/* kick cpufreq (see the comment in kernel/sched/sched.h). */
 	cpufreq_update_util(rq_of_dl_rq(dl_rq), 0);
 }
@@ -273,14 +279,14 @@ static inline
 void add_running_bw(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 {
 	if (!dl_entity_is_special(dl_se))
-		__add_running_bw(dl_se->dl_bw, dl_rq);
+		__add_running_bw(dl_se->dl_bw, dl_rq, dl_entity_is_reclaim(dl_se));
 }
 
 static inline
 void sub_running_bw(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 {
 	if (!dl_entity_is_special(dl_se))
-		__sub_running_bw(dl_se->dl_bw, dl_rq);
+		__sub_running_bw(dl_se->dl_bw, dl_rq, dl_entity_is_reclaim(dl_se));
 }
 
 static void dl_change_utilization(struct task_struct *p, u64 new_bw)
@@ -499,6 +505,7 @@ void init_dl_rq(struct dl_rq *dl_rq)
 #endif
 
 	dl_rq->running_bw = 0;
+	dl_rq->reclaim_bw = 0;
 	dl_rq->this_bw = 0;
 	init_dl_rq_bw(dl_rq);
 }
@@ -1257,20 +1264,44 @@ int dl_runtime_exceeded(struct sched_dl_entity *dl_se)
  * but only a portion of it denoted by "Umax". So the equation becomes:
  *	"dq = -(max{u, (Umax - Uinact - Uextra)} / Umax) dt",
  *
+ * To account for the fact that we have a mix of normal deadline tasks and
+ * SCHED_RECLAIM_FLAG tasks running together, we do not consider the bandwidth
+ * of normal tasks in the equation. So the equation becomes:
+ *	"dq = -(max{u, (Umax_reclaim - Uinact - Uextra)} / Umax_reclaim) dt",
+ * where
+ *	Umax_reclaim:	Maximum reclaimable bandwidth for this rq.
+ *
+ * We can calculate Umax_reclaim as:
+ *	"Umax_reclaim =	Uextra + Uinact + Ureclaim"
+ * where:
+ *	Ureclaim:	Total bandwidth of SCHED_FLAG_RECLAIM tasks in active
+ *			state for this rq.
+ *
  * Since delta is a 64 bit variable, to have an overflow its value
  * should be larger than 2^(64 - 20 - 8), which is more than 64 seconds.
  * So, overflow is not an issue here.
  */
 static u64 grub_reclaim(u64 delta, struct rq *rq, struct sched_dl_entity *dl_se)
 {
+	u64 u_max_reclaim;
+
+	/*
+	 * In SMP, max_bw can be less than running_bw without violating the global
+	 * bandwidth limits. If thats the case, we should not reclaim.
+	 */
+	if (rq->dl.max_bw < rq->dl.running_bw)
+		return delta;
+
+	u_max_reclaim = rq->dl.max_bw - rq->dl.running_bw + rq->dl.reclaim_bw;
+
 	/*
-	 * max{u, Umax - Uinact - Uextra}
-	 * = max{u, max_bw - (this_bw - running_bw) + (this_bw - running_bw)}
-	 * = max{u, running_bw} = running_bw
-	 * So dq = -(max{u, Umax - Uinact - Uextra} / Umax) dt
-	 *       = -(running_bw / max_bw) dt
+	 * max{u, Umax_reclaim - Uinact - Uextra}
+	 * = max{u, Uextra + Uinact + Ureclaim - Uinact - Uextra}
+	 * = max{u, Ureclaim} = Ureclaim = reclaim_bw
+	 * So dq = -(max{u, Umax_reclaim - Uinact - Uextra} / Umax_reclaim) dt
+	 *       = -(reclaim_bw / Umax_reclaim) dt
 	 */
-	return div64_u64(delta * rq->dl.running_bw, rq->dl.max_bw);
+	return div64_u64(delta * rq->dl.reclaim_bw, u_max_reclaim);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 33db99756624..a6cb891835da 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -257,6 +257,11 @@ static inline bool dl_entity_is_special(const struct sched_dl_entity *dl_se)
 #endif
 }
 
+static inline bool dl_entity_is_reclaim(const struct sched_dl_entity *dl_se)
+{
+	return dl_se->flags & SCHED_FLAG_RECLAIM;
+}
+
 /*
  * Tells if entity @a should preempt entity @b.
  */
@@ -741,6 +746,12 @@ struct dl_rq {
 	 */
 	u64			running_bw;
 
+	/*
+	 * Active bandwidth of SCHED_FLAG_RECLAIM tasks on this rq.
+	 * This will be a subset of running_bw.
+	 */
+	u64			reclaim_bw;
+
 	/*
 	 * Utilization of the tasks "assigned" to this runqueue (including
 	 * the tasks that are in runqueue and the tasks that executed on this
-- 
2.40.1

