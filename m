Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73239401A0A
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410448; cv=none; b=set5JiGnVk/r2TI0QrbxmB0hMXn3o4wc4zXSuDfIKETTlYs+Q2QnY8dVzkXBaTYCxOhfBMYdTT4PTFWNN703jSeqvzDt1apuLzxnr/8F2axpsWa5lEeqyS4/4yAjQfGTJYrftBuNJYr7zCaGcap8f6mt/7RuhmmfVA59CcPWHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410448; c=relaxed/simple;
	bh=nhbvUtvVfJ4XCxkw1g44IbixuAqwQ8Swfcda4PtYylk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2zhZ19d9EQ8kq7RA2ktntLunYAoeupkSLGKHprX2gNB1FlGjDkCvUvyLeyDkKGGnWAuX9yvP3tTi2a/yfJzGAcGn9Ds7IzqkLUxdVYUS843kw7kwkU8KsI4HJg480lqEZsp10VBYU1++IOKt/TjwoT6zn3tsVLEFYBDcNL/bAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJ2UfuQI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJ2UfuQI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so14171585e9.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410444; x=1781015244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AzHCCZdh7j2BBDmmO5WAtLEfltvQL21ELilOv+mRsY=;
        b=dJ2UfuQI2FggK7kFLlp1OrCDE2KPorv1zZiHEuIZHc0bZHAls0sZPrb8iRVkEkM0BR
         I28TlQ1tUc0FRZSpp4VZtjokmPL8gab5ynRs+9q+b2zGBevkgHXxo3FQ0RWsbj7BMOK5
         5xI38d+RS4TcL7jNkJBZf8jswSg4G2bajA+TmQiQ2EqwyeFlIdrVEATimXO/v+jmvfEJ
         1BCazO1DRd8B+NTvaKJ6fRWiSVnhcm1ZnFidZl/aBUxtA4/xEcZGyKfN/bW0nRigfCgh
         AaUeJoIOW2/liGJaJZc9u+s9mnyrFMla3WV0smh93ipOm5G/2Itw/rxnikQgmQ6gqa00
         GvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410444; x=1781015244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2AzHCCZdh7j2BBDmmO5WAtLEfltvQL21ELilOv+mRsY=;
        b=HQ4z+u+IPgDcX8Sy+nNb/3LB4tuqDsxMPFxnRiMySLysAPyjb124KValPKyNhpdMMZ
         tugC0dnoJQ3G3E281dnaXaNIeeuY/E0cIrmJRpDgX9zJkBZZ9wBxAa1YAqTj1d3isdEv
         s1IOnk6FU3g0oSdeZoMnuA1LC70W7eu3E0xheKdCD1zaurFfVXp60v9HoH64smMvZm1/
         KInCcv0EQSqHkC01MHgKxpreKzjS2OpBy7pgN37YL+DqzBnknV709Q0r63EnoXSZaT1Q
         8JcjzeCeOsxKSSFYfgCL8egqeHF3BXsZJ04zNosyHU7XpF5P2Da3hFEIv4bGG54uTOkC
         xgBg==
X-Forwarded-Encrypted: i=1; AFNElJ8apLVxvc8VDExVugvj7i4jP9pLao6iS+ZC8bnst6nQJ/gO13UsZhqBMW2dVdhGBaH/S/C4a02BxyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51e1iE3jFgvAXnS5qW8a2vxibO8oq/vTfdsHekYMopsmGmrb6
	ry1sSb3uDCvN5UnqnOKsHsSr6W4lL2RZAK3mekxye15QQaZrt5ibrdGKRcKYP+br80s=
X-Gm-Gg: Acq92OH2TcwFY/xjs3UKDGPVrmsJ/pE5xbnRYMNZ0U/WbD7kWyQWmspyWXiMskhUYVl
	C1b0jcP4ctq7aIGGxb9k4puUqYhcm7xwg8ah9Vxfutx1i6IqiDUxJbuWvNeTeFm22aTDrtK66Ih
	QQwSRXudnP4WGQNCdkUenHU758OthZHlQcbubXS4vT8ohAETWgdzUH1IJD2mPSojnNthURKcv11
	LQ5sBheEFszIjCMlRWGO55JT0Of/MiRv5B/S81kbKdscGwrAbl6nYk1XUiWQEwevh0SYvTk0fjc
	HB7XmRmaXvEJwU8Hcq8FOyLZ5jI81y2MsONcg4Emif6pQjYHidxl/74VrJxiSHVyBRixhGl3msT
	lI9c63xj4YSjGytdqG9njJqHe6cucwJld7odftE48ND3s5IVFVdkDgH46YQINxstYtZ/Yk3d8iU
	4LJ5XR7LMrmbOXbniRK5jClS9B27fVDWOQcPVbrwPjYfA=
X-Received: by 2002:a05:600c:8b57:b0:490:3c15:7146 with SMTP id 5b1f17b1804b1-490a5013670mr251592175e9.19.1780410443909;
        Tue, 02 Jun 2026 07:27:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:45 +0100
Subject: [PATCH v2 03/18] perf test: Add a workload that forces context
 switches
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-3-85b5ce6f55c6@linaro.org>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>
Cc: coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

This workload launches two processes that block when reading and writing
to each other forcing the other process to be scheduled for each
read/write pair.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt           |  7 +-
 tools/perf/tests/builtin-test.c                  |  1 +
 tools/perf/tests/tests.h                         |  1 +
 tools/perf/tests/workloads/Build                 |  1 +
 tools/perf/tests/workloads/context_switch_loop.c | 95 ++++++++++++++++++++++++
 5 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 1faf30d4a7be..9c0d7ac2bc64 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -55,15 +55,16 @@ OPTIONS
 
 -w::
 --workload=::
-	Run a built-in workload, to list them use '--list-workloads', current ones include:
-	noploop, thloop, leafloop, sqrtloop, brstack, datasym and landlock.
+	Run a built-in workload, to list them use '--list-workloads', current
+	ones include: noploop, thloop, leafloop, sqrtloop, brstack, datasym,
+	context_switch_loop and landlock.
 
 	Used with the shell script regression tests.
 
 	Some accept an extra parameter:
 
 		seconds: leafloop, noploop, sqrtloop, thloop
-		nrloops: brstack
+		nrloops: brstack, context_switch_loop
 
 	The datasym and landlock workloads don't accept any.
 
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index d5df3efdce3b..1057ee836c30 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -156,6 +156,7 @@ static struct test_workload *workloads[] = {
 	&workload__landlock,
 	&workload__traploop,
 	&workload__inlineloop,
+	&workload__context_switch_loop,
 
 #ifdef HAVE_RUST_SUPPORT
 	&workload__code_with_type,
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index ee00518bf36f..79f50bacfc94 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -242,6 +242,7 @@ DECLARE_WORKLOAD(datasym);
 DECLARE_WORKLOAD(landlock);
 DECLARE_WORKLOAD(traploop);
 DECLARE_WORKLOAD(inlineloop);
+DECLARE_WORKLOAD(context_switch_loop);
 
 #ifdef HAVE_RUST_SUPPORT
 DECLARE_WORKLOAD(code_with_type);
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index 2ef97f7affce..3bda6da04a35 100644
--- a/tools/perf/tests/workloads/Build
+++ b/tools/perf/tests/workloads/Build
@@ -9,6 +9,7 @@ perf-test-y += datasym.o
 perf-test-y += landlock.o
 perf-test-y += traploop.o
 perf-test-y += inlineloop.o
+perf-test-y += context_switch_loop.o
 
 ifeq ($(CONFIG_RUST_SUPPORT),y)
     perf-test-y += code_with_type.o
diff --git a/tools/perf/tests/workloads/context_switch_loop.c b/tools/perf/tests/workloads/context_switch_loop.c
new file mode 100644
index 000000000000..73bfcaeff5b0
--- /dev/null
+++ b/tools/perf/tests/workloads/context_switch_loop.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/compiler.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "../tests.h"
+
+static int loops = 100;
+static char buf;
+int context_switch_loop_work = 1234;
+
+#define write_block(fd) \
+	do { \
+		if (write(fd, &buf, 1) <= 0) \
+			exit(1); \
+	} while (0)
+
+#define read_block(fd) \
+	do { \
+		if (read(fd, &buf, 1) <= 0) \
+			exit(1); \
+	} while (0)
+
+/* Not static to avoid LTO clobbering the function name */
+void context_switch_loop_proc1(int in_fd, int out_fd);
+noinline void context_switch_loop_proc1(int in_fd, int out_fd)
+{
+	for (int i = 0; i < loops; i++) {
+		read_block(in_fd);
+		context_switch_loop_work += i * 3;
+		write_block(out_fd);
+	}
+}
+
+void context_switch_loop_proc2(int in_fd, int out_fd);
+noinline void context_switch_loop_proc2(int in_fd, int out_fd)
+{
+	for (int i = 0; i < loops; i++) {
+		write_block(out_fd);
+		context_switch_loop_work += i * 7;
+		read_block(in_fd);
+	}
+}
+
+/*
+ * Launches two processes that take turns to execute a multiplication N times
+ */
+static int context_switch_loop(int argc, const char **argv)
+{
+	int a_to_b[2], b_to_a[2];
+	pid_t proc1_pid;
+	int status;
+
+	if (argc > 0) {
+		loops = atoi(argv[0]);
+		if (loops < 0) {
+			fprintf(stderr, "Invalid number of loops: %s\n", argv[0]);
+			return 1;
+		}
+	}
+
+	if (pipe(a_to_b) || pipe(b_to_a)) {
+		perror("Pipe error");
+		return 1;
+	}
+
+	proc1_pid = fork();
+	if (proc1_pid < 0) {
+		perror("Fork error");
+		return 1;
+	}
+
+	if (!proc1_pid) {
+		close(a_to_b[0]);
+		close(b_to_a[1]);
+		prctl(PR_SET_NAME, "proc1", 0, 0, 0);
+		context_switch_loop_proc1(b_to_a[0], a_to_b[1]);
+		exit(0);
+	}
+
+	prctl(PR_SET_NAME, "proc2", 0, 0, 0);
+	context_switch_loop_proc2(a_to_b[0], b_to_a[1]);
+
+	if (waitpid(proc1_pid, &status, 0) != proc1_pid || !WIFEXITED(status) ||
+	    WEXITSTATUS(status))
+		return 1;
+
+	return 0;
+}
+
+DEFINE_WORKLOAD(context_switch_loop);

-- 
2.34.1

