Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4903277B8
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330958; cv=none; b=BP5DD5kEsTZuv2lO+WYWXf8X8EZ1IZzRra33QxweIt70JAEswefHFy6HqF7YJN7rRE/0MsJypz3a67WYRwNHuS5LVytGTXuhvOaSctiP3AIIzltzbxieLK8EsW7Be9k8MDs9mhMaxDeP061fpGynhr9tSt3ana8HR61AVQe3CW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330958; c=relaxed/simple;
	bh=GdnbucpMituGxk2oV8w7k+/3o/1bQSLSJQJgL5Aed1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYENFpQTp64ohMED0L/ffkExpZhg980jL100/x+Y22immrDIllyMl+hP8jfhP3WkAilmIohQ+HiK25gw0vsJl2OoSPKXt5Pp+kxb7TaYZNkCPxHZjzT+qk26C+Bm9SBPlFTuJrK9KdqVm3e6CRGlZc14HRXlw95Ka0TpTZJJ3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNY+BTLN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNY+BTLN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so11975515e9.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330954; x=1764935754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pr4nDdci8UOVifXcpprI4H7jqJCIQKXg1zzthB2SzVs=;
        b=bNY+BTLNcXQ+a4U9QKSn6D3RMKlrUxLWZD2YOnSuFIR30q4OhN+ualsQmyFIF6m879
         J1d8kFPIX7dfSFiwSCID+gmmO3H+Sn5ruAN6sQzC9LGDPiAp199crp/DszzNvabxXXPc
         E7FtN1cotZPfok8R2bEFjVaG8TJm9r6gEseWNcFCVK2R4f/1KbBIwsvAf9lO0PpluCGi
         EW1oep/hyZXmV4I/liWlKC3kzoq4OsBmAMLb3yNV3Aatk6RWB4o/TXUtP7FYxvXetLB8
         NRjpkJ+vAhbZxmJkjue8pvNN08Dn2/NpWO8pMbfEJ39nJHGTHl9wdqm7lBruVBTfqxIO
         AsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330954; x=1764935754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pr4nDdci8UOVifXcpprI4H7jqJCIQKXg1zzthB2SzVs=;
        b=Ahkz/6FVoZ8HFLrlTV/38kNt/UFD9ylDXgaY7oVw+o1XsEMXMv6IMGtNPs0p+ayQ/z
         YyMpfRTj0/KEUKxY2ll+jZjiSQ8FUjGBky9rmCU/mVZXWbbU1Chrs/C8dWj32Ta0bTbT
         g4ZV/1ilsC+pHY7GmiQGNOojZEpF0P+Zqm1oTndijxImwHQ8hLpdPy40479qQ8bFJGPF
         qKrPkSFTVEDKbpIjYZS0SsFX8sh+ho+OrYKmHSny1uySOT1aMHOtCQQZKssT2XkT+fje
         mbPC2jlTHhlDSjlvoP6TF/EspZkVV/DON8mLaHF/E1A7avoAXB8uqVWQvNlHmkTInycB
         75zg==
X-Forwarded-Encrypted: i=1; AJvYcCUPlvNg3v8ovR5bC8UOTpkjQU0DxzxxPGtRueCtKtkgodyHa/wM5ehzOmR5+hpH+UBS0XsU0bCgaHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzorEPTsyXhrXk74j9GKZRCsxQlbXJ3FRWYqQg5w/wqz0zEEOIM
	NMPMVj3+zNv8gMFG/zzuyNpMgsP3VJyd92Cy1bXiHgudbg0CghzO53aNOyH9EPp9K3Y=
X-Gm-Gg: ASbGnctu8pEdShUQQGsEfwokw1aYGqTmxF8K8Q2Q/3oWX9fq3uGySTmwPWnIwiD5o+u
	qAEVeVXqpZ4ANzPoWGpMUXMPgnDnESr5nDoFrWx+OTvMYUvkVoo966+uG/O8zcjDusUOlZqGbBl
	dglBkiUhs6odr5PxFR0avwef87ScG7T2bFIaaTJXMPNYAtrLvzaBgf9PqVvoR4/ri6Hzdqd7IZp
	G2Pb2/eurxG5bYkRAmZvld6k+dYofYXd98Fxmf391tJjmyojQjTnIWOLuf1iQWtTCDvRbHT7j0i
	MX4ZU6GIwG3JchqH/PSb0dlEOjlNqQpiWlt4kBz+kduf1anZkRkozjct5cBl7DoLS9K8Py5C/Qa
	VSCwL7dCY24N0P6WDymmFhDljAXt3+jmn+9e3jNIOB3QjDSR2TPjCDwif5uCZ9goV8VI5IdqwlG
	/SKwKLaCdIEeEmNltd5hYwvfJlCutKR00=
X-Google-Smtp-Source: AGHT+IH/3XpT4A1WSZceDWrLpY0kj8ZW7oDMztvnIeSaGTU3X3bJPn/FUVhbtHZa44BblazZTcRyrQ==
X-Received: by 2002:a05:600c:1c19:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-47904b10379mr190183005e9.19.1764330954175;
        Fri, 28 Nov 2025 03:55:54 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:17 +0000
Subject: [PATCH v8 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-5-4d319764cc58@linaro.org>
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

This allows us to define and consume them in a unified way in later
commits.

A lot of the existing code has open coded bit shifts or direct usage of
whole config values which is error prone and hides which bits are in use
and which are free.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 21 ++++++++--------
 drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 3805282b97e8..bf4b105e0f41 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/stringhash.h>
@@ -50,22 +51,22 @@ struct etm_ctxt {
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
-PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
-PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
-PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
-PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
+GEN_PMU_FORMAT_ATTR(cycacc);
+GEN_PMU_FORMAT_ATTR(timestamp);
+GEN_PMU_FORMAT_ATTR(retstack);
+GEN_PMU_FORMAT_ATTR(sinkid);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
-PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
+GEN_PMU_FORMAT_ATTR(branch_broadcast);
 /* contextid1 enables tracing CONTEXTIDR_EL1*/
-PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
+GEN_PMU_FORMAT_ATTR(contextid1);
 /* contextid2 enables tracing CONTEXTIDR_EL2*/
-PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
+GEN_PMU_FORMAT_ATTR(contextid2);
 /* preset - if sink ID is used as a configuration selector */
-PMU_FORMAT_ATTR(preset,		"config:0-3");
+GEN_PMU_FORMAT_ATTR(preset);
 /* config ID - set if a system configuration is selected */
-PMU_FORMAT_ATTR(configid,	"config2:32-63");
-PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
+GEN_PMU_FORMAT_ATTR(configid);
+GEN_PMU_FORMAT_ATTR(cc_threshold);
 
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 5febbcdb8696..c794087a0e99 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -20,6 +20,37 @@ struct cscfg_config_desc;
  */
 #define ETM_ADDR_CMP_MAX	8
 
+#define ATTR_CFG_FLD_preset_CFG			config
+#define ATTR_CFG_FLD_preset_LO			0
+#define ATTR_CFG_FLD_preset_HI			3
+#define ATTR_CFG_FLD_branch_broadcast_CFG	config
+#define ATTR_CFG_FLD_branch_broadcast_LO	8
+#define ATTR_CFG_FLD_branch_broadcast_HI	8
+#define ATTR_CFG_FLD_cycacc_CFG			config
+#define ATTR_CFG_FLD_cycacc_LO			12
+#define ATTR_CFG_FLD_cycacc_HI			12
+#define ATTR_CFG_FLD_contextid1_CFG		config
+#define ATTR_CFG_FLD_contextid1_LO		14
+#define ATTR_CFG_FLD_contextid1_HI		14
+#define ATTR_CFG_FLD_contextid2_CFG		config
+#define ATTR_CFG_FLD_contextid2_LO		15
+#define ATTR_CFG_FLD_contextid2_HI		15
+#define ATTR_CFG_FLD_timestamp_CFG		config
+#define ATTR_CFG_FLD_timestamp_LO		28
+#define ATTR_CFG_FLD_timestamp_HI		28
+#define ATTR_CFG_FLD_retstack_CFG		config
+#define ATTR_CFG_FLD_retstack_LO		29
+#define ATTR_CFG_FLD_retstack_HI		29
+#define ATTR_CFG_FLD_sinkid_CFG			config2
+#define ATTR_CFG_FLD_sinkid_LO			0
+#define ATTR_CFG_FLD_sinkid_HI			31
+#define ATTR_CFG_FLD_configid_CFG		config2
+#define ATTR_CFG_FLD_configid_LO		32
+#define ATTR_CFG_FLD_configid_HI		63
+#define ATTR_CFG_FLD_cc_threshold_CFG		config3
+#define ATTR_CFG_FLD_cc_threshold_LO		0
+#define ATTR_CFG_FLD_cc_threshold_HI		11
+
 /**
  * struct etm_filter - single instruction range or start/stop configuration.
  * @start_addr:	The address to start tracing on.

-- 
2.34.1

