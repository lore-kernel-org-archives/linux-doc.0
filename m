Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CFE37C923
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481852; cv=none; b=DjrRA2Ey4XfOgAEN3/cz2sRwOBVnHUaGT29l2Go9Wv/u1kS+rdiR9dW7Q8GPyF3H1OITJClIYYZxYUEYhyKLES1tgpEG+wfO1xwABumtnJMtCaJ3fb2020XkhbphjHNy9chEXTX0AJPZlWol36HgZfQI9ab4qggDaZmSoFXYOP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481852; c=relaxed/simple;
	bh=EgF9wlG8ZbGpA6Fw8M+WUSk6oGa9DEGTh/b30THx494=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMJNgp3jc1H7sHFOgTgzOxprE0NXyAZ8a7LJL5nmHaeQfr6JBAPjpe+7gX7Jf0q5uI6TC3fyUkJVIfMNCGy2tXCdwVwV/Hz6WPDkRQkPJXhN+/uE2mXEHoEVRmx4cG8uKvyB7vigbiN/Yz7Wb6Xw+k80QhPWkUrUh2p25xWinlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e2fPNk1D; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e2fPNk1D"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b613a17bso7353155e9.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481847; x=1781086647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIva9g/gVoYEr2OQuQ3ZFE/kcOOWkyDfg5JnXdWNeQY=;
        b=e2fPNk1DEIBKYzujsa/lNs9C8rNSdvctop1VRd+FE8AVBd3i+pRrsmUFI9tehMj2sW
         XFQmIyx0vKY3o36ZLRfkEuN8At25TKXs6h0SeMXmw5OLFkyov1u5+qEN5m8m1LlMbDZi
         JaPMNhVg6n45RosiIFC1hiPvU7pIeFICQaFwLjHZ2paXtK6chm3eskSnBsobFRslJ2S/
         wSo87Xaau2h3Lx/IWktl+QM85/5l2SfnMmMXnQUHxkla0eb9YwJxaN7ASXGBUPWG8xVo
         lmQyxRt3hfALPibKgi6aWyemgvNn72UbObysOURJvUQTgyODJSYjjYCqPs5GJrewMKGq
         lbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481847; x=1781086647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uIva9g/gVoYEr2OQuQ3ZFE/kcOOWkyDfg5JnXdWNeQY=;
        b=Uvt6lW8yhWH+Jzi0pK4JcHjU7h6BDW8uQJx5/vV2KNyLAWrwQmjy5eoWKZyFUFvrvp
         6P+mafLTMlfEpCZCw4HdPYmE3AaUbS61D1xy1b+MPoyghLLyTgljo0D6P/DZb8GQfcAX
         Ihi0u1sBOdL1NpdKmZHLxyDzb0RhZ9QWLxb3kADN7BorAGeLZQWy4RzVFtW4vEQwFvSd
         8lqIiwN4MBMMbArTksFtZmdsCeVU0JZW/IV4o4Av7V+iT8C/B0064an/rUuqbAoS5hAM
         Bg1OIIJiW6qGuFFin0BLy3vy+nyCam2oie/LZDnyHsfyst7/iqALma0PiZUUryOTfn3J
         0maQ==
X-Forwarded-Encrypted: i=1; AFNElJ/j5iLFD5xkeEFP5yDktl8Sw/r30IeJl+Su75YZ8uALjB4X7YEOQB2jDDBgcNwGVGMwLsYSbh5ez/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+NCIfgzYaiU10oiw5Hmma4QXJAvBkm5cQ7edIN3Azwocn7Vx
	KmFRPy0mvcKLg0DVahgVLf96it76n5OcfNbCD7N1oVchiWfIi4uwtAHX3rWBqhWu6f0=
X-Gm-Gg: Acq92OGb9qMdH3qvcyLXyAUXZpbRnQlGXsUfjVUp16/gwKdyM1D0kzdI4jCGVKFgbex
	VVR7vJ26FJgzD9MuEIElJ1/JNFAVElkJz+M68VyEFvf037kOMw4i55phgYSNNNox4kjJLTKTRBe
	xEvQvzRduNLN1I49KbFIFeHLi/3K3hqIoYvtjZZPJDXdfIr3MJIecXvAT6ImirVyrMXZHbwv9aS
	OwTTjIrQAQYhE9g4LRwCj2Q4vpPe+0DZuYebCdrEfWzgQfh3KDZr/bHHNf3AzaFRrr5OIUxRz/m
	jHKZLZAR3Nq8qgfOYH5499K7Jiu+0o2o6+KROwRBDhlFvexDW4e3R2pxVJv9RBZfI1Rw7VTFzEf
	dsV1YKcvuhvcRODDZCstPjOcoPXKuIHWw02HtXpGnb2V+SufyLu5iLxoLvKNSM36mmnSerT21vw
	WPi1qAngvpP6I2jW8ZmIikVblJBRIyARnas6341lyKF2MgxrhFcS/5CA==
X-Received: by 2002:a05:600c:3490:b0:490:b7a2:8864 with SMTP id 5b1f17b1804b1-490b7a28a0amr33243145e9.0.1780481847229;
        Wed, 03 Jun 2026 03:17:27 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:09 +0100
Subject: [PATCH v3 05/19] perf test: Add deterministic workload
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-5-c392945d9ed5@linaro.org>
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

Add a workload that does the same thing every time for testing CPU trace
decoding.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt     |  4 +--
 tools/perf/tests/builtin-test.c            |  1 +
 tools/perf/tests/tests.h                   |  1 +
 tools/perf/tests/workloads/Build           |  2 ++
 tools/perf/tests/workloads/deterministic.c | 39 ++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 9c0d7ac2bc64..7ec70c054cac 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -57,7 +57,7 @@ OPTIONS
 --workload=::
 	Run a built-in workload, to list them use '--list-workloads', current
 	ones include: noploop, thloop, leafloop, sqrtloop, brstack, datasym,
-	context_switch_loop and landlock.
+	context_switch_loop, deterministic and landlock.
 
 	Used with the shell script regression tests.
 
@@ -66,7 +66,7 @@ OPTIONS
 		seconds: leafloop, noploop, sqrtloop, thloop
 		nrloops: brstack, context_switch_loop
 
-	The datasym and landlock workloads don't accept any.
+	The datasym, landlock and deterministic workloads don't accept any.
 
 --list-workloads::
 	List the available workloads to use with -w/--workload.
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 2830a431771f..5a2ab67cd85d 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -157,6 +157,7 @@ static struct test_workload *workloads[] = {
 	&workload__traploop,
 	&workload__inlineloop,
 	&workload__context_switch_loop,
+	&workload__deterministic,
 
 #ifdef HAVE_RUST_SUPPORT
 	&workload__code_with_type,
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 79f50bacfc94..f8bba2d68769 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -243,6 +243,7 @@ DECLARE_WORKLOAD(landlock);
 DECLARE_WORKLOAD(traploop);
 DECLARE_WORKLOAD(inlineloop);
 DECLARE_WORKLOAD(context_switch_loop);
+DECLARE_WORKLOAD(deterministic);
 
 #ifdef HAVE_RUST_SUPPORT
 DECLARE_WORKLOAD(code_with_type);
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index 3bda6da04a35..cca7ad354227 100644
--- a/tools/perf/tests/workloads/Build
+++ b/tools/perf/tests/workloads/Build
@@ -10,6 +10,7 @@ perf-test-y += landlock.o
 perf-test-y += traploop.o
 perf-test-y += inlineloop.o
 perf-test-y += context_switch_loop.o
+perf-test-y += deterministic.o
 
 ifeq ($(CONFIG_RUST_SUPPORT),y)
     perf-test-y += code_with_type.o
@@ -22,3 +23,4 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_inlineloop.o       = -g -O2
+CFLAGS_deterministic.o    = -g -O0 -U_FORTIFY_SOURCE
diff --git a/tools/perf/tests/workloads/deterministic.c b/tools/perf/tests/workloads/deterministic.c
new file mode 100644
index 000000000000..3caea8564043
--- /dev/null
+++ b/tools/perf/tests/workloads/deterministic.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/compiler.h>
+#include "../tests.h"
+
+int dt_work = 1234;
+
+static noinline void function1(void)
+{
+	dt_work *= 7;
+	dt_work *= 7;
+	dt_work *= 7;
+}
+
+static noinline void function2(void)
+{
+	dt_work *= 7;
+	dt_work *= 7;
+	dt_work *= 7;
+}
+
+static int deterministic(int argc __maybe_unused,
+			 const char **argv __maybe_unused)
+{
+	dt_work *= 7;
+	dt_work *= 7;
+	dt_work *= 7;
+
+	function1();
+
+	dt_work *= 7;
+	dt_work *= 7;
+	dt_work *= 7;
+
+	function2();
+
+	return 0;
+}
+
+DEFINE_WORKLOAD(deterministic);

-- 
2.34.1

