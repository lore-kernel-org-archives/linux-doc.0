Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCAA2DEA6F
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904769; cv=none; b=VfoM5KqY9TUelZfvTQmwTfD+etCAgKVYhnXrN+UCoB9ZgeJ/+QeEYID1tcWep3BG/q6dMc3aocymxSIkWyTl7C/fDF8KZkKcke8KNKSEWEtE+xFuVH5i3N4/4//vqi6E6IPheeN/MPk2P8hS/mhsGIkOaDp7jEG0vjz477c1Y80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904769; c=relaxed/simple;
	bh=wpvKm03JgBns8SErxtyGsvGNWNV6pSmX+F+F8Bl1AxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXF19lBef0bX5H3eY3CY3Vc65X1JZQm1rJJoTFjvG5zq0sLxjJ4ev1Hd6RO9tX4E1FHJylIk38ZzDM/FCBoL0Htcf0cvJz7laf9yfsoc7VFZdu/QrYlcSnHc7SZgSs5wGNDPUhJYAd0bozxze9SXep3UjbKrrVJuzxZSm7NV+Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RYtj4f+E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RYtj4f+E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-458baf449cbso40296555e9.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904765; x=1755509565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wY/wlxwOBKXlk5tbUQnKyA0OI06WJcUCTjg68F176k=;
        b=RYtj4f+EAXTN9pt/1sGOhvJj6fWfqjMgHUWdjrqQCaGpcmrgpNFFvcpQtCz0febv5z
         U86qJBdkRipOj0mjipLi30Dr9f0EqWB5tRYYWJDu0LI5J6bwmOZOVC1yP71JINEYNzY4
         Sp2cbc/OiUruq+CdGzYxBR6AKho2j8mdeHB/iGzzqpCxBvU1BWmWfkdXNtmP7sIzIZqX
         yGcxWWscysoxVr+aT+N0Xk6ozLu9XL7QuYmgugByXPFAF5W/6QxqRmvGUbYxUzD2KOVM
         qwcQ4ysrmaxzC8iC1z0nz4B4pEmynCOrr0OcxH/4A5FEmk4Qo0v8C7+ddvc7MgUdeFLG
         6DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904765; x=1755509565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wY/wlxwOBKXlk5tbUQnKyA0OI06WJcUCTjg68F176k=;
        b=td2/ObqgRvnszzaaIQXUoz5uji5LTlgkjFPYjfPIwThzVK4E9rxp/GsD0qD0Be+6JI
         3HCXWk264UuCajShvBUZ/rDzXHZRkT4wbJBwh+DemWu0cphs0fDPIEVKEJoi6VXyDaDY
         CRrlbt2NhPPjy3mPwHLUubWTZ88i3ZJpCbbnZBaRiHzhdMIll0f4IqMzPWQq6LTFDL5E
         iiANQP96VbkhKrJvSuWiJorCgpfDUyPJh895wyaPZ7FqnCz9xaBlso/jO0op0NwibAy8
         o73qm4s3macurqweI5NInXJ8/EIWdxY1FWqkkdQaaErOMn3cWkr5PMdHyA1llnW+IYSo
         nK8g==
X-Forwarded-Encrypted: i=1; AJvYcCW5pgTC6fdIrClijircKApBI2ru9ggzfL2D92I3v8lkLcaIFII0rz/AujuhiB+Aq8wYACYnWTvQ+S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE3xfwsF0HzBDQDyoqfT8feiFj+XpGQr61aJs/H2+crqIfMp4/
	vU6tewiqUCkZMALrB7gAjBXwCTsCbHPVaf3PMyU6yeH93f4gnHG5DVWmYqGkq9GbAIE=
X-Gm-Gg: ASbGncs5vYQR7sfv6iycuaNDNUC32ui8zG2xIg9+ApQB2AX+8t4dzNDAMaAH4XQDon8
	iVa/wV+/NWLkA7IqPArxi32JSflgscNkThF9odcNX02sAlNBgWn/rdCqvSaaJpVnVMbUm7Nji6L
	WeLl+AEkmaZ/vLd96/a1hTuclBKTI5iunKjD78xZ3wkLRqdrG1nfuSB1d/FM/iPq1II3RDKyFLQ
	udodC65twntohorgHBmFFB66y/r+hj6J9w865jQte1qzcBsCtwuwEelr6ZF8j/QPLqaruyFQhy1
	Ng16IX9MlNoDkOU1xN7luYqbPFBEbbtARwPC70VHNCdNaguzbrG0rBoVQclusCAy47P8b5DB07A
	dLT7gg5twCq1C8awNfs5n7nfKC6zlkFw=
X-Google-Smtp-Source: AGHT+IF8WeH/oU2owgkUTiVQJ1UjH7XhvycJlh2P4qsYEEoxnO+VLtTmDk7n5fyagJVi0TbZzJM7jA==
X-Received: by 2002:a05:600c:4588:b0:458:f70d:ebdd with SMTP id 5b1f17b1804b1-459f4f9b74cmr107921215e9.16.1754904765407;
        Mon, 11 Aug 2025 02:32:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:10 +0100
Subject: [PATCH 5/6] coresight: Add format attribute for setting the
 timestamp interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-5-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Timestamps are currently emitted at the maximum rate possible, which is
much too frequent for most use cases. Add an attribute to be able to set
the interval. Granular control is not required, so save space in the
config by interpreting it as 2 ^ ts_interval. And then 4 bits (0 - 15) is
enough to set the interval to be larger than the existing SYNC timestamp
interval.

No sysfs file is needed for this attribute because counter generated
timestamps are only configured for Perf mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  6 +++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  6 ++++++
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba..c28ed6e63550 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/init.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
@@ -21,6 +22,7 @@
 
 #include "coresight-config.h"
 #include "coresight-etm-perf.h"
+#include "coresight-etm4x.h"
 #include "coresight-priv.h"
 #include "coresight-syscfg.h"
 #include "coresight-trace-id.h"
@@ -69,7 +71,8 @@ PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
-
+/* Interval = (2 ^ ts_level) */
+GEN_PMU_FORMAT_ATTR(ts_level);
 
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
@@ -103,6 +106,7 @@ static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+	&format_attr_ts_level.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1a2d02bdcb88..42277c201d4f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -615,7 +616,7 @@ static void etm4_enable_hw_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -626,11 +627,17 @@ static void etm4_enable_hw_smp_call(void *info)
  *  | Timestamp Generator  |  (timestamp on resource y)
  *  +----------------------+
  */
-static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
+static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
+				       struct perf_event_attr *attr)
 {
 	int ctridx;
 	int rselector;
 	struct etmv4_config *config = &drvdata->config;
+	u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
+
+	/* Disable when ts_level == MAX */
+	if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
+		return 0;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
@@ -666,12 +673,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 		return -ENOSPC;
 	}
 
-	/*
-	 * Initialise original and reload counter value to the smallest
-	 * possible value in order to get as much precision as we can.
-	 */
-	config->cntr_val[ctridx] = 1;
-	config->cntrldvr[ctridx] = 1;
+	/* Initialise original and reload counter value. */
+	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
 
 	/*
 	 * Trace Counter Control Register TRCCNTCTLRn
@@ -761,7 +764,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index aaa6633b2d67..54558de158fa 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -598,6 +598,12 @@
 #define ETM_CNTR_MAX_VAL		0xFFFF
 #define ETM_TRACEID_MASK		0x3f
 
+#define ATTR_CFG_FLD_ts_level_CFG	config3
+#define ATTR_CFG_FLD_ts_level_LO	12
+#define ATTR_CFG_FLD_ts_level_HI	15
+#define ATTR_CFG_FLD_ts_level_MASK	GENMASK(ATTR_CFG_FLD_ts_level_HI, \
+						ATTR_CFG_FLD_ts_level_LO)
+
 /* ETMv4 programming modes */
 #define ETM_MODE_EXCLUDE		BIT(0)
 #define ETM_MODE_LOAD			BIT(1)

-- 
2.34.1

