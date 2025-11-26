Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827231D38A
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154669; cv=none; b=K50yRfxVh/lw/E+Y6agOxdMYPR/w6notK/EnPW5jvaDwEFQVhcat7G9LTDDC+WsCY0YI3jESCcZCLSu/q8UP9gU9q3+ykN3Gw7YKmieArIDIdvp4QMBCdx3XYS16ZLBnqOtm5EV2ZVjgf3fE4oeIOB6Xsp2hgQlVzwZBOFnfk8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154669; c=relaxed/simple;
	bh=TSKKw4dSMhoGKXZEo+uUgvcqxoTEmiOBgU6fyDHO7w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hV48NKUQqA7bg1m2s2maGmEXjxYPHQu43NVGibdlWWiuOmXwZbdHFJApmzx52x3TX2qbW2mZ/KwQiOUObkcc7uEW2IykfOsa9CdfG8ZUCMXnWilRz/CLWuBR8IyZr3uL4+QXe3JDffAU4+CmQf/mems8+aBzB1WKO5FDkaEHpjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=syJqlF5i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="syJqlF5i"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso4066155e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154665; x=1764759465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRll0z28PX9oYYWspSiraPmZN3ssbBscfFFFKlw+WKc=;
        b=syJqlF5i7+F6xkrGYuzet8rzyta4s9JUOYSKMNJpr55/NDcSSxC1OtXbX8CQAE90Sk
         dyBnlS466qInlcRE/fKZZ4lHKhH8qUq+paNrvg9lL7lROEkkJ2ktW20/HjbBK6SGWXzd
         rSEyudwt6gvUW1kjG80pRfqkA3HY2w9MGAWRdYa9HgN8q1QsVWFfFuauAHfJBXipPgdP
         XwuPzW1QvewgLjkI7biTIn/XC/U3VME8wNKlrktHhh8GVIF2KFi078CDOxP1yY5i1Q4e
         3wmO6zd229rY7SsBzy3Znj2wDCKkOmXyw4CFUklxiCAnWj0Fce7l+PKZv93ZMQTXtqKT
         Un7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154665; x=1764759465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRll0z28PX9oYYWspSiraPmZN3ssbBscfFFFKlw+WKc=;
        b=k6hu28k9sFhcvK7T2bS6SMmr4zWA+7LDYiGSMcUxfKxgPnufdwboBiFN+8fZftmo9m
         s8+DJWDq1RESFdAO0cfPGr4do9uJr3ZCx5R5rbHM2xFk9eS70JCl7AV1NvIMy+ph9I6j
         ilIGYpqAuF2d/Wa0mvEVYwVMDgEnpRVGVLG/09QPEYCl50GYHrm7TLbnNa/q/RdMUCn/
         Wp43v4NtB/MYdkp1SVXHm9J6GGq4s2mMmtxRODAquTvcYzWuqllSpdghkK9bR4njh3E8
         tt9tBV2D1xTJQk6DTgaXQlyI+w2AdC5LCKSkPCZaVvDvhi+4ePkKbW9VtXOHMguHDil5
         e2qg==
X-Forwarded-Encrypted: i=1; AJvYcCXt4Av2H5ftlNqqMkiCaRWHCgVbL8mlEghPtSauazZJYcUOkpBYkRTCsNvFzNoIGlYpP4X543BMTpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXRsJaxDdzqBuol21e0hDirRa7pGcnxOdycn8FI/NubPPBiep
	xe6iTrw6r2bePNdznep3+79RiKg8aHA7YlB69TxTMAH0kttYGcEQnQiMiJQU5XS6x3o=
X-Gm-Gg: ASbGnctjf6Yiuf57q/osb3HeBuBSHz8O5jLss5LioeVZZqlNXgdcw7I5woHjq1xyrIe
	n6Bnpx4BHP6TiKQKDbazaPyS5KXJOg6qZ+axMSJvF8GC3dgFBvjM2NLqZKxQBMPWjNuk6kFVTIk
	jiJsNrR3C1T64X1kRoUpR5gh5qLuVwCcKh4fkrqQkNRVQ44lEwpevAa1dlHEHk1aPVqE8uizWVn
	CPMnYtVwd45rwyXvJOt49EE+BmcSSiI49+HPFFx3Z6kS9MXWHH2wRMuQfKpNDUCpj8Si4/hDv8P
	yXfoT2GN5K/ihs+ILX9XmyUAVqxq23IVgm+o6X4q2hdQw2FHGPRmG18rMJKNDKOzbWQOymAGeTS
	og7sj8r68/2Qv6v8DTcmXKwN62LPmfk+M07npVcE/JfRixlkeFUvO8tvK+u9NID8suNXaBKl02w
	Xl9K1T07d1Nqpa786Y5lnJ
X-Google-Smtp-Source: AGHT+IG+wSKB/nJlp2hdV7B+ZukcidbStJET4Io+vE4TA+UKP1A0EgQjVCYy5IHJP+9G/aovhCo/hQ==
X-Received: by 2002:a05:600c:204b:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-477b9ee4fd0mr168302815e9.12.1764154664628;
        Wed, 26 Nov 2025 02:57:44 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:32 +0000
Subject: [PATCH v7 03/13] coresight: Refactor etm4_config_timestamp_event()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-3-7fae5e0e5e16@linaro.org>
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

Remove some of the magic numbers and try to clarify some of the
documentation so it's clearer how this sets up the timestamp interval.

Return errors directly instead of jumping to out and returning ret,
nothing needs to be cleaned up at the end and it only obscures the flow
and return value.

Add utilities for programming resource selectors that do compile time
checks for constants or WARN_ONs for non-constant values. FIELD_PREP
includes compile time checks so we only need to add an additional
BUILD_BUG_ON for resource == 0 in pair mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 54 ++++++++++--
 2 files changed, 112 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 560975b70474..2ec2ae1fef58 100644
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
+	 * RLDEVENT = RES_SEL_FALSE (0), reload on single false resource (never reload)
+	 * CNTEVENT = RES_SEL_TRUE (1), count single fixed 'always true' resource (always decrement)
+	 */
+	config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
+				    FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
+					       etm4_res_sel_single(ETM4_RES_SEL_FALSE)) |
+				    FIELD_PREP(TRCCNTCTLRn_CNTEVENT_MASK,
+					       etm4_res_sel_single(ETM4_RES_SEL_TRUE));
 
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
+	 * EVENT = generate timestamp on single resource 'rselector'
+	 */
+	config->ts_ctrl = FIELD_PREP(TRCTSCTLR_EVENT_MASK,
+				     etm4_res_sel_single(rselector));
 
-	ret = 0;
-out:
-	return ret;
+	return 0;
 }
 
 static int etm4_parse_event_config(struct coresight_device *csdev,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index d178d79d9827..89d81ce4e04e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -225,6 +225,50 @@
 #define TRCRSCTLRn_GROUP_MASK			GENMASK(19, 16)
 #define TRCRSCTLRn_SELECT_MASK			GENMASK(15, 0)
 
+#define TRCCNTCTLRn_CNTCHAIN			BIT(17)
+#define TRCCNTCTLRn_RLDSELF			BIT(16)
+#define TRCCNTCTLRn_RLDEVENT_MASK		GENMASK(15, 8)
+#define TRCCNTCTLRn_CNTEVENT_MASK		GENMASK(7, 0)
+
+#define TRCTSCTLR_EVENT_MASK			GENMASK(7, 0)
+
+#define ETM4_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
+#define ETM4_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
+
+#define ETM4_RES_SEL_SINGLE_MASK		GENMASK(4, 0)
+#define ETM4_RES_SEL_PAIR_MASK			GENMASK(3, 0)
+#define ETM4_RES_SEL_TYPE_PAIR			BIT(7)
+
+/*
+ * Utilities for programming EVENT resource selectors, e.g. TRCCNTCTLRn_RLDEVENT.
+ *
+ * Resource selectors have a common format across registers:
+ *
+ *    7     6  5  4     0
+ * +------+------+-------+
+ * | TYPE | RES0 |  SEL  |
+ * +------+------+-------+
+ *
+ * Where TYPE indicates whether the selector is for a single event or a pair.
+ * When TYPE is pair, SEL is 4 bits wide and using pair 0 is UNPREDICTABLE.
+ * Otherwise for single it's 5 bits wide.
+ */
+static inline u32 etm4_res_sel_single(u8 res_sel_idx)
+{
+	WARN_ON_ONCE(!FIELD_FIT(ETM4_RES_SEL_SINGLE_MASK, res_sel_idx));
+	return FIELD_PREP(ETM4_RES_SEL_SINGLE_MASK, res_sel_idx);
+}
+
+static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
+{
+	if (__builtin_constant_p(res_sel_idx))
+		BUILD_BUG_ON(res_sel_idx == 0);
+	WARN_ON_ONCE(!FIELD_FIT(ETM4_RES_SEL_PAIR_MASK, res_sel_idx) ||
+		     (res_sel_idx == 0));
+	return FIELD_PREP(ETM4_RES_SEL_PAIR_MASK, res_sel_idx) |
+	       ETM4_RES_SEL_TYPE_PAIR;
+}
+
 /*
  * System instructions to access ETM registers.
  * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
@@ -824,7 +868,7 @@ struct etmv4_config {
 	u32				eventctrl0;
 	u32				eventctrl1;
 	u32				stall_ctrl;
-	u32				ts_ctrl;
+	u32				ts_ctrl; /* TRCTSCTLR */
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -837,11 +881,11 @@ struct etmv4_config {
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

