Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73853AFB0C
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481862; cv=none; b=YdZ2sPcWfZE2NMqVpA1kbmwRX5GsO/pBmhjTvJLckHfrK/Hy6sJo6Rr7ZplcfHPHO6kutrWAzFXZ8ymIZ5IY9AU/GOSJs1MalgJ0rSeQWAcrtNMqZTfJ53Y9C8tD88ZUhtNqitl7/6QqaOsEd9zvb1HvNDbXW+j5sta1rba2gtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481862; c=relaxed/simple;
	bh=/bo6v3kFcoolHnOpj+EbZhoQzm7A8RsOcpjrkQcAFBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=riE7d6xKu+c46iQC1esp268kLxXsG+xSfsTghYPEx0V6qZqe3fwsKpgiKu77WhZulxbJHhw6Ev2QcXM7KMoVJV8MItQHtWBeHqksoOZVwtNZ+DnMN0+lO/UVZbpszVULwPGJvF85AXQdX4t6SDltUCEZwHhW1ggfyYu6lI7D8O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSuFkwie; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSuFkwie"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ac10e337so18541555e9.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481857; x=1781086657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o0yW6uQ1LnJTQVmIzRpXA5Z0rqK8P+8rneFQb3y1o4=;
        b=HSuFkwieom49EnqFHf5yKwzZiTc6O0OONc6Q4sHdIq0yQud4hFz8qiMeGsS6K9mGR1
         w7LQVeiXvewmSR5U6h7QgfvCOBbZWDYE9r26pZNyPZImAnJ08R9A2/wpxnYyWcCMi/Oo
         IP97sRHRanPqm+cj66iZyvDVEphgDPyVc7t0ri0VloVKz/FgOEvITkCeEZqrADWAbk3L
         5wjmStrUaXEiss6N60Qg2rLCVZTYUwAGIxEBcZNujd7fNZctx6tJg16K0T27WwNrjJac
         NPAhCy4HWp8sQmTzfSZuLCKBz4SYgln0y/MRGQJpHIpOBCXY89h1VV+yoNTW0SNfTmlt
         Z2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481857; x=1781086657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3o0yW6uQ1LnJTQVmIzRpXA5Z0rqK8P+8rneFQb3y1o4=;
        b=rirAAuPuK1CMZGnwez84M6sfD6uaigUNPlUud4rf1/vmozspPK89yZB5nhGUYXv4gf
         fEPHNmqub7po0Gb+BivSXj6cFL/q68qPhG6kGj5RYTl9vxecQYN5auJxlo7VILXmr7XI
         P2G3ELeHf6l/1IXOWQqn+TdQIH3J1/zgLA8T97k6Fw7APXFz0WwbIo5fBVvDxKXIC207
         mDC/3To6V+N7I7Xbx3c0j1jCj1e3Nn8l6/ATPS55bW7ui8uX1UL6M649te4qlzVRM3RR
         KSxx1N2CG8g+TACIEei2UiOu0dscsSJtF02QI1J0WUDiG6JBEbu34tF5JcW/JFLnQIV7
         MXGw==
X-Forwarded-Encrypted: i=1; AFNElJ+9HnVPb7QJCN8ICLhKiX6PDGemvsH8HkxN5eiPJ8gihAd+I/prhgyQ3RI/fU621tLQEXsiBdRfIB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Y+UfLGSVoRTd/h20I3fbGbIz1hFbxcnj4b0EdC5O24iaMtdW
	e9OpCS8hm77TqmToBSO5fcC+KTwUMIPd+EyNsYq7rSCXh5czZvTwNu8B+MjPNQuEVE0=
X-Gm-Gg: Acq92OEAGszq6VwG7qWgbXHCDW+XaSBDjOBVvl7dzpdCXCIOlimABawS0gz/wtteVXf
	ous46gQgObc4V1zX9I5SxiqfdyQ+zXt/bd7vjY2i4IjP3cW8Cs2dGcBKgZaLw18wjXLMyXk/EyH
	bnMj1sAuFC/A41ReENGv+6AT/lGTkJQOOHk19PCet7o+fozFqMQXhkzRZ9fslYmlksmenOFwEFg
	/Zp2Wu5ptdnMZlXcsK/BfsGLDn0Pqqoy8PZM1Kd/+7obEiTro6doKgB8Tq9eWeNnX3jPIns8UYO
	JuozKCSkRE9wq7NQ36PTnSrAu4/sf6TJhxxGvVAE9NVeYbsb6zVDvcqSHJTZq0XZbub+GhTVgZg
	0gEvire9tpIVZRfuQEiL6Ku/yg7BqcL3xYOe+rh3zGrirhCAlCjUJvUN6Q7t17hPv3sYBlrnCna
	pqpzCU/l+tiwjAc3VYlmu+bJT6Xa4v4r+1DusxOeeC9u8moOAQ6c60gQ==
X-Received: by 2002:a05:600c:470c:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-490ba0a1480mr19125935e9.28.1780481857184;
        Wed, 03 Jun 2026 03:17:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:18 +0100
Subject: [PATCH v3 14/19] perf test cs-etm: Speed up basic test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-14-c392945d9ed5@linaro.org>
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

Like the name says, this should be the most basic test possible. Kernel
recording is slow and already has coverage on the systemwide test. Perf
report output also has coverage elsewhere. 'ls' also produces more trace
than 'true'.

We only want to test if the combination of recording options works at
all, so fix all of these things to make it as fast as possible.

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

