Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2434A7DCEA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfJOVUy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:20:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42476 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfJOVUy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:20:54 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so25492417wrw.9
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JRO3tClUzpMi9acjR3thqehN+ENGTOGjbtCc0AW0Fs8=;
        b=rcPC9SKwb8Zv8jq74ZzC+zkAEzX+eMOYIP5T/0XiMyNrcuSYsh4SIcU/6o9bnjL1B+
         TzpFvCTfZaD+y977GS9kvLl75WuuTM1qvG19NrjV+oUNG/UrUZKOPDL9SR+66fN9bpVM
         bJLIw+9aSsGhsb4jP9JopFUY2DzhGthEsuSOgpPyTCpF45etZbIRIGH2DtDltc+bGb1L
         rb1kCBIt/xrg9XmmmuNaGks7oFcRre64qhh3f7LG0IlAt8Wn+hDd3bsKmz9GelL9jfXm
         q32DkCdgOzj2L/1urJXzztiEZZWPlJPmW5Vn6kDKL9M+ICyIqPbp9mKY/ia1Z8GLTL4l
         adOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JRO3tClUzpMi9acjR3thqehN+ENGTOGjbtCc0AW0Fs8=;
        b=onpbZsmVByxhxk453HPdJd9Xe4dJy1Sqdbo2NgfC3ymhpqUZu2V2D54VooPbB7r+Md
         ttYL80a/EKqrxD9t0hNBGXhAl4MvjqgXJT2VGbW0Ic8NtfpUqctXFLLM8Sw3R9w2y+pO
         9DvNB6WXbThj40EbrwmrVFXuV8qWXdnOJDmgsH6mr4fkWAKxTEwepdjAYaSpL6c0ogc1
         FXkYBXPXQ27QcT4dtpZnF8Ss7Llfa+2SkOt2DHEgTmRdQSLbGF+d5nzytFq4beWyFRw3
         uB4eyiUEO9gFIBRWuUG7vohQGUC1I3zx8WctI52YJ4KsakaVbU71sKToq9chT6PO2dFM
         F4Zg==
X-Gm-Message-State: APjAAAVqfCUz9MbhJjsWH3LlEMJSHbmKxAV1aQI1pJyxZWmS9chDruwJ
        vCK1Wj4bP8NHo4og1K4PRuSkJg==
X-Google-Smtp-Source: APXvYqyY9s+if0u6fzoBhmY8qkQfL9fhhKAiFpjfY2QjZPxZhtz8OI3u5kWOiie5uvm9+0pTsueXhQ==
X-Received: by 2002:a05:6000:1c7:: with SMTP id t7mr2595316wrx.198.1571174451413;
        Tue, 15 Oct 2019 14:20:51 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:50 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 01/11] coresight: etm4x: Fixes for ETM v4.4 architecture updates.
Date:   Tue, 15 Oct 2019 22:19:54 +0100
Message-Id: <20191015212004.24748-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ETMv4.4 adds in support for tracing secure EL2 (per arch 8.x updates).
Patch accounts for this new capability.

Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-etm4x-sysfs.c   | 12 ++++++------
 drivers/hwtracing/coresight/coresight-etm4x.c     |  5 ++++-
 drivers/hwtracing/coresight/coresight-etm4x.h     | 15 +++++++++++----
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 219c10eb752c..b6984be0c515 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -738,7 +738,7 @@ static ssize_t s_exlevel_vinst_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etmv4_config *config = &drvdata->config;
 
-	val = BMVAL(config->vinst_ctrl, 16, 19);
+	val = (config->vinst_ctrl & ETM_EXLEVEL_S_VICTLR_MASK) >> 16;
 	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
 }
 
@@ -754,8 +754,8 @@ static ssize_t s_exlevel_vinst_store(struct device *dev,
 		return -EINVAL;
 
 	spin_lock(&drvdata->spinlock);
-	/* clear all EXLEVEL_S bits (bit[18] is never implemented) */
-	config->vinst_ctrl &= ~(BIT(16) | BIT(17) | BIT(19));
+	/* clear all EXLEVEL_S bits  */
+	config->vinst_ctrl &= ~(ETM_EXLEVEL_S_VICTLR_MASK);
 	/* enable instruction tracing for corresponding exception level */
 	val &= drvdata->s_ex_level;
 	config->vinst_ctrl |= (val << 16);
@@ -773,7 +773,7 @@ static ssize_t ns_exlevel_vinst_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	/* EXLEVEL_NS, bits[23:20] */
-	val = BMVAL(config->vinst_ctrl, 20, 23);
+	val = (config->vinst_ctrl & ETM_EXLEVEL_NS_VICTLR_MASK) >> 20;
 	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
 }
 
@@ -789,8 +789,8 @@ static ssize_t ns_exlevel_vinst_store(struct device *dev,
 		return -EINVAL;
 
 	spin_lock(&drvdata->spinlock);
-	/* clear EXLEVEL_NS bits (bit[23] is never implemented */
-	config->vinst_ctrl &= ~(BIT(20) | BIT(21) | BIT(22));
+	/* clear EXLEVEL_NS bits  */
+	config->vinst_ctrl &= ~(ETM_EXLEVEL_NS_VICTLR_MASK);
 	/* enable instruction tracing for corresponding exception level */
 	val &= drvdata->ns_ex_level;
 	config->vinst_ctrl |= (val << 20);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index 8f98701cadc5..efe120925f9d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -648,6 +648,7 @@ static void etm4_init_arch_data(void *info)
 	 * TRCARCHMAJ, bits[11:8] architecture major versin number
 	 */
 	drvdata->arch = BMVAL(etmidr1, 4, 11);
+	drvdata->config.arch = drvdata->arch;
 
 	/* maximum size of resources */
 	etmidr2 = readl_relaxed(drvdata->base + TRCIDR2);
@@ -799,6 +800,7 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
 static u64 etm4_get_access_type(struct etmv4_config *config)
 {
 	u64 access_type = etm4_get_ns_access_type(config);
+	u64 s_hyp = (config->arch & 0x0f) >= 0x4 ? ETM_EXLEVEL_S_HYP : 0;
 
 	/*
 	 * EXLEVEL_S, bits[11:8], don't trace anything happening
@@ -806,7 +808,8 @@ static u64 etm4_get_access_type(struct etmv4_config *config)
 	 */
 	access_type |= (ETM_EXLEVEL_S_APP	|
 			ETM_EXLEVEL_S_OS	|
-			ETM_EXLEVEL_S_HYP);
+			s_hyp			|
+			ETM_EXLEVEL_S_MON);
 
 	return access_type;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 546d790cb01b..b873df38e7d8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -181,17 +181,22 @@
 /* PowerDown Control Register bits */
 #define TRCPDCR_PU			BIT(3)
 
-/* secure state access levels */
+/* secure state access levels - TRCACATRn */
 #define ETM_EXLEVEL_S_APP		BIT(8)
 #define ETM_EXLEVEL_S_OS		BIT(9)
-#define ETM_EXLEVEL_S_NA		BIT(10)
-#define ETM_EXLEVEL_S_HYP		BIT(11)
-/* non-secure state access levels */
+#define ETM_EXLEVEL_S_HYP		BIT(10)
+#define ETM_EXLEVEL_S_MON		BIT(11)
+/* non-secure state access levels - TRCACATRn */
 #define ETM_EXLEVEL_NS_APP		BIT(12)
 #define ETM_EXLEVEL_NS_OS		BIT(13)
 #define ETM_EXLEVEL_NS_HYP		BIT(14)
 #define ETM_EXLEVEL_NS_NA		BIT(15)
 
+/* secure / non secure masks - TRCVICTLR, IDR3 */
+#define ETM_EXLEVEL_S_VICTLR_MASK	GENMASK(19, 16)
+/* NS MON (EL3) mode never implemented */
+#define ETM_EXLEVEL_NS_VICTLR_MASK	GENMASK(22, 20)
+
 /**
  * struct etmv4_config - configuration information related to an ETMv4
  * @mode:	Controls various modes supported by this ETM.
@@ -238,6 +243,7 @@
  * @vmid_mask0:	VM ID comparator mask for comparator 0-3.
  * @vmid_mask1:	VM ID comparator mask for comparator 4-7.
  * @ext_inp:	External input selection.
+ * @arch:	ETM architecture version (for arch dependent config).
  */
 struct etmv4_config {
 	u32				mode;
@@ -280,6 +286,7 @@ struct etmv4_config {
 	u32				vmid_mask0;
 	u32				vmid_mask1;
 	u32				ext_inp;
+	u8				arch;
 };
 
 /**
-- 
2.17.1

