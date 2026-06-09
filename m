Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2855425CDE
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015502; cv=none; b=D6jbK6S5CWhF1vJBrx1wStiiUfuQn+Tx9ByY05oBdE0nwaBacZDg3vDEHVUsrx4mNcFDm4aHaaIwTfC/5zRe7owWmJwCrBT3Up1jTqjmCMn4WBmbR+LWVBdkXkNLzmLmE1T4uw9q080F482YEZMvoE6FAQrOn9l9qW1LjM3IibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015502; c=relaxed/simple;
	bh=FSMtqVRVy7D3pvypIs3gLf7OFxrFfmQrY4e2IbRbIqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9gJEpjMf0tr+dgCz4pllzdZvrBmlVZt1M+k75yaai1MGU/+K9tRGxMv/Js/g6cKxQIXRKBW+4zSxFt8DdXHnabKfkmY5cAvC5Aw69HrBDm89sCcy5aoixT+JkR0SKfYEJCUtdqdhvuwAVUFWz9koe5dAcExNfnd/hnew1jYfxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuIvH9q/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuIvH9q/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso46460785e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015498; x=1781620298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ng7BXZAmfD6H6DnpoBma7BIsuVaWOeOAye3IPeJCbwg=;
        b=YuIvH9q/a+Oz3zM2/6119F4NLMJbEpUTw+3PARabiwM/c3YAxuSGxDkwbJuCLtRbmR
         7B+BSE8RzdTPTw95vnlqpvJ90/0V/EBvAZJ770QvkONS2Y4x2tPj4Ae9i2h3HjZe1Q3A
         ErtgwBAHkbF6ERQpvlJPIR2In5oau6w11OW2GjHxUNW0BiUWGTFC/beYrRi6n4tUXElS
         Mm6Ud8GyUD8XwaR/S5F6Hf7GPkBPDvc3w2xyHvBU14CK3yh9DR7qqBMcW2PlG1EerCjD
         kNySwy3PUK3ARnq3MB1TrDYstIbHBByAkXnY1r4lj0p+obP8E4JcZIOH5Js/tc8qIQnG
         iHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015498; x=1781620298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ng7BXZAmfD6H6DnpoBma7BIsuVaWOeOAye3IPeJCbwg=;
        b=OkIUByeFt0qP8HWJj3So3vrwIg8z3D9OyNNieY/nMoyiSFLPje4y7JOlZ0F+OZxAnu
         zW/1Wx+oLX6Vzr6rbn8613shm2JZ3d/ibfyuNuzadHIH+w2KmFcqs+v34iVHkWOffsCx
         dUTJZS5W3qVkMWbEopkuWgcuO6CE0jENbhL9nGQSghXa0F75S1aJo0pwRVdrpTdqCaRz
         D7oE3YX0HSosO2lRszocjV3eRniOCvZx0MbCn+cA75yRHfdW3sWQe4Hxdluv/WWFid3b
         45kPcOmciIL+wquYElHBrBjqgfUxNpNl38ExOYC84CVwcCDX/7HCwCODZTCSVIsVQ5yy
         G1iw==
X-Forwarded-Encrypted: i=1; AFNElJ9UFejj9EMrqxa+YuzdzFSJ1+OZ/wolx5jZnGbiBtAY/t6jSjTbOXEt5duaBV+CScRC0F5Pv+m90OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAzOVpe7u9PhdUFl6ydhBx4KPWhRnJ7jqZerSA2ZhDAwmhMwtb
	KystSPOs2v6NiJ2NMUY5msHon165t0a2VlX15JvrCoiCTLeLyukZHksfTMUd10FgscI9cwi4YKP
	c9JZdnR8=
X-Gm-Gg: Acq92OEJPHmuEBmojx6fQF2i58pDA187tgMBu11eWBC6K4tTBu/CgFFR2RoNPHbIVI8
	Wne14emTnO2lk2UrU7G5TjadE8cFm2GYP+YKziNo6CkcP7UgOKf0Qp4q8sGYcjSCLD/efD3dgCv
	hnnmhm8l2e1dhWQRyaSbE5KtlB9X0Z88u8Jo/b0LjOsd9X2NG9SVeVNbHUKyV805s/JTMoVeRQF
	9FCmOGaLGQf/FL6aasA7/19u6w7r4RJwUh7Peo0zZq6KCaX+Q2uXUULDcBTAHIVLu+KoFY94ab2
	6DO+8LN2iq4xnvxxgLGV8FUWNe5i2GrGPMWSWETHDaofk152F2vLp2Z6tSFqzZWM3U4bT//gv/e
	sH5J+1rCTzlRVWPWIdVilfRdhsDQbcVPtLaIAgdNiPXWzLXpyr7ahRPREKNC58RMiNKY4MI99Xa
	SrTmWDOby0Q3CPVdxQXsBBu2I/3DKHqDQ7jtO+20nLS/M=
X-Received: by 2002:a05:600c:8b88:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-490d722a2f4mr35057025e9.25.1781015497865;
        Tue, 09 Jun 2026 07:31:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:07 +0100
Subject: [PATCH v4 14/19] perf test cs-etm: Speed up basic test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-14-44f9fb9e5c42@linaro.org>
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

Like the name says, this should be the most basic test possible. Kernel
recording is slow and already has coverage on the systemwide test. Perf
report output also has coverage elsewhere. 'ls' also produces more trace
than 'true'.

We only want to test if the combination of recording options works at
all, so fix all of these things to make it as fast as possible.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index da2f599393e2..83295a8fe179 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -179,10 +179,9 @@ arm_cs_etm_snapshot_test() {
 
 arm_cs_etm_basic_test() {
 	echo "Recording trace with '$*'"
-	perf record -o ${perfdata} "$@" -m,8M -- ls > /dev/null 2>&1
+	perf record -o ${perfdata} "$@" -- true > /dev/null 2>&1
 
-	perf_script_branch_samples ls &&
-	perf_report_instruction_samples ls
+	perf_script_branch_samples true
 
 	err=$?
 	arm_cs_report "CoreSight basic testing with '$*'" $err
@@ -246,12 +245,12 @@ arm_cs_etm_snapshot_test
 
 # Test all combinations of per-thread, system-wide and normal mode with
 # and without timestamps
-arm_cs_etm_basic_test -e cs_etm/timestamp=0/ --per-thread
-arm_cs_etm_basic_test -e cs_etm/timestamp=1/ --per-thread
-arm_cs_etm_basic_test -e cs_etm/timestamp=0/ -a
-arm_cs_etm_basic_test -e cs_etm/timestamp=1/ -a
-arm_cs_etm_basic_test -e cs_etm/timestamp=0/
-arm_cs_etm_basic_test -e cs_etm/timestamp=1/
+arm_cs_etm_basic_test -e cs_etm/timestamp=0/u --per-thread
+arm_cs_etm_basic_test -e cs_etm/timestamp=1/u --per-thread
+arm_cs_etm_basic_test -e cs_etm/timestamp=0/u -a
+arm_cs_etm_basic_test -e cs_etm/timestamp=1/u -a
+arm_cs_etm_basic_test -e cs_etm/timestamp=0/u
+arm_cs_etm_basic_test -e cs_etm/timestamp=1/u
 
 arm_cs_etm_sparse_cpus_test
 

-- 
2.34.1

