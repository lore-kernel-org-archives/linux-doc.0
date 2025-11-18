Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F403730E1
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483301; cv=none; b=aF15pzTGJ6zmYZGkYn2TepkG85ObPnC2Cd6jD06GHHKbUCWxHM2Qybe4mJTNV8Q5+XKXlbn4bWj+z6MK8kJMNFP4Gcv4+RgBs0/np6b66bgNDHfoqQ7sBVWQUYvm1j/yKBH8WEZUISjt4smxvNuEzVYxkAXgtOVwXonCpwyCzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483301; c=relaxed/simple;
	bh=d1VZne62bsL7f4YK6muj4cKkqo5VmJzbhqU/Ay9dgxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfVFfJ9K9hdfyHfizTki/3kXUtJqGzN+Wvm5O4WSfsjHSWeHKl5At4gea9UUuZ2SreZ2//OJ8uBvri1xkcZgSBmtH65SRRtebvEnFompNHqO6E3vHrVWFMnyc1l/TOJQLb38SEPjhy/Pm3q0Tijuk8XV5WQgy8kMLoqtVEIwPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lidRHep0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lidRHep0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso25110795e9.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483297; x=1764088097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48JreFr5BaTMOPMEs2r/FtKXuXZRpdyc8fhVXjm2c3w=;
        b=lidRHep0ojviZIz+NsqCUia52I3+DH/uDRMbuXMqhqOtQPo54YkgJfKJmP8uwjP9fy
         eWi+tbbVnPqPU+DvGWFJtykX68CQ2w/mTF0rdzWCtKjU5DAIU64yo5V5sgVPnuvjIpZ2
         T0E2nGs3WnfqI0ozULrRXPax+EQ1lViDoSB3CyfOneAnNxDbtDJnyJRDIVwAeSfWoKDH
         YQEkJMGxv2duFeT4t1/Wv4mWNEUOokGROTP60yYX4NiAMHiqTVM5ehIlMMcOB/+X7ut4
         chC3L0AWJXRiUxy08guRhn8fpU3C8XVsqUnz21v5vr229sM2xnmhGjDNqMk1szdRzEjU
         OfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483297; x=1764088097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=48JreFr5BaTMOPMEs2r/FtKXuXZRpdyc8fhVXjm2c3w=;
        b=Dj1UjYJ4Ey3fMB5wwLDgZOm9ltly8T6W39BRGB0mZBHpYK0mCR6knh3f9i1Lcpg5rN
         tCvJ8iKhAYi0sSxnlayklfUwFULsdyKEPXmLVoW43+vP9Y8aOLcEytPGTuJ/3hHVLYr4
         ZyefVg8u+MDbVbzuVoLy3QGFFCuhaLsR8KSEJeDx8HDYRDRNew2Uco8FsVLYoUNiO1tl
         YV+I5nw53Jq+DdzmkQE3WlYRf1OYEh6moYjjZBuaT65tgOaKsvRGA/WLZPlq1ycUUK9+
         OZA1kwubGiTaYt5Sbq/khV+XXiqaRfW7f/4snMxdc6EuF8DgePEZ2FjpQCVNJxsBdzd7
         7bcw==
X-Forwarded-Encrypted: i=1; AJvYcCUPdVXyAtgwE57/pTFCwcbrwN6mRmmuJLQ93h+TwUNpvm9StRnsfrZaDdsXN53aS7FK95PLJ8LIH5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyifJxjZUzABX6mGWmWH4sPj75QofrXKesft9v7QQ2gFSpehyzg
	42vtXTSUdcLvO79yDoNM4ndzpQz7Ah56tIP98wUS1aO9bJJdTL2HaJjuB2uAivCYgFs=
X-Gm-Gg: ASbGncvjeqELzJwvRcYq6q7oB/7d4tRxtu38cmiaJgHQopoTwQgluxBc9cnnGtV7mNM
	L7Inhk7ws+1VHPWJ+LoYVrQVb/MAU/91Qyea88D76rCcWHHcFdSYkuv1xbxheeaEkJh/jOPm8x3
	UF2C1Hak+OseVaY9F/w9mAs/tEy7pD6ewFFmrk2pz7zfGj2iglEdPiPQWCc9R1Z0+cWUwZJs8nS
	GcdCEYmZIas17qHwQrDPuD2Zd+QJ4msnx+6AXf/+HX6x3aATCI3iD6AacNzha8szgGTKjDM2sn7
	0ud/1dtYo/zMGpHvqwLEhQC53/c70/OsCiJ8CEcr2BeDRTR04/LNwGqWGV9nzgpueoLWkSgHuFo
	52/4Q2tHxElf4AUUJaoYU8o8RN0hgYc7bsA0rhBolbKROKEfaSm7P2m9cCF9DmuMXCmJAlVklaK
	ORjZs5Y4H71ipMGTUfb2HYP1vFsxBuwKU=
X-Google-Smtp-Source: AGHT+IGSuixkn6OuYVtzSeJQdoPs5+G1QrCaXWxHvrng8vSHtjfxGmf2OhXIq27Lrw6E3F/PTbSNaQ==
X-Received: by 2002:a05:600c:1f91:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4778fe9aaadmr152880415e9.23.1763483297570;
        Tue, 18 Nov 2025 08:28:17 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:16 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:55 +0000
Subject: [PATCH v5 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-5-82efd7b1a751@linaro.org>
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

This allows us to define and consume them in a unified way in later
commits.

A lot of the existing code has open coded bit shifts or direct usage of
whole config values which is error prone and hides which bits are in use
and which are free.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++---------
 drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index faebd7822a77..28f1bfc4579f 100644
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

