Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EF43546C0
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016032; cv=none; b=QtsrvNDXpoI0vD7rdX+BetQBvkLsVy1tB0+iHwcwqiAdp0aG462zgid88kblUQgiFY6biRmNDPN19r4KJDuZYOBnsA1EziIArqkuYaERuKrPG83WnLNSPKzBp4kuCribvLGkfm0RtZKrcqPtQugO441xEdssb6NEBP/Nn7a5IBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016032; c=relaxed/simple;
	bh=dIdyAuGP/OaUVcAMmgROZGX4ROjDm0H45x/4DXdzJEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGkp3b9Zp4I6CUIQdkUs2U+fH+lUvJmWLW4/tCLEvqiE2aJWcm5nntIOnAV1BpfliIe1znDBIggnxfB/Hfkj7YLLk8tb11RZ7GhYB7B/CtNg8Q/WGu26zVrtPJLYJr4L02GZecwpghSryf1kQoeMSrKEaGNUNDvn89WWeWy8RoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukba1lLx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukba1lLx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac357c55so61493195e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016029; x=1781620829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmgPHjWVH3cXsk2qRjnjPXugJJfk4bPfhv1qYZzCEfk=;
        b=ukba1lLxCvaQGy7Am1z2ze4BSX32hKePsH1WBv7K8XkHyX5RCClVKoZUoL30Icuhw9
         iE1n0Uu5z7vpRJ8oyNSBEK/uS3xx1UoWIIZS+ntr7cnk5nyUsmFCeKXKAxxAkd18grNN
         5pmOEyxyaw3lrWfgnCg1wn+qHLwxuXbd7eCH2vzbwe+VHwQ/50zbuzbXpM9IvZ/EvF01
         AHmhBOHsTApJV1B7385N7XYEKKomaIoq0qwPUEblkEExrRF/4TAPG+wul8WNdoti+nJ4
         BhjjydJ8YrjH3fmB7+eZM2XeX6aC0FrN8Lb7/KmMcHCow3sCV9naKuCulK9Tr5c9R4Rw
         T6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016029; x=1781620829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmgPHjWVH3cXsk2qRjnjPXugJJfk4bPfhv1qYZzCEfk=;
        b=SoTVlYTXrweyI8R67uUNU4uPApzUp2RrGeOJLt6JmeAMzMe1PH1b9zKS+7Iegs45Mz
         yJ61PiD2TCe8cwmRiapX35nEwvAjm9IHi3Gdr38DDItxm7Aw4UaZvBaj6hDQr22xMlQC
         sfEF1bXAny52/1PKsXxL+hXRl0b/eXkwLdD32vge1dGuIo0ICLQvfDNfaGgQvhr7a53y
         x2t6v/Mu9jqGO/AZzs/3mPZDqt9cEV9sboQtt+sSrN7Sb+Y/fAccRA1O1kmVytknlArQ
         tqpLyqJbP0hjjIf3fbCxoPucIgk0dP7yhz838Nm0kABYsFxlaad55JUya2+bdIjxA53E
         kjzg==
X-Forwarded-Encrypted: i=1; AFNElJ+Hm8TAz5arUeAjgc6VGH12VAHQQFog8K+AYyc/bzFoIiMwEqp9d2AeTyvF9s50N10hsA69Fg+v27s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhk765hrcHk2lP9CS4D/LgKg8Zztafsz+v13+pywIkZ4i503/
	40Vx9bjrRHxrTgPkHtAxLO8n2Bn6lCpsBY1x+CG9voftwWQ1J1eG1hy0xAVauoM9CHE=
X-Gm-Gg: Acq92OHPXzT256thf8LmOPqmEvrzbNch1U+9iL7mpl0kp7QTD2JLlybc9ELobP1a2lS
	/BomlPB6W1CKC0Xy7FGDMUvktK1rnyyoemxiKlEuSzOL4o0sO4lSPh+RalMSjXnk2+BWCUgb/Bf
	YXVdz/C2Mzp4yWPLw3br7hjLtxLOFTbqB+VQi5PpcaCnYml3JAyVt2zvRN8BXcd4KyciVaPtQlM
	3koftGPzJF6CMVzGlijqAtKBVvclokf9n6poVmNScGTWpY7FTyBKm2UsBsdTHAiSLHcvbH7HKmY
	Q0LgW8ZGmeJkIh2Zi50osK8ZMhxJOMkEvBb0Esh4Hou+tRCX3rAh3/zn7D9sDcJ6XPUTgNL9VDm
	EtkT56ejLb6JlRT8AfEkOk8poR3MIAwk9hy0Dp1DiOJBMma8mHWHC3cYbtF4q03eodMAoIlAVFD
	aGGQQTZclYNHi9xk7ArOe+jvgOSYeR5KhENi1LYvGLFh0=
X-Received: by 2002:a05:600c:5248:b0:490:cb90:3e00 with SMTP id 5b1f17b1804b1-490cb903f1emr190466575e9.14.1781016029071;
        Tue, 09 Jun 2026 07:40:29 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:09 +0100
Subject: [PATCH v5 04/19] perf test cs-etm: Test process attribution
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-4-d53a7d096a19@linaro.org>
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

Run the context switch workload on one CPU and trace it to test that
symbols are attributed to the correct process and that the attribution
changes at the exact point that the context switch happened.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/context_switch_thread.sh | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/context_switch_thread.sh b/tools/perf/tests/shell/coresight/context_switch_thread.sh
new file mode 100755
index 000000000000..2b9c44b86c59
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/context_switch_thread.sh
@@ -0,0 +1,69 @@
+#!/bin/bash -e
+# CoreSight context switch thread attribution (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for "-C 0" in record command
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_context_switch.XXXXX)
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
+check_samples() {
+	owner_samples=$(grep -c "proc1.*context_switch_loop_proc1" "$tmpdir/script" || true)
+	next_samples=$(grep -c "proc2.*context_switch_loop_proc2" "$tmpdir/script" || true)
+
+	if [ "$owner_samples" -eq 0 ] || [ "$next_samples" -eq 0 ]; then
+		echo "No samples found"
+		cleanup
+		exit 1
+	fi
+
+	if grep "proc2.*context_switch_loop_proc1" "$tmpdir/script"; then
+		echo "Thread1 symbol was attributed to proc2"
+		cleanup
+		exit 1
+	fi
+
+	if grep "proc1.*context_switch_loop_proc2" "$tmpdir/script"; then
+		echo "Thread2 symbol was attributed to proc1"
+		cleanup
+		exit 1
+	fi
+}
+
+cf="$tmpdir/ctl"
+af="$tmpdir/ack"
+mkfifo "$cf" "$af"
+
+# Pin to one CPU so the two threads alternate running but record into the same
+# trace buffer. Start disabled and use the control FIFO to only record the
+# workload and not startup.
+perf record -o "$tmpdir/data" -e cs_etm/timestamp=0/u -C 0 -D -1 --control fifo:"$cf","$af" -- \
+	taskset --cpu-list 0 perf test --record-ctl fifo:"$cf","$af" \
+	-w context_switch_loop > /dev/null 2>&1
+
+# Test both instruction and branch sample generation modes.
+perf script -i "$tmpdir/data" --itrace=i4 -F comm,pid,tid,ip,sym > "$tmpdir/script" 2>/dev/null
+check_samples
+perf script -i "$tmpdir/data" --itrace=b -F comm,pid,tid,ip,sym > "$tmpdir/script" 2>/dev/null
+check_samples
+
+cleanup
+exit 0

-- 
2.34.1

