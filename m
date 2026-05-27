Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34D2405C4B;
	Wed, 27 May 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890304; cv=none; b=bLVm28/7NJ3Pp1gYLYvHECOO5E1cnZvwye5yxL5xM+1QLOBKiA25p15OA66HYErIe4so0vmUhUog9CDSiyyFUg79bLQD1pl4E4WNzVdsI6mzZsMO6mfpNVp2Gms7D4l9R49S2ByoQ5pwMxGSI574bvOXrxNcqlh6aaZNTs3Y5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890304; c=relaxed/simple;
	bh=iES3RcXaqZfqaLoKOHgqDIEEkFJrbLXua3dimhv5qM8=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=ATxIIqKyiKSXDd+ZjnkfYO0hFhPvLtWcFUTMm7gIF/OILrAR9Sni+ReFFPOGwuY/nU47comJYPtD8J/csFvvpmGNpVIRiAwUVeMLWYOoXYkZEaEHNUb8sBHxRktlSeqHPqjP0JSD1JeLPjK6F8g8QBLey2VL+MVdEgTYwMR/isk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gQWRW3Vc9z4xNtb;
	Wed, 27 May 2026 21:58:15 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 64RDwBl1078073;
	Wed, 27 May 2026 21:58:11 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 27 May 2026 21:58:14 +0800 (CST)
X-Zmail-TransId: 2afa6a16f876663-09e70
X-Mailer: Zmail v1.0
Message-ID: <20260527215814502VwuWtGwZ2XR5lVE-Bny0H@zte.com.cn>
In-Reply-To: <20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn>
References: 20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn
Date: Wed, 27 May 2026 21:58:14 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDIvM10gZGVsYXl0b3A6IGFkZCB0aW1lc3RhbXAgb2YgZGVsYXkgbWF4?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 64RDwBl1078073
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 27 May 2026 21:58:15 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A16F877.000/4gQWRW3Vc9z4xNtb

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Record the wall-clock timestamp when each maximum delay occurred for
all delay types. The timestamp is displayed in the MAX_TIMESTAMP column
when using -t/--type option.

This enables:
- Identifying the time when a process experienced an abnormal delay spike
- Correlating delay peaks across multiple processes at the same timestamp
- Cross-referencing with system logs, traces, or other metrics at that time
- Pinpointing the root cause of latency issues by finding concurrent events

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/accounting/delaytop.c | 100 ++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 20 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 586294b29834..8d22c43dceed 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -110,27 +110,35 @@ struct task_info {
 	unsigned long long cpu_count;
 	unsigned long long cpu_delay_total;
 	unsigned long long cpu_delay_max;
+	struct __kernel_timespec cpu_delay_max_ts;
 	unsigned long long blkio_count;
 	unsigned long long blkio_delay_total;
 	unsigned long long blkio_delay_max;
+	struct __kernel_timespec blkio_delay_max_ts;
 	unsigned long long swapin_count;
 	unsigned long long swapin_delay_total;
 	unsigned long long swapin_delay_max;
+	struct __kernel_timespec swapin_delay_max_ts;
 	unsigned long long freepages_count;
 	unsigned long long freepages_delay_total;
 	unsigned long long freepages_delay_max;
+	struct __kernel_timespec freepages_delay_max_ts;
 	unsigned long long thrashing_count;
 	unsigned long long thrashing_delay_total;
 	unsigned long long thrashing_delay_max;
+	struct __kernel_timespec thrashing_delay_max_ts;
 	unsigned long long compact_count;
 	unsigned long long compact_delay_total;
 	unsigned long long compact_delay_max;
+	struct __kernel_timespec compact_delay_max_ts;
 	unsigned long long wpcopy_count;
 	unsigned long long wpcopy_delay_total;
 	unsigned long long wpcopy_delay_max;
+	struct __kernel_timespec wpcopy_delay_max_ts;
 	unsigned long long irq_count;
 	unsigned long long irq_delay_total;
 	unsigned long long irq_delay_max;
+	struct __kernel_timespec irq_delay_max_ts;
 	unsigned long long mem_count;
 	unsigned long long mem_delay_total;
 };
@@ -275,7 +283,7 @@ static void usage(void)
 	"  -p, --pid=PID            Monitor only the specified PID\n"
 	"  -C, --container=PATH     Monitor the container at specified cgroup path\n"
 	"  -s, --sort=FIELD         Sort by delay field (default: cpu)\n"
-	"  -t, --type=FIELD         Display only specified delay type with avg/max\n"
+	"  -t, --type=FIELD         Display only specified delay type with avg/max/timestamp\n"
 	"  -M, --memverbose         Display memory detailed information\n");
 	exit(0);
 }
@@ -730,27 +738,34 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
 						SET_TASK_STAT(task_count, cpu_count);
 						SET_TASK_STAT(task_count, cpu_delay_total);
 						SET_TASK_STAT(task_count, cpu_delay_max);
+						SET_TASK_STAT(task_count, cpu_delay_max_ts);
 						SET_TASK_STAT(task_count, blkio_count);
 						SET_TASK_STAT(task_count, blkio_delay_total);
 						SET_TASK_STAT(task_count, blkio_delay_max);
+						SET_TASK_STAT(task_count, blkio_delay_max_ts);
 						SET_TASK_STAT(task_count, swapin_count);
 						SET_TASK_STAT(task_count, swapin_delay_total);
 						SET_TASK_STAT(task_count, swapin_delay_max);
+						SET_TASK_STAT(task_count, swapin_delay_max_ts);
 						SET_TASK_STAT(task_count, freepages_count);
 						SET_TASK_STAT(task_count, freepages_delay_total);
 						SET_TASK_STAT(task_count, freepages_delay_max);
 						SET_TASK_STAT(task_count, thrashing_count);
 						SET_TASK_STAT(task_count, thrashing_delay_total);
 						SET_TASK_STAT(task_count, thrashing_delay_max);
+						SET_TASK_STAT(task_count, thrashing_delay_max_ts);
 						SET_TASK_STAT(task_count, compact_count);
 						SET_TASK_STAT(task_count, compact_delay_total);
 						SET_TASK_STAT(task_count, compact_delay_max);
+						SET_TASK_STAT(task_count, compact_delay_max_ts);
 						SET_TASK_STAT(task_count, wpcopy_count);
 						SET_TASK_STAT(task_count, wpcopy_delay_total);
 						SET_TASK_STAT(task_count, wpcopy_delay_max);
+						SET_TASK_STAT(task_count, wpcopy_delay_max_ts);
 						SET_TASK_STAT(task_count, irq_count);
 						SET_TASK_STAT(task_count, irq_delay_total);
 						SET_TASK_STAT(task_count, irq_delay_max);
+						SET_TASK_STAT(task_count, irq_delay_max_ts);
 						set_mem_count(&tasks[task_count]);
 						set_mem_delay_total(&tasks[task_count]);
 						task_count++;
@@ -808,6 +823,38 @@ static double average_ms(unsigned long long total, unsigned long long count)
 	return (double)total / 1000000.0 / count;
 }

+/*
+ * Format __kernel_timespec to human readable string (YYYY-MM-DD HH:MM:SS)
+ * Returns formatted string or "N/A" if timestamp is zero
+ */
+static const char *format_timespec64(struct __kernel_timespec *ts)
+{
+	static char buffer[32];
+	struct tm *tm_info;
+	time_t time_sec;
+
+	/* Check if timestamp is zero (not set) or invalid (before year 2000) */
+	if ((ts->tv_sec == 0 && ts->tv_nsec == 0) || ts->tv_sec < 946684800) {
+		/* 946684800 is timestamp for 2000-01-01 00:00:00 UTC */
+		return "N/A";
+	}
+
+	time_sec = (time_t)ts->tv_sec;
+	tm_info = localtime(&time_sec);
+	if (!tm_info)
+		return "N/A";
+
+	snprintf(buffer, sizeof(buffer), "%04d-%02d-%02d %02d:%02d:%02d",
+		tm_info->tm_year + 1900,
+		tm_info->tm_mon + 1,
+		tm_info->tm_mday,
+		tm_info->tm_hour,
+		tm_info->tm_min,
+		tm_info->tm_sec);
+
+	return buffer;
+}
+
 /* Comparison function for sorting tasks */
 static int compare_tasks(const void *a, const void *b)
 {
@@ -834,13 +881,14 @@ static int compare_tasks(const void *a, const void *b)

 /* Get delay values for a specific field */
 static void get_field_delay_values(const struct task_info *task, const struct field_desc *field,
-				   double *avg_ms, double *max_ms)
+				   double *avg_ms, double *max_ms, struct __kernel_timespec *max_ts)
 {
 	unsigned long long total, count, max;

 	if (!field) {
 		*avg_ms = 0;
 		*max_ms = 0;
+		memset(max_ts, 0, sizeof(*max_ts));
 		return;
 	}

@@ -848,26 +896,35 @@ static void get_field_delay_values(const struct task_info *task, const struct fi
 	count = *(unsigned long *)((char *)task + field->count_offset);
 	*avg_ms = average_ms(total, count);

-	/* Get max delay based on field name */
-	if (strcmp(field->name, "cpu") == 0)
+	/* Get max delay and timestamp based on field name */
+	if (strcmp(field->name, "cpu") == 0) {
 		max = task->cpu_delay_max;
-	else if (strcmp(field->name, "blkio") == 0)
+		*max_ts = task->cpu_delay_max_ts;
+	} else if (strcmp(field->name, "blkio") == 0) {
 		max = task->blkio_delay_max;
-	else if (strcmp(field->name, "irq") == 0)
+		*max_ts = task->blkio_delay_max_ts;
+	} else if (strcmp(field->name, "irq") == 0) {
 		max = task->irq_delay_max;
-	else if (strcmp(field->name, "swapin") == 0)
+		*max_ts = task->irq_delay_max_ts;
+	} else if (strcmp(field->name, "swapin") == 0) {
 		max = task->swapin_delay_max;
-	else if (strcmp(field->name, "freepages") == 0)
+		*max_ts = task->swapin_delay_max_ts;
+	} else if (strcmp(field->name, "freepages") == 0) {
 		max = task->freepages_delay_max;
-	else if (strcmp(field->name, "thrashing") == 0)
+		*max_ts = task->freepages_delay_max_ts;
+	} else if (strcmp(field->name, "thrashing") == 0) {
 		max = task->thrashing_delay_max;
-	else if (strcmp(field->name, "compact") == 0)
+		*max_ts = task->thrashing_delay_max_ts;
+	} else if (strcmp(field->name, "compact") == 0) {
 		max = task->compact_delay_max;
-	else if (strcmp(field->name, "wpcopy") == 0)
+		*max_ts = task->compact_delay_max_ts;
+	} else if (strcmp(field->name, "wpcopy") == 0) {
 		max = task->wpcopy_delay_max;
-	else
+		*max_ts = task->wpcopy_delay_max_ts;
+	} else {
 		max = 0;
-
+		memset(max_ts, 0, sizeof(*max_ts));
+	}
 	*max_ms = (double)max / 1000000.0;  /* Convert nanoseconds to milliseconds */
 }

@@ -1028,11 +1085,12 @@ static void display_results(int psi_ret)
 			cfg.max_processes, get_name_by_field(cfg.sort_field));

 	if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
-		/* Display mode for -t option: show only specified type with avg/max */
-		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s %12s %12s\n",
+		/* Display mode for -t option: show only specified type with avg/max/timestamp */
+		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s %12s %12s %20s\n",
 			"PID", "TGID", "COMMAND",
-			"AVG(ms)", "MAX(ms)");
-		suc &= BOOL_FPRINT(out, "----------------------------------------------------\n");
+			"AVG(ms)", "MAX(ms)", "MAX_TIMESTAMP");
+		suc &= BOOL_FPRINT(out, "--------------------------------------------------------");
+		suc &= BOOL_FPRINT(out, "----------------------------------------\n");
 	} else {
 		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s", "PID", "TGID", "COMMAND");
 		if (cfg.display_mode == MODE_MEMVERBOSE) {
@@ -1059,11 +1117,13 @@ static void display_results(int psi_ret)
 			tasks[i].pid, tasks[i].tgid, tasks[i].command);
 		if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
 			double avg_ms, max_ms;
+			struct __kernel_timespec max_ts;

-			get_field_delay_values(&tasks[i], cfg.type_field, &avg_ms, &max_ms);
+			get_field_delay_values(&tasks[i], cfg.type_field, &avg_ms,
+					&max_ms, &max_ts);

-			suc &= BOOL_FPRINT(out, "%12.2f %12.2f\n",
-				avg_ms, max_ms);
+			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
+				avg_ms, max_ms, format_timespec64(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
 				TASK_AVG(tasks[i], mem),
-- 
2.25.1
