Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C6413220
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410457; cv=none; b=DiHK/6+fk+eFWLoDDTMVlSBKoZLuhlJlxBS5OddIlpjVhVk/AddVukhpQIOt87+oeMeXdt1iAMV7P2PLj++A2PgzhI4UvSzFNHf1WYv9v6So8fq7zlnbkLOc4h166HLXVphoMGCfUeMYBn46WB9CXFLE8kB5RMHZk8d5bxkX6AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410457; c=relaxed/simple;
	bh=/bo6v3kFcoolHnOpj+EbZhoQzm7A8RsOcpjrkQcAFBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Shj2CJKoMc5n3MZREwpdwSHg/3PvQeTu+yEDh+Rv0GNbWTLPGxhxbe5hELXisI88bdAPn5SI5V0wrJO3wfF81IyKV0+cDCqVgZlBscfITHyFaL5ahwsqjwEH/WlLm86vIcUpPN6uQNUuINzLFVXA2+y3LfOJXlWNlXaFxZfNMGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPOQsZQs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPOQsZQs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a7876f8cso25823445e9.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410454; x=1781015254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o0yW6uQ1LnJTQVmIzRpXA5Z0rqK8P+8rneFQb3y1o4=;
        b=JPOQsZQsfIUXYbQPn89gHhysBzQ2N5OF+SvDTucZePHwbPOyvy3LqhPX7KPeM5wv2Q
         e1jEmvqAzFgnOBBy5qEbB+xKehXqr9udaQITBmZhUKMQTmWARBTxhxXybMNsn0bAo/MX
         Cql618RLjOLQHGOn+LLcBCq5mZItwPKhEDNGMaU64zQFYI0d0z6qFETUCRfn6QKmUbLr
         3MEuB6BaMKTBkrcWdfn+o/m8i581dlcbwR46nnO0VB4TaGEAoH5C0yh6hPXIuYeLdAr4
         1W8p5tq/DIgG8VxjG07ywWziywQFLpEgJf2lq02Nbr3QPqhOgBeosEW+AMoMRX7Ixwe1
         W7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410454; x=1781015254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3o0yW6uQ1LnJTQVmIzRpXA5Z0rqK8P+8rneFQb3y1o4=;
        b=eTFbADVAMQrgKmP0emE/AwwTkmACeLj2ZB9g5tJSwaB55S7Nh+CBHYvmueJ58uAYRF
         rnYyaaeSi2WIt1AOFYOMoJ/wLGN0H6rHFkXvop9kNZxxR8X8qFdKy1/UHGHA2rJm42/V
         87nwOF59Jzv07K3mJN8XUtyXIjjNxRl+d95LA7dXh+bbQBwjws/uVYP8pmr+AOikMa9b
         Z24SssbVKGtPq+V4d6p6SAZVWZ5Jdh4NNd/Hxte7V4aOFQaB1gUY+RsWJY1pFQr5h2d/
         ygMdvFbSHnkBobEFwDJ1un9HIkEITGmt+l6AJPkQ3xrQ3nEdw7+Eki8RZmsWyMC5gdSM
         1WIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mivpKsQdI56buACApSgditTTf+UkHQeHQWVN1/W3qtHBREKoi48o5Opeha7Cbjfpr8XfPhMWZVtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0sNFJ/3koUKzEik8rKasyp9/yJdW25l2bwx1a44omsM7t8Kx
	DRh5vFEEZdFZJeuCkaKyu8UZfYb0oiI2eD4tT5pBDKqJ82ji0Va480bBOTRh/47a//Q=
X-Gm-Gg: Acq92OFEdZmZj2yN4Avl8pPaunTCU0oI6Y2OLpTnNmF/lr72DTZE25B7GwcS5BFAaww
	hDtZb4BFdvZqARFvAtgJZhgdcDDLRxbn85MIo/kbCuyC1oAWhOAW3nZ2Ds3pPabDo8t03Nj1phE
	eWhbTEBNWCNt+4ZASZW/gIB7fv7FrQG3C5aqkHgrULQddUh8vwKRi16OYdPQN3YS/bR+7DRRMRR
	IJTlSj0hViFVyJ/9hu7f7QF0PHj8a8wBWJ0FBLU2dIfAeY616PNR+PXtVnhfawjQUcvHiy8g0gu
	oPN4yq/Pggwo5ZFTx9KjcYhzcp+LmdyL5a6L43QEa+PNP+Qq8A1ESt3riV5Dnf/KMxCPcbx+CbX
	1qpMciru7rAp9WYvH/EZgj9etyDfd+9iZles8kOkGeUAkFxuztdjxp9PPXToIM13TMJNuDJKWMx
	zEjl5MxZVzwHbcpcMAbUEPHuMx/1Q9WwsxOcgelAop2TM=
X-Received: by 2002:a05:600c:2242:b0:490:5321:2466 with SMTP id 5b1f17b1804b1-490a2941ea3mr195165935e9.20.1780410454099;
        Tue, 02 Jun 2026 07:27:34 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:55 +0100
Subject: [PATCH v2 13/18] perf test cs-etm: Speed up basic test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-13-85b5ce6f55c6@linaro.org>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
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

