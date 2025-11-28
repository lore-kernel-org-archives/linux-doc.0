Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2C328B4B
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330961; cv=none; b=oqxZhkH9eEerFVjzzXH1x65LORWShvKWcC2T5gno/gfwqg30IGvczetUREveERypJ6syj2ZzqQP4fLqGMc0xbmitOdVtb1z+/H9AejPboLTl6Q2BP4CoE4vcqJ1yUb/l+mqWKPTEJScdZra8plw8KUkhrc+D0JHRNiUAvYPiKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330961; c=relaxed/simple;
	bh=oojn1Q2oz2LQF81+BuEH6IiwZcCbYqPy0W372S4oSK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ljqlGLWxrkkZ0/sD0dHWACtXvDxPKTi2GyGqmnWp67mkYDIrAtXr7krpubtgu90xC0C3tj7NDMAYWttcBGSCpKv7TXUBxhFg2uOP1+WTzGCqr0UlJm8cR2YISDob/xVuJWkHiqI1+k2rKHmKau45gBwKILZpeRxx16nb/6T9L6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v8tJSr1v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v8tJSr1v"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47774d3536dso14571115e9.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330958; x=1764935758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/X8/s0XmEBVcp92RiDvltwq9YKc36aF7AB3/15oKmM=;
        b=v8tJSr1vdIYJSeGzB797iropr0GbsX31uHkrXrtF8bSfsz6JN7h8PseYGtaq+lw0bP
         IpKA4Y89jbLkvifhC9fWu6SNK+wRQi1ZqlBuVLW3xuDQcAqZtZ5UrDlptCRCsWlXVSOn
         iskDuTj58juJ09ZF1LkbgS1JM5DAEM9K36syjUzVLa1lxeEpwRBIEs6paw2i+/pPlcKr
         tbG8Bo0J7xJfYdNMmzQaOS8fqh3XYurwvcnfQTh/yaO+/M+qjHpgzKOziSdQFX8SIjZ3
         ya7VAPmw9Kj9KvjcAnv3Kxfkg30ZQvKeT2axccye621cQ5aQWoLOarTG/bXvlh7Lvz2W
         DLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330958; x=1764935758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/X8/s0XmEBVcp92RiDvltwq9YKc36aF7AB3/15oKmM=;
        b=jnKxY8rq/s4DyKw9vt//dJYOEevmZB2N8AfO+f30ZMAgx7AGEbBoNjU67KXCfyaUe2
         Lsn5TAR09YPCA59Mmp7FNCJUxPaAlnkWS+FDT/af28vZUvP2n7ODiL0ufNL3PetKylu9
         UXYImZEArkIWUv4/BfYAr50Mvc0UA1Pmf4Nf0FmKFkgOlmodIriQpC0OO1OlAs2hy3+Z
         ty+u9+Rzfsji6y585x+t18bTMyjAuNCe8IdGvJHdiThaiNuWiqUIpyc5jeF8OSYV8Wq3
         oVQowYwekO3dj6ijdIWWiUu+C5TSu06DnFm8kdFtWSsXXr1BUAHPvQYnvDYXDVLRk1Fi
         sxww==
X-Forwarded-Encrypted: i=1; AJvYcCVFtYmFw7dGR5FgasYwlmlK0OtC2ImYPcVg4NZOdYpZKulD5+Fp/Kl4Lbi/UtIDCpHGridh3GZB1WM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzebOSkhguotdFmZ7u9rxEyQQurFxmkYqyxK1g0LB9aQTOfu1Yz
	YoVV+YvEvs+2KyKPQlfPqbTnzBpLHXAOxnLYYuZhLhiMoHIHVA0cu0d312akDxS57eA=
X-Gm-Gg: ASbGnctjasLaBy1rAznDkNY5ZFMxMX1JddUHWb2lx7dx1tcZtmN1djhSaolihgcnHbT
	j1mTXyyAA7CGfc+IXkE37B05ayHj3mBo/hn+9oabJyaV0e3iM4Kcq6GJxWYDzfPXtdw9mnGdFwi
	QF/J637/OpAKu7ZZoao2tBdFi36nSQxXY4imzn/+usk4OuZf4gieQHldpuzU8HxGLCWG3QVupix
	W2io5Gq5UQMUHsdsFThucPbJku4EiLor42v+lQUC7xJVU2C57MHjEKcTYjk6bzrrvnQUL6/QtsC
	A/xNWClQeozJvWBwtutUEhpMGPeKW6regzlozxYwWMLvDpJa04oYmPrTkeEh/N+40ffq3tAP4M6
	tmwZZffZWB9Ubw2sZ81o5acH/lCY9eoj7iX78AILeFy39jXY+m10ooco3wxGtBHPQU9xx0S5kpg
	olE2IKz5ds/hWYjNbJXAQD
X-Google-Smtp-Source: AGHT+IGaQRyFBvi4xXG1OSwj8+KoP6rOM24a0UhWoYDoOvAcD4TFnR9g6F/aB9eSqTg5kCu4JYRodQ==
X-Received: by 2002:a05:600c:4746:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-477c04cfa31mr284161715e9.5.1764330957915;
        Fri, 28 Nov 2025 03:55:57 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:21 +0000
Subject: [PATCH v8 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-9-4d319764cc58@linaro.org>
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

Remove hard coded bitfield extractions and shifts and replace with
ATTR_CFG_GET_FLD().

ETM4_CFG_BIT_BB was defined to give the register bit positions to
userspace, TRCCONFIGR_BB should be used in the kernel so replace it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
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

