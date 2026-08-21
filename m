Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA3470E8A
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305792; cv=none; b=qVmdB8Lk6exarZKCdLEiwj5qhMwI+XXTT7g//xVTMEdiqRW+evYixR9mIr2qbfdcZ9qh4E/TxM82JsJvSQwjOx/aDmCw0z1tJNj37KX7R47awWGgru2MVB+OfqidsvQKzH+ZxMlTF+P4nGZbGUUKIH9brCRIUaUMkSDqn27LJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305792; c=relaxed/simple;
	bh=oUg7RFIUnB5PZ229CdzPdEVvo+kzyf00RHPUIVcKnFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7D4xcDkeLjjQu6O6e9DaCh9H4o6TWMTpuiqm24dgoplye3GckjbSsbhs0n8TlVv4xZFprxDv/N0WtmEqZrRdWRvOgPTdWrihyqBpZEDSRFS29H3yQr5lO/6WLDLMnN7Koqtkyr10sfz3QrywufHYooWigQcFdMcvYGhAcu9840=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H6O8ntTq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H6O8ntTq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so6255545e9.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305783; x=1787910583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=;
        b=H6O8ntTqWyKgZiUTVm2EavFKcq4xkn/0S+NsTSyQgW7OVWJ+LkjTk9bqDwT0HywcOY
         jlc2tvwbNwHZ5vlEc3gpu6PYTO23prPrWJNQi/IejXJFLP2KTVFtmHbDhs692rrteWPh
         fi4rdrkPyNAXgfgTMxNmBL6sRAHiS3R0PIM2j5PZhb4KAUdGVys9fKecP1hkzOCKrRh4
         BCBngSUc4RQk/nwfAkNHlmS+vWg3yUcaIoHYCLAungY+xKNIIDRDvEjcTTiRwRzeiVBk
         V9cTnQ055KsMhXFdXmlk+TOBmRI5Kpo4gqxdCzds0dfLpgu6AgJYEdzqamdt3K9p2Rwu
         G4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305783; x=1787910583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=;
        b=rQ0c4pil5C1JKV+q92xwBV46ruMHDX1YRtjFEU8DIkiy9IZAwotAZaHcy3CzFPZyrv
         K09eKcDoEhzbK5aDyQ4LhW5uNWUwRc6/c1WNa77x2WneCBX5ImBeNP/lnYM0JxHC0mVr
         ufqe7dBMscNXpm9JqLVnTqPypr0wMjUJQFX+Acv7ISR4vrDiIv5Sm2AGmm3FsK0RJlBD
         8dKKM95O61pz8GxVhTNiALUbsYGue0CzPJ5YAn6SUac1iBDwyO3d/TPkgl1q5Jx+l/Fd
         gJvga30Wv2Q0g/Wy/IenwLo5XcuODO3wRnWfswPom1R1GdTqF5uWmquZJTsQ8a8IdqaC
         HWgA==
X-Forwarded-Encrypted: i=1; AHgh+RrUfxZUYXM/LBBZupnzwz/pyETNnbfSHccXfqE2g5d7kNMsSFPrNikx7AvZnaCnYpZ71NXCmeSQlm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0Ulc+TnXUJLZTtxE/t1z0j4AbO7j1lSzoBHDMG8rJBBlidJP
	q6glAhuKz9UdFHHdFeV0QlkwO1vz2Vb0ii2shemCQdhZEpHlWwBW69CO+u6UTwOFGrs=
X-Gm-Gg: AR+sD13G4nVlx9+QQiA8qE9ET5Sodyc4cUsky073tLV4c+abmqNieZ3NAzEzRHmej6z
	kLL6vHxTOoQvX488iq3UJ1BFWbJlCK+/3oa9FKF5W2BnVvpylDj6aPoxNet+E35XMqQIpsNykuF
	xiNGAThR4wMsC0b7fCBiK7V4koEcvXPgZz5BvI7J0mW+C7/sy4h6m8Tis0CsrwenVf9bZdrjVbU
	bZyTtuN8S+B6NKuHtfu5BFGKccqA51HHqbjte9MidIDIbO+ho3rsHhLOTMDsDA+fc/AH0NP/Ub2
	GyGWnoRRiN8lVck7+yawDl2oVqZMePkQFmJtLdhQCVCoaZ+qcMrBQPGVwqgpARUx1Rhek9SdLQ1
	fmqGN+y6cXtSq2Ixljtj8+svIWPezDKveaOpx89jIVueWAkj016aZDu6wUycZBcmX3/XB7hkGDL
	jb4OI4T4c6313T05MCLJjkYS7w7yIQ6OYI2JSyXb0Xxb/ONrGqkrIhTvjDbQ2TVn7Q
X-Received: by 2002:a05:600c:a088:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499b83572bbmr76994215e9.11.1787305783413;
        Fri, 21 Aug 2026 02:49:43 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:11 +0100
Subject: [PATCH v2 13/14] perf test: Add test for per-thread mode
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-13-00c4fd0701b4@linaro.org>
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

Test that per-thread mode works when the process migrates across CPUs
and that the decode happens in the correct order.

A TODO is left in for when support for decoding in order with Perf
records is added.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/per-thread.sh | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread.sh b/tools/perf/tests/shell/coresight/per-thread.sh
new file mode 100755
index 000000000000..77d1ed3405a9
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread.sh
@@ -0,0 +1,48 @@
+#!/bin/bash -e
+# CoreSight per-thread CPU attribution (exclusive)
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
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -- \
+	taskset --cpu-list 0 taskset --cpu-list 1 taskset --cpu-list 2 true > /dev/null 2>&1
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" --itrace=b -F comm,cpu 2> /dev/null | \
+	grep -Eo '(taskset|true).*(\[[0-9]+\])' | \
+	uniq | tail -n 3 > "$tmpdir/script" 2>/dev/null
+
+# Check that the decode says it ran on CPU 0, 1, 2, in that order. TODO: The
+# correct result should be "taskset [0,1,2], true 2" but we don't decode trace
+# in order of the Perf events yet, so everything is associated with the last
+# exec.
+cat > "$tmpdir/expected" << EOF
+true [000]
+true [001]
+true [002]
+EOF
+
+if ! diff -q "$tmpdir/script" "$tmpdir/expected"; then
+	echo "FAIL: per-thread output doesn't match expected:"
+	cat "$tmpdir/script"
+	exit 1
+fi
+
+exit 0

-- 
2.43.0

