Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FC3246EE
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154678; cv=none; b=Ayo2pk2J76XOG14sKE3mDY+0tRXTjfMdcwYZII4LEO1d9HQhif4d6nMsQpv6xgfmldzU/VEptq6LAhVZUnGnv3KBtV7L3bIyslYxEtWOilXf29+wea8rg6EMmfO3gLM0MuxQg4ozHw/mTYlWvCNmyt/7ZvLzVea44vFXwJxlgaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154678; c=relaxed/simple;
	bh=XfsVAbfflmddsFvUZmGMPKpPfRjWdP9dqrqERzlZQE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ii7Pz+R7QvbSjYu1VFkL15bfPUK3Qhih0zIhGZrAccvirJkFqH4EbbrFbrUY04tfDQwctJU8q8iWm86nUk+/DeQuHXsp9QWyTXO9lOZkFt19ZbGmDygchR+H0eEQQ7+UxgbPmXoXXFGirbR8Eiu/6xeYPA7h0QGBzEQEFjgSuHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T5cAPjMR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T5cAPjMR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47796a837c7so43378865e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154674; x=1764759474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bwt8cEG57tdOF8BASxzVxlljz5Pjbs6lZvjUWFDTXHg=;
        b=T5cAPjMRmtuQ2af7ao3JdlTedxsZOJpiEJGODWZVks/2QwpGl5ZDVdS61AKB87HYFI
         2LSRlJQmo1Tw7zWUFjcz76WIKoQEcUtB//juNA6LUNo4h9D+C7K0EHK1j9cliu5L64Fw
         5OQIDqCa9FH/nB4aFN2ewjrw32Qo8Qaj0sgXB0ChfiBrgEXTbYftzQhzZuZEVbOmUHtY
         tY52rhlZfGo6rCvKGlcr1aOF5eDky2km0uG8w3im+Wy7UfAGzcZ9Iv8WyFtbmkzkEVVl
         gE3+nPKbnGRAJkC9rGOzw3mnhRcuK1opUu6MF80Ta0arlwPUdDJyTcuBikXnNV8gREIT
         b7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154674; x=1764759474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bwt8cEG57tdOF8BASxzVxlljz5Pjbs6lZvjUWFDTXHg=;
        b=TUI40S16ni7Z3Jl8ZgfYwigi1rLFEs9R7rJ35BG2dL7nAamPss/pFOJ395aJ9HzFEr
         p5l7r8Rfc+HlG38ShPrZDaFIwSj3sBNo9vu6sY4y1JhbaWf9hw2PN0uqi8Zqtr/jA5El
         CyoAO3S7owgChKGw0KcVtkMWR2ZRBXHzSSIK/W3MIKFhKxPhdtoOStKwPz7cvNpb9PDJ
         Q6ri4QOiQWEvE+YRBM25DCwP6aXQPXympAf8NJWtH8dzmX+2Xyo7ov//BgswMb/2XQ73
         QHVkWAVjTfTU1RzOSkSZEoh5GRf0vwEG86UYFvNdamUgw/rJ3A3JBg7fLYmL4y1leHZ+
         txyA==
X-Forwarded-Encrypted: i=1; AJvYcCVg1tzoDcFBQAXXkBObFQrcqL1y2/LvPLlsq03R5WJ+p36YG+riu9skf0c9XeMsLSog9kfd5l8FFCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0OLdIvv6sydPdLgJJZZya6JFnGvJcsfaTdIdi+HUW/mnrliL
	OXgBuxRU0KX0cQn7+AJ/RDi1p8ZjHFNOifIiIrvKdnoQOPIuKrSlJo8abEdV4sKSygc=
X-Gm-Gg: ASbGncvLynIaWRsN8bDDAXA5FRr55nOJtRrHL9PU1NOKI/6gMysWAEuKUoj6HtluJb9
	EacMbSYje6T9T1rSoN9te3iesp2Tz6d1kxxB8q1aNTM+a6dGNtahtIJJ6Da8uhjJQW3PzeLoQlw
	56WScBhj9yko5mBVGiKiHWEdnJD0kgWncbcFJZCMbpSMvTpagjRrV8+DB5fDL7YLqOT2bxl3Sga
	YTL3ranMlBRwRLSxaZe4FyJ37i3G3eWRVYCa4lDnHgDhVv/vCrN/FCK/LZg7xYJvwQVW4IP/cku
	kUknEDzhdTSoQ0dSK5NpoQjJnhSKqyeNMKo9jwkUxGlBosdTa2B7yvr/ZCLvWthAtd33bpVxQDc
	O37RrHmWwPAJhNjOS2i0Y8/BipNUvUCt9TfHr2MXaUzkygIZVnajDapsv+abNCocMwOM2RkgqTg
	tgZh92TELSG4/YNLmesA6b
X-Google-Smtp-Source: AGHT+IHu3VMV/nia9zExacgXf1CG1quUw46Gmf589tkbMqB6kt7gsqIoCudhkMzjlBbUakuyMJJKdA==
X-Received: by 2002:a05:600c:4ec7:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-477c01ea075mr176599335e9.32.1764154673792;
        Wed, 26 Nov 2025 02:57:53 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:40 +0000
Subject: [PATCH v7 11/13] coresight: Extend width of timestamp format
 attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-11-7fae5e0e5e16@linaro.org>
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

'timestamp' is currently 1 bit wide for on/off. To enable setting
different intervals in a later commit, extend it to 4 bits wide. Keep
the old bit position for backward compatibility but don't publish in the
format/ folder. It will be removed from the documentation and can be
removed completely after enough time has passed.

ETM3x doesn't support different intervals, so validate that the value is
either 0 or 1.

Tools that read the bit positions from the format/ folder will continue
to work as before, setting either 0 or 1 for off/on. Tools that
incorrectly didn't do this and set the ETM_OPT_TS bit directly will also
continue to work because that old bit is still checked.

This avoids adding a second timestamp attribute for setting the
interval. This would be awkward to use because tools would have to be
updated to ensure that the timestamps are always enabled when an
interval is set, and the driver would have to validate that both options
are provided together. All this does is implement the semantics of a
single enum but spread over multiple fields.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  4 +++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index c794087a0e99..24d929428633 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -23,6 +23,9 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_preset_CFG			config
 #define ATTR_CFG_FLD_preset_LO			0
 #define ATTR_CFG_FLD_preset_HI			3
+#define ATTR_CFG_FLD_timestamp_CFG		config
+#define ATTR_CFG_FLD_timestamp_LO		4
+#define ATTR_CFG_FLD_timestamp_HI		7
 #define ATTR_CFG_FLD_branch_broadcast_CFG	config
 #define ATTR_CFG_FLD_branch_broadcast_LO	8
 #define ATTR_CFG_FLD_branch_broadcast_HI	8
@@ -35,9 +38,13 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_contextid2_CFG		config
 #define ATTR_CFG_FLD_contextid2_LO		15
 #define ATTR_CFG_FLD_contextid2_HI		15
-#define ATTR_CFG_FLD_timestamp_CFG		config
-#define ATTR_CFG_FLD_timestamp_LO		28
-#define ATTR_CFG_FLD_timestamp_HI		28
+/*
+ * Old position of 'timestamp' and not published in sysfs. Remove at a later
+ * date if necessary.
+ */
+#define ATTR_CFG_FLD_deprecated_timestamp_CFG	config
+#define ATTR_CFG_FLD_deprecated_timestamp_LO	28
+#define ATTR_CFG_FLD_deprecated_timestamp_HI	28
 #define ATTR_CFG_FLD_retstack_CFG		config
 #define ATTR_CFG_FLD_retstack_LO		29
 #define ATTR_CFG_FLD_retstack_HI		29
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 584d653eda81..d4c04e563bf6 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -338,9 +338,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
 		config->ctrl |= ETMCR_CYC_ACC;
 
-	if (ATTR_CFG_GET_FLD(attr, timestamp))
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp))
 		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
+	if (ATTR_CFG_GET_FLD(attr, timestamp) > 1) {
+		dev_dbg(&drvdata->csdev->dev,
+			"timestamp format attribute should be 0 (off) or 1 (on)\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Possible to have cores with PTM (supports ret stack) and ETM (never
 	 * has ret stack) on the same SoC. So only enable when it can be honored
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b457f182efbe..c7bf73c8f2d7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
@@ -791,7 +792,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs

-- 
2.34.1

