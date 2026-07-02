Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5118648B375;
	Thu,  2 Jul 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997145; cv=none; b=YW+umUbmQND9Lof/+zaiZV6RZaSXXn1DFIxMFTIps5SOm9+fGxEo62wq44I3X17n/dFJQDWO/FXbUhIJYOrlvx0cFHfUYrmWS0U75M6bJOuLy0LIZVfa3MJ2eQYRBRT47zx6sK1HH13ag2tcBCw0iF2PYsgQbChfi1L9VVMswbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997145; c=relaxed/simple;
	bh=qiHmc85HlW0FfXxOdtgxM5Mq5vVZqnQcKkcrA0/XD4k=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=Bfj6AaOOpIaL4ZRv1hwnYMxDYfRv8ZkSa9um1mM76Q3g+V579BkhnbuNSXGAT/LTYjB8fl0Op9txGMNnEwNjZNesC0NPwQvMYj3nDC3ZLAV3IgYOxQ9TpCUYrU4nWcI6ea6uBcOaDZ75mhQlazfd9wKT2m8u6Bhm6Gv1uAjN16c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4grcQY44Tvz8XrrX;
	Thu, 02 Jul 2026 20:59:01 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 662Cwric064003;
	Thu, 2 Jul 2026 20:58:53 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 2 Jul 2026 20:58:54 +0800 (CST)
X-Zmail-TransId: 2afc6a46608e081-4e150
X-Mailer: Zmail v1.0
Message-ID: <20260702205854461V25Py2xQvLesD8HF_2Rh8@zte.com.cn>
In-Reply-To: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
References: 20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn
Date: Thu, 2 Jul 2026 20:58:54 +0800 (CST)
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
X-MAIL:mse-fl1.zte.com.cn 662Cwric064003
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 02 Jul 2026 20:59:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A466095.001/4grcQY44Tvz8XrrX

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
 tools/accounting/delaytop.c | 84 ++++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 10 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 4410f8add3e4..be28a4b70f70 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -76,14 +76,16 @@
 	offsetof(struct task_info, name##_delay_total), \
 	offsetof(struct task_info, name##_count), \
 	offsetof(struct task_info, name##_delay_max), \
+	offsetof(struct task_info, name##_delay_max_ts), \
 	modes}
 #define SORT_FIELD_NO_MAX(name, cmd, modes) \
 	{#name, #cmd, \
 	offsetof(struct task_info, name##_delay_total), \
 	offsetof(struct task_info, name##_count), \
 	0, \
+	0, \
 	modes}
-#define END_FIELD {NULL, 0, 0, 0, 0, 0}
+#define END_FIELD {NULL, 0, 0, 0, 0, 0, 0}

 /* Display mode types */
 #define MODE_TYPE_ALL	(0xFFFFFFFF)
@@ -117,27 +119,35 @@ struct task_info {
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
@@ -158,6 +168,7 @@ struct field_desc {
 	unsigned long total_offset; /* Offset of total delay in task_info */
 	unsigned long count_offset; /* Offset of count in task_info */
 	unsigned long max_offset;  /* Offset of max delay in task_info */
+	unsigned long max_ts_offset; /* Offset of max delay timestamp in task_info */
 	size_t supported_modes; /* Supported display modes */
 };

@@ -283,7 +294,7 @@ static void usage(void)
 	"  -p, --pid=PID            Monitor only the specified PID\n"
 	"  -C, --container=PATH     Monitor the container at specified cgroup path\n"
 	"  -s, --sort=FIELD         Sort by delay field (default: cpu)\n"
-	"  -t, --type=FIELD         Display only specified delay type with avg/max\n"
+	"  -t, --type=FIELD         Display only specified delay type with avg/max/timestamp\n"
 	"  -M, --memverbose         Display memory detailed information\n");
 	exit(0);
 }
@@ -749,27 +760,35 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
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
+						SET_TASK_STAT(task_count, freepages_delay_max_ts);
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
@@ -827,6 +846,41 @@ static double average_ms(unsigned long long total, unsigned long long count)
 	return (double)total / 1000000.0 / count;
 }

+/*
+ * Format __kernel_timespec to human readable string (YYYY-MM-DDTHH:MM:SS)
+ * Returns formatted string or "N/A" if timestamp is zero
+ */
+static const char *format_timespec64(struct __kernel_timespec *ts)
+{
+	static char buffer[32];
+	time_t time_sec;
+	struct tm tm_info;
+
+	/* Check if timestamp is zero (not set) */
+	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
+		return "N/A";
+
+	/* Avoid Y2038 truncation: check if timestamp fits in time_t on 32-bit platforms */
+	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
+	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
+		return "N/A";
+
+	time_sec = (time_t)ts->tv_sec;
+
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
 /* Comparison function for sorting tasks */
 static int compare_tasks(const void *a, const void *b)
 {
@@ -853,13 +907,15 @@ static int compare_tasks(const void *a, const void *b)

 /* Get delay values for a specific field */
 static void get_field_delay_values(const struct task_info *task, const struct field_desc *field,
-				   double *avg_ms, double *max_ms)
+				   double *avg_ms, double *max_ms,
+				   struct __kernel_timespec *max_ts)
 {
 	unsigned long long total, count, max;

 	if (!field || !field->max_offset) {
 		*avg_ms = 0;
 		*max_ms = 0;
+		memset(max_ts, 0, sizeof(*max_ts));
 		return;
 	}

@@ -869,6 +925,11 @@ static void get_field_delay_values(const struct task_info *task, const struct fi

 	max = *(unsigned long long *)((char *)task + field->max_offset);
 	*max_ms = (double)max / 1000000.0;  /* Convert nanoseconds to milliseconds */
+
+	if (field->max_ts_offset)
+		*max_ts = *(struct __kernel_timespec *)((char *)task + field->max_ts_offset);
+	else
+		memset(max_ts, 0, sizeof(*max_ts));
 }

 /* Sort tasks by selected field */
@@ -1033,11 +1094,12 @@ static void display_results(int psi_ret)
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
@@ -1064,11 +1126,13 @@ static void display_results(int psi_ret)
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
