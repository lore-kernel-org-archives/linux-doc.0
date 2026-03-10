Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F71034844C
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125266; cv=none; b=X/xrWP4IXM0CsX2ZsE45ZM/cDM2BeKYx+lC7Dd/JDDXVKGDgVrl6+njJ81VOdzLeJeI4osXxvEr+hRcPwmvrALVDWSV6/ylSbajrQ/x4ZERuUYfp1777xfbEo6M7g9iLgFYK7HiHQI7PNhRXF72FXQsaYtpxqfrV8kVHVNHQxw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125266; c=relaxed/simple;
	bh=mmWJrrmg47pR7ISUPUzrRScInSgbHDJjEuCiJMjVoCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dr0wbcTSDoWtRwcd6C/N1f80xvptrN5yd0fpIHVB8GuVP2w1l+ESMseGJCvJQs13FQ5vrNjwcHpZRzrvhlNT2xrbmtdG8qOgExmXP41+5kIULJ5mhrhb29XxWFcyhAOT7rtLpBiEiBeYBinDe4Dv+OB12W53B5MRdgjh8qn0Iek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOXauC0x; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOXauC0x"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67bb021cb80so675548eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 23:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773125263; x=1773730063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwTCW4kPM2T1K/6v5Lnoe3goNz0UWUTXNggksO5to7k=;
        b=LOXauC0xlrRoyX3AFY0mGBbyP3vau3Y+aCkI0R2qcdcc7jVlY9CrpB40SAAl1TX3id
         mTSR5U4TkQMsQWkS1FggOvYBsZqxfvnUZZAPazssbUAYyc8upfF69SYSGkauFHy060x+
         ZtCAULgLzaOlkvixviiGdZCLH5iTf6UJcpos4xz83mHUK2QDmCnEAWwzGK572ysrlPle
         eFSsAaeJmicq5dKlOZqHFd/zDPoqXFiaNjWoHYbtksyIQVZ409WzhmIqkQUIt3T7krqU
         mdSwDAYetLeDDY5rNH1zV7LUnDWPnWS5JF1/wWHdk7hhDGRLl12FKWCKZWvxBge1F9X+
         roDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773125263; x=1773730063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VwTCW4kPM2T1K/6v5Lnoe3goNz0UWUTXNggksO5to7k=;
        b=Rc6edWa3m5kFTPF1QeypgTRbTqhIGTDFi6eyZVwJNETfIsnFDAR1NdE833qkNfHpK4
         lCqbmFyXleerCcSDkioTMWUx4GTCE4BPoa8NARaq41NQn6wHiHE0feoEs5MfHraF1a34
         Ejzu62YfPhI7m5jO8N8Ep7WVSeYXNtigeYs3q8vxCL8GSbwPumoiqc6qL/io7bMYOgrv
         XPjeluXUFBow9R5eGmH2b1jP9oLMAyP47E8RfVJelpsapuEVIk/cOIkFh+lgULdc7VG7
         MuBSuHQx+0MZEaigxVh2Zo0DJuSC5iy8hFVnb4faiC+sIJljoGmydXPRG2159JEP/vWe
         YVgg==
X-Forwarded-Encrypted: i=1; AJvYcCUs2MPVHTEBhUmYZZ38mfEXMg4x3rWEdTGHDoANbxMZHArKb7xpH+fwH8PWNKEEm/2i7g+Vr9RRpAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXNFnLbyOWk7Yxze2xgCsCmkV+Y1vr/JHNNJORfZ2cPkBK88o
	9aXFrn1DbdfjWgiEYpC4JEdZPDvcIb81vILsk1Q/ZJ+cxyxi7sXQLkeH
X-Gm-Gg: ATEYQzx51G0MfV6xdkqWwif5Cv0wv+UbL45Wd6Jfr7IyZJzOsVcUJFSgJQx57IH1mqJ
	joeAgaHOXZn954owwcTd1sb3V1cpNqbdChqjczQox2d1wHiwgbgddrbbw8uR0+bjflt/l+vGlF8
	b3fJXT5x0l1TksVO6lcQCHxOSVbDIndkTm25KyRS/Y5y8PIsBIPMMP/3P+k0TxZECZs/htGYIAq
	3HyiYHlisdIk7yQ3kn/DShimNY94agK4vt1pdb5sy2obAix+My5Wwmu/yAZhB3+P/cDi+YtOD5M
	NcRtzlnHFUxcO4Df/TZrz2o206AX1p+TanCgCJwauLEWvFjAKndrf6hZq7Wso9eAfO9sFiinObR
	ho982++sbjm/WNmynZbMdmtT+A+ScFyRLfhLRL1DkPM89x+hurVZbfVRqTYlV7dv7Lrwvd59dyj
	sXWgjT3mw8vJo59ggYwnufDvDXDFb/p1n9Lp15tOsC8YRzEFxSBGTRHIS1jyKzAHq69zRpkqJGO
	bw3d0pOp6gBMIwWOJGg52IW+HSKS+HiORhiVZRgHFcd9S1b
X-Received: by 2002:a05:6820:229a:b0:67b:b432:5fbe with SMTP id 006d021491bc7-67bb4326165mr3670429eaf.26.1773125263310;
        Mon, 09 Mar 2026 23:47:43 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb666de5bsm2600618eaf.7.2026.03.09.23.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:47:42 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH v3 1/2] tracing: preserve repeated boot-time tracing parameters
Date: Tue, 10 Mar 2026 00:47:14 -0600
Message-Id: <20260310064715.527906-2-atwellwea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310064715.527906-1-atwellwea@gmail.com>
References: <20260310064715.527906-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some tracing boot parameters already accept delimited value lists, but
their __setup() handlers keep only the last instance seen at boot.
Make repeated instances append to the same boot-time buffer in the
format each parser already consumes, and document that behavior in
admin-guide/kernel-parameters.txt.

Use a shared trace_append_boot_param() helper for the ftrace filters,
trace_options, and kprobe_event boot parameters. trace_trigger=
tokenizes its backing storage in place, so keep a running offset and
only parse the newly appended chunk into bootup_triggers[].

This also lets Bootconfig array values work naturally when they expand
to repeated param=value entries.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 18 ++++++++++--
 kernel/trace/ftrace.c                         | 12 +++++---
 kernel/trace/trace.c                          |  3 +-
 kernel/trace/trace.h                          | 29 +++++++++++++++++++
 kernel/trace/trace_events.c                   | 26 +++++++++++++++--
 kernel/trace/trace_kprobe.c                   |  3 +-
 6 files changed, 79 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 55ffc0f8858a..203863c1839b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1803,13 +1803,15 @@ Kernel parameters
 			tracer at boot up. function-list is a comma-separated
 			list of functions. This list can be changed at run
 			time by the set_ftrace_filter file in the debugfs
-			tracing directory.
+			tracing directory. Repeated instances append more
+			functions to the same list.
 
 	ftrace_notrace=[function-list]
 			[FTRACE] Do not trace the functions specified in
 			function-list. This list can be changed at run time
 			by the set_ftrace_notrace file in the debugfs
-			tracing directory.
+			tracing directory. Repeated instances append more
+			functions to the same list.
 
 	ftrace_graph_filter=[function-list]
 			[FTRACE] Limit the top level callers functions traced
@@ -1817,12 +1819,16 @@ Kernel parameters
 			function-list is a comma-separated list of functions
 			that can be changed at run time by the
 			set_graph_function file in the debugfs tracing directory.
+			Repeated instances append more functions to the same
+			list.
 
 	ftrace_graph_notrace=[function-list]
 			[FTRACE] Do not trace from the functions specified in
 			function-list.  This list is a comma-separated list of
 			functions that can be changed at run time by the
 			set_graph_notrace file in the debugfs tracing directory.
+			Repeated instances append more functions to the same
+			list.
 
 	ftrace_graph_max_depth=<uint>
 			[FTRACE] Used with the function graph tracer. This is
@@ -3053,6 +3059,8 @@ Kernel parameters
 			The probe-list is a semicolon delimited list of probe
 			definitions. Each definition is same as kprobe_events
 			interface, but the parameters are comma delimited.
+			Repeated instances append more probe definitions to
+			the same boot-time list.
 			For example, to add a kprobe event on vfs_read with
 			arg1 and arg2, add to the command line;
 
@@ -7820,6 +7828,9 @@ Kernel parameters
 
 			    /sys/kernel/tracing/trace_options
 
+			Repeated instances append more options to the same
+			boot-time list.
+
 			For example, to enable stacktrace option (to dump the
 			stack trace of each event), add to the command line:
 
@@ -7831,7 +7842,8 @@ Kernel parameters
 	trace_trigger=[trigger-list]
 			[FTRACE] Add an event trigger on specific events.
 			Set a trigger on top of a specific event, with an optional
-			filter.
+			filter. Repeated instances append more triggers to
+			the same boot-time list.
 
 			The format is "trace_trigger=<event>.<trigger>[ if <filter>],..."
 			Where more than one trigger may be specified that are comma delimited.
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 8df69e702706..d0a486b63ed6 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6841,7 +6841,8 @@ bool ftrace_filter_param __initdata;
 static int __init set_ftrace_notrace(char *str)
 {
 	ftrace_filter_param = true;
-	strscpy(ftrace_notrace_buf, str, FTRACE_FILTER_SIZE);
+	trace_append_boot_param(ftrace_notrace_buf, str, ',',
+				FTRACE_FILTER_SIZE);
 	return 1;
 }
 __setup("ftrace_notrace=", set_ftrace_notrace);
@@ -6849,7 +6850,8 @@ __setup("ftrace_notrace=", set_ftrace_notrace);
 static int __init set_ftrace_filter(char *str)
 {
 	ftrace_filter_param = true;
-	strscpy(ftrace_filter_buf, str, FTRACE_FILTER_SIZE);
+	trace_append_boot_param(ftrace_filter_buf, str, ',',
+				FTRACE_FILTER_SIZE);
 	return 1;
 }
 __setup("ftrace_filter=", set_ftrace_filter);
@@ -6861,14 +6863,16 @@ static int ftrace_graph_set_hash(struct ftrace_hash *hash, char *buffer);
 
 static int __init set_graph_function(char *str)
 {
-	strscpy(ftrace_graph_buf, str, FTRACE_FILTER_SIZE);
+	trace_append_boot_param(ftrace_graph_buf, str, ',',
+				FTRACE_FILTER_SIZE);
 	return 1;
 }
 __setup("ftrace_graph_filter=", set_graph_function);
 
 static int __init set_graph_notrace_function(char *str)
 {
-	strscpy(ftrace_graph_notrace_buf, str, FTRACE_FILTER_SIZE);
+	trace_append_boot_param(ftrace_graph_notrace_buf, str, ',',
+				FTRACE_FILTER_SIZE);
 	return 1;
 }
 __setup("ftrace_graph_notrace=", set_graph_notrace_function);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index ebd996f8710e..5086239a75dc 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -329,7 +329,8 @@ static char trace_boot_options_buf[MAX_TRACER_SIZE] __initdata;
 
 static int __init set_trace_boot_options(char *str)
 {
-	strscpy(trace_boot_options_buf, str, MAX_TRACER_SIZE);
+	trace_append_boot_param(trace_boot_options_buf, str, ',',
+				MAX_TRACER_SIZE);
 	return 1;
 }
 __setup("trace_options=", set_trace_boot_options);
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index b8f3804586a0..4f5abac4bd19 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -23,6 +23,7 @@
 #include <linux/once_lite.h>
 #include <linux/ftrace_regs.h>
 #include <linux/llist.h>
+#include <linux/string.h>
 
 #include "pid_list.h"
 
@@ -262,6 +263,34 @@ static inline bool still_need_pid_events(int type, struct trace_pid_list *pid_li
 		(!(type & TRACE_NO_PIDS) && no_pid_list);
 }
 
+/*
+ * Repeated boot parameters, including Bootconfig array expansions, need
+ * to stay in the delimiter form that the existing parser consumes.
+ */
+static inline void __init trace_append_boot_param(char *buf, const char *str,
+						  char sep, size_t size)
+{
+	size_t len, str_len;
+
+	if (buf[0] == '\0') {
+		strscpy(buf, str, size);
+		return;
+	}
+
+	str_len = strlen(str);
+	if (!str_len)
+		return;
+
+	len = strlen(buf);
+	if (len >= size - 1)
+		return;
+	if (str_len >= size - len - 1)
+		return;
+
+	buf[len] = sep;
+	strscpy(buf + len + 1, str, size - len - 1);
+}
+
 typedef bool (*cond_update_fn_t)(struct trace_array *tr, void *cond_data);
 
 /**
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 249d1cba72c0..5f72be33f2d1 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -3679,20 +3679,40 @@ static struct boot_triggers {
 } bootup_triggers[MAX_BOOT_TRIGGERS];
 
 static char bootup_trigger_buf[COMMAND_LINE_SIZE];
+static size_t bootup_trigger_buf_len;
 static int nr_boot_triggers;
 
 static __init int setup_trace_triggers(char *str)
 {
 	char *trigger;
 	char *buf;
+	size_t start, str_len;
 	int i;
 
-	strscpy(bootup_trigger_buf, str, COMMAND_LINE_SIZE);
+	if (bootup_trigger_buf_len >= COMMAND_LINE_SIZE)
+		return 1;
+
+	start = bootup_trigger_buf_len;
+	if (start && !*str)
+		return 1;
+
+	str_len = strlen(str);
+	if (start && str_len >= COMMAND_LINE_SIZE - start)
+		return 1;
+
+	/*
+	 * trace_trigger= parsing tokenizes the backing storage in place.
+	 * Copy each repeated parameter into fresh space and only parse that
+	 * newly copied chunk here.
+	 */
+	trace_append_boot_param(bootup_trigger_buf + start, str, '\0',
+				COMMAND_LINE_SIZE - start);
+	bootup_trigger_buf_len += strlen(bootup_trigger_buf + start) + 1;
 	trace_set_ring_buffer_expanded(NULL);
 	disable_tracing_selftest("running event triggers");
 
-	buf = bootup_trigger_buf;
-	for (i = 0; i < MAX_BOOT_TRIGGERS; i++) {
+	buf = bootup_trigger_buf + start;
+	for (i = nr_boot_triggers; i < MAX_BOOT_TRIGGERS; i++) {
 		trigger = strsep(&buf, ",");
 		if (!trigger)
 			break;
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index a5dbb72528e0..e9f1c55aea64 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -31,7 +31,8 @@ static char kprobe_boot_events_buf[COMMAND_LINE_SIZE] __initdata;
 
 static int __init set_kprobe_boot_events(char *str)
 {
-	strscpy(kprobe_boot_events_buf, str, COMMAND_LINE_SIZE);
+	trace_append_boot_param(kprobe_boot_events_buf, str, ';',
+				COMMAND_LINE_SIZE);
 	disable_tracing_selftest("running kprobe events");
 
 	return 1;
-- 
2.34.1

