Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48633342E
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508313; cv=none; b=idMP78JT4HjjsI/1tP57QpFnVZ3/N+K1Qsy4uFnJNryi8XW9HdinN49VA/P8abaPEKR/9/OdT4/W1pCJm0NsZOqgPjxBHCX9ZGNoqtMZDLUE4zuxyc52fBT5oU88oHPqcCtTzAwpy14jPpASpkmj/JzwH/MvAqjulKU3XLhDNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508313; c=relaxed/simple;
	bh=adTlt0tkkFdnEZ08YU12nQvXgqWytFWf92Qe8ZpMJc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/G2NeFGcrt+0Y0qjiuj0r+cZ0sreZbsG9NkhB8qTW3dnBQ6/w+EfXF3/9fnVGAE7WlhCb8m4mJww5Q81CTVwvEa0nQnCzYaduaNGiz/wlWV85olmj63wHbN1Rie6d5zdlESL4QvnqIlrcIikwLIgZN7goHkdj2sH5pexE2pcvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZEoNyvy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZEoNyvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771508311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=803OTrJm0P+6I2jO0xY751zvwyhX5AdrnkhMDcJwgCg=;
	b=PZEoNyvyiakFbB6oyf0Ts9xwNqJVy2bDFCnalsjsgukMPXZmqndB9I6IfeVsOnOtNCni3V
	5EjuEUUgnHbJJqS9AMWwmaT5mD3M+kJKV7X2tlDpmXOOv+krXer1hsl4Y8hv6UBnMkLVwn
	3J9+51oWM8vaol1inA5PBY7L5x4MSg0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-7Mb-JyL2Pg-tM3lAeiMpyg-1; Thu,
 19 Feb 2026 08:38:29 -0500
X-MC-Unique: 7Mb-JyL2Pg-tM3lAeiMpyg-1
X-Mimecast-MFC-AGG-ID: 7Mb-JyL2Pg-tM3lAeiMpyg_1771508307
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C62E18004BB;
	Thu, 19 Feb 2026 13:38:27 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28D301955F01;
	Thu, 19 Feb 2026 13:38:21 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Thu, 19 Feb 2026 14:37:34 +0100
Subject: [PATCH RFC 1/4] sched/deadline: Implement reclaim/soft mode
 through SCHED_OTHER demotion
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-upstream-deadline-demotion-v1-1-528b96e53d12@redhat.com>
References: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
In-Reply-To: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Qais Yousef <qyousef@google.com>, Clark Williams <williams@redhat.com>, 
 Gabriele Monaco <gmonaco@redhat.com>, 
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>, 
 Luca Abeni <luca.abeni@santannapisa.it>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771508294; l=17463;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=adTlt0tkkFdnEZ08YU12nQvXgqWytFWf92Qe8ZpMJc8=;
 b=WUyb3lziCQ9y0IoOjJhOeaSq03L800ujuhyMpH8HDjwv8nuZtRGkGoTPkg6KZkD15M699Flg4
 gHm4GBFkiVtApdwqLqIHdZpJry9eB1Ss/ComgjZbGUJbr3u6uvbxItg
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add support for demoting deadline tasks to SCHED_OTHER when they exhaust
their runtime. This prevents starvation of lower priority tasks while still
allowing deadline tasks to utilize available CPU bandwidth.

This feature resurrects and refines the bandwidth reclaiming concept
from the original SCHED_DEADLINE development (circa 2010), focusing on a
single demotion mode: SCHED_OTHER.

When SCHED_FLAG_DL_DEMOTION is set and a task exhausts its runtime:
- Task is demoted from SCHED_DEADLINE to SCHED_OTHER
- Task continues executing with the nice value from sched_attr.sched_nice
- Cannot starve other SCHED_OTHER tasks (fair sharing)
- Cannot interfere with SCHED_DEADLINE or "SCHED_RT" tasks
- Automatically promoted back to SCHED_DEADLINE at replenishment

The feature is orthogonal to GRUB (SCHED_FLAG_RECLAIM). Tasks can use
GRUB for opportunistic bandwidth reclaiming through accounting, while
being demoted for continued execution as SCHED_OTHER after runtime
exhaustion.

Note that demotion is disabled for DL servers and PI-boosted tasks. Also
demoted tasks cannot migrate (easier bandwidth accounting).

Based on original work by Dario Faggioli:
https://lore.kernel.org/lkml/1288334546.8661.161.camel@Palantir/

Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 include/linux/sched.h            |  10 ++
 include/uapi/linux/sched.h       |   4 +-
 include/uapi/linux/sched/types.h |   8 ++
 kernel/sched/deadline.c          | 213 ++++++++++++++++++++++++++++++++++++++-
 kernel/sched/fair.c              |   8 ++
 kernel/sched/sched.h             |  15 ++-
 kernel/sched/syscalls.c          |   8 ++
 7 files changed, 262 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d834d0190c46f..680c178184260 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -696,6 +696,15 @@ struct sched_dl_entity {
 	 * running, skipping the defer phase.
 	 *
 	 * @dl_defer_idle tracks idle state
+	 *
+	 * @dl_demotion_state tracks the demotion state machine:
+	 *   DL_NOT_DEMOTED (0): Normal SCHED_DEADLINE execution
+	 *   DL_DEMOTING (1): Transition in progress (DL -> NORMAL), skip bw removal
+	 *   DL_DEMOTED (2): Running as SCHED_NORMAL, bandwidth still reserved
+	 *   DL_PROMOTING (3): Transition in progress (NORMAL -> DL), skip bw addition
+	 *
+	 * Demoted tasks cannot migrate (enforced by dl_task_can_migrate()), so
+	 * bandwidth reservation always stays on the current CPU.
 	 */
 	unsigned int			dl_throttled      : 1;
 	unsigned int			dl_yielded        : 1;
@@ -707,6 +716,7 @@ struct sched_dl_entity {
 	unsigned int			dl_defer_armed	  : 1;
 	unsigned int			dl_defer_running  : 1;
 	unsigned int			dl_defer_idle     : 1;
+	unsigned int			dl_demotion_state : 2;
 
 	/*
 	 * Bandwidth enforcement timer. Each -deadline task has its
diff --git a/include/uapi/linux/sched.h b/include/uapi/linux/sched.h
index 359a14cc76a40..aeab67899ed30 100644
--- a/include/uapi/linux/sched.h
+++ b/include/uapi/linux/sched.h
@@ -133,6 +133,7 @@ struct clone_args {
 #define SCHED_FLAG_KEEP_PARAMS		0x10
 #define SCHED_FLAG_UTIL_CLAMP_MIN	0x20
 #define SCHED_FLAG_UTIL_CLAMP_MAX	0x40
+#define SCHED_FLAG_DL_DEMOTION		0x80
 
 #define SCHED_FLAG_KEEP_ALL	(SCHED_FLAG_KEEP_POLICY | \
 				 SCHED_FLAG_KEEP_PARAMS)
@@ -144,6 +145,7 @@ struct clone_args {
 			 SCHED_FLAG_RECLAIM		| \
 			 SCHED_FLAG_DL_OVERRUN		| \
 			 SCHED_FLAG_KEEP_ALL		| \
-			 SCHED_FLAG_UTIL_CLAMP)
+			 SCHED_FLAG_UTIL_CLAMP		| \
+			 SCHED_FLAG_DL_DEMOTION)
 
 #endif /* _UAPI_LINUX_SCHED_H */
diff --git a/include/uapi/linux/sched/types.h b/include/uapi/linux/sched/types.h
index bf6e9ae031c11..ca581b4fa3f93 100644
--- a/include/uapi/linux/sched/types.h
+++ b/include/uapi/linux/sched/types.h
@@ -94,6 +94,14 @@
  * scheduled on a CPU with no more capacity than the specified value.
  *
  * A task utilization boundary can be reset by setting the attribute to -1.
+ *
+ * SCHED_DEADLINE Demotion
+ * ========================
+ *
+ * When a SCHED_DEADLINE task exhausts its runtime and SCHED_FLAG_DL_DEMOTION
+ * is set, the task is demoted to SCHED_OTHER to continue executing at lower
+ * priority. The sched_nice value specifies the nice level when demoted.
+ * The task is automatically promoted back to SCHED_DEADLINE at replenish.
  */
 struct sched_attr {
 	__u32 size;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index d08b004293234..d835945123c16 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1204,6 +1204,9 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
 	return HRTIMER_NORESTART;
 }
 
+static void
+dl_task_promote(struct rq *rq, struct task_struct *p);
+
 /*
  * This is the bandwidth enforcement timer callback. If here, we know
  * a task is not on its dl_rq, since the fact that the timer was running
@@ -1236,7 +1239,7 @@ static enum hrtimer_restart dl_task_timer(struct hrtimer *timer)
 	 * The task might have changed its scheduling policy to something
 	 * different than SCHED_DEADLINE (through switched_from_dl()).
 	 */
-	if (!dl_task(p))
+	if (!dl_task(p) && dl_se->dl_demotion_state == DL_NOT_DEMOTED)
 		goto unlock;
 
 	/*
@@ -1256,6 +1259,27 @@ static enum hrtimer_restart dl_task_timer(struct hrtimer *timer)
 	sched_clock_tick();
 	update_rq_clock(rq);
 
+	/*
+	 * If the task was demoted to SCHED_OTHER, promote it back to
+	 * SCHED_DEADLINE now that it's going to be replenished.
+	 *
+	 * Note: Demoted tasks cannot migrate (enforced by dl_task_can_migrate),
+	 * so bandwidth is guaranteed to still be on this CPU.
+	 */
+	if (dl_se->dl_demotion_state == DL_DEMOTED) {
+		/*
+		 * We're at 0-lag time by definition (replenish). The task went
+		 * to sleep as SCHED_NORMAL, so task_non_contending() was never
+		 * called and running_bw was never removed. Remove it now so that
+		 * when the task wakes up as DEADLINE, the normal enqueue path
+		 * can add it back.
+		 */
+		if (!task_on_rq_queued(p))
+			sub_running_bw(dl_se, &rq->dl);
+
+		dl_task_promote(rq, p);
+	}
+
 	/*
 	 * If the throttle happened during sched-out; like:
 	 *
@@ -1293,6 +1317,7 @@ static enum hrtimer_restart dl_task_timer(struct hrtimer *timer)
 	}
 
 	enqueue_task_dl(rq, p, ENQUEUE_REPLENISH);
+
 	if (dl_task(rq->donor))
 		wakeup_preempt_dl(rq, p, 0);
 	else
@@ -1419,6 +1444,84 @@ s64 dl_scaled_delta_exec(struct rq *rq, struct sched_dl_entity *dl_se, s64 delta
 	return scaled_delta_exec;
 }
 
+/*
+ * Check if a deadline task can be demoted when it exhausts its runtime.
+ * dl-servers and boosted tasks cannot be demoted.
+ *
+ * Returns true if demotion should happen, false otherwise.
+ */
+static inline bool dl_task_can_demote(struct sched_dl_entity *dl_se)
+{
+	if (dl_server(dl_se))
+		return false;
+
+	if (is_dl_boosted(dl_se))
+		return false;
+
+	return !!(dl_se->flags & SCHED_FLAG_DL_DEMOTION);
+}
+
+/*
+ * Promote a demoted task back to SCHED_DEADLINE.
+ * The task's runtime will be replenished by the caller.
+ */
+static void dl_task_promote(struct rq *rq, struct task_struct *p)
+{
+	struct sched_dl_entity *dl_se = &p->dl;
+	int queue_flags = DEQUEUE_MOVE | DEQUEUE_NOCLOCK | DEQUEUE_CLASS;
+
+	lockdep_assert_rq_held(rq);
+
+	if (dl_se->dl_demotion_state != DL_DEMOTED)
+		return;
+
+	dl_se->dl_demotion_state = DL_PROMOTING;
+
+	scoped_guard (sched_change, p, queue_flags) {
+		p->policy = SCHED_DEADLINE;
+		p->sched_class = &dl_sched_class;
+		p->prio = MAX_DL_PRIO - 1;
+		p->normal_prio = p->prio;
+	}
+
+	dl_se->dl_demotion_state = DL_NOT_DEMOTED;
+
+	__balance_callbacks(rq, NULL);
+}
+
+/*
+ * Demote a deadline task to SCHED_OTHER when it exhausts its runtime.
+ * The task will be promoted back to SCHED_DEADLINE at replenish.
+ */
+static void dl_task_demote(struct rq *rq, struct task_struct *p)
+{
+	struct sched_dl_entity *dl_se = &p->dl;
+	int queue_flags = DEQUEUE_MOVE | DEQUEUE_NOCLOCK | DEQUEUE_CLASS;
+
+	lockdep_assert_rq_held(rq);
+
+	if (dl_se->dl_demotion_state != DL_NOT_DEMOTED || !dl_task_can_demote(dl_se))
+		return;
+
+	dl_se->dl_demotion_state = DL_DEMOTING;
+
+	scoped_guard (sched_change, p, queue_flags) {
+		/*
+		 * The task's static_prio is already set from the sched_nice
+		 * value in sched_attr.
+		 */
+		p->policy = SCHED_NORMAL;
+		p->sched_class = &fair_sched_class;
+		p->prio = p->static_prio;
+		p->normal_prio = p->static_prio;
+	}
+
+	dl_se->dl_demotion_state = DL_DEMOTED;
+
+	__balance_callbacks(rq, NULL);
+	resched_curr(rq);
+}
+
 static inline void
 update_stats_dequeue_dl(struct dl_rq *dl_rq, struct sched_dl_entity *dl_se, int flags);
 
@@ -1521,11 +1624,36 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 			dequeue_pushable_dl_task(rq, dl_task_of(dl_se));
 		}
 
+		/*
+		 * Check if we should demote to SCHED_OTHER instead of throttling.
+		 * Demotion only applies to non-dl-server non-pi-boosted tasks
+		 * that have exhausted their runtime (not yielded).
+		 */
+		if (!dl_server(dl_se) && dl_runtime_exceeded(dl_se) &&
+		    dl_task_can_demote(dl_se))
+			dl_task_demote(rq, dl_task_of(dl_se));
+
+		/*
+		 * Start the replenishment timer for both demoted and throttled tasks.
+		 * If boosted or if the timer fails to start, we need to handle it
+		 * immediately to avoid leaving tasks stuck.
+		 */
 		if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
+			/*
+			 * If this was a demoted task, promote it back to SCHED_DEADLINE
+			 * before enqueueing.
+			 */
+			if (dl_se->dl_demotion_state == DL_DEMOTED)
+				dl_task_promote(rq, dl_task_of(dl_se));
+
 			if (dl_server(dl_se)) {
 				replenish_dl_new_period(dl_se, rq);
 				start_dl_timer(dl_se);
 			} else {
+				/*
+				 * For regular tasks (including previously demoted ones),
+				 * enqueue with replenishment.
+				 */
 				enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
 			}
 		}
@@ -3266,8 +3394,17 @@ void dl_clear_root_domain_cpu(int cpu)
 	dl_clear_root_domain(cpu_rq(cpu)->rd);
 }
 
-static void switched_from_dl(struct rq *rq, struct task_struct *p)
+/*
+ * Common cleanup when a task leaves SCHED_DEADLINE.
+ * Handles inactive timer, cpuset tracking, and bandwidth accounting.
+ *
+ * This is used both when a task is explicitly switched away from DEADLINE
+ * and when a demoted task's demotion is cancelled via sched_setattr().
+ */
+static void __dl_cleanup_bandwidth(struct task_struct *p, struct rq *rq)
 {
+	lockdep_assert_rq_held(rq);
+
 	/*
 	 * task_non_contending() can start the "inactive timer" (if the 0-lag
 	 * time is in the future). If the task switches back to dl before
@@ -3304,6 +3441,18 @@ static void switched_from_dl(struct rq *rq, struct task_struct *p)
 	 */
 	if (p->dl.dl_non_contending)
 		p->dl.dl_non_contending = 0;
+}
+
+static void switched_from_dl(struct rq *rq, struct task_struct *p)
+{
+	/*
+	 * If demoting, skip all bandwidth accounting. The bandwidth
+	 * reservation stays in place while the task executes as SCHED_NORMAL.
+	 */
+	if (p->dl.dl_demotion_state == DL_DEMOTING)
+		return;
+
+	__dl_cleanup_bandwidth(p, rq);
 
 	/*
 	 * Since this might be the only -deadline task on the rq,
@@ -3322,6 +3471,16 @@ static void switched_from_dl(struct rq *rq, struct task_struct *p)
  */
 static void switched_to_dl(struct rq *rq, struct task_struct *p)
 {
+	/*
+	 * If promoting from demotion, skip bandwidth/cpuset accounting.
+	 */
+	if (p->dl.dl_demotion_state == DL_PROMOTING) {
+		if (!task_on_rq_queued(p))
+			return;
+
+		goto check_preempt;
+	}
+
 	cancel_inactive_timer(&p->dl);
 
 	/*
@@ -3337,6 +3496,7 @@ static void switched_to_dl(struct rq *rq, struct task_struct *p)
 		return;
 	}
 
+check_preempt:
 	if (rq->donor != p) {
 		if (p->nr_cpus_allowed > 1 && rq->dl.overloaded)
 			deadline_queue_push_tasks(rq);
@@ -3625,6 +3785,47 @@ void __getparam_dl(struct task_struct *p, struct sched_attr *attr)
 	attr->sched_flags |= dl_se->flags;
 }
 
+/*
+ * Check if a task can be migrated from DEADLINE perspective.
+ *
+ * Returns false if the task is a demoted DEADLINE task. Demoted tasks
+ * must stay on their demotion CPU because their bandwidth reservation
+ * is tied to that CPU. Migration will be allowed again after promotion.
+ */
+bool dl_task_can_migrate(struct task_struct *p)
+{
+	return p->dl.dl_demotion_state != DL_DEMOTED;
+}
+
+/*
+ * Cancel demotion for a demoted DEADLINE task when scheduling parameters
+ * are explicitly changed via sched_setattr().
+ *
+ * This performs the same cleanup as switched_from_dl() would do, releasing
+ * bandwidth reservation and clearing all DEADLINE-related state.
+ *
+ * The replenishment timer (dl_timer) is not cancelled - when it fires it will
+ * see the task is not DEADLINE and demotion state is cleared, and return early.
+ */
+void dl_cancel_demotion(struct task_struct *p)
+{
+	struct sched_dl_entity *dl_se = &p->dl;
+	struct rq *rq = task_rq(p);
+
+	lockdep_assert_rq_held(rq);
+
+	if (dl_se->dl_demotion_state != DL_DEMOTED)
+		return;
+
+	/*
+	 * Clear demotion state before cleanup. This allows the replenishment
+	 * timer to safely ignore the task when it fires.
+	 */
+	dl_se->dl_demotion_state = DL_NOT_DEMOTED;
+
+	__dl_cleanup_bandwidth(p, rq);
+}
+
 /*
  * This function validates the new parameters of a -deadline task.
  * We ask for the deadline not being zero, and greater or equal
@@ -3677,6 +3878,14 @@ bool __checkparam_dl(const struct sched_attr *attr)
 	if (period < min || period > max)
 		return false;
 
+	/*
+	 * Validate nice parameter if demotion flag is set.
+	 * The sched_nice value will be used when the task is demoted to SCHED_OTHER.
+	 */
+	if ((attr->sched_flags & SCHED_FLAG_DL_DEMOTION) &&
+	    (attr->sched_nice < MIN_NICE || attr->sched_nice > MAX_NICE))
+		return false;
+
 	return true;
 }
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index c16b5fd71b2d5..59e5459a75492 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9415,6 +9415,14 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	if (p->sched_task_hot)
 		p->sched_task_hot = 0;
 
+	/*
+	 * Demoted DEADLINE tasks cannot migrate. Their bandwidth reservation
+	 * is tied to the demotion CPU and will be released when the task is
+	 * promoted back to DEADLINE or explicitly switched to another policy.
+	 */
+	if (!dl_task_can_migrate(p))
+		return 0;
+
 	/*
 	 * We do not migrate tasks that are:
 	 * 1) delayed dequeued unless we migrate load, or
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a821cc8b2dd8f..6e5e98f3f4755 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -267,6 +267,16 @@ static inline unsigned long sched_weight_to_cgroup(unsigned long weight)
 		       CGROUP_WEIGHT_MIN, CGROUP_WEIGHT_MAX);
 }
 
+/*
+ * Deadline task demotion states
+ */
+enum dl_demotion_state {
+	DL_NOT_DEMOTED = 0,	/* Normal SCHED_DEADLINE execution */
+	DL_DEMOTING,		/* Transitioning DL -> NORMAL, skip bw removal */
+	DL_DEMOTED,		/* Running as SCHED_NORMAL, bw still reserved */
+	DL_PROMOTING,		/* Transitioning NORMAL -> DL, skip bw addition */
+};
+
 /*
  * !! For sched_setattr_nocheck() (kernel) only !!
  *
@@ -281,7 +291,8 @@ static inline unsigned long sched_weight_to_cgroup(unsigned long weight)
  */
 #define SCHED_FLAG_SUGOV	0x10000000
 
-#define SCHED_DL_FLAGS		(SCHED_FLAG_RECLAIM | SCHED_FLAG_DL_OVERRUN | SCHED_FLAG_SUGOV)
+#define SCHED_DL_FLAGS		(SCHED_FLAG_RECLAIM | SCHED_FLAG_DL_OVERRUN | \
+				 SCHED_FLAG_SUGOV | SCHED_FLAG_DL_DEMOTION)
 
 static inline bool dl_entity_is_special(const struct sched_dl_entity *dl_se)
 {
@@ -356,6 +367,8 @@ extern void __setparam_dl(struct task_struct *p, const struct sched_attr *attr);
 extern void __getparam_dl(struct task_struct *p, struct sched_attr *attr);
 extern bool __checkparam_dl(const struct sched_attr *attr);
 extern bool dl_param_changed(struct task_struct *p, const struct sched_attr *attr);
+extern bool dl_task_can_migrate(struct task_struct *p);
+extern void dl_cancel_demotion(struct task_struct *p);
 extern int  dl_cpuset_cpumask_can_shrink(const struct cpumask *cur, const struct cpumask *trial);
 extern int  dl_bw_deactivate(int cpu);
 extern s64 dl_scaled_delta_exec(struct rq *rq, struct sched_dl_entity *dl_se, s64 delta_exec);
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 6f10db3646e7f..87bd4c821d97f 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -248,6 +248,8 @@ static void __setscheduler_params(struct task_struct *p,
 
 	p->policy = policy;
 
+	dl_cancel_demotion(p);
+
 	if (dl_policy(policy))
 		__setparam_dl(p, attr);
 	else if (fair_policy(policy))
@@ -569,6 +571,12 @@ int __sched_setscheduler(struct task_struct *p,
 			goto change;
 		if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP)
 			goto change;
+		/*
+		 * If task is demoted, force through change path to cancel
+		 * demotion even if parameters are unchanged.
+		 */
+		if (p->dl.dl_demotion_state == DL_DEMOTED)
+			goto change;
 
 		p->sched_reset_on_fork = reset_on_fork;
 		retval = 0;

-- 
2.53.0

