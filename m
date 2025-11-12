Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448B342523
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960964; cv=none; b=j2pFqQ755YlqtbVotWBA8mE+SyfNuqLEzFhRgwhoCeBl4aEm7AWPqp5eKio/0X+W0Fg5Nm87wbC7jDLqPe5BxHt4ErZ1ysWVJ1fa1V2Bb41W/W3ifgR+Ekl2yx7mGIWSCDzJY/s78NWLQ/l9y1xhGNg2w/Ok+jM563XpjWuDOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960964; c=relaxed/simple;
	bh=UjTGmax723De5eoOdMzd7P6vXMUjHRdJqKjlLjKreAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJAX+qr7QC6fXcPygAFH2+A5tPXxOaJqQEo7bHUF/qK8CIsR4HMtVjGJEI4dRI0csB02emXACtFStYrdXTQa6D3b0Ta5ljeJh5pkuKBICPE+VNUHtpnYFUHjoiOPqT4l52DtYB97yhXqwP+QWB8Jm+NYe9+GtL+DZZ3zUxyMU6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GOSAZo8L; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOSAZo8L"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b2dc17965so906469f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960960; x=1763565760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsbUilQ/qm8vmmBkUOmxmlvBhtXtwp/NWlCF2+8uaAM=;
        b=GOSAZo8LN8sF686FTc8musfn+SfJjIKzsHoWl81iugw3UYt7u+kS1YeOB6URfeRNqT
         L/ExyhUNneubqwF6eOLJAIo6mBr4C/wppKi2SJJK7uNank5q+IHoDA5M500PyDdc6stw
         pzDky+vX+/Vv2Pwv7K99sFG7+nB70IgswV8hwxoEp73AMMpGC4N1kEAMyWsDpOmMzaHA
         bKh/OMGjkKsw5EL2DG+0H3ZQkzKZpCK4/CF3PN5orqMYjlqjz3FkyhBQrCEuUkZp9xHx
         P+j8pF0UR9ymk7OOxcleDzWSsFy31y2VFoXOAe9mmTGAJGGPnVzg+54DqRpO9uvfdit0
         iRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960960; x=1763565760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsbUilQ/qm8vmmBkUOmxmlvBhtXtwp/NWlCF2+8uaAM=;
        b=r9nl4c9mtjhUTy0Wv2JKYl20m940gjpYqJRlNgJuy0U4+vIqy77be6DRmQZZDBb9pZ
         lrpvCWKm69EezKSHtJLkrTf0Q1tM5pvGyqPbFeLt1763ySlKel0HOv+92uCfIHPOizLg
         S2e1iZ5/FkKvVT9xshrWAKhaTNXLmv4UiZxenqSxSo4wxucW8Knabcug1V7T4CYgxHJ9
         8KZgMzbJo5NUKAF/UTvUk8J8UE+PRh4OxNRlyiNf2dtT87/R9wU95f9nADUBEap92JvB
         7fTR5Lik/HfCkRVAkK6VEBiFgMsCwSsn4RIL2nIJrEOdZbzqXd7zuOGSFfWenwEbZCmz
         FyAg==
X-Forwarded-Encrypted: i=1; AJvYcCVg56xg4r8RES975n0l14OWMh21X+WuWAm9Oy3yf+bskmf5ZQGdH0ULK0v9AVVJQOWyYSVdnbuzIKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpO5nSqIoZIFB/zoBY0tjgtoL9oe0cbTjK3uVH7M1KRCoORWd
	od6ukbaCQGMqIS2ne5Zz3Nm1nUqqKpRWCOINMgSV+c68hztAmiQnhUFAOAcpMw89K3U=
X-Gm-Gg: ASbGnctgdeScGNyvEPRMT8ypLxOHt3rYbIPmB6sF8v43qV/7hPbA5R6kk1ZnxIkcswW
	4jQdqqEJfgjfd92VE/HAr7IGhIB5BosFlmszk7vBCZnb6beKLUoCrGMAUUwygnYDEKKpm1gy8YK
	Wzu1PGcCy34uf4HqwvExMLiMNSjShT8mNm3/znE1hxGmzwMu3kN3qphW5UERUv626fYsT4BlvMp
	ahuDi/9/nEdG1Pffh9wVFLd64JywJ+sjsLCvBVUQB2HeVxNDg0TGNzZZCT9pOjIIGTgBcXsm0jv
	oTbsAhy9dnNoOJxCIFXmK3tdB7ea9ugIg9JWx1VpLM/ejJ8+2AJC+WlFRQ7kgTu3+bLNrSU9fld
	jvqqtLQ7cX27i8nuSlWnJQ6vESN+kKqu9SyboOUHQzHZlsF8DnPmOFlf8oL7upiGbzEHZc18q2+
	joWysfTV/0sA==
X-Google-Smtp-Source: AGHT+IG9+YPot+b+QaDWCuQamvFnTs1arej/50qBF58IBiHamnww69TGhn7gm30P7ZLTOf4+6BWvrg==
X-Received: by 2002:a05:6000:2505:b0:42b:2c54:d9ba with SMTP id ffacd0b85a97d-42b4bb7ce86mr3285791f8f.20.1762960959666;
        Wed, 12 Nov 2025 07:22:39 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:18 +0000
Subject: [PATCH v4 12/13] coresight: Allow setting the timestamp interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-12-165ba21401dc@linaro.org>
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

Timestamps are currently emitted at the maximum rate possible, which is
much too frequent for most use cases. Set the interval using the value
from the timestamp field. Granular control is not required, so save
space in the config by interpreting it as 2 ^ timestamp. And then 4
bits (0 - 15) is enough to set the interval to be larger than the
existing SYNC timestamp interval.

No sysfs mode support is needed for this attribute because counter
generated timestamps are only configured for Perf mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 24d929428633..128f80bb1443 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_ETM_PERF_H
 #define _CORESIGHT_ETM_PERF_H
 
+#include <linux/bits.h>
 #include <linux/percpu-defs.h>
 #include "coresight-priv.h"
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d4e294cd48ae..cb6f08510dc0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -660,7 +660,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -671,11 +671,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  | Timestamp Generator  |  (timestamp on resource y)
  *  +----------------------+
  */
-static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
+static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
+				       struct perf_event_attr *attr)
 {
 	int ctridx;
 	int rselector;
 	struct etmv4_config *config = &drvdata->config;
+	struct perf_event_attr max_timestamp = {
+		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
+	};
+
+	/* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
+	u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
+
+	/*
+	 * Disable counter generated timestamps when timestamp == MAX. Leave
+	 * only SYNC timestamps.
+	 */
+	if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
+		return 0;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
@@ -713,12 +727,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 		return -ENOSPC;
 	}
 
-	/*
-	 * Initialise original and reload counter value to the smallest
-	 * possible value in order to get as much precision as we can.
-	 */
-	config->cntr_val[ctridx] = 1;
-	config->cntrldvr[ctridx] = 1;
+	/* Initialise original and reload counter value. */
+	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
 
 	/*
 	 * Trace Counter Control Register TRCCNTCTLRn
@@ -808,7 +818,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1

