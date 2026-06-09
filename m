Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723A7359A66
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015492; cv=none; b=Z7G3u8KCUew5aCLb8ZYIBw8v2DxBEyC6SD5XADUCpR5ouWWtCkaqfOcPwcJ1/qzgv7KM32m2jp9jZ87Wotos3opv6f7Vlt6IbeGkeoNPFZwJj/CM9QQpNK71eqsGo6+TE4lHdS20904qCgVRBp9rWwYU8MEoNiCXECyAK1ndLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015492; c=relaxed/simple;
	bh=eCuV3FuofxqoEQPMj2FadVdPVNUg7XcieFIZyThEq0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOXYXg5tgBIk9IiFO3DxowAJwwH0TA2jN+L/Axx8A90ChHaBVjy8WOtdk6C7TbX+7j8EWezZ96OoIn5+PWiwzVKyW2FySPHrQQpZBpUojaXL35KOczGseHeCE8OqtOwT2b9yMFS+2ze/ocR4LuWimJi5JZmYnkUwa7oi77f7/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AWbAHH2V; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWbAHH2V"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6914a658115so4527254a12.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015487; x=1781620287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSy6i0DRlOr9w5Y09gyckl4fi8MxME+0ZH/anot9Owo=;
        b=AWbAHH2VX1MYTL+0G9ic8LszXaydbRcUoWM78FAJqc4MLIlBxg+yqpuk7/xvNy2KDt
         6C4DgOReeJZW/oFptV1DSOGgJtlzegihjfrOa5QDjipHtffNpcz/7Uuy0KJCnDfELmyR
         IEh7oqMvDK7DiPjwcMs5EoC2mDgbBur4czhxNDm7lxFfI1RMHrM6iOHgvQBqkcX6YbYT
         0ffj+xX+CVaMXGihzcqP/0fNJrz+DqoPeCKCRtSKUbiA6pe8vS+2m+Diig0roezTt6Hi
         W1pJ7SFieg8v9Jvp7tCTsx09hT5NquvHus3YRACoTV+uuR+DyX5cYsyBNp83bWqh33HB
         7RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015487; x=1781620287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bSy6i0DRlOr9w5Y09gyckl4fi8MxME+0ZH/anot9Owo=;
        b=c9H4iIXO+R1pvo3Yq9ViJeVBgZdWQeZeLVP3k2YvSFAICe3OyHjKaGMndyHbMaR4cs
         XiKjlFzni+L+eoDgu1rIPaz14iafAd80+l/JwkEG6u4FT6d7ADM+tF9LylngWlwZpIRr
         Dfzy4vh8g0ukupHWoYZmKw9gQeeqINi23sicbOP8Vln9LN5t/4K7s9Q66UUfEdrK90QU
         bc3LrG5R31EluZZHKWpEXLnqdZRusCjH4vWs3VYw60/d7RxvycQOdTGghbBvqc7GuRzd
         fiIcHuHZdabXU2gM30v8l20Shciy0EOOh+K1LuBRpZLNRh0bG3XuL1VAzpOpN7pZt6qv
         WYWA==
X-Forwarded-Encrypted: i=1; AFNElJ+MUjAqeteGEBkvNHfRQ2xlC4ULc7sAm+iDN3TWowLhg882pybgaYafATP0LW4b1y84v+KJ4JN21Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOfID+3J8+AagQommh2H2RY7djO+pT5jv+yhWCDmh026oEiw48
	ShYxmk5J8xgDfNC1qVPR7DwIvJd1SAeLcMi9qGHTqWIC26uLLj8L7T1ocj5iscL6JeDprq/ivZw
	L8zEhwt0=
X-Gm-Gg: Acq92OE/aySFlX8RFALw1tEaoK+ZIux3zu4m/pWahkLWPre0V+ZT7Ji6Vousj90GrZ1
	U9MxQYrlPpmI63SJZ1oZ6EpCh9zHWc2IdeAUJKSxqh8/TnPQFTEJ8OeW3XAw2c+HK2b3O/ES9Ki
	eTVRbtLuNB44Q2eZus8KrPEwffH0C3+fNRfcE5fcFhZE5x+KdC6aH0f3JSVCRbBOBF1fKLoLtYk
	jLsxp35t289H9kRRGryF1eQCTN2CSW5xBZ4dKX064ckJKPXR1bamq1EgwDLC4DMabNFUUqhj4LB
	kqRfk7ajpPvc5R1Usfbj5zGg9VC5/Lwtf+wGPL8QG6krnXByP9iLJr1ggOymM5PPWEK6cj5DGC/
	ilGMh5WI3RAftEh6uqyAhremdyS+/RZAIh20y1cGFyCzzzv3crwCUtzjo9x+SPXpwf+GXAK5sqe
	dMGHnLgNAwIJn55uxAEc36WRDN0pgfiOMPeJvMb71iNyd29nsEuUERZA==
X-Received: by 2002:a05:6402:845:b0:68d:4450:d21 with SMTP id 4fb4d7f45d1cf-68fa4e1bc89mr9424533a12.8.1781015486790;
        Tue, 09 Jun 2026 07:31:26 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:00 +0100
Subject: [PATCH v4 07/19] perf test cs-etm: Remove asm_pure_loop test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-7-44f9fb9e5c42@linaro.org>
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
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

