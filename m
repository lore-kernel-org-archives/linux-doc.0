Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E8235DA79
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015491; cv=none; b=tog6k5uZEViNihKPYUCdaHnhFnHvaJxhTWkgbpPoILXsDHOKBaNP8JxXHV8cHvHfb4JwkL04xBzRIBjAhtTQMqqhu8ffTNrdtaBHddFSvAmgLfs++yLvm6PCla4IqQBdobksH8qnK6kaCbTpoW7bbpsSYFVbjb2F60LaVjfjIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015491; c=relaxed/simple;
	bh=z/CK3SgmlZ9m2fa4g/8u8Ev0tF8YBHx5+5672AAbTpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdVRu6rWXDbtiWSAz3osTS4hJEKOrlKCtnM4a5rUTdr3vyZVM9xYO3ywqHZmeL2R1ILZceiBQ9M0a+mzgq/UQGi9EzbvXaRNysgLEMQyg+nUPAwYZLP2+HUePuLgCFMV8DibAC+Av3gz92HVZNXkTauWUJv10y5pmaY8EsbkbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lM0tb1B3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lM0tb1B3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so4138794f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015488; x=1781620288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26hfOEeOS0Wp3zVqiYKicdVNnt8eBmuZdvoqTuUrIFc=;
        b=lM0tb1B3qTslKooVKv2zQ/miywEtBFXTS/3TBPOofF6uYTYJixd9caB4Gkv7HKMHNb
         1uU9LFwZwQ8VV7N1bQOmZu2fZdUJ+BNe4pkLVCuHqgERgQLKsm0MK03BIzJXj3gOxvvp
         pPb9pfRmJN1H6wsvgX92tCDMroVixShtp5cNUfDKlKn+8/nRAjRcS81m8bP7Uq0hSq6I
         ykq0UwsH27zvVh01BcGTi26Vs72Nb2gN1FFbv/c74qgUxyFlpcoVujm4QmIM2WSKZGTg
         dimsfmPA4Rd4m1XRQHkOdMJdeL6akhMzBr6smUZPcHG2qN/tHQlhbKAJPVU+Hbsl1DjE
         Turw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015488; x=1781620288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26hfOEeOS0Wp3zVqiYKicdVNnt8eBmuZdvoqTuUrIFc=;
        b=UfGUlpz2/wb8cQL1L7crrx994VmWbhuCNDk51bHgpN1TpirZU5PWgVMAMX5oUmJcTF
         r0G/VW7bfSxNIHB+9YWOpXx5AX3tUQ8zImNJUtuQCd4nwzGNEWGO2fWLw4d/G4SVJ9ad
         zEdo8iE430OzfTv+dSotzfhhxf8l3P0a+hCSYrMI2Ip81llBCPkI7zIieVXQR6VW7Vga
         XsICYWnnMNU9RRosBfOq195T4Cmy21hke5w5pPpZg+YpfZvuLwi5o76x/tqBa23QOd9f
         G1r23u+8EwTLtMukrH/UYR+JwXmX8hRyeMcUpHybUe5Thi/Dahwgr3wCVnlk3OnyFfND
         hohQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x/FpnNiqJLkSurDQAOqkATxqoaum3Rjs79O1LQk/VsgK0yTU+nPaxoUL5znLbeySefgJ0Hz9SgWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPOgjIsFEUzfMdW5GaV+jRvcG+39FRQahjVPe8tkot2joRAPz
	7aQJwFxNeDCl9eC4OvSR5Ert0lGLAwsUPzkf+tYxswi7YxlSbHE6qdZDAdmu8AA+XOg1HfdeXSm
	OzzQMznw=
X-Gm-Gg: Acq92OH/AVJZuJhYGNpLw3/Tv5DcJJsjjjJ1xErE/AyvjZ3vMwiiKB4B/2qDEK8S5ni
	xl6OWT3T7hLwKPtJ4X00frXaJSZw8iI9ft0M4VEtGI47RUHW+NVpSoMTzT34QzqcAT3WqNRGKG1
	ChsYXTCzZg0/R3rmz6DwYAztHkCpVdvXrCmp0WGv/DNPMkcf5VCTVBvoWBmXR0ZoaIAAz5taP2D
	MBJga6qfp1TNxqGRU9LfoFKF5ybbI1W0gs2yyOo8j/7tyWtYtREMnxD4eR6+teZlXhAoM4Yrgwj
	8pVodQp7WewF3BdJl9Qu0t7gYG1OoAmDbNg8HsdklEjdGPZlJIJjlMPCGrx/S2jjXO3pJNP4d/s
	anXdkMIhML+fctmm6VDz9XGL+k/Z3BkJqCOPhpFubahcH7XqePborPVgchFNP/76ChA7l//ntrO
	KbFU9dMBu+kp2+CqzwpLPf875flSQ5c7KCAFwty+tv8CQ=
X-Received: by 2002:adf:fe01:0:b0:45e:ec18:f207 with SMTP id ffacd0b85a97d-460305061ecmr22846190f8f.25.1781015488377;
        Tue, 09 Jun 2026 07:31:28 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:27 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:01 +0100
Subject: [PATCH v4 08/19] perf test cs-etm: Replace memcpy test with raw
 dump stress test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-8-44f9fb9e5c42@linaro.org>
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

Like asm_pure_loop, this memcpy test only checks that 10 of each of a
few trace packet types occur after recording a lot of trace, which isn't
more specific than other existing Coresight tests.

Assume it was supposed to be a stress test for dumping and replace it
with one that doesn't require a custom binary and checks for a specific
amount of raw output. Don't bother checking for packets because the
other tests that test decoding will catch issues with malformed data.

This also adds coverage for exit snapshot mode which was missing.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/memcpy_thread_16k_10.sh  | 22 ----------
 .../perf/tests/shell/coresight/raw_dump_stress.sh  | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
deleted file mode 100755
index 1f765d69acc3..000000000000
--- a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/bash -e
-# CoreSight / Memcpy 16k 10 Threads (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="memcpy_thread"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS="16 10 1"
-DATV="16k_10"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-
-perf record $PERFRECOPT -o "$DATA" "$BIN" $ARGS
-
-perf_dump_aux_verify "$DATA" 10 10 10
-
-err=$?
-exit $err
diff --git a/tools/perf/tests/shell/coresight/raw_dump_stress.sh b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
new file mode 100755
index 000000000000..b4b4f2503fee
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
@@ -0,0 +1,47 @@
+#!/bin/bash -e
+# CoreSight raw dump stress (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for larger buffer size
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_raw_dump_stress.XXXXX)
+
+cleanup() {
+	rm -r "${tmpdir}"
+	trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+	cleanup
+	exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+# Use exit snapshot to record 2M of trace to make about 80MB of raw dump data.
+echo "Recording..."
+perf record -e cs_etm/timestamp=0/u -m,2M -Se -o "$tmpdir/data" -- \
+	perf test -w brstack 20000 > /dev/null 2>&1
+
+# Test raw dump runs to completion but don't decode because that's too slow for
+# a test
+echo "Dumping raw trace..."
+perf report --dump-raw-trace -i "$tmpdir/data" 2>/dev/null > "$tmpdir/rawdump"
+
+size=$(stat -c%s "$tmpdir/rawdump")
+if [ $size -gt $((50 * 1024 * 1024)) ]; then
+	echo "PASS: Raw dump file is larger than 50MB"
+	cleanup
+	exit 0
+fi
+
+echo "FAIL: Got less than 50MB (${size} bytes)"
+cleanup
+exit 1

-- 
2.34.1

