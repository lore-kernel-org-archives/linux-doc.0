Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61082426D1E
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410462; cv=none; b=FaR7LE241yLWHioSFBq4B3mAsir/dEfDMW7MgN62fQxEBELSRYen/QKW1H5+bIorNYV73Axvf/vMUTxAK5IrE+1iNvliBIY5iAYeqoMvvqcocOIvfiud/Cap9AChZ8HWlkRnK4qLLXSVh4QeArFoBvwtNVMwrruw7X4j8J7+CyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410462; c=relaxed/simple;
	bh=UqUTcZlsYRMZ7HrUOPVdOIyjHND7lnBLRlj9pGTngF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOIKdi1SX/xCl3NCAxsohOuOsHvQnLAFPRX8GwBt8zmiPcbUkdeo4MSo0E5nENU7UpPcMz8DXVYnEBjW7/lE7hUK05kolexMOp89W9lIIUbtS0abN9fZbGhIB2CTP4u28XVyBV4DPq0bB3cCxyfA0047OAmzYF2D+UKVIEArm8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWTTARr0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWTTARr0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3e03939so4508335e9.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410459; x=1781015259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCyit+MYNey9T5qQgf6spNYkow7XxVLTYJAiVVbCmNE=;
        b=TWTTARr0hyfXJFttBluqwf4CfuBhqj559ARL/D/LHTuf1PKJfmtL58sJaQ7/Pegpep
         gNbovz6Yjxzs50/PtGa+CbBUv9CElKnN1w0EKGVXwusA6GM5mSYy8LNZvNYFKI57VB+H
         MXYs8ox+a0MbPfS2skPwSDfNNrhSbNC3MsJ8tmyeWY17Wu9Fx0HwmO6DynVmeBHyd3fL
         rkcdowRJMjY3D4IF3oT97b1Isdadkjew7kjWhyJUEJO6q6bZcss+D3puSyoi6G2+LZjN
         2B7scg/EGPdhkOAUCCTST6yyDLjCYfgHNulzAV0GsQRDSmBqxbA9qhDq3AEx+JOIybnx
         thHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410459; x=1781015259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eCyit+MYNey9T5qQgf6spNYkow7XxVLTYJAiVVbCmNE=;
        b=PvyYJS5evjkE5zXFla4EZR7MbO8AlABXoRjBqjKQ3IxPDc4rUYzNZy403ohLnTujSX
         lAHrJun8Hsk4/1a8zBRWDOh9koOQVDUhhIbON00g30TtZ9iFhCppyRm7SyE80PlMMAX9
         P2fPewnapXZDovjrEnF+Z1rIv5gvSqnlP3Rs+zGKmdBpM3yQ8TgdSdG10SZgrjRVGQRq
         D45982D3GAGvH3P86/VMGBBnFFG8lcrMxLKUQDbCSi464WVHVscHQR3XuiBzxanA62Jk
         S0oeUtN1qznPATEmdjovynlc9SsC0u4XXIAHtBlWY9ets4x0D5z4rihHZ7NAHcOrFoOw
         IXmw==
X-Forwarded-Encrypted: i=1; AFNElJ8ynJiOHTijcqp0rtFRpwznHIYK+m7kTLnQuvRMxOclPXDTjuJv1cowSCe9j8zOnpQosbhQlY4I9D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyckTqpDML/oW97uQfolDt+4HEW7YPMf81eK0gHVaCo01MNf3U4
	xTNmTzIu7MpNgeFoVcpPgcbaFE/rK10H5WhNsSN6bN35r3gqhBewd6lO+Xf+8ScolFE=
X-Gm-Gg: Acq92OFc6slDEEaQcM7u7wPfEqrJmpCWOZ7QMj7onc14FJrzBgdK+ZlswCAXeEj2/kt
	bCtYzpm2xNHYBMWI6F1AzS64rijQLVlCI7bISNaPD7kL7lrX8max0t0f0bIZwJvI+Yp4B5BBtVM
	Cngjez5/Y4jH8+VQ8Lb8AnfNwt/1ekyuJ/zgTZJBv7ZY3f4l4YyKueM0vTr9wm7ZvHar/8/hajR
	0NTt+t9QL3sDDHFf4zAvCbqnzV/nseIfbYz4kVfRcifAET5q73tQYtCuIpGwwBWClSTR9VW/ImP
	BukeCa8keK+Wry7rDPvtcotk4ix9eHac6zo6RX7r8z1m40LwVGt9FOrfLAo/mNAj4gVpipY/XHl
	B6p8srghgvNAdeqjH9hlBO66RwSAjPsw5DIbCai2u0PhP++WsEvc18O9JtCIRjv5sdfOKCCxmln
	Ns7qr9BBm5zxAs1GH7hLzcepnAbXF4tTda/k/lftAfSuc=
X-Received: by 2002:a05:600d:6447:10b0:490:5000:917 with SMTP id 5b1f17b1804b1-490b0e373acmr50037565e9.1.1780410458901;
        Tue, 02 Jun 2026 07:27:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:27:00 +0100
Subject: [PATCH v2 18/18] perf test cs-etm: Move existing tests to
 coresight folder
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-18-85b5ce6f55c6@linaro.org>
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

There is a subfolder for Coresight tests so might as well keep them all
in here.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 MAINTAINERS                                                         | 1 -
 tools/perf/tests/shell/{ => coresight}/test_arm_coresight.sh        | 0
 tools/perf/tests/shell/{ => coresight}/test_arm_coresight_disasm.sh | 2 +-
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7efb893edcbb..ff8935b459ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2749,7 +2749,6 @@ F:	tools/perf/arch/arm/util/auxtrace.c
 F:	tools/perf/arch/arm/util/cs-etm.c
 F:	tools/perf/arch/arm/util/cs-etm.h
 F:	tools/perf/arch/arm/util/pmu.c
-F:	tools/perf/tests/shell/*coresight*
 F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/coresight/test_arm_coresight.sh
similarity index 100%
rename from tools/perf/tests/shell/test_arm_coresight.sh
rename to tools/perf/tests/shell/coresight/test_arm_coresight.sh
diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
similarity index 96%
rename from tools/perf/tests/shell/test_arm_coresight_disasm.sh
rename to tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index 2a400fd38a36..b196aab709f8 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -24,7 +24,7 @@ perfdata_dir=$(mktemp -d /tmp/__perf_test.perf.data.XXXXX)
 perfdata=${perfdata_dir}/perf.data
 file=$(mktemp /tmp/temporary_file.XXXXX)
 # Relative path works whether it's installed or running from repo
-script_path=$(dirname "$0")/../../scripts/python/arm-cs-trace-disasm.py
+script_path=$(dirname "$0")/../../../scripts/python/arm-cs-trace-disasm.py
 
 cleanup_files()
 {

-- 
2.34.1

