Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E0438FF4
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016052; cv=none; b=PC2l4uwAuUg32T5GgmOsVsAFVR0k+Ktf4T8SG1wKCLSifSnA9t4WVp9dZwGQ7LUxUKx+iEcuVIDJna3e2f5/RNtLw5ZLjw+8QaIAGReU6ES/SBuuc1lGKp8isWb8vb7u7lAoB1rUROvViW63YNNNdpEChwPKATK/vGqc8KWmEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016052; c=relaxed/simple;
	bh=wObRJmm3gTlf7wqz3XGbcKcAk4UU+DK+eJvukw9px/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWllBoCsd6ce3IyKSseqr1hH304QaDU7A+vydv64ADbWK47QpASlkKzoEqqji5FouuI/khxe5HIbGI1C80UPkjRMhn9FQAEHfSMp2RaXss3qYjQlUuUXFnjhEkT6Cvnpy3N8DxR1AUwnifrEOVR9RAddb/dBSSSCascvJFNcmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F04zP6Oq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F04zP6Oq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490c1915793so37971255e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016047; x=1781620847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdUeDLTBd8NbSbxSGmF6PVOlpVLflZ1t9lCb20G1ZuE=;
        b=F04zP6OqT2e5wpfuCvsodg+W7RQc73XZPImtr5g9uCrGpBRNvhq7r7ajRrkr6aQLt8
         oyMsLCZLPcK3SbnYwsvj6gYXT/YaHmv2H91tGr/Lcry+5/lleAW0W4sSz8jUUHrkRl5g
         OIfxIRn14UV162xelR9odKtWj3vnFkA9Qnu5ZaLLghtJT0/SdHAMxbYFq/jTn5wqP9pf
         EbQgPTlzEUEqJSR0sNhjuWT7AgEiTIHPSE1YQmrKDSeOWivS+GJaIP01Auok2qHiMHvb
         2WnknxQOAlH4+tA2Pwr/IvYNFPsADuzXWiMyxiq+qWpArSvbeRivH+2QmEoNnYjSpoxv
         c5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016047; x=1781620847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VdUeDLTBd8NbSbxSGmF6PVOlpVLflZ1t9lCb20G1ZuE=;
        b=bYH62y7j7MGHJcXTjpTlWNEY2uvOJ5NapHfEURODvPbWUWVIap20i8Ky1OlCFat1y0
         5SyRtGxB9V9P8GfDjcErNKioTupNbdrf/+1I+h0HdJvZAV2RrYIBXZJ72ZE1HgB80r/e
         JLmJJqnWn+86UgTH/qKiNh6P3BMzhKiic3X7+eJSe9BeYUd4M5rnlccbTjbmYZTxFdTG
         TVdc4oGR3eDDyYiwgj7r8k1/9u7uqPfeQzzPy7kSCAdPmkdZ2RFtr+F8Byb6hGHZxE1A
         LYtsBV3gdeE25SQQcfNuUki91M6xl/d64m2pbRjwHqafls2hkSrHMEL00dwfYTt9qvDs
         y3gg==
X-Forwarded-Encrypted: i=1; AFNElJ/TgQQLckdadbv68iHjqpUMcv9xQEtQ2M5m0Nrp07kqx1xRbw06Kf7jZoRliKPhXgKDQhzIQeARDBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6FKF9MGskoQafkSaQBupj6c6BfvbiqAP5MUEnmdrJRkXLjjI5
	Jj924KSS+mE0buoWsq58+LADe632Sgl5iEiwJ6GHebLxBmJSpBF/a+6XX8XjesiQ+R8=
X-Gm-Gg: Acq92OHkO+oaLTgZ7+KpnHfixeAxhYKmOuiv7AmUgfku0HXgo7L4sqecgq49ThEPF2t
	YJiMGEOnclDyyOX5hHrxbmM5wLnTKiXQPwc18Iuj0TSiO5cVWIInwQmUP83ed5gTY56Fd35A8sS
	M5Wf5Oc/cIVbdKamE/6j8IZv25bpE8NXWlHNEu4A3qRaGyY7ESzQUFFpULrkzHApHPlAMI31Bco
	1qpNwwCWts0D+l2s89+cNHhNJY2Hw/ie/MWhyRSfkFCxAjmprL/e1tRNSqRSQEWLW/H27G+fBF6
	IwhjHwYQIUkQmBdMQjEcPtUceQ0T8iI816FugLtWGQiOUL380CaEPJkNTLIPYQbbTWRbDeCiY8E
	BM/Cw3EpWw3sZSLi6kMu0fTGYtSWRcHT1Zv6/0TMUWsYs56oYKBApzIQRWzY8Ecq6Wl/sbnYWDc
	KZktdIJ4rmlV33ySf/D2SfLVcHP9FHTwRl15OJjEct3xs=
X-Received: by 2002:a05:600c:529b:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-490c2625f9bmr306873925e9.31.1781016047377;
        Tue, 09 Jun 2026 07:40:47 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:22 +0100
Subject: [PATCH v5 17/19] perf test cs-etm: Add all branch instructions to
 test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-17-d53a7d096a19@linaro.org>
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

If we reduce the number of samples searched to speed up the test, then
there will be less chance of hitting one of these branches. Extend the
regex to cover all branches so the test will always pass.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 87797d239f76..f78dfb6bf73e 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -38,8 +38,7 @@ cleanup_files()
 trap cleanup_files EXIT TERM INT
 
 # Ranges start and end on branches, so check for some likely branch instructions
-sep="\s\|\s"
-branch_search="\sbl${sep}b${sep}b.ne${sep}b.eq${sep}cbz\s"
+branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al))?|br|blr|ret|cbz|cbnz|tbz|tbnz|svc|eret)([[:space:]]|$)'
 
 ## Test kernel ##
 if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
@@ -47,7 +46,7 @@ if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
 		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
-	grep -q -e ${branch_search} ${file}
+	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
 	# Root and kcore are required for correct kernel decode due to runtime code patching
@@ -59,7 +58,7 @@ echo "Testing userspace disassembly"
 perf record -o ${perfdata} -e cs_etm//u -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} -s python:${script_path} -- \
 	-d --stop-sample=30 2> /dev/null > ${file}
-grep -q -e ${branch_search} ${file}
+grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 
 glb_err=0

-- 
2.34.1

