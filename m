Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB00D33E36E
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960961; cv=none; b=jzBt9kOTqkPQa8NDRZD6Mpcsvps0C41tpyGO4Nr7Lv+nnwFFdAWgVtWQ7B+YWimPwOtnfJ2JRCmvWLgd2GfsjPUTwZ8vNhPc/a/fXCH1GJd7HPkyPEI1zW5N0qvIsFagtqz2033lKcMxpVH7m/nfvjxBymnZD7DK1QjQjlGFakY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960961; c=relaxed/simple;
	bh=PW3kIBJggwQVq6G7LiQ7p8cztUnoxekkC1BRA1rqKzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q60N0V442p9l/kdhE4588ZFcxD3cEE3hP1M/1P+Ec7sSwN0u/J2IennvKxsbQ868sKiyfCGJ9OvaXPEye/hu34Zmgwnt0IIpoLYeV3EV+IEZww3CxgaRljqoZBy/VjJOTCkZh/iY/me7d+M8MimtvNi6yO+lCyZTqJCmlN+Nv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DZ9V/sgN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZ9V/sgN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so7716535e9.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960957; x=1763565757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YETsnt5LWQuxxsuLBsy1SxsGYRqR4GjZ60Oc430mZIU=;
        b=DZ9V/sgNr3jqp66BVzq8auwCugdqdLgzUGe+Ehh0i+iDhKP1G8c45tqMC0ZtjKL9XC
         7lUw6Wyd2Rkw6YMwjQJVclLytNYcZFKDb12agvIhWikZfi8Xa4BsUgd9KSNmsQy9dfhg
         H7UljZG6x6rQAlAf0Aua69TZkB2eENmeUcfliLN3T5khAxNVQG+bghJpHHyNyhIQTDdw
         8KksCIG9gni7LJjiGvtXLxc12zGrL/yZGCcJBGvVpaP7B98+eR3LuG7pnzLy/Pi0C+tt
         eQp8mEWjln8Y+El5Ob5G9RWDjDb9nZRCRWWbioY2LCoc30Vb3/8pEeLduerHKlb2/zGO
         SnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960957; x=1763565757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YETsnt5LWQuxxsuLBsy1SxsGYRqR4GjZ60Oc430mZIU=;
        b=sCFYMLrqofu8fNDTjUIM5f7oEFFIGDpoLE5Z4uT3CDe2UD1VSkUy++eQhLPO+ktIs/
         v10igNsMazqGoZtJNKpM4KXFWVy/p22AZFAti7eOgwd9v5M+ju9WMxC3XUj89r7lHSpA
         lrU4pWEpRUDUpchAvrCRXPHE94GKR8BdCAfCPRigeGjv4fPcXyRI76gO7m1ZTEyG4KvU
         bCGnfS3D3645j6WmszneYRx/V5tvEoRBFb0VjpbkHybvBE5OrOumBvnQHvXMXU209YIZ
         W4x7Z87cozaWny2esz2aNsl5QwOjUuy5Td99+6X11CTzewoh3yHzhCmeueqwIaRrHyl7
         leDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz2gr1cfvtwYUg21HfTO9B9SCDtcXNAS3vUPm6p93cbVEbQk26S+ourjzy3bciFHixGNbeuewj7Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1XxgwYRYiiV3RobSeUzeH2Dzc1ESSZjqdoGHYbAPMfAtgdTA
	Euxqz2t60qWo1vc/f9SfqXndj9aLxhFeeGGs/h0emCAwxC2/7JTDpL1RfASq7N/pAGo=
X-Gm-Gg: ASbGncvw8WEwf+Bbv0BGSG/KHyN1Q5uh1mokmlCmROpTrtF+wvhXSkew0JzZSMutftT
	RlKTFLHGDxAt3nKoPlHrR3WYEahPzyqx5elTK3pBp+Pw76/mIU/vhihERfopKGXoe9O5XRlEYzU
	3qt4A4O/zc61GOJ8zgTyKG3RLJ3gQ9rQrFgXnGSsOqmmqduKAkNp4Cnz+JJRT0YFCpaHIu3iRiI
	eKLCM31/4svI+Rnrqut5khElfGbC5oUDPpVa51VW3rGFtQvxH5JYrbOWPxkU05rj5PPHpdVVsZh
	NGAfDjeDOdzHoaktJc8UWarwtLxEiGMveuUc05eArYR77B7dpVIrrrYsLjqyImAmYghatp5EDlZ
	91sLCUpK3XppBs1rm0jrk0AC1HnZVZRFwkTuogpbDDigc219Ogd3orNpy6EXuYfBZv371QtSnHX
	+NaKg+iAhsXUoMWlfqjiQE
X-Google-Smtp-Source: AGHT+IGkUdJ1tT6maJPY0NlY8NR0Mlq7ejN67NI2u5oaHXO9CTIjlAkj6ENeRyhSR6+QoDIl3mZfwA==
X-Received: by 2002:a5d:5f50:0:b0:42b:3661:305c with SMTP id ffacd0b85a97d-42b4bdce2damr2544670f8f.55.1762960957062;
        Wed, 12 Nov 2025 07:22:37 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:36 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:15 +0000
Subject: [PATCH v4 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-9-165ba21401dc@linaro.org>
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

Remove hard coded bitfield extractions and shifts and replace with
ATTR_CFG_GET_FLD().

ETM4_CFG_BIT_BB was defined to give the register bit positions to
userspace, TRCCONFIGR_BB should be used in the kernel so replace it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 380a7840adb8..1aa0357a5ce7 100644
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
@@ -789,17 +790,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
@@ -819,17 +820,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
@@ -840,26 +841,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
+	if (ATTR_CFG_GET_FLD(attr, configid)) {
+		cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+		preset = ATTR_CFG_GET_FLD(attr, preset);
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
 	}
 
 	/* branch broadcast - enable if selected and supported */
-	if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
+	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!drvdata->trcbb) {
 			/*
 			 * Missing BB support could cause silent decode errors
@@ -868,7 +865,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			ret = -EINVAL;
 			goto out;
 		} else {
-			config->cfg |= BIT(ETM4_CFG_BIT_BB);
+			config->cfg |= TRCCONFIGR_BB;
 		}
 	}
 
@@ -1104,11 +1101,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
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

