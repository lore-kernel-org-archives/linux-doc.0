Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2821F3203B2
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154671; cv=none; b=amTz3HQcmjwtyTzqLO2GJjhvSOFuQ5yDTUCJAHD1+cqVn/3tbYkPJ9ZE7dVRB/eSJAClZQQcoX6kEf15oI9RzkHQR/AEA6fuIEOazG3qlnVNyB/IEyFT4XEuVLECe1MW+VRxXoKsb/2rha9cbfi8WIRb/WGulemBm6EnBJzXAYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154671; c=relaxed/simple;
	bh=3RMhptuDb6hntDjRO9PlAJUzplD9xGCbvBdoaETHrSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6WPFo7sGzeKCYoROCExOG+J1QjIksUe8J2ftFQER6TC35OEspPzpQQoo7/P9J0FIEtR/Hi/L07B3ndcJoZ98gb7EB/TAV3WUmvplwVkFfW9pscHqPlk2BS3qtcABlVxl9IV46mirRqh2qMBDWWb9yUeaqyi5LCM6PCDhucj7no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYlQn71x; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYlQn71x"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso43073935e9.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154667; x=1764759467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aV97bb+2uBMzq9jHPPNimq5cmAOBpE8XZ5NB2YnSTE=;
        b=EYlQn71xEyU+Jk6NgAs58J2CycR/w3nTA+pjlr7T8BjNlBmSPNgu/iQFZYTm3qEZMJ
         GRU888FJJFod9tf9Ks+Qzvc0FHY149NZwf0uS3+mgBGpCxFtIASv3HXzX4+kQVGj74D3
         rQs7m4f0DlTvHrMBXGxfrTb1uUUojKY0/FhjUn+fwy2swbytEDfoHF8G7p3/HEpj1JYa
         2uzg3+m7wtLPNKfq1AkT2Lxt3or7bAmB8Y1YdgnIAQlEavm3BvcWy/6vntsz8Szkeaae
         F1WcQBp2jsVn3OSJLMVcYbrv/4l/bdJ8Eff4wCO5jSkniQ5htVkd09Vn+vPAcUJGBo1L
         aIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154667; x=1764759467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+aV97bb+2uBMzq9jHPPNimq5cmAOBpE8XZ5NB2YnSTE=;
        b=hgI8CdMWoNrEfMxAjhDI9h/TM0ky8RYgvfNQFO4onolr17TjELgNwkwV3LndKUhZKx
         fMvNL7n6rRwt8onK6zNvkRDpaTDlRawb6xPaIngF4Vacb9/OImloHJeXQ9Q4+gAxGZhc
         UqA8xkbvwX2OOyEUYdZL+uLQW5yFMScFQxnMeRBrMyDlxJmcVfeKKN0hw8vYdAl8HxMM
         3/bBM65Fz8LSJxdqR40nxzadQixSPuLnoasJZuWMalkmys+UVEhogRymPGRjlLFygNhX
         nMhV5Q8RAxECGZ+BT9gfQo5/VrQ324THhujPhJpJpTYcgoW2lloI+RVPrtEWXtmGtaCk
         piQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMwUGxsCvPm0u3suJeHw4mt1g7TAIOv4rZYq3yu+Z+27PJvk39H1l/zGVJrcCbXsh1a3Nhdo72P9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUnDJUF/kNfi3HtOnbxxq7aCBzTILXLDbjcQIGd6ZnB63Su2B
	tx+/czfpZHLdpBA37siv+07c34lYiRjehVy/E1b78k3/otod6unGTzlbhaIicxPb/pY=
X-Gm-Gg: ASbGncskYiFcpbSLRNExJDEupsSOge9iZAitiwKSGYjGtD0BQ+aS0TviCKYI2mkw+Zw
	VUHxux8QgynVFyYT9WYCG3UobSxlyubo/FkVRJH0HxoD4aJNIx7UV7K8d9ikF2g8rhSxinSQfae
	LWVpjr121mG1otZaTqdTWknmiNkHWqwYBQpuOKd6EqaAbsoQJpBRraDt/GWXCtwg/lIXjMIIns9
	TQ37kbMUXyYFKbZsRV1SEbeC4Rt30DQuVcpRtAFPgzSHHkpXub2R/ZwjodayDlcTbSffiSi8w5o
	sZk6p/7Cccgv4/RFDWHwBGXX9TMLdXlLrrr2vsD0Z5tgJ8DfGkKt9xItI8IHaTF0XJC3igm6ze3
	utd6hmtXBM9zRFFiWLhVeJufOJjQH7iIQRsIeRx0KhctrjiT1wHB3dCaTDU+dhIwK8rC3GEVP+l
	XZFvvw0tAjY4uLTUCbVSs+dbOzTf2HlM8=
X-Google-Smtp-Source: AGHT+IHgGpVirZ77PpHdvUsmYCeB9BGpEg9syRMr1tRkkyQMuBNBfGSh/HLgcNOGSzBrV7ZuKkcwdA==
X-Received: by 2002:a05:600c:4e8e:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-477c0165bf3mr187105765e9.1.1764154667542;
        Wed, 26 Nov 2025 02:57:47 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:35 +0000
Subject: [PATCH v7 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-6-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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

