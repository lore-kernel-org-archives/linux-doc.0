Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEE34E744
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016031; cv=none; b=SbVdPFmT1Ka1p/1rZJWp9zLU/VJd6g/GNEiaNBvIZZOAI91ndRoNl2E5oCACAA7DyR642LjCi8EE5A0EV9HgMPm+iCCHLG7Ks7XFIq0YwnCq8Ig9k9gvYqoK9uwxBD+cA0OMnmNbp1ClT2THfpvESyUV+urXsRiqAafsWhrQiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016031; c=relaxed/simple;
	bh=MpqHY1226EZDlsL7AYrF9I24rCLFkLMgGMHa7jjWFqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GU34kVRHVa2138ilDMINiLVeKbJyyypKIRQG08rxGYEI6R2o7mHTbwsOXcBkianYTVnNiK1cik6GJ+8RI91hy8Br57rmdEZ0crHi6K4oo97K7jAfnre+IaSj1zkAi7LbFWe6P5GTJGE6l8aWwvkuecmYTDiZg2pd+QJUOaUmRB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFMfn8AQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFMfn8AQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so46488255e9.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016028; x=1781620828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nUZrv+uXShy5oUjVbWJnHpZlIUPoN1ZejbvjYmlEBM=;
        b=wFMfn8AQKgwPpf5kmqGxAb0QgWyosBDa1ZDJV7wREiSG4Uf3LdikSWBpt3LPJJpEgd
         moI0WehV1RUARu8IQjSnqHbxPAg8lxgxSf8rm8OV0UeuZSmj/qGcJA5M62Jrm4Xi+afw
         Qedi37QSfLty+a4elrO7pRBTgNaHmGZAwyEbvrU6cij/f67fZ4wPwMkWWJSn5w5pwffG
         90gsdyOu4+LbL83t5ipiP+pjwbZ3UwLFn2RxxDPcYRUyu8l6XX5waa1uk2C/vxUPW/2r
         dP9mg6LqIKHEgSaP3B9uop6Vn9rLxXmgLFYGF7KSR7to5q5FIUpGmC6Dj3ZppQ4iyrUy
         uAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016028; x=1781620828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9nUZrv+uXShy5oUjVbWJnHpZlIUPoN1ZejbvjYmlEBM=;
        b=hkYfH1IJsLDmhId5JeWBulqRurKr5kMG50SLgcgAxKVWLnjNEWwQSlSn8wirOnUQAU
         XcuF+xWCB3YGGDaqgrITrzPjEZMo6BZESjO/NYoTHYpwKVrZpZushQ+BgtF/VqbpbGYL
         I88FaO1Kv1M7e4Aat5rGaEEhWISGpdpVCvX0HaRy8ZlkGqxWEshMapKqy5cVnzkqlDtO
         p9UdS1l9Xgf+Xq7Q19It56SbF4wTAUTHCrtESBLm6xqqzWT2VhG42hrh1HqSWSdP9MH2
         7ZyK/+paLNPEiL+5F1kOPnIlKiT7CAv02qbPNDTYoruOuWM6zlxEYTq3sgZG+/nQBCDs
         uXqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rVTHRXmrnCqNF2ZezunlzrwNRWJReKF7jiHK6NEvnvPHeTkugZlcL2PFow+z5S2xbVLhwKaCYr54=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmU0k17MzFDoivEOURLqJqkIoPyrGRQ0syYYfoZIBPRExsDTE
	Lp75q7vCgKX4n50CfH4kIo12cJkWFMmW+Y9yoi6d1gFvQZUzOwnKV+KnhdtNW1PPKT4=
X-Gm-Gg: Acq92OFCFCIlyfJdcmaXSfQwr52STbqJ4L8Kfos1kl32edHMpg3iNIfujiP9hMQAMDs
	HAHyJwEwEZmb4L6BJi76oeFbUludZqAGDAKPcge8wn1jOeWN+ZPv9+SmFuOHOLbZytn5ZXvvdYG
	lpTguNm6/llVvAWD267mXBVGF7q579MNmEfG6VB4OmNtoV/7d6wJsNXAYi8STek3A476hOnRs8G
	krjmB96RBXmyKXfdhhh1FGjUOehivsmzUU+tFXrZ7zfLBp9RX6x+jpKsghLEIRVaighcB7PW4G4
	HgLrpDj8GnxxPR5kcLMbASF4vfFNsbf7csAI8RElwjrExCTnoKV58Rc7P66StN87QwtD7Coom2X
	hMiP5vTQxtuLqGsyNM1BRlDgQ0zJEPkV1f33a6wfRq5yUewdBlnzO9d8LWAemPsdmXoSuwCD2TA
	tLbTvAiFj2qDxkyQipIESLt5kwtgRMilqlTJsS6pt0ijI=
X-Received: by 2002:a05:600c:35d4:b0:490:b8d3:5dcc with SMTP id 5b1f17b1804b1-490c25e4634mr350034245e9.19.1781016027564;
        Tue, 09 Jun 2026 07:40:27 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:08 +0100
Subject: [PATCH v5 03/19] perf test: Add a workload that forces context
 switches
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-3-d53a7d096a19@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
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
 tools/perf/Documentation/perf-test.txt           |   7 +-
 tools/perf/tests/builtin-test.c                  |   1 +
 tools/perf/tests/tests.h                         |   1 +
 tools/perf/tests/workloads/Build                 |   1 +
 tools/perf/tests/workloads/context_switch_loop.c | 110 +++++++++++++++++++++++
 5 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 2f4a91f5b9dc..213eb62603eb 100644
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
index 86ea427eb0aa..9284f897de3c 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -163,6 +163,7 @@ static struct test_workload *workloads[] = {
 	&workload__traploop,
 	&workload__inlineloop,
 	&workload__jitdump,
+	&workload__context_switch_loop,
 
 #ifdef HAVE_RUST_SUPPORT
 	&workload__code_with_type,
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index bf8ff7d54727..7cd4da4e96d3 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -245,6 +245,7 @@ DECLARE_WORKLOAD(landlock);
 DECLARE_WORKLOAD(traploop);
 DECLARE_WORKLOAD(inlineloop);
 DECLARE_WORKLOAD(jitdump);
+DECLARE_WORKLOAD(context_switch_loop);
 
 #ifdef HAVE_RUST_SUPPORT
 DECLARE_WORKLOAD(code_with_type);
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index 0eb6d99528eb..7134a031cb7c 100644
--- a/tools/perf/tests/workloads/Build
+++ b/tools/perf/tests/workloads/Build
@@ -10,6 +10,7 @@ perf-test-y += landlock.o
 perf-test-y += traploop.o
 perf-test-y += inlineloop.o
 perf-test-y += jitdump.o
+perf-test-y += context_switch_loop.o
 
 ifeq ($(CONFIG_RUST_SUPPORT),y)
     perf-test-y += code_with_type.o
diff --git a/tools/perf/tests/workloads/context_switch_loop.c b/tools/perf/tests/workloads/context_switch_loop.c
new file mode 100644
index 000000000000..5431af6147e6
--- /dev/null
+++ b/tools/perf/tests/workloads/context_switch_loop.c
@@ -0,0 +1,110 @@
+
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
+			return 1; \
+	} while (0)
+
+#define read_block(fd) \
+	do { \
+		if (read(fd, &buf, 1) <= 0) \
+			return 1; \
+	} while (0)
+
+/* Not static to avoid LTO clobbering the function name */
+int context_switch_loop_proc1(int in_fd, int out_fd);
+int context_switch_loop_proc1(int in_fd, int out_fd)
+{
+	for (int i = 0; i < loops; i++) {
+		read_block(in_fd);
+		context_switch_loop_work += i * 3;
+		write_block(out_fd);
+	}
+	return 0;
+}
+
+int context_switch_loop_proc2(int in_fd, int out_fd);
+int context_switch_loop_proc2(int in_fd, int out_fd)
+{
+	for (int i = 0; i < loops; i++) {
+		write_block(out_fd);
+		context_switch_loop_work += i * 7;
+		read_block(in_fd);
+	}
+	return 0;
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
+	int ret;
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
+		ret = context_switch_loop_proc1(b_to_a[0], a_to_b[1]);
+		close(a_to_b[1]);
+		close(b_to_a[0]);
+		exit(ret);
+	}
+
+	close(a_to_b[1]);
+	close(b_to_a[0]);
+	prctl(PR_SET_NAME, "proc2", 0, 0, 0);
+	ret = context_switch_loop_proc2(a_to_b[0], b_to_a[1]);
+	close(a_to_b[0]);
+	close(b_to_a[1]);
+
+	if (ret) {
+		kill(proc1_pid, SIGKILL);
+		return ret;
+	}
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

