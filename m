Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E4232AAA4
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330964; cv=none; b=dH9YSAvsyrcgtdAx7AO8NAShKy2el/3HVHqKVFbVcv34QzhWUZpwwzBYE7OFy7M3oFn6PNBlTMVVdNqpwriwje3B+coLIK+cGzAhcQFhBgIzVOYZosFeQ7wD37ZBqzL1kRCCatNqTosUHMfS6RKqGq/0Rk+DkQ73tsxR5AWmzzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330964; c=relaxed/simple;
	bh=6oXIGlC+wqCr/SkwqBibYR4SYOLd2XL8stv1A5qwMjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVtlLkTB31AFOyb7xVksewsXJomFVbSLEKaup8zAcYQSSJiY0yforasTKytcMQm6TlM49hR+XYPJN/Yp9tl1+8IPl+WsKUASSUGjLFQ9jxj4nS5rfG34nCG0ujOQLmEGMx8o1bl/iGAroQkMdFf8EEJ4jQsifNRSbWpr5pr0eIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iamc1Z50; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iamc1Z50"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so12395775e9.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330961; x=1764935761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5368MuIG36Hb0NYODGe1O8EB5VRQ12WYq9XYGie/B4g=;
        b=iamc1Z50H+THbTKOPNWamT/Hu4Wsi6OBBXmvHSVHA+5QwY3LSPzruQ3w1RMMcu73nw
         b1kOtnfCpYAmromfHQpcZuNt1KZSLnNAPOXm0A7KFC0eYw0OlmmeoK7MPIMz6dlBrwQy
         YHNguGKQ09gtSLT5ZKMNpxg3NMShV8oLqm9nQOVUkXAlmpnDUBPlEw1P45TyjE7km/N2
         h+x+9X1vD/JXtkoZi4DebXTN/EuU5G5hTGojnqSttm9l0PCXdHUloP0eBiMEr767gWoI
         3IDQIOnoxCJIRWGMdrBXqCXoeGPJGNe495kIcNrxDsHxoGwzTtkNdMHeHsGgqjyCZS2p
         wkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330961; x=1764935761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5368MuIG36Hb0NYODGe1O8EB5VRQ12WYq9XYGie/B4g=;
        b=UrKvsGXfSJkMNWQZRQzcoMDX/c7cw08MqrQpIR8zAXGRTI69Aox1Dk4twaMTLGJLfa
         jD4Av4bUS7/XZ+SN/AwYXY7MI2ECPfbBaCltzWyBejA7N1AjztdW8jQ4mVm+rnjPcgf/
         4V0XEQBmp1bPogI1UX7/npDxJE83CtCh3rPL1dmkgcfZLS124Nw7JeGvWMZBxDil6H6a
         5D3iPvtGqiGdBzkSf9St2F2pnO7pO6BBWbCcOwRgHAEmZHlX6QqiVFf09LbhcwvVUGQn
         cb1n04A8dGOjRbpoYqFjcuwRchsL1/22KGMWiAvkKF1yLvH4wek96NLrsD8i5E+PBmHA
         pBuA==
X-Forwarded-Encrypted: i=1; AJvYcCX8X8BKrcl1vr3sXAqqjcJ8hAsQNIo+rjttmWnKEAmfWbjMG/pvPJKK/ebURqmsA8CSYQvIDtZJxUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QsysNMDD8CYxNsSCLvVqJOMs8rPZspi7SSLmT1UyCTdAGy19
	m1TpAXtikELOQhJEHXtSaZEUWq2pg/j44yYk+r8ANjuuK3XWNbfrpVj/iY7JREYfy7U=
X-Gm-Gg: ASbGncuG9dTP5bKJFxEpWiI0j2DOM5j6PHjTOm7ybz1fA75BW2x5JMDn1uw2ni+fY/2
	HwNjYWroOzwN7k6XIUN+REuj/fde0PXp9Wn/UV7ULltqEjnh6i04JfVZTvkq0qyG+I8XDCKZeo3
	QW5EdY/Lf+GqX1Sk/nDInA939+Ac0BJWRnAVrC3twDduSBkM3qTY5j5pZ62CNkwNjUbys6V4PLC
	KyclT17At+E/CmgUiKz/VWie/ixSBfb2TYROO7r8yop/kc0NtOoJ+2wp9ITecOZJGYIDcoHr2dJ
	9lqv7YxH2bApHrAuWvNdQCYcBjlJf2gmGuASnm29LlzD00iViUGTrwwjxhvSesW7P3+3TgrCxfK
	u/E4PwCwFEE/PJZ9sIq4TeUqw9RKIjNnTSckdliUJbOo1UXEuFdUsxZ+BO0KPqytcyJAJ4M2Mge
	RfTPJOfAC4WygeGZ2H34Tg3g8A5I4C8Vs=
X-Google-Smtp-Source: AGHT+IHE0tds7XLxA+n+V0acq2/1sSr+l4IbYfbl7nhPj+Ex3bWfKJpA/SevPoWJ0cpE1jWrYY/WzA==
X-Received: by 2002:a05:600c:1c1f:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-477c04c2011mr330672845e9.2.1764330961427;
        Fri, 28 Nov 2025 03:56:01 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:56:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:24 +0000
Subject: [PATCH v8 12/13] coresight: Extend width of timestamp format
 attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-12-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0

'timestamp' is currently 1 bit wide for on/off. To enable setting
different intervals, extend it to 4 bits wide. Keep the old bit position
for backward compatibility ("deprecated_timestamp") but don't publish in
the format/ folder. It will be removed from the documentation and can be
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 12 +++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 27 +++++++++++++---------
 3 files changed, 37 insertions(+), 15 deletions(-)

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
index 584d653eda81..57e4a21c8fdd 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -310,6 +310,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 {
 	struct etm_config *config = &drvdata->config;
 	struct perf_event_attr *attr = &event->attr;
+	u8 ts_level;
 
 	if (!attr)
 		return -EINVAL;
@@ -338,7 +339,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
 		config->ctrl |= ETMCR_CYC_ACC;
 
-	if (ATTR_CFG_GET_FLD(attr, timestamp))
+	ts_level = max(ATTR_CFG_GET_FLD(attr, timestamp),
+		       ATTR_CFG_GET_FLD(attr, deprecated_timestamp));
+
+	if (ts_level > 1) {
+		dev_dbg(&drvdata->csdev->dev,
+			"timestamp format attribute should be 0 (off) or 1 (on)\n");
+		return -EINVAL;
+	}
+
+	if (ts_level)
 		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7e9c923acf4b..d565a73f0042 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -750,6 +750,9 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_config *config = &drvdata->config;
+	struct perf_event_attr max_timestamp = {
+		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
+	};
 	struct perf_event_attr *attr = &event->attr;
 	unsigned long cfg_hash;
 	int preset, cc_threshold;
@@ -790,21 +793,23 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		config->ccctlr = cc_threshold;
 	}
 
-	ts_level = ATTR_CFG_GET_FLD(attr, timestamp);
+	ts_level = max(ATTR_CFG_GET_FLD(attr, timestamp),
+		       ATTR_CFG_GET_FLD(attr, deprecated_timestamp));
 	if (ts_level) {
 		/*
-		 * Configure timestamps to be emitted at regular intervals in
-		 * order to correlate instructions executed on different CPUs
-		 * (CPU-wide trace scenarios).
+		 * Don't do counter generated timestamps when ts_level == MAX.
+		 * Leave only SYNC timestamps from TRCCONFIGR_TS.
 		 */
-		ret = etm4_config_timestamp_event(drvdata, ts_level);
+		if (ts_level != ATTR_CFG_GET_FLD(&max_timestamp, timestamp)) {
+			ret = etm4_config_timestamp_event(drvdata, ts_level);
 
-		/*
-		 * No need to go further if timestamp intervals can't
-		 * be configured.
-		 */
-		if (ret)
-			goto out;
+			/*
+			 * Error if user asked for timestamps but there was no
+			 * free counter.
+			 */
+			if (ret)
+				goto out;
+		}
 
 		/* bit[11], Global timestamp tracing bit */
 		config->cfg |= TRCCONFIGR_TS;

-- 
2.34.1

