Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4D1DA628;
	Mon, 19 Jan 2026 02:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768788177; cv=none; b=NwPZP0YIKRqWtadHbyIm6FjnZMdQJcU/rTiCON3RRQPn7Sb54mkLn+lQQUDoUIrM3oc1qxaDaViiLTJbqETCwX9T2BOLN4d/tCX02rsuqydbJ4/14BAh3BOsB/jn+Ow7QVSIwErGotCnQROu46qBT8vsh/CNsYYMdWdkM0INw7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768788177; c=relaxed/simple;
	bh=nWJUsKZnzi7MByz4gbUbwKyHwcj4kz90o1dR/1vZqkQ=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=tuVY8BvA2lSJ8dKoq6r+ouw+bBwHdqi7sNcpwL0EaobWbbUEWLonsrMZ5uv0DM/JjSoIhp+WbdxpckUWFH0vXz2tTtu8knD0NAAOnI0BKWl0RW694wbwqa8kEQbMEJ747CXJPJ+Np4xNThZrdmjMl1UAzYoiXMtbFy7UyfFd36w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4dvYd31RRVz6FyBt;
	Mon, 19 Jan 2026 10:02:47 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 60J22el9097297;
	Mon, 19 Jan 2026 10:02:40 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 19 Jan 2026 10:02:41 +0800 (CST)
X-Zmail-TransId: 2afa696d90c150c-ba57e
X-Mailer: Zmail v1.0
Message-ID: <20260119100241520gWubW8-5QfhSf9gjqcc_E@zte.com.cn>
Date: Mon, 19 Jan 2026 10:02:41 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>
Cc: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzXSBkZWxheWFjY3Q6IGFkZCB0aW1lc3RhbXAgb2YgZGVsYXkgbWF4?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 60J22el9097297
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Mon, 19 Jan 2026 10:02:47 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 696D90C7.000/4dvYd31RRVz6FyBt

From: Wang Yaxin <wang.yaxin@zte.com.cn>
Problem
=======
Commit 658eb5ab916d ("delayacct: add delay max to record delay peak")
introduced the delay max for getdelays, which records abnormal latency
peaks and helps us understand the magnitude of such delays. However,
the peak latency value alone is insufficient for effective root cause
analysis. Without the precise timestamp of when the peak occurred, we
still lack the critical context needed to correlate it with other
system events.

Solution
========
To address this, we need to additionally record a precise timestamp
when the maximum latency occurs. By correlating this timestamp with
system logs and monitoring metrics, we can identify processes with
abnormal resource usage at the same moment, which can help us to
pinpoint root causes.

Use Case
========
bash-4.4# ./getdelays -d -t 227
print delayacct stats ON
TGID    227
CPU         count     real total  virtual total    delay total  delay average      delay max      delay min      delay max timestamp
               46      188000000      192348334        4098012          0.089ms     0.429260ms     0.051205ms    2026-01-15T15:06:58
IO          count    delay total  delay average      delay max      delay min      delay max timestamp
                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
SWAP        count    delay total  delay average      delay max      delay min      delay max timestamp
                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
RECLAIM     count    delay total  delay average      delay max      delay min      delay max timestamp
                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
THRAS HING   count    delay total  delay average      delay max      delay min      delay max timestamp
                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
COMPACT     count    delay total  delay average      delay max      delay min      delay max timestamp
                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
WPCOPY      count    delay total  delay average      delay max      delay min      delay max timestamp
              182       19413338          0.107ms     0.547353ms     0.022462ms    2026-01-15T15:05:24
IRQ         count    delay total  delay average      delay max      delay min      delay max timestamp
                0              0          0.000ms     0.000000ms     0.000000ms                    N/A

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
v2->v3:
https://lore.kernel.org/all/20260115083739.7b2e8af2bef09f17be217366@linux-foundation.org/
1. Represent timestamps in a more user-friendly way while complying with ISO 8601.
2. Fix the inconsistent whitespace.

 Documentation/accounting/delay-accounting.rst |  32 ++--
 include/linux/delayacct.h                     |   8 +
 include/linux/sched.h                         |   5 +
 include/uapi/linux/taskstats.h                |  22 ++-
 kernel/delayacct.c                            |  31 +++-
 kernel/sched/stats.h                          |   8 +-
 tools/accounting/getdelays.c                  | 172 +++++++++++++++---
 7 files changed, 223 insertions(+), 55 deletions(-)

diff --git a/Documentation/accounting/delay-accounting.rst b/Documentation/accounting/delay-accounting.rst
index 86d7902a657f..e209c46241b0 100644
--- a/Documentation/accounting/delay-accounting.rst
+++ b/Documentation/accounting/delay-accounting.rst
@@ -107,22 +107,22 @@ Get sum and peak of delays, since system boot, for all pids with tgid 242::
 	TGID    242


-	CPU         count     real total  virtual total    delay total  delay average      delay max      delay min
-	               39      156000000      156576579        2111069          0.054ms     0.212296ms     0.031307ms
-	IO          count    delay total  delay average      delay max      delay min
-	                0              0          0.000ms     0.000000ms     0.000000ms
-	SWAP        count    delay total  delay average      delay max      delay min
-	                0              0          0.000ms     0.000000ms     0.000000ms
-	RECLAIM     count    delay total  delay average      delay max      delay min
-	                0              0          0.000ms     0.000000ms     0.000000ms
-	THRASHING   count    delay total  delay average      delay max      delay min
-	                0              0          0.000ms     0.000000ms     0.000000ms
-	COMPACT     count    delay total  delay average      delay max      delay min
-	                0              0          0.000ms     0.000000ms     0.000000ms
-	WPCOPY      count    delay total  delay average      delay max      delay min
-	              156       11215873          0.072ms     0.207403ms     0.033913ms
-	IRQ         count    delay total  delay average      delay max      delay min
-	                0              0          0.000ms     0.000000ms     0.000000ms
+	CPU         count     real total  virtual total    delay total  delay average      delay max      delay min      delay max timestamp
+	               46      188000000      192348334        4098012          0.089ms     0.429260ms     0.051205ms    2026-01-15T15:06:58
+	IO          count    delay total  delay average      delay max      delay min      delay max timestamp
+	                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
+	SWAP        count    delay total  delay average      delay max      delay min      delay max timestamp
+	                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
+	RECLAIM     count    delay total  delay average      delay max      delay min      delay max timestamp
+	                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
+	THRASHING   count    delay total  delay average      delay max      delay min      delay max timestamp
+	                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
+	COMPACT     count    delay total  delay average      delay max      delay min      delay max timestamp
+	                0              0          0.000ms     0.000000ms     0.000000ms                    N/A
+	WPCOPY      count    delay total  delay average      delay max      delay min      delay max timestamp
+	              182       19413338          0.107ms     0.547353ms     0.022462ms    2026-01-15T15:05:24
+	IRQ         count    delay total  delay average      delay max      delay min      delay max timestamp
+	                0              0          0.000ms     0.000000ms     0.000000ms                    N/A

 Get IO accounting for pid 1, it works only with -p::

diff --git a/include/linux/delayacct.h b/include/linux/delayacct.h
index 800dcc360db2..ecb06f16d22c 100644
--- a/include/linux/delayacct.h
+++ b/include/linux/delayacct.h
@@ -69,6 +69,14 @@ struct task_delay_info {
 	u32 compact_count;	/* total count of memory compact */
 	u32 wpcopy_count;	/* total count of write-protect copy */
 	u32 irq_count;	/* total count of IRQ/SOFTIRQ */
+
+	struct timespec64 blkio_delay_max_ts;
+	struct timespec64 swapin_delay_max_ts;
+	struct timespec64 freepages_delay_max_ts;
+	struct timespec64 thrashing_delay_max_ts;
+	struct timespec64 compact_delay_max_ts;
+	struct timespec64 wpcopy_delay_max_ts;
+	struct timespec64 irq_delay_max_ts;
 };
 #endif

diff --git a/include/linux/sched.h b/include/linux/sched.h
index c403f572bac8..c4e9792594b9 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -49,6 +49,7 @@
 #include <linux/tracepoint-defs.h>
 #include <linux/unwind_deferred_types.h>
 #include <asm/kmap_size.h>
+#include <linux/time64.h>
 #ifndef COMPILE_OFFSETS
 #include <generated/rq-offsets.h>
 #endif
@@ -86,6 +87,7 @@ struct signal_struct;
 struct task_delay_info;
 struct task_group;
 struct task_struct;
+struct timespec64;
 struct user_event_mm;

 #include <linux/sched/ext.h>
@@ -435,6 +437,9 @@ struct sched_info {
 	/* When were we last queued to run? */
 	unsigned long long		last_queued;

+	/* Timestamp of max time spent waiting on a runqueue: */
+	struct timespec64		max_run_delay_ts;
+
 #endif /* CONFIG_SCHED_INFO */
 };

diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
index 5929030d4e8b..1b31e8e14d2f 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -18,6 +18,16 @@
 #define _LINUX_TASKSTATS_H

 #include <linux/types.h>
+#ifdef __KERNEL__
+#include <linux/time64.h>
+#else
+#ifndef _LINUX_TIME64_H
+struct timespec64 {
+	__s64   tv_sec;         /* seconds */
+	long    tv_nsec;        /* nanoseconds */
+};
+#endif
+#endif

 /* Format for per-task data returned to userland when
  *	- a task exits
@@ -34,7 +44,7 @@
  */


-#define TASKSTATS_VERSION	16
+#define TASKSTATS_VERSION	17
 #define TS_COMM_LEN		32	/* should be >= TASK_COMM_LEN
 					 * in linux/sched.h */

@@ -230,6 +240,16 @@ struct taskstats {

 	__u64	irq_delay_max;
 	__u64	irq_delay_min;
+
+	/*v17: delay max timestamp record*/
+	struct timespec64 cpu_delay_max_ts;
+	struct timespec64 blkio_delay_max_ts;
+	struct timespec64 swapin_delay_max_ts;
+	struct timespec64 freepages_delay_max_ts;
+	struct timespec64 thrashing_delay_max_ts;
+	struct timespec64 compact_delay_max_ts;
+	struct timespec64 wpcopy_delay_max_ts;
+	struct timespec64 irq_delay_max_ts;
 };


diff --git a/kernel/delayacct.c b/kernel/delayacct.c
index 30e7912ebb0d..d58ffc63bcba 100644
--- a/kernel/delayacct.c
+++ b/kernel/delayacct.c
@@ -18,6 +18,7 @@
 do { \
 	d->type##_delay_max = tsk->delays->type##_delay_max; \
 	d->type##_delay_min = tsk->delays->type##_delay_min; \
+	d->type##_delay_max_ts = tsk->delays->type##_delay_max_ts; \
 	tmp = d->type##_delay_total + tsk->delays->type##_delay; \
 	d->type##_delay_total = (tmp < d->type##_delay_total) ? 0 : tmp; \
 	d->type##_count += tsk->delays->type##_count; \
@@ -104,7 +105,8 @@ void __delayacct_tsk_init(struct task_struct *tsk)
  * Finish delay accounting for a statistic using its timestamps (@start),
  * accumulator (@total) and @count
  */
-static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *count, u64 *max, u64 *min)
+static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *count,
+							 u64 *max, u64 *min, struct timespec64 *ts)
 {
 	s64 ns = local_clock() - *start;
 	unsigned long flags;
@@ -113,8 +115,10 @@ static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *cou
 		raw_spin_lock_irqsave(lock, flags);
 		*total += ns;
 		(*count)++;
-		if (ns > *max)
+		if (ns > *max) {
 			*max = ns;
+			ktime_get_real_ts64(ts);
+		}
 		if (*min == 0 || ns < *min)
 			*min = ns;
 		raw_spin_unlock_irqrestore(lock, flags);
@@ -137,7 +141,8 @@ void __delayacct_blkio_end(struct task_struct *p)
 		      &p->delays->blkio_delay,
 		      &p->delays->blkio_count,
 		      &p->delays->blkio_delay_max,
-		      &p->delays->blkio_delay_min);
+		      &p->delays->blkio_delay_min,
+		      &p->delays->blkio_delay_max_ts);
 }

 int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)
@@ -170,6 +175,7 @@ int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)

 	d->cpu_delay_max = tsk->sched_info.max_run_delay;
 	d->cpu_delay_min = tsk->sched_info.min_run_delay;
+	d->cpu_delay_max_ts = tsk->sched_info.max_run_delay_ts;
 	tmp = (s64)d->cpu_delay_total + t2;
 	d->cpu_delay_total = (tmp < (s64)d->cpu_delay_total) ? 0 : tmp;
 	tmp = (s64)d->cpu_run_virtual_total + t3;
@@ -217,7 +223,8 @@ void __delayacct_freepages_end(void)
 		      &current->delays->freepages_delay,
 		      &current->delays->freepages_count,
 		      &current->delays->freepages_delay_max,
-		      &current->delays->freepages_delay_min);
+		      &current->delays->freepages_delay_min,
+		      &current->delays->freepages_delay_max_ts);
 }

 void __delayacct_thrashing_start(bool *in_thrashing)
@@ -241,7 +248,8 @@ void __delayacct_thrashing_end(bool *in_thrashing)
 		      &current->delays->thrashing_delay,
 		      &current->delays->thrashing_count,
 		      &current->delays->thrashing_delay_max,
-		      &current->delays->thrashing_delay_min);
+		      &current->delays->thrashing_delay_min,
+		      &current->delays->thrashing_delay_max_ts);
 }

 void __delayacct_swapin_start(void)
@@ -256,7 +264,8 @@ void __delayacct_swapin_end(void)
 		      &current->delays->swapin_delay,
 		      &current->delays->swapin_count,
 		      &current->delays->swapin_delay_max,
-		      &current->delays->swapin_delay_min);
+		      &current->delays->swapin_delay_min,
+		      &current->delays->swapin_delay_max_ts);
 }

 void __delayacct_compact_start(void)
@@ -271,7 +280,8 @@ void __delayacct_compact_end(void)
 		      &current->delays->compact_delay,
 		      &current->delays->compact_count,
 		      &current->delays->compact_delay_max,
-		      &current->delays->compact_delay_min);
+		      &current->delays->compact_delay_min,
+		      &current->delays->compact_delay_max_ts);
 }

 void __delayacct_wpcopy_start(void)
@@ -286,7 +296,8 @@ void __delayacct_wpcopy_end(void)
 		      &current->delays->wpcopy_delay,
 		      &current->delays->wpcopy_count,
 		      &current->delays->wpcopy_delay_max,
-		      &current->delays->wpcopy_delay_min);
+		      &current->delays->wpcopy_delay_min,
+		      &current->delays->wpcopy_delay_max_ts);
 }

 void __delayacct_irq(struct task_struct *task, u32 delta)
@@ -296,8 +307,10 @@ void __delayacct_irq(struct task_struct *task, u32 delta)
 	raw_spin_lock_irqsave(&task->delays->lock, flags);
 	task->delays->irq_delay += delta;
 	task->delays->irq_count++;
-	if (delta > task->delays->irq_delay_max)
+	if (delta > task->delays->irq_delay_max) {
 		task->delays->irq_delay_max = delta;
+		ktime_get_real_ts64(&task->delays->irq_delay_max_ts);
+	}
 	if (delta && (!task->delays->irq_delay_min || delta < task->delays->irq_delay_min))
 		task->delays->irq_delay_min = delta;
 	raw_spin_unlock_irqrestore(&task->delays->lock, flags);
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index c903f1a42891..a612cf253c87 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -253,8 +253,10 @@ static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
 	delta = rq_clock(rq) - t->sched_info.last_queued;
 	t->sched_info.last_queued = 0;
 	t->sched_info.run_delay += delta;
-	if (delta > t->sched_info.max_run_delay)
+	if (delta > t->sched_info.max_run_delay) {
 		t->sched_info.max_run_delay = delta;
+		ktime_get_real_ts64(&t->sched_info.max_run_delay_ts);
+	}
 	if (delta && (!t->sched_info.min_run_delay || delta < t->sched_info.min_run_delay))
 		t->sched_info.min_run_delay = delta;
 	rq_sched_info_dequeue(rq, delta);
@@ -278,8 +280,10 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
 	t->sched_info.run_delay += delta;
 	t->sched_info.last_arrival = now;
 	t->sched_info.pcount++;
-	if (delta > t->sched_info.max_run_delay)
+	if (delta > t->sched_info.max_run_delay) {
 		t->sched_info.max_run_delay = delta;
+		ktime_get_real_ts64(&t->sched_info.max_run_delay_ts);
+	}
 	if (delta && (!t->sched_info.min_run_delay || delta < t->sched_info.min_run_delay))
 		t->sched_info.min_run_delay = delta;

diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index 21cb3c3d1331..64796c0223be 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -24,6 +24,7 @@
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <signal.h>
+#include <time.h>

 #include <linux/genetlink.h>
 #include <linux/taskstats.h>
@@ -194,6 +195,37 @@ static int get_family_id(int sd)
 #define average_ms(t, c) (t / 1000000ULL / (c ? c : 1))
 #define delay_ms(t) (t / 1000000ULL)

+/*
+ * Format timespec64 to human readable string (YYYY-MM-DD HH:MM:SS)
+ * Returns formatted string or "N/A" if timestamp is zero
+ */
+static const char *format_timespec64(struct timespec64 *ts)
+{
+	static char buffer[32];
+	struct tm tm_info;
+	time_t time_sec;
+
+	/* Check if timestamp is zero (not set) */
+	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
+		return "N/A";
+
+	time_sec = (time_t)ts->tv_sec;
+
+	/* Use thread-safe localtime_r */
+	if (localtime_r(&time_sec, &tm_info) == NULL)
+		return "N/A";
+
+	snprintf(buffer, sizeof(buffer), "%04d-%02d-%02dT%02d:%02d:%02d",
+		tm_info.tm_year + 1900,
+		tm_info.tm_mon + 1,
+		tm_info.tm_mday,
+		tm_info.tm_hour,
+		tm_info.tm_min,
+		tm_info.tm_sec);
+
+	return buffer;
+}
+
 /*
  * Version compatibility note:
  * Field availability depends on taskstats version (t->version),
@@ -205,13 +237,28 @@ static int get_family_id(int sd)
  * version >= 13  - supports WPCOPY statistics
  * version >= 14  - supports IRQ statistics
  * version >= 16  - supports *_max and *_min delay statistics
+ * version >= 17  - supports delay max timestamp statistics
  *
  * Always verify version before accessing version-dependent fields
  * to maintain backward compatibility.
  */
 #define PRINT_CPU_DELAY(version, t) \
 	do { \
-		if (version >= 16) { \
+		if (version >= 17) { \
+			printf("%-10s%15s%15s%15s%15s%15s%15s%15s%25s\n", \
+				"CPU", "count", "real total", "virtual total", \
+				"delay total", "delay average", "delay max", \
+				"delay min", "delay max timestamp"); \
+			printf("          %15llu%15llu%15llu%15llu%15.3fms%13.6fms%13.6fms%23s\n", \
+				(unsigned long long)(t)->cpu_count, \
+				(unsigned long long)(t)->cpu_run_real_total, \
+				(unsigned long long)(t)->cpu_run_virtual_total, \
+				(unsigned long long)(t)->cpu_delay_total, \
+				average_ms((double)(t)->cpu_delay_total, (t)->cpu_count), \
+				delay_ms((double)(t)->cpu_delay_max), \
+				delay_ms((double)(t)->cpu_delay_min), \
+				format_timespec64(&(t)->cpu_delay_max_ts)); \
+		} else if (version >= 16) { \
 			printf("%-10s%15s%15s%15s%15s%15s%15s%15s\n", \
 				"CPU", "count", "real total", "virtual total", \
 				"delay total", "delay average", "delay max", "delay min"); \
@@ -257,44 +304,115 @@ static int get_family_id(int sd)
 		} \
 	} while (0)

+#define PRINT_FILED_DELAY_WITH_TS(name, version, t, count, total, max, min, max_ts) \
+	do { \
+		if (version >= 17) { \
+			printf("%-10s%15s%15s%15s%15s%15s%25s\n", \
+				name, "count", "delay total", "delay average", \
+				"delay max", "delay min", "delay max timestamp"); \
+			printf("          %15llu%15llu%15.3fms%13.6fms%13.6fms%23s\n", \
+				(unsigned long long)(t)->count, \
+				(unsigned long long)(t)->total, \
+				average_ms((double)(t)->total, (t)->count), \
+				delay_ms((double)(t)->max), \
+				delay_ms((double)(t)->min), \
+				format_timespec64(&(t)->max_ts)); \
+		} else if (version >= 16) { \
+			printf("%-10s%15s%15s%15s%15s%15s\n", \
+				name, "count", "delay total", "delay average", \
+				"delay max", "delay min"); \
+			printf("          %15llu%15llu%15.3fms%13.6fms%13.6fms\n", \
+				(unsigned long long)(t)->count, \
+				(unsigned long long)(t)->total, \
+				average_ms((double)(t)->total, (t)->count), \
+				delay_ms((double)(t)->max), \
+				delay_ms((double)(t)->min)); \
+		} else { \
+			printf("%-10s%15s%15s%15s\n", \
+				name, "count", "delay total", "delay average"); \
+			printf("          %15llu%15llu%15.3fms\n", \
+				(unsigned long long)(t)->count, \
+				(unsigned long long)(t)->total, \
+				average_ms((double)(t)->total, (t)->count)); \
+		} \
+	} while (0)
+
 static void print_delayacct(struct taskstats *t)
 {
 	printf("\n\n");

 	PRINT_CPU_DELAY(t->version, t);

-	PRINT_FILED_DELAY("IO", t->version, t,
-		blkio_count, blkio_delay_total,
-		blkio_delay_max, blkio_delay_min);
+	/* Use new macro with timestamp support for version >= 17 */
+	if (t->version >= 17) {
+		PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
+			blkio_count, blkio_delay_total,
+			blkio_delay_max, blkio_delay_min, blkio_delay_max_ts);

-	PRINT_FILED_DELAY("SWAP", t->version, t,
-		swapin_count, swapin_delay_total,
-		swapin_delay_max, swapin_delay_min);
+		PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
+			swapin_count, swapin_delay_total,
+			swapin_delay_max, swapin_delay_min, swapin_delay_max_ts);

-	PRINT_FILED_DELAY("RECLAIM", t->version, t,
-		freepages_count, freepages_delay_total,
-		freepages_delay_max, freepages_delay_min);
+		PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version, t,
+			freepages_count, freepages_delay_total,
+			freepages_delay_max, freepages_delay_min, freepages_delay_max_ts);

-	PRINT_FILED_DELAY("THRASHING", t->version, t,
-		thrashing_count, thrashing_delay_total,
-		thrashing_delay_max, thrashing_delay_min);
+		PRINT_FILED_DELAY_WITH_TS("THRASHING", t->version, t,
+			thrashing_count, thrashing_delay_total,
+			thrashing_delay_max, thrashing_delay_min, thrashing_delay_max_ts);

-	if (t->version >= 11) {
-		PRINT_FILED_DELAY("COMPACT", t->version, t,
-			compact_count, compact_delay_total,
-			compact_delay_max, compact_delay_min);
-	}
+		if (t->version >= 11) {
+			PRINT_FILED_DELAY_WITH_TS("COMPACT", t->version, t,
+				compact_count, compact_delay_total,
+				compact_delay_max, compact_delay_min, compact_delay_max_ts);
+		}

-	if (t->version >= 13) {
-		PRINT_FILED_DELAY("WPCOPY", t->version, t,
-			wpcopy_count, wpcopy_delay_total,
-			wpcopy_delay_max, wpcopy_delay_min);
-	}
+		if (t->version >= 13) {
+			PRINT_FILED_DELAY_WITH_TS("WPCOPY", t->version, t,
+				wpcopy_count, wpcopy_delay_total,
+				wpcopy_delay_max, wpcopy_delay_min, wpcopy_delay_max_ts);
+		}

-	if (t->version >= 14) {
-		PRINT_FILED_DELAY("IRQ", t->version, t,
-			irq_count, irq_delay_total,
-			irq_delay_max, irq_delay_min);
+		if (t->version >= 14) {
+			PRINT_FILED_DELAY_WITH_TS("IRQ", t->version, t,
+				irq_count, irq_delay_total,
+				irq_delay_max, irq_delay_min, irq_delay_max_ts);
+		}
+	} else {
+		/* Use original macro for older versions */
+		PRINT_FILED_DELAY("IO", t->version, t,
+			blkio_count, blkio_delay_total,
+			blkio_delay_max, blkio_delay_min);
+
+		PRINT_FILED_DELAY("SWAP", t->version, t,
+			swapin_count, swapin_delay_total,
+			swapin_delay_max, swapin_delay_min);
+
+		PRINT_FILED_DELAY("RECLAIM", t->version, t,
+			freepages_count, freepages_delay_total,
+			freepages_delay_max, freepages_delay_min);
+
+		PRINT_FILED_DELAY("THRASHING", t->version, t,
+			thrashing_count, thrashing_delay_total,
+			thrashing_delay_max, thrashing_delay_min);
+
+		if (t->version >= 11) {
+			PRINT_FILED_DELAY("COMPACT", t->version, t,
+				compact_count, compact_delay_total,
+				compact_delay_max, compact_delay_min);
+		}
+
+		if (t->version >= 13) {
+			PRINT_FILED_DELAY("WPCOPY", t->version, t,
+				wpcopy_count, wpcopy_delay_total,
+				wpcopy_delay_max, wpcopy_delay_min);
+		}
+
+		if (t->version >= 14) {
+			PRINT_FILED_DELAY("IRQ", t->version, t,
+				irq_count, irq_delay_total,
+				irq_delay_max, irq_delay_min);
+		}
 	}
 }

-- 
2.25.1
