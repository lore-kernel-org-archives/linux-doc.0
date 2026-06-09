Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC3382292
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015494; cv=none; b=EBLkYBf9JQy0yuYeAB09lg9id2VjPFCj06zP9ynKo2U8Z9+vhqYugSRZVoGUfXxV8N3GW6F6WybsSzU8qQklbpd0yH3kOb3sSume2rZmTEgbT472Z76fSWgS/iMG82In2ffCuss8Xoozek9fG1t8j1nxpQb+uW6+upS6oJCco4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015494; c=relaxed/simple;
	bh=JYW1wo5ab8agRdVZbjqrOWWaceuU0TjELaoVo7f/di4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n0IOfAqjSPglFQaQXlGRqLXU69GoD5ioGEy7o69UAGqFPV3p4/sxxRLby6NBUjCJiLitIOof0ikcdr9rjjfGk4AdJvYvqhgID2us84WJ4NLb+doAVgBIrZmsMplvuoADY3/BPPd1yLW/w4KtpbaUOKcTfExQf+cP2GtHVDJTto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EjZ/pIYj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EjZ/pIYj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef1198766so3235586f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015491; x=1781620291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWKqHsTkFl2zrGvjPzv1+aBtZDDjn0PHucQTDAlzntI=;
        b=EjZ/pIYjNUEd1AE0INJ7Cit7NgCLPkwP6uWAJSBZq1lQVOqzusEgsCsMiY5OjYD6np
         ra+gGLPNcVuBEY7U7zeQDrLo3zlpZ/I7Cc76U3o+HOHppWbX6kzeeF7/yOQgQN7m1v4x
         nZdk01TcvOUKfd1WoSPhzidayWRhRkFrUj29IDFcmbzbGFMKsXhtnBcEBN/1AIxA8qoN
         iOlgtUN5s87V0STWjEqCOLU+v9kAa2FaSfFGG6FOqRwGz2POS4kR06tz2n2FeWUFaqrf
         zdJFzfu/sLgoRH6dM1YJ0UPCmnwtaZ/wR+Lt2rA+QkM1x7sScf9jjhIRxF0yJ5Z4/SLN
         g/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015491; x=1781620291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWKqHsTkFl2zrGvjPzv1+aBtZDDjn0PHucQTDAlzntI=;
        b=syLZaDBjtWGXm5MYNws9TG7UtTn0Iq4VvfNcym3DzlN6Y0tOGWdysytnjl156Ou621
         ju802JyhcTFVF2xN+R4XamI6iZB+4ozw1KOf+wrZ4Xbq9wWWjIaJ+NsVn9ujorKuNxnv
         /OMQMsb1Lg5wNuifATRqBckgjQA5czIWTdYBi9lhkdwYt87iX+B4ERU1Q/JhEbdPUVAw
         JDDUbs+KmGxfDrYGcwfxmpqVn/47PhlmJzlmkUZlnzLDv7gcj9lUQU5PwRIXXTZfVsA8
         dtpZ0frN0gyv5dOheELM94WI9P5BzB2C+sWmzwwuUip5nIpAIpcAAPdbCfPjWaqiAwFo
         Cj3g==
X-Forwarded-Encrypted: i=1; AFNElJ8v1bLDPkJPpr1FBH2NGumx3NdWV8b4gZA4nt3aMFUup1Bj4vfwB7/s7sA1x3z4HRMs+WDDG+oj0eA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJwy20HyKADBUjoKT2fLBt36YtvohZJvLfB03nleyhSPn2hDfr
	74/E+Vvo92eS1cmtnlqmVaJchDdJa74wWROoZgAqUWCMWTDCurdaIOGDp2ciH1xE0wVpIiVSPE+
	CIDYOHZQ=
X-Gm-Gg: Acq92OFqvK5SpjdjGgL+2ogpq5bRNin8Us9hi3qMpF6Glx0LL5ywoTZOq2wJ++ai13A
	9h65PdjfNeQSesiF2crYPpSeJjmwBxWL1xEuRE4urR56IVJ5dOdZAUiqvPrommqp+RukSc6QX9D
	Irp5bg80Z1AhyjnYKexnqHarwahtv/5IEEiOelfy3lWOYXcbQBEyVPCNGiohvaJ48ndQ1FghxZS
	eAHveotdGuwJJMz25faOMZanmiCgRMqAwEScBTgwz3N1O4S5SY5dUtQh3aDiFCPOHgrctxkZXQh
	PZ8qppUPSwtcPvxdMzRhelUOm66ekOFjyVhf1Z6k43L+U4o5pRWVH3BePTeSdRgjtjUmAx3sEpC
	DPanZ8xfsjhjs4MH/s6KXL6vh32l8LlKHmQhUZ492acObYVM9bxN1ckI2RMfC5itckOlf9JKuF8
	OF4vjhUYleb4xop3eJYv9b6MYguy2YAmR6ahxJg5lKYJk=
X-Received: by 2002:a05:6000:298f:20b0:45e:73a1:8d04 with SMTP id ffacd0b85a97d-46032b61217mr19196157f8f.1.1781015491574;
        Tue, 09 Jun 2026 07:31:31 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:03 +0100
Subject: [PATCH v4 10/19] perf test cs-etm: Test decoding for concurrent
 threads test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-10-44f9fb9e5c42@linaro.org>
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

The thread_loop test only looks for context IDs in the raw trace.
There's a lot more that can go wrong when decoding these, so replace it
with a test that looks at the final output for matching thread names and
symbols.

In the future we might use timestamps and context switch events to track
threads, so looking at context IDs in the raw trace wouldn't always
work.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/concurrent_threads.sh    | 45 ++++++++++++++++++++++
 .../shell/coresight/thread_loop_check_tid_10.sh    | 23 -----------
 .../shell/coresight/thread_loop_check_tid_2.sh     | 23 -----------
 3 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/concurrent_threads.sh b/tools/perf/tests/shell/coresight/concurrent_threads.sh
new file mode 100755
index 000000000000..3349fff8c767
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/concurrent_threads.sh
@@ -0,0 +1,45 @@
+#!/bin/bash -e
+# CoreSight concurrent threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
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
+	-- perf test --record-ctl fifo:"$cf","$af" -w named_threads $nthreads 1 > /dev/null 2>&1
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

