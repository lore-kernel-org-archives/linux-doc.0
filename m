Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105B40910C
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410455; cv=none; b=EvrpMNqVTSm+/M1w7FdBYRsNCHVc7zNL2A9qjBYTCelIV6R6VCVCezwhohh+C90sChzT6RE5wR52/W3dLZdqLb/cNbW6sE4WnmIDmztgmrVtldiMjoxQ0evZulh2Z7jnnQHD1G9a1e5pl3TD9DVxTV/xVFj3cssHKGYau3csn7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410455; c=relaxed/simple;
	bh=+NVyoMoDiCeBbRcKsQIV0kaH0gzBxCHgeoMNyjllUrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDTU7zSUaXSa8FBMbCWwMp3tKzr4hLG+fbG1E0eGzLRZpioT7hXWM3fYCKg26u7KSCui5A0kKACfFExZwId4UzHpvabdQu6wMAehBROhLvVmzwCvjaQyaNmzVWyBTZnKDVedn1is3NqkKIDVCfAtqkDLDVnJsYFC2EP79da6gyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hiGN6NE/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hiGN6NE/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so6019945e9.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410451; x=1781015251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBRnQlPosMN+k8SaoyM/0M+4oXOyWiGOMBDGTHkddk8=;
        b=hiGN6NE/8UOnpNIeNZPU13Iw2+1JZVGF0S3NWww55GJTk1tA4BHhHGUF5xzvGm0uKc
         UnapDNLw/2dk/Xr/7PS5qBlbURcM50krcq6v6nDE6O4AUfxJxZfUYM6veiADPGNyECV/
         k0wCrnOqKuITzFIOGThwwqKVIKB/8D/mUB+FQYhena3oMaOtWgbaT6vEdg7WQkoLtcxP
         M+BOhKFdMhibKq+VgY92g80Sf5ep5Bh6CTGlOSDHhYtBA3ny7OUFtG8d2zDPF7QXJYD2
         c4UbpohN8KmBSYBuIuJaA2iefcPzX91UEbRfiF2onwpyoo6TUYZdVKjKw98PDM98HYMM
         jyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410451; x=1781015251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBRnQlPosMN+k8SaoyM/0M+4oXOyWiGOMBDGTHkddk8=;
        b=JsKeWuzWjcQ5XC5Xol0E3K7LFQI4oCQL8JEmLEBq92zNq38eGKMSUrj9wrpKIQKp+9
         TRRSVkX7soY4xsFX1uL//anJPrSOckFmrykzt2Ogj43LsQh7/dNwrGuTGUkmzrumvRdO
         k0vOB4u5JbI3p8WR/bJ3RHjjS4MeB7zpQBa8B5OIQFONX7m/lxsvRCh7Wu0huGSKtSzq
         olqUzub6Wssg4JR4VoDewO9GA6n43NtWCTGvMTYDQkmDhyD6X5jokIRTnJxK80Vz7q30
         5TaMFtHMTiflMiSB2+sP3Uubpb0cH8p+GX8bjBTqBG6R0z9wlS8gZJnWj/JaW7DVD3U6
         7ZEg==
X-Forwarded-Encrypted: i=1; AFNElJ+SSycA5OF2WBjlos6RRjBr2kRYWlfSwD4N3ITTe/h2oTTraDfVCDwVrTM+28C3E85yAkHK4L8TpYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8K4FTzOU+Ak5abXbyr1fzG71OUN8hQAqi4mUtk44plVJa1Mfb
	BvGjwI0pUgKJDjOBGUayLCGnp8+3CZ4rZsTewnWJXtDFr5FRFGQ+OgyRVK9qsCQagJA=
X-Gm-Gg: Acq92OE4JdTe8fpX5WKflN1+o3sYwblX6ppbKpkys9aFOqnq41NGQoc1GQegmygJEY5
	jWLKxY8XwTul/0/w16Zi7mfjHSF/XM+3711XYMB6OniXR0cC8j5d5tE9IIDc4rEOK/KoYkbU+Iz
	j714gyetglO0NuP4jOrDpnkm8daVw/iZYADoiZksPx9cc+G1VPCltlg2i/SiidvDzO2h8LIgmcg
	0PeLuk75RdFoY2T6bwDMHBHjjtFNZXY3fUPnrtiC1GAEksT4HISgZ+FAXd6jPvclQmADnoW/k50
	1mFeH496e+YmIQllAd28AexvBFX3pifERQBesC6Ky+PXMXNgdxT/vpBxE8aXzOwDb4a7/VaPShu
	z66UYVyx1RzKb8xQcn2Nu4as++/bbibaIo+7EyOrJY3yukfW5jIKY/blJT6vI+LO7NRMLE0cMw8
	OSNQHnJqxkHCWj/xpfPen2xxpBNyomuHaprUTb6QtdjMk=
X-Received: by 2002:a05:600d:6454:20b0:490:9ea0:c11f with SMTP id 5b1f17b1804b1-490a2904d8amr208279205e9.5.1780410450823;
        Tue, 02 Jun 2026 07:27:30 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:52 +0100
Subject: [PATCH v2 10/18] perf test cs-etm: Test decoding for concurrent
 threads test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-10-85b5ce6f55c6@linaro.org>
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

The thread_loop test only looks for context IDs in the raw trace.
There's a lot more that can go wrong when decoding these, so replace it
with a test that looks at the final output for matching thread names and
symbols.

In the future we might use timestamps and context switch events to track
threads, so looking at context IDs in the raw trace wouldn't always
work.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/concurrent_threads.sh    | 45 ++++++++++++++++++++++
 .../shell/coresight/thread_loop_check_tid_10.sh    | 23 -----------
 .../shell/coresight/thread_loop_check_tid_2.sh     | 23 -----------
 3 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/concurrent_threads.sh b/tools/perf/tests/shell/coresight/concurrent_threads.sh
new file mode 100755
index 000000000000..bf34d4ee77a6
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/concurrent_threads.sh
@@ -0,0 +1,45 @@
+#!/bin/bash -e
+# Coresight concurrent threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If Coresight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_concurrent_threads.XXXXX)
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
+nthreads=10
+
+# Timestamps off to reduce trace size, start disabled and use the control FIFO
+# to only record the workload and not startup.
+perf record -o "$tmpdir/data" -e cs_etm/timestamp=0/u -D -1 --control fifo:"$cf","$af" \
+	-- perf test --workload-ctl fifo:"$cf","$af" -w named_threads $nthreads 1 > /dev/null 2>&1
+
+perf script -i "$tmpdir/data" > "$tmpdir/script" 2>/dev/null
+
+# Check all threads were traced and they have the correct thread name and symbol
+for i in $(seq 1 $nthreads); do
+	if ! grep -q "thread${i} .* named_threads_thread${i}" "$tmpdir/script"; then
+		echo "Error: thread${i} missing" >&2
+		cleanup
+		exit 1
+	fi
+done
+
+cleanup
+exit 0
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
deleted file mode 100755
index 7f43a93a2ac2..000000000000
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/bash -e
-# CoreSight / Thread Loop 10 Threads - Check TID (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="thread_loop"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS="10 1"
-DATV="check-tid-10th"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-STDO="$DATD/perf-$TEST-$DATV.stdout"
-
-SHOW_TID=1 perf record -s $PERFRECOPT -o "$DATA" "$BIN" $ARGS > $STDO
-
-perf_dump_aux_tid_verify "$DATA" "$STDO"
-
-err=$?
-exit $err
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
deleted file mode 100755
index a94d2079ed06..000000000000
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/bash -e
-# CoreSight / Thread Loop 2 Threads - Check TID (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="thread_loop"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS="2 20"
-DATV="check-tid-2th"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-STDO="$DATD/perf-$TEST-$DATV.stdout"
-
-SHOW_TID=1 perf record -s $PERFRECOPT -o "$DATA" "$BIN" $ARGS > $STDO
-
-perf_dump_aux_tid_verify "$DATA" "$STDO"
-
-err=$?
-exit $err

-- 
2.34.1

