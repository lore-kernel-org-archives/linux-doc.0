Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3720299B
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015484; cv=none; b=RVNodVSIXPQ5sC5ILHBmfVXY4h4jTFioMLsq1IEXR0ccWzggM7ByA9MZWNTV76kDDsAwxKDeBOrFALIqrEJjyHgKYChPuv8VdcYqFq8SMeO4LxJGgodOKoB7nYTAqLqgMk6GniDym661ag0KOJOeWsL+Z8I+MdeBT+5/4xSBxpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015484; c=relaxed/simple;
	bh=MpqHY1226EZDlsL7AYrF9I24rCLFkLMgGMHa7jjWFqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N9HTCTRxpyEY2vrinQZ0LZdYCEM7WnRbCMHVKu1IsaamjXk1wWKFnm5Ey9Qar2OsOvhELNhSUNA/G59lSn2zeA1vgkFi4xAe/46Tx1UXpw74D1ZEf90ZCaZ0aUfATwKj0rQL6u8TiRl7bQJF51UxR+NJMjVDKnx8gc5Aci6tWfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZP/NePNW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZP/NePNW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5147816f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015480; x=1781620280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nUZrv+uXShy5oUjVbWJnHpZlIUPoN1ZejbvjYmlEBM=;
        b=ZP/NePNWLMRI/JPOMSuM6zmRGaAVXu+Z2MAJlyCzQbeD8x8YOeM2tO1kZaT8iCNBi9
         GfmD/1dG5zYsMCFTk4n+MoCiIPezZKoajOFmxu53311PQeqYLQgpvlPKVw27gsLE0plE
         DQM4dQLsZQeREo76JnWlmhRDL2rUXkFau+WN9/TpD//YyWOBDrKgR7sdgIgBDlktUVoN
         gE7hxlwaK0gngXqNFc2u6v7z6Od42B9TaajfTuXtf2aejbbSPdIj4rNe2F4VdZg+fX19
         4/HBROThrhabT/eUD0vMRD/QMvZtGGA9JvPmOzFUTrYSCKan7C23XAuJm5HYTy6OjwAq
         93Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015480; x=1781620280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9nUZrv+uXShy5oUjVbWJnHpZlIUPoN1ZejbvjYmlEBM=;
        b=mAjGaojgkZwypK152JV330m9BlVvrr8JscDlSXe5N2ahOwdJ1MNYFRKEcJcAH8IUPs
         KucMdK1hLIs1n+XyKsQfqvnYRwocsQfh3pizyavoCA9XSuTp6JamVgtT0xkkbxIKbo1v
         Aj+WK+5yxIvWXdZp5d5DN+SNs1U4GHC18o6JyAIWzzaN8Cl3mBs0WEg1fR+GhJ9Aq7vS
         DzHyAVGUp3P7m8J7DDVUYDkNcr2nHAHPTRpzxqJV/pDp/PgyvNZJQYNhQPTxd7tha7gF
         6MBfuGxCxqkJZ3YOWK1eYknFQ0bsnp7LgE5GLOWWLtsRWb00NJiZlQ0WmA4K/HcZgp0d
         DIew==
X-Forwarded-Encrypted: i=1; AFNElJ+fTzKTua53yoiU9LKWoE6cB/dNfJjtbFWj9+EW9hCYQDubOHPwuoUMt+Wyocces9khIw7HBxkoazk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78wMibGdE81lOeAYm8n2sMtzGC2vNNvgWdLDAyTmEiZtsoAsS
	PPm92Zwm02nynpVA1Y756AWZIZHF5OljgoRvy7e6mHCEn/qaVl7GdviXSXprAYCD2sj+diK7nwP
	xUp3LY2w=
X-Gm-Gg: Acq92OGPxEReJ3+oBaX/uo7LPEgJneFJptAycGiyo5hqoeFdOgqskx7nQLLNXh5fKeg
	l4/kmN1cRCob37YBlbvEOmBnR9UnwVZX7QxUU1IExq4B32puszi9xDMIEUCXOlcAk8bUJGinfpM
	k6hVv3XNcVheW+3eeuj1lFh1WgMcNR/9uQjGUWKv6uKkXyx1Ipc4eiu8+B2r3rXE0DRpwxMSbgo
	pZpYmvML0tQfvc7c+SqfPGIC4BlT2PdGxfCzWlQ2/W+WtYBpGt0p9EJ4r/j3WgHX5O4lrJ39SL6
	BoMvKpD0HVai3NZgRiWdIyFvZx0fLbrbKzgrinTb07ve9A6TV729RErMnuUUZ2lTXHBR8JUXP+t
	1CBFiSQsYjHiXKnY/2vbBb/SDri7ogrn5HcZG8/xkI48I/yfkPVQ9hZBDDXDpNpPR/hJTfiLSHn
	WwdiIbUFq01CxQLlN1BZvHqaoRunEqkMCjsP1dIBTmvWY=
X-Received: by 2002:adf:e30e:0:b0:460:1233:ecf2 with SMTP id ffacd0b85a97d-46030609798mr24080728f8f.30.1781015480385;
        Tue, 09 Jun 2026 07:31:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:30:56 +0100
Subject: [PATCH v4 03/19] perf test: Add a workload that forces context
 switches
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-3-44f9fb9e5c42@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
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

