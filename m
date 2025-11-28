Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2426C329E4C
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330964; cv=none; b=NuqKnX1tnIVGPrjTw9NmEeTZI/hVfPpI77qHnE42bk65NI1TeyEf+n7sON1QkpTtvvPBq0CoUTFty+D9EEWn+ss4/nbv+Cg8NhXEhv/dvmE/B4lNMSJOO9jgJ6iKCtP+N0by4DHiof9y+SH/rwN+id/X0xrddiqokkjp0dyXV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330964; c=relaxed/simple;
	bh=SS/s8QBA/va9cTDHskVqLAp1wGdCoVI/9SaA59A2p/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jC76dqg+aztA4i+15yUQCUuE2NdWRUMFi3fKAR21k+qaJfMuDnE3GctxhYqiSKc3gWIXj/VyldMDJGzZ6W3haSNOEXkvOdlGHqc6mMpWfLLj8keiDBGT2ywulMI8GBiDn5ns96/tJnV5Q3qIItyefpHknGLKPQkYd0CIqUb3AJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDokXgqS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDokXgqS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso17040355e9.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330960; x=1764935760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EF8yFRu7uobTFdxOcMGHqxmlNjOlv3Yom5cRf9iiNv0=;
        b=rDokXgqSGZWIhlO3qYLC/dNSMZyWwPFjyqe99UCwkZWiZdtvh3Y/WQO4hziymfxd8S
         eqrOiid0azwED5qqspEarOEanU1taW/eWkKFtSMKUxVLPjqWuzmuTBiqIlXST5gzsyxS
         dyAO8ErT71rOgG096IJzQ13jlFTlRF7oTlHuuF0Mn15RLzNTysS6/pqwZ+GDLgHjgljW
         ddw0dddJY8nhHv4qBQf++nros/GDrNNnt2PsYsApraS9AlOsCy4F1QKkkqgXhokiHCfn
         3XgxSs5d+qoba4kApnX6lv1PWEXQr5SXfI4tzXQSLZsZsPuEuTJhrvLP4IFUXOPke+iI
         QA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330960; x=1764935760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EF8yFRu7uobTFdxOcMGHqxmlNjOlv3Yom5cRf9iiNv0=;
        b=kgjIR/Ia/PumkR9ONjnI0o4MiLqDdrS6IzDHOQEg8bR6c+6y3SsX9g3YzoWmQr58sM
         XmfUK7Pl7oPlTUHHXTTlYBEYq65mWm1dyIZZrtWtsKcLRQQzKO4azV6WC8hSobEwJdWM
         QmyypnNUoNHNVhhULzSDgP84AjPD4gOIbIRIxLvt3AyQGDapMcccJL6Pg/fxJBwliMen
         XweYUCK6MFrBG2yG/IiLMYiZGGnL6F+LmGrpd8HHwWqUvHqbsTkomZPBQS3PSRs8tZO7
         x1aegcGUrNKm0Ptq+fbBYnXPOmT21ugO5YDmDLROVic2OSFvvPN93J/HfbHqZ624ZYVi
         jhkw==
X-Forwarded-Encrypted: i=1; AJvYcCWY9A6vxOMLs/6nqiqygJvlEwTl++Ha3QqDwKBFv//qMMc3u1f8OOVXmLgz6CevzlTCXFPAAH60Mmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNaG58473qy9XptgaaVj4pi+4DjFTBIOlvFsjE3lThrVkwIX7e
	ygIg+JDXEuVjCjeOs3nhWpy4cVOdc/oVto+lnvfMxqyq6OXleIjHtUjlvDEastQoU9I=
X-Gm-Gg: ASbGncvML9ECE/Fuw2CHcy03Z6sZDVdNaOf7VY4Do0OcqWVbFZvL8P83X0fhdGMM7ac
	/yog2uJfHz4XV+/kX916PZZ2AKQP0HP8OZdBQKSPY/hei+YMTkFBVkXEJxNXpSi9qm328jgwKjd
	MdWck6e5iWQpvAXzO/0c8iuf4pejWpo0ylDniWz7GkL3RRY59jwcjjC1xDMhx1owXjJU7amfYnL
	SVwgaPhLRZY7e3U53t8wgTktrQJYgXAdcq8te6G0vmr9op9UB7fugd6uR0iyacXa9lc9haMDwjF
	lwGLu8JmYBH9MTyVIW/7znJ9vWqdCUdrLr97lLqORNI7UefsK4TmiUXxlgR+14wXR4PY30hkupe
	sdUv/wOv7zzSOqywrquzKiJc8TnRo2qOyhpl+kNn8Zy22sOVcNQT4L4NnNuQPgzViD81lP6J4kd
	WKz5TKnkpKck22Tr+fJI7GQ3L1edDrDio=
X-Google-Smtp-Source: AGHT+IF59snexuzfEwmE+hbBC+xfTP3fyiFQFy8xP9a0/ylOS8orxBtcZfG9ugUz3WwI+KQC1momlA==
X-Received: by 2002:a05:600c:4fcb:b0:477:557b:691d with SMTP id 5b1f17b1804b1-477c01eea7fmr244407045e9.25.1764330960440;
        Fri, 28 Nov 2025 03:56:00 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:56:00 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:23 +0000
Subject: [PATCH v8 11/13] coresight: Prepare to allow setting the timestamp
 interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-11-4d319764cc58@linaro.org>
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

Timestamps are currently emitted at the maximum rate possible, which is
much too frequent for most use cases. In the next commit, the timestamp
field will be widened to take a value, so set the interval using the
value now. Granular control is not required, so save space in the config
by interpreting it as 2 ^ timestamp. And then 4 bits (0 - 15) will be
enough to set the interval to be larger than the existing SYNC timestamp
interval.

No sysfs mode support is needed for this attribute because counter
generated timestamps are only configured for Perf mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b457f182efbe..7e9c923acf4b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -650,7 +650,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ (ts_level - 1) on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -661,7 +661,8 @@ static void etm4_enable_sysfs_smp_call(void *info)
  *  | Timestamp Generator  |  (timestamp on resource y)
  *  +----------------------+
  */
-static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
+static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
+				       u8 ts_level)
 {
 	int ctridx;
 	int rselector;
@@ -703,12 +704,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -756,6 +753,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	struct perf_event_attr *attr = &event->attr;
 	unsigned long cfg_hash;
 	int preset, cc_threshold;
+	u8 ts_level;
 
 	/* Clear configuration from previous run */
 	memset(config, 0, sizeof(struct etmv4_config));
@@ -791,13 +789,15 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
+
+	ts_level = ATTR_CFG_GET_FLD(attr, timestamp);
+	if (ts_level) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, ts_level);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1

