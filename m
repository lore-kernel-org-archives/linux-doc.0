Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F01339A4
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960953; cv=none; b=cd1Iok1+6QpukkTU0j56IW7T+9d6l6vnpE+paIWbU3DMhj4svC5Nl2Vlrfv6nk7H6ZiCJeIOqNOSE+qccHjr36yxg6mZ8Es/2gsWINu7TmO5VCQlmJ9XVbFEJ6/il4vT715wU8lxX7ZiiXjWeu+HL9+0hmK2tT8QM78JSj945aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960953; c=relaxed/simple;
	bh=thGvUXe9EBJVjRo9zSLEvcWrnhmXPs68T9d9mh3yfxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scAKMbjF6tmzxyYnyLELdFpyO5ls9eoCE7pUuYrNUuYScIFe/dNjEjHjuHitOELCILXrJiqr/BGs7Q+nWbV2EUcxx082+IxkS/zXM//AH08RbIAYvpyVLjVyjc9QK7uvBHC8B5M2AIrVPv5qwSeZ8dNuT5YQPYkBAdAJOD8HBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERh989SS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERh989SS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so845346f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960950; x=1763565750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHWft60bOhabLyvWPLsf9Lg98jcEqwRduNX+1kYsZ4Q=;
        b=ERh989SS0br/fLIqkyHtsKNvataLKMoqtsnbjeTsyTnpy5msOD5FNbUbvzqGqOY86u
         bN3uUNghcKjSbjo+tQ3jP9FylEl4anURf8H+LC7WwA4gYg+l3awUDWFyB6oXEuTGwk6V
         KarkE3KtNuX6L+PSICn01ITNoXoHKRAMTD+ULzJDClnvX0RRPcbOAZitvdOICpmrRr1k
         jNgu2JPKloBNxZwZSPhviZIodK7NhQkZ7KL1Zv3pPabaknlv+pojfECb+NwxA4hn1FT+
         Wolpci1c5XMDvNj2BNR7IDnWGK2qm1Ejq9B/zah9yiuBzHl4MCKbS/awPE/i4PkZmjJx
         CMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960950; x=1763565750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHWft60bOhabLyvWPLsf9Lg98jcEqwRduNX+1kYsZ4Q=;
        b=qnK/rihxlup9yIp1O6M2o+l2lZ2VlnEJqoWfBE8UclAplR74UOfz2n6ylk5zWp86+L
         EIahnIC4lAEc1Ji1Cz5p7PLxao796B7q9Mwt8NYZDN7JOAOkDHGERkUYYLUUVyoeeZL4
         CTddRLq8bH9FTlmzb+J7QsZpzHICfO8bSoZ91zaZsB9qBuc/X2ihSMx5Wz4fCJEsR/bl
         4G0saPm8Y6FDp5L4P0cawcNDfUURhDitdDxPn0yKSA3M0Ac+9T5EkaVch2Dd9oMJ2XZB
         OtZTfIwgUTPVJTIRDCRSOYq1dwwAS0n3BmWbUlvr+PnMWLYmIev423SNCgjjJ1PeAKkt
         2FDw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ezx+lZOAaBGbd6V9SJwW0xgJSm82fCq5+jPcwNgfawL/ltkAvble2TOAtQXsf2vaRpPjQatBKMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQmgCFl3gbMkBpX6Fyk6Q07MLLlEp0JkFyC4E18JT8uUtIASIu
	A9dQNRRzfT1G31CY4wXBBBIJXw/RpfWP3wrV4u/BBsAaRvWT8u67kvz26KQ+O0MjVT8=
X-Gm-Gg: ASbGnctR+V150MxmJbXs3LMr+eRGLiiqQYZxPvsgr8dlUXzl06/vjARQPgEXJTb7Lis
	dBNQhPVH8tsLHrVwiCg8dYxoR0Dyb2g7euiwVtVec2VFxHFmv4m9JqZAyBTYdR9DgV51jXjBSRi
	KMg0ZxbihSdF+tZqrfz1AdYBYE+EhI8H+FUW+36IHOsb0EFVqNtL8xpgYUONlYR40btZ7wJTH7n
	D6tcPt8cALSEDy4Won39LoDI6E5NSQJJ5cxVKJ/OR92+jT7C+zSky3KfnKTZwePSEkNJELzk1nP
	AWESxrJFHrat9m7kLTuqNOqcifQvJfvgAoR5dP1O+MtaeiZQPlkxjRvXfoCl8zMjQI6LUHtVkAy
	zc3qQrY6dsyBrlnBEgz7Q0o8xD9S2TIyb2WNtfSd0ivAA4XiAoyWgmhM++1mlFNol6c+ZHXdZ35
	s/kEQebGNvUA==
X-Google-Smtp-Source: AGHT+IH52DNTLBb7al5zttlsVEiexafiX+OCjlQQr0fildUN7BN1eWHybUmsF+e2JGT9znBkdM3Dzw==
X-Received: by 2002:a05:6000:3106:b0:42b:3ab7:b8a8 with SMTP id ffacd0b85a97d-42b4bb91763mr3253408f8f.17.1762960950054;
        Wed, 12 Nov 2025 07:22:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:07 +0000
Subject: [PATCH v4 01/13] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-1-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 8d4a1f0f1e52..56a359184c6f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -826,7 +826,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -834,6 +833,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1

