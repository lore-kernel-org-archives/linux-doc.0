Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DB23546FA
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016034; cv=none; b=t84oKbRgl7yHrTsVqkErlsKucVBd7eyRmvuTxvif8/sE3fptwNnIjpgB2DILwO3cBZJUa3a2Tz2p6UWohYJJTKvXroLt4rFldYLDTzM97IcU/dgCh1ei0odophkRwwMIsgjAJpyvis/JHuwoDECa+ulboExKAVuYAQ+7varhL0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016034; c=relaxed/simple;
	bh=MJ+K3Rs0bnya53fFL+gZpbiLUdkfojL7f7z2lYvhul8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHgGllsW5d6ORbDfGm4M5Ss2yfSkBrWftNN6o5jmcqCoAcR8hqjyuae6ZTy9uPK1oQEAWm1Ky0UP5qb8ECQmNAagHEM7TAXDt9IUN/cvuui0LORQ9WKX3JUGvbYTJlEGzyfLDxzqj3YFtl987me+/hIMnZsbPOoZY154+gRF0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PNlUBcrQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PNlUBcrQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso63871905e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016031; x=1781620831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEOwD57aFV/Xs3z58IqNxAAWjTXC2csM2SlQM9DxCXs=;
        b=PNlUBcrQHppv9CuEj7e9cTMXxvkNxVMUYQYmnXuWF6847LqAqQ9e8xeYgUev655ZGE
         AwplK2iq7oRWU8xTIY/ZTTuiBniETyXYWkEsBr5o9NwbG6gs0LZ5fQ7HC1iIRL0QHmJQ
         N2meS/IL6L75IEJk3hP8SBn30ffabITvPXeILyshyaTvlHUrAzNeJRD8yUqBr+fPVxyK
         b53/kSPuUHnfwVeAHolAuvW4a1yFh4YQQGKcSMtbca8pSUz4gHHj1C5A/Hw04cXk+oOY
         DNwAVSIFTP/NDX4pbvCiovqDG6ivQ+2zL1HRCqbYt+euOqoTm9002dG2/5jJfl+iMVyi
         SOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016031; x=1781620831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bEOwD57aFV/Xs3z58IqNxAAWjTXC2csM2SlQM9DxCXs=;
        b=lh23ThnitHISweQX43LD6Z9PKCtgFsnFOuvnMWvaelhnhHb5m+G9d2I2J0f1HXYNUj
         z/4wrJNYZhwD+5+dqod/fIZPOeNnat951057CjcqLY12GuYe8dJjnTTdihEfDEpw0wcv
         4hLT+48WgYGE223VICX/2f+7OJzTjBuRNac1Y1wgWjn8eIHHgIMfE3K99detYEij2UHE
         0WGQ/nSPpqui3oJnlEArUmX8HqLVyEgTgB6B9V6bmS7oL1k026s01lJHbp0//XXXGC42
         Gwi4bIrG4NVkfXypYDA6ey0mZUf2uNxX0WNEafADsdhjuqDaR47jGxtEq/m+GuBVr54J
         P3Fw==
X-Forwarded-Encrypted: i=1; AFNElJ+Mh/wGvCHM+gSSPkqnz3O2RAoQX+G9aQFtFoPCsxj53pB7d7d0EsZXNzKmiyGX+FM02sd7nJy3li0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsS+MEAWO2Y0DRWBXVq71JV2nMRX2yrDmszanKW5qK5vsaIs8
	PyV2+iRs/2XNwvDpfPYCno+4akGzRWw/xDsMhYDnpO6+twLVeVR9pg3l6+bfRua8qL4=
X-Gm-Gg: Acq92OHg07GIae4351PJNLqormMkX3OKN6vDl9bHhkXa2Qdcs9DOWKv5D2KkabNB4aQ
	X2mVt25789y+JbWZaxqqKNEyBNoR8ERLt417githcRLo00x4mTFkT/5SmDglpegUjYP6/WK2PcQ
	qXJee93N5E3DvPXivnKf9D+eXU2tB+lDR0eHoMLkleD0dJf2AwN86Q7zDMMAbwapKqwFCYC9FFW
	srM+dnThGuPiDmR4RDIuxOieu1Y9Ema1OxS9jGKtMnyPIYH5r25O/PLR68J2fbfKeNitAfruR0w
	EzojBDaxLHHUc+LnuzyNhyWjpRJcyKirPvrLZhyURin89IJcZBte+g7P3P2YCXB63EOntdkC5o5
	E/LiGLXso3CJCudxgzF4AJDvswOy94trdtjFskeXBj57wkwZmTqpA9ZH+pdXhfWoRhSqnkDXUkt
	LM099tCldWSoocXFTImmN07+/FkxiOsX4x5rAEH2UCgWY=
X-Received: by 2002:a05:600c:a117:b0:490:c2a3:abaf with SMTP id 5b1f17b1804b1-490c2a3abdemr253443555e9.35.1781016030785;
        Tue, 09 Jun 2026 07:40:30 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:29 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:10 +0100
Subject: [PATCH v5 05/19] perf test: Add deterministic workload
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-5-d53a7d096a19@linaro.org>
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

Add a workload that does the same thing every time for testing CPU trace
decoding.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt     |  4 +--
 tools/perf/tests/builtin-test.c            |  1 +
 tools/perf/tests/tests.h                   |  1 +
 tools/perf/tests/workloads/Build           |  2 ++
 tools/perf/tests/workloads/deterministic.c | 39 ++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 213eb62603eb..c50a4b2d2d29 100644
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
index 9284f897de3c..ef7e3f52a383 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -164,6 +164,7 @@ static struct test_workload *workloads[] = {
 	&workload__inlineloop,
 	&workload__jitdump,
 	&workload__context_switch_loop,
+	&workload__deterministic,
 
 #ifdef HAVE_RUST_SUPPORT
 	&workload__code_with_type,
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 7cd4da4e96d3..bcfe9c33fc66 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -246,6 +246,7 @@ DECLARE_WORKLOAD(traploop);
 DECLARE_WORKLOAD(inlineloop);
 DECLARE_WORKLOAD(jitdump);
 DECLARE_WORKLOAD(context_switch_loop);
+DECLARE_WORKLOAD(deterministic);
 
 #ifdef HAVE_RUST_SUPPORT
 DECLARE_WORKLOAD(code_with_type);
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index 7134a031cb7c..90f2d8aa4941 100644
--- a/tools/perf/tests/workloads/Build
+++ b/tools/perf/tests/workloads/Build
@@ -11,6 +11,7 @@ perf-test-y += traploop.o
 perf-test-y += inlineloop.o
 perf-test-y += jitdump.o
 perf-test-y += context_switch_loop.o
+perf-test-y += deterministic.o
 
 ifeq ($(CONFIG_RUST_SUPPORT),y)
     perf-test-y += code_with_type.o
@@ -23,3 +24,4 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_inlineloop.o       = -g -O2
+CFLAGS_deterministic.o    = -g -O0 -fno-inline -U_FORTIFY_SOURCE
diff --git a/tools/perf/tests/workloads/deterministic.c b/tools/perf/tests/workloads/deterministic.c
new file mode 100644
index 000000000000..8a78519fd075
--- /dev/null
+++ b/tools/perf/tests/workloads/deterministic.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/compiler.h>
+#include "../tests.h"
+
+int dt_work = 1234;
+
+static void function1(void)
+{
+	dt_work += 7;
+	dt_work += 7;
+	dt_work += 7;
+}
+
+static void function2(void)
+{
+	dt_work += 7;
+	dt_work += 7;
+	dt_work += 7;
+}
+
+static int deterministic(int argc __maybe_unused,
+			 const char **argv __maybe_unused)
+{
+	dt_work += 7;
+	dt_work += 7;
+	dt_work += 7;
+
+	function1();
+
+	dt_work += 7;
+	dt_work += 7;
+	dt_work += 7;
+
+	function2();
+
+	return 0;
+}
+
+DEFINE_WORKLOAD(deterministic);

-- 
2.34.1

