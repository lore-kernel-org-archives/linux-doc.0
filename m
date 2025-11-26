Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92663322C60
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154675; cv=none; b=LF/0EJvLDiBr1H1Ly1U2JBGfaWyR6mfelKUEbJyHpIaFr8hsfbmm8wc6qS+PgKPbQ0w4zlSMjyd+Vx4r0Ux7boFsx7eTvs2E2ZKujqY5cBY4uW7reZCwPMYgV8C+a0M86yAJ3fxum5jahz4lE+rjrDkFweSe/zgKVYfRm1sMviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154675; c=relaxed/simple;
	bh=LNCyuYyZmkWFZcCqoVNFMP/DsVAdzv6MiorRrcgFSHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYWpjx/dQ/JCtTZ0cYBWM7EFVLqospKCJLwJ9xQLGgPJ8kXgAtv667708bHYLWItHxTL2K0a7blyxCJH2Bd5HH5dYS82TzsjC5deJiQdXyMQbBVCb/FDXG6cTy3Yf49r1dl7BFBf3jPxJHjESfsiA/xmsPDQu8pNPNxvw/lI31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYuiwAQj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYuiwAQj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477b91680f8so51550615e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154672; x=1764759472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izIPWfoS9urp2dV3KvMRs2YvnYc7bdRi1OjC6bRCVDU=;
        b=vYuiwAQjExtVgjiUxJgfJuSREOqO+DrzX8ypIUL53sNMoCjsYZq6MUD2h92fa2sPUA
         SyXA3PSk3UuC8aqFyBITdminyybWze/Kr3C+pu2VP24YCS48J/iRY2NHZqRxf1F7f+O5
         L4TQ3JULkmDIdNmcy0lUwUYFhim29z+UbEpto44jpTtBCcYxSbBuSsBRZUxeIszd0Nbh
         p8B95okImEOyMg5rz4i59Qhg19Ing/HMWIMMMgIeS6Zvk6dsx46VKECeOZte37Lx8Mh8
         2XNrpDbr+f8UvQMxo/7FEGVwcnV1HGLcjsLVAAkQhRe0833xI+greuhNor/La4kHS3nr
         y7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154672; x=1764759472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izIPWfoS9urp2dV3KvMRs2YvnYc7bdRi1OjC6bRCVDU=;
        b=CHtzpYJGxaimu3KrmcFLsEweN7zGKXzIWmKjy1XwsS70Su3d4jtvA5xev5HnW9mJ2y
         bl4NUTZqqMonKU9ZNrkQr1jc8jNh8QoSWm0NdtncyZ2Cvzi2VOJnbj5EDRKUmPJz9eln
         EVwnSVfBm5vQ0S4IrVXANAQDkd93gOLdOb2+/rNNI78BbbI6R8xFBlz3Dl6Btw51ByzR
         56iXSfimjIzr3SU/Vdud970sMi7B7Yw0Pww4IB/RR24EltpVEIQ32O0kRGcu5UlW3jDm
         ggRXL5iKLeEqukc4vCdigWJv7E33qwBHwyfduvCgoEJoGkHp/pzCSDIc0WW3ij56rk4w
         rwVw==
X-Forwarded-Encrypted: i=1; AJvYcCV4BWKmQhqRlVGkaS1SGRgZm4eE4kkpc3I4Qp0waQCxLwIQOW+hpIsKdF8cKULgjAVorCXggH3oZwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhaOkk72mMMYN/khbQP38m1KpR70rjai7ZwGAsU2TcJwc7kDOo
	pDpRwSe9TUaRNOQh5fTe/xQnkpJjT5rX8p5egLc+eaAaB6O6fZDxGNrHC+VsBPjzbxQ=
X-Gm-Gg: ASbGncugznrrB7AEn0l+fDee72YUYUBmPD+xW4qWbVHDKgKrdjXFM7eafSnc0evNsxt
	q3YxzFeeTHyNC3QgUrto8I9O8eI3UhjIPq1bx8Uh0y1Gwenpge7gkY7K9UtU8lp69axgeaI8QJ/
	xM8r39JjJRZ1uuXR96KVfwhbzJruRNpyKTcNoyFIAkANx1ZVIXTUtkcmLObzgd53y8fhodnyTo8
	5xmne/o3ZxRWIv37FwzOe6AEPiseS8o+vkupYw+eVCb36YtmSgiBcbpoXaFJMzh/m/EE8k9TkEn
	9bRLuHd12chKSfjDTzEMAPGvptD/oNUTDNUi9VPbKWvryAnNCzf4dcOPJyzo4mzw9el9TWqFuAO
	XDoD+HNyuodtqDkEkPajHWH19fo7aKCUL+tFfVuEn8REUkUn/dcX34/H2gDQxAO/anGRMdxlv+0
	CfxK8TND51UtCmIr/Hover
X-Google-Smtp-Source: AGHT+IFAR6c195gOhTQz8dx6OF6n9ZtTYJ2jnLXbzOQvfTE9XO9dATUae/AlsEqPzIc2s5OhSaCgDQ==
X-Received: by 2002:a05:600c:46cd:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-477c1136b7fmr175263115e9.34.1764154671907;
        Wed, 26 Nov 2025 02:57:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:38 +0000
Subject: [PATCH v7 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-9-7fae5e0e5e16@linaro.org>
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

Remove hard coded bitfield extractions and shifts and replace with
ATTR_CFG_GET_FLD().

ETM4_CFG_BIT_BB was defined to give the register bit positions to
userspace, TRCCONFIGR_BB should be used in the kernel so replace it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2ec2ae1fef58..b457f182efbe 100644
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

