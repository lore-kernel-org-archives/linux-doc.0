Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABB734029C
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960963; cv=none; b=DzW4IKkc/0DMA8Glrg6NUjEo01NrWV5uAfV1KY87Gs65g944dtmXQWyX7DWw2wbgqVQO8VGRsWjWDY61cQhz7Dfi/HYlxxoW3HThWmV4/CyIavKZJ4newCULiXJxl7xiQLejTVzK1tj0riv5ieiq0ns/efxtJZfCQIUFFsn0rmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960963; c=relaxed/simple;
	bh=CVyCyQt/4XeVwaXkLI2sx+lGIsU0DfdrUUdJXTKDH1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FthrGdYqh6+2chi77doJNAtk2Fk2As17gQXr/W3tygfyJvwc/G/EAGXmvAS1S41gLDX3OAxVEAWk24UKeD0zv+Zp2RhGT6AZ+4u15fSqd2qTC/QN+Lxppondm4WgsfD4BsxQTjBrhrLwBbUJwetHkkLHeanXGeNnOC/ESk/xlAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v4EcFteb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v4EcFteb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632d45c9so7159995e9.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960959; x=1763565759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wh23cgVTrsuEAgMOdQ2R3Fyv92omKUsnmPcgOaLOE0w=;
        b=v4EcFteb08qZVC3aLlY70Wkgt1laK5PAgaNzSjgDyiuchshVod/s261Hw5z80pEfly
         jDacIWjWomdVtH2yaczchch1SCbyQdf9hb8SgSmNYv4EW8hT92I82wy6larPUoy5t0K5
         rqRnUemsFJ+ns63+osNF6jecJ3zmuBeSiQEThL1cqCkLi4hqSAoW7pxXofWYZwXy5pmi
         HEO4YkU7ab6CosdIv9Jf4p1tf4O9DHkoquIrxTtPNF/4lbzPDIJBfyioAtU7e76VocRw
         jMaAmmfs9RLLLinCWqdxjT/LzYBV6+9Lcwn2upgV1uCUeOsdb601/DLQFQlf83d/FPxb
         DWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960959; x=1763565759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wh23cgVTrsuEAgMOdQ2R3Fyv92omKUsnmPcgOaLOE0w=;
        b=jUvrdNDzRouejff/uFpMmO/nvtmpA56VdKxNbNZSLI5/Q2LW0fZIwiHUEeqJAX3EFP
         djfqv45ux4fqmHt63RmTNNNjnTILVSdAthE2OkjbhdhcQeTq/imSw6Kk1Hvwdygc8OM0
         CJtVzYhToM77h4lYg3+kCAJtANEeZK9n8s6sUF+3Z4HZVpdzzaW87J/2LG9DaJ4e7xyy
         ZsiN9XNaudYwzy/4paXz+06Qk/omM7W6Fzo+Zd1wggKNwp3DKXQ9SnV9LSsy3QFJGSYa
         bktaoadwmpT1SAS93bVqdGC3vHGuFjJJt3DsuwVSp26sBeeJeofqk3/txdiln8WmfeuF
         pmBA==
X-Forwarded-Encrypted: i=1; AJvYcCV4F8YqaD1/fe7O+nes10H9Bptqj7oGfKazdacKw3eEAqPdAFDdMN59Yc8hNI1oWQvBUl02/QcU4WY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Ah/A4JS27PWYVfFaQGqvO1Saqk4zQCF+qEf7ZwCOc44NSQ0V
	377PRc3JGhA2isBDdvOw8x8VeAgVqGAa7nbwRZNcw430/3p8EyXwwlbapgpD358AjXU=
X-Gm-Gg: ASbGnctVtB6cWSx4kHFRzLAi0kZ4qODbTE2gDdQBW+nqvtQUK6VFWXuQzIfveRx182/
	M9GpJqOgCK4W4HgXc8CmVpPnIq+OqIF+BdVTHdvM72Gew8PNTObtJqpMSOz5p3u3olX33CGltdz
	HC/5sJWJzT/0Kv7eOkSWxmdJAA8pASfwmtXu5fDGOaeyIvlQePQYtBPqFaFDtGmm2Yxl7h8f3pJ
	d5L9gXZHTUIGvJCCLq6LhI1CFqRPHNsYgr4NaRFNMd13AjmHeJVaTd8OoHntsaUgTJXrhwR2aty
	nVECqD0yVQBcb5bSLLoQQcc+Df3KEN+Ejst8xYUXuL5kAktoYCFMnNLf1u74S6ecAzejALEXjgT
	K9M1JHYGzFXRCc6iBufhlPeolQgsz1nl61WRB6RMPPp7NM4RyqjN3TFe14z0/jqtbxrpRbU6n5A
	wzSTlXhG3nuw==
X-Google-Smtp-Source: AGHT+IF+L/8DtFqvQEmvBjAnJLhDcKijbfYq7KDpw5oNA46EuTEQqeHPWKCbNq+YJQfVY3elkWIKSQ==
X-Received: by 2002:a05:600c:3b11:b0:477:6b4f:3fbd with SMTP id 5b1f17b1804b1-477870b935dmr27757175e9.38.1762960958765;
        Wed, 12 Nov 2025 07:22:38 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:17 +0000
Subject: [PATCH v4 11/13] coresight: Extend width of timestamp format
 attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-11-165ba21401dc@linaro.org>
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

'timestamp' is currently 1 bit wide for on/off. To enable setting
different intervals in a later commit, extend it to 4 bits wide. Keep
the old bit position for backward compatibility but don't publish in the
format/ folder. It will be removed from the documentation and can be
removed completely after enough time has passed.

ETM3x doesn't support different intervals, so validate that the value is
either 0 or 1.

Tools that read the bit positions from the format/ folder will continue
to work as before, setting either 0 or 1 for off/on. Tools that
incorrectly didn't do this and set the ETM_OPT_TS bit directly will also
continue to work because that old bit is still checked.

This avoids adding a second timestamp attribute for setting the
interval. This would be awkward to use because tools would have to be
updated to ensure that the timestamps are always enabled when an
interval is set, and the driver would have to validate that both options
are provided together. All this does is implement the semantics of a
single enum but spread over multiple fields.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  4 +++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index c794087a0e99..24d929428633 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -23,6 +23,9 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_preset_CFG			config
 #define ATTR_CFG_FLD_preset_LO			0
 #define ATTR_CFG_FLD_preset_HI			3
+#define ATTR_CFG_FLD_timestamp_CFG		config
+#define ATTR_CFG_FLD_timestamp_LO		4
+#define ATTR_CFG_FLD_timestamp_HI		7
 #define ATTR_CFG_FLD_branch_broadcast_CFG	config
 #define ATTR_CFG_FLD_branch_broadcast_LO	8
 #define ATTR_CFG_FLD_branch_broadcast_HI	8
@@ -35,9 +38,13 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_contextid2_CFG		config
 #define ATTR_CFG_FLD_contextid2_LO		15
 #define ATTR_CFG_FLD_contextid2_HI		15
-#define ATTR_CFG_FLD_timestamp_CFG		config
-#define ATTR_CFG_FLD_timestamp_LO		28
-#define ATTR_CFG_FLD_timestamp_HI		28
+/*
+ * Old position of 'timestamp' and not published in sysfs. Remove at a later
+ * date if necessary.
+ */
+#define ATTR_CFG_FLD_deprecated_timestamp_CFG	config
+#define ATTR_CFG_FLD_deprecated_timestamp_LO	28
+#define ATTR_CFG_FLD_deprecated_timestamp_HI	28
 #define ATTR_CFG_FLD_retstack_CFG		config
 #define ATTR_CFG_FLD_retstack_LO		29
 #define ATTR_CFG_FLD_retstack_HI		29
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 584d653eda81..d4c04e563bf6 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -338,9 +338,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
 		config->ctrl |= ETMCR_CYC_ACC;
 
-	if (ATTR_CFG_GET_FLD(attr, timestamp))
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp))
 		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
+	if (ATTR_CFG_GET_FLD(attr, timestamp) > 1) {
+		dev_dbg(&drvdata->csdev->dev,
+			"timestamp format attribute should be 0 (off) or 1 (on)\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Possible to have cores with PTM (supports ret stack) and ETM (never
 	 * has ret stack) on the same SoC. So only enable when it can be honored
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1aa0357a5ce7..d4e294cd48ae 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
@@ -800,7 +801,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs

-- 
2.34.1

