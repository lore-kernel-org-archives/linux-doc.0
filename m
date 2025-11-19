Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F8B37374C
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569115; cv=none; b=kucdGzuc63+hx6k5Wy7poYTZGpJfimwNkMXIpLN0B4V7md8KK1L/A4orhtfAlzmdoltEU8vU1H+/0RRGhHllgJmhxXZQGWK0PdFiIYZlRMH9ik4x4vKMbQYQUIGkSeiOkqRRo6NjTytg3qV9XzQqV+AP5XQ32MCeFIxa6TW0IrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569115; c=relaxed/simple;
	bh=NnmS95dIHybC4skUiX6A9lTrG4BjKAs84lg0zH2yXbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7MXJvKMYLYJmizZ2G/oKHjtyRwb7qFg0cqR345LPUPTlejWRL8LbsT56m6ldv1Q4/Kekfmw1LwI+cc2tqSkhxdj+XPjpSSzlX1rQ9QQfXApdQ2ZNrB3x7sOLPs7bcye0LR7eiRHMjbbcAQhAovfZ2+dNGCcujlyGKVrTjqegAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmtZlCW8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmtZlCW8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47755de027eso47185585e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569110; x=1764173910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=HmtZlCW8IuHUOByPvYeelPKhZS7fRAiGlOCzMOj6VMapAn7Mi3dRe0rYjlE+jnMXhr
         imBdLpxLX207FKTmzNUUZ4JDkKMsenoA5aysX/nMFRl7VrbihmAF6CFco13CdJG4p5jX
         ZbVr01dV5YOKinBtjem9CkkAtqyw+a6euxocABTVk/WQXNRvSdWrO01ezkZjqfMRfPyu
         6+f+bd2nXyRIjsEIFuciHMX2jxKaWbaROoVLHsONJg8KUGentxFLAx8aR1ZHb+L5Dizg
         P/wEPC0ugxKBUUUmbb9bWLKuKrAvoUfaWNxNvrDwQT1sXqY9mBqFNV64t9AVsPTfosA1
         bomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569110; x=1764173910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=YQSXb0MvkoZF9KVsZhWJ0jFgi2TTA1TSDsHBwoJadpcCReMS9pXQbWOjQPiuuiAxyZ
         Uq1+oDdlK9sX9Tjr8ZqfUaBE6oK/iW+/DxeH3zdiFC1A8z0QLKdmT6aPnVH3GH+PA5jg
         4m2y9KAIskXZbTlbHAvE+tDGJ0iWCbb7KtJOwJUDdNGzkgXPZ/HrRoR2dGNmDviynPpc
         9TEV3bK/qfoP2POnAkUXLoREwUEb3aBxwfGy0U8ITFRWLIVGkN/4O26RmcY9KS/ae1GC
         tD9xcPeCP8zO5+mmifs4HD++gdd+V3X7eQd/BTqmExNfnsulONkyJWd2QIEft+cODF0+
         NKYg==
X-Forwarded-Encrypted: i=1; AJvYcCULPqfkRGAQRCltTrshiMgUk/kH2CLdPGjqOsKh9GvV2CjpZATEvq6yfiTFsY3bB+HM4IRp8qZ7G44=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQdMXKjQD9sf16p52lwSgA6gV+AtoT+zAI7RY7veKkN4xmfkw
	2N3aOh9QNe1MvFYNJXcF7c4B/2dl7yB+XX/6nGnj/0tkSvGZMnhNv2xHy9yIZeyaVoo=
X-Gm-Gg: ASbGncvrTVlNyAn757+6sa31IRdfdtdLnqCsX+yC5JwguqMIAQzW/9VL1qC7MRf4ihg
	cJH9l6gk3QZGuZjBK6sUqJkK5P8CltsRpg3sI9RZgRPrRYWany/Qem+Cfl/XoJw/eWmpXeRyKnc
	upoLSJ8zEytLbw+hte+IiATCn6RrRRpjfZK7kX1CW5o8EBn8l/sx2Awuu8kbdRPIj1V5iogFyvx
	2ZBITxoMoP17F/hDY4A7gDQMyRSp1Oih+j/+QZ8aeSgXb9k3sRzjWCvB6L/j4Wgeq6gEpX2Noni
	nUJiLcIFlHkpQXlZAsKY4M/4Vd4TgMJevJmk68vMt8HUFVkdiBWdXbWBPOp6SmYKHDxisfZliIr
	T9KXY+QtwiSyjit0d5ozWhcbe4lQTwiU6QMH1cAIzLI/aJwfw0plVs7byfW3pNORcpmB40J3xDl
	Yn/y8v7UDFweznya5TJs4H
X-Google-Smtp-Source: AGHT+IHM6yKtwK40W5LgZNymtrK6A18IlWWcGf9RLGOtTtAdPxJ7lod3/117k5kVxzXBlztAnW+0mQ==
X-Received: by 2002:a05:600c:1f10:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-4778fe4a046mr196974135e9.15.1763569110327;
        Wed, 19 Nov 2025 08:18:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:08 +0000
Subject: [PATCH v6 12/13] coresight: Allow setting the timestamp interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-12-740d24a29e51@linaro.org>
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
index cfd6d2b7bc50..a91981a651e7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
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
@@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1

