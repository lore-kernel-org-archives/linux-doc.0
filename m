Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8027325727
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330953; cv=none; b=D2yO6Fp4umgLBioD1XtMj7zZD9wdC4ltRaTn9OF03m7zTuoy0WcxFQkou6fZ39twVAeWRc/7ndbUgyVtOEIUxoYLFXfDhXhtEQhtTILK6oYHx/1X/gyIV4/ybFGj1wIHitrm5ky0jPh0lkb/Xi7exB6ie9gLW7nbFMBhvk3ABhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330953; c=relaxed/simple;
	bh=8MjwGwyZJG/4xrBU+/i8v8phFqw+MhC9anj3o1bEvtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6RVev6kTMzIVPWEjIm+ZVysV1GHEO7NvDVEMyq7ZtH/IjRiElfJE6AVia44Lvm7nBW9Pt7g2dPrj5Zs8kQBtW8QtVHhLK074SNXjzTF67BV0rrQCQJIqq6lQUzpOa/wkxJaKSexr4lcALoKKBeONnPx/q8v4RvspuNhlpl9EPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cnlwitqi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cnlwitqi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477aa218f20so11095205e9.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330950; x=1764935750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvA8MNYHofPp6XXLABhPzCmRj6ePdkRSGVrEa8M8M3Q=;
        b=cnlwitqijWpdHLpkTSGPl00hGUlJpoe0Fh5leEai9uKMtml0a4d/Loz9IjQtjjNgjq
         /QX1OTdE10Ib2Dtxel63+ltDgBX8ZYCwQQS8R242CNSJ1r5VcLRolzNrjgAQ9b94gHk+
         avk3IRTthYy0wP/w1jLCgn1Up+OXuJCRySrVVPLOi92UFXiDsteRegJDJ7LSgPDrZ88y
         FEEP+2z/hk2XNuYTpkanJUQ+5VaF6b6RDrvfekmR1ZLQSm5/M0G0sbRWao9YqdHlvkwu
         7NikdPfslxO27XunG8dmB7ilJjjCdqjFWFabgb9b5ZExR5s+ZPWMHyZ4TlwRDRcEteAW
         i1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330950; x=1764935750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvA8MNYHofPp6XXLABhPzCmRj6ePdkRSGVrEa8M8M3Q=;
        b=Zw5djZyWbDokGC7RF3+oxYp3c3XGSsz+dtWttaS/ViVId1ZCMXANZwpVWEqXFFlZ49
         AXRGJDwxEmbw6I80vBidsAm/9uFYIFVzbMYqpmBxM5ZqUdwFg+1uRR3WOEPLAG9GjXn5
         85PXZ9B4qaZBUPouNb1agCpVeXlnFsvp4YzZmL2VvfJLHa3RnBhlFzKeeA9RaDlYE4zC
         1EQSZS0b2phuy5ikjmIHSI6LblbGziQTNtjVaBWXA+OToLlVUVgZVXjgiLfudmN33Qyp
         Al1L0mXh6V2N30MBgVBi1t4Be07e50CPhZwxpCNyqrYnOC/aUbBs0Jxa832xG6nhEZNl
         Hzbw==
X-Forwarded-Encrypted: i=1; AJvYcCWeFjqEX+ZmePxHuEQ3oKpaOO7u2po6cA8ILCS8DhV3K32X4HWbP2izVZo6YFLuZvUtE1vpBoajC4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9mj4QcFsPnm0m7Lh3gH70lKxOzI+cPQpyn8tdfd3hcRUJi9+
	C6JpkCabDR0JOGeVaZX1bkyhgaDKjpPFIJFqkV0ZxDy4FUKXz4eB+fCDgweHC20dRi4=
X-Gm-Gg: ASbGncv9Xn+ZJEy/wgiHIQiocEAs3mPDXwnzLUFh2L7a2yHRO5ws2RvJbciiEa30fTw
	vQKo/6CARlYRrG2yW6AekDnM7/0h2HpgPSvobTk44bigNo+4iTO/h70OHvW+f8W0ybk3/9/q+pM
	8AWHCA0+d3RhmUXuknn81IPsGnL9WRo/hhdikvsdIJSYk5q5SW6aOPb/3+GMJQyxiPtLqq93C6n
	IW6Bkik0PFjGj4jzD7f85k0e6uP1bJbgGMw0GTSroxyxLH0yDbnk4v8txlxtWsXie6fnsdyapgd
	5LsxPjKC1w4ygiVQasfh6i2yG10UwcVneuLBIA3m4CuL13e+T0qLH4OIsUQSU1Ij+nmT6TJs0xl
	C6qWIZQFgOH8R5lp5EYcyrUX5nnC3PF98PjHyQXRelFQGqWnC6XbLIitiAPkvWv/mNFLaz8zl3U
	9tnxzG1Axn3xGWfp3Dvp3i
X-Google-Smtp-Source: AGHT+IFHgNVxLUdCo2Jshe+DO7UYaUlnjeJ0Jmjfa9pCBwvoVJUKxBfVYSLZoxpQ0dDb0+0JspQmMw==
X-Received: by 2002:a05:600c:450b:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-477c01d736dmr243431065e9.28.1764330950053;
        Fri, 28 Nov 2025 03:55:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:13 +0000
Subject: [PATCH v8 01/13] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-1-4d319764cc58@linaro.org>
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

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 012c52fd1933..0287d19ce12e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -825,7 +825,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -833,6 +832,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1

