Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C413AFAEA
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481853; cv=none; b=qVajc+vZs6P65peZ650TiAsPJjF3bjQz+kOjnrM9vGUGbs59s3p3noUCOEKRlnrScy+mOogDniNbuFfe8dv4ibLab7/synkXDml+sK3YfJH1v9dlrcrdhxO/17sw4Pw1CqHkZLsbZvZdMLi4ZtgqbchRg0YQySbFFWaL/Eh73FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481853; c=relaxed/simple;
	bh=Bet7dcog4cI1OWFbkgHySPvLYRaBjOEAmnyguA5dwLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXjyFdrFFEpjlBQxuvFBL2l9fTZ6FpccAYJ1hee3xlenULxa5RYZ/iXlUDXYjFGUAfYPjis2BiEYZYc6aLUDNOfp42FttO+/+yZefbavy7xDXi6Sk0VLlcPIS03lxt0qR6h5k5G6aDoZ80tss1pmUA+LDDsk4vlBMxPPgHwg0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU9L44sN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU9L44sN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2948132f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481849; x=1781086649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mOc2t8dZN0s1J71IBgMzN0QR+1naOVex0M+qvmJCq0=;
        b=OU9L44sNb0MQl6xNfYkLA2jUiWL7Ltbcbg0P6kv5ygVI8uOqIqlZG9MI1/eLhZgYLh
         1sQd4bmjlGNwCBiyqK6tbtVdpIR+1XDMJivOqU0bjkr4q09bEJFrl+kSnJbhut1D+fWd
         LFXxFqJJo9rsChhsNIXgNs2QwGPG+h7I3bVIGSkkGg8S9SwYg0VZffhgvZVNMYcwC47Z
         pxdY4C99v6vn4hOhUCTKROVt4CclCqexvm3POh67O1Grrlc/YZxBTW/l0zDeevo3qKjF
         7E66pGg4qD1dOLrJmFlXf7GDA5G0dRLOJ8rgsSc+nuWNzCuoXQyv1fM7VMK8912c38Xl
         0qUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481849; x=1781086649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mOc2t8dZN0s1J71IBgMzN0QR+1naOVex0M+qvmJCq0=;
        b=A7YObnOpY5iP0KTttfgPHXg6zLJkHlGu0fYiM26h7FNAeUrE9Aw+SNsx3d0pU/XnJj
         TiEMJkDlF48Zy+kZ21rZNbPLFmdPdQleIFHxxlOyav4iIJCzQ2Nv5E3uR2ufB1ZDq+Qu
         UoMFX5A5rI3WLrZ4juEXBicaJhnCYGQgdev3UbZdAT+i45pKIuxm88GDu68rnBhEE07z
         v39Z0w0MA6J3QkvCQMokH/tXLjQMftn0h8z4C7ZL2r/89FUW14vmlon02C3AEWqpoCfd
         AUxfESTCYmH8QXOuMVhbGBNUW3ddOE5CSQ84fM5/11mwEJmlN+ok/+YX4wvtkPioGaWe
         mHGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9s/fuVDNERR6ppmnxVV3BiWrdEMNDyzCdf0sagaBYwXXvUsC2420yMXyND3n9Nkwtp59GoO2nxqZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP5V17xtL8p9iNM1GYxWdPATMH0xfLprshuaItiwB+kWdEkGEf
	4p360H6CMJHpG0u98wnR7iNnljQPT8BFDGcvgk0YFko2WXQJdzQJ3Mzsmkh3S71AstU=
X-Gm-Gg: Acq92OHQ/5BgACTLEVyBoNdxmBihqodOmda9RFZdq8fTKILvMOQFHnzVMBZmOvzu3Bf
	+G0YEyK7Yj+NLcgXAGYCgj0QQYDcad9PF0LA418uq4oFYno6kYpbhVTkfIzrFgRR4T3GIXSItOR
	Dx5R1I+321cKVu+OdsSfSO3oTadnYsaCo83pKUCbxxtTdSP3SmUApM2UdlWzdEjZ22yx30IcLcN
	QQ3a2qyK7Xr1Bf9aoCg5qFl3wz6NtKLuIej6Ypbw+6yaD3RjoJEZM5xpPgXCapZ55AgoVbKBIkd
	hk3cKcfXTYul1rdU9jwxU+BejwyhLg8sVUiqdYwxOwhnldn7yjk35fN8C08UMW9+ztoUz4FDc8G
	S6FKfm1ThD7ZhjNnxCjovwkOGL0znZM7VpEGZLhKjXMUuqvyrMxXNmEDTPeKFh7PUVeP+UpXh1e
	KUaef6T9onjxP3+5DhGntGnDNbQfp/GNVG4fmJslaXsPc=
X-Received: by 2002:a05:600c:154d:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-490b5fda5b7mr44655035e9.26.1780481849590;
        Wed, 03 Jun 2026 03:17:29 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:11 +0100
Subject: [PATCH v3 07/19] perf test cs-etm: Remove asm_pure_loop test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-7-c392945d9ed5@linaro.org>
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

