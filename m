Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879148;
	b=yK5MxvdzqnbDkrkKzy7Q4E+bwKGZ2w2uWVCTM1TuZVyJvJjFhfHUyTIivj+PHtt7sr5O
	 fS3KcfnWlvFFUA6uhuYNT4gsCL6RVo2yMUI9aS0yiMOjdvaOM9+g3+cEaZkSSSbEd12OI
	 TtrE637iIC7aO+gVn4q6yHvIUA8L8RMyBZhkofb1erur1sG9m67PMeFKq0/eYbTmmEZ/d
	 ic8O5RLiWJ/Tx6UaS2o9b0V42ctFwiUt42Vth58MFUbETr6CGQroOsM49pog8uBn+rykV
	 P6ip896posyAwVtw64//LOEGHjLPuYqcz5n2nlgGpcdGPtZSOPm/7AHRcWv0IVkMm5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
	b=uYlWW9gqo5Jwvv2s1ueRsLiWFrBmhpPp4iqlCq9eVdGU5nA6v97PC2npufwjg3VkG484
	 kPy7cIn8yiFtdGJGrRDrGCB4O7iqQbP/BTphsAbGA3tAH132FSajYwqjoFIwT0G0bGj7Y
	 0gSGI/I2/tUtdXlKOlxQ2n6a9a3t7L6A26p7m3eX/UEPHN8T0QbBi2CRnVg+q8664IBY+
	 U/OJMwHGCYzeuN1AnYK3ozx3S0jLp8lSZ+Wg8aJAY8hIuD6Dm0v1jzBAfwl24gW53W9wX
	 gLMGWGhBkft7rRZfy2EzIv+D1kwaGNrh1VeD4C37hLegUGKopoR7tDE1HyVildKipLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I7oinnSI;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D313606AB08
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D313606AB08
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I7oinnSI
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so16620315e9.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879146; x=1794483946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
        b=I7oinnSIex9WFs6wfj7U4/5LTijkW/OBRe1wgdWSEGSuNIJLRIVB4EeDFohVHeRWpy
         DqjStibRNJH3jsN5HSVGk7cfRqcBC0AarDaLs87TQiySozz+SD8cF4F5KLETWWs+i1/F
         pGKhWou+u9v3gqQpJ/US0ijSsGmaebkIse965iixAd/5gRXaE0mk+DF4acZr0o3eyAKb
         MqvRpNMTk4evk4WBlWlHak1egOjOCXK8HBjPiwKrraYDiX0ZXZzuH24f+1DcKNCEHXNW
         mzhQ/NsZ/+5HecrctE5PiYjZlAxqDhEeqRyWa5JuagiLVzLPtrlz1/sL5nMLEqblRmdL
         S3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879146; x=1794483946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
        b=zepNpHr/gCrAgBiPHuRyCCmQUEKTjNBK5+LSe/UgbDa5/EW/7ZavsB3fYlZHtrmBTj
         alm+jdyG0BbGwql7kEfWlFr5BIZIdbo282TiE2KSHK6dSo5tNf/RUNuNH5fKfqXiYVWS
         9HPoILjbtX2DGKk5vMBx7pnjnvKRcKvcCz674jx3/q4iet8f7aOGMZXDJF0bunvx8nWP
         6IVqp6iS/U7v31qterQJRwPcmK/b9XMqNE+0fbZGJNp3DA8xAQ0Qu5BnzWCroetCIqUs
         QWMAFV6A8lfgztD/LzT+w9Uqbt54uleO4OyYbpkXejcIYA21NlLbJuJxnVxJwA/uq0T+
         i45A==
X-Forwarded-Encrypted: i=1; AKwUvBxRe7M7I4RaSFIeEBD2Tfl3H1uemGHL81oz+cYLHZsUgCEEUTvMuDu7wr/AiMgP62X2HRexkhcMMVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mkuik3LR3RcbK93fBoYoWGYutntiLxVM2MScXbyWDiLxlFKJK
	zsSeB5/4bk7Pyaixi8rntI1Jb1MkcxOSyrteTlqFGEBtqvBUtQrgnJ+DwljdKT+AtMI=
X-Gm-Gg: AYBFou1jSZwFtlVhs+dnD1etH119Ubnl2247DUhjNwYa6N/T7iIjXcGxUNoP8DVaSuj
	rHqPzv2QlYATQGuqqGJYqN4pISMbf3hyJMPd+lZ1JzA3Ahp324QbZp+ovpRxdCVwpqj+x310Sqt
	iTbiVARentLlcF/PIaLbAnH/snVah1Ieltm3Cg2I9Z/6bEW9IyofAbZmnvomnI+sR/sJuwZOAe/
	CLLGtHMviVbQioiSFJ16d5N28U/AZAjAV7sEu/GDCGrX3130Gs4d/QRPimYdU9qlnBne2VtdW9W
	4spmkWS651YrxFm5g6mxxSxUlVb1Jcfl73gM3/p/g+u2NAtZQutWtThM5QdU+4O42PwptFfjTsU
	+zRA+rru9bWdHlURlk/FpxUCUjreM1/LEFeRSSv2DW/cST3GgAHIHjCWpYMZjcwYPe2SuhQsTYB
	YCJlH2Ughvmgx9vBe4d6j6zRuzouxvvJWMLoxVLnUKoGNChGeFKYb7XZ5SKTCl0zoWetuVfIv0S
	PFownx9gPYzvsV5GVV8Y9cJGycrNwNfv77X5vtzLLOM1fGY6K8ptj8BZ10xGkj+OaWU2Y1TS6gv
	oYLI1WpMRCBP0Fhww2/0NkH+0ZT2TTK9
X-Received: by 2002:a05:600c:1f93:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ac182dbc34mr397731085e9.14.1793879145713;
        Thu, 05 Nov 2026 03:45:45 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:05 +0000
Subject: [PATCH v4 17/19] perf test: cs-etm: Add test for per-thread mode
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-17-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
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

