Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D593AA9D4
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015496; cv=none; b=inMhBHCZSL5cBPeS50IB2LX+or/IpzVz/36Qr1RfDJm57OyfsWz0kRviuK3y6AhlYcszRpnSGr/FE7lers1D78VZNsPEa0EaJvMasNdvm0IvH7OJrxYVNDpeLJCM0mnXjpqI1qCpFMWHQBc8laDhnq5UveJ1uog9Ro0/osQKI2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015496; c=relaxed/simple;
	bh=zBP33YW94/R1hHZYuHZFRO5gh0N+cAj5cBmAyLWmp6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjejDnJiTHCbe5euF4CCr/zFqNcx1x8LtWOW2wZGslGmGxYTda+g9xEBwMQpc3qUbpunPvoEgHUcVi7/Sy2DmjfhYednBTMrNhmc3BMlaXZ6kRAEdIbAcEJIujFEIw4yqKNYijsYoi071ZMn/CCVbV2QHdQlBa98GJEWdr77h7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lrKr2O7J; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lrKr2O7J"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso4009467f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015493; x=1781620293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h78YxBKDueLh+9yt6/S9EMI77LVr/N7bEn44d3CK8g=;
        b=lrKr2O7Jd0SgNdAnYOGSNDXrvB3MNlxwHmj+Vow0FZiLRmS9Q460/p1RsBDOUlG8/k
         3G5ABPbuxVnakgv+dJeM5J5rd9GJSISQ9MqH4fwsKOCtlyP8zJl5lRYin0J/DOiQA6vi
         vlKh5RGZwPFjC54PoJSp/D/aA3Kvs6MAx+YBGNxJHwq/7HYwTKcBSCc4riHGsnnQzSF4
         LaTbsOTDuJxoubBcFpialSQ7+zjxC984XWcOmvoF3CKgnjubPTMPOy5x+JkP0qYQIbjM
         Bq5YuXlzEjPcR68+/3unUE9AAXH/YFFLwldOtM7yGlzt07p/rm0SGPSFqPYsY0JNtzwE
         PivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015493; x=1781620293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2h78YxBKDueLh+9yt6/S9EMI77LVr/N7bEn44d3CK8g=;
        b=EXbeHO6wsr8MBGtRHJIWLU6nbLVcF0/9rx/xOXRmDSvf1Ltb46RUmO88tymyI0WZoK
         08Ocn9lGKOuncdH7P6iuWLJGxiSZcqs+jWi0iHUrjgvrOOdm8vqrKUm92Az44Q5RydoD
         XaG/fB2FyYWFTizqLrtsz6Pne5HOGckaQ0GfZ2QK6iQFBuHfd6GUFaj2zdrFhi+Tg3yn
         zDGVMkcd4pt0SInL42yXyMpxbI0L1PzxP/GqyA9U6YiAaSU7PjtkILxq3zyC1ZX5avuU
         /ffkmxBUYc9RPuTJuCGfONQ+wsZOosFonjn9hLTbMrsCl+Zyzvb+vngb5vlnzb0f+aT0
         U7GQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XzThmd1fjkWJQzWdutVJ9FYLwWf2nyNicxiGROtOerxZKKkq+Xgkb2u7L8/NXr/M8mKVMScfGg3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgKLSonmHXjVzfSI8i8BPoHZTRSfAz7Cwtqu+JjdyReOD6C4+
	eLLpmV3j72uRxSsJS8ww9vJDomL+p0lajIyrL3NB84Ak9vC1qOboyMdSm0nabJD3IKDv8VGESIE
	b7QcG374=
X-Gm-Gg: Acq92OH9PYoBMSIXUCCVJWCbwd5DyX48pn8mHRaSqUAMqmD6usABpQwnI156uuIm2a5
	94cCwdktfAQuCoWimzaBNs0Cn0FUjaACqSSYMDPPBwbiE3WRG/PzjQucoZarERp8iwNb2/XSe2E
	pS7M9O3UPorVu0jJxjtf7g7EHgc3HLSBtpJjQ2amL6WzftSOTARfJFg5dmfm0Z6/25B+b+Y56+H
	7YZsCCDeCZPyfxNv18/vv+dAglbV/gcVeah3CxFpNR57J35IfPtmZHgx3W0LszzseMBP8WT4I/n
	awlfdHvcrzp84BEC5ICBZsnku+Ze2r2a3dBCrfvaKfVNG4nv9Rpys1cBQBBt2U6TdZYDUg3oXRi
	7BXQxRG1KQrMsA+/lJZN6DCFZCV8JvPDtoMe4W2BuQHQV+pFyNFSzGs0SRMU4ggsTTuNfJyzGKf
	aBArEss1zS6yTa+EEvtReZ6X6NGgtW3p1Wu0xMVWUQDZroXu8h+0+9lw==
X-Received: by 2002:a05:6000:46d6:b0:45e:ea46:ce13 with SMTP id ffacd0b85a97d-460304f9d74mr21292365f8f.10.1781015493072;
        Tue, 09 Jun 2026 07:31:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:04 +0100
Subject: [PATCH v4 11/19] perf test cs-etm: Remove duplicate branch tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-11-44f9fb9e5c42@linaro.org>
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

We already test branch output in perf script mode, but then retest it in
Perf report mode. This is more of a test of Perf itself than Coresight
because Perf uses the same samples to generate both outputs. Also we're
already testing instruction output in Perf report mode.

Remove this test for a speedup. On the systemwide test also remove the
Perf report test because systemwide mode records a lot more data so
running multiple tests on it has a big runtime impact.

Reviewed-by: Leo Yan <leo.yan@arm.com>
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

