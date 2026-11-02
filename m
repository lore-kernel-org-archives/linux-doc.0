Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621768;
	b=As06Jqa/+EbJYVvbbqYhEpbAJb8I5TZvwSmf9BSXfURhL6yCq3EZarOL5nCR8N19MHeY
	 4egxitEq7tUGKpC/SCLYsQoYqpe5X/wkG4O12nEn1Z66Z2hHEL9eBmIIlabW7/q65E8cX
	 fTpAzO+7WEIngOJsKvij6CoA5BIz1iGjo/b6K50xuk0v5Ve1Gzr1CANpqlE41sQYyY/HQ
	 qb8ynwSq+ejerL5/35xyckQIzErm7BpWAHevLBg3XnI6B76MIMl/DLv7Yu0yt+D7wuPHt
	 z8koejpdoJAZPLF9txdyfuiWKQnVX9KQn8f03CQh0Zcmq/M/M2pmcLHf6eDyLMk5WWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
	b=SXria/MmSeGP73QxI1RzRVLl0xHKVX8No0liVkhHWC226KYOFcczsNnC8OalQgDYopHc
	 AXKteWcttC3850Qi/sSQNw3i/ArWpyB1hoEaIjhjXnGxdlP9FnyYVUX7Z/mmFXISyPhAV
	 XW/yB/N6zia5OgC0mNll5WLgbYSxDpYAOXVgKmQKg6vHYR2u3ZoKyXTxtRZRDcHph56Zc
	 4O2MPbYTN4wN5bU6yLmI2axY/DbDk6Gq8b1Ekp8YJ3agqb6c9BGjXSq2ECwTS828ximCL
	 jlA2k9AB8B1/T2QYh26bpKGtvuOkGoUcgh2GDplSczJTmutMFilFmXvZRdhD/Z2g9xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jWR6o5+Z;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E890606C4E4
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E890606C4E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jWR6o5+Z
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so14974545e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621767; x=1794226567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
        b=jWR6o5+Z+Jsc79bGAtocigWQs/3pIjO6vma7MnKXFqFTyhp9R9yMFyAsgUzCQ06TL2
         XqdBAnG4bgq+qvsAv7tHNDXBebqq0PeWNOIsoT7V3aZBvblJFR2UZrGFXb6Dlw8y0biW
         vJTyDq9oAiDJaM8+T+kAkJHmK1lLRKxMgFV6n7A70JJc3qvAOtt+kM+AoP12lhvJPLR7
         QX6+6smE5W6cz/L94nCXfjP7u9Uq5lGTcH67Cij+E9wcvIUveiPvd7q2USPiq9hxCYgA
         /8lRVci64n2ci5N9QYTkj0eh2rWQyoVamZatDnLigDAytv3DGtNDd6ScgEjs18s4onWV
         fXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621767; x=1794226567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
        b=vbYGiKXEOLw64ZQjppAqIadhwMwPMGgyZL+fByMY7fp95N83M3JaqJaDzZSluB4g7X
         mggk2XdGWZzv3POYkZn6umnY3xUSVm1BVbASeoGnCuYVU+rwobua0pWVFkJcdxj4Jb2N
         A9wcr9lCe5c4fYm/kbYEiZT99eYSudjQeH2Dn+ksFFImAP796P5E45N3vi91Xwdo1deS
         ZYaoiSVEEYkV236mrXxClU5PNbklmAyDzwXkVa0bOClI5tcpOdEaGNhbU38mSfXDHaFp
         ltyuf5rAQxujbmN6hGRV2cd6AJMQpomqDlqBO1hzN4sfnTjecpg8hib2+6dj8iVzOEy7
         B9LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvmsLGD6XlVx/NmKWoZqnhHtjby7DhflItXnf8wImxZWka/fmpuOxB3JFtu6E6sHtr2mDBA1D68Ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1qIsD6de9Da/MriFZQska1ssywUB/U+lRFv2engI9ZSS0jr+W
	fS2WAZEsm7cSsoJUHd+4ZpSgtOKGAIsYwMtZMPJCL13Ok3rUQl3p1Pu/o5OuuoEv/Dk=
X-Gm-Gg: AYBFou0eU42pwM8oH9eSKyw0ev5nmgkIZcHlrdhf7WSIDDCt/jn7QpOAhh6sgEl3hDF
	Ib3M7GscQHgANM+jFBE2qmH6pfVmaxr6WC+eNQh1OMRJSef6T3ktPuR4LLdeS9bMQF1By4pyxb8
	eC91m/KY8huuWMDyVpDCLYKhKfZAW1NkPsdOrCITd0l4dbX4i0oJZ0nowtNJ42B/2jHBi3Y9uVf
	rWZIshbl2iLBCtCzdCu80kh00RRCMWPt0gwLjJgaVDI+n2wLT+mJDXZktcidn9nBtt7pum+ILtz
	i/YeRnFHhLrMeIulcjow9ZiC078KBKfAzVKDaj5zXrcnTUrq96KdeaUu8CJZt/WOOvj8HdxHh0y
	EZW0G3mg+y60rt7lcKGUwUciyFyC1E7rqgiJ+xyQpvHXAVxn9tx3N170vGQ9gK1uu4ItI+/aDme
	0Og8C3Cd9Jxe2QAxntKjSLiviCe6UoihfOd5BsRM0gdYcp4udmNjke6vQUVqIQ3S1ZrgGEmNIdN
	uCcaOvrUFYXE2J/hYIet9+SELuNS81WagNoLF04bLDYrQ5oyt4+XMkVsErho77GQsLc8I7Gcwxd
	I9iKkDbmLTZ3YDgHAMBn3mO865H6ohlz46AbzsxodNXsUVMTiwFcDA==
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr204596495e9.28.1793621766831;
        Mon, 02 Nov 2026 04:16:06 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:06 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:32 +0000
Subject: [PATCH v3 18/18] perf test: cs-etm: Test multiple per-thread
 threads
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-18-dbcb0c281b9b@linaro.org>
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

Launch something that has multiple child threads, attach to it and
make sure that all child threads are present in the samples

This will only work with 1:1 sinks/sources, and looking for TRBE is an
easy way to guarantee this. In theory this could also work for ETR
sinks, but we'd have to attempt to record and skip if that fails, which
would make the test silently skip if the record command started failing
on TRBE too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../perf/tests/shell/coresight/per-thread-multi.sh | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread-multi.sh b/tools/perf/tests/shell/coresight/per-thread-multi.sh
new file mode 100755
index 000000000000..c6bf1ff2e53d
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread-multi.sh
@@ -0,0 +1,76 @@
+#!/bin/bash -e
+# CoreSight per-thread multiple threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-per-thread-multi-test.XXXXXX); then
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
+# Multiple --per-thread events are only supported with 1:1 sinks/sources
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
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

