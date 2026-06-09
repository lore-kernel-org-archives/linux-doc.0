Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B1843CEE4
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016053; cv=none; b=da728N9gktOqYTs4nhC6hfoax9erN4neIPkcIJ0TMtCnE62Q7Z93xuwRT5zs74H+d0E3vNjBfgRQzzqcr6rrCe4XQPwlKFoP+rKn850Rb7/Qg5Hv+Mm/l2Vt8nlW0+K2QMKWMBCSEZqZ0hlXEfi5vn7cNRTVhRe/W8LFyZvVETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016053; c=relaxed/simple;
	bh=6om1sNi+g28w6gz9Rvlzv8I2HBpgV5uEGqJP16w3z5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3/zuYkluxHKCdBdzf5Q6+Fd/REVO0LTpN6A8QMtggWr+2rBhnD3Sw6Uodpnawu3a482A4+PCxBlI3KLi0hf+k7kFNiZnInYDoh0pj1aj/2TLQW+OsnZ8OkKFxztk7PXrhs5z3BsgnqngVtmT95VdLxhXRMplPPtHF1OMgdl9oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+i3rnkq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+i3rnkq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso39970295e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016050; x=1781620850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gf9ynHBKvgH06k0u+j7iXyYQLRwSGMTUy1wnSW+2ToM=;
        b=q+i3rnkqFX/4WNNtPGpAIRkLpGxkb/2/A52lm8rPaqFVKMMa/9z8clybplomH4As3R
         5rbMMnRCtr9ta/CnbFxBnhRMu2sh8eINFEmONmLmTtPciaDGnzQ65NcDldQA8LGcySLY
         25G4zv0ONEeTEqPKNN3m3zl7R4Igo8n1G2hlRYauQYBN7OB3aXZL8Bg9EB/kskoIiM1M
         slMBfmkA7SkDVHGy7EzXqr0hS+Cr/uGgfkzIlIM/vU05RFBd2jf3Q1YGNBnLawsL1bVl
         jIqDEJDfaJwhC5j6XhrhZzuwGVSq/6mZLrqVea/mC44f+nCmvmeFUeW6ju8lIX1Q8IZM
         L5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016050; x=1781620850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gf9ynHBKvgH06k0u+j7iXyYQLRwSGMTUy1wnSW+2ToM=;
        b=IkEobtH/4CRUe29apg8J7Qhd3coKrYGQCgPLrdr1+q3VrBbNn2/wVmWFU+5J8jyBs8
         7umJS20WOVabE+Kvfl/pTYhoIop2zf0HfX6ROXYcy0RJbJmive79Xk2SIelWuwaw2YX+
         ZM83ljY70iePBdSsl1OgDRw7AxUoyejrVp4SF4qWCTCkO71NdOo/o1t8FzZP+/2Zgb2d
         GDF7I0r3Z8P4sChZbyopPArzQ2SeUSuXdWkDZ9BNJIlxpQcpaitOLJKNP31Wqb6j1372
         YZFX6oQatBkRajAhU4L2gVo8/Kf6VwHWA0K8mti1o+WmUbTcU14RQRK5IrFBz0nly5bd
         RTKA==
X-Forwarded-Encrypted: i=1; AFNElJ9RrZnBN2PmVwICN8T9VROcFd97j5de2M3K7n7h/V/bJ320sQwg5Y0CCBKs3nAoa2DkRCjapd8XSTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ+8AkEuRDeUEybr4K6zpZEBhIlRCUxS/JxGJwOjuYxZ1BGn8+
	4Bwww7jLYxi2tEObKggYlIc78zlmPVoOZGFu5NgiODsIS1GzYYBy3xJBbzxN/VQDHEM=
X-Gm-Gg: Acq92OFI4Yvr7keev8E7DDMtsIoDkUV9L4hRpMcWF3YKjvJrNX4Cj7yYfESL7AUeA3m
	JZDqUP65UtduC98EBc+gLSIFEntp8p0Osju1oqh2Y7EjANVmytLJFS5NPPNpfpwMYOoTv4yby1p
	p6hU2fH1lMc+7Ozy4yWdRN4JGEmu6WHrmGe2R45G6saeVXFhXrt/afo0FjbuZ3+Q1JpVB4dLIMT
	wqGCwr8mPSx1wwXWrC5cJxNrYgmr4EeEGm7RSJRAK4RXRd+FR5Zc1rlM4AEBnEL5Sh39+163IC+
	PXtpaqFp5cqllElKCKE4JqcWY8yZM4aZSsc0CWG7VzYZpbmWWlyHrlzf+APgFHq5QnxsSdClb8r
	gFb8NWWSCOB/OZGkC/q7whM5t0Y2+tjfXrsIrzZtkzB9LHdM2ZnfpMRUb8TWy/gp4pmqmSqradS
	3tzvLqoAjIHobJTCeDAIUrT3p41JrIF8fnvoSCchzxZmJxYTb/PI2Yjw==
X-Received: by 2002:a05:600c:354a:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490c2607c39mr343398935e9.31.1781016050068;
        Tue, 09 Jun 2026 07:40:50 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:24 +0100
Subject: [PATCH v5 19/19] perf test cs-etm: Move existing tests to
 coresight folder
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-19-d53a7d096a19@linaro.org>
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

There is a subfolder for Coresight tests so might as well keep them all
in here.

Reviewed-by: Leo Yan <leo.yan@arm.com>
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
index f2fb1aa92252..ccb90dda2475 100755
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

