Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2BE33A026
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960957; cv=none; b=uU0J1IgwsimQdfEOM078sEimehe5GgMAKrriWvnbiXshbe0GGyh3MsdQXcXdGQfz0d48ZdAj9bBpNk+kvNKQD8k1ziS23U3wehJd7eSVeSOeWXL8h0rYFPraiiK/zA75cJUddnW9AXbl2QCHkneBvpTBmWHq7J77m5FC7tknxpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960957; c=relaxed/simple;
	bh=TLWZEcPkUQ1LuudIRJ1tUEAv2V1B6bDgYPEzB+p3ndQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOPrv/kTAE6abHoJGlkogpyo24HRnhqCPbdO6uACurnQejZk6uZ3AiW46+BYYnb70bBlYFjFT6aAoZv9cQesh8Bqay6FgU6KIZ57oLJVikzYetWLeh4KB67AKXaoBgvRXideNsW1Mo1Bo7nF1+whhh6cNG+dtEn34F5G1nA18po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GnL0fCgN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GnL0fCgN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3720e58eso887148f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960953; x=1763565753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oy/vEIMWCNxmvdfWxz9XMqAUZ1LIkGJ8bknBvSZDaPw=;
        b=GnL0fCgNCFiOG5wUxOZVOq0JNYLl99N2/8c7fZtBIBKVa/rPeRdkeD4JarlbxqMLO8
         v9Agytlbc+oWq59GOK1I+45+/q+4KWTpWa0/aMjc15DQ3gZgikNfihum/PqH12TrfcUl
         OEw36bkN5TFFpjDv7ijHXcGI3K2ITm5+9lfybuBqknwXcztqkB2ybHaaXnx7dHg35tnh
         RC1+FSo1JrAQrGOCcwoCQjIZ2Zi5INa3vymzGsdmRh67avRG7SwyQnpq/hn7mpSh3wor
         dYzdqdlH3Ub188nYOsvtN6bc9ssp2QJlbaDh1Xn/KZiwN2spQjUlNWIHu3Uqc/ipIcx1
         TqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960953; x=1763565753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oy/vEIMWCNxmvdfWxz9XMqAUZ1LIkGJ8bknBvSZDaPw=;
        b=efa/DAZ8Fn/LmNochPfHHXDsyjiqb4AcjdYUvT2S/6ayLFuHn/+DjaNnlQrHRPGmUa
         v8I2sFBXOgE5s6EdoBiIwpGmwNE/QwwLs2bAgAFXS0CnSn5sSiOq3Rd2UB6fezPf2DzL
         MotOruBFufSSK3t47xDe1FSC0e5ESAT/HpLuv2KXbqsh7zog9qSf+fUIwPkhPeIw2a/B
         mbOL7sz5pyZFYiDUCKy3fcaRFhI8ezBmRnRURVKGiiUAYEJs2SczuZcpjE6V8/tUZNoE
         LecFkE0kpW9jGW3wv79YnWe10qLaLVVrEM7mnLq1Q31ErGLchrOSL8NNXPYSJCybU7BV
         7acQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4qljx4ONuPqZ7N7fXfxhuBdTkZjki31SpM6vbXcvirMsKBvg4n7NiV1hDvGQC38UKGU31cRqD6NA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHIPPLRfEwjN8PBqlGw8P/U+EfG/9SQfQnHtjxmKcbxZlejKEE
	zkAF3Wy3tMITVELLLBRHwjFrPtGD7DYsqoTG2QO5xdpmh7sicfmLk+Z5rCwIIOAQOcw=
X-Gm-Gg: ASbGncsVtewu5VBoNTfRvo0q6Cax/XH26JQGullaRE005VAx/yVt/VDApoalcKgW5J+
	Ns2I9ZHhgmFi6iqbDAEdWN14MLQ9Ffgq9E5zdfkVzu0tJQT7QtPjR+O1MXwxiHjScZ+xSyyPHTU
	AdLVpYFi9Rxv2j4lfxOOSKjtZGNsEKcGN/a5lR3GoA0u1niAlZN37IqwvXYOkkXs3snuvpTKS4y
	LlYfemu6i7QWtM+zLj3KHCNq5s38ve8JmBtUBaJv8fY/0pakZGV2Cg5FMJeKbYdbQvziA47IWCD
	4f3oaBX9Hzrs26pY7X5MVBsyB4RUXzUl3ivrdKY0G6Jg/czsoEJ1kjOJqWmfMNyrVT5N0tzM8Z2
	nQbcleOPJX98yeO87gJwDIjnHF17PqNteuVKjyrYMzezkRzOTTbdJqHMxfDe9xksiJLPmG5gSHH
	yafU8YjUb+1A==
X-Google-Smtp-Source: AGHT+IFq9p78WOUWmhrHEtusd6G6TUySqV0Pm+H4B4or80xw+cl5zLOKvMpvaFJz7M7ANx6M64mshw==
X-Received: by 2002:a05:6000:3106:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-42b4bdb947amr2650518f8f.43.1762960953526;
        Wed, 12 Nov 2025 07:22:33 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:11 +0000
Subject: [PATCH v4 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-5-165ba21401dc@linaro.org>
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

This allows us to define and consume them in a unified way in later
commits.

A lot of the existing code has open coded bit shifts or direct usage of
whole config values which is error prone and hides which bits are in use
and which are free.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++---------
 drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 91132abca244..d19e2568a0d1 100644
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
@@ -54,22 +55,21 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
  * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
  * now take them as general formats and apply on all ETMs.
  */
-PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
-PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
+GEN_PMU_FORMAT_ATTR(branch_broadcast);
+GEN_PMU_FORMAT_ATTR(cycacc);
 /* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
-PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
+GEN_PMU_FORMAT_ATTR(contextid1);
 /* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
-PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
-PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
-PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
+GEN_PMU_FORMAT_ATTR(contextid2);
+GEN_PMU_FORMAT_ATTR(timestamp);
+GEN_PMU_FORMAT_ATTR(retstack);
 /* preset - if sink ID is used as a configuration selector */
-PMU_FORMAT_ATTR(preset,		"config:0-3");
+GEN_PMU_FORMAT_ATTR(preset);
 /* Sink ID - same for all ETMs */
-PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
+GEN_PMU_FORMAT_ATTR(sinkid);
 /* config ID - set if a system configuration is selected */
-PMU_FORMAT_ATTR(configid,	"config2:32-63");
-PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
-
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

