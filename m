Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A023366DC4
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569108; cv=none; b=SQ7H+zYRvlviNX48xpFARWCdTOGAY5xRqCVCPRh3kl3fW4cFPf9bAmSeY+lG+pmyMGqxK+RzkxpbENstH31wEpYRvpmC9ueJNqeSBgLYH1X3bcUb5hIoFFLdWoOHNPlFGevYx5iq9yR6QbtcpOAewO14RqrSbsAu0zzs0AulOw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569108; c=relaxed/simple;
	bh=OOb4yNfBq0DxPF8hQvLUI30prmr2dFYr6vUoRd2Wzp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHDUxkKuPmw8G2ErzLTsm738/k0VITpH0GA9OaZWXdc8UsjIQSVkSpFrVcTgZYg+V4SERuCN3lquUu86x7Ok/RI2V8V28T5e6lrYVX6UgIrypcct2ZKGDb4LGnuQpTIioB0VUse9FN4j7GANybzeWyFWLziUYqTeSJq8JpBrxJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3hfriSV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3hfriSV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47778b23f64so46606395e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569105; x=1764173905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=k3hfriSVoRu0zBMQ+lTNxo+Qfd68VkXUKWfpCKhXhWjW3QKdq0NxFlSaC+f6cpiXW5
         q4O+XR8SORA56kxZj8YOBLTsbQYIdIuFxTvAiX8v6Z6IT7+i5/yRqfoyxvTZORABfwpZ
         N1UNOfe/uFPBPuNztDGefrHQUWb3qBUVgb/RRD2T4wWCQspJfCJp9qLQbRbU3sQd0JV5
         ZzjhFE81wBHKPyUgripYkO8SGP6+JrZxvYIGFIBr1C9qwT8agDMzeg1vzj526oDuZu0a
         0aSlYXgpYmXpmsx+7loOFVdyGlBHtHSf2TFay8mLqvxoRumlh8NMwdAJ9IB8HyKE4+QF
         bsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569105; x=1764173905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=pLeppB2h9x4BV4/hU5VomVTYBuPsO+oMn/EaqiRpn2xkB3cQYLMPiFc2/zt6Vznr1C
         wdUgZgmz9YcvwVCn0x8GhRhnk8Fg4jMnMJe4QI7GTfVFE7BnkaMvIjKF+rlWftLQaaCl
         PUK4iMYq+N6tzoLorU4SgewK95RPQFJjsVdPNluwdwFZlgQC5Q03fbR+KNtCSjiDsFfu
         7lxvFF7nvo43BDI9W0zFvyZjSdWIt8dfhca0cNpAFiDiZHuqv0J9LqwCz42hryX+x6UR
         6UnhV80hzx1ekVzvuSklcS3fSFlw25H3l5HNAOVHx9Q3b436o5jt+uIVslYOZMTJbf08
         +ZoA==
X-Forwarded-Encrypted: i=1; AJvYcCX4+dG/QnCldy3AaBHKm8hYswrgpyewJldKH5pqtvScf9aGxEXfkJLMBtf3F8pTzKG9ytYY/v+yKbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznOkcoR3Viy5SimAeqgQSEu4RspNTArd8EgqnSdAY14DgghdoM
	tlNDz1+wBnr5EV4B1JgjPOM6TNOtlV/nfPEIQM2DYyz2XHJB27Yb/+8DXT2ROlo9RsKYL8qPMJS
	3kcoroW0=
X-Gm-Gg: ASbGncsw00NUSnD1pwtWiGtNaC6nspUH9uDu7bejs9lUkq7Q01FUH6U82EWfcujwX3V
	raFShKMQg002N79JPWOx2FUd3n5+bAKECyuKeeIbuy5FbfpXS5BfxVUOurc2D6KOQAOK5CYhFjf
	KDgA/gDoxz8V8/tkUKQYVfHrizenaDFrlJI7Qs0DisKQzY2/hyLQiCjdwlohSRNLdC/pS3nmocu
	EbnQkPJfDZrrda6/WYPR6NeAeiL+Z4lsKMNwjkz8EaHSsVhG6q5ayJjybSpuDyqCm4jUn1/08VS
	/dboIW7HfP62T3qKMnuQfLUywlkGs4rSLk2c2UYc3dyAn6giSObXr3S8K4JikuJ+FAwzSSRrmeZ
	FrOSSxve48YHwXgaBAIKmaKMWxxJiL3HP2MXWdGXBtBuJeV/Eej6ncaPhyYM/o+3OjeBVjhoBz+
	8vlw4s3y0fFSMenbvnZ+q72/4cezW5LYc=
X-Google-Smtp-Source: AGHT+IHL0Xxnsgm5QROIs0jK7YmdMNHqvM4TUjjLTcMhfd+KYuc1AUdTBzLfbEK0Xqm07NedRv3Q6Q==
X-Received: by 2002:a05:600c:4fc5:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-477b0b932damr42861065e9.7.1763569104659;
        Wed, 19 Nov 2025 08:18:24 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:02 +0000
Subject: [PATCH v6 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-6-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
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

