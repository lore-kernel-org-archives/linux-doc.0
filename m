Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F6C377E8F
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483302; cv=none; b=lFdoJ0Y0v3HEI6tmLiKuukOcNoizTT7oLRO5HAoFGtc5QbP7+J8FlV/brORjzCg55tLCciLLLX0dVojXSkc39orvuhZkg3BZfp4QroiGRJgsL7jULhsWFI0HzP12ZGRdqaTJnyrpltcJerZmfjQOuTpvfiDN1Vlv0LRufkYWyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483302; c=relaxed/simple;
	bh=OOb4yNfBq0DxPF8hQvLUI30prmr2dFYr6vUoRd2Wzp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWmzxmqQxTSlIlkiwuJoln+kqPU67CEkhBycBjlzjHV6C6RdIpKsRho3HDfQqSx81JHx0OglNHRojCdws6Z0EKssip4+oLshe5V+wJCPWyLFh2b29xXwrkbczarRnRUaLY2qTj3/KYBj23Gi4plJVxLQ0F5Gwwco09erZkHhpt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Le2167YA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Le2167YA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775638d819so33159725e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483298; x=1764088098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=Le2167YAw7S2+sW60Fl1EyhQJsv+2hjuvrONkH8jKgZK5DgCxOpQoq6B8qC9K7qkJh
         0nZB3JdJoOXpDs5x/3EAAm4s23JY4+3Rn1Y3NbNSf/Sav/fG+YBv5ZyL2Ojmmlq6ylUJ
         +1s2dYe79v+EO13foCYriSkj6BOQgNq/BcBlv8Rv9xBRzw6obtmEl0Squgy1z27zQip+
         5IJ0c/l3Uimee3cTCDQsfYQTWDry3j0Ut1VGdffdFdSslJIA/gwIOHx5kAudeuqAR8ID
         Ofzl/X8BjI4t3LzudNLkaOJai0p3VxDBlGwFqGPERFlSXVr63k1GXDo6aYR/BOf2Bdde
         VrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483298; x=1764088098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=arkVHSNeIG4Bicc6fI6id8eIZTVacaLfEeBbjY9zm5zA/X9yUNF7JKgEah3VsQY0w4
         t4zCptLrJCMCX0KW5N/sSrH3Sq90wyluayJ7OKn82Oq6JRCdvZqW4CWhiA3yFFJQPbgC
         yq+RDVCe7czsaFJH4P1V2EVcwrEyob9dkSN7xud1QITxYbqWNpINXM8JJAGF5rnTF2F1
         kB+JZUhowvCaBEBd7agyMTE2pmcsL+VuiZUebYspzekM7zzIUilsYohrceCJ5SJApicp
         yfdFG+rE/erizTal4LH24LaAsxHVb6PqXgFUXw3LnavVJgtho8bUYgYlpy4tKT4dA2Kw
         A8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWp1BTvRX8rOT0l22GChx0ImzfLl3ia4ivlf/L2G6Xb4wd/w0QBjFB5nH+XaquSfJBWnPX6XFzHS0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YziYLyO7mjdK+H6LUOrYnjO01R++TeV+LMFtTRTAGsfJ39pI1lH
	lm7ReIBpJ6hA7xODT1cqnDsz/9X5dwrE/TSaUVEpAmHVT3dkGbrxC3b/Bl778xLnntc=
X-Gm-Gg: ASbGncsoH4tRU7RumVlWlIG16GHwNe2uzh1fxBTDikDo6XFecLuDdQyu52i8eynfA+J
	r+deZnwi5clomJMRC9VDu/U3L02ZnIIO73to0nF4wOfKuOkjQiI36iGYG6xCkceyJcfgfLv2INY
	CDHNdV12h0EIS6n3OfcD2QzoEGqHTyIp/+uIVuepo64qinLlFGSuJ04jmDphRH5sYOejtyK713O
	jzGV0OfUOfvGfOoECBli7HVA0bUFNux7G2VnZm3ata4rHktSYR6BfWp61U0ZB3Pov4/dLkEaeh3
	VtIFtAL6WB3Wdj74I6I8AbEXs1vXh/s6iKQhnVmSObcOa7kDAkHi2XlIg046OIfzrWFRv4lNpyT
	IGC3AGb1GjZqo8l1o8Zg6vJizF2rCg+gCbAFxWsgwGe8SlBGFUprx9tJqgM2YHHevDL9Kik6i1O
	E/pyq2YeOhyZoP9DPSVWpX
X-Google-Smtp-Source: AGHT+IHdkgwTmwsezlOoVl1oKxZpwdtFrPVQJMsdiG4hR9IlMAHY8woJY2B8eC7OmFl51DiuSqqZBg==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4778feb2401mr149231795e9.29.1763483298511;
        Tue, 18 Nov 2025 08:28:18 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:56 +0000
Subject: [PATCH v5 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-6-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
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

