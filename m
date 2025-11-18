Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1B3A79C5
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483310; cv=none; b=YNm4r877+2BuFvKk3SRZtD5Dx/AMN4TOBvpP+5Wv7+ogSIXkB4XoFQHw72wEku+le0c0AU05d5l4JF7/b4PvF2c0mRVoQOz8u91TDKqqB/wCgl2MpFXOGzPp6lCYKkfKTdO7NUpU97bfIFP1QQFSJYhgSXjD+R7WfsMzbD2zGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483310; c=relaxed/simple;
	bh=NnmS95dIHybC4skUiX6A9lTrG4BjKAs84lg0zH2yXbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4KstOd5ZIZyWeP2URmLKhf3zO8WwG/afECoe7l8yAxpVmO811LM9rBB82dJH3Eoq94t9pHHrZu8Z4BxR44g9lYqAYmTEnwdCOR7ULZYl9PWivleUQRV9qTp3iQNqfnJN1hP9KSPDDFnXOm1KIu0zQ38Dw12ThkswcOJ33AEMWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxUlGS6m; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxUlGS6m"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so26953225e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483306; x=1764088106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=MxUlGS6mE16keqPdDSxl4+RyyAcKga4zCXeA6FpCcj7cLJ0F+mGZyGQnD5kJsFwKOD
         msTtkmdlBx4bdR3ytCJP0aogD9nvXomL+YPOU+11qwUgbPcJqFiA1rK+oB9yevSmhuW2
         5bgrhmNiDQB0WqSZRhmrg9MGcNM5MhXPtqCEZB2PSKSq6pmfzfUVtJyFQLEppzOOO+3o
         sPSl/x0hPiHDGarWAaW7XkkLvrzq7IPQVt10J+bHi6JHQfJCnMBLl5w4A1BXJxfAFStK
         eVlmviCC3diLELUPrFHVMrZirIhObL42/z2dCe8ZnHhpt/mKRnsAfZ4xPkMxN6zLGgjD
         rs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483306; x=1764088106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1J9cD8iib5vPgkzAOKKPeHwOoJIQqK3mSiazT8xg6Hc=;
        b=g1e0jZM0Ng4+72KatJakWfavQvsxhf54N2KqkTkIB65TFdkeSa3Bjp6s6wIU0ZZ0FH
         QuUWUmVERl9Hm6rFBZOnz3QmXWIzhHFJK/K+tK7z4e/uekoe7Jk98oPdUpD1NsSDbtpF
         SzvNHb5RkQBABTkucAof/0z/7E2NjX9e+nrTYpxjE9X7o1wXjynHURxAfixLLYd4YaEj
         Q9fkcDVJwcMyS4Rb+CzJNU6704sbm/Y78aFW4TPtZ2LDtrNCuGf69VwimPn3KW+BfY5I
         6DpkoSGWk42gfvcw0SRWMDO7Ksv7BkbWp3djXUhAHFGSeTrBwtrliYfMFTLw08SpVe9A
         5fBA==
X-Forwarded-Encrypted: i=1; AJvYcCW7s9v0H6gC1qtU2Tlo/IJ2y3A44zfKbq12UgRGT0xet6qO5Sriowh48TWH0lWEGXbH/KsVK7Uo9W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6Fs1cznoJWh1TbVFvg0LF3zTzPwhdJxcHQSDqvP6RMnkIRGg
	53jWxTZLPa6TfyEExtmaqG1z7LVb3VL943Ae8uhWS93cGoWu/Oa8OJKPfSVNN5WvHXk=
X-Gm-Gg: ASbGncuNAbZI0PNWwZgeDeBywRlaOUzYXPmb/dvWtu/2ZPqks0E4WiI8Tl4rYP288LD
	U9V3OmE/eTajWCgJIe4Rycr7QdVFE8Pkl/7ReSldhTEuD0bRR5HerOFTsF78lsWC3sVrnO5c+IY
	0KA3IsCdrXJA/QiCDU3Nwa5CyzevJHZYOrI0i9Y+rMO700OvXx0KvEmhyxiTlIRxrk4sUS+pa5x
	mbggLuOg5xy9dzNNqUUx5QZfRkvZm8JlfvrrQ63ekNxV08/R4+JBJ6Ud2NyUgaYMZnT1SY5CtUv
	DFKLp96caO/QBE75I+mdPkGn+OvzDaes0043Rei5X6JRBXVmSV5kfgmIZbxK9gFcd308zPB4F46
	KWRqdk9HTWeu0Dm3TL0IQszwps/GrLJNUm3/F/zT8beQf7x5Lwcx1ArYhGT69onYTFVNIlgowjr
	bZIDF2H/0Xk5UcrfaVc3TWMy8RxEa7PHg=
X-Google-Smtp-Source: AGHT+IEIHAY0ieYvrIgM/ktEZhU04EJXyQVK6L5dD7sCe4rwbzMBqRPJwRy/+JJXUFQoMVJ2eeuntA==
X-Received: by 2002:a05:600c:3b19:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-4778fe68378mr157000715e9.11.1763483306313;
        Tue, 18 Nov 2025 08:28:26 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:25 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:02 +0000
Subject: [PATCH v5 12/13] coresight: Allow setting the timestamp interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-12-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
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

