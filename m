Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468E366573
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569108; cv=none; b=GFXN9l4p7lY/WxVJJgainOQdJs9obid882YrRlydtIPGVUaQfPNY9b497vMdbXZQN4k6n1ZvzS0xcZrDqSGHvpPrXnUZOJHJMkcs4ivYFCzGMBZHaZrSyRSPXgK+padSdhpYOMspakgHDuoCtUWfw2rIibzmnfzuhKQhu9nGABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569108; c=relaxed/simple;
	bh=4A5pPkwY6hQX19oWXUFsatXtn/EWeIfupLOLsNPmp48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EeDaMmBWKf969bejXexSUbmtw7P/tSyvxmzRyoIiN05iNSy3nSe29mpVFqCnqRViH15pcPG4gX2r4wcQeGE+D582hHOEYYdM5tYluxALAYw9kWOviOSTopm/meIURjSzVmjNf+Bv1OnriwIGBDA3y3hwGXeWxDNQK7JYJ8K+pec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXdN0uUq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXdN0uUq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47755de027eso47184765e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569104; x=1764173904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CqXsiWuG8ftmN0OUcZwJJmX94veikCNwJH3neNDlXs=;
        b=TXdN0uUq/wydNLokDwd1XBp1/g6+f38WZOy06OHqgtjJudKZe4CWpF6YNBtmNzrK/o
         HKJptY6EGR+vVz073yFZsTBnbexkaywHQHDSqkXQ3/QGgDPhUEuUz4fsOxpWd7wCna50
         7eZir8sLPwAuBZUzbeq8K8sS7Pna8m/1BFXwpKa7wAmCZ7322yzWF9InSJuUdNGmKemk
         6xgwfwmhUhWYAjSeWETDV3q/CoxYZZeb5+YUZmO6dDcHXlqyz10PhJKNtOBk25MBUj3X
         +qk6YesrH3bkln7UKJkgGF8Lyvn7PgClv1i6qRXdL5ZU6vPO47yRujaQKxW6L7CLmcIP
         mhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569104; x=1764173904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9CqXsiWuG8ftmN0OUcZwJJmX94veikCNwJH3neNDlXs=;
        b=nl49oMl40i3wKahILs8208avSVLRebH+rqmhCU5yeauXyovKaQ3PbQpwigKl234ZIw
         lCJoNQYnnJHoOSLPHPMNato+ACraOOst4vg46wg0SVm+9F9uH4w4R0nkNCyL38qKSV7b
         FMGDBTWsASiB6LqXoloUJyGAaGCc/7h0xrmFC/15nWpcwIj2W5d4MAdWYEoja9nFe3Co
         fK6ZP31zQFsxZj1jffQiNi14kkUaV88uv/RDneEi3+55ps3RfLD9mNUbDR2am1V3WrVS
         qyXKuv6sfmjDDX61y5zb1zZLCGXiO1H2mF6zcRV5N0bLQ+Uk9hoJC6lfOraqOxjzNrN9
         mP1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOWcPopGOUlHY5FeLxl1PPmK3oap1DFs4UyVRH/Tgip/SgzjanB5SOQBRWvSUpvH/FO4M2pzjcOXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysIIR5mVnw5mKPctysVuRsthuYp/7bqkx+l/gn9P69dYXS+N7F
	hwQ4N8bCMeyKlHg7esCI0LDqw8DNEa5upFM9AyXtR8UsFdP+9L03T+VhfQEmPbWiN0M=
X-Gm-Gg: ASbGnctYNM7SPR9k1L9rHgFeK2s5MIQJROD8Q62jINXbWyLhM4Op7yAv85cuZfjulC3
	QwizecNNtSq0AO7cxyzp4Kkxi/a5P6P6kqlbFMz4VNGXoICQ0zk4nUIzvyOEbzrkEVXZHuSLxF/
	qHXDY8pkcK5dahFVpjHGGqtOvJjXkf6rvh+7ZlMgtVLUhBV/P/qZjy54Q8yyGX3cjW/GthjceC+
	Ds881lVSBh5hBPwJGJdOj9dy4IJDHPW/h/NsYF1cFdQ6c1jqdBJasTqzZn8EkXhrAdMXj5Y7+Ho
	2Dl+9aJccp4UBQn44HmZkpZ/yuevxh7cvznsOTUzBGfJaEV4R1O+yE3JZ/JP9Uf4OT8DCbdXpHO
	fBdfhZkmIDPfJ5gJH3/pxX8TIsCcvanCKApKEzMQ6uFuBTtdb1mnDqXryuuOUelO/XUUB3pQKmE
	o15tVSjO5JDr5WxbBeDl3nwa4MVn1/dEL5mSUqrcMeuA==
X-Google-Smtp-Source: AGHT+IFIpxMsXtL8Djl2C/kcPjmViN58tbjJ6XcizBi2clh7TDM8Exuf/J+ojhsvo8EkMvz/b7GLZw==
X-Received: by 2002:a05:600c:3b12:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4778fe89ed9mr164685515e9.28.1763569103694;
        Wed, 19 Nov 2025 08:18:23 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:01 +0000
Subject: [PATCH v6 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-5-740d24a29e51@linaro.org>
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

This allows us to define and consume them in a unified way in later
commits.

A lot of the existing code has open coded bit shifts or direct usage of
whole config values which is error prone and hides which bits are in use
and which are free.

Reviewed-by: Leo Yan <leo.yan@arm.com>
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

