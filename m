Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434F407578
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410452; cv=none; b=eYW5b+jRPsDdfAO5pclnqt3+I19AivonvPyAT+j5y0Er3Nh2Mg/cKveRCYR2Q+3pTrqZ+k72HlRmC/JF4iv2Uck8aIZfiS0XHNGMwelDL/VVRUZHPRis4i70cNB4C+YqxncUfDNYngERyIEkpqEUMyTVAfNS68PgO8zMUQ5MGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410452; c=relaxed/simple;
	bh=M0DBrbePhZZ9AcxL0wzd3eII2+Wy6jGLW0uhbY83wV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JlBql2nW5BjT2MjCs6vHfT3KvS0vyBf+eMh7lDD4TSUfBuWKoqlLOYQL8yy6Pqjr0DpwkoRKqXRNDFxLYM9T2EAEvLblMhXr01SKdKUuh39j332QwHnRFrm72W/OpiSfaN2+9iUxllcpQC7tL+JnQdBD8+fsQGu8GaYDHlW/hmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCNqifA2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCNqifA2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso6995455e9.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410449; x=1781015249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8cRFQhUyrwRmvsS4WIe5Iy8r1Z7mMJ0S3vhGU6hRi4=;
        b=fCNqifA2Ge+bh4ToY7XRKEK3wTL6XYlEV9uEXFDiSOfCwk7lNWu15611po8+uz4lLj
         0S9gtJT/wh9LWjC5zYfWpUE67iRmcsiJ8RoBR5lMod2wFMIuWYkPWq7t3Cyp9ZJ4dqGC
         UmrBgezcOCXLMxDMr7rLf3TIdEZVcPAY3viA9jp14+jPM3c5giejEiFgUPwPxgyVFu7m
         FSrNxdaxfRalFsDjc600CZP27SryRw9T27XSx3rOXiq1qQVbMDhid0qLiUVzdWa/NeKH
         S1KfVqYqMfwzrEzoYE0vBmErINtl6nyh52sbF41GOydNGdFARMd17PLEE38QnW37GOKi
         nHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410449; x=1781015249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K8cRFQhUyrwRmvsS4WIe5Iy8r1Z7mMJ0S3vhGU6hRi4=;
        b=opCLtDGMU18go5+1TuJ7PB8Kc1MEPBBJXVq5BGPuCQuce+kzPrTUx7Mp1aH+zYktOR
         Ei2g+DR6ijKKAzjwH+qDBkXl4AY38f/WFPazAe01W+jNB3h0ZYqS9Ir6CgchK5TpgxOU
         veSfXp2AjLcrFW+0LFuSuOsCRY+FlEDWwSXOrUP6QEMFK2+fciamyc87XFzdJx1dIsjA
         HQk8Fua7stl5XkUBLF2ZmEh6Iuet/4WdytN7hdJFF0Cu6vKcDRoqIDDiBEGVWhiY9qYp
         /noy9zskFQ0OefHGxUgaeSZBlBYCNsTN13zwmWM7aezKoWmkYZmeKRy1/kYBOUz7ZMaU
         ugjA==
X-Forwarded-Encrypted: i=1; AFNElJ9L3wLJcApK57Z7/9ISs6ZBbNFBO97WmOtesBI44RLYM9wEYG5BzlMsKuhVG4V6Qns4I+JtqypnVz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzK1vXbXZzGM6bfF2TVLHV8ZTF0a49e+O2TyPXo6b/q1rvGJaV
	tdrdJbB22BxQQfKGo8Uwwc7CAdS93ugBgqpqP1vBMbkGbgP3PH/edQ3aTZ8eTrp5pGU=
X-Gm-Gg: Acq92OFjdASEz7Lq68LaDyTE8handdI6v5CMc/jAMDGQJ0KudZT2IN5rlwAWzbjaK+x
	zvl6p4oA1TWv5ZR+X6dwAPiBde9Gh19LwJknb+tRxEnKwM8cKTR7p9ACEnOJ5uXqCNAdfJGLTa0
	cYld4yo/1wplvIXzouMvvDgAIm/85ZNsv1HFzdGn6xL2q8pl57M/YYOj9pxQekLHzYEiAhvDyGc
	evQXHwekhVy04XhfErxKMrx5SIAQ5B+3flNNCKT4K2ZQyMLpUWap6xdst11qFbllwwFuFP1//4G
	+44bV2nbfqTbARdezyXVGR+R48Z2CFpO6NMt08s+7Qctv1T7TiyUc3Gq+/TsFLJ7smHq5qY/Q7I
	YBZbj9gvaDypKiVVrXNdg23U2piQN2YquWkWhMLT6hmyaVNJHS2uVSqfShXOfPM1UV3VEztkQzW
	u40jnxLG5CtxD5S4ulCp1H1qOdQjTHZbJ/2BcAqQQjjJk=
X-Received: by 2002:a05:600c:c108:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-490a2923a71mr217561125e9.1.1780410448893;
        Tue, 02 Jun 2026 07:27:28 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:50 +0100
Subject: [PATCH v2 08/18] perf test cs-etm: Replace memcpy test with raw
 dump stress test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-8-85b5ce6f55c6@linaro.org>
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
 .../tests/shell/coresight/memcpy_thread_16k_10.sh  | 22 ---------
 .../perf/tests/shell/coresight/raw_dump_stress.sh  | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 22 deletions(-)

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
index 000000000000..eb5a5e5e1be6
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
@@ -0,0 +1,54 @@
+#!/bin/bash -e
+# Coresight raw dump stress (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for larger buffer size
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+# If Coresight is not available, skip the test
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
+err=$?
+
+if [ $err -ne 0 ]; then
+	echo "FAIL: perf report failed with error code $err"
+	cleanup
+	exit 1
+fi
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

