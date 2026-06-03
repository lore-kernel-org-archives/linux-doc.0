Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EC390CB8
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481849; cv=none; b=AreyKbU5HdN+qixMH44y8IAvpWR/53Lwz1bKSgGbUx2KbJg9NlmwIAkq8HY2ZTIA36ZFHmvyPU0/5Ml9FzSkzEcPjfdNiqQh0eHXHJzSzkL90rblKkKOHbpgtSauPtQ/uTFaN8SUW/Bdw63bKZ3aAyEiaQg9tD5CZyQjFjwnjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481849; c=relaxed/simple;
	bh=iQVBxA25lW6A4uA0ACC2OMef9MHB9JOIgp6xmgt6rqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZMFsEdoxxXPPf+baRIHatF4q/jiA/dMn1qxpbp0HHf24+B7ovjBjKSHiZOCmmt8/rZzJZHfaA9KXV2gRBDSURD06XM2Z3SL3QeXxds8MGqmd6JNrwveLAcefQ7E/UMqHFFYO85HIhF6+JVPPDnoTaKl9E5pZ3uktSnba4MiRNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcIi0puf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcIi0puf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so7254948f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481846; x=1781086646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EO8/K9YxgiEJpvhD7v23MJuqc72Imxv7cQ7m/8nhtl0=;
        b=YcIi0puf/rr0LOsttgmuR9cl0YySyBjDmDO4eRwzLbZMiFhyMD1lnjCQC1DA1GCpKZ
         PgQ2fcQMt8iR+CFbhigAcSvvOMjlImHjJZUGhkGBIkLhKk0xd/u7gm6fK24e9spUNMuN
         NRZgqSVVB3Lf97xPhlI1G6koP+jZy4NLdSP2yqoyYRn5M6/6Kbuboc3CmEPoD9bwGjZh
         iLiOaaE4TD1n6JUJH7dtGTgmEnRspON4bbxK6VK9kmT1VLUtF2rWdkAeobOEv7nndYup
         mOHmwY8mW1MrVzC14Ca80mN7JDiFDmCVF1akGKzz2NZY7YY5oPBAKlFnIuVPtq/X/dIZ
         9QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481846; x=1781086646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EO8/K9YxgiEJpvhD7v23MJuqc72Imxv7cQ7m/8nhtl0=;
        b=nXocABsxjSyXT7SHL3m2+ECCxNeTOlqn4Dnc6YuUI9TVkSAj6NlABIeOTpkJgYf9WO
         Yc545M4/+N4fk4GAwc9fpdmufDVpZ7lq7lWCToAZs0st8ANFSU4NqtJDPkCBOW5bUHkQ
         SQohwZeNJWKQAZZb41TlP7xUK7lYIPsWnfFcluDL3IuQpPL6K2bc9GtbZHf1qpWNdSC8
         8RQiyur3C8+vRi/3SwOKnadGrTqtphiajyXoOQPdCSK7fYF3xmhHowiUDtT6lME65ejb
         j1u2PfCiIIwcyuR2kTOX1/QtGvsMucG3kdFL3b91hQ5yYwYQduho/Geh91J8uKPF8t/C
         AUbw==
X-Forwarded-Encrypted: i=1; AFNElJ8H1EmbG/4IU+kMan8sI9iZy0ERr7oksX+08YzsJLrLLgloDPHtJ5DFM+71hChyiXfxrFolRGEgH+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLR9JOVXwiWjXSpdJ+4wbaD86Wma/aI/2ohrCGL78F2XP534Y
	xYgrUfDN7J9Sy+Thc4SdLyiWKfYIvwr90bm/5f9jEsOs9u2HrLOuwzAFfkaz990L2B8=
X-Gm-Gg: Acq92OHtj9vloyszPomn3QgUS4JICS+EBgfYZI80eHwjSuyOKHKb9iNnjOPe8QTAH5/
	dyVgSGxOf78yccBnAuWVZLZivUjiNJtxVn6VvnlxMbs1jPkZkcX58H4kJUPmJie4ntJeDgBT2N/
	JYgPTEy7Tb4Xb8RIYDw0oC9zRad7YUf+ZUwZUn+Abyl9ceNjQZ52cc8OpT+5g0Cx0pgi91QiEmt
	A3+0QnTWpvdczb0MlrcejnTK4afLFHycFzCSB763t3ZhcGXV81t6Duai2B3QpQlez2Bkrc6vaWv
	cgLNkA1rRoc9/BGA6z1/+I3RuIK9E3n1hJ3YlfvirYI3v9RPORph0wxYlzfiJtxhuuSDWZ6MwIg
	X+WiVqZpMu5QgEgQUrV42ikIWqxIIVzqprluU5j7Ok9K4qspd4sLn4JYPtwBrqmtWmOb16LbbJk
	VMX8mMi1D3JO5p+waYbjmkUU9nfBxfMKJW8+3m8LqLxHA=
X-Received: by 2002:a05:600c:458b:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-490b5fe0af4mr45931785e9.19.1780481846203;
        Wed, 03 Jun 2026 03:17:26 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:08 +0100
Subject: [PATCH v3 04/19] perf test cs-etm: Test process attribution
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-4-c392945d9ed5@linaro.org>
References: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
In-Reply-To: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/context_switch_thread.sh | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/context_switch_thread.sh b/tools/perf/tests/shell/coresight/context_switch_thread.sh
new file mode 100755
index 000000000000..0992c35a329d
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/context_switch_thread.sh
@@ -0,0 +1,69 @@
+#!/bin/bash -e
+# Coresight context switch thread attribution (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If Coresight is not available, skip the test
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
+	taskset --cpu-list 0 perf test --workload-ctl fifo:"$cf","$af" \
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

