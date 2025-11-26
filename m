Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1C322C60
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154678; cv=none; b=CJJyb7afzmGzi04PUwJ5k8LIcc6g3qIKSJRVSpNt8ivgKh7Zy0ek15MOdBjAgeovMXvNZFpMyKlbHhAJGdNR6/LLu1OnnBOe0/DC4+bMzD5jZb/TFw6hKCipZ+rnZZpMcpBDrF4OKdF/t1Q4o0XQsZ6WXx6bkZutFlYcml6/J+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154678; c=relaxed/simple;
	bh=Rp3iLFIqXnrF+0pIOR1MFfkShwiH6j/y0U2d1eAux9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ds6N7z7cLJAj/cA9WrqL+1RdDI15Z42XZ1uOmmViaZrALGuzWLELTfSgzIPQXEpS6PNeZ/RpSakQ1dThTWKi4FECoAzW3f/F6vySq0qncTjqn+Hv4lRnL7NPoXpcmdbnhwLE/4umqsphaLSVQ7kIJfIzrStTz//Oc8Id6qBrv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiE8hWDO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiE8hWDO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so46207095e9.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154675; x=1764759475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aL0yo6fi2WmbAku9VkxCsuHLTyCNr7C/0ei4wqWf00=;
        b=YiE8hWDOEIyEMd3vShVlX0/sf1D6FQB0aUzZv28pjtzOZDSgJwjZW6z44IsbsMt/+0
         zDmudnFj4RW51F312R98glVhctXPEGLkaCVOJ4JpE01eRinLxuIBcLbxJQQdU2OeDDsF
         z+kZTvxMjp4lhDCdy8kiq7soKXBEJX0btwooPssPpZHzVjipgvsHXKfTVtNLC5QX85/p
         xyy9lpKRk07GDfBeKBvcIBDMWrQH1bq1O3BvGxog7aYn/uKkH7vwzvTXHx6hTv9LEnfD
         GO5z+CKUqrnDajaH6RUus6m+rr1pOWRuzHLZykO3Uwl2AySHOcbCFPbjA2zwXTJN7t0A
         uBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154675; x=1764759475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/aL0yo6fi2WmbAku9VkxCsuHLTyCNr7C/0ei4wqWf00=;
        b=BKMb6jnkt8VbT/wW1J32MRJWqDooifkvMNNxsYRY/x2z8AEntnTwCndkEnWUSrQT74
         ClTJR2JpH+y+mEowo8PWhuDa9AHrljXZezMMtjDFjRKECd8ZLj69VOvSVLMcMZZ74CAU
         I7oALlCvwEogrKAvoUBwHGdvOBHYcDUt77ziEmvfpVkG+PfUz3Fcp79TeqUWkInHN4fL
         weUtTKThtpKKegC4khN3bDMWLzBVrOp8fskIka5Itp6MjN35BnmCfWpIZLikvYbNbtiC
         oEgYI6CkYzULKUwxREGQuM8dmM8uKykT4I4ryDqLDifHeKlbXevre+Vvthv9mlhQrXq/
         oN9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzeZtRpu3Egaz66Coh9WyOHRrr0zdXU+SuAm6XP9Ziwj2UL8FOdbDyP3R3k+4r9HLL83fH7v1ELWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26gJMrct/D9JjjuJH/y0DNW+9rlE/IZ6ysfs9F3NiUl9PmnG7
	1WOqM6dih1qRjr6x1Um2RNPBZ6jnYrBX/axGx6UfTLGzmVr+buG6unqsQ6qfKXJBYyk=
X-Gm-Gg: ASbGncsY6Z7abNiLBeO5M3W61xmAPbyxDKiw4/632xr6I97AY/Y6R9eBpmKTSJQfyQ4
	9PpyYdFXT5PkzEvlq+lmdxkCazr4nLYvPft4TbR76fopaSfki5NRKpsyYyPI/jzDJvttRFzhdEq
	MRggUgLTqi4DEDa7zflIPQLCrKU82dXF46scoJ14OGViBa00k4PcqEJpiftudHww6YqINoTptUY
	uPIaYo69ifK8+JnmTIWoiMPi+NxybQONv3DQzfwzERrnGNoovfcsQQv0c4US/tca4ZuZFXGMY3o
	Nt0+r6I6hGcgHgVobLOmUs5yDL55EGN8slVk2yuOJ8VCd3P1fjdjA269qtelMQ7vo5uH5hHKy9p
	hpJNNyQ8LvAPqqj2ZEeIyD1QVZCcKD8ALTr+z0ls70dwZQmC9ZwaMhnueJZeNMdG97y82v/yEzr
	e7EDa6MwRLU9OCC9fzKKos
X-Google-Smtp-Source: AGHT+IGviTrM1sSe4rL++DrBqXnogXlxDeacPexepOhL2fMVFW83P2kdlvQXu27F0Wvm9C0S2kRhBA==
X-Received: by 2002:a05:600c:3b11:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-47904ac464bmr56208955e9.7.1764154674704;
        Wed, 26 Nov 2025 02:57:54 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:41 +0000
Subject: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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
index c7bf73c8f2d7..0129b0502726 100644
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

