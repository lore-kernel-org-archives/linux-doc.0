Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F703812F6
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016042; cv=none; b=f6VVpMEbFSFLzb9TOoy64xzjeEUdJYwyhL7Ji+Iy62MP1rnjWtrQTuzDZAc1SmwZbt9bfG4md9RCAgqyNsQOoSBrV+Mgu9EXrozPPfUbaqlDdAp2fe2fc4b9Pcwno+yitWyAp9d5GWtj0sm+zdGalVHbnQD94xfPw2ERgSSqWlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016042; c=relaxed/simple;
	bh=zBP33YW94/R1hHZYuHZFRO5gh0N+cAj5cBmAyLWmp6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utADR3lOmmVoSnQMuwK7AjXNV37Oe7lpYOhWkzkrG01cyCVpnbfoqVLkX2A+365l3nYmpS4gfgHt6HQZWEEvqID+t8bOSP029T7Yn2bq2QLsr82dc8mnfT6TWk5YKMvAPzG10wv0PQm8jlvIPFIW6ktghLXgqmH9mq/7T0GSf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ON6/WnuJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ON6/WnuJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso47980545e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016039; x=1781620839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h78YxBKDueLh+9yt6/S9EMI77LVr/N7bEn44d3CK8g=;
        b=ON6/WnuJ+egoWFBEjRQTvWu3qxjBCxHJv3TEjg1K18U7ejrhN1HX3GZ96GNanYW9vZ
         OgsCLf4J5AmfxBRqwj8YOK+CirU1Xlfr+PKkyshS9w24R0TpL8kgTMqrOUVa9oNzPN8M
         YjRDFN8IPjok3sA1aIO8Ia6DE3XN3PFSWTiZEu3L0jSoTQIfGUT3tZa6NL5lNwUX9E7c
         yrNBezgexByfDAYEUF2Pi/JxrTyeYIN5O22ou8bz1oS1tTj9xkfOwnoVFGuSysHA8suZ
         z0652kZm0jk1VF3Q5UXmjzbaMKBHvfVKUVTtdSsH0Y/MkmZiqqndTWuJTflusNLwi7Ir
         frpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016039; x=1781620839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2h78YxBKDueLh+9yt6/S9EMI77LVr/N7bEn44d3CK8g=;
        b=OBrXC2MJuE31irTFFzHWTGn1gUi3Kn67OdXwzUk+IJ/rIgud3mrb5GmkkGsqTHfQql
         mKKY/90ztoQhgCgWWhbeRiYzYxmEjG4ZFw8myEqEDFMp8mzQo2alcZQHyuSovqzWtloS
         Iwgo9JplKyD3ggX7aL8kVWvO9/JD8QrPXG/+4QXtKtRmOVMmbOnz5Cj9F+wCd/AA9BSD
         UGypWOlGjRMnij8I/oiNdkt6CqoQb22ajKtO38cAbQH29/0aZhTeLDJhFDd5PnFCxd6O
         t9p//8QNsi4rayOVBVdngWjgipoRcHSWcYv9aV6zrkRrMb01/LzZmhbM+3Gy5VygasW+
         ZTKA==
X-Forwarded-Encrypted: i=1; AFNElJ84KD09YYegngoc/bQMWflfAvbkRYL5XSt3UEogAzA4DdaViReQosjXM6SEzzhykmekpM/rHtM3bO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxctKyEc4OQjucMCyOyWXUCD4T7K11JiZcJueGze2uLhmLX9m/b
	bkyB29FnbNr6TF2aLyzPxuRhYo1P6Vxbug4MjzXvUOwfmYBxqOtLCYn2Uz/EBxIcDbA=
X-Gm-Gg: Acq92OFMK5f7lmTdGsp8TsmWucwGyXJhQJcb9LM9dfz/9bLREJtMiGiZmGzjK5gBy6J
	JdCQ8hj77sRGk/XyzviHNhPpyM41G02aaOXwzJg78bYtJwFyy/Jcn7REut0x1VioA2FzpWQwne/
	6i/xM3XlCYkFZF1xYFAG29fVNdlIi4++3t24LT6KDdUsAfopDsJvAR2as7Ymqi4zzWlvj08a6iX
	ZvuTXFm4skHfCMecGbrQ2Rp4dT7u04qCYgdtB7utkXkzaTmNh5pHqC2gFjLu8NQLp8JAYd9+N0Z
	3aq9gjRkMNPszSSEvgKIbDyl62gJmhtwwZ0/iLLoyFr96LhaSW76rC7gODnVCQVkCjF1uxDS4yj
	hSPxPs6oHDeALPMREY4BnOQ5wdKh+HxWF1WP0PVbnRnChbEchO63njyNpaWROthbp+XJgJWfblp
	XzizIZLkLjlpn5PwHaWF+nF7tGWHlEF3u4u12O6gQbfm8=
X-Received: by 2002:a05:600c:8285:b0:490:b1b8:95f5 with SMTP id 5b1f17b1804b1-490c25c2ae1mr347668055e9.15.1781016039067;
        Tue, 09 Jun 2026 07:40:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:16 +0100
Subject: [PATCH v5 11/19] perf test cs-etm: Remove duplicate branch tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-11-d53a7d096a19@linaro.org>
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

