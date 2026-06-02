Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4B403EAC
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410451; cv=none; b=IiwsupfJ3LpJ0DsvYGKDmSPl+R4p02EhZFppeTqYWI/quYKfKTC0aoedmHZJaAdL0S1YJdpR+qZy9oy/0lJvsSBNBOZvh6q59PiuyiwHma5YdPa8oMkG0qDNZK0+tKJI7ECjut9tDv+UskTdKymAksw9AKpS12GWv7Cgtl4uwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410451; c=relaxed/simple;
	bh=Bet7dcog4cI1OWFbkgHySPvLYRaBjOEAmnyguA5dwLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OuhrCwigyNB7jnKqw2xmTKyEa8uf6+hubxsW6HcHlaIYV/nZpET/Zb5LDy8BhgoxpMgm13Fy1TkOUodDSG/4oSRSdnnCxTdshNkHnoAaxzhOxuX9MjIs9uGmrQaeAYnMumyB0HvtIo1vVKwZBGtrsWyU9e4bbL/aGYB1nhmQJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+UWT5a8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+UWT5a8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so2375855e9.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410448; x=1781015248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mOc2t8dZN0s1J71IBgMzN0QR+1naOVex0M+qvmJCq0=;
        b=m+UWT5a8AlVJdNCu9Jy9CkfyuxE1Gtxud27XnSUmIGzuUq9zMv1YR4Ueta2++5TpUW
         zzuyBTLATZKNFhu4w/6RFyzuEXJ8onmxob2W9xpo87iuIbFWOm1nlSmmFrGDK+w1mo1g
         7jU/kuf/+62k7BQHAGU6W5qLwkZqOxp1ltfYGoKYe/DYxbAvcDGICavPA5NzccFZ/hx0
         d7Vf+3rl3ZWD1mJ05W+/TH+y4SLzmuLw23PIZPaUdfMqWQEYpatCSFeidFEeCty1jzbi
         OTawsX1sIYFAlyJnLizMLeCUNI2/kjSyGpXX2esQy/Gt3W+0A7Fjaeykl2Mq9XHRNvU6
         vyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410448; x=1781015248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mOc2t8dZN0s1J71IBgMzN0QR+1naOVex0M+qvmJCq0=;
        b=DWCD01lhZPMsZvanMMqP9LmfNsfLY8gLUn4FLNtczV31Q+qU4Mg7VTz7dVcU0lY0Io
         +Ac0XRJwfS6PnIYbmbB3+qFksgaepWVBMc72PS9+eE+xyYsigI4XwkiV9PQRWWMUD8Jj
         jGGSBtBLx6RB+mG2GH6NHDwgIxG3rvRs+DvWe6yedfZ4rNfhZRhNn1izHWQ1JgRLBwrh
         MXVn67AlXVzW8SgEKgQTpfaTEykmwwljQWMIOWXEWdiPNbCJ3kBuNr7e+3M34bVF8d73
         IeOG20HYa6qD1WUK5OABhwNIwKWaeVgvzhpl+hDLGxo2h4Hvh104+RnU4Tv7+y80raOL
         +XKw==
X-Forwarded-Encrypted: i=1; AFNElJ9haCnpGf3PZFy9lLmhDdaosv9XKRICfBdVHjflgfnCYS7CF13F1TSeGIG/RA5xbJdao3ULPyocxz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwupTy8HQAkYhsQVMdncz/osMNEidF22+4xb99JhUUcS5IuZCvt
	E6UkrVBpF3TenviLXdMqGXFav/DaNTnqYQS4tr7Z16u78+/KKtZCg62XVgX8nDYkNw0=
X-Gm-Gg: Acq92OEvXCOCMCU/fWtgWyDNdTbMV+3WiZCH3w/VfA8YSA0yf+QUcyDiTuhmzKzGyN7
	LDEXpC0KNtO2y+sdGl2TVXMzvUh1EmIkfBz8QrXWRV5N50aB6h4XJw1IILHdM1vpMqMG66Pdt+0
	QRtCPt0Soq/uRkQe0zi0ZRCJgSGaf8bel+GX6X4XfNGJ8ZUS0aHAq1hgDgleiRg8ePjL3vLNIwe
	/9jCUcpQN8Z64xO3TktAHZqJPecbrQjBbPKsiIjPUr9usDVhwU8LOrRm5zPCIaMEnwDIKIROSw1
	Te9UeeVQQMGMmuBdFFPYyfRM/yBErDzUZPq7NHwzCoVpSshFkKruLTBZn99Amk8W3B3Al6wnnmR
	PWoqeQ0QSat7335G2uA4m5cDCffZcWtmrr68Qyf6Ycu3fXVETQDU5xusmEtw5qSGe3r1/xwsiaG
	micBo2a1Uozly/eLAzwDxytgEvxZuS6BnRXZS5n9D4LYc=
X-Received: by 2002:a05:600c:4715:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-490a293bcaamr257657365e9.19.1780410447898;
        Tue, 02 Jun 2026 07:27:27 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:27 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:49 +0100
Subject: [PATCH v2 07/18] perf test cs-etm: Remove asm_pure_loop test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-7-85b5ce6f55c6@linaro.org>
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

It's not obvious what this test is for so remove it. It's not a stress
test because it doesn't output lots of data and it's not a functional
test because it only looks for raw trace output. It seems to imply that
a program written in assembly influences whether trace would be
generated by the CPU or not, but the CPU doesn't know what language the
program is written in.

We already have lots of Coresight tests that test the full pipeline
including decoding, and in many more modes of operation than this one,
so if no trace was collected they will already fail leaving this one
redundant.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/asm_pure_loop.sh | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/asm_pure_loop.sh b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
deleted file mode 100755
index 0301904b9637..000000000000
--- a/tools/perf/tests/shell/coresight/asm_pure_loop.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/bash -e
-# CoreSight / ASM Pure Loop (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="asm_pure_loop"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS=""
-DATV="out"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-
-perf record $PERFRECOPT -o "$DATA" "$BIN" $ARGS
-
-perf_dump_aux_verify "$DATA" 10 10 10
-
-err=$?
-exit $err

-- 
2.34.1

