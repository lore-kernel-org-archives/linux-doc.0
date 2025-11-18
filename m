Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDB3A1CEB
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483303; cv=none; b=h5g34JiZBda2wzcszKCjm9vP9KRcsPF3mn4RgBnxPHXJLoaMsGgQigfbS22IPQ5Milm/Us702NdebfRIdJ2P9GaC0FgvoUdL5s0qnfaQGHXrMLOA1R4rNoy5dx5gjMtws3HVRw7hNuv4U/28CIQ2E0jK55O3M+QH+3bv2wNlDuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483303; c=relaxed/simple;
	bh=N+Q6R1XCPpnjYjCPIVjDvoCYHZZK5o2FhEXZTAuBfSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wy6GUajnF7KFW0A6IbW61gHVZCsKfw6lSuYiMFc+rxpe74ztNrpcOXBPKptzSnrrWlp7PRsKxv0YByAVu7rEqb2hapyhsTW9/YuVnW+W7GD1yck/wlm2IO+Wiv/veVjGGCiHrWdJzvMV49MSKdixnuG1pj6dTDdE7CdrgcOf0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkR4k6Df; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkR4k6Df"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219db05so17598245e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483300; x=1764088100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=DkR4k6DfQXEX41hXJ+VFjkJgiwaGWgeb4zcRDr+BaXJl4y5e2WeVgzRqpG41cTKgZj
         Ei4HX0Gg9iyLLfhsxBXHbkMC0weWxDYn8NALvZIDmlAzMe0AO1vipxzhJPXzoxaEKJFt
         r6XBipsFcsepkGSyznV4rDRHZFqnijjRJAkL7MUR+LPHzUxgwrgHYtJs31wfDbLMdIbI
         FwoXpcAp3L2LHdvwS4yTMKpylYorpuga+okLTeDiBOK0nS+sJ0retiYWocgHKtU0nkeV
         S08P+Y0KFd4UAzHmp/Rp4OPwnbvxXTiGL8WU1ATxOJkOQLsyx+tQkBlhGYaaCyY8pr9L
         JCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483300; x=1764088100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=QNaEAPvH4tvVwNWK7l8yKiIr6p+osrC/a5vfIWnzbOPlMomBCGOsgStBNC40mQhmbk
         4rT4bS8e4/2mVfZpQS3xgJ/5iRNFl79LBAqIIrn71u7NgzwBDAFH3Zp2nBAWBAyvx3kf
         +DYrxbjWw6BSj3PdtO+4VdTRsz8c+oBdMIgJ6/M0gp9T9Zeej4S9VeKn9QXmhQfownGE
         MkTOkxgWTNe8DYhXC1QqvbJS2riClYR+k959nRpDBVxgfdEcjxGGc3oi8T7408szM95I
         DGd6ab7OvbNU9rodqARviRy0WR2QfDARvp7NKSFgFg1h+xX1cR1sSaUGL5GVMtxzaPL2
         gl/A==
X-Forwarded-Encrypted: i=1; AJvYcCV8VGhQKrmQzsBBPRNlm0xW23NhVbtatQO2gHrNxc6IVWwz4SJkbhXZsR0v0oxNSwgsLoqXGi41iyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7DAJLUgW4ObxvFqT5yC1Hcxx5U7oP61y+wQLtPIblpCbW3BF
	Zg4mnNW7skxoVO++XxW7WTCmIm591T69Na+LzKz7V8sNL5VapW44YAsiaMnh2khTJNo=
X-Gm-Gg: ASbGncuKZdmUzetRPhhQTR2VO+tc978feMXmpc64G3iCYzxGFX7qFR8naPZlxGtMZpL
	lcs4a4u7exm2HUhdHhbA12aybnT/jJRFMzog/etahpnkhnNZh+HEhXH28EXp8Yb6xjlKlk9mI75
	PdpdtidtxrwopNou5Cyt9xw2iNGf6oydrgjMwSUc886/PKVKM+zdYpPzkV/MUAnd2buEGN8sjYC
	8eJyfAMePPCWBTmOTmDYucjGhu6Y1qSV6oH8vG3fXMsxIBlM64d/WwkEXSDIYm1o0k4Ot+dhoxL
	ycg/FVWOQnh1Xnari+Xa+1PMlISlRl+iklYuyqkaJd1l6hjF3wRA1vLfqJLu/e9svKJhRI4NwwP
	I16T6EPYiuHoaQlKEnibXvd63xvCv6VSfTU22KS9MQWUfglLD7Em6R+r+TeiBBTLWG8PO/7nPzb
	dpwPfmSkbowaIac2bDZF67
X-Google-Smtp-Source: AGHT+IGvkVieQt1G4+tUhXjqKDIAxEgYuGjCa+t00ADvjlhFJ4APSPCkFPkbv/kD5N1u2T3cDsB68w==
X-Received: by 2002:a05:600c:a49:b0:475:e007:baf1 with SMTP id 5b1f17b1804b1-4778feadb6dmr146870515e9.34.1763483299512;
        Tue, 18 Nov 2025 08:28:19 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:57 +0000
Subject: [PATCH v5 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-7-82efd7b1a751@linaro.org>
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

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 4511fc2f8d72..584d653eda81 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (config->mode)
 		etm_config_trace_mode(config);
 
-	/*
-	 * At this time only cycle accurate, return stack  and timestamp
-	 * options are available.
-	 */
-	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
-		return -EINVAL;
-
 	config->ctrl = 0;
 
 	if (ATTR_CFG_GET_FLD(attr, cycacc))

-- 
2.34.1

