Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCCB44E027
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481860; cv=none; b=T+MCW7BNgTolzbulrp847GNFZmlb+WU4R9UaBdRczVVljnVn+8sssM0JlRksYuSqnQ9Y8R4zcJlp0oUqY5CGhKyPJhh/pgk/8nNuCUJBm9O2hxR8BcOOr6EkRpURU+ZdG9VVu8yB2R+2YKQqPrCsmuz+4sRoT0ShlzudC2JU2m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481860; c=relaxed/simple;
	bh=f7nYZOjqRymoF8HLdou2qxt3lFfZBlP2peDzjQpRTcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSY40eXt4EM2dZQhOZ3me6ssARv/qUgoftp+XjvTwMH4kwpBPgkinxXBhCQEjP1mtgEDViYDTAlBjR4z0I43eHDOl4WTh+pYjOjqro6lAaxX5Cj77UWaVVihpN0Z+jDvIqv9khrjema02lJXLyu4JWU0RlqbY3uS8WTswhkv8l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEnahXil; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEnahXil"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45fd45e596cso2087034f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481852; x=1781086652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfmfQz4GZFVkBiOlSPmMGw2k+07TI77rK2unIhsiSv4=;
        b=QEnahXilFEZNlerG7QjRhF6wmmc29cowLUHh9dP0zFnenw746LHgktPY1LmIXbdLnm
         mz+LwJX/hQ8dSuGGjyJpmk31XyVwgdcDmxm9kn/VH3guKZ1yAfxG+o+3IclHaIfKpkaV
         bAHzx2SmtsJqez4axkXoo6QNQpEYtSSPUCODg8q+nkEW7mW+8hUlBVMKZkrqIqsTyhoF
         SSuWcAgzcjrUO3ujpvqgxtYptz1BsEBha8mYZKPSjcC244bkgfupgywiRhAbvXVjCICq
         VlXG7DgxxWSnSHXmI+LIXbgLVr4L1QJHd1OjDuZP1Pn3P4TVr2k+kfAHUjJSXCGO9akT
         Y0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481852; x=1781086652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mfmfQz4GZFVkBiOlSPmMGw2k+07TI77rK2unIhsiSv4=;
        b=omB7RMrLvWuzLqtMYHOV0cJIRXIB1uRDcEYGyqNbCD628Zvei+oPWdc0HMF1HLIhwj
         HgokaiwDBeoS/E4eLmIjdKLYIg38Evwlozm5KxpW9YutvZ+VQ29Hto7S8ZmxZvuJ9lxO
         D7FVXHYMOa9fpjkB75qXDdr50gjEgbgv9g9cy1kRE6xzHqn63taqo6Z/aC/ykIIg0L7/
         3JI+XmlRwHV+tRnSz3F2l4HAZu80Uwdq3jmEoYYKy6Tl55alrFHcdWwys3MypsEiIbq9
         g9zHB8hUDAavrR5odXgDQ9DPe8fmRN87deWgtF3JtqGiMYHpdgWuyaPlzB2I5pcBD0GT
         bb8w==
X-Forwarded-Encrypted: i=1; AFNElJ8AIUFacKN9TT3o5iPZvQWle2/87/fpAPw+3AkPmnGCCc7Zo/fNFmNkrVYguQqrgOdR27ZM9r5odjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+iTnGMWGM8o3bvh8uPKKBwwIT5DEgXTIZy3bitmcd6X9C+GP
	y9Ftgho1lC5OcwpTQ4lesXSj68P5eR18yUz54b2gqf+qiAtOLYwVDOqxaSgRDjmTAfY=
X-Gm-Gg: Acq92OE5hdTzBmKFD+I9MCYcJ1lwgXCRys+hA5lVsZWg3F+etGMy6PlaTnSmZ6LzQ2P
	YoydXpZ+e2cEHlx6LRhPivTXdFcav+YdyIVx0WfNKQu0R72fieilKsWYzgwJvSdY6Kj8tKvsR/E
	0nF4Xv+NIMAWnKM/2ot6VjN8WEI+/xas21JgkSP197AVw6goX5Yijv6Haw0g9rbrN5ezzrBqNGz
	sPXqe1+rJ/7sPaGhH6iV+vYTNyBt82l7nkz2xhXwjzkyZ+hj/3AnN9bUuax7XDs8biRxVPf49pb
	zf9WTRaf4e+XVxjeZ1ol2klpIx0Al/C3YjMGbTEAKTyOEB9PKy+guowMOPLHDyKs+w7F2tVd1vh
	XQ66NIkXLLqV+Rfaz1dpagu4mc96Ie5Ixb/cA//NXvzCpL8+qS/KxGCm9VcSfY8XUE81fHjmer9
	e4veQp2rwSDKhfWpdZ/7YwlO/RIp84oVe3qqxj7K/NTQ4=
X-Received: by 2002:a05:600c:630f:b0:490:b025:f324 with SMTP id 5b1f17b1804b1-490b60e41a8mr46919575e9.32.1780481851759;
        Wed, 03 Jun 2026 03:17:31 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:13 +0100
Subject: [PATCH v3 09/19] perf test: Add named_threads workload
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-9-c392945d9ed5@linaro.org>
References: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
In-Reply-To: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
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

Add a workload that runs X threads that run a unique function named
"named_threads_thread[x]" which performs a multiplication in a loop for
Y loops. Each thread sets its name to "thread[x]".

This can be used to test that processor trace decoding handles
concurrent threads correctly and the correct symbols and thread names
are assigned to samples.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt     |   5 +-
 tools/perf/tests/builtin-test.c            |   1 +
 tools/perf/tests/tests.h                   |   1 +
 tools/perf/tests/workloads/Build           |   1 +
 tools/perf/tests/workloads/named_threads.c | 109 +++++++++++++++++++++++++++++
 5 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 7ec70c054cac..778c37f6efdb 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -57,7 +57,7 @@ OPTIONS
 --workload=::
 	Run a built-in workload, to list them use '--list-workloads', current
 	ones include: noploop, thloop, leafloop, sqrtloop, brstack, datasym,
-	context_switch_loop, deterministic and landlock.
+	context_switch_loop, deterministic, named_threads and landlock.
 
 	Used with the shell script regression tests.
 
@@ -66,6 +66,9 @@ OPTIONS
 		seconds: leafloop, noploop, sqrtloop, thloop
 		nrloops: brstack, context_switch_loop
 
+	'named_threads' accepts the number of threads and the number of loops to
+	do in each thread.
+
 	The datasym, landlock and deterministic workloads don't accept any.
 
 --list-workloads::
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 5a2ab67cd85d..2fee93858c86 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -149,6 +149,7 @@ static struct test_suite *generic_tests[] = {
 static struct test_workload *workloads[] = {
 	&workload__noploop,
 	&workload__thloop,
+	&workload__named_threads,
 	&workload__leafloop,
 	&workload__sqrtloop,
 	&workload__brstack,
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index f8bba2d68769..ef3c3a269132 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -235,6 +235,7 @@ struct test_workload workload__##work = {	\
 /* The list of test workloads */
 DECLARE_WORKLOAD(noploop);
 DECLARE_WORKLOAD(thloop);
+DECLARE_WORKLOAD(named_threads);
 DECLARE_WORKLOAD(leafloop);
 DECLARE_WORKLOAD(sqrtloop);
 DECLARE_WORKLOAD(brstack);
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index cca7ad354227..7db5eea713a3 100644
--- a/tools/perf/tests/workloads/Build
+++ b/tools/perf/tests/workloads/Build
@@ -2,6 +2,7 @@
 
 perf-test-y += noploop.o
 perf-test-y += thloop.o
+perf-test-y += named_threads.o
 perf-test-y += leafloop.o
 perf-test-y += sqrtloop.o
 perf-test-y += brstack.o
diff --git a/tools/perf/tests/workloads/named_threads.c b/tools/perf/tests/workloads/named_threads.c
new file mode 100644
index 000000000000..dc8070a98df4
--- /dev/null
+++ b/tools/perf/tests/workloads/named_threads.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <limits.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <linux/compiler.h>
+#include "../tests.h"
+
+#define MAX_THREADS 25
+
+static int iterations = 500;
+int named_threads_work = 1234;
+
+typedef void *(*thread_fn_t)(void *);
+
+#define DEFINE_THREAD(n)						\
+noinline void *named_threads_thread##n(void *arg __maybe_unused)	\
+{									\
+	pthread_setname_np(pthread_self(), "thread" #n);		\
+	for (int i = 0; i < iterations; i++)				\
+		named_threads_work *= 3;				\
+									\
+	return NULL;							\
+}
+
+#define THREAD_LIST(macro)	\
+	macro(1)		\
+	macro(2)		\
+	macro(3)		\
+	macro(4)		\
+	macro(5)		\
+	macro(6)		\
+	macro(7)		\
+	macro(8)		\
+	macro(9)		\
+	macro(10)		\
+	macro(11)		\
+	macro(12)		\
+	macro(13)		\
+	macro(14)		\
+	macro(15)		\
+	macro(16)		\
+	macro(17)		\
+	macro(18)		\
+	macro(19)		\
+	macro(20)		\
+	macro(21)		\
+	macro(22)		\
+	macro(23)		\
+	macro(24)		\
+	macro(25)
+
+#define DECLARE_THREAD(n) void *named_threads_thread##n(void *arg);
+
+THREAD_LIST(DECLARE_THREAD)
+THREAD_LIST(DEFINE_THREAD)
+
+#define THREAD_ENTRY(n) named_threads_thread##n,
+
+static thread_fn_t thread_fns[MAX_THREADS] = {
+	THREAD_LIST(THREAD_ENTRY)
+};
+
+/*
+ * Creates argv[0] threads that run a unique function named "thread[x]" which performs
+ * a multiplication in a loop for argv[1] loops.
+ */
+static int named_threads(int argc, const char **argv)
+{
+	pthread_t threads[MAX_THREADS];
+	int nr_threads = 1;
+	int err = 0;
+
+	if (argc > 0)
+		nr_threads = atoi(argv[0]);
+
+	if (nr_threads <= 0 || nr_threads > MAX_THREADS) {
+		fprintf(stderr, "Error: num threads must be 1 - %d\n", MAX_THREADS);
+		return 1;
+	}
+
+	if (argc > 1)
+		iterations = atoi(argv[1]);
+
+	if (iterations < 0) {
+		fprintf(stderr, "Error: iterations must be non-negative\n");
+		return 1;
+	}
+
+	for (int i = 0; i < nr_threads; i++) {
+		int ret;
+
+		ret = pthread_create(&threads[i], NULL, thread_fns[i], NULL);
+		if (ret) {
+			fprintf(stderr, "Error: failed to create thread%d: %s\n",
+				i + 1, strerror(ret));
+			return 1;
+		}
+	}
+
+	for (int i = 0; i < nr_threads; i++)
+		pthread_join(threads[i], NULL);
+
+	return err;
+}
+
+DEFINE_WORKLOAD(named_threads);

-- 
2.34.1

