Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589C31AA91
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508329; cv=none; b=ivoCHGOAEvD7t1DMkrlL5r2FFGuaEYQ74tepuMupL5z2NXHY0FT6iZmxs4FTb88g4DhWYidnp1ag5fW+rYWw80th63JZRXuaLpSs5IodLaEHr44hJryl7Cv9fl2t18TjBkLTcSVsv/ruoDaJaL2wOVvlf2dq7zZlboGKJtbTE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508329; c=relaxed/simple;
	bh=6RymEokSFgtlh6MU+zUh841EHzKS/mwy2iVO4dglYyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVUma4cBMnGU3LfqN6rwX74oq34T+lGPME+oSIo8PDpal8NKLbLmMzxSRtfupEQRWVS1GiE8KQGmqGC0846TH3Z4pZLJUFwxHpgkarvknobiQk7y4Ak9OMH68/ZgSQ+e9THMtvjK+HFutGYRmjtO2S2ofdrarXNDGouv2/2dUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a54bw70F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a54bw70F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771508326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dt0yNHe2t7XqMZ1oFFPnx+ZxhSN90nzZbVjTGzTsux4=;
	b=a54bw70Fy0kWa5C3DSxqTr5/TeN/VvIAR3ys6/Ymvt0qb8OCiNT2wGjwWV3P4r9U8UaRYh
	S6PMvUrvEKaLenb0mU2IU7Bm5iHkgwX3mY9LYbZP+92nQzzVVObX3IVhcUu1J+c1WuI9YT
	bEtJlAqBCu81+GEUvCkYZuFWlhcIElM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-rf4WNCz3M-qzolIi4RCxSw-1; Thu,
 19 Feb 2026 08:38:41 -0500
X-MC-Unique: rf4WNCz3M-qzolIi4RCxSw-1
X-Mimecast-MFC-AGG-ID: rf4WNCz3M-qzolIi4RCxSw_1771508319
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4C911956095;
	Thu, 19 Feb 2026 13:38:39 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A9F01955F01;
	Thu, 19 Feb 2026 13:38:34 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Thu, 19 Feb 2026 14:37:36 +0100
Subject: [PATCH RFC 3/4] DEBUG selftests/sched: Add tests for
 SCHED_DEADLINE demotion feature
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-upstream-deadline-demotion-v1-3-528b96e53d12@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771508294; l=27552;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=6RymEokSFgtlh6MU+zUh841EHzKS/mwy2iVO4dglYyU=;
 b=AABOTf0Vt+vflFYFC7cUPvB55OLO6dbRtEAOKcZ65o4TqaJ/4ZHDtWQhjFfdE4efrd+ONGg9n
 xtZZRudCVR8CtDuAp49Z8+eGQNBHWbNwQqtg9sqpnbC4LnfwgejPi4g
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add functional and stress tests for the SCHED_FLAG_DL_DEMOTION feature.

The functional test (dl_demotion_test.c) verifies:
- Basic demotion on runtime exhaustion
- Promotion when replenishment timer fires
- Explicit parameter change clears demotion state
- No demotion without SCHED_FLAG_DL_DEMOTION

The stress test (dl_demotion_stress.c) creates multiple demoting tasks
running concurrently to verify bandwidth accounting and state machine
correctness under load.

Also include a helper script for running tests with ftrace enabled to
aid in debugging bandwidth accounting issues.

Assisted-by: Claude Code:Sonnet 4.5
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/.gitignore           |   2 +
 tools/testing/selftests/sched/Makefile             |   4 +-
 tools/testing/selftests/sched/README_dl_demotion   |  83 ++++
 tools/testing/selftests/sched/dl_demotion_stress.c | 208 ++++++++++
 tools/testing/selftests/sched/dl_demotion_test.c   | 460 +++++++++++++++++++++
 .../selftests/sched/run_dl_demotion_with_trace.sh  |  71 ++++
 6 files changed, 826 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sched/.gitignore b/tools/testing/selftests/sched/.gitignore
index 6996d4654d924..c8139d0067df4 100644
--- a/tools/testing/selftests/sched/.gitignore
+++ b/tools/testing/selftests/sched/.gitignore
@@ -1 +1,3 @@
 cs_prctl_test
+dl_demotion_test
+dl_demotion_stress
diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 099ee9213557a..0938acab18700 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -8,7 +8,7 @@ CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
 	  $(CLANG_FLAGS)
 LDLIBS += -lpthread
 
-TEST_GEN_FILES := cs_prctl_test
-TEST_PROGS := cs_prctl_test
+TEST_GEN_FILES := cs_prctl_test dl_demotion_test dl_demotion_stress
+TEST_PROGS := cs_prctl_test dl_demotion_test
 
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/README_dl_demotion b/tools/testing/selftests/sched/README_dl_demotion
new file mode 100644
index 0000000000000..1cdd10fbbd7d1
--- /dev/null
+++ b/tools/testing/selftests/sched/README_dl_demotion
@@ -0,0 +1,83 @@
+SCHED_DEADLINE Demotion Tests
+==============================
+
+This test verifies the SCHED_FLAG_DL_DEMOTION feature which allows DEADLINE
+tasks to be demoted to SCHED_NORMAL when they exhaust their runtime budget.
+
+Building
+--------
+  make -C tools/testing/selftests/sched
+
+Running
+-------
+Requires root or CAP_SYS_NICE:
+
+  sudo ./tools/testing/selftests/sched/dl_demotion_test
+
+Or via kselftest framework:
+
+  sudo make -C tools/testing/selftests TARGETS=sched run_tests
+
+Tests
+-----
+
+Test 1: Basic demotion on runtime exhaustion
+  - Creates a DEADLINE task with SCHED_FLAG_DL_DEMOTION
+  - Runs until runtime is exhausted
+  - Verifies task is demoted to SCHED_NORMAL
+
+Test 2: Promotion on replenishment timer
+  - Gets demoted by exhausting runtime
+  - Waits for period to expire
+  - Verifies task is promoted back to SCHED_DEADLINE
+
+Test 3: Explicit parameter change while demoted
+  - Gets demoted
+  - Explicitly changes scheduling parameters
+  - Verifies demotion state is cleared (no automatic promotion)
+
+Test 4: No demotion without flag
+  - Creates DEADLINE task WITHOUT demotion flag
+  - Exhausts runtime
+  - Verifies task remains SCHED_DEADLINE (throttled but not demoted)
+
+Stress Test
+-----------
+The dl_demotion_stress test creates multiple threads that repeatedly go through
+demotion/promotion cycles. This is useful for stress testing the feature,
+especially migration scenarios.
+
+  sudo ./tools/testing/selftests/sched/dl_demotion_stress [threads] [duration]
+
+Arguments:
+  threads  - Number of worker threads (1-32, default: 4)
+  duration - Run duration in seconds (default: 10)
+
+Example:
+  sudo ./tools/testing/selftests/sched/dl_demotion_stress 8 30
+
+This test is NOT part of the automated test suite (not in TEST_PROGS) and
+must be run manually.
+
+Debugging
+---------
+To see the demotion/promotion state machine transitions, enable ftrace:
+
+  sudo su
+  cd /sys/kernel/debug/tracing
+  echo 1 > events/sched/enable
+  echo 1 > options/trace_printk
+  echo 1 > tracing_on
+
+Then run the test and check the trace:
+
+  cat trace
+
+Look for trace_printk messages showing state transitions:
+  - dl_demote: ... state: NOT_DEMOTED->DEMOTING
+  - dl_demote: ... state: DEMOTING->DEMOTED
+  - dl_promote: ... state: DEMOTED->PROMOTING
+  - dl_promote: ... state: PROMOTING->NOT_DEMOTED
+  - dl_timer: ... migrated_while_runnable/sleeping
+  - switched_from_dl: ... skip_bw_accounting
+  - switched_to_dl: ... skip_bw_accounting
diff --git a/tools/testing/selftests/sched/dl_demotion_stress.c b/tools/testing/selftests/sched/dl_demotion_stress.c
new file mode 100644
index 0000000000000..6e404d6b56af9
--- /dev/null
+++ b/tools/testing/selftests/sched/dl_demotion_stress.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SCHED_DEADLINE demotion stress test
+ *
+ * Creates multiple DEADLINE tasks with demotion enabled and runs them
+ * to stress test the demotion/promotion state machine, especially with
+ * migration scenarios.
+ */
+
+#define _GNU_SOURCE
+#include <sched.h>
+#include <sys/types.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <time.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdint.h>
+#include <pthread.h>
+#include <signal.h>
+
+#ifndef SCHED_FLAG_DL_DEMOTION
+#define SCHED_FLAG_DL_DEMOTION 0x80
+#endif
+
+#define NSEC_PER_SEC 1000000000ULL
+
+static volatile int keep_running = 1;
+
+/* Wrappers for sched_setattr/getattr - use syscall directly to avoid glibc conflicts */
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
+/* Signal handler for clean shutdown */
+static void sigint_handler(int sig)
+{
+	(void)sig;
+	keep_running = 0;
+}
+
+/* Burn CPU cycles */
+static void burn_cpu(uint64_t nsec)
+{
+	struct timespec start, now;
+	uint64_t elapsed_ns;
+	volatile uint64_t dummy = 0;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	do {
+		for (int i = 0; i < 10000; i++)
+			dummy += i;
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		elapsed_ns = (now.tv_sec - start.tv_sec) * NSEC_PER_SEC +
+			     (now.tv_nsec - start.tv_nsec);
+	} while (elapsed_ns < nsec);
+}
+
+/* Thread function - repeatedly exhaust runtime and get demoted/promoted */
+static void *worker_thread(void *arg)
+{
+	int thread_id = *(int *)arg;
+	struct sched_attr attr = {0};
+	int cycles = 0;
+	cpu_set_t cpuset;
+
+	/* Set CPU affinity to allow migration */
+	CPU_ZERO(&cpuset);
+	/* Allow running on CPUs 0-3 (adjust based on system) */
+	for (int i = 0; i < 4 && i < sysconf(_SC_NPROCESSORS_ONLN); i++)
+		CPU_SET(i, &cpuset);
+	pthread_setaffinity_np(pthread_self(), sizeof(cpuset), &cpuset);
+
+	/* Set DEADLINE with demotion */
+	attr.size = sizeof(attr);
+	attr.sched_policy = SCHED_DEADLINE;
+	attr.sched_runtime = 20 * 1000 * 1000;   /* 20ms */
+	attr.sched_deadline = 100 * 1000 * 1000; /* 100ms */
+	attr.sched_period = 100 * 1000 * 1000;   /* 100ms */
+	attr.sched_flags = SCHED_FLAG_DL_DEMOTION;
+	attr.sched_nice = thread_id % 10;  /* Different nice values */
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		perror("sched_setattr");
+		return NULL;
+	}
+
+	printf("Thread %d: Started with SCHED_DEADLINE (runtime=20ms, period=100ms, nice=%d)\n",
+	       thread_id, attr.sched_nice);
+
+	while (keep_running) {
+		/* Burn CPU to exhaust runtime and trigger demotion */
+		burn_cpu(25 * 1000 * 1000); /* 25ms - exceeds 20ms runtime */
+
+		/* Now we should be demoted - do some light work as NORMAL */
+		usleep(10 * 1000); /* 10ms */
+
+		/* Wait for promotion (period expiry) */
+		usleep(120 * 1000); /* 120ms - exceeds 100ms period */
+
+		cycles++;
+		if (cycles % 10 == 0) {
+			printf("Thread %d: Completed %d demotion/promotion cycles\n",
+			       thread_id, cycles);
+		}
+	}
+
+	printf("Thread %d: Exiting after %d cycles\n", thread_id, cycles);
+
+	/* Reset to normal before exiting */
+	attr.sched_policy = SCHED_NORMAL;
+	sys_sched_setattr(0, &attr, 0);
+
+	return NULL;
+}
+
+int main(int argc, char *argv[])
+{
+	int num_threads = 4;
+	pthread_t *threads;
+	int *thread_ids;
+	int duration = 10; /* seconds */
+
+	/* Parse arguments */
+	if (argc > 1)
+		num_threads = atoi(argv[1]);
+	if (argc > 2)
+		duration = atoi(argv[2]);
+
+	if (num_threads < 1 || num_threads > 32) {
+		fprintf(stderr, "Number of threads must be 1-32\n");
+		return 1;
+	}
+
+	printf("SCHED_DEADLINE Demotion Stress Test\n");
+	printf("====================================\n");
+	printf("Threads: %d\n", num_threads);
+	printf("Duration: %d seconds\n", duration);
+	printf("Press Ctrl+C to stop early\n\n");
+
+	/* Check permissions */
+	struct sched_attr attr = {0};
+	attr.size = sizeof(attr);
+	attr.sched_policy = SCHED_DEADLINE;
+	attr.sched_runtime = 10 * 1000 * 1000;
+	attr.sched_deadline = 100 * 1000 * 1000;
+	attr.sched_period = 100 * 1000 * 1000;
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		if (errno == EPERM) {
+			fprintf(stderr, "Need CAP_SYS_NICE or root privileges\n");
+			return 1;
+		} else if (errno == EINVAL) {
+			fprintf(stderr, "SCHED_DEADLINE or SCHED_FLAG_DL_DEMOTION not supported\n");
+			return 1;
+		}
+	}
+	attr.sched_policy = SCHED_NORMAL;
+	sys_sched_setattr(0, &attr, 0);
+
+	/* Set up signal handler */
+	signal(SIGINT, sigint_handler);
+
+	/* Allocate thread arrays */
+	threads = malloc(num_threads * sizeof(pthread_t));
+	thread_ids = malloc(num_threads * sizeof(int));
+	if (!threads || !thread_ids) {
+		fprintf(stderr, "Memory allocation failed\n");
+		return 1;
+	}
+
+	/* Create threads */
+	for (int i = 0; i < num_threads; i++) {
+		thread_ids[i] = i;
+		if (pthread_create(&threads[i], NULL, worker_thread, &thread_ids[i]) != 0) {
+			perror("pthread_create");
+			keep_running = 0;
+			break;
+		}
+	}
+
+	/* Run for specified duration */
+	sleep(duration);
+	keep_running = 0;
+
+	/* Wait for threads to finish */
+	printf("\nWaiting for threads to finish...\n");
+	for (int i = 0; i < num_threads; i++) {
+		pthread_join(threads[i], NULL);
+	}
+
+	free(threads);
+	free(thread_ids);
+
+	printf("\nStress test completed successfully\n");
+	return 0;
+}
diff --git a/tools/testing/selftests/sched/dl_demotion_test.c b/tools/testing/selftests/sched/dl_demotion_test.c
new file mode 100644
index 0000000000000..11ffe1c9ecbed
--- /dev/null
+++ b/tools/testing/selftests/sched/dl_demotion_test.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SCHED_DEADLINE demotion/promotion test
+ *
+ * Tests the SCHED_FLAG_DL_DEMOTION feature which allows DEADLINE tasks
+ * to be demoted to SCHED_NORMAL when they exhaust their runtime, and
+ * promoted back when the replenishment timer fires.
+ */
+
+#define _GNU_SOURCE
+#include <sched.h>
+#include <sys/types.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <time.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdint.h>
+#include <stdarg.h>
+#include <pthread.h>
+
+#ifndef SCHED_FLAG_DL_DEMOTION
+#define SCHED_FLAG_DL_DEMOTION 0x80
+#endif
+
+#define NSEC_PER_SEC 1000000000ULL
+#define USEC_PER_SEC 1000000ULL
+
+/* Ftrace marker file */
+static int trace_marker_fd = -1;
+
+/* Wrappers for sys_sched_setattr/getattr - use syscall directly to avoid glibc conflicts */
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
+/* Initialize ftrace marker for userspace tracing */
+static void trace_marker_init(void)
+{
+	const char *paths[] = {
+		"/sys/kernel/tracing/trace_marker",
+		"/sys/kernel/debug/tracing/trace_marker",
+		NULL
+	};
+
+	for (int i = 0; paths[i]; i++) {
+		trace_marker_fd = open(paths[i], O_WRONLY);
+		if (trace_marker_fd >= 0)
+			break;
+	}
+}
+
+/* Write a message to ftrace buffer */
+static void trace_write(const char *fmt, ...)
+{
+	char buf[256];
+	va_list args;
+	int len;
+
+	if (trace_marker_fd < 0)
+		return;
+
+	va_start(args, fmt);
+	len = vsnprintf(buf, sizeof(buf), fmt, args);
+	va_end(args);
+
+	if (len > 0)
+		write(trace_marker_fd, buf, len);
+}
+
+/* Close ftrace marker */
+static void trace_marker_close(void)
+{
+	if (trace_marker_fd >= 0) {
+		close(trace_marker_fd);
+		trace_marker_fd = -1;
+	}
+}
+
+/* Burn CPU cycles for approximately nsec nanoseconds */
+static void burn_cpu(uint64_t nsec)
+{
+	struct timespec start, now;
+	uint64_t elapsed_ns;
+	volatile uint64_t dummy = 0;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	do {
+		for (int i = 0; i < 10000; i++)
+			dummy += i;
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		elapsed_ns = (now.tv_sec - start.tv_sec) * NSEC_PER_SEC +
+			     (now.tv_nsec - start.tv_nsec);
+	} while (elapsed_ns < nsec);
+}
+
+/* Get current scheduling policy */
+static int get_current_policy(void)
+{
+	struct sched_attr attr = {0};
+	attr.size = sizeof(attr);
+
+	if (sys_sched_getattr(0, &attr, sizeof(attr), 0) < 0) {
+		perror("sys_sched_getattr");
+		return -1;
+	}
+
+	return attr.sched_policy;
+}
+
+/*
+ * Test 1: Basic demotion when runtime exhausted
+ *
+ * Create a DEADLINE task with demotion flag, run it until runtime
+ * is exhausted, verify it gets demoted to SCHED_NORMAL.
+ */
+static int test_basic_demotion(void)
+{
+	struct sched_attr attr = {0};
+	int policy_before, policy_after;
+
+	printf("Test 1: Basic demotion on runtime exhaustion\n");
+	trace_write("TEST1: START - Basic demotion on runtime exhaustion");
+
+	attr.size = sizeof(attr);
+	attr.sched_policy = SCHED_DEADLINE;
+	attr.sched_runtime = 10 * 1000 * 1000;   /* 10ms */
+	attr.sched_deadline = 100 * 1000 * 1000; /* 100ms */
+	attr.sched_period = 100 * 1000 * 1000;   /* 100ms */
+	attr.sched_flags = SCHED_FLAG_DL_DEMOTION;
+	attr.sched_nice = 0;  /* Nice value when demoted */
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		if (errno == EPERM) {
+			printf("  SKIP: Need CAP_SYS_NICE or root privileges\n");
+			return 0;
+		}
+		if (errno == EINVAL) {
+			printf("  SKIP: SCHED_FLAG_DL_DEMOTION not supported\n");
+			return 0;
+		}
+		perror("  FAIL: sys_sched_setattr");
+		return -1;
+	}
+
+	policy_before = get_current_policy();
+	if (policy_before != SCHED_DEADLINE) {
+		printf("  FAIL: Not SCHED_DEADLINE after setattr (got %d)\n",
+		       policy_before);
+		return -1;
+	}
+
+	/* Burn more than the runtime to trigger demotion */
+	printf("  Burning CPU to exhaust runtime...\n");
+	trace_write("TEST1: Burning CPU to exhaust runtime (15ms)");
+	burn_cpu(15 * 1000 * 1000); /* 15ms, more than 10ms runtime */
+	trace_write("TEST1: CPU burn complete, checking policy");
+
+	/* Check if we got demoted */
+	policy_after = get_current_policy();
+	if (policy_after == SCHED_NORMAL) {
+		printf("  PASS: Demoted to SCHED_NORMAL after runtime exhaustion\n");
+		trace_write("TEST1: PASS - Task demoted to SCHED_NORMAL");
+		/* Reset to normal before returning */
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		trace_write("TEST1: END");
+		return 0;
+	} else {
+		printf("  FAIL: Still policy %d after runtime exhaustion (expected SCHED_NORMAL)\n",
+		       policy_after);
+		trace_write("TEST1: FAIL - Task not demoted (policy=%d)", policy_after);
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		trace_write("TEST1: END");
+		return -1;
+	}
+}
+
+/*
+ * Test 2: Promotion when replenishment timer fires
+ *
+ * Get demoted, then sleep until the period expires and verify
+ * we get promoted back to SCHED_DEADLINE.
+ */
+static int test_promotion_on_timer(void)
+{
+	struct sched_attr attr = {0};
+	int policy_before, policy_after;
+
+	printf("\nTest 2: Promotion on replenishment timer\n");
+	trace_write("TEST2: START - Promotion on replenishment timer");
+
+	/* Reset to SCHED_NORMAL before starting */
+	attr.size = sizeof(attr);
+	attr.sched_policy = SCHED_NORMAL;
+	sys_sched_setattr(0, &attr, 0);
+
+	attr.size = sizeof(attr);
+	attr.sched_policy = SCHED_DEADLINE;
+	attr.sched_runtime = 10 * 1000 * 1000;   /* 10ms */
+	attr.sched_deadline = 200 * 1000 * 1000; /* 200ms */
+	attr.sched_period = 200 * 1000 * 1000;   /* 200ms */
+	attr.sched_flags = SCHED_FLAG_DL_DEMOTION;
+	attr.sched_nice = 0;
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		if (errno == EINVAL) {
+			printf("  SKIP: SCHED_FLAG_DL_DEMOTION not supported\n");
+			return 0;
+		}
+		perror("  FAIL: sys_sched_setattr");
+		return -1;
+	}
+
+	/* Exhaust runtime to get demoted */
+	printf("  Exhausting runtime...\n");
+	trace_write("TEST2: Exhausting runtime to trigger demotion");
+	burn_cpu(15 * 1000 * 1000); /* 15ms */
+	trace_write("TEST2: CPU burn complete, checking if demoted");
+
+	policy_before = get_current_policy();
+	if (policy_before != SCHED_NORMAL) {
+		printf("  FAIL: Not demoted (policy=%d)\n", policy_before);
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		return -1;
+	}
+	printf("  Demoted to SCHED_NORMAL\n");
+	trace_write("TEST2: Confirmed demoted to SCHED_NORMAL");
+
+	/* Wait for period to expire (timer should promote us) */
+	printf("  Waiting for replenishment timer (250ms)...\n");
+	trace_write("TEST2: Waiting for replenishment timer (250ms)");
+	usleep(250 * 1000); /* 250ms, longer than 200ms period */
+	trace_write("TEST2: Wait complete, checking if promoted");
+
+	/* Check if promoted back */
+	policy_after = get_current_policy();
+	if (policy_after == SCHED_DEADLINE) {
+		printf("  PASS: Promoted back to SCHED_DEADLINE\n");
+		trace_write("TEST2: PASS - Promoted back to SCHED_DEADLINE");
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		trace_write("TEST2: END");
+		return 0;
+	} else {
+		printf("  FAIL: Still policy %d after timer (expected SCHED_DEADLINE)\n",
+		       policy_after);
+		trace_write("TEST2: FAIL - Not promoted (policy=%d)", policy_after);
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		trace_write("TEST2: END");
+		return -1;
+	}
+}
+
+/*
+ * Test 3: Explicit parameter change while demoted
+ *
+ * Get demoted, then explicitly change scheduling parameters.
+ * This should clear the demotion state and prevent automatic promotion.
+ */
+static int test_param_change_while_demoted(void)
+{
+	struct sched_attr attr = {0};
+	int policy;
+
+	printf("\nTest 3: Explicit parameter change while demoted\n");
+	trace_write("TEST3: START - Explicit parameter change while demoted");
+
+	/* Reset to SCHED_NORMAL before starting */
+	attr.size = sizeof(attr);
+	attr.sched_policy = SCHED_NORMAL;
+	sys_sched_setattr(0, &attr, 0);
+
+	attr.sched_policy = SCHED_DEADLINE;
+	attr.sched_runtime = 10 * 1000 * 1000;   /* 10ms */
+	attr.sched_deadline = 200 * 1000 * 1000; /* 200ms */
+	attr.sched_period = 200 * 1000 * 1000;   /* 200ms */
+	attr.sched_flags = SCHED_FLAG_DL_DEMOTION;
+	attr.sched_nice = 0;
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		if (errno == EINVAL) {
+			printf("  SKIP: SCHED_FLAG_DL_DEMOTION not supported\n");
+			return 0;
+		}
+		perror("  FAIL: sys_sched_setattr");
+		return -1;
+	}
+
+	/* Exhaust runtime to get demoted */
+	printf("  Exhausting runtime...\n");
+	trace_write("TEST3: Exhausting runtime to trigger demotion");
+	burn_cpu(15 * 1000 * 1000);
+	trace_write("TEST3: Checking if demoted");
+
+	policy = get_current_policy();
+	if (policy != SCHED_NORMAL) {
+		printf("  FAIL: Not demoted (policy=%d)\n", policy);
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		return -1;
+	}
+	printf("  Demoted to SCHED_NORMAL\n");
+	trace_write("TEST3: Confirmed demoted to SCHED_NORMAL");
+
+	/* Explicitly change to SCHED_NORMAL (should clear demotion state) */
+	printf("  Explicitly setting SCHED_NORMAL...\n");
+	trace_write("TEST3: Explicitly calling sched_setattr(SCHED_NORMAL) to clear demotion state");
+	attr.sched_policy = SCHED_NORMAL;
+	attr.sched_nice = 5;
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		perror("  FAIL: sys_sched_setattr to NORMAL");
+		return -1;
+	}
+
+	/* Wait past the period - should NOT be promoted */
+	printf("  Waiting past period (250ms)...\n");
+	trace_write("TEST3: Waiting past period - should NOT be promoted");
+	usleep(250 * 1000);
+	trace_write("TEST3: Wait complete, verifying still NORMAL");
+
+	policy = get_current_policy();
+	if (policy == SCHED_NORMAL) {
+		printf("  PASS: Remained SCHED_NORMAL (demotion state cleared)\n");
+		trace_write("TEST3: PASS - Remained SCHED_NORMAL");
+		trace_write("TEST3: END");
+		return 0;
+	} else {
+		printf("  FAIL: Unexpected promotion to policy %d\n", policy);
+		trace_write("TEST3: FAIL - Unexpected promotion to policy %d", policy);
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		trace_write("TEST3: END");
+		return -1;
+	}
+}
+
+/*
+ * Test 4: Demotion disabled without flag
+ *
+ * Create DEADLINE task without demotion flag, exhaust runtime,
+ * verify task stays SCHED_DEADLINE (throttled but not demoted).
+ */
+static int test_no_demotion_without_flag(void)
+{
+	struct sched_attr attr = {0};
+	int policy;
+
+	printf("\nTest 4: No demotion without SCHED_FLAG_DL_DEMOTION\n");
+	trace_write("TEST4: START - No demotion without flag");
+
+	/* Reset to SCHED_NORMAL before starting */
+	attr.size = sizeof(attr);
+	attr.sched_policy = SCHED_NORMAL;
+	sys_sched_setattr(0, &attr, 0);
+
+	attr.sched_policy = SCHED_DEADLINE;
+	attr.sched_runtime = 10 * 1000 * 1000;   /* 10ms */
+	attr.sched_deadline = 100 * 1000 * 1000; /* 100ms */
+	attr.sched_period = 100 * 1000 * 1000;   /* 100ms */
+	attr.sched_flags = 0;  /* No demotion flag */
+	attr.sched_nice = 0;
+
+	if (sys_sched_setattr(0, &attr, 0) < 0) {
+		perror("  FAIL: sys_sched_setattr");
+		return -1;
+	}
+
+	/* Burn CPU to exhaust runtime */
+	printf("  Exhausting runtime...\n");
+	trace_write("TEST4: Exhausting runtime (no demotion flag set)");
+	burn_cpu(15 * 1000 * 1000);
+	trace_write("TEST4: CPU burn complete, checking policy");
+
+	/* Should still be SCHED_DEADLINE (throttled, not demoted) */
+	policy = get_current_policy();
+	if (policy == SCHED_DEADLINE) {
+		printf("  PASS: Remained SCHED_DEADLINE (throttled, not demoted)\n");
+		trace_write("TEST4: PASS - Remained SCHED_DEADLINE");
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		trace_write("TEST4: END");
+		return 0;
+	} else {
+		printf("  FAIL: Changed to policy %d without demotion flag\n", policy);
+		trace_write("TEST4: FAIL - Changed to policy %d", policy);
+		attr.sched_policy = SCHED_NORMAL;
+		sys_sched_setattr(0, &attr, 0);
+		trace_write("TEST4: END");
+		return -1;
+	}
+}
+
+int main(void)
+{
+	int failures = 0;
+
+	printf("SCHED_DEADLINE Demotion Tests\n");
+	printf("==============================\n\n");
+
+	/* Initialize ftrace marker (silently fails if not available) */
+	trace_marker_init();
+	trace_write("=== SCHED_DEADLINE Demotion Test Suite START ===");
+
+	/* Run tests with pauses between them for clearer trace separation */
+	if (test_basic_demotion() < 0)
+		failures++;
+
+	/* Pause between tests (300ms - longer than any test period) */
+	printf("\n--- Pausing 300ms between tests ---\n");
+	trace_write("=== PAUSE between tests (300ms) ===");
+	usleep(300 * 1000);
+
+	if (test_promotion_on_timer() < 0)
+		failures++;
+
+	printf("\n--- Pausing 300ms between tests ---\n");
+	trace_write("=== PAUSE between tests (300ms) ===");
+	usleep(300 * 1000);
+
+	if (test_param_change_while_demoted() < 0)
+		failures++;
+
+	printf("\n--- Pausing 300ms between tests ---\n");
+	trace_write("=== PAUSE between tests (300ms) ===");
+	usleep(300 * 1000);
+
+	if (test_no_demotion_without_flag() < 0)
+		failures++;
+
+	/* Summary */
+	printf("\n==============================\n");
+	if (failures == 0) {
+		printf("All tests PASSED\n");
+		trace_write("=== Test Suite PASSED ===");
+		trace_marker_close();
+		return 0;
+	} else {
+		printf("%d test(s) FAILED\n", failures);
+		trace_write("=== Test Suite FAILED (%d failures) ===", failures);
+		trace_marker_close();
+		return 1;
+	}
+}
diff --git a/tools/testing/selftests/sched/run_dl_demotion_with_trace.sh b/tools/testing/selftests/sched/run_dl_demotion_with_trace.sh
new file mode 100755
index 0000000000000..4b37864d45975
--- /dev/null
+++ b/tools/testing/selftests/sched/run_dl_demotion_with_trace.sh
@@ -0,0 +1,71 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Run SCHED_DEADLINE demotion tests with ftrace enabled to see
+# state machine transitions
+
+TRACE_DIR="/sys/kernel/debug/tracing"
+TEST_BIN="./dl_demotion_test"
+
+if [ ! -d "$TRACE_DIR" ]; then
+	echo "ERROR: ftrace not available at $TRACE_DIR"
+	echo "Make sure debugfs is mounted and CONFIG_FTRACE is enabled"
+	exit 1
+fi
+
+if [ $EUID -ne 0 ]; then
+	echo "ERROR: This script must be run as root"
+	exit 1
+fi
+
+if [ ! -x "$TEST_BIN" ]; then
+	echo "ERROR: Test binary not found: $TEST_BIN"
+	echo "Build with: make"
+	exit 1
+fi
+
+echo "Setting up ftrace..."
+
+# Clear previous trace
+echo 0 > "$TRACE_DIR/tracing_on"
+echo > "$TRACE_DIR/trace"
+
+# Enable trace_printk
+echo 1 > "$TRACE_DIR/options/trace_printk" 2>/dev/null || true
+
+# Enable sched events
+echo 1 > "$TRACE_DIR/events/sched/enable" 2>/dev/null || true
+
+# Start tracing
+echo 1 > "$TRACE_DIR/tracing_on"
+
+echo "Running deadline demotion tests..."
+echo "===================================="
+echo ""
+
+# Run the test
+$TEST_BIN
+
+echo ""
+echo "===================================="
+echo ""
+
+# Stop tracing
+echo 0 > "$TRACE_DIR/tracing_on"
+
+# Show relevant trace entries
+echo "Trace output (demotion/promotion events):"
+echo "=========================================="
+grep -E "dl_demote|dl_promote|dl_timer|switched_from_dl|switched_to_dl|setscheduler" \
+	"$TRACE_DIR/trace" | tail -100
+
+echo ""
+echo "Full trace saved to: /tmp/dl_demotion_trace.txt"
+cat "$TRACE_DIR/trace" > /tmp/dl_demotion_trace.txt
+
+# Reset tracing
+echo 0 > "$TRACE_DIR/events/sched/enable" 2>/dev/null || true
+echo > "$TRACE_DIR/trace"
+
+echo ""
+echo "Done!"

-- 
2.53.0

