Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2321B3702E8
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569111; cv=none; b=H31RWmc6O373qtcyWJvlOsC52Tzp03Pd9m7CIiR2tJQ3JA2bH4H1bjNgYDYfw3fKZ7FEvVb8MIF8agSnIuVfjvSVFarxwB+Q0AAekueVcobDST9DhsFYcgRiJus69Yjn3yS9p6X6B8YZjhnWhU7wZ7Owl3ouhPGsXlAQCOa531U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569111; c=relaxed/simple;
	bh=S1lAdaCJ1lnshqz4avnLOeP/pLK/1ucm2BsQAjK8ZFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I77k/EEPT1ATzJ2ykK7SnYIb1C8kZRCDhjx4VxN6+bPVy/nl6+mco8E2Pf/ULklFjcl1BI5qcj3T/ZTwAuplYeghl6Bhm295dFjHtNKqw2fL/LDjRjLcXuwlOfGj2WghxetmrZ5h45O68SpQOuzNSMS0GqbV3IkBDEKkGwXHjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/qbdPpH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/qbdPpH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47774d3536dso9786515e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569108; x=1764173908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqeQCDNzyERvoI4uJsKzrMugXzNJjWTyKx7GIItRI68=;
        b=x/qbdPpHoX1XMqCGJWmi+/2qZBgeSTwoEag6/isI+JTjYJS5HtJ+1GHxp4AHd8NY47
         oye8IMaxjvWPsBpUG9OpzTAEWtgTI06h2zrpMYvbOd1b8MXo4SwwKwrcCoSMDDASFRfk
         MKUnSc0Oy7OcDWP0Hf3GApwgzuFi3AZBCeufnoARGbrdM6xGopsZvRQv34mL7UHLMcRd
         v6fqYB2uOTMBlAW1oIqZBY/hSSB+jNIWrSmc8Q7lgdcE4vNGsWZPISZdX2S12bg5XOX+
         U3Y7KQcVohbSdGoEU5Hx0paobMh0apYkYFtH9cB2zpZAzNUAlK745DiyqVJhvbCOvLJe
         3lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569108; x=1764173908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqeQCDNzyERvoI4uJsKzrMugXzNJjWTyKx7GIItRI68=;
        b=qGzC8HB6N/WAjoMc7YqcwpULRe0ep+1GT11xCFVS+A8tE3PVLh6FPBK11m9s3ZVYMB
         PmVzJXp8hmCOLaPzQizeuQbFwLV/nb7MwnyhFUnDeTAlHtfQ3cmqty5f2P3YdrpNFOoC
         smxfyTBZKgipMiR+L296o1AhbcajjLxx+rrCjDU6WABpcFX+PF9WAtph9ujvY4e4RX2i
         6atgXPOjV2MaNm5YN/S+NmYMKeZ0pu0Cmj4Z+ariPm+EVeqTbF1veWh24MMFMqC/1qtP
         DGRfiiHbb6orNyje3iCOpUil3wl7CMepSPgBp30kstQBJr6rEdH0E0lpSb6B2cMG4M8m
         AuzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhwYBxVpi1wGRx7Vxru9+Ju3eANrHMy/LX88lnTz3gtA4T6omUHTHCaU/XY4TG3Z7KSXFBzfUALK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9kRHo2FE7zbNtTNLdl+/cGZGuMwfMAXF0vZt1qK7m8tsFNsty
	+Avyo7aMszpT3p3Xv9LtijzRvFn6C61MD97qLtDZFzE32my1EWlyWE8FiYCNR6A9btw=
X-Gm-Gg: ASbGncu/32LxLFBzg2lGSktdXJDP8UicMJI1RBcXwin+ysm4y/WUZvs2nC2tkEz94QL
	OQjYva7wL8n+utRGJrW1NIX0SKiwevmYoCeHj/sMKB5Kod1+w9ZJItqSLXKg45wX+vI7Bs6FqvS
	W6j6+zR3ZLtC6IH60VlSUFjqLZ8Q4MC9bo358kto/eT+G1/jUiytoxqzld+fWNq8uMGaNabTp7t
	KvrnugZUbKehgm6cT0WWTe+aqXnulul136ZEfpQ2KMhuhQUg6rdzskJ1PZORAtEtsZz7mDHRPXE
	1M95kMUTwim2a9sG0gcOWvzJ15Gsci6SwwzLha4RsBRDaPPMnjWqkm9qsip6aLuVEkyDkx4t7Hv
	VuYpi2Q3nu/Pw3cEoj/5P02kQXCmJEfxgQSm+wCQIxA++gYrBqnLR69ZQ0IAjkFvnxTX77w6Ler
	wG2mhOkHJPIRp6enVdrwxHW3mL114lnE8=
X-Google-Smtp-Source: AGHT+IEM/Fju5p7i2TJe9V7ikGxvi98b6EUCB36YzVh6dnUxOojXzliJKumS8+g6+btvID3Xl1OO4w==
X-Received: by 2002:a05:600c:468c:b0:477:bf1:8c82 with SMTP id 5b1f17b1804b1-477b18fb649mr35631295e9.15.1763569107534;
        Wed, 19 Nov 2025 08:18:27 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:27 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:05 +0000
Subject: [PATCH v6 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-9-740d24a29e51@linaro.org>
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

