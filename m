Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5828E17
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120615; cv=none; b=AgWPA7yFTaGZdfiFJsVhNEnPUZiQmwCFOxRCJy7hA2fzNsTTWm3g0JM+tQ5JzbuXO9mhv+lnYpSCiTWW/n/i73sG/507Yy/LHgnMcQkIrpq4z0rboPrSCJb/zAASxP9O/LEtKAx80k4tVkjJZtUR/NtJxEEsVP4flQ2eDxawauA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120615; c=relaxed/simple;
	bh=luIKfiwgtXeAFEj50ve3W9I2lyEw3hMNW0iXhyMCu40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXQHzHjNOfjKxVZgfdAaDlMaZgCb4k/kvAvmgr8wJgj95L7AjJdJBriYemNNjO/HDPQxTBQ4SHVY14sXn1qIjPhdROLvZiSeTjPkK3LKcT0LrsP+Kc/xu5Wa5MEaEetGMxZMfw9s5xR+HLVJKAz1LeDGkePZZfPaocVLrCmR9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bm1uz5sT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bm1uz5sT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9785525e9.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 03:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120611; x=1749725411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=bm1uz5sTq5EtoddzpljyGMCVBbC8YHEXXfgxedMh6EoEUnpmCJY52Tvch0iBi7H2kD
         Th5876eqIO8iv6P+uYzhV4wZXF2f3wUDBqXXE8ExzkA4U2PUo1nUfukEsOTS4whH3khD
         wCx9XSoMrV074tRvOwjNgREfbDYPehTCRnD8Nu65gSOmHq3kyLjlmI+zcC+6KPq03ZZG
         4UZj+DmtO7y7YjWKxdhetq4IwTVUBtfdWk1ZMHNyedeoPR1MhiVFdfYPmESBNJQJmfFl
         BEGleil1/7EaXr867vVzgKO1xOPdf+qZr1+lmE/BHBLl4CPyNSvOGtUUx+YOdhJZoPVU
         DVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120611; x=1749725411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=LEGnpyGu8mG4O9ah2aP/lPsjeqiuk1jp9gw7SQj3H3EehjD0fDzGQGrOokNOLkea98
         w+w7GzZg2PbP/Qbh4I+tHRLO1uBA6KsScxoNCxUoHrpfg1eJSo17v1jkdJWyRN0z+P6l
         r6uWaCjcixw9XG3868VWp4+ZVIzYcUk8tFBKUg0dchLnmc4TVIfGGb1/Ofcc9ZR0rwrP
         O3s54J9qnbPnOoz54B8dvKCGKtDJi/yteSpqT9tk4VHvaCp1Z3J+Th9lzZHRTR+2Pl3I
         rsHRW4nEEgWgysAMAgDImtJI6xFiFbA/kPwQHCEw/KfqBbgOQDQbkqs0wLZwvEgy1F3Z
         kbFA==
X-Forwarded-Encrypted: i=1; AJvYcCW48QzGuX/GjeS8v4TmBaI+8RjLQqP6KcMvELFwzVuS4JnP2x1p55YXSA/lhfg3JvKBLZS8h8uGr5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRMAaixFHC+Pgf+5Dkjfo0wZ/fHKlsiCbP8DQ3n7JRE6SbiLf
	qtkaBJaKqi6sudAsCZzt/WxBsabcH3vhzDshGjWkOjUUCh8Q4rE4Xeznt03LNSHcL7A=
X-Gm-Gg: ASbGncv5MeJcrFR4lJ/3RORUSc4ddoZ0qJrlhA4GQRPKc18yKX9wq++Jgcxs3BtwRd3
	+FmkoYS0g7Dg92iodToscM1PMDnEO9KsYq/GWvOkUf13o+PUHcpySp+PeYAnvYROENJly0ISUQP
	2WeKi3wYFqziiyCM9ehZGeir9zwGoHySbvgkYiK/lCcb4xjpOaTQx7jgEegHPZnHGOInqYPrOjy
	c5Zt38O549omwbkQ0FnYU2InVtF53T5aB6t+I3cF3IE4KTR0ZclzH8Og8UnTV2TGLLOJRcTAZZm
	HHsAO4F9uNrd0NVz1otQLHGu9i9pvNzqWlGmAgEpsQRV84W96BCzSaZaT955
X-Google-Smtp-Source: AGHT+IGgu16RRFx+Y09hUhjKjxwfPfRayhA9cKQUsDuzGVsP3y8rnAFwlUH2ULqYWuFyxL3gPk8m4w==
X-Received: by 2002:a05:6000:2389:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3a51d91f899mr5503049f8f.17.1749120610702;
        Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:04 +0100
Subject: [PATCH v3 06/10] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1

