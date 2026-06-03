Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FF3AC0FA
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481851; cv=none; b=R6RA/EShQEK4fWsV+ILEjwW/KVnTi2n9gE4ftDboTxLaTn4/HKwaFcDc6HYoOnrnWcmQQjb9UlUs7BUMpQyJgsO/bDJt64zkeWeQr+tmeIJtYdAdCXloqFmmhqRugbdtRgDIfIqxjp6CCBDtgoGv0Y13imn/KjZMxpcGuQwT1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481851; c=relaxed/simple;
	bh=ESmfjIh7MN23IeBJPxwPdBU7xBIa18aM//caXhGjZcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gI0lcnBkfhre3KUfNwDvBZIB2BDdEcnWBgu/YWcDFbtBuXb7Z+FYHb96dA/N392Sg07km8mCCIwj/WAqzU25oHAOB2t5L0lJHSy3ffLpVAPfMgdliK4FWTQPwM9Xwo9+y+JVdJZzpdqhz9sRCWJEnQSnLocWE+NTKRQG2yXYTnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgaUu2iy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgaUu2iy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so14726155e9.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481848; x=1781086648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXjR0tiVSlnNG0AciIMM1oZd4f63sbXFpo0GMT42zX4=;
        b=lgaUu2iyJyDxzbErkikl8wB/pDiinjfL0zeL7gnrNA7CSJ94VhQO9qwD6GRebkLPIT
         MXrdBvE+XaORPDcsxwky0UQlpa+NkwAKKdwFuirOGeaURI8CGJ1MhGUWQOWH4BHuAZSM
         CSVbRraoUVtde0gldYuovAtao/ouCcySKkHL6wNFvmPQ9MHmNCCHVReajd7Xm2Utxc/J
         vzCBNOI+fYHzrUErFM/zcf3QERZdnZqR1z088D3NKnacbPuszWGAfM1t+qbKRaILnW6B
         cY1TUhGCo/1hDtIEUQnkmyKq9OLciL5IAvpC9d6+J+aJ8G7q3j2r8ytr2fDtYBcbAmJ4
         G9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481848; x=1781086648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXjR0tiVSlnNG0AciIMM1oZd4f63sbXFpo0GMT42zX4=;
        b=b41miD07GViHiHZusjwzSL9+ZlLIp3hXmWFQWqIKscIb+NCFn+atN9XRb980Wx5kU9
         0nY03a2Ql/njRxYeUDD9/wdJzOWcQSOxXdE3IjG3I2xIeceHfuHkn5MQRu/hiSdoi2Sm
         CmdlxT5v/aG9H1aRW/ooJFkZ9zBLwXg2FXEy4ZoBO0N09oLTJj6aVxas6KCCA54Gcsoh
         SB8jJiBAl40euEAq7AzrBgvsxcPv5KC6By7kZNGN/28obePdZt/kZNvVpkfwkJ3dhOlG
         hQmcMyzPYuVIrZ3bc+ISrTJzcPom6tcYDs5xF7ysJJzjTZZrgv2jXofKvuWsfDIwDgNC
         PK9w==
X-Forwarded-Encrypted: i=1; AFNElJ+me+9xzMf+MH2sY6guVTY7r9mkWwQOuAXv40xuqWk3OlB/GK8SgUO4oYtGiUyQI/T12cRwDcHIjBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTbZolX1EnzkLQhwVitYLhc9+K6mDH7S/J9lR0iHMYDk4qOUdg
	pqg+y9ujvk+4awja0GGWTBgIb3DQ2n9Gaj/JKhchkDEuNxwjcWE1Yop2YkyQu8POgiI=
X-Gm-Gg: Acq92OGRLbsLqIeSYft0xNGQAWkVidqxYIsF9a8HDwdPDApNE6cTMV0158pbEP0uSIk
	yrwqzdljy/JB0ynsGU096PUiwrAKwMNa2N0EAE7zKT5CRBKF2mUGpIr28lHmIE2ZoAW11kBVttE
	Rc39bYoliaD2PH7wNsNw34+cCCW4qsM43ahR73cgfnTuU09aBng0XlcVh8r2ZO7bRL0RLxVX5JG
	LKVAjcNzrGplqBRhkmbp56ANfb+Kftl7EuCq6DyMcQsPpSR3g3Pw/wVOnP6Jq1kJOzHT6yweH9L
	7lnOJVNAo2UQEEQXyB+SJZCiLMy+wprc65O46ETSwEr42AutcfBnb9aKE4DRjWTqpFstPR5Jxvt
	tA8DC0r9J9QjyJj1AZL1Si5MhbxyO7kJf8S+KtT5UG2SwRCF0C0MF1uOtHWEsaI9RHCrDdEEJ/0
	L3gotHMvKa+xUfYjIFJCvMhHqudjVJvpbh9tWRrR51QMcGECooeBIa7g==
X-Received: by 2002:a05:600c:859b:b0:490:4b89:535d with SMTP id 5b1f17b1804b1-490b5e96157mr35768765e9.1.1780481848349;
        Wed, 03 Jun 2026 03:17:28 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:27 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:10 +0100
Subject: [PATCH v3 06/19] perf test cs-etm: Replace unroll loop thread with
 deterministic decode test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-6-c392945d9ed5@linaro.org>
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

Testing a long sequence without branches seems like it would be better
as a decoder unit test, and this test doesn't test decoding either, so
it's not clear what bugs this is trying to catch.

The new deterministic workload has somewhat long sequences when built
unoptimized, and we can always increase them later if we want to. But
now we test that decoding always gives the same result for the same
sequence of code which we've never had before.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/deterministic.sh  | 71 ++++++++++++++++++++++
 .../tests/shell/coresight/unroll_loop_thread_10.sh | 22 -------
 2 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/deterministic.sh b/tools/perf/tests/shell/coresight/deterministic.sh
new file mode 100755
index 000000000000..52e033fd6b82
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/deterministic.sh
@@ -0,0 +1,71 @@
+#!/bin/bash -e
+# Coresight deterministic workload decode (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If Coresight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_deterministic.XXXXX)
+
+cleanup() {
+	rm -rf "${tmpdir}"
+	trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+	cleanup
+	exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+cf="$tmpdir/ctl"
+af="$tmpdir/ack"
+mkfifo "$cf" "$af"
+
+# Start disabled and use the control FIFO to only record the workload and not
+# startup.
+perf record -o "$tmpdir/data" -e cs_etm//u -D -1 --control fifo:"$cf","$af" -- \
+	perf test --workload-ctl fifo:"$cf","$af" -w deterministic > /dev/null 2>&1
+
+perf script -i "$tmpdir/data" --itrace=i1i -F ip,srcline | \
+	grep "deterministic.c" | uniq > "$tmpdir/script" 2>/dev/null
+
+
+# Remove open brace lines as they may not be hit depending on the compiler
+sed -i \
+  -e '/deterministic.c:8$/d' \
+  -e '/deterministic.c:15$/d' \
+  -e '/deterministic.c:23$/d' \
+  "$tmpdir/script"
+
+cat > "$tmpdir/expected" << EOF
+  deterministic.c:24
+  deterministic.c:25
+  deterministic.c:26
+  deterministic.c:28
+  deterministic.c:9
+  deterministic.c:10
+  deterministic.c:11
+  deterministic.c:12
+  deterministic.c:30
+  deterministic.c:31
+  deterministic.c:32
+  deterministic.c:34
+  deterministic.c:16
+  deterministic.c:17
+  deterministic.c:18
+  deterministic.c:19
+  deterministic.c:36
+  deterministic.c:37
+EOF
+
+if ! diff -q "$tmpdir/script" "$tmpdir/expected"; then
+	echo "FAIL: line numbers don't match expected: "
+	head -n 100 "$tmpdir/script"
+	cleanup
+	exit 1
+fi
+
+cleanup
+exit 0
diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
deleted file mode 100755
index cb3e97a0a89f..000000000000
--- a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/bash -e
-# CoreSight / Unroll Loop Thread 10 (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="unroll_loop_thread"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS="10"
-DATV="10"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-
-perf record $PERFRECOPT -o "$DATA" "$BIN" $ARGS
-
-perf_dump_aux_verify "$DATA" 10 10 10
-
-err=$?
-exit $err

-- 
2.34.1

