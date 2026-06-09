Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8734E762
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015485; cv=none; b=XwatdTcwVSi6m+5WQNOJN9CqtWKOrBFNmAL5FdGooADx0WzHp3SMwu2cw8tSOAq2/1hskaAHyNAwEIguswOXft2Q5iY79C1riBLNQ84pQa2KxDiySXcjdMbZafkWF/17An9RCMj/VsAR+C+akmlQfaNF556omEMZZzfwBTsmN1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015485; c=relaxed/simple;
	bh=dIdyAuGP/OaUVcAMmgROZGX4ROjDm0H45x/4DXdzJEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0N+mRXU4ZzQY0ts4/AjNz+EU7IHRJp1MY46JcmPt8N29BnVV3HXgmiJ4VKfRiyCegspcLHoUNv95tPjKxFgIOzC2gFJYD9/9jh3kZN+cLVkqcRJb4UgJ0pxD4RO8WeHeBpJcxbAvvdkH3ASb/OjF4I7Kc+FCh2M6bo63INRwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwB+tKCj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwB+tKCj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso4009285f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015482; x=1781620282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmgPHjWVH3cXsk2qRjnjPXugJJfk4bPfhv1qYZzCEfk=;
        b=zwB+tKCjtb6vrcWul3IeuS7Gp9THPeNTraC2D72/bXhhMkCdcOZPJahhNEbEdSwfWu
         YoyWCD2DTn6cROEP2Te6vTdYHqZJ3mNdvkskZU7IeKMCPrX6GBVZSXfBZ8vv4M+cD2su
         dM5SBoUu7/eu8faW+/nScpvy0NDxwJa+lqOQECFbW82Lj52FBEMQ7RAjuMenDqdpDWNG
         dT2qxDlNdLtPNukuxXvWLX6nSbRJ7y+sq/bPLx12LJCPbbmOAN5bt7DReWvQHghu0Bax
         sap5HRolkG4VVcm5WsH59osRPGQ0AyWvUROHTCiZ3SI76WAiJdD1n0tPnLgw6k8tCB3l
         aRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015482; x=1781620282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmgPHjWVH3cXsk2qRjnjPXugJJfk4bPfhv1qYZzCEfk=;
        b=ktEczK+mvBzhR/Umod9CnUMLBoiLalL9ZjP+OijTFCKGxy17JojX4ZoFJkzmbXOuH8
         GHkMxPF5rsNdKZ3OHjbT/PAjY2PzboKWWJRQp/PQWdOxemFnug1ZwfuNxr8qgCHGs74h
         s3CHbW1VBTn4QxYTp6KpIlzuj3bmTh0p1kkb1Wv1EFvqmoLtln7jCKF3jPfRjLwBT01X
         vFXl2t/LBPgSnsc2womWPzL/OuBBFxIDoGh7kTOLfH35gugFs897LISHqaa+7M5xYUG0
         b0lFnvAWuIs9XhxnACqir9Nc4tayqPu0R0j4r6hy1w2AhwGz34Y7gTqlZ100HAYaIN51
         hbCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xuPGnum2l5Rp7z1gcRDKl6Q8ylxzbSGx+x+16O4obkiqyDiDN12U7OEnJtEHxKRKfN4nYvwlC6P0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22iuxkpi+Bok8FiJuCX5N6uqOOS/P/f4raeUmA9H7AClrf1x2
	p6is/U2b5Ra4/kk6COGr+vgL3UF5RLiLe5LNSM4UTTL8meAj4ovP58OFa2paKsGM4QwNUaqPPrf
	e9YcX5u4=
X-Gm-Gg: Acq92OEmJHg37l8htcdi1WEXeAveErY2YOzd4/mnX0TPHtiQhXFfCb70BXCdEB0Gghr
	WCdC0LsIYrTe3scOJMBViCqVlY7+1WLQwhfDOC9ECVLHea278QS7FZFK4PKBfDJmAzX3dg1KHcj
	C0M/VtG4e8bjm0FT+xlK30+DulKv+iIvvXD+V/iYL/orramJV/nmWNyZT32s4ntK+noQQEJAUC5
	XMXxuphZfuMRxkaiGEVZT8iZAHcSgKIbZxYTvusnEv49mAHathxYGS/4++a4NOTMOvQh8GadatX
	SXehh7v2auwF+KP9UVDvUAUArB45Wd5SqDPz5EsElUy7J9iT5qrUhOtpeHLuafWhUeyW/jkmIed
	4Bzy2UYMbZaR9btjQV1buBj/WCvfRItj9prFxzYQKNm57NUBfwpr0/AAY1GVg1ijL41KVXhT80n
	++OmFajP4fXAhWGJ7Lthvi6ZlaAGUJ15bfNTMGmw/SiDhSa1Jc6n3sGw==
X-Received: by 2002:adf:fe48:0:b0:460:30bd:4dca with SMTP id ffacd0b85a97d-46030bd4e65mr23193297f8f.30.1781015481780;
        Tue, 09 Jun 2026 07:31:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:30:57 +0100
Subject: [PATCH v4 04/19] perf test cs-etm: Test process attribution
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-4-44f9fb9e5c42@linaro.org>
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

