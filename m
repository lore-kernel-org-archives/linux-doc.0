Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23795366576
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569112; cv=none; b=IWiX0YDFrL5hD3V5Iydy5wWU49x6PpL6TatoLiGw8r9449UelnO5GEWpZ+vlBA6q7Xusuyq2l2a+LK/9d3Qpda18qy27ITHPZhS3dKfnA7zyFneG4r6S9S92OQwx8YbtudMTaQoFqrDOnjj/ZCk8n0Q4Vc1DVD/P0GtQtiyx6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569112; c=relaxed/simple;
	bh=49yHZcfRU3JYbttPDuMZA+rvwSlgiEO1pFhN/mGFnMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvLk7AmM4eyYmBJYCk4OUJfK+wQCwBwR6VoB9CYlZW7tSmLDYTKW1UTue+7GlFdWXvyBStVbGP8SdNk6AoT/SE080EaqHKK9xa6Ub/ozuZdIStfIISn6IMGWEI/+vXqcv66sZaEKU67VO3pWs9kXcf8j0hBAhXrNi2d6voqkfpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HRGYGvHw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HRGYGvHw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477aa218f20so14039735e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569108; x=1764173908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=HRGYGvHwIzY3Fy90rYtIFC2shayURTElMCmOzPKj2VU4sV5HD8TybwW1Y/KGTTS83k
         ztS5dOJL0FNgZm6EaAmLO9213XYYwWQPL2vG5sutRtL+8FNaM1qh4WVuO8Yq7DG0Hste
         WCy4BrsIZq+AMDVniyhs4R5nxedxMRfkhmPgMKArQ7+d0hlx++uQEdGf/SmNLx0QeTP8
         ADeQZmCWcFIb7W5qUCmxL9nlOlsee1lROVjreGp2iUBjoIOAx6xCfz71zDt6kSht/FIj
         ptE4EVMxfnixafEOB0pNuxuswO89Y/jaV053WyQgydivh9KQQK+TTY/ziZ3bcwXUOVO9
         iwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569108; x=1764173908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=onb/HpF7GO6QS++GlZw4hEgYNSbL8G42XYZ1FT0gHQ1rRbwwCMjZeTkO69KYo2gA1c
         F4GSn/Ai/gOzVxMcK5ZlQc6cfyRyKuIDlu2YgeMP2AFHBvso/7HrVUexJNZlLhiXN1E1
         qHgOdxi7TVGoQ9AWW0ReprP/KmWccu/XM16uSb1UnDgZbBN72+qhdjfrp5BT8Ma1VH4U
         WIbERjzEJytWFfzhH87wOBC4OF1Qjv6tOEzsUWMC3F2vTMYEQrjqcW9xVsWwBIFjsYdW
         15dxDXGWbntQqvX+ZMZnuSnh3SVP63iJ+BnwsTcab02lacXFbwS+fPpiP6Z9LRbXYstA
         /gqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1RCJWLgTf2scyP4MYwK4kmijh+bDVxQ22pz1R/4VQWZML4WeKElLccu6+SGK09QpCsOjdGqXXeqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoss589Buzzf4Vx1cR2R35jQPtgdYnDDjZGyMnM8mRsmykM3B8
	ne7l3X/ZzUAqvBbHs4T4UmlSO3ToJVek+ZArBaDKIZAhGl+moMERdqCF9qob0azhpZs=
X-Gm-Gg: ASbGnctsF0GiOZBcAfp66Clo5uD5hJMIrqNZpT6RiRFv6p7euCd8f/5Ct1rpa3e4Xo+
	Qb4oLm4KY6xC/IyUaz1ZpmrSXEkwBG2/9v5hx7yBipZH26JNtbTLqPMTGv5qbfk2wUeE0Tbskid
	HXk0VwExVl1cmv3u7ec+RPbbliiCDxfMcXwBRdHgSCpNim/CVaut1Yky2SXWDXkjpLTNHHgnklB
	07aYNaWvbwZ0yGQmlOD/D6NEHDh6PI/QVmjiS8/lIpY7nTRlJsRh0fxsWzp+Ve7g0+WFSpqftir
	df+cukrGxBUdN76XkdPQGfd+HPdws89rIIcM7Vg8/GADnKFXLwleJHs8vSBEvWiM6lEmWPdYu/f
	xzcN6rPlhKYSVqJR1w3MbUHwd2kEFqasDjKzRXde+CGCV/+B4S7HgWhF6a9ClTqYeoZkuw/LZiQ
	RxY4xw93EpH4K+CN7x2gSjWYZyyIeB+24=
X-Google-Smtp-Source: AGHT+IFsnnLdq4HmiJTipQU11eFgkr91zE4cIVpOobeHeqJ1i8hpmzg559qdmMNA7bAMZf8QSN84zA==
X-Received: by 2002:a05:600c:1caa:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-4778fe0694amr230601115e9.0.1763569108491;
        Wed, 19 Nov 2025 08:18:28 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:06 +0000
Subject: [PATCH v6 10/13] coresight: Remove misleading definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-10-740d24a29e51@linaro.org>
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

ETM_OPT_* definitions duplicate the PMU format attributes that have
always been published in sysfs. Hardcoding them here makes it misleading
as to what the 'real' PMU API is and prevents attributes from being
rearranged in the future.

ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
which is not the responsibility of the kernel to do and doesn't scale to
other registers or versions of ETM. It's not an actual software ABI/API
and these definitions here mislead that it is.

Any tools using the first ones would be broken anyway as they won't work
when attributes are moved, so removing them is the right thing to do and
will prompt a fix. Tools using the second ones can trivially redefine
them locally.

Perf also has its own copy of the headers so both of these things can be
fixed up at a later date.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/linux/coresight-pmu.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index 89b0ac0014b0..2e179abe472a 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -21,30 +21,6 @@
  */
 #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
 
-/*
- * Below are the definition of bit offsets for perf option, and works as
- * arbitrary values for all ETM versions.
- *
- * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
- * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
- * directly use below macros as config bits.
- */
-#define ETM_OPT_BRANCH_BROADCAST 8
-#define ETM_OPT_CYCACC		12
-#define ETM_OPT_CTXTID		14
-#define ETM_OPT_CTXTID2		15
-#define ETM_OPT_TS		28
-#define ETM_OPT_RETSTK		29
-
-/* ETMv4 CONFIGR programming bits for the ETM OPTs */
-#define ETM4_CFG_BIT_BB         3
-#define ETM4_CFG_BIT_CYCACC	4
-#define ETM4_CFG_BIT_CTXTID	6
-#define ETM4_CFG_BIT_VMID	7
-#define ETM4_CFG_BIT_TS		11
-#define ETM4_CFG_BIT_RETSTK	12
-#define ETM4_CFG_BIT_VMID_OPT	15
-
 /*
  * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
  * Used to associate a CPU with the CoreSight Trace ID.

-- 
2.34.1

