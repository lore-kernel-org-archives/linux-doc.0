Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43631D38A
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154672; cv=none; b=sD0hgpnKRbPqgwBl4sLXJeb0o+hHqW1EtllvdwOEpC4Zvxjqzf82+myQIvuD2/r3PyfYot0kceyKUhTH2R02RSD5ksZu4zBXQdfnb7ZNmeZvZTDAuSV2iwcyTyunYrlT9OQzMT8VZE0imORoHlrF+xYWS67wkXSLfRc89mn7GKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154672; c=relaxed/simple;
	bh=89tbL7i+TdjrQPilnH/h2swnrzMhn3VgtWNa5TaRMz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzod1A3+bZ3ufW8qH1b1z0930/tYOKvxQ9eAlZ/qCfLBnpBa+xwrRTox3MDInxVvTXkXOSWa0IenN8xCnwL0r8ByaP6FY3iYxUDBeIT2JTWHrfvn3Ebs8an2r0dvf52w3guf1NyPIcQvRnKhUwP/9A7p+eR1qxuQcFG/5tYyPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAVhIWsD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAVhIWsD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso6023555e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154666; x=1764759466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwy1SauvpBsKdoqKcjNK7vrv6yyN6VbL2cB6r1BLjkY=;
        b=nAVhIWsDEVdJPpTJH1wCIdmThbevE0IySGPrM5/uz4LefUz/L81cVBV/6NoOWmlCyl
         wWxxZMp1cR9D/dm7hx/7FFsdBz8LowDos+Ch5Arvv/y7CbsNzNVccp/CllPPXXMfYCKs
         kYd6++f4YDYopFiTGepJ8qDDe7jPDsnoFEXc4/LGU6g6EuAbGymeNCF0PuX7R3qIwgLg
         J7RtbAPqQrDKtEedvaqMknBjddIEP7nBJ8AKj1RY3ZTDAsm4L7yflxb/OuVRoYtX8VSx
         uhL4EgI2iytFBcJrRGDSV2qbqPob7YtqSr+8atJo3SPOyNf9KuxAcDhQgtqMXkUd3uZD
         5++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154666; x=1764759466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iwy1SauvpBsKdoqKcjNK7vrv6yyN6VbL2cB6r1BLjkY=;
        b=K19EemyXpwXLriwNdz5ILcU65LJRPpKnySZ8/T1k+JMdUYd8gMDuA0CjCf9UPYMh+g
         dSigEpYnbhEbs+h11f+toYFnoWQVNy9qe+wjHte4c36ljYZZJv+G/7y1bG4ITt7cUR7L
         SiMIh0KsYNmgTr5KrJVGVnjjw6y+IZqeVc9ZjsXIaCXQjtxibtuv1EdMScH9FPZh2gWb
         YL/8ZJOGtFFZdGL1cKz0hDOxOr7u4X6U6ZqNX0XJ+h1dh5T3NwCb9pt7ypby4ohjYnDF
         aX85I7x6Kw80J/U8rECspnuYDpLF2R+eDyReiMryJ13F2ccxaFFv9YwzADU1SREVRPDB
         56dg==
X-Forwarded-Encrypted: i=1; AJvYcCX4SES7Dd8iLDNBgFqJGyUIL0uow0zDYubl1XipEd6Pjwt9XaEkFbvXtXOhE4FE3b58jbo3k7czdCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxXOl8rEcfkB0LbuHUDTA0qfedckvpJcfsgq0rFmI0g8pncjM6
	AcrsHkmaEimOulaNU9fHtIcImfV1h+IoEfweEP4NKb68/UFUKLGddPeBUCqYv1GHGBE=
X-Gm-Gg: ASbGncteohAoltEK6hQExe7ql1SDCGCZ69QQKLYvEdFB++dlAm/WlMHzA6bqsD4H9a6
	T8OZLTxFfkixcxKrsgBc/Z9Oxr5IIAfVoaJt9dRnlDtz9dsmBXdy+HB9KcLiHlMZxt/6VwhQUgB
	9MYC/8o/wohoNIPP046HkeLJoSZHMIjjgAordOSxa11mPsAjhimQDohumgKPgZ5wfSzk69RiWLN
	WDgMOkzsT6xaYK2/Auy15I5Z7xYvYjwx2Fm0ayPkczkTYAyOEMmrCXszVtax9Dcsh/T7tTZ0NXd
	G1eML15IkfA46p0JfC/Q0VjD7iJmjWF0mhS+GqRMKMaO9psk87X+asWU1gQEOEd5YUvbnyX96kr
	n+wsmKpAaRjSwuAIsXNX7k2J8SYLcnH6J/PUaCahbc9hPJqAOa2nOjVeigs7NN6zfZPDb7vUa03
	CaxnTepZOaJC7fMg2C+tl4
X-Google-Smtp-Source: AGHT+IHtn8HMaA0Echf9v97EK95rBxusNCmaEB6z8oTn86z7AlsjYTu+w3WdhP9odmi/RB6ItLeU6Q==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr212463515e9.6.1764154666538;
        Wed, 26 Nov 2025 02:57:46 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:34 +0000
Subject: [PATCH v7 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-5-7fae5e0e5e16@linaro.org>
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

This allows us to define and consume them in a unified way in later
commits.

A lot of the existing code has open coded bit shifts or direct usage of
whole config values which is error prone and hides which bits are in use
and which are free.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
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

