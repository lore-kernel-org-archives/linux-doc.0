Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA00310762
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481861; cv=none; b=rsnK7j/mLz0SErnnfBxEwOD20hFYM8HC8UN7h2EGE89BFoiOAJx9KTM0c02kNL91EX4V3UtbAlYefFk0pc8qqEWfGdjsFLMH82TkBuW110zbgG9V3UU5Vq8XzibNYJPISFdUjTvuBTgO5S9wA7rPfacDCZiy/d1MCUigQX0x674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481861; c=relaxed/simple;
	bh=6RkEL4S8aCNR1yq1ytIaKt2GAbArNadH93U51mYQEOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6ajl1GrC9W4Lc0kU+h+2TsbP9ytn0rj3PYQSH+9doxebZ4+mCizQvWrvuJ7EcBxd2MKbBOHx38I1hfB8o9rrTzNqxvdrFVk7hdlJT4QV8oMNq6fnHjC3OdddK8NRPi7JHqv2Cds9f9YxUudiL938qA9VAjM2LKG/SDz+5OO2XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKL6dXBe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKL6dXBe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49068493267so73841885e9.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481854; x=1781086654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRJuOllU43noyyBid/foFoLzbBafPMlwyDVK+1tfH00=;
        b=fKL6dXBeb0QOPV84Xr4/c/qzcTEMV7MGGE2wWkZM/PeIHTfqOI0k+TG/00cach6DTK
         pvIU2YNTePCbNe/iFCRiQw7oNOnvjgqB0uBpYWt1AOpxaPRs+db/Meg/att3FFiL7Dhn
         LUsHHXzC70N00HbLVDnsoxpb5TDgPR2lFMmA0QTzBvau4+Aq8P3R+IBHLPUkXTWWEIsE
         2SdWvecbPySa77O94Tky0qtDeLs7XMLRIAzEh3AyVBkq8myilM3kbuBXqjT9g7fotAg3
         LTEmDMGVfRe3EFLl2QmblgwakKHhPR7kC8b7cBe4saYKKv3Yj83aiW1lfRloNl8p/wUI
         C9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481854; x=1781086654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mRJuOllU43noyyBid/foFoLzbBafPMlwyDVK+1tfH00=;
        b=oZyCB5MRYX3Fl3hj+E47y9y1b7WmGZBeBQi6TrHXVdAI6aDOLHqYGyJelRLKUu87eT
         g7wsxhkpsutofAZZ2o05o7qsGxLcK19Afolr+GPWlSZKOeJrvO+7UMjWVlfH6AGRnWfK
         dehJGhyfC6AR4RX1QtAPhF+dJPOkY4fbkGu1yiSrfrmc0LS7Us36WtiOtQkF4CWFsCfh
         6Fj3nukOBl1dNBknbfyZrLTBIWR7FBX3bqEl7TUDpRCG639T7++NlN1Io81odNZjHODm
         A+VjHNW6aribWTuEQ9zD7TfXRLmmMuVc22hAGHZzmPz4AQtK36KgtzdSLN1V+eRrC4Se
         tLYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lUlMB2c+WS6sZEpUho3dLsYIwzcq7gQcfxa5LPUFCPvoF3k/ugmzg4TvSmxBFN7GnKZP2RaOnAM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqSV7q+tc6GDXiz6Yxf3n7QWITHb+7aKTQNooKzvxcofi/bgr
	hEVKF00JswOjgmRMqUtH8zwfWSa+AIuC1q/bZZ2PU8ndCeIblpOB0UBhXkdCoYNGfZU=
X-Gm-Gg: Acq92OF/tnff/wjX7Ocittv5e6+dvMoiG6kpfVcCSzMF06ssUR/BCC1Q4LQT0RCIRv7
	ivlcK2p3tB8oqETNFJisAXPPnI3i0kbQUBcB+tpQ1asDfsZOlYtAMurCExoWR/aixH1W068vF9S
	A2jwZnCYSkBn8MwO+zx/7v7CqymP7W7mE30jZe09QgPkdYrgXz5Rnx9ZNMaS+zHE3dJc9zhOf/G
	VdixcuYiADyBRbEUQwkYM+op4WmVwZlCoS4rATUhbempb76iD7g9keBTsU0qvHCwE8cEg6A8wXq
	o9gQhKtZh3/Is7jrW8V4450SSIzCQYZ6ziQ5oc8IeEBe3akPfWapVeSuVEg6xPyBIKzA3KStkbP
	uC3Kg9E/8NSV9WdqQlHDS+Tg2y0PlYqqkVxpJDL//WFswrZ6Aeaq5yN9rDD/SiBQRlxH9zlojbr
	7s8PZCDHWHryEwsdQpmC1UFpTLZWV1PDPvAgP0TzFmx74=
X-Received: by 2002:a05:600c:1392:b0:490:a964:14f8 with SMTP id 5b1f17b1804b1-490b5e94f3cmr42451065e9.8.1780481853968;
        Wed, 03 Jun 2026 03:17:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:15 +0100
Subject: [PATCH v3 11/19] perf test cs-etm: Remove duplicate branch tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-11-c392945d9ed5@linaro.org>
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

We already test branch output in perf script mode, but then retest it in
Perf report mode. This is more of a test of Perf itself than Coresight
because Perf uses the same samples to generate both outputs. Also we're
already testing instruction output in Perf report mode.

Remove this test for a speedup. On the systemwide test also remove the
Perf report test because systemwide mode records a lot more data so
running multiple tests on it has a big runtime impact.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index bbf89e944e7b..39553702c1f3 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -52,17 +52,6 @@ perf_script_branch_samples() {
 		grep -E " +$1 +[0-9]+ .* +branches:(.*:)? +" > /dev/null 2>&1
 }
 
-perf_report_branch_samples() {
-	echo "Looking at perf.data file for reporting branch samples:"
-
-	# Below is an example of the branch samples reporting:
-	#   73.04%    73.04%  touch    libc-2.27.so      [.] _dl_addr
-	#    7.71%     7.71%  touch    libc-2.27.so      [.] getenv
-	#    2.59%     2.59%  touch    ld-2.27.so        [.] strcmp
-	perf report --stdio -i ${perfdata} 2>&1 | \
-		grep -E " +[0-9]+\.[0-9]+% +[0-9]+\.[0-9]+% +$1 " > /dev/null 2>&1
-}
-
 perf_report_instruction_samples() {
 	echo "Looking at perf.data file for instruction samples:"
 
@@ -123,7 +112,6 @@ arm_cs_iterate_devices() {
 
 			record_touch_file $device_name $2 &&
 			perf_script_branch_samples touch &&
-			perf_report_branch_samples touch &&
 			perf_report_instruction_samples touch
 
 			err=$?
@@ -154,9 +142,7 @@ arm_cs_etm_system_wide_test() {
 
 	# System-wide mode should include perf samples so test for that
 	# instead of ls
-	perf_script_branch_samples perf &&
-	perf_report_branch_samples perf &&
-	perf_report_instruction_samples perf
+	perf_script_branch_samples perf
 
 	err=$?
 	arm_cs_report "CoreSight system wide testing" $err
@@ -179,7 +165,6 @@ arm_cs_etm_snapshot_test() {
 	wait $PERFPID
 
 	perf_script_branch_samples dd &&
-	perf_report_branch_samples dd &&
 	perf_report_instruction_samples dd
 
 	err=$?
@@ -191,7 +176,6 @@ arm_cs_etm_basic_test() {
 	perf record -o ${perfdata} "$@" -m,8M -- ls > /dev/null 2>&1
 
 	perf_script_branch_samples ls &&
-	perf_report_branch_samples ls &&
 	perf_report_instruction_samples ls
 
 	err=$?

-- 
2.34.1

