Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18073570C8
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016035; cv=none; b=A3TFwuzrUtREyNUdKAFZYSW3q5Kbn3t/O0nluZyWh6iCvOCa8cS55fBON0LahgcCYgTKegoyarkmzjRNRb3aSatV4oSlfaCy74GZ/pdT9cm+vvTcUJvw0y0fx859MN3QkQApwfUPTD8Su/Dtp/v4kdO8aC7GkQwCXATIiX6JibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016035; c=relaxed/simple;
	bh=2n7NJ22D4CS+P0i5+qEOUx8FKIjlEa2CLZ8182tHs0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/9kdAPyiITUO4UJfNidrynMwcT805jgTJSOHvm/EQYpCXl51K60EEesIDmzc2Yox/bHAZATFXVViEHoHmCt/YQvXCl97UDshv7VfwBV8j5vha2XZTPS6X73aVzwS5383jqurac0PT9lnzeVupz7Rjr2jAZuae0QGRYx1keBoV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIifUc6k; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIifUc6k"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso39967755e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016032; x=1781620832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+VAHnkL1slPIQmaFlO30PHwtm50BBgiqOE4SfSQTuk=;
        b=aIifUc6kaUNBSxSrgxySOrH/W1/li3YHbljjE2f46UntvYNq3bGv+0qxjxi1A4kEip
         6mOexVW/oNbTpqzDwmh3/aA9iYS31pWmaVesTpWPvilcnjlIdYIU9bqNurKAQpW1D2Us
         7us/S9WRtGGw0L8eX05QDFOvfcQK7ifZ6jTnsx2PztrHFrmCTdpxd7X9Jjij5/0PFTWH
         zXJk3uMpSTMwBCV+zXq2WrMxwQ9qSqeeCTrd6k1+mG+GYkSYmtL9cABXzy+i38XiUaBs
         cfZwp3GFou/VIItCUnvXyVy+QnGw42Vjx0Fq7+bx9pI51rOMilj871NpPOlpK9O24NDD
         tzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016032; x=1781620832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+VAHnkL1slPIQmaFlO30PHwtm50BBgiqOE4SfSQTuk=;
        b=Mehqsn5iD1USdvuGWW5T3NrWHShVrlZYcfntRu2y6V/LdbzCNNvQXq9u6DOnh/K9RK
         E2lKgd2rrz3eEp91lJ3XRikfLpeGsEDGMMXq4wFTF67whXlHJeeePMU6e8w/iauhz8tZ
         /W2cTVizt0PkiSf+SKBy22aVHn/m341WvA7fxPjiW3+Kh0NpOGQ/h9FVDm1G5c+TvfeJ
         Bxm27WwcU1hWaqgCrjTdB/bZZcZ95L9On/JSwtOP0UOpw+9Zas45kYMyIj5fbF8w7QzY
         pmCmYg8c6A6HKqsNrOkdHoMn6idtJ7yEXz9OO9zRiPCz4EXfRtU+rT8CCK1d6Ahkwzh1
         tVRw==
X-Forwarded-Encrypted: i=1; AFNElJ82tbLUVlwF/ObKMaF/0zxu+aWEsDqFKzxV5m6IExrTxXncWaiQS6cl85EwwUj1RLUSCNzi/sWjX5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKptAqEhU0SuVtGYCgKgoS7gFez6QUA/Ie6kAw2HPbGu1IKviF
	FAy27L075x8P4I/qsvMm2+1238/hx5ytSZV8U8lIERUmv1twN57rRxgxtO2n22TbQjM=
X-Gm-Gg: Acq92OGiyxkXrP2mI3HqvoOP8ss93Us39TTswGrsXmXLBVGsig4IYTTvvmx3fxd1fde
	hU5rX8+5+dAKvDC+0SMJQ+nDfvKQdTyLtIuPPMSFyC/8c/7UN39+oVS2KZgNAoiqmsLkyjBCvfh
	WIC28mHJwvFMbIqQqBxC3cgQiHuwcl4VZenLM5N+vVA8nw+e0wbU2QRYPh3e7rCz53dXL8KpWBY
	9vVbaS3f1MMwDtz0JP5d1mADGLiJUD+mKgv8bHvj4AiBoe31+TbFgn4vlmU8c4POFJGK0v7kCux
	UXYHWCuoAgtHy7ltvGQOZ9ZPOVHe5eqHZeSOf2FBdWsfU+TQZy81q3P1cDWpkm6baWHboJ1as5g
	C3ZPXxjuItHe1tj7AMbAiKu5ACRUY/ZGr/30gJLhf94rdIVROg4QcoRwOQsa0BlTexVAu0k19Wg
	YHFMXCNWVazZ5C4xMWyBMgil6nZB6P0DD6m/ZHtyiifts=
X-Received: by 2002:a05:600c:3e0a:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-490c259a33emr315867955e9.8.1781016031985;
        Tue, 09 Jun 2026 07:40:31 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:11 +0100
Subject: [PATCH v5 06/19] perf test cs-etm: Replace unroll loop thread with
 deterministic decode test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-6-d53a7d096a19@linaro.org>
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

Testing a long sequence without branches seems like it would be better
as a decoder unit test, and this test doesn't test decoding either, so
it's not clear what bugs this is trying to catch.

The new deterministic workload has somewhat long sequences when built
unoptimized, and we can always increase them later if we want to. But
now we test that decoding always gives the same result for the same
sequence of code which we've never had before.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/deterministic.sh  | 72 ++++++++++++++++++++++
 .../tests/shell/coresight/unroll_loop_thread_10.sh | 22 -------
 2 files changed, 72 insertions(+), 22 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/deterministic.sh b/tools/perf/tests/shell/coresight/deterministic.sh
new file mode 100755
index 000000000000..75d4973056f0
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/deterministic.sh
@@ -0,0 +1,72 @@
+#!/bin/bash -e
+# CoreSight deterministic workload decode (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
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
+	perf test --record-ctl fifo:"$cf","$af" -w deterministic > /dev/null 2>&1
+
+perf script -i "$tmpdir/data" --itrace=i1i -F ip,srcline | \
+	grep "deterministic.c" | uniq > "$tmpdir/script" 2>/dev/null
+
+
+# Remove brace lines and call sites as they may not be hit or may have
+# extra hits after returning, depending on the compiler.
+sed -i \
+  -e '/deterministic.c:8$/d' \
+  -e '/deterministic.c:12$/d' \
+  -e '/deterministic.c:15$/d' \
+  -e '/deterministic.c:19$/d' \
+  -e '/deterministic.c:23$/d' \
+  -e '/deterministic.c:28$/d' \
+  -e '/deterministic.c:34$/d' \
+  -e '/deterministic.c:36$/d' \
+  -e '/deterministic.c:37$/d' \
+  "$tmpdir/script"
+
+cat > "$tmpdir/expected" << EOF
+  deterministic.c:24
+  deterministic.c:25
+  deterministic.c:26
+  deterministic.c:9
+  deterministic.c:10
+  deterministic.c:11
+  deterministic.c:30
+  deterministic.c:31
+  deterministic.c:32
+  deterministic.c:16
+  deterministic.c:17
+  deterministic.c:18
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

