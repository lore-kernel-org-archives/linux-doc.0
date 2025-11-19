Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944F936C5B5
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569110; cv=none; b=WaxZwbOiuXN7Svg/oQUJRXN7rAHEhtQ8sXtNWkBtoVzgt1aRrtEMF3J6AcDzCPTCSHGR8n2Dwmz//71aWbBaTLoBxbpKz39SXU+AilJ2dYmPSBSdCfLGJH9Tau0c4ZVlb3Ib4aza4Y/O5JZ38dAJfML4hOEI1bBbuikI3aHvgDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569110; c=relaxed/simple;
	bh=N+Q6R1XCPpnjYjCPIVjDvoCYHZZK5o2FhEXZTAuBfSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJhZG7CEmyT4zXQ4ZiDAz/ymEWq+jE/ai5MTB6MhJwDDNlZ9zc4QLyprv/38TgQBO/7zVbHeyqWpb0h2hZrhJc43ah4iJ/lvt7FSIfwgj2VMxQLNYob9bSgoKSFqeBr9w+FwO3oQMQlJcRs4d8kA4Sg93/1e4r9QUfL1iqHITKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1c4pYum; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1c4pYum"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477632b0621so45824925e9.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569106; x=1764173906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=l1c4pYumW61zGl7kO6koiKP98jNxJkmDJa9MsOcKV7hii+iJIsZGH9HwDZysYHkUmo
         F/TFEVwxd8Vb8v5SK1i1cAcIcYHIrtqtGcHTwntQzlEfvMHWyrZzpB7BTnVTBGthzUj4
         zQll3nmPvl5v8PpWqzC/095l1CxJG7fiKdu6wkS8jtbZlUC3dqhWVK/PI5NlfFFqFJs4
         iIzvOdlG2EmUwRX4sulw3puWesLiqiXDTLeBhgjldpuUuruX8J7vIeQvfgw62wuwOpkh
         p/8bXONWQAJPu416ZvexOcZHHkEJjGwK9+Ab0d7Be5OXgrNvR+o2OOSmctgE+UgL9qv1
         PMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569106; x=1764173906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=KKDelnwTtoiFJ6J5XEUSlnoYVpzRwl2bXFERLOtR4Ea6FrfBkae7Q2G+4Pvhwx8i98
         dDsM7I7O9pa6O5pxcG1C68jCqa10sNFTJy/u59Ufl57Fasbn219rnEyfqB/KBkenBP5Y
         OyYf1A0NdOPGfKZ4TlDTjS4jOchtTQCDAAbtuERusDSN4KhApv2Lnww8JPHtOanFdSZJ
         0PxTuS8WrMHAZckTqBhY+99P0e7oghBZw6WBdSSYhrAl4GIhe5jDfcgfANO+IEWdEERJ
         4FnqfMrt/q4oMWi3NJdLFgLvT8KAGpFqns2s7kESD2iqLYOCOCOyp/+rEOIFSf7msg29
         +lsg==
X-Forwarded-Encrypted: i=1; AJvYcCVpHeLa8p+MraIH2xFaJNZfqoge6gqCy98Yc0oj7Bk/KfgMSemF1kA3fqlffYxknSdbnPHilkJfAmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw031EcVQzRpef0R4BRz+YY6aQ4KAFcnN2rkSSeKKcMQQEWJM0V
	u8w2dH/eUVnrbao4W3U0kwGbBh7r9o6i1Jd9q4W+Od2U/YpWNoy17u1uffjTYKZpscQ=
X-Gm-Gg: ASbGncs1JKe64pEP1Kb41wQt6oIKF5+BI1pOMwm5ngapmrHsKIHSM8wVE4aMrcscsaA
	azcNlbEDlKac5m2w7UaMyld3Obs6qetBOR/KHxyzxA9tWCEjrMCQeCnuPBTzVWZY8ROpQ+4twIH
	H0Emjee7+NLQMZ+nDRdje8rY/2EdtD7bPoFavvpcSRj302C7248WWDB5FtCg1x6EgUF/AM+L9k1
	HzbD6y5KZLOiKMen+LGWqy4p62HzM/tLdXNzJFQuVO/y66RZbUJRdyW59upWfOa0UosTfl8Xkke
	sqppEsUK0ZmPC3IHcoxwLs5N3CHaMU+EcedDq18ePlYmStWDhFw2Nwao2S9I3H/PRqaptGypavl
	w8zHFCAkWwza/R5zvucizKgu6ByreTzvRICIqFBLAVSiSZ+Ws2UTMcp/Rtr5NpZ8kxSdrkujsuY
	CTfWh4PpPjsC/PTTM4GQLo
X-Google-Smtp-Source: AGHT+IFq5cBVYvvZ+7oVK13tQ0GTA3nshqd52t9/fz8kEaZfjoRl+N1fTrpRLi6jbMCiDb9ubVJALg==
X-Received: by 2002:a05:600c:35d6:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-477ae3116a6mr51188885e9.13.1763569105548;
        Wed, 19 Nov 2025 08:18:25 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:25 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:03 +0000
Subject: [PATCH v6 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-7-740d24a29e51@linaro.org>
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

