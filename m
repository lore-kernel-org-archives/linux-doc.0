Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A11427A;
	Wed, 27 May 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890238; cv=none; b=UnBy/ztO8AbPvEtY0C/JLp3CQaG4gxixTfPjsQUnjXT73LhWB0RyDlreNFyJIePBPEtOWStao6y06APVcRmA9XfqmCxrYTntSry6t2Ll6VRL+WfYciMPDOogiRhUmxode7nvGPGw2IczSrN8eaprLL6kZUpd5UQYGnygJasq/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890238; c=relaxed/simple;
	bh=m5frYJINE1pm5HkcP1tMMQCNVTrtT++q4aqWT1Fd2ew=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=mKDbMEqnlRr3saAnUldEULYb15UNPlNyms0IiKqchSy7DuwK0zH6coLgtXubGihpHdXSM5oqxS5oNJ35UQjkE/pxE+bNl1RA6Iex846DM8Prj1sH5tX0e5duKMYfDm2q7s4Whyg6IwpkMgOAyKHwZKXevOPFl0225wsxKw976YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gQWQF3gX9z4xNtb;
	Wed, 27 May 2026 21:57:09 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 64RDv7fD077420;
	Wed, 27 May 2026 21:57:07 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 27 May 2026 21:57:08 +0800 (CST)
X-Zmail-TransId: 2afb6a16f834260-ffa76
X-Mailer: Zmail v1.0
Message-ID: <20260527215708727RJd3QW4iKNdhZHGNE-ZQ2@zte.com.cn>
In-Reply-To: <20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn>
References: 20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn
Date: Wed, 27 May 2026 21:57:08 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDEvM10gZGVsYXl0b3A6IGFkZCBkZWxheSBtYXggZm9yIGRlbGF5dG9w?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 64RDv7fD077420
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 27 May 2026 21:57:09 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A16F835.000/4gQWQF3gX9z4xNtb

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Previously delaytop only showed average delays. Add delay_max fields to
track the maximum delay value for each delay type (cpu, blkio, irq, swapin,
freepages, thrashing, compact, wpcopy) per task.

This provides a global view of all tasks' delay spikes, which is essential
for identifying processes that experienced brief but significant latency
events that would be hidden by average-only metrics.

The -t/--type option displays only the specified delay type with avg/max
values side by side, allowing focused analysis:
  delaytop -t cpu    # Show only CPU delay with avg/max
  delaytop -t wpcopy    # Show Copy-on-Write delay with avg/max

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/accounting/delaytop.c | 142 +++++++++++++++++++++++++++++-------
 1 file changed, 117 insertions(+), 25 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 72cc500b44b1..586294b29834 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -82,6 +82,7 @@
 #define MODE_TYPE_ALL	(0xFFFFFFFF)
 #define MODE_DEFAULT	(1 << 0)
 #define MODE_MEMVERBOSE	(1 << 1)
+#define MODE_TYPE	(1 << 2)	/* Display specific type with avg/max */

 /* PSI statistics structure */
 struct psi_stats {
@@ -108,20 +109,28 @@ struct task_info {
 	char command[TASK_COMM_LEN];
 	unsigned long long cpu_count;
 	unsigned long long cpu_delay_total;
+	unsigned long long cpu_delay_max;
 	unsigned long long blkio_count;
 	unsigned long long blkio_delay_total;
+	unsigned long long blkio_delay_max;
 	unsigned long long swapin_count;
 	unsigned long long swapin_delay_total;
+	unsigned long long swapin_delay_max;
 	unsigned long long freepages_count;
 	unsigned long long freepages_delay_total;
+	unsigned long long freepages_delay_max;
 	unsigned long long thrashing_count;
 	unsigned long long thrashing_delay_total;
+	unsigned long long thrashing_delay_max;
 	unsigned long long compact_count;
 	unsigned long long compact_delay_total;
+	unsigned long long compact_delay_max;
 	unsigned long long wpcopy_count;
 	unsigned long long wpcopy_delay_total;
+	unsigned long long wpcopy_delay_max;
 	unsigned long long irq_count;
 	unsigned long long irq_delay_total;
+	unsigned long long irq_delay_max;
 	unsigned long long mem_count;
 	unsigned long long mem_delay_total;
 };
@@ -153,6 +162,7 @@ struct config {
 	int monitor_pid;		/* Monitor specific PID */
 	char *container_path;	/* Path to container cgroup */
 	const struct field_desc *sort_field;	/* Current sort field */
+	const struct field_desc *type_field;	/* Type field for -t option */
 	size_t display_mode;	/* Current display mode */
 };

@@ -164,15 +174,15 @@ static int task_count;
 static int running = 1;
 static struct container_stats container_stats;
 static const struct field_desc sort_fields[] = {
-	SORT_FIELD(cpu,		c,	MODE_DEFAULT),
-	SORT_FIELD(blkio,	i,	MODE_DEFAULT),
-	SORT_FIELD(irq,		q,	MODE_DEFAULT),
+	SORT_FIELD(cpu,		c,	MODE_DEFAULT | MODE_TYPE),
+	SORT_FIELD(blkio,	i,	MODE_DEFAULT | MODE_TYPE),
+	SORT_FIELD(irq,		q,	MODE_DEFAULT | MODE_TYPE),
 	SORT_FIELD(mem,		m,	MODE_DEFAULT | MODE_MEMVERBOSE),
-	SORT_FIELD(swapin,	s,	MODE_MEMVERBOSE),
-	SORT_FIELD(freepages,	r,	MODE_MEMVERBOSE),
-	SORT_FIELD(thrashing,	t,	MODE_MEMVERBOSE),
-	SORT_FIELD(compact,	p,	MODE_MEMVERBOSE),
-	SORT_FIELD(wpcopy,	w,	MODE_MEMVERBOSE),
+	SORT_FIELD(swapin,	s,	MODE_MEMVERBOSE | MODE_TYPE),
+	SORT_FIELD(freepages,	r,	MODE_MEMVERBOSE | MODE_TYPE),
+	SORT_FIELD(thrashing,	t,	MODE_MEMVERBOSE | MODE_TYPE),
+	SORT_FIELD(compact,	p,	MODE_MEMVERBOSE | MODE_TYPE),
+	SORT_FIELD(wpcopy,	w,	MODE_MEMVERBOSE | MODE_TYPE),
 	END_FIELD
 };
 static int sort_selected;
@@ -218,7 +228,7 @@ static const struct field_desc *get_field_by_name(const char *name)

 	for (field = sort_fields; field->name != NULL; field++) {
 		field_len = strlen(field->name);
-		if (field_len != strlen(name))
+		if (field_len != strlen(name) || !(field->supported_modes & MODE_TYPE))
 			continue;
 		if (strncmp(field->name, name, field_len) == 0)
 			return field;
@@ -265,6 +275,7 @@ static void usage(void)
 	"  -p, --pid=PID            Monitor only the specified PID\n"
 	"  -C, --container=PATH     Monitor the container at specified cgroup path\n"
 	"  -s, --sort=FIELD         Sort by delay field (default: cpu)\n"
+	"  -t, --type=FIELD         Display only specified delay type with avg/max\n"
 	"  -M, --memverbose         Display memory detailed information\n");
 	exit(0);
 }
@@ -283,6 +294,7 @@ static void parse_args(int argc, char **argv)
 		{"processes", required_argument, 0, 'P'},
 		{"sort", required_argument, 0, 's'},
 		{"container", required_argument, 0, 'C'},
+		{"type", required_argument, 0, 't'},
 		{"memverbose", no_argument, 0, 'M'},
 		{0, 0, 0, 0}
 	};
@@ -292,6 +304,7 @@ static void parse_args(int argc, char **argv)
 	cfg.iterations = 0;
 	cfg.max_processes = 20;
 	cfg.sort_field = &sort_fields[0];	/* Default sorted by CPU delay */
+	cfg.type_field = NULL;				/* No type field by default */
 	cfg.output_one_time = 0;
 	cfg.monitor_pid = 0;	/* 0 means monitor all PIDs */
 	cfg.container_path = NULL;
@@ -300,7 +313,7 @@ static void parse_args(int argc, char **argv)
 	while (1) {
 		int option_index = 0;

-		c = getopt_long(argc, argv, "hd:n:p:oP:C:s:M", long_options, &option_index);
+		c = getopt_long(argc, argv, "hd:n:p:oP:C:s:t:M", long_options, &option_index);
 		if (c == -1)
 			break;

@@ -363,6 +376,23 @@ static void parse_args(int argc, char **argv)

 			cfg.sort_field = field;
 			break;
+		case 't':
+			if (strlen(optarg) == 0) {
+				fprintf(stderr, "Error: empty type field\n");
+				exit(1);
+			}
+
+			field = get_field_by_name(optarg);
+			/* Show available fields if invalid option provided */
+			if (!field) {
+				fprintf(stderr, "Error: invalid type field '%s'\n", optarg);
+				display_available_fields(MODE_TYPE);
+				exit(1);
+			}
+
+			cfg.type_field = field;
+			cfg.display_mode = MODE_TYPE;
+			break;
 		case 'M':
 			cfg.display_mode = MODE_MEMVERBOSE;
 			cfg.sort_field = get_field_by_name("mem");
@@ -699,20 +729,28 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
 						tasks[task_count].command[TASK_COMM_LEN - 1] = '\0';
 						SET_TASK_STAT(task_count, cpu_count);
 						SET_TASK_STAT(task_count, cpu_delay_total);
+						SET_TASK_STAT(task_count, cpu_delay_max);
 						SET_TASK_STAT(task_count, blkio_count);
 						SET_TASK_STAT(task_count, blkio_delay_total);
+						SET_TASK_STAT(task_count, blkio_delay_max);
 						SET_TASK_STAT(task_count, swapin_count);
 						SET_TASK_STAT(task_count, swapin_delay_total);
+						SET_TASK_STAT(task_count, swapin_delay_max);
 						SET_TASK_STAT(task_count, freepages_count);
 						SET_TASK_STAT(task_count, freepages_delay_total);
+						SET_TASK_STAT(task_count, freepages_delay_max);
 						SET_TASK_STAT(task_count, thrashing_count);
 						SET_TASK_STAT(task_count, thrashing_delay_total);
+						SET_TASK_STAT(task_count, thrashing_delay_max);
 						SET_TASK_STAT(task_count, compact_count);
 						SET_TASK_STAT(task_count, compact_delay_total);
+						SET_TASK_STAT(task_count, compact_delay_max);
 						SET_TASK_STAT(task_count, wpcopy_count);
 						SET_TASK_STAT(task_count, wpcopy_delay_total);
+						SET_TASK_STAT(task_count, wpcopy_delay_max);
 						SET_TASK_STAT(task_count, irq_count);
 						SET_TASK_STAT(task_count, irq_delay_total);
+						SET_TASK_STAT(task_count, irq_delay_max);
 						set_mem_count(&tasks[task_count]);
 						set_mem_delay_total(&tasks[task_count]);
 						task_count++;
@@ -794,6 +832,45 @@ static int compare_tasks(const void *a, const void *b)
 	return 0;
 }

+/* Get delay values for a specific field */
+static void get_field_delay_values(const struct task_info *task, const struct field_desc *field,
+				   double *avg_ms, double *max_ms)
+{
+	unsigned long long total, count, max;
+
+	if (!field) {
+		*avg_ms = 0;
+		*max_ms = 0;
+		return;
+	}
+
+	total = *(unsigned long long *)((char *)task + field->total_offset);
+	count = *(unsigned long *)((char *)task + field->count_offset);
+	*avg_ms = average_ms(total, count);
+
+	/* Get max delay based on field name */
+	if (strcmp(field->name, "cpu") == 0)
+		max = task->cpu_delay_max;
+	else if (strcmp(field->name, "blkio") == 0)
+		max = task->blkio_delay_max;
+	else if (strcmp(field->name, "irq") == 0)
+		max = task->irq_delay_max;
+	else if (strcmp(field->name, "swapin") == 0)
+		max = task->swapin_delay_max;
+	else if (strcmp(field->name, "freepages") == 0)
+		max = task->freepages_delay_max;
+	else if (strcmp(field->name, "thrashing") == 0)
+		max = task->thrashing_delay_max;
+	else if (strcmp(field->name, "compact") == 0)
+		max = task->compact_delay_max;
+	else if (strcmp(field->name, "wpcopy") == 0)
+		max = task->wpcopy_delay_max;
+	else
+		max = 0;
+
+	*max_ms = (double)max / 1000000.0;  /* Convert nanoseconds to milliseconds */
+}
+
 /* Sort tasks by selected field */
 static void sort_tasks(void)
 {
@@ -950,21 +1027,29 @@ static void display_results(int psi_ret)
 	suc &= BOOL_FPRINT(out, "Top %d processes (sorted by %s delay):\n",
 			cfg.max_processes, get_name_by_field(cfg.sort_field));

-	suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s", "PID", "TGID", "COMMAND");
-	if (cfg.display_mode == MODE_MEMVERBOSE) {
-		suc &= BOOL_FPRINT(out, "%8s %8s %8s %8s %8s %8s\n",
-			"MEM(ms)", "SWAP(ms)", "RCL(ms)",
-			"THR(ms)", "CMP(ms)", "WP(ms)");
-		suc &= BOOL_FPRINT(out, "-----------------------");
-		suc &= BOOL_FPRINT(out, "-----------------------");
-		suc &= BOOL_FPRINT(out, "-----------------------");
-		suc &= BOOL_FPRINT(out, "---------------------\n");
+	if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
+		/* Display mode for -t option: show only specified type with avg/max */
+		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s %12s %12s\n",
+			"PID", "TGID", "COMMAND",
+			"AVG(ms)", "MAX(ms)");
+		suc &= BOOL_FPRINT(out, "----------------------------------------------------\n");
 	} else {
-		suc &= BOOL_FPRINT(out, "%8s %8s %8s %8s\n",
-			"CPU(ms)", "IO(ms)", "IRQ(ms)", "MEM(ms)");
-		suc &= BOOL_FPRINT(out, "-----------------------");
-		suc &= BOOL_FPRINT(out, "-----------------------");
-		suc &= BOOL_FPRINT(out, "--------------------------\n");
+		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s", "PID", "TGID", "COMMAND");
+		if (cfg.display_mode == MODE_MEMVERBOSE) {
+			suc &= BOOL_FPRINT(out, "%8s %8s %8s %8s %8s %8s\n",
+				"MEM(ms)", "SWAP(ms)", "RCL(ms)",
+				"THR(ms)", "CMP(ms)", "WP(ms)");
+			suc &= BOOL_FPRINT(out, "-----------------------");
+			suc &= BOOL_FPRINT(out, "-----------------------");
+			suc &= BOOL_FPRINT(out, "-----------------------");
+			suc &= BOOL_FPRINT(out, "---------------------\n");
+		} else {
+			suc &= BOOL_FPRINT(out, "%8s %8s %8s %8s\n",
+				"CPU(ms)", "IO(ms)", "IRQ(ms)", "MEM(ms)");
+			suc &= BOOL_FPRINT(out, "-----------------------");
+			suc &= BOOL_FPRINT(out, "-----------------------");
+			suc &= BOOL_FPRINT(out, "--------------------------\n");
+		}
 	}

 	count = task_count < cfg.max_processes ? task_count : cfg.max_processes;
@@ -972,7 +1057,14 @@ static void display_results(int psi_ret)
 	for (i = 0; i < count; i++) {
 		suc &= BOOL_FPRINT(out, "%8d  %8d  %-15s",
 			tasks[i].pid, tasks[i].tgid, tasks[i].command);
-		if (cfg.display_mode == MODE_MEMVERBOSE) {
+		if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
+			double avg_ms, max_ms;
+
+			get_field_delay_values(&tasks[i], cfg.type_field, &avg_ms, &max_ms);
+
+			suc &= BOOL_FPRINT(out, "%12.2f %12.2f\n",
+				avg_ms, max_ms);
+		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
 				TASK_AVG(tasks[i], mem),
 				TASK_AVG(tasks[i], swapin),
-- 
2.25.1
