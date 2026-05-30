Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A529134750D;
	Sat, 30 May 2026 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780111223; cv=none; b=YtwNpnaGPgEvOwdmMUCHz92U6Wy1mcotm0bIX1eqSFAj8RYNr0C5ImRPX3p8T7WK2C1vlFMdQZe8VFwYT0Yz/m3s3p+CkB81aYWONPnvIxg15wnuxoaz28vgoAYsCHAsqSHVgjW2Cy6jAnW7sJR+e5CEA/1N8es4/1MxKMxKRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780111223; c=relaxed/simple;
	bh=Qtp0Ru6vdftY43Q+QVd5MxyrsXV+f5ga2GjZUj+vH/8=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=N8bamamrlAZzYldWne1HYw+6L7dZWnGtNXbjX9OOsMhhPvfUUIs9A1eb2mklbW9g6s+qGXocLFTrrO1RZyoKYk84HhpSC1A7r4dukAOUTNhfpAsaAaIjKoZIAHVUkRZ4tOjRPMEdlgYaBlqJszXtDLOei6eZ4QWnM+PsN8FrtyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gS57y3s2lz8Xrr9;
	Sat, 30 May 2026 11:20:14 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 64U3KBBj018049;
	Sat, 30 May 2026 11:20:11 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 30 May 2026 11:20:12 +0800 (CST)
X-Zmail-TransId: 2afc6a1a576c1a4-c1a07
X-Mailer: Zmail v1.0
Message-ID: <20260530112012440zFFqDEufVtZezQGx8xi2I@zte.com.cn>
In-Reply-To: <20260530111602822agJB6QYfIc2NKfQBK1KYf@zte.com.cn>
References: 20260530111602822agJB6QYfIc2NKfQBK1KYf@zte.com.cn
Date: Sat, 30 May 2026 11:20:12 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <wang.yaxin@zte.com.cn>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDMvM10gZGVsYXl0b3A6IHNvcnQgYnkgbWF4IGRlbGF5IHRvIGhpZ2hsaWdodCB0b3AgbGF0ZW5jeSBwcm9jZXNzZXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 64U3KBBj018049
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 30 May 2026 11:20:14 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1A576E.000/4gS57y3s2lz8Xrr9

From: Wang Yaxin <wang.yaxin@zte.com.cn>

When using -t/--type option, sort tasks by the maximum delay value of
the selected type in descending order (largest delay first).

This enables quickly identifying the top N processes with the highest
delay spikes, which is essential for diagnosing latency problems by
pinpointing which processes contributed most to system delays.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 Documentation/accounting/delay-accounting.rst |  43 ++++++
 tools/accounting/delaytop.c                   | 124 ++++++++++++------
 2 files changed, 126 insertions(+), 41 deletions(-)

diff --git a/Documentation/accounting/delay-accounting.rst b/Documentation/accounting/delay-accounting.rst
index e209c46241b0..b7df13ac0436 100644
--- a/Documentation/accounting/delay-accounting.rst
+++ b/Documentation/accounting/delay-accounting.rst
@@ -212,3 +212,46 @@ Advanced usage examples::

 	# ./delaytop -d secs
 	Specify refresh interval as secs
+
+	# ./delaytop -t type
+	Display only specified delay type with avg/max/timestamp
+    (rows sorted by MAX for that type, largest first)
+
+
+
+delaytop add delay_max fields to track the maximum delay value for each delay type
+(cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy) per task.
+
+	bash# ./delaytop -t cpu
+	System Pressure Information: (avg10/avg60vg300/total)
+	CPU some:       0.4%/   0.2%/   0.1%/     220(ms)
+	CPU full:       0.0%/   0.0%/   0.0%/       0(ms)
+	Memory full:    0.0%/   0.0%/   0.0%/       0(ms)
+	Memory some:    0.0%/   0.0%/   0.0%/       0(ms)
+	IO full:        0.0%/   0.0%/   0.0%/      12(ms)
+	IO some:        0.0%/   0.0%/   0.0%/      13(ms)
+	IRQ full:       0.0%/   0.0%/   0.0%/       0(ms)
+	[o]sort [M]memverbose [q]quit
+	Top 20 processes (sorted by cpu MAX delay, largest first):
+	     PID      TGID  COMMAND          AVG(ms)  MAX(ms)   MAX_TIMESTAMP
+	------------------------------------------------------------------------
+	       9         9  kworker/0:0-eve   0.59   16.87  2026-05-27T13:32:39
+	      30        30  kworker/2:0H-kb   2.87   11.36  2026-05-27T13:32:36
+	      27        27  migration/2       1.05    9.51  2026-05-27T13:32:37
+	      50        50  kworker/2:1-eve   0.50    9.13  2026-05-27T13:32:37
+	      15        15  rcu_preempt       0.11    8.98  2026-05-27T13:32:37
+	       1         1  init              0.17    7.12  2026-05-27T13:32:38
+	      67        67  scsi_eh_0         1.20    4.23  2026-05-27T13:32:37
+	      23        23  ksoftirqd/1       1.12    3.77  2026-05-27T13:32:36
+	       3         3  pool_workqueue_   0.72    3.55  2026-05-27T13:32:38
+	      62        62  kworker/u20:2-a   0.49    3.03  2026-05-27T13:32:37
+	       2         2  kthreadd          0.18    2.82  2026-05-27T13:32:37
+	      11        11  kworker/0:1       1.42    2.76  2026-05-27T13:32:36
+	      39        39  kworker/u20:0-a   0.10    2.71  2026-05-27T13:32:38
+	      17        17  rcu_exp_gp_kthr   0.25    2.65  2026-05-27T13:32:37
+	      66        66  kworker/u20:3-e   0.38    2.55  2026-05-27T13:32:37
+	      20        20  cpuhp/0           0.53    2.51  2026-05-27T13:32:37
+	      28        28  ksoftirqd/2       0.59    2.48  2026-05-27T13:32:37
+	      55        55  kworker/u19:1     0.88    2.42  2026-05-27T13:32:37
+	      13        13  kworker/R-mm_pe   1.18    2.35  2026-05-27T13:32:36
+	      54        54  kworker/3:1-eve   0.14    2.20  2026-05-27T13:32:38
diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 2be975cbc093..9d7102fab09d 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -284,6 +284,7 @@ static void usage(void)
 	"  -C, --container=PATH     Monitor the container at specified cgroup path\n"
 	"  -s, --sort=FIELD         Sort by delay field (default: cpu)\n"
 	"  -t, --type=FIELD         Display only specified delay type with avg/max/timestamp\n"
+	"                           (rows sorted by MAX for that type, largest first)\n"
 	"  -M, --memverbose         Display memory detailed information\n");
 	exit(0);
 }
@@ -822,6 +823,15 @@ static void get_task_delays(void)
 	closedir(dir);
 }

+static void field_delay_max_and_ts(const struct task_info *task,
+				     const struct field_desc *field,
+				     unsigned long long *max_ns,
+				     struct __kernel_timespec *max_ts);
+static void get_field_delay_values(const struct task_info *task,
+				   const struct field_desc *field,
+				   double *avg_ms, double *max_ms,
+				   struct __kernel_timespec *max_ts);
+
 /* Calculate average delay in milliseconds */
 static double average_ms(unsigned long long total, unsigned long long count)
 {
@@ -831,35 +841,39 @@ static double average_ms(unsigned long long total, unsigned long long count)
 }

 /*
- * Format __kernel_timespec to human readable string (YYYY-MM-DD HH:MM:SS)
+ * Format __kernel_timespec to human readable string (YYYY-MM-DDTHH:MM:SS)
  * Returns formatted string or "N/A" if timestamp is zero
  */
-static const char *format_timespec64(struct __kernel_timespec *ts)
+static const char *format_kernel_timespec(struct __kernel_timespec *ts)
 {
 	static char buffer[32];
-	struct tm *tm_info;
+	struct tm tm_info;
+	time_t time_sec;

-	/* Check if timestamp is zero (not set) or invalid (before year 2000) */
-	if ((ts->tv_sec == 0 && ts->tv_nsec == 0) || ts->tv_sec < 946684800) {
-		/* 946684800 is timestamp for 2000-01-01 00:00:00 UTC */
+	/* Check if timestamp is zero (not set) */
+	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
 		return "N/A";
+
+	/* Avoid Y2038 truncation: check if timestamp fits in time_t on 32-bit platforms */
+	if (sizeof(time_sec) < sizeof(ts->tv_sec)) {
+		/* On 32-bit platforms, time_t may be 32-bit; check for overflow */
+		if (ts->tv_sec > (unsigned long long)(time_t)(-1))
+			return "N/A";
 	}

-	/* Check if timestamp is too large for time_t on 32-bit platforms */
-	if (sizeof(time_t) < sizeof(ts->tv_sec) && ts->tv_sec > (time_t)-1)
-		return "N/A";
+	time_sec = (time_t)ts->tv_sec;

-	tm_info = gmtime((const time_t *)&ts->tv_sec);
-	if (!tm_info)
+	/* Use thread-safe localtime_r */
+	if (localtime_r(&time_sec, &tm_info) == NULL)
 		return "N/A";

 	snprintf(buffer, sizeof(buffer), "%04d-%02d-%02dT%02d:%02d:%02d",
-		tm_info->tm_year + 1900,
-		tm_info->tm_mon + 1,
-		tm_info->tm_mday,
-		tm_info->tm_hour,
-		tm_info->tm_min,
-		tm_info->tm_sec);
+		tm_info.tm_year + 1900,
+		tm_info.tm_mon + 1,
+		tm_info.tm_mday,
+		tm_info.tm_hour,
+		tm_info.tm_min,
+		tm_info.tm_sec);

 	return buffer;
 }
@@ -874,6 +888,17 @@ static int compare_tasks(const void *a, const void *b)
 	unsigned long count1;
 	unsigned long count2;
 	double avg1, avg2;
+	unsigned long long max1, max2;
+	struct __kernel_timespec ts_scratch;
+
+	/* -t/--type: default sort by MAX column for the selected type (descending) */
+	if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
+		field_delay_max_and_ts(t1, cfg.type_field, &max1, &ts_scratch);
+		field_delay_max_and_ts(t2, cfg.type_field, &max2, &ts_scratch);
+		if (max1 != max2)
+			return max2 > max1 ? 1 : -1;
+		return 0;
+	}

 	total1 = *(unsigned long long *)((char *)t1 + cfg.sort_field->total_offset);
 	total2 = *(unsigned long long *)((char *)t2 + cfg.sort_field->total_offset);
@@ -888,52 +913,64 @@ static int compare_tasks(const void *a, const void *b)
 	return 0;
 }

-/* Get delay values for a specific field */
-static void get_field_delay_values(const struct task_info *task, const struct field_desc *field,
-				   double *avg_ms, double *max_ms, struct __kernel_timespec *max_ts)
+/* Max delay (ns) and timestamp for field (shared by display and sort) */
+static void field_delay_max_and_ts(const struct task_info *task, const struct field_desc *field,
+				     unsigned long long *max_ns, struct __kernel_timespec *max_ts)
 {
-	unsigned long long total, count, max;
-
 	if (!field) {
-		*avg_ms = 0;
-		*max_ms = 0;
+		*max_ns = 0;
 		memset(max_ts, 0, sizeof(*max_ts));
 		return;
 	}

-	total = *(unsigned long long *)((char *)task + field->total_offset);
-	count = *(unsigned long long *)((char *)task + field->count_offset);
-	*avg_ms = average_ms(total, count);
-
-	/* Get max delay and timestamp based on field name */
 	if (strcmp(field->name, "cpu") == 0) {
-		max = task->cpu_delay_max;
+		*max_ns = task->cpu_delay_max;
 		*max_ts = task->cpu_delay_max_ts;
 	} else if (strcmp(field->name, "blkio") == 0) {
-		max = task->blkio_delay_max;
+		*max_ns = task->blkio_delay_max;
 		*max_ts = task->blkio_delay_max_ts;
 	} else if (strcmp(field->name, "irq") == 0) {
-		max = task->irq_delay_max;
+		*max_ns = task->irq_delay_max;
 		*max_ts = task->irq_delay_max_ts;
 	} else if (strcmp(field->name, "swapin") == 0) {
-		max = task->swapin_delay_max;
+		*max_ns = task->swapin_delay_max;
 		*max_ts = task->swapin_delay_max_ts;
 	} else if (strcmp(field->name, "freepages") == 0) {
-		max = task->freepages_delay_max;
+		*max_ns = task->freepages_delay_max;
 		*max_ts = task->freepages_delay_max_ts;
 	} else if (strcmp(field->name, "thrashing") == 0) {
-		max = task->thrashing_delay_max;
+		*max_ns = task->thrashing_delay_max;
 		*max_ts = task->thrashing_delay_max_ts;
 	} else if (strcmp(field->name, "compact") == 0) {
-		max = task->compact_delay_max;
+		*max_ns = task->compact_delay_max;
 		*max_ts = task->compact_delay_max_ts;
 	} else if (strcmp(field->name, "wpcopy") == 0) {
-		max = task->wpcopy_delay_max;
+		*max_ns = task->wpcopy_delay_max;
 		*max_ts = task->wpcopy_delay_max_ts;
 	} else {
-		max = 0;
+		*max_ns = 0;
 		memset(max_ts, 0, sizeof(*max_ts));
 	}
+}
+
+/* Get delay values for a specific field */
+static void get_field_delay_values(const struct task_info *task, const struct field_desc *field,
+				   double *avg_ms, double *max_ms, struct __kernel_timespec *max_ts)
+{
+	unsigned long long total, count, max;
+
+	if (!field) {
+		*avg_ms = 0;
+		*max_ms = 0;
+		memset(max_ts, 0, sizeof(*max_ts));
+		return;
+	}
+
+	total = *(unsigned long long *)((char *)task + field->total_offset);
+	count = *(unsigned long long *)((char *)task + field->count_offset);
+	*avg_ms = average_ms(total, count);
+
+	field_delay_max_and_ts(task, field, &max, max_ts);
 	*max_ms = (double)max / 1000000.0;  /* Convert nanoseconds to milliseconds */
 }

@@ -1090,8 +1127,13 @@ static void display_results(int psi_ret)
 	}

 	/* Task delay output */
-	suc &= BOOL_FPRINT(out, "Top %d processes (sorted by %s delay):\n",
-			cfg.max_processes, get_name_by_field(cfg.sort_field));
+	if (cfg.display_mode == MODE_TYPE && cfg.type_field)
+		suc &= BOOL_FPRINT(out,
+			"Top %d processes (sorted by %s MAX delay, largest first):\n",
+			cfg.max_processes, get_name_by_field(cfg.type_field));
+	else
+		suc &= BOOL_FPRINT(out, "Top %d processes (sorted by %s delay):\n",
+				cfg.max_processes, get_name_by_field(cfg.sort_field));

 	if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
 		/* Display mode for -t option: show only specified type with avg/max/timestamp */
@@ -1132,7 +1174,7 @@ static void display_results(int psi_ret)
 					&max_ms, &max_ts);

 			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
-				avg_ms, max_ms, format_timespec64(&max_ts));
+				avg_ms, max_ms, format_kernel_timespec(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
 				TASK_AVG(tasks[i], mem),
-- 
2.25.1
