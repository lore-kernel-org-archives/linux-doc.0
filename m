Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4CC352030
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015487; cv=none; b=lwDkMEtkyClPnGWCGUw2RRZgFaBO4x/ux5ftfpQ9djlR1kup13tFEKKZ2w4uAkSXxBYl422VMXsDOptPmdUEjfACeSiGILbG+Irs9Mhc3mw9AfjNkBJOZmoNLyTbjlL/spVadX69i3yRu32DcfPv1lNnqd7Kh6cxAM72bNJrU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015487; c=relaxed/simple;
	bh=MJ+K3Rs0bnya53fFL+gZpbiLUdkfojL7f7z2lYvhul8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKNM0c+E3ARSLgEpwcJnR3tv6CojmGvEbCRD1topKP3OsJ1Ah+dFKalLgR4k0J46kGFP3S68V3c73USV3drcOHT22cVVCCIguS4X7frRgXVO+IxUO+gAqHItU06LUt9s39IDeYgIgVqJ9e7Bszf0bFnAc0+8AC5DLK+vfa8YXWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/Uovegg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/Uovegg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b9318997so41044385e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015483; x=1781620283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEOwD57aFV/Xs3z58IqNxAAWjTXC2csM2SlQM9DxCXs=;
        b=Q/Uovegg2BEA7ZxUne4MYNAFrrWq+9f8DDS6zhZVJIa8mOM9eNDos/SoZDDfU/PHlU
         O8p49DMPDIZXlrWlDh4uyfRoKAq/R3xkluyFCAEblvW8oD01Q2YowFSw2MT7SSwDUN3z
         eNWl+gs4TlEVeG8N+uXOq0BhI+KAM1MObllfuMEUaykRrzr/+QcBHhGDrekKk3o2k5hM
         RAkV8+6SIWraDmLGgtjtTlzxMM+Zb81drAV4IF+Jzr+NXO6SS8Iz/WEKHqN8SBR2U+eI
         JxH/vTrWPcowTPu3cbpJYeVJjskOGjWPsnVlsmIjwkGgKqIdG9l9S0aimiGHM3Qy6TeT
         OxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015483; x=1781620283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bEOwD57aFV/Xs3z58IqNxAAWjTXC2csM2SlQM9DxCXs=;
        b=RZby+iWWVQL4TXMMgkzEAfyTbSU0svyT4O8nk4HsvMlrTOn1rtVu7XsXFakNE0RJAJ
         r+1LdXkSp6mQ2i+/97mKA8uOgTPeXO70bCDesvqcKbypACLpH3f8t/1/GAVhDW71rAWV
         OKlgFbZJHjlvz8/M4hUUz5WdK+pe09uGS4uUw6OuFU8nJLLk8u96hIGUfQJqND2D0Z6b
         9uZUlYVDOZS/ZHFGHbyQzJSFy82TrhTARQgIz5G/CdjVgI3m9z50a5RWTk9wMDTcdXIC
         SL9T+M3e5VHHiTYWes4UKVivR8CSw83E93aFWKRyeIQEKjxYbeZTdW7mFePA8t6LlPA1
         tPZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n8ASGP2b7/24vQE+zJlcpURIKZB6jHi0/Tz4m2ksH44YUDfLZAhhuKJB81U6QAm1roloYgBGMui8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxusby1Tj4OHfrfncBgc4URi1bjWkHe3sTQCzVDjTmt0gHrauJ6
	5KB/obACW97+caC93MrF7We2aLbmT7eitpG3TLqAcy+/AAfzdEzY8/oNBcZstUYgw2UHFGzqurF
	YR9eRAqE=
X-Gm-Gg: Acq92OFh5OWDrYtzO9N3ZHMsllc+beL5LsD9jdmjmH5n8EWJNH36NI3D8lP0asf/USv
	hFFGtBD1BGRWA3q5RmrgGD5PuYQ4tLISzKZLkD5dlfnZ9Z3LWy/Ve1BjCxsxcweyE5t2GIeLZEq
	IGNRexx05D0PklTLx5GJvm5lGCMnDn9llT+WzIUjpOm/M5MiViKkof2vOP83PBv6Mxa1zoj6Um6
	TgHVHf0JeAMWTpJGK13QW9Lh0A5YeQ2X58gtu7lDvqYUvfdBjjtmi184nA+ciI0GN/hYDdBq98O
	EPvtO8BBI72Y3ZMD8fcZ5Z/HmN3yLojUstmPfEKP4Mnwu2Z9D9FmRQ8WvonMiritAdSWKEgIp8X
	QJAWU6rV1IBUH4Ct9skC2kiCj3NiYTrXqbe1hUk7ZzAy2vy22MHmsST7Zv6/TgnHusThbt8jq2Q
	V+epBfdmBq+N6c5mLgYOGtg8YT9BIqeqHx3hpdei3RkyM=
X-Received: by 2002:a05:600c:5252:b0:490:b2a6:8c1d with SMTP id 5b1f17b1804b1-490c25adb2fmr351863055e9.10.1781015483462;
        Tue, 09 Jun 2026 07:31:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:30:58 +0100
Subject: [PATCH v4 05/19] perf test: Add deterministic workload
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-5-44f9fb9e5c42@linaro.org>
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

