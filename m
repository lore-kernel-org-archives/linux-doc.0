Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64C3A5E80
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483308; cv=none; b=bmvti3UnL056ABdW9MMmPPEISiUyA2yhHsKp36CzD6J/4FmuIL7uawnL9WdBf0Huly6HSfQpY/GCHM+6mGg/8R4oZ6JVJJEwoRaHxpCH55UgR/DyjjnnzBg+rdJS4imqwSB4VUByPDe7lMQV0jXmRz+szK+5ihHKb0R8Qc7KJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483308; c=relaxed/simple;
	bh=S1lAdaCJ1lnshqz4avnLOeP/pLK/1ucm2BsQAjK8ZFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouy3z6gA04KWoSxVXAXzR+YzPUvJWF0dLahudiwXJzykO9o3sPP1agPhFWznv4FICba5nXU+H4hvxEW16AFXqcFK9pNov/9LUFCjXV3dew3lmzVzUGlJ8eUrNxHc0yMYw8mNoQ/dOaOFjjfBHxwE2L9I/pjUPbPYbG9mcziCA4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nhc9rZWR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nhc9rZWR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso47590675e9.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483303; x=1764088103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqeQCDNzyERvoI4uJsKzrMugXzNJjWTyKx7GIItRI68=;
        b=Nhc9rZWRPH86QgcAomjrFZdfx/nBmKb2BnGKvCoH6cnOTJ4uKdhpgAkST6wXhTQJt7
         vqdhN9WmhobzkAEI57elUn6mfgepFpws6Yd2NCvTSPfXWR+CpjEaeCKZbAPAhx8t69YY
         Wv2W3gR21nKQmXo3dzIKvF/N2KWOU+r1vpCXpAKe1Ib2FpvQ9ufs+Krc2Ocdvz1bk5pH
         f2ZH7F983WHV9VA7lRQyQS9dGdguSF3JbcZQnrm2mmd/Y4liVlHV4kx63hi4kR+Zv7/9
         ks30LdetAIJTSX88jSR9GBCe3SuJ46/GahEVNNl7N7q6vrRga9oH1AvkNyJyF4rMY3xS
         4XBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483303; x=1764088103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqeQCDNzyERvoI4uJsKzrMugXzNJjWTyKx7GIItRI68=;
        b=tXjD3dHJxtbd4tJmELJQbA6/WU95U1Skun8DHK/Yoq9/rZ9x4Z4K6qe2HIfEMK6InF
         R0hRLUQzBKImo8PeXuBvEjmES1GXR/gU8DOwC127PYeQ/TUmjS3oqr02TmsZZ1v6LT6B
         ZKyFiV2WsInB6hX2teFHMbISypLq0LGolERzyNsFzyZKzU4Csb9GQ4y5eSSyj8gO1uCQ
         tOCv06h7wR/U0K1X+FOkomvgD24xdQJ4l9GcSG+IK62j2kK3isoHmStwpmC6bvTWByyJ
         Rk61Aw3YgJpRV6PNdMJTR2vDeR/wMW/9odPdlYodPFlb68UT8OKNpEJuPLBtJAWi9oHh
         ox9A==
X-Forwarded-Encrypted: i=1; AJvYcCUyMQ+aBKRNOw4Jj9u7Ek4e/3x2/osvGhcztJYzVcTsTcjjWOvJEOVzigqc0+xp/PfkGp/Bgej7R7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHMpBUbOlbto9TLlBK9uGNyadHS2i4czLGWbQyYjYaKUiuhK/q
	QubzmXmHDtW5m4EFfRTFW/yW1749PNTVKOcwiUWiB1pbAl1Erh+zhqc+IzZZ8fBl/ok=
X-Gm-Gg: ASbGncvTbAhMYFUafyh1rPfsH19WFyOl1u7vwplZeTpZZTz3ukygIzIzyBEO8yrlzjh
	3WUYNRb0nkNKoSWS3zjtcHQFftg15jy5zvRExbV2coXUHvGASZs3zG+FQKOPIVlxKIPTc8G/5Uw
	X1aEL2ucIBcWKG7ZrWQFXnbl6vl8MT00Bldr2n7y0540qHxgj0nseNIXn9G09+wUKFhNxAnsyFF
	0B5XPadwGVlwZB/6g4c5hkBTyWF4HGJdYAQ97yAviky8cZ4iIkniDMMvH5T9Q3GdRso6uMnPio/
	7uwOLZdjKok/tI7y13BH99TZ7OJwkjoYtpDW70hfDTTMZLkOgmLN3w5eOf2D5WOVeiNFdfochVh
	e81rOCx2iYMvyPLNQYyHdB6dtN9tF6WebP4pY+3YvuA7jfzjyZ3m15rrJ671QkO6EtCAtq4GvpJ
	J+1G4LispbVn1SMjQJvMu4V9mCVtOBAf4=
X-Google-Smtp-Source: AGHT+IHiGNeVqYzY8RnLPJ8E6eZBVePfsLh5VCrTQGhetzIjHKic3zyWZ4+OT6CddGvt4e7P7u0Utw==
X-Received: by 2002:a05:600c:4b2a:b0:475:de06:dbaf with SMTP id 5b1f17b1804b1-477b0cd8812mr392975e9.17.1763483303339;
        Tue, 18 Nov 2025 08:28:23 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:59 +0000
Subject: [PATCH v5 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-9-82efd7b1a751@linaro.org>
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

Remove hard coded bitfield extractions and shifts and replace with
ATTR_CFG_GET_FLD().

ETM4_CFG_BIT_BB was defined to give the register bit positions to
userspace, TRCCONFIGR_BB should be used in the kernel so replace it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 5d21af346799..c7208ffc9432 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -29,6 +29,7 @@
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -780,17 +781,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		goto out;
 
 	/* Go from generic option to ETMv4 specifics */
-	if (attr->config & BIT(ETM_OPT_CYCACC)) {
+	if (ATTR_CFG_GET_FLD(attr, cycacc)) {
 		config->cfg |= TRCCONFIGR_CCI;
 		/* TRM: Must program this for cycacc to work */
-		cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
+		cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
 		if (!cc_threshold)
 			cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
 		if (cc_threshold < drvdata->ccitmin)
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (attr->config & BIT(ETM_OPT_TS)) {
+	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs
@@ -810,17 +811,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	}
 
 	/* Only trace contextID when runs in root PID namespace */
-	if ((attr->config & BIT(ETM_OPT_CTXTID)) &&
+	if (ATTR_CFG_GET_FLD(attr, contextid1) &&
 	    task_is_in_init_pid_ns(current))
 		/* bit[6], Context ID tracing bit */
 		config->cfg |= TRCCONFIGR_CID;
 
 	/*
-	 * If set bit ETM_OPT_CTXTID2 in perf config, this asks to trace VMID
-	 * for recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the
-	 * kernel is not running in EL2.
+	 * If set bit contextid2 in perf config, this asks to trace VMID for
+	 * recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the kernel
+	 * is not running in EL2.
 	 */
-	if (attr->config & BIT(ETM_OPT_CTXTID2)) {
+	if (ATTR_CFG_GET_FLD(attr, contextid2)) {
 		if (!is_kernel_in_hyp_mode()) {
 			ret = -EINVAL;
 			goto out;
@@ -831,26 +832,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	}
 
 	/* return stack - enable if selected and supported */
-	if ((attr->config & BIT(ETM_OPT_RETSTK)) && drvdata->retstack)
+	if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
 		/* bit[12], Return stack enable bit */
 		config->cfg |= TRCCONFIGR_RS;
 
 	/*
-	 * Set any selected configuration and preset.
-	 *
-	 * This extracts the values of PMU_FORMAT_ATTR(configid) and PMU_FORMAT_ATTR(preset)
-	 * in the perf attributes defined in coresight-etm-perf.c.
-	 * configid uses bits 63:32 of attr->config2, preset uses bits 3:0 of attr->config.
-	 * A zero configid means no configuration active, preset = 0 means no preset selected.
+	 * Set any selected configuration and preset. A zero configid means no
+	 * configuration active, preset = 0 means no preset selected.
 	 */
-	if (attr->config2 & GENMASK_ULL(63, 32)) {
-		cfg_hash = (u32)(attr->config2 >> 32);
-		preset = attr->config & 0xF;
+	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+	if (cfg_hash) {
+		preset = ATTR_CFG_GET_FLD(attr, preset);
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
 	}
 
 	/* branch broadcast - enable if selected and supported */
-	if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
+	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!drvdata->trcbb) {
 			/*
 			 * Missing BB support could cause silent decode errors
@@ -859,7 +856,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			ret = -EINVAL;
 			goto out;
 		} else {
-			config->cfg |= BIT(ETM4_CFG_BIT_BB);
+			config->cfg |= TRCCONFIGR_BB;
 		}
 	}
 
@@ -1083,11 +1080,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 		return -EINVAL;
 
 	etm4_disable_hw(drvdata);
-	/*
-	 * The config_id occupies bits 63:32 of the config2 perf event attr
-	 * field. If this is non-zero then we will have enabled a config.
-	 */
-	if (attr->config2 & GENMASK_ULL(63, 32))
+	/* If configid is non-zero then we will have enabled a config. */
+	if (ATTR_CFG_GET_FLD(attr, configid))
 		cscfg_csdev_disable_active_config(csdev);
 
 	/*

-- 
2.34.1

