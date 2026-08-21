Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C821474246
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305802; cv=none; b=gvRy+h6eApUloamljw8VSLD2JkgNq+Y74LkI/rQRZHk0bao65yS+BWnTZPNbUqIR8KLMFEFo0tKeNVaJ+eDvKE7junGXP5DkLHXcbhJVGfpj+Z/3jn1WJmPrkdBsbCX6W3B8nRm+dHoEijtL5nAmkpc3BXppVK4kbiWWFHcmKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305802; c=relaxed/simple;
	bh=45ewM2dvFaY12LY151swUHBTvievnc3sust8Ep02uoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWAsqSkTGX0zDiIrVUwVzJ6XismzeHEKyxxw9q9QosPKQkI34egOCudGeVAKfzR5jr7bZzs0EyY/5xyjsdIn3ZtDr3wQ8Ak5SEtvmekr9su5FlHcBW+p+SDZ7ltATk0mbET4Q/O1lkMtsR2lIgEATZ0AcpcWJ0ta1Qoj/6n4EAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RfttxknL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RfttxknL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso399084f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305785; x=1787910585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=;
        b=RfttxknLuTZt2Qr2BtWUT3atEqCHAqw/Kv7RKtHnY/+qIU84Zu5F5Dh80192T7cCVL
         2pxI1RM+McHyqNi2AAJbuESxWxi8cO7LcyLZfqrjgDZ7j5/s5q0M/SW8vNJm23o0eSFd
         0bM5WO76hYjOHcaeVznou36UFTGx9dxW5sNYPFpF8pLR/kPjzUJWB7PcBQTv6xVy1e/o
         oos/aItt3jG7nDxA+RPrMJSCt5Jg9IgFjsisZ7iUx78ZbLSVVeCRvu9Y+T/fr0ssYOoJ
         hM6hULoeJsruVz9ebMTSkfH6iyQm/9OuBDA2mLnAm/BfChtDIC6gCme69mNqh8K2X+jw
         UmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305785; x=1787910585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=;
        b=l5miYOPLNpidrmwLh23+gSAWviE+Erzp0gKXjqD8qRsctaBRCxGkrCqWHzVsJfpbUx
         aysz61YqdAFl+Rj4VpicNZG1xX81/ZD7lasfOI8DVWe9g4VS8i9DolK+UUefhEvmH/XO
         QI58ici9QOjoABMU1BAbXLVF/KYBoctJmDPGro8SVowxixHgIrLjAOK1SMu2tVA10HLT
         kLL7j4hb+3Eu+PFEGriuN9sWhzIF/3l7Dqipa8lScpYsk/8eYMRbAXLrRRUgfSO+0wxU
         YyNHbCyUyuOXYzcmfzCUgIGm75hWBz0Yar3HhzmpoapWZt74gZ0cPCCzhRHvlsMfhvhq
         2DVA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqu2gqii6VqRfvsIaNxmjNZE0AsjMl0hM4p86xM4+NnyE3u8xj+dr+AWw5WANAMHFxX0SmiL3NlRM=@vger.kernel.org
X-Gm-Message-State: AFuF++n43tAUu4PZMz6MMeG2E/bjiMUJf4i9YQyioX6VV3zd4XXIafvf
	2VDoGRrHbmnHUe63vOJgbn5paDtroANaG3TWjOnNJxaYt2wBlocZLzQdR4O0yKcI0c2l5GCZ1kk
	Y8sTNuTw=
X-Gm-Gg: AR+sD121n9h4LDrwggee92YRbwB/f1j3MZnmGvtkallt9V+wwh4xNk+DMjgFiBJufpZ
	c978GwtHOn//1X8DDNeDevFupOjeGPjVZI4fS9Ug4mvpfMTUHpop6qQcPHTnF+dHOU4Ff89PkeP
	C2ixRYxuv9z8mLW7o9gnPJKNdIUeuCfE7xf41E2/WX6s5MwQnQvdZRlU8bGFvrkbuusKwLkvrxz
	Ci4bEG68u+2ru0zYpU+81slcqdfpgma5Lr2z/E6wNYyJyf4EAVL+sgB2+LubwQ+i5CSkgXSvr37
	xSHApxcAXrP8otIzh7QVisOXbu5RKI1vgdbMsZhkAgIlT2UOOpJ4bPZQ6Qogy5nir+Uh5TrRNoC
	2gXQa56HXt1IO/xm2pZ0o4vErlw50qYjYRxlm17Bm9SkAyIskcKqQl7qBZ8QUFyPHTiqYJoyKJy
	28ybDG8+LprsSv7ynGb7HSWYuK+AnyXTOWKRneHhrQkwt2uyAJK63BiHudYtDCRbpG5IW4MBNUa
	H0=
X-Received: by 2002:a5d:5846:0:b0:481:3124:c71f with SMTP id ffacd0b85a97d-482c0b907camr6412779f8f.17.1787305784814;
        Fri, 21 Aug 2026 02:49:44 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:12 +0100
Subject: [PATCH v2 14/14] perf cs-etm: Test multiple per-thread threads
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-14-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Launch something that has multiple child threads, attach to it and
make sure that all child threads are present in the samples

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../perf/tests/shell/coresight/per-thread-multi.sh | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread-multi.sh b/tools/perf/tests/shell/coresight/per-thread-multi.sh
new file mode 100755
index 000000000000..ea525ed5e18b
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread-multi.sh
@@ -0,0 +1,78 @@
+#!/bin/bash -e
+# CoreSight per-thread multiple threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-callchain-test.XXXXXX); then
+	echo "mktemp failed"
+	exit 1
+fi
+
+cleanup_files()
+{
+	if [[ $parent ]]; then
+		kill -9 $parent
+		wait $parent || true
+	fi
+	if [[ $perf ]]; then
+		kill -9 $perf
+		wait $perf || true
+	fi
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+# Launch 2 threads to run indefinitely
+nthreads=2
+perf test -w named_threads $nthreads 0 &
+parent=$!
+
+# While parent still exists, wait for the 2 children to spawn
+while kill -0 "$parent" 2>/dev/null; do
+  threads=(/proc/"$parent"/task/*)
+
+  if (( ${#threads[@]} >= $(($nthreads + 1)))); then
+    break
+  fi
+
+  sleep 0.1
+done
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -Se -m,64K --pid $parent > /dev/null 2>&1 &
+perf=$!
+
+sleep 1
+
+kill $parent
+wait $parent || true
+unset parent
+wait $perf
+unset perf
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" > "$tmpdir/script" 2>/dev/null
+
+# Exit early unless there is a dedicated sink per core which only TRBE
+# guarantees. This is because shared sinks will report BUSY if two threads try
+# to use them at the same time
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping output validation"
+	exit 0
+fi
+
+# Check all threads were traced and they have the correct thread name and symbol
+for i in $(seq 1 $nthreads); do
+	if ! grep -q "thread${i} .* named_threads_thread${i}" "$tmpdir/script"; then
+		echo "Error: thread${i} missing" >&2
+		exit 1
+	fi
+done
+
+exit 0

-- 
2.43.0

