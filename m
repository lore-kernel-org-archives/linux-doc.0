Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D252C308F2E
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399801; cv=none; b=WyvFIHGOkNoHQ5et98g+BGK/BJZfV3Co0/DQ7mxVcBiQYeZrxob2xLZmqMu9mcM389ABhjfHK/0JiaoknS5UWpVOhgiH9nS5B2oJaF+uszH8jXjYaPn8cg31LepBn4PXpalGF3E9rbn3Kjac0+9FgRLspa70FzOLbjsfDb2vg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399801; c=relaxed/simple;
	bh=UXpmOf9WKFh880rULEqIFTD7qKGy9sL3eotehBeXefA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWtuObgbI0lvX+HNE+H4bSHyXXCyG0FqZsShB3t4HV1//DPWNdzSxmG/57+vxpUfpvtc7lWSvVxnw8Q6nR/Bx9p12anfA9ng2BiWc2Y1ZDURghgWJeWSSeVIuwTjCzmBsEiBazmBC/732rl9coQo1goNzSgR/DVJv8vLf2nvFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvvmny1T; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvvmny1T"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so550927f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399798; x=1760004598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gfIuiE3LJEdVJDNgWrbhJi8hqeBptQAiRlGx7TMVvA=;
        b=rvvmny1ThCyPe77d8Ot2Xfgsu46r0NnmcYktbJR6FiHmyWU8Tq85nTlBx1/XAdJsf/
         iOJF3mdXSpkItlaZYlcOqD9bjcp4GpRCTosT/BY6s3nsCIBBo7h6fKqbgRrHVOnjjqvP
         LFuxUuR7xU77KT1MVzClKa3hIdlAignJsvg4VL8JPQCtKyK5t2G6jkZjcf4QOICHVfSq
         Ct4virHVjKCVRqduPvfHTWZVqv8AuXZTZPjxQt1mj8mlCSnEYVL4qojgUpurGxeN0Fml
         pj+fZ0E+AMkYi4qltIQnFIn3X4CGdAZRFRheU2z1pMQ2rHK29CFNtFQ+Bm4nVZI743br
         fgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399798; x=1760004598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gfIuiE3LJEdVJDNgWrbhJi8hqeBptQAiRlGx7TMVvA=;
        b=LQ91LaioXbJucck36R/8qJWkVaopfaWgE1tWnxqbQey2mQkasucBdeUGYOCLoEd332
         Ilulfs70GVT8bq1raVpKmFlxsMkCXlQbI9kJmX+H5zk6XkJNqwUOsCusAki55X8PdZxn
         o9+N4KQLIeT7wXgRIjpKPcG8Qms1f64RnJ0hz+aQ/O5nbxjjKZoouNd6nF0EHbmg+90T
         KwotzhVRWiM4CBktIdRouol1LQVuB/DkctJY4PVee9j7AW3YCKmfK26S6hcQgkESqQ1x
         jqLQLVXWCMhVzPJQIArb+VkWZkyzjh0J3sBKxClwFra4a9eBT0+6xaYoM8JzbNfSvdU4
         WZgA==
X-Forwarded-Encrypted: i=1; AJvYcCW894KjU8P0ttK/cIkNS+QdC49R2kV4gm3OUQiE3PJT1FGF4Oz/NQmNhporX0iolVWuMwhmR7q3USo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9ByE6wJP5jqqZuvXBabvltehl7km68ryF+MrOB23Yyh/iJTZ
	LHdB3laPGxZguu/FeI8F72bn5RtFZoShacxeew8AQo1UGbs3cegC7rYdLtnQ7/6KRso=
X-Gm-Gg: ASbGncu2xBm/MJO/GEN70aWiGezaS+qo3vfMC38SjZVQZCFAXq+3d1hi6fPW3dHFlt2
	hsIQp1faXE29SL9FUwJ8n/6yRhlVxjDitMEtT9jtB0DER98VFr8WyDYA02bOXZH+ChycwHqCduC
	ITS7p471Ge8ESHmT5op6HP39n+6UHRNtFw0XRgaqrw1XDsVk0drtxu6whqpl6Jth99sUHgszn0p
	C5yaVDfHLygekL0UdUXW/hp6mu5zfwpOm1jAfPDnc9wpOIl5QvM67ghclF6v2qpaAF3Yfwej9E7
	QKioApU+1GFSN8WejVRGgb+RC2ZFa5h2Z5lAHf2MCN1Yqnm0YTiWQZEeUKE7zMFdrn4bwDUz7sb
	65XdQaBrQ2588FbtFlls7h0BQWH8ZSu4b3eFUHk2dSI04ncXs4+0EWOYUlulf
X-Google-Smtp-Source: AGHT+IEOy63eG3K5aHs5CuS2LFA89S65k8xgMA7fc/l6sPK2HP7fKWtkhBHu3PMXiWaMaccgVNHdaw==
X-Received: by 2002:a05:6000:60f:b0:405:8ef9:ee6e with SMTP id ffacd0b85a97d-42557808718mr4928996f8f.25.1759399798180;
        Thu, 02 Oct 2025 03:09:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:57 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:31 +0100
Subject: [PATCH v3 3/5] coresight: Refactor etm4_config_timestamp_event()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-3-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 95 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 20 +++--
 2 files changed, 77 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 020f070bf17d..920d092ef862 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -609,18 +609,33 @@ static void etm4_enable_hw_smp_call(void *info)
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
@@ -630,15 +645,17 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -647,13 +664,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
@@ -661,26 +674,42 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
index 813e7208ad17..a06338851ef5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -225,6 +225,16 @@
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
@@ -824,7 +834,7 @@ struct etmv4_config {
 	u32				eventctrl0;
 	u32				eventctrl1;
 	u32				stall_ctrl;
-	u32				ts_ctrl;
+	u32				ts_ctrl; /* TRCTSCTLR */
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -837,11 +847,11 @@ struct etmv4_config {
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

