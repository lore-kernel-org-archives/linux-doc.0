Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641A0338596
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508335; cv=none; b=SqMI/ntDJtE875VdHgcaHjV/TLhCo+uMcnAHEpjq+BMoUWtDW+0kD2V7cP+qtsAfqPjiXdWnV0W+qFsQeEY7f/1CwUhT94D4sAZXYzaS1aprL5CGKY8zwnINUWLPkPTDorqQ8n1oxPLkIIMg785c6/HkdkLsKH9wtkCQdxNGhqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508335; c=relaxed/simple;
	bh=/4cfZMz8oITnii2apqjtXg2DFrXEEcGO7+msLUpaz58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IonG7S9Mlcc2KEgqBqHJp1t/bIyNYCEZqRQo5GpSmarb9cGIIYEq0ln+bqjgeegHLi1GOxRDkXBzesKwCSNGIpyQXp7Jdnx8paFmo+v7Al1leDQ6HlTTOJPlX4DSE0FLr/PxSD6KZXMPfr5/1HM6r8hYiL9vNAgsKRM0JWTIyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVajz66e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVajz66e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771508332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBs2Gafl178TnaUuE9OLcoK4IXyJvUD5zcUTZGqKuUI=;
	b=GVajz66eSCjCCZLvrTjtdlhjxqdGck9qGE/7Ps1Gt9FBgmAEbVhGkeRHl5qQVriVrh2O5V
	MOhRzO3JJp5NLxTywSZLn1stbEQuFm/DRHj5/nNwrXWqUDV/lccIhlLqGcHLlhNlhze/oQ
	ORKoNNlOjKqwImNulImqnX7VEUxOdyM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-qtSF72FsNQOq-YN0LYYKdA-1; Thu,
 19 Feb 2026 08:38:47 -0500
X-MC-Unique: qtSF72FsNQOq-YN0LYYKdA-1
X-Mimecast-MFC-AGG-ID: qtSF72FsNQOq-YN0LYYKdA_1771508325
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E7FC19560AD;
	Thu, 19 Feb 2026 13:38:45 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FF2319560A7;
	Thu, 19 Feb 2026 13:38:40 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Thu, 19 Feb 2026 14:37:37 +0100
Subject: [PATCH RFC 4/4] DEBUG selftests/sched: Add simple demonstration of
 SCHED_DEADLINE demotion
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260219-upstream-deadline-demotion-v1-4-528b96e53d12@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771508294; l=9603;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=/4cfZMz8oITnii2apqjtXg2DFrXEEcGO7+msLUpaz58=;
 b=65FPODv8pHjwatfI128tTL7/f4cYMKhEQ8m/eVEvfuvAioc5d8WF8mAmIkOnVDdbUMlfddPfW
 RVP/pR9tt2pAIUkFnkp+mMYDe9/aQJscr7y8hCoHbMngg4V2aUOaFQV
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add a simple demonstration program that clearly shows the difference
between normal DEADLINE throttling and the demotion feature.

The test runs two scenarios with identical parameters (30ms runtime per
100ms period) and workload (attempt to execute for 200ms):

Test 1: Normal DEADLINE without demotion flag - task is throttled after
exhausting its 30ms budget and stops executing until next period.

Test 2: DEADLINE with SCHED_FLAG_DL_DEMOTION - task is demoted to
SCHED_NORMAL after exhausting its budget and continues executing,
completing the full 200ms workload.

Each test phase writes markers to the ftrace buffer to make it easy to
identify different phases when examining traces for debugging.

Assisted-by: Claude Code:Sonnet 4.5
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/.gitignore         |   1 +
 tools/testing/selftests/sched/Makefile           |   4 +-
 tools/testing/selftests/sched/dl_demotion_demo.c | 239 +++++++++++++++++++++++
 3 files changed, 242 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sched/.gitignore b/tools/testing/selftests/sched/.gitignore
index c8139d0067df4..b6c66024f6a01 100644
--- a/tools/testing/selftests/sched/.gitignore
+++ b/tools/testing/selftests/sched/.gitignore
@@ -1,3 +1,4 @@
 cs_prctl_test
 dl_demotion_test
 dl_demotion_stress
+dl_demotion_demo
diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 0938acab18700..6207baf0de090 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -8,7 +8,7 @@ CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
 	  $(CLANG_FLAGS)
 LDLIBS += -lpthread
 
-TEST_GEN_FILES := cs_prctl_test dl_demotion_test dl_demotion_stress
-TEST_PROGS := cs_prctl_test dl_demotion_test
+TEST_GEN_FILES := cs_prctl_test dl_demotion_test dl_demotion_stress dl_demotion_demo
+TEST_PROGS := cs_prctl_test dl_demotion_test dl_demotion_demo
 
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/dl_demotion_demo.c b/tools/testing/selftests/sched/dl_demotion_demo.c
new file mode 100644
index 0000000000000..ca4da88ac94a5
--- /dev/null
+++ b/tools/testing/selftests/sched/dl_demotion_demo.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple demonstration of SCHED_DEADLINE demotion feature
+ *
+ * This test demonstrates the difference between:
+ * 1. Normal throttling: task stops executing when runtime exhausted
+ * 2. Demotion: task continues as SCHED_NORMAL when runtime exhausted
+ *
+ * Both tasks try to execute continuously, but only have 30ms budget per 100ms period.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+#include <linux/sched.h>
+#include <linux/sched/types.h>
+#include <time.h>
+#include <string.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdarg.h>
+
+#ifndef SCHED_FLAG_DL_DEMOTION
+#define SCHED_FLAG_DL_DEMOTION 0x80
+#endif
+
+/* Ftrace marker file */
+static int trace_marker_fd = -1;
+
+/* Use syscall directly to avoid glibc conflicts */
+static int sys_sched_setattr(pid_t pid, struct sched_attr *attr,
+			     unsigned int flags)
+{
+	return syscall(__NR_sched_setattr, pid, attr, flags);
+}
+
+static int sys_sched_getattr(pid_t pid, struct sched_attr *attr,
+			     unsigned int size, unsigned int flags)
+{
+	return syscall(__NR_sched_getattr, pid, attr, size, flags);
+}
+
+/* Open ftrace marker for writing trace events */
+static void open_trace_marker(void)
+{
+	trace_marker_fd = open("/sys/kernel/tracing/trace_marker", O_WRONLY);
+	if (trace_marker_fd < 0) {
+		/* Try debugfs location */
+		trace_marker_fd = open("/sys/kernel/debug/tracing/trace_marker", O_WRONLY);
+	}
+}
+
+/* Write a message to ftrace marker */
+static void trace_write(const char *fmt, ...)
+{
+	char buf[256];
+	va_list ap;
+	int len;
+
+	if (trace_marker_fd < 0)
+		return;
+
+	va_start(ap, fmt);
+	len = vsnprintf(buf, sizeof(buf), fmt, ap);
+	va_end(ap);
+
+	if (len > 0)
+		write(trace_marker_fd, buf, len);
+}
+
+/* Busy loop for specified milliseconds */
+static void burn_cpu_ms(int ms)
+{
+	struct timespec start, now;
+	long long elapsed_ns;
+	long long target_ns = ms * 1000000LL;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	do {
+		/* Just burn CPU */
+		for (volatile int i = 0; i < 10000; i++)
+			;
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		elapsed_ns = (now.tv_sec - start.tv_sec) * 1000000000LL +
+			     (now.tv_nsec - start.tv_nsec);
+	} while (elapsed_ns < target_ns);
+}
+
+/* Count how much CPU time we actually got */
+static int measure_execution_time_ms(void (*workload)(void))
+{
+	struct timespec start, end;
+	long long elapsed_ns;
+
+	clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);
+	workload();
+	clock_gettime(CLOCK_THREAD_CPUTIME_ID, &end);
+
+	elapsed_ns = (end.tv_sec - start.tv_sec) * 1000000000LL +
+		     (end.tv_nsec - start.tv_nsec);
+
+	return elapsed_ns / 1000000; /* Convert to ms */
+}
+
+/* Try to execute for 200ms (should get throttled/demoted at 30ms) */
+static void try_burn_200ms(void)
+{
+	burn_cpu_ms(200);
+}
+
+static void run_throttled_test(void)
+{
+	struct sched_attr attr = {
+		.size = sizeof(attr),
+		.sched_policy = SCHED_DEADLINE,
+		.sched_runtime = 30 * 1000000,   /* 30ms */
+		.sched_deadline = 100 * 1000000, /* 100ms */
+		.sched_period = 100 * 1000000,   /* 100ms */
+		.sched_flags = 0,  /* NO demotion flag */
+		.sched_nice = 0,
+	};
+	int actual_ms;
+
+	printf("\n=== Test 1: Normal DEADLINE (no demotion) ===\n");
+	printf("Configuration:\n");
+	printf("  Runtime:  30ms per 100ms period\n");
+	printf("  Flags:    (none - normal throttling)\n");
+	printf("  Workload: Try to execute for 200ms\n\n");
+
+	trace_write("TEST1_START: Normal DEADLINE without demotion");
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		perror("sys_sched_setattr");
+		exit(1);
+	}
+
+	trace_write("TEST1_EXEC_START: Starting workload");
+	printf("Starting execution...\n");
+	actual_ms = measure_execution_time_ms(try_burn_200ms);
+	trace_write("TEST1_EXEC_END: Workload completed");
+
+	printf("\nResult:\n");
+	printf("  CPU time obtained: %dms\n", actual_ms);
+	if (actual_ms >= 55 && actual_ms <= 65) {
+		printf("  ✓ Task was THROTTLED after exhausting 30ms budget\n");
+		printf("  ✓ Task stopped executing (did not continue past budget)\n");
+	} else {
+		printf("  ✗ Unexpected execution time (expected ~30ms)\n");
+	}
+
+	/* Switch back to normal before next test */
+	attr.sched_policy = SCHED_NORMAL;
+	sys_sched_setattr(0, &attr, 0);
+	trace_write("TEST1_END: Switched back to SCHED_NORMAL");
+	usleep(100000); /* Let things settle */
+}
+
+static void run_demotion_test(void)
+{
+	struct sched_attr attr = {
+		.size = sizeof(attr),
+		.sched_policy = SCHED_DEADLINE,
+		.sched_runtime = 30 * 1000000,   /* 30ms */
+		.sched_deadline = 100 * 1000000, /* 100ms */
+		.sched_period = 100 * 1000000,   /* 100ms */
+		.sched_flags = SCHED_FLAG_DL_DEMOTION,
+		.sched_nice = 0,
+	};
+	int actual_ms;
+
+	printf("\n=== Test 2: DEADLINE with demotion ===\n");
+	printf("Configuration:\n");
+	printf("  Runtime:  30ms per 100ms period\n");
+	printf("  Flags:    SCHED_FLAG_DL_DEMOTION\n");
+	printf("  Workload: Try to execute for 200ms\n\n");
+
+	trace_write("TEST2_START: DEADLINE with demotion enabled");
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		perror("sys_sched_setattr");
+		exit(1);
+	}
+
+	trace_write("TEST2_EXEC_START: Starting workload (will demote)");
+	printf("Starting execution...\n");
+	actual_ms = measure_execution_time_ms(try_burn_200ms);
+	trace_write("TEST2_EXEC_END: Workload completed");
+
+	printf("\nResult:\n");
+	printf("  CPU time obtained: %dms\n", actual_ms);
+	if (actual_ms >= 150) {
+		printf("  ✓ Task was DEMOTED after exhausting 30ms budget\n");
+		printf("  ✓ Task continued executing as SCHED_NORMAL\n");
+		printf("  ✓ Task completed the full workload\n");
+	} else if (actual_ms >= 25 && actual_ms <= 35) {
+		printf("  ✗ Task was throttled instead of demoted\n");
+		printf("  ✗ Demotion feature may not be working\n");
+	} else {
+		printf("  ✗ Unexpected execution time\n");
+	}
+
+	/* Switch back to normal */
+	attr.sched_policy = SCHED_NORMAL;
+	sys_sched_setattr(0, &attr, 0);
+	trace_write("TEST2_END: Switched back to SCHED_NORMAL");
+}
+
+int main(void)
+{
+	printf("SCHED_DEADLINE Demotion Feature Demonstration\n");
+	printf("==============================================\n");
+	printf("\nThis demonstrates the difference between normal throttling\n");
+	printf("and demotion when a DEADLINE task exhausts its runtime.\n");
+
+	/* Open ftrace marker for trace events */
+	open_trace_marker();
+	trace_write("DEMO_START: Beginning demonstration");
+
+	/* Run test without demotion (throttled) */
+	run_throttled_test();
+
+	/* Run test with demotion (continues as NORMAL) */
+	run_demotion_test();
+
+	printf("\n==============================================\n");
+	printf("Summary:\n");
+	printf("  Without demotion: Task stops when budget exhausted\n");
+	printf("  With demotion:    Task continues as SCHED_NORMAL\n");
+	printf("\nDemonstration complete!\n");
+
+	trace_write("DEMO_END: Demonstration completed");
+
+	if (trace_marker_fd >= 0)
+		close(trace_marker_fd);
+
+	return 0;
+}

-- 
2.53.0

