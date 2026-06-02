Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD24028C2
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410449; cv=none; b=Y/BvBNAVFUqqFcXM0qpSi3fwAJGC6XcsqkYDI+e2k1VTO/E5/2szT8rptTSBBL0hk0PDS81m5AewipUbBAIg+aoLF7oCbBDHz7Hw9R/R4K9O9NCSDovTkuo9ETbWABGTvNSOBkNrGu7/tFuwI/lul8Z2w36dcl99SXVIUSksdUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410449; c=relaxed/simple;
	bh=Y3ovDeG6DYqHIOpqufJpffsbkAWawjQU3JUtWwMMc/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaTPS89zEaR4Pv/gA4v6UpbE2gJAYrtutO0PQNq8Stmd2HSKR+H0mKLJ4lPOhM+vwwVxuHPx6mlZtOxCVlJzaNgHQnRvR+ZVaOUamjsrHb8FvaSxpbZ3xLl/BF9nefgtZSeSeenfClqXiaNGyfD/HbRWDO1R0l4rQO5uVsiHThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttVOeSX7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttVOeSX7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490a7629380so26087915e9.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410446; x=1781015246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iP8ZCKyvgePemhrrS7zpcp0nGfW5k/Rg5tcocHv0s7U=;
        b=ttVOeSX7NyNuPCgOtN4TAiNtd+aVRb5XFUfzYGqEyjlQFcAg7GiOdla5q+EYr7ki+p
         cboeWxYbuLRueMzuPTElPj2S75sWO/NcpUbqi7pOab8LaBSIMlrGfWKbiDvEzVmDbqE2
         KEdGaWuFyHHDcN/bjn/8grmPpiWZ5CtZ3Eq7fctj6jdh6c8Du98h9FFIiy4lM58Hng/2
         +Oa+qIhQvXEYflmfrug/6oRUP+woe9lx6aZWvl1QVWTzqucVtgC4jG0YRobp9AxKU+lw
         VkZSIGdP4vgmZDlKQzsj1MqnMozov3EIMcuK08qaAazu5V/T2CO2NGbGGRUsUuQVZha0
         DoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410446; x=1781015246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iP8ZCKyvgePemhrrS7zpcp0nGfW5k/Rg5tcocHv0s7U=;
        b=L1/LluD+8lnIUfRWU6DJTBDhMkE4kfVhNFtz0Vs2yVPu0YUKLgXpPc2Z2FiVbRST+N
         83vJJ/sgvy5lVcFE8kADQawGzRNmpjAW8RhklabejMNM98YcYih6fFlU/CIK3iLSkYr2
         sZngoAYN3sr3vrL5SdQZ4SyrpKeAtwUNlB35SprXjKGsxHaOAibe/CyeZ9PQ4gz5kSD6
         GP8FB98ocdTwAbYuavKEEvJSYtBOQS5ZK5/9eyyZy6tqDD9VgBpEuVdCCRT+WLqhZIQd
         amg/rWMzt0mvcqn+3LVoVeXSycIHm3lTVAPzx7+sOg9m2LzMd7OIYceC0UzUljxz6v14
         O0tA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ou0wIiTfIDI7Y7JbU+VtFCqSD6F5iBnc/kj8BHlFuBc4GxFwngmpqXBeHApteQwLji3sHs1RLCNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDKLoZAzkmcyVDQSC9BKhTzyu0hLctn7QhiSmdBs2NOS6T23W4
	zBh5opi0DQeQ60Glnm2GmbY/LxB9Lnr7Ucd45R/SY4/Ao7EN7IwHG6aHl//pW68hXDPecsklkXO
	+qXWS6Zg=
X-Gm-Gg: Acq92OHxwpRpkaNNhNBlnPYYRTr8CMTgcfQl739vhVTWgESXXAaj+7Kao3CnJ+y3Y4Q
	dkBzcMs193WEP6PRQksbX1BEKRMRa0UhHyaOpb5nfkGNIysnVqUwZYXeZ6nPjk9nxMNEVm25eju
	IYbQIFD6p7ZCB0wPAG6Vw1fIlOc8wqszyy3nGB/EJhG3km1k+Dd3CZNQB0FQpw2JhYYzh5Xu41f
	pnoDvbBPX2mG5ZluaXyxqn3pdNo6ZeS36RNxW3sQghNmoK7zjE8Ih2ofo1NCtz355am/AUYkg+9
	eMCZ2enjvrG4OjNX5cNT90N1U86dRsv9SNt0f2GrtFzyO6gePphB7lkDww7+C8/Jt8Bur5QJOy7
	mqiiQ5jWidnheyrxFYaMUWOIdfYoIipCX/OGXcjjaa88RmTv2dviQpqNNFj9qcTV8K9SNcWqHv1
	kucQcHk1wfs2L4rARpq9hOVPoTMBIfVYVxYH/FvVL2nyGouWFv41RuDg==
X-Received: by 2002:a05:600c:8a0d:20b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-490a293dcaamr208050385e9.20.1780410445848;
        Tue, 02 Jun 2026 07:27:25 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:47 +0100
Subject: [PATCH v2 05/18] perf test: Add deterministic workload
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-5-85b5ce6f55c6@linaro.org>
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
index 1057ee836c30..3c6d3de98be9 100644
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
index 3bda6da04a35..599a37c87878 100644
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
+CFLAGS_deterministic.o    = -g -O0
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

