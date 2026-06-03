Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A47245BD6F
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481864; cv=none; b=TPob/vSpJgvsHCBNnu7A2vCE+RHoc7AXrfPkJqj1cceXBRCY1ya0Wm5ph1OMzlO8CMFAa+nBQkLBQyvvLjpoZDCcUlKmvkgpc6zTr95essUB5dOBh7Z4vUCWW9pzU/9Gpj8WrGdX5fggxan9sdKTe58lLSOZ7FJVPs7Yiu79OMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481864; c=relaxed/simple;
	bh=kiF2OTFMHPFSfKgoJlJ6LUHEtfynLX2Gc37z45ui+yM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+4JrldLFCgKd2Omu9OI5YhDpfw21PfQrphfihqSTPVLFI9RCaewz91D/i2sE+tIfdc12AlApNUCcQVIzi12Uy67tL14CoDzJTwp95IOCP35aWQ/ZX8cbgGh6MFH7z9VOilTCxPoRs9XlrzA0lhjzFgfUDV5SKPAu2jKMP2Z/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQTVNg7z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQTVNg7z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so114315525e9.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481860; x=1781086660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlDlLwXjKsadrJWN67gG6GxzbQU2KCIjPSaxtLGJjnQ=;
        b=vQTVNg7zStkvZtjOEzfnPUZbwL4C0rRgvMgi05qRx18yWEItjWOvVZdTqukQfZpgxc
         K19U0Juqq8GZVBTajnkoFI6VWoTL5kealx5w80UzjG8c5t+pyJEbJZ5m/ijhuSWOc0/s
         vidD+ViK4kZyhAuHeH+lzYmvGpGxzSkRgFKuO8tHEnnFCZ4K+wQFwbClXBFg/yiMPKhA
         V3lEvoLoo3gBG8QyTsQkd8LEObYCbvjmVDB2Aa9Z1uMDoHlievme8veeKMpgwj/t22th
         S9nxDecgQ5oY7JOpxFUP9nHcvHJ3Y8/mZbOJNJKDHHA0JrmjZuURn29aL7FVbmUc0oTv
         mG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481860; x=1781086660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlDlLwXjKsadrJWN67gG6GxzbQU2KCIjPSaxtLGJjnQ=;
        b=XrVKzkehfId4/kxAJClKtfB5ay/0NoqMErBOtcdkHvY/cMS5kOFqDqQpAWEZx3JGe0
         Lgg3u8lW/O8LIJZeE8g+pTjt1u+LC0sRD0ZOuVxnDSNc86RVhhHOqtp44Up2H42L4pKx
         LlIDZHBYpnyiGzRJkep8vNWPJf/Pip+gwLMd0+xzprmnbcgHXNEtmDmG6ITWSlnZNbiD
         FpcIaZiP5gGSp2Ua6rFxMdm+kk6fYSJJtCBXFsdGKtioK83OeuASVsQ+Mma1BbRwFQkN
         kKRxBZcQTL44B4jkUnp+SC080eYfy1s6ECi39x2C7gMsvEECn1oU90h2IsJL+Z32bKnt
         3Mqg==
X-Forwarded-Encrypted: i=1; AFNElJ8BrMeohhRrpmVumzdSHIxp6a5osYU/cQH1GI1RVH4r3lBciZbp5G+sOrLJQbMY0PzmGSPAUCKdzF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YywBE8Gz+LrSJYlvhLv7Qgo3UQ66+DCaip6eGhSET3+HuaLkzA7
	iwziCDlruTiSankW8MAokOWVVKSHIeDPh3qYZMd9vp4y0GR0IYP3X8v/Kky7xGUZhjU=
X-Gm-Gg: Acq92OH/5nDkWfy6/QMXhxHv7p1Wjwt+skkddrSAWaWdNlIMn09kaBHqmuEbOci7I+G
	Lq/Q+r0g/XVD+lqdN5lL+JMBFD2Jdm0j7Wml3qbPVm82ZLYfiBaxgT3YZ5IQGlhXAOxQsQiYGP9
	rdN3DFcqss8vLsmmQpBdmGYmu8qpWnbEyfzOhBCvArQgxIQYBxSvW0JM7C684eMYJgzzE4WNKMk
	eAZNbVVRJ6V6gKPko33TILxLS1ooxOlLocn35kuxNSJi4MBvLuEKIrzZ8uDJhuh64KWBu8fIws5
	Wanh+bM8X/YjD4tJx5BUnObn03HUJ3N3MYXwUHT0x2+6SRbo/pwo3eSUfOCLykb4mO0rypsz1Dz
	QxqIp503sFqTnKt3YcpBbHuWiEtUUk4/Coorq4v6fOnZyV6zu1FDLFu+P7FUMvhA0Etye6l/T4u
	v863szz0tKFx3ejVlvu+4fJ8Of4zYW6ZaAImyOkhR820k=
X-Received: by 2002:a05:600c:1c13:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490b642cea1mr43638275e9.8.1780481860386;
        Wed, 03 Jun 2026 03:17:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:21 +0100
Subject: [PATCH v3 17/19] perf test cs-etm: Add all branch instructions to
 test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-17-c392945d9ed5@linaro.org>
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

If we reduce the number of samples searched to speed up the test, then
there will be less chance of hitting one of these branches. Extend the
regex to cover all branches so the test will always pass.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 8b5c60a09012..5ee87eb7973e 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -38,8 +38,7 @@ cleanup_files()
 trap cleanup_files EXIT TERM INT
 
 # Ranges start and end on branches, so check for some likely branch instructions
-sep="\s\|\s"
-branch_search="\sbl${sep}b${sep}b.ne${sep}b.eq${sep}cbz\s"
+branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al))?|br|blr|ret|cbz|cbnz|tbz|tbnz|svc|eret)([[:space:]]|$)'
 
 ## Test kernel ##
 if [ -e /proc/kcore ]; then
@@ -47,7 +46,7 @@ if [ -e /proc/kcore ]; then
 	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
 		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
-	grep -q -e ${branch_search} ${file}
+	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
 	# kcore is required for correct kernel decode due to runtime code patching
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

