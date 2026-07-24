Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F274908B7;
	Fri, 24 Jul 2026 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876837; cv=none; b=B3joCiDJCu/GbXl6zpCg4X6DZ2JNRkz+LMCGi4iKnibBtfDP92X6SlB6wtlEE6A26qo69Nof2xHVmK5olsnzXiFCA70TT5jHUL+W/MpktDQbTJUKuZi7NvhpnmtKhaV9VzL/mVL6dAS8VPWCZlMnbQ7d41J2VRSUk1y1Wgg5KnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876837; c=relaxed/simple;
	bh=7UUh8bclcRyme2mbvyKJ6Ap40+Lkcnh1K9H1O+kpXtE=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=Cpjtf4QC8L+o/gqfGg+B//v6P8uFnTU0hL+NZTLwC1EsiMXqqYUlqPxSFyLgr+SQ9V7qBI4a+XwFHwIM71vboHNOxv14s7qRCq51/h/rk80GRMPvpvr2iZvNX/n/hHcZCXIIpyIJIFF40Iv4TB38NO1zYVXAveS16GZJsxgsHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4h5zZN5x7Hz57KTp;
	Fri, 24 Jul 2026 15:07:08 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 66O76xGu060859;
	Fri, 24 Jul 2026 15:06:59 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 24 Jul 2026 15:07:00 +0800 (CST)
X-Zmail-TransId: 2afb6a630f14daa-b6394
X-Mailer: Zmail v1.0
Message-ID: <20260724150700955ST0xNghN8r7XiXr9PfwXH@zte.com.cn>
In-Reply-To: <2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn>
References: 2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn
Date: Fri, 24 Jul 2026 15:07:00 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIHY0IDIvM10gdG9vbHMvYWNjb3VudGluZzogZmFjdG9yIG91dCBzaGFyZWQgZm9ybWF0X3RpbWVzcGVjKCkgaW1wbGVtZW50YXRpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 66O76xGu060859
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 24 Jul 2026 15:07:08 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A630F1C.003/4h5zZN5x7Hz57KTp

From: Wang Yaxin <wang.yaxin@zte.com.cn>

The same __kernel_timespec formatting logic existed independently in
both getdelays.c and delaytop.c with minor differences (strftime vs
snprintf, __kernel_time64_t vs time_t).

Create a shared format_timespec.c/h with a canonical implementation
(strftime + time_t), remove the static copies from both files, and
link both programs against the common object.

Also simplify the Makefile with a pattern rule for %.o and a static
pattern rule for the two programs that need format_timespec.o.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Acked-by: Xu Xin <xu.xin16@zte.com.cn>
---
 tools/accounting/Makefile             | 12 ++++++-
 tools/accounting/delaytop.c           | 39 ++------------------
 tools/accounting/format_timespec.c    | 39 ++++++++++++++++++++
 tools/accounting/format_timespec.h    |  9 +++++
 tools/accounting/getdelays.c          | 32 ++---------------
 tools/include/uapi/linux/time_types.h | 51 +++++++++++++++++++++++++++
 6 files changed, 115 insertions(+), 67 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h
 create mode 100644 tools/include/uapi/linux/time_types.h

diff --git a/tools/accounting/Makefile b/tools/accounting/Makefile
index 007c0bb8cbbb..5224e03f5e94 100644
--- a/tools/accounting/Makefile
+++ b/tools/accounting/Makefile
@@ -3,8 +3,18 @@ CC := $(CROSS_COMPILE)gcc
 CFLAGS := -I../include/uapi/

 PROGS := getdelays procacct delaytop
+OBJS := format_timespec.o

 all: $(PROGS)

+getdelays delaytop: %: %.o $(OBJS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+
+procacct: procacct.o
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+
+%.o: %.c
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
+
 clean:
-	rm -fr $(PROGS)
+	rm -fr $(PROGS) *.o
diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index f1d26ff98792..1144ca325447 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -44,6 +44,8 @@
 #include <linux/cgroupstats.h>
 #include <stddef.h>

+#include "format_timespec.h"
+
 #define PSI_PATH	"/proc/pressure"
 #define PSI_CPU_PATH	"/proc/pressure/cpu"
 #define PSI_MEMORY_PATH	"/proc/pressure/memory"
@@ -817,41 +819,6 @@ static double average_ms(unsigned long long total, unsigned long long count)
 	return (double)total / 1000000.0 / count;
 }

-/*
- * Format __kernel_timespec to human readable string (YYYY-MM-DDTHH:MM:SS)
- * Returns formatted string or "N/A" if timestamp is zero
- */
-static const char *format_kernel_timespec(struct __kernel_timespec *ts)
-{
-	static char buffer[32];
-	time_t time_sec;
-	struct tm tm_info;
-
-	/* Check if timestamp is zero (not set) */
-	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
-		return "N/A";
-
-	/* Avoid Y2038 truncation: check if timestamp fits in time_t on 32-bit platforms */
-	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
-	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
-		return "N/A";
-
-	time_sec = (time_t)ts->tv_sec;
-
-	if (localtime_r(&time_sec, &tm_info) == NULL)
-		return "N/A";
-
-	snprintf(buffer, sizeof(buffer), "%04d-%02d-%02dT%02d:%02d:%02d",
-		tm_info.tm_year + 1900,
-		tm_info.tm_mon + 1,
-		tm_info.tm_mday,
-		tm_info.tm_hour,
-		tm_info.tm_min,
-		tm_info.tm_sec);
-
-	return buffer;
-}
-
 /* Comparison function for sorting tasks */
 static int compare_tasks(const void *a, const void *b)
 {
@@ -1133,7 +1100,7 @@ static void display_results(int psi_ret)
 					&max_ms, &max_ts);

 			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
-				avg_ms, max_ms, format_kernel_timespec(&max_ts));
+				avg_ms, max_ms, format_timespec(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
 				TASK_AVG(tasks[i], MEM),
diff --git a/tools/accounting/format_timespec.c b/tools/accounting/format_timespec.c
new file mode 100644
index 000000000000..1dba50cac895
--- /dev/null
+++ b/tools/accounting/format_timespec.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Shared __kernel_timespec formatting for tools/accounting/
+ *
+ * Formats a __kernel_timespec to an ISO 8601 timestamp string
+ * (YYYY-MM-DDTHH:MM:SS). Returns "N/A" if the timestamp is zero
+ * or does not fit in time_t.
+ */
+#include <time.h>
+#include <linux/time_types.h>
+#include "format_timespec.h"
+
+const char *format_timespec(const struct __kernel_timespec *ts)
+{
+	static char buffer[32];
+	struct tm tm_info;
+	time_t time_sec;
+
+	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
+		return "N/A";
+
+	/*
+	 * On 32-bit platforms time_t is 32-bit and cannot represent
+	 * dates beyond Y2038.  The kernel timestamp is always 64-bit,
+	 * so reject values that would overflow.
+	 */
+	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
+	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
+		return "N/A";
+
+	time_sec = ts->tv_sec;
+
+	if (!localtime_r(&time_sec, &tm_info))
+		return "N/A";
+
+	strftime(buffer, sizeof(buffer), "%Y-%m-%dT%H:%M:%S", &tm_info);
+
+	return buffer;
+}
diff --git a/tools/accounting/format_timespec.h b/tools/accounting/format_timespec.h
new file mode 100644
index 000000000000..960496ebf5c2
--- /dev/null
+++ b/tools/accounting/format_timespec.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef FORMAT_TIMESPEC_H
+#define FORMAT_TIMESPEC_H
+
+#include <linux/time_types.h>
+
+const char *format_timespec(const struct __kernel_timespec *ts);
+
+#endif
diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index 6ac30d4f96f7..d3193f670d89 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -30,6 +30,8 @@
 #include <linux/taskstats.h>
 #include <linux/cgroupstats.h>

+#include "format_timespec.h"
+
 /*
  * Generic macros for dealing with netlink sockets. Might be duplicated
  * elsewhere. It is recommended that commercial grade applications use
@@ -221,36 +223,6 @@ static int get_family_id(int sd)
 #define average_ms(t, c) (t / 1000000ULL / (c ? c : 1))
 #define delay_ms(t) (t / 1000000ULL)

-/*
- * Format __kernel_timespec to human readable string (YYYY-MM-DD HH:MM:SS)
- * Returns formatted string or "N/A" if timestamp is zero
- */
-static const char *format_timespec(struct __kernel_timespec *ts)
-{
-	static char buffer[32];
-	struct tm tm_info;
-	__kernel_time_t time_sec;
-
-	/* Check if timestamp is zero (not set) */
-	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
-		return "N/A";
-
-	/* Avoid Y2038 truncation on 32-bit platforms */
-	if (sizeof(time_sec) < sizeof(ts->tv_sec) &&
-	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_sec) * 8 - 1)) - 1))
-		return "N/A";
-
-	time_sec = ts->tv_sec;
-
-	/* Use thread-safe localtime_r */
-	if (localtime_r(&time_sec, &tm_info) == NULL)
-		return "N/A";
-
-	strftime(buffer, sizeof(buffer), "%Y-%m-%dT%H:%M:%S", &tm_info);
-
-	return buffer;
-}
-
 /*
  * Version compatibility note:
  * Field availability depends on taskstats version (t->version),
diff --git a/tools/include/uapi/linux/time_types.h b/tools/include/uapi/linux/time_types.h
new file mode 100644
index 000000000000..8abdca230a54
--- /dev/null
+++ b/tools/include/uapi/linux/time_types.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _TOOLS_UAPI_LINUX_TIME_TYPES_H
+#define _TOOLS_UAPI_LINUX_TIME_TYPES_H
+
+#include <linux/types.h>
+#include <asm/posix_types.h>
+
+/*
+ * Copied from include/uapi/linux/time_types.h
+ *
+ * Uses the arch-dependent __kernel_long_t rather than a hardcoded
+ * 'long' so that x32 (ILP32 on x86_64), where the kernel defines
+ * __kernel_long_t as 'long long', gets the correct struct layout.
+ *
+ * __kernel_long_t is provided by <asm/posix_types.h> - included
+ * below via <linux/types.h> on most systems, or directly here.
+ */
+
+struct __kernel_timespec {
+	long long	tv_sec;
+	long long	tv_nsec;
+};
+
+struct __kernel_itimerspec {
+	struct __kernel_timespec it_interval;
+	struct __kernel_timespec it_value;
+};
+
+#ifndef __kernel_old_timeval
+struct __kernel_old_timeval {
+	__kernel_long_t		tv_sec;
+	__kernel_long_t		tv_usec;
+};
+#endif
+
+struct __kernel_old_timespec {
+	__kernel_long_t		tv_sec;
+	long			tv_nsec;
+};
+
+struct __kernel_old_itimerval {
+	struct __kernel_old_timeval it_interval;
+	struct __kernel_old_timeval it_value;
+};
+
+struct __kernel_sock_timeval {
+	__s64 tv_sec;
+	__s64 tv_usec;
+};
+
+#endif /* _TOOLS_UAPI_LINUX_TIME_TYPES_H */
-- 
2.27.0
