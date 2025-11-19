Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB9364E85
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569106; cv=none; b=F06XfVVOwiACwBLJBnga1XNdMSE1I3tXlZEAVc0Qnp8f0X51b8iNE6e7ihQ+FLBk3Jr06zyDOenV3hxsO8Hx1OutcojW7zVphwkHGfo8Uv5eS2dzvG+Y8Eh6/PYc7Xgbxsx3q7o0/rmowc8YOLASsYcYXFiy9e20LjxRjeFFuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569106; c=relaxed/simple;
	bh=ONkP+P4kDJfi/Sh9u17b+mxs55OiXiOwJM3I+w+oDdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spb7OIxg1inbkKJuCkj6mIx/WAO/TjzYXNji5L5cxStT6n5cCcTunXJXstH/h3zsfHa+Y8J/+/IYYFwthY+na1TQgRjYj3WhoGp8jCZrr0F9tZ8BUoPJ0MnN6JJD6Wflpw8VBPQGPqi3avBmSzTfDgxXLDDfAAr/353hq2LIvIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOrwVE0E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOrwVE0E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775895d69cso36383745e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569102; x=1764173902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv3JnFDC0jik+shXFRazxf6/zTl+pNpZZP8z8eh7A8Q=;
        b=dOrwVE0EJnkfjwY76LYYbZD66nzfLWI3p/WYmuqHOBtuoIFX5fibZvdRK4HF2Cln3v
         sqv+/VMdPFMB1NeDSNB1Le5wnz6oHi2lpSBFw5bsfLa8g1oKno+mGnigyd+MfILBpJeq
         np7z/qBSRJlW3NN1Vc9scEYW1JVd2Q7hv9QBN5qtbDCo76iJ5rZM6fvctK/zKm9nW4Ba
         kpVuLx9qpX0fgNcsh54PQPzYs4pr8nKnt1VWZ8iHzd5N4L/gPXm+a76kpSczELm18B1a
         9vW1IVcmg9QKbGSuB54KU3+88eZWUkvp+MwDG7IlKfbwgVjyTDP4CmIzJebQlNWHMGyc
         oDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569102; x=1764173902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fv3JnFDC0jik+shXFRazxf6/zTl+pNpZZP8z8eh7A8Q=;
        b=MwDs6GR3Ayef/S828BQsA59jtqQUD580HWizFA+x/pUxyAFGOry0v93DF5xEhdQXeq
         TfiAUw5UsJttIUcpWj2bbBxrwf2FXYdAIbp2mx5wfm4XbT4+BgFy+yOzCDsXMNXFmG3h
         q6M+4BtxVEa9SpOsUs9JdwqLGGxVPnU87i7B3pjR8APVWX6A0fRqADri0mBr1bSKZbMu
         CQS4AqfefCojZMsPTlIw84r5QXAAMY2lDmmndX0yPV+lF+iJwR9EIwTEJ47C5XMvfDOs
         MQwO4aueklCYn+bcVapwbgvJvm8Cvns8XHiC6WqaBpKV4qmf3wLHSOcqlPurc9Vx0KoA
         x+dg==
X-Forwarded-Encrypted: i=1; AJvYcCXVg0/ZjxxwjMfucKb1b3sZ84+1agR3MIzb4WOfwk1eXbp+G4IDuLPumM57QeDeEymEpPKdz63Pg/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+LZ9HSJXjY8u28YgIyV5P0nPos9tgQplXH0upvZecSqCxbq2
	mmPoTmBIfo/ncMKXrJhMezaqLhVLKAV+TcZgykFZwheCrNf/hG9LKU20yQFrjqnDlz8=
X-Gm-Gg: ASbGnctI+xMz6mzym20+Ed3PSmljXvaCz9UcN3CZhowLFXpsK+P9MZXJ8rjD7UPAsEs
	AQSuB2w9D6iOENCm2iyw2lzIcjqTBMga326gBrJrivcqnEHtW7tPK7zer9N1dglEDuIY+FsblxT
	45ZFFJn6Gw8lYgBseSPbmFhRAoqi2Nmrmmc+gtTpHch4q2KxzZyCDc+yH61u1FGqagJZSqn8VtL
	7OvKuZX7o8j5HDpblwAyvxNa6wPe9fzgg0RlXeXUZcu8eAE9mZJxAuC7N9CKv96Et42LLL9tcLd
	0KqKyQTFFjjfNrE1lmENV5qqaJD9nS+AtghxrBzFXWiyq5m3H6cmRmlDrVuFKy0f6DImATRivqn
	h10bYwciJtSgjGLijB1paush/B9yNyd/jESDnTPS2ek/7bG+kKxUmn1tCI+QRwR4Ep8tlD1enHm
	NAduVNVNId7cZwD51o4Bh1
X-Google-Smtp-Source: AGHT+IHmdxTsICz9N512i9L283p3Q2gBYmhvmlMjINfcSMOJVvgePV8NVWPmyITDgHhdaid8NLhNtw==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4778feb2401mr186240055e9.29.1763569101830;
        Wed, 19 Nov 2025 08:18:21 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:17:59 +0000
Subject: [PATCH v6 03/13] coresight: Refactor etm4_config_timestamp_event()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-3-740d24a29e51@linaro.org>
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

Remove some of the magic numbers and try to clarify some of the
documentation so it's clearer how this sets up the timestamp interval.

Return errors directly instead of jumping to out and returning ret,
nothing needs to be cleaned up at the end and it only obscures the flow
and return value.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 23 ++++--
 2 files changed, 81 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 560975b70474..5d21af346799 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -642,18 +642,33 @@ static void etm4_enable_sysfs_smp_call(void *info)
  * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
  * there a resource selector is configured with the counter and the
  * timestamp control register to use the resource selector to trigger the
- * event that will insert a timestamp packet in the stream.
+ * event that will insert a timestamp packet in the stream:
+ *
+ *  +--------------+
+ *  | Resource 1   |   fixed "always-true" resource
+ *  +--------------+
+ *         |
+ *  +------v-------+
+ *  | Counter x    |   (reload to 1 on underflow)
+ *  +--------------+
+ *         |
+ *  +------v--------------+
+ *  | Resource Selector y |   (trigger on counter x == 0)
+ *  +---------------------+
+ *         |
+ *  +------v---------------+
+ *  | Timestamp Generator  |  (timestamp on resource y)
+ *  +----------------------+
  */
 static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 {
-	int ctridx, ret = -EINVAL;
-	int counter, rselector;
-	u32 val = 0;
+	int ctridx;
+	int rselector;
 	struct etmv4_config *config = &drvdata->config;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
-		goto out;
+		return -EINVAL;
 
 	/* Find a counter that hasn't been initialised */
 	for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
@@ -663,15 +678,19 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 	/* All the counters have been configured already, bail out */
 	if (ctridx == drvdata->nr_cntr) {
 		pr_debug("%s: no available counter found\n", __func__);
-		ret = -ENOSPC;
-		goto out;
+		return -ENOSPC;
 	}
 
 	/*
-	 * Searching for an available resource selector to use, starting at
-	 * '2' since every implementation has at least 2 resource selector.
-	 * ETMIDR4 gives the number of resource selector _pairs_,
-	 * hence multiply by 2.
+	 * Searching for an available resource selector to use, starting at '2'
+	 * since resource 0 is the fixed 'always returns false' resource and 1
+	 * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
+	 * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'. If there
+	 * are no resources, there would also be no counters so wouldn't get
+	 * here.
+	 *
+	 * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
+	 * by 2.
 	 */
 	for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
 		if (!config->res_ctrl[rselector])
@@ -680,13 +699,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 	if (rselector == drvdata->nr_resource * 2) {
 		pr_debug("%s: no available resource selector found\n",
 			 __func__);
-		ret = -ENOSPC;
-		goto out;
+		return -ENOSPC;
 	}
 
-	/* Remember what counter we used */
-	counter = 1 << ctridx;
-
 	/*
 	 * Initialise original and reload counter value to the smallest
 	 * possible value in order to get as much precision as we can.
@@ -694,26 +709,41 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 	config->cntr_val[ctridx] = 1;
 	config->cntrldvr[ctridx] = 1;
 
-	/* Set the trace counter control register */
-	val =  0x1 << 16	|  /* Bit 16, reload counter automatically */
-	       0x0 << 7		|  /* Select single resource selector */
-	       0x1;		   /* Resource selector 1, i.e always true */
-
-	config->cntr_ctrl[ctridx] = val;
-
-	val = 0x2 << 16		| /* Group 0b0010 - Counter and sequencers */
-	      counter << 0;	  /* Counter to use */
-
-	config->res_ctrl[rselector] = val;
+	/*
+	 * Trace Counter Control Register TRCCNTCTLRn
+	 *
+	 * CNTCHAIN = 0, don't reload on the previous counter
+	 * RLDSELF = true, reload counter automatically on underflow
+	 * RLDTYPE = 0, one reload input resource
+	 * RLDSEL = RES_SEL_FALSE (0), reload on false resource (never reload)
+	 * CNTTYPE = 0, one count input resource
+	 * CNTSEL = RES_SEL_TRUE (1), count fixed 'always true' resource (always decrement)
+	 */
+	config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
+				    FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
+				    FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
 
-	val = 0x0 << 7		| /* Select single resource selector */
-	      rselector;	  /* Resource selector */
+	/*
+	 * Resource Selection Control Register TRCRSCTLRn
+	 *
+	 * PAIRINV = 0, INV = 0, don't invert
+	 * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
+	 *
+	 * Multiple counters can be selected, and each bit signifies a counter,
+	 * so set bit 'ctridx' to select our counter.
+	 */
+	config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
+				      FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
 
-	config->ts_ctrl = val;
+	/*
+	 * Global Timestamp Control Register TRCTSCTLR
+	 *
+	 * TYPE = 0, one input resource
+	 * SEL = rselector, generate timestamp on resource 'rselector'
+	 */
+	config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
 
-	ret = 0;
-out:
-	return ret;
+	return 0;
 }
 
 static int etm4_parse_event_config(struct coresight_device *csdev,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index d178d79d9827..b319335e9bc3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -225,6 +225,19 @@
 #define TRCRSCTLRn_GROUP_MASK			GENMASK(19, 16)
 #define TRCRSCTLRn_SELECT_MASK			GENMASK(15, 0)
 
+#define TRCCNTCTLRn_CNTCHAIN			BIT(17)
+#define TRCCNTCTLRn_RLDSELF			BIT(16)
+#define TRCCNTCTLRn_RLDTYPE			BIT(15)
+#define TRCCNTCTLRn_RLDSEL_MASK			GENMASK(12, 8)
+#define TRCCNTCTLRn_CNTTYPE_MASK		BIT(7)
+#define TRCCNTCTLRn_CNTSEL_MASK			GENMASK(4, 0)
+
+#define TRCTSCTLR_TYPE				BIT(7)
+#define TRCTSCTLR_SEL_MASK			GENMASK(4, 0)
+
+#define ETM_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
+#define ETM_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
+
 /*
  * System instructions to access ETM registers.
  * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
@@ -824,7 +837,7 @@ struct etmv4_config {
 	u32				eventctrl0;
 	u32				eventctrl1;
 	u32				stall_ctrl;
-	u32				ts_ctrl;
+	u32				ts_ctrl; /* TRCTSCTLR */
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -837,11 +850,11 @@ struct etmv4_config {
 	u32				seq_rst;
 	u32				seq_state;
 	u8				cntr_idx;
-	u32				cntrldvr[ETMv4_MAX_CNTR];
-	u32				cntr_ctrl[ETMv4_MAX_CNTR];
-	u32				cntr_val[ETMv4_MAX_CNTR];
+	u32				cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
+	u32				cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
+	u32				cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
 	u8				res_idx;
-	u32				res_ctrl[ETM_MAX_RES_SEL];
+	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
 	u8				ss_idx;
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];

-- 
2.34.1

