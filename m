Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCDF466B5B
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481867; cv=none; b=oKm6fmT6RIh8f+RHxYN5XNWcx1a99uoxgTI3L+5IvV0LWFJLUe3IDUZfu5uRs4c+TXDaiTKD5h5LxgIbj0uviIslcP5mUDcLLFVbRY0P1b3t/cS/J3DLR5IsP4HwWk/e0ZLbvou+DoaHOqmNQqdFxr4jhScE21Xtken62MW0GUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481867; c=relaxed/simple;
	bh=UqUTcZlsYRMZ7HrUOPVdOIyjHND7lnBLRlj9pGTngF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ALg4vq4ZuwlbIS92zxdqDh5VJxrR/EAoKo9umLGs5GZyp35HWWFUtlFbRZh84b30aRNhlLORsvXjP9j9XpBH/idA33fL9NAVg9S6uuHJdnCPM6CJM8NkxvJHbTyT1UeBKWjB0Q0R18trlkcGnV2FIV0HwMmbGUNkZ1RqMHmI+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i0Wlt+RP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0Wlt+RP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd45e596cso2087122f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481862; x=1781086662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCyit+MYNey9T5qQgf6spNYkow7XxVLTYJAiVVbCmNE=;
        b=i0Wlt+RPcv44qhtF5udBvR8aHl6ithT7E5Mny7TyZAELaBbygssmh0taH+i/OYHja6
         q/KpjtdsIRuXHERpimbuHLGQxE3ZP/c52GjM1UZZi5yeJOgTicoVh/pPHkH6mK80h4IV
         e3suAomkmYzwkNzmUaEqgX2j2GLLjs0BuGAf97ibu6s6JeN+H7I1q8uHLB/v3q6FqdjZ
         J9B9RSq+fgps6rzJ5gpXLdTdXbbJ0dsd1h026TuvyIdOVqqPQ3GiRwiE7Vwmv9vGnFek
         adBK8bKbPOE4dwePGotL7I7fmFYJIrMAIJ0FTftxGaCNfDwdzhJAviuJAq8ILYF++Sfq
         zFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481862; x=1781086662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eCyit+MYNey9T5qQgf6spNYkow7XxVLTYJAiVVbCmNE=;
        b=GCsLXo4T3LyvNGdvn8VQPU4+8OE7RByCex/Cb0yTLl8rnuN3mluFk6GMSSU9ceRDc6
         UWbMdqkn/hgoZMByauCMnjno46k1yd7U9TSCGqWPPLPUqzd4an+jx1DbXiZQjfUtinVK
         /IU8QKQtLFp3w5Q0TJM8FUk92619UxqSh9eMuxz32xkDNv45PMHtSt5zw/N9OHMgi6kL
         a85AprRclzCJabJ3VXgJKMyT0hkBSroTvs3idK0xV19yrV0U0/BCT5zy3fJyaEK6BFWK
         cWrF5Fynxz5oG1QRcI/VbyfEgDG/zujiW9m35EfuDELn2y0Lf3JM1hgbJWB7+P/Bqw7i
         qWGg==
X-Forwarded-Encrypted: i=1; AFNElJ+54gTOUBWQits4t4d9UQK9ZP1tQ0We5GRLo/fTzUtHFcR8JSn3Ep+pVvA2gQjjEMwUJAC7m3wUlGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1GM/glIGVw3twDnKlWo7E2jX+dTLEi+wRVBioWWYmKTvoi51u
	3XaIrGUrsMAT6BkQeGaGbJ3WFbKmmb+IhCi2qyFTAlDPkhbI7M1DxSP0W2WTz9DPAZw=
X-Gm-Gg: Acq92OGOgPFaX4qsYgEvfxLgkmpDHaY7jH953pdcTOW9elqHMfYYNpU1qyKS1/m/CBi
	Ls9A1MjrBfBZOmoVn2M70JFHg84tZSrsdYjD8mPHMXqN5rG7Dg01ObVctupS39Sc0TETIw4fSju
	5G9T9wlf1HPdE1PIhZLnz2aQJKj97ZIz6FT1+x6nrl2WkuanvSA2y7QxJHfzmwaSwWUcRsljRGm
	UpyWB49lm39Km+c2xxqifJPTkEiq1zgHwWH1c222hYLvoyI/68MvE8Wk4b5wzyfIMv5UC3a7sbQ
	j+wF1wPq4R3Ba4PZ8qskNwPfXK3M2Cdk5cUbuRtV/KFL+8Hp0ACqPxGE64k2eCqCQD12n95q5nq
	9frZRTRc6XLnKne2If/s5KhL7pmAo1o4LMyyMxz3f+wSk2GKUC89YV45O7Zq52WKlA1+ZOi1hF/
	sSHPJg/vEgYBLIUF9i63RTDyegcMwmmPey80prwwj4bTs=
X-Received: by 2002:a05:600c:1c1e:b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-490b5ed1318mr45363175e9.21.1780481862441;
        Wed, 03 Jun 2026 03:17:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:23 +0100
Subject: [PATCH v3 19/19] perf test cs-etm: Move existing tests to
 coresight folder
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-19-c392945d9ed5@linaro.org>
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

