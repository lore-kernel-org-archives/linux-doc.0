Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C95327C09
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330959; cv=none; b=PevmP/B0VPB5iEVy5vJLxyf8yYJFdlIC2+73/Ki+c9960kQ+in/2+s9zlE4I9nb5JWgwDQYrWQHydPKM/6+MAvOKlpx0MH3m8lto6cIN6RNo5aqt725i7lhXyw5lp3SPUhWH2SvySc0rdGhEmBmUhVANCtbQ6FvwV5EMxX744pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330959; c=relaxed/simple;
	bh=ZGYW4jE22Q+gFfa19AG+ptqVHBHrxJsL1I9dRnhrTgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZXUOKZp+70w6ajVVd/A7SJKPEE03debL+kmZmmk1IiGx0v16MxiQF5fasVyM29m+xVpNGXlwLkhcWU6TrJ1A66zUaY+k1qJqRdxt4OyGXIdTpp47WApfo0bEDaqyDkle+/9jLsU7afPpafuQNZID5b50C2fwwYRNrpLHVhtLjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnANFCdr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnANFCdr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so12395055e9.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330955; x=1764935755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRvaTUsN/BOLMraF1V/Jx+sgUDlEB4La/1yBhPfFT5o=;
        b=xnANFCdrZjf8ZN1GB/7y6E/IIKZgm2gQJ22uAclFt+mE4Yqd0+MlqWQqWgUav1eG3t
         ywKfzMUjS3JiDVDInL11CfQcqLanTaaGXxuF3WWiOield9Nu3bTz8vYca+K27HaQFFr+
         Nj32b3TM8CnSJ1qKs8kyBcd0FCo36AmAHDn7wwuhs0QsMn4U3+WXLITGfqP65tMbzX8M
         DsK+n/QIVNDItsr8vm/Tv4z6VDjimn7GOKOvG2F3bLBqhGMdyZgoXE9ZdcG89g+qjIiY
         x4ROG6Gav+28Sprb03aTLyTlao9YLu4/f8PmpuwBDTy624WRnBXNdCG34ApRufenAEZi
         b5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330955; x=1764935755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bRvaTUsN/BOLMraF1V/Jx+sgUDlEB4La/1yBhPfFT5o=;
        b=Pi7qcq02I7nQ9VKJQnFpoDZ18+L+1G5afOU50OLTVnIFPq4gQDU3fyvuFCDUzK3/Ld
         C5Fu2jZ8M6D+zbT0baXxVW42XcFPrmlh0Ixke5Rzx/CJe8/9iGeQwLkn6U0VU8jn0wK9
         yURTNXJ4sbiKzpfeu+N0cdvjw7Fn1ay37gKTjxDi9JhpRTDwxFtPNw7mmy7bDTiBYQMc
         ZL8ShjqDCDe4+f1MpPb3a6BhBymBt6BnaHkXimLVqHEU3tJy9ztDRv49R00bC2Z35F+S
         ycpoBHW8qgJcWuS5PeUH8Pp3Ye0BRKOlPpFatuHJYiRzroz2NnIZS4H1tZI4US5Tx6zb
         Ep3w==
X-Forwarded-Encrypted: i=1; AJvYcCX7kjls8ErR6DLysQVHYCOVVquoVkZINjHS+Cyjt72xOC4YJqBHg1xFEy1nsC/arueAMQ2rXS0ZuYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaE8TRZjw1uNIkRS+TOgYHRQg3OaACRCobB5AY99IbIj0aQCR
	LnMiq4b4nT5aOuJmaSbyczsTIDgolzqU/IoWg29srUz6ZZYncmcRaaTXmeTkRaSB8q0=
X-Gm-Gg: ASbGncttrgA9lp0Y0r49OnNRe9EqME7OknMeGtRuloRfNG/lwalsSo9SdYNeGhBMp2s
	Gk6Jpz3QFc1j5w7hZg1uCjh5SHwOfmj4fQOoCXsIJiFgIAjedL66cLsOdt/hSC3zIkd+0J4RmCg
	snxQVDmEyWjonjQuKzCyKSuK3DxKjoqkZMAYxMDBu6XZRxs798amOgko69i1hFvqdxH4IfYt9hj
	oMzi0nax0DjWWE17cV1QPy1UJ983Q7vbx/+9shJCHG0iQ+qvvdWTxdL4m5OFhQ0hwsDtUy2mp8C
	HUhBnKHbfaoAvuLyuw3pOgaeGF6WJMQuR2/VmEfAMdy/LxUKUcx7jmrrZT4cMJZQk5GeFLY/7uI
	aYqvlzA0ZKFydb+AREnNDU810setX79qIH49icppufJXjx60alj9jnxgHzZ9wPIX9OAyHR5vr7J
	4aGDbwHkfyyKnVs4vyVuE9
X-Google-Smtp-Source: AGHT+IHHJp7IXs6ZlGHGDXrAuQH/ZDtq9VItsBGhLegTctnw4skk5g13LG6OujHX1TW9GVSOCqfOjA==
X-Received: by 2002:a05:600c:154e:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-477c05137f4mr277419485e9.10.1764330955144;
        Fri, 28 Nov 2025 03:55:55 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:18 +0000
Subject: [PATCH v8 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-6-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Currently we're programming attr->config directly into ETMCR after some
validation. This obscures which fields are being used, and also makes it
impossible to move fields around or use other configN fields in the
future.

Improve it by only reading the fields that are valid and then setting
the appropriate ETMCR bits based on each one.

The ETMCR_CTXID_SIZE part can be removed as it was never a valid option
because it's not in ETM3X_SUPPORTED_OPTIONS.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a5e809589d3e..4511fc2f8d72 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -28,6 +28,7 @@
 #include <linux/uaccess.h>
 #include <linux/clk.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <asm/sections.h>
 
 #include "coresight-etm.h"
@@ -339,21 +340,22 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
 		return -EINVAL;
 
-	config->ctrl = attr->config;
+	config->ctrl = 0;
 
-	/* Don't trace contextID when runs in non-root PID namespace */
-	if (!task_is_in_init_pid_ns(current))
-		config->ctrl &= ~ETMCR_CTXID_SIZE;
+	if (ATTR_CFG_GET_FLD(attr, cycacc))
+		config->ctrl |= ETMCR_CYC_ACC;
+
+	if (ATTR_CFG_GET_FLD(attr, timestamp))
+		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
 	/*
-	 * Possible to have cores with PTM (supports ret stack) and ETM
-	 * (never has ret stack) on the same SoC. So if we have a request
-	 * for return stack that can't be honoured on this core then
-	 * clear the bit - trace will still continue normally
+	 * Possible to have cores with PTM (supports ret stack) and ETM (never
+	 * has ret stack) on the same SoC. So only enable when it can be honored
+	 * - trace will still continue normally otherwise.
 	 */
-	if ((config->ctrl & ETMCR_RETURN_STACK) &&
-	    !(drvdata->etmccer & ETMCCER_RETSTACK))
-		config->ctrl &= ~ETMCR_RETURN_STACK;
+	if (ATTR_CFG_GET_FLD(attr, retstack) &&
+	    (drvdata->etmccer & ETMCCER_RETSTACK))
+		config->ctrl |= ETMCR_RETURN_STACK;
 
 	return 0;
 }

-- 
2.34.1

