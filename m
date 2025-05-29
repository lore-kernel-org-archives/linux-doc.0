Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2021228FA8E
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518402; cv=none; b=sx0zspWwwJe3rT2TF+yp5o/3LVP3iBXl72D2P4uLZpKOwCSFDiv9BGOUA3pQORIgBw28wOr2R1Un4ni3A6sCQUUs6xK+Ibwy44RGFAHH8xfdqeQrKHndEm/K5HScZcTXeZFZK1T7wymR2CPVKyQPDYLGrwyap32lz8pGbgY6ZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518402; c=relaxed/simple;
	bh=zvP1e+1MWcLi6dFHbap1BiJEf/Gwy+p9o8HThmnNJIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fACNnXH3/JMiUWh8xAw6R8b40kBNMLWrdXo50dO82b6U9wk5SZJa3REZ1bR54fzy/J7Pp/jPZIztj357EwSw89yQ+s/5qa1OcVmiqB+8W/eVq1HzSFFGuxc/BtpfBOvErdwQy6BCMcJGPyJLIFBA/u0SGbMHgQ5OO+Xt/VJNEk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wvVgcuA+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wvVgcuA+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe574976so6794885e9.1
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518398; x=1749123198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q5mn8xtPi9u9sDm1H7ybxkZxNw4efqIccO1SNVExHM=;
        b=wvVgcuA+BdOAbJAq1FcDO4QE/WkBblcRUu7/mKb7FXqpc+zkCbUIoIAJEuRInY7FNc
         W5yI80pnk5kNbqos8HgaA/+U8wX4bEfDK8ttvmvABPINcOxOgOsedQuZkxxjNKUWuLmA
         AIDn3Ogi1YBNIN1I8YIYp2FaBPYwQeSFqamM2dG31ExILT2upE7hY9nKlz3yep8T8I2m
         Zp45j1wJ8ZfgvVeTP8nA9UfRPx0NHEe7r5N0dvh5aSOi5iDybU1QKbPBom08WGfZicV3
         Raw2RF5x5w6NSJbM1ynY2NI00V0A1wJzx3XQm0suw18zdW/x38F8z7CvRdfU4HcIMcu1
         BCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518398; x=1749123198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Q5mn8xtPi9u9sDm1H7ybxkZxNw4efqIccO1SNVExHM=;
        b=GqmKHnx/XeP2syPie01o3kM2BrrU7gu+gFF6V8VCFPstBwNKq5lTaK3g11m3hkzSBP
         6OxexXE6SWDdRw8nKsDwCXPxOcdyyWxR1hfzKP+bFtGiCzQq5BM5DgJxWViodYcxz/M+
         s4llHE/E6RzVjkVROqewl2JX2fksA8wDraYOEv9sgEX0t6NKjZWN/nWuofjaitmWVohv
         Bzq09UZ3YCC+0V755m+ztH2RCSAUuYIpa2igi5bHrj8QFxdNcK6SFo17cMAIrdCui1RT
         7jk2TeAJZt3F7uLoO8oA0WZeO4ftsBGwwhEq2phVIjBLfB0r4Ba5VVlhCuGTh4+cMx4B
         VXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1JmqFMjWjy8zjLL9xRdM4cyGfDY1XCXm3DxOJWRC4sucFikIoJLovQ5XJ32oowX7i6skhICMZpkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLt+RhwoBR2cDSHwoPABNKs1ZtnPgKr/v+Ea6V7KeO+7vRF2Ix
	PrDKptIbbCHDP7/HDDH/aTMhapUl0SGNVPfzQeQdkQVYVODysVFsnet5UUnC0OxyZtM=
X-Gm-Gg: ASbGncvbz8BOQf3D/Jn2msiR0UAR2X1o3KqiLzm+hsryEXfRevowIuxL4ydfKYrieFg
	a2amXXAcaRHU/Hd/0MeRrV7CKYCd32KmscTT27TnafwLcddRHZIS5oIlMowW6w/jAYOgIpPt/aT
	jLfPvRDOBVNrXA+KZ+yIT2ntNlMLnNhgwRTEqWCRuKwE1aI91bY7XAZdFMkR6T0wXzNYgd9eSjv
	PmqXYSQjHz4eQ+nkBy61Vc99vo27O0g7G/YIxxxX/WxcYiHl7n+EUeSRC9B2Fu3NdQ4ElOLQH6F
	ipDf7ma4Lb7hWqOEgk0ZcFsBqmC4U46/cXQz7ZJUAn7W2Qahzk+j6sK1kdKPMBUfLjSdtOg=
X-Google-Smtp-Source: AGHT+IFacLMgy8Sgufz8crND9drSgOY6qRlCAWckmK5shHNZ9zSnAptuNxdT/H2WMCBvDy1/kfCobg==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4506b541d07mr59510265e9.0.1748518398270;
        Thu, 29 May 2025 04:33:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:28 +0100
Subject: [PATCH v2 07/11] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-7-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
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

