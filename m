Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3D24BCF5
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120617; cv=none; b=FFu8iIEk+lmfh4wK2QOKpeCrJpix/0N5KWHSkohISDtmDdOrCopSSLu+nFgKJPG8BNsR5L7GnSI7qPY7fNMIYgsvPwTb7561ihBcVqhN9492TrL5Mth+40/CtlGtcXQwyep9aiI727a+JNltggVjb1NrS4d+w/pqTD/54CVvQ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120617; c=relaxed/simple;
	bh=XeTbgg1YCZhnU/IzLKbCe1re6NeCWvfz3HX4Zc0ZwHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mMSZXB6VvYWfBR39fuIU3CKfgoL3RhQY41LULXNUUkDJdbx61ypF8fyALc94SB/UxWy4g4N/eFojge7Py3ipQrPiBQ5EOOPu6J+sXRy6XJOOgFXDDotEorKCs0f2pRpZMrMSSqbWHubvRRd/ELw1egp9WKCrb0o3UiI4JSbt+mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mt+YqD2W; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mt+YqD2W"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a3798794d3so617459f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120613; x=1749725413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=mt+YqD2W7wG3zPxuBuxmlZBTOSl4xgWdqw5Kx/7rWDH+AnU9+HyyMPNUGpUl5ei7Gc
         cHKEGuHJAAapWEdI38+s4wcA/84ZaneXxsepP11WYgHv1VSv0BofutwSAlQfZdYvPI35
         0GSLa9FJcbOrB1y01OaPruMYSlgul5SrQSmjdcwfC5wVPrpJLm3Nu/JIbq/pzIUQa9Y/
         712djwtbUi7OcYS/+NWM9vOWTCk+pFZP3BBhP0hZrHGxurpHBLFX+JZZEXzfWw6ZfeqR
         BYWi8UT1c5aeatFPgfwtLkfTVVJQw0f/JStBeRK9xa19RavK/H0MZWsp14e03g1n5tCY
         gPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120613; x=1749725413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=FYsiJ6aieOviqDgZ0+3vh3SAgjl7F3iTUIkp+E6eMPbmtu3ptWs0kwmjaOeDjIi9mn
         I9FxI7Y4n5dS/XSYFaihFA/2Cmhs64nPlpBc5SjUMHmhCgtB3ANXri6v3o3wfS3qxvm5
         cQik89d03tnyQunFNTYbSJf1zDa5NqmcmsSyaq6hL2ZzKSAtFplt9qRCL8z6mQJhFGjA
         5O3x8sBDXvES/dH0IP2N8Bf+UVmYX3LPrDTEPS97HaEPcf+VsvYP+jD9fWXf/KGwQHpA
         ThqZNRdtNe+X9Gp0vUxj+qIA2ItMfv8hbsCrw1mwPVwdZqdXLC33XViu4RGNeCywJguM
         rdHw==
X-Forwarded-Encrypted: i=1; AJvYcCWKcUtdiLqNpWucRgWheukcICJpkZBbCMH9RraSqg8+eB9IHEHAoqU16nhuQggu+Q9UkfLbXYZFsZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbAwvEizalEVFtD6hzYl0vNySaB8UuveUBOfQmPOOPV/OlVjsB
	FJ9dCSwbCHlN2n1x29+5A+dBeWR8bPBqT0wl7tl5QE1FQEEYOF/wvdYiu45WfeTETzw=
X-Gm-Gg: ASbGnct3RlJq3vK7R7/f6tkm9kHaqXDCa7JS5wBZUnLjd3bY0M2EI4LWgz/J4B76my3
	k17xsCj2Y+coTeFDIrsNob9Ww2ergBl9PKGrPCf6utSfQSiTR3PzVvzvd2uGp+Lhm+rtHvhoWyD
	a1hvCgCzy4HOLwZoDx7InTxdhgW/LQ56VXit7jT6JGfiplQmYh0nlY2YeCaOJY/AObZGpGifOZj
	yrSLkyo/9QDbYk2mRfCGIdyS5h3w/uc7Yg9GR7rW06QeeQuqnk/U/ND+NV6iTUXxhYp4NvG5Dox
	Nu3p2M7+MEF1sQ/cu2Gtb2Yd1UBzZuad1xKwRNrvZoegbiFDPKa8/IwWcrUKz/7/oELrutA=
X-Google-Smtp-Source: AGHT+IH02Sm8uYqylsDIHsGX3ZEWWx30EqeNhSMG+4n8yfcZZZ5mpZsxJSCawBIvfoWGFHbxRM6qAw==
X-Received: by 2002:adf:e38c:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a52670e28dmr2309297f8f.32.1749120613386;
        Thu, 05 Jun 2025 03:50:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:06 +0100
Subject: [PATCH v3 08/10] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-8-71b0c9f98093@linaro.org>
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

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
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

