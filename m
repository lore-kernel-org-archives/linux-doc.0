Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621772;
	b=sZ5Yup3Fn+KnxsxSoUrOdj1PvoRF8VGaNY2S8d+ht7GfT7XcYJ7o6O73HpqL1fjtE8fS
	 qMNPMSIn/OshxYL/bNzKVqZYtmzAiARRAWTM4vjp5BzoJKIL9RYsGhxR4CMXW210aZuXC
	 dx5zykgAcQG2cH2LZZv+iM+a7tFHCX44KcDr5Kb+J0DG6mVOzb/lxlRskD87s7Ie/82Wx
	 pNuugyYZWKMJ+kyei6w0lFpTXh5BMlC76GvLhS1JFPvTEUCR3xJ+63etf6dKkS3eEh5XD
	 2RAMISykkuhBxQMyOMtFKYCm9siCfypz50oq+6yDFl6aYk5mqmayzYXTUIE45Y0l4Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PwLKLb7Ybxb7dpIE4IVyJShyxd5syhw2GQeVgctsT8s=;
	b=oaZkFmaqVshYBinVWwkMiFvguUBZb9i/hr05OeurhCJ3PgBZ9PFAtpz5ldNo3k3rJiZj
	 H1VvhyV/zLGZi0DR5mgDzZDv0iyigKmeZOeD51f2WQW3OSluhBo9eSxAHueMJ+FjXohsK
	 7SiP60vMy7l/1j/VBbwmwpkaVlJ7xu9w03kXhHP5wFHvuT+ONDfhC8YgGISK6wnH4skxS
	 Uavmw5xtBLSCMXuPqFkPwz1VKef4e7ld8C2Az2cKzgigvQj0JAmNFNUWo8Iop/cPjtY4m
	 ZB2YSRF0nC3+t4mbXoBp+twkv5IHfrutg5I0u/IDC3qfl11bUqir5wRfqJS37SqmfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jieUG7Ks;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B174606C4CB
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B174606C4CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jieUG7Ks
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so23420055e9.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621765; x=1794226565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwLKLb7Ybxb7dpIE4IVyJShyxd5syhw2GQeVgctsT8s=;
        b=jieUG7Ks7kdYI+f8jpTkNEJQQ+zYp1cFDMASZ4g6OACLyUF3o7oEQUYMEPKLrU+aDY
         RdEuIgZpTfNDMfIciRMQ7Xn06H9V00Mz5vAJ1lxsztA/dxQ7iuYTI7rD4zI7WvdlFoIn
         iyPZQossTRsCPEWZaqf54tCtiYNDm2GLeOalF4JpemLGP18nXWNJ3QAfJEcIzraNNmTl
         YxSWyruYDOE6GykxA1MFaRo08tPDFWsL7sBf8XQbHTYuh5Avkh0N6vtk+3la2/G38/dZ
         ifZWPRTQ/qQhPFMMfB/ogczA6vkUgloZOsOKXTvYU6RZQqkSegrKM3g24GnJL+ixF85F
         b1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621765; x=1794226565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwLKLb7Ybxb7dpIE4IVyJShyxd5syhw2GQeVgctsT8s=;
        b=2jn8tRiGL9LUfX8C1N3y+tzYTb/rc0m7a8vuVFif1ETDcAF7X0sEUM7UPFonM8tYsK
         jil6CLmgToBlCQ6K7nh0XeHKvq1zwFOHg/dRNKBMfYO3Gv7u5ILs9QpHjuxRdVudKlQv
         SGl07cU2m7VXAEnJB4jAOdyPWU8mT8HNeky3mkx86qw2GUAvZPWg7e9KsNmI0jUBMVGW
         A1/TPm3T4KCXKWo+sLidg55nNH1uRPHBpQ3cehpmFDdVOi/t5tKhrqNsZxC+5y/XP7Zo
         HwACMjRyAYhotqRGsJVJ335AVRVyHWs3A0VFn5fCMuIOUiNVktXYB4ijiRfmVDT0KMs1
         kmEA==
X-Forwarded-Encrypted: i=1; AKwUvBxwnJmXhrnso0tBv/nrsYUt+mBxDrSE8Y4UCz4A+WFpQTwv+xHP3sXcqI/YGCBWhOpaPHMlPedszic=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvL5giGAiLL/wATawPxUrJTqtvsu5ainMGa/KE0RCZOwV5VzyH
	EX2RwSnFdSVNPF8pGsWuj611kOs8+axdd02M7QhdZIwzIEuLzfk74OwE94JlcgB5i2A=
X-Gm-Gg: AYBFou1ZDo2tSLyF33oAHuIE67HCSBaj5LOo+PYT3L2L5cyADSFXPfeT1cf6Iu9tKkM
	zyWJixu1VpdM+U7Q9a3eAA4i38SWQgxraqtkhw60u7daXjt9xsIsymV7vwn7mhiSGF1mNqYbpEJ
	IYO1Exj96sL/bB0S/mqEtzx3AjC6K8rsJSzk80jovbp9/LlqbB59b16hgEpGvIlG0ALfvKMqMk6
	zs6c3OWQPdHWrJlTdiBvAfIY0GvozB9HGcedVuVxWXzyI7061Lo+hmpRDgA10bvo5/SpUh5QfsO
	SP9lvnP38doBMQ7kJ7rM3agbkW/iY7ayufo/C7dnl3PrkXGefGXppSfV/ARRzty34mVrL04kFE2
	C63JVtsJ5sahakp58Qtp94LCEB3OfSCXb0lNYVdgRUadUhsdUXD4aRS0vAldCOW3K9PH0bUqVhA
	4cELKa0L0x8l2Xv3GgktScQ+MT7u8cgFMduWSkyrS8qwlfWgzK/sBSLoEukfSqtxfjJrV1dcdxs
	kjQuiDatIlCf5mr6JaW6oCOv1wLnVbdybvcF1gDWjcbISu6D5hSDQU5DEQ2G7dogG1cYxBJUYXt
	SO6KJyHrIfxD7XHApO1nXNmofBuTKf0A
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr201378935e9.29.1793621765487;
        Mon, 02 Nov 2026 04:16:05 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:05 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:31 +0000
Subject: [PATCH v3 17/18] perf test: cs-etm: Add test for per-thread mode
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-17-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
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
index 000000000000..8a1ab9d8f1e7
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
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-per-thread-test.XXXXXX); then
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

