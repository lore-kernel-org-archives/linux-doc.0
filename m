Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA852FAC0F
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168688; cv=none; b=U/vyL8Cw3umoegMXSr+TDRAIdLtPGWMeDj0NYf0MJb9FoUnPNMcuq+yl2nM2fIKTpnN9zelzRmlrytimmdeex3nv2JBFRWAcHDYnLFiC3KhePrfoqsEsYFg6EvFhPxp0S2qaHtroXwrlxpVFaajy7TqylirawwDGVN87337Rybo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168688; c=relaxed/simple;
	bh=U8TkMqWfDTBWjb8GRi9+VCChj3K0XOJrpYPU0RGTnw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oxayiu2nkC3L1fNODUj+TFE3hOG8LhU1GzLw1K0fonU1Dq8LBkr2wu1auEd3Aa+KFSWkkjOlEYggo/ev1v9u3Lfe3WQPOCty1h6bWpA/D+2uGV+gWwGIYh1On4SopjRqrXcp6rYFfZholccbRvkaR0QI4wOBzkW9Y+ofgVyoe+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JpxeUPRT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpxeUPRT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso3464605e9.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168684; x=1755773484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCFJWq6hVWDLLnb3WEoK3x2DCujP3OgS7K9EwJG0Zgk=;
        b=JpxeUPRTUfJ0LWzhgQk/956rzEbCvFWFjIRJrrzAQapiaZ/xqyTfoihurrx9da3jN0
         Fis4fVleLxt9QZSszHkDedAxRluq06JlCJ3P7HizZkpbwshdpiKq4fJTrCpZV0tpMaB3
         kK475ZrxF6Bg9lfys/fXQY7bb59//rnx5KIIf5IsZtz81/yFCfVX/Tkc84ns8OHgz4aY
         imIcXkuEqje8bLKWnUKUOBYW2a3PdB75uIjf1ae8Fm35lgkWna3dWC0IQDt7RB3EuY/W
         p8+exz0tdEPZJcvcyhZlWOf3Q28/abEefiAUwmTF7+KKcyeOgLNe7sZp3bJCRP+Jgqqg
         N8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168684; x=1755773484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCFJWq6hVWDLLnb3WEoK3x2DCujP3OgS7K9EwJG0Zgk=;
        b=ophfvtNBrQffhD1QJhmYja5LPybMfH8evZCYC1fcfKUa2CwykaZKVfDN1R8v2IUwIO
         U6k7tNT1k1wUxkmVNVPfhSCyIf/Fv9EfYue4VeDR0nImb0qmjChCa/Hn8SjTxpkNnZLC
         H2FplV7eNbvgneY5WZTGrddF140KMj+AVES+WwHyMPDCFSGBJVfx/Ex8tf1uusAVpgMX
         gTNwrGH36ZP99sBIjCfJhKf18jKKvam3umtedTNNVA2i4N9vD1s+b8/BfnSjLjUuGTbK
         fB977u1r6TjFqz2/nLCMFzqTm5jzMCxUuUAcqU+s0jMqZ/6vju1Mb1R0xUq3AqQM3SK1
         N0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVuuNXw8fXRqqSTxHSbFt9eOYxYIULiqkVyLFYClqHPQytcoN8KlUUoh9Dg98ctjJrBjpOs2nBgC80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBznxRzSM1cFCBjnoB+usIooUHsveWghChlFau4HtM5sAj7hVW
	Ydphm/L5RI5ZOrtQXoA/vxVEKZ2g6ZRQpxQkbb99tEUPI47q7hCFzIcd2z3H9bG0leU=
X-Gm-Gg: ASbGncsHIH2R5fRIEieV7xK4rduprCWSbClzvryzniabZyJkMs1hstiJAJcIUen6UlQ
	Y65pf+6R39n9uNVQ2gWIh26t8uzpw4+nTUqNCrExeK0FDwAJtPUxoLV6sP0W4z65aRxOauMm/uq
	GYbvR+geoEHr0cLE6iWo01biFxnsDavnS/BNNTyY0d0WSZllPjn+a7XI/ihW5i6OHp6RZynq7UJ
	VufWl8XuWo0z6/B7LAAsjbVWzwwT2A9DXOUf7fhViVOq4unblb5heAcwO2LB6Lk5NUnO5vf0aGq
	ehx7u/0baOLtAwFDRLS/Jz9HXAg0szc6Z8HcLAHBkf0TPxxEfS40+ymGz3uFsoCnOvypQTyZaz3
	aEmc4JToLARRuJ7Jtl3rkeTySXYc2zA4=
X-Google-Smtp-Source: AGHT+IH7V3UbaGrUJe9fOSW+9cf1k9RfdPPJpO57OeoAxEN+FtVoytlc5UFLEqj9CTFJZLY7Ywq0nw==
X-Received: by 2002:a05:600c:1ca7:b0:456:285b:db24 with SMTP id 5b1f17b1804b1-45a1f8e2320mr1517955e9.28.1755168683865;
        Thu, 14 Aug 2025 03:51:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:55 +0100
Subject: [PATCH v2 4/6] coresight: Refactor etm4_config_timestamp_event()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-4-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Remove some of the magic numbers and try to clarify some of the
documentation so it's clearer how this sets up the timestamp interval.

Return errors directly instead of jumping to out and returning ret,
nothing needs to be cleaned up at the end and it only obscures the flow
and return value.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 95 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 20 +++--
 2 files changed, 77 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index cbea200489c8..1a2d02bdcb88 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -608,18 +608,33 @@ static void etm4_enable_hw_smp_call(void *info)
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
@@ -629,15 +644,17 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
+	 * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'.
+	 *
+	 * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
+	 * by 2.
 	 */
 	for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
 		if (!config->res_ctrl[rselector])
@@ -646,13 +663,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -660,26 +673,42 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
+	 * RLDSEL = 0, reload on resource 0 (fixed always false resource, never
+	 *	       reload)
+	 * CNTTYPE = 0, one count input resource
+	 * CNTSEL = 1, count on resource 1 (fixed always true resource, always
+	 *	       decrement)
+	 */
+	config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
+				    FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, 1);
 
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
index 1c67b263b01b..aaa6633b2d67 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -224,6 +224,16 @@
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
 /*
  * System instructions to access ETM registers.
  * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
@@ -823,7 +833,7 @@ struct etmv4_config {
 	u32				eventctrl0;
 	u32				eventctrl1;
 	u32				stall_ctrl;
-	u32				ts_ctrl;
+	u32				ts_ctrl; /* TRCTSCTLR */
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -843,11 +853,11 @@ struct etmv4_config {
 	u32				seq_rst;
 	u32				seq_state;
 
-	u32				cntrldvr[ETMv4_MAX_CNTR];
-	u32				cntr_ctrl[ETMv4_MAX_CNTR];
-	u32				cntr_val[ETMv4_MAX_CNTR];
+	u32				cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
+	u32				cntr_ctrl[ETMv4_MAX_CNTR]; /* TRCCNTCTLRn */
+	u32				cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
 
-	u32				res_ctrl[ETM_MAX_RES_SEL];
+	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
 
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];

-- 
2.34.1

