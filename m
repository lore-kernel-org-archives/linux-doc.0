Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F3897D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfH2Vdd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38027 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfH2Vdc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id o184so5275726wme.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2w4g0hv2dCoQnzKavIBKlnm3JmTFuYimQDrQU5XJPIM=;
        b=qCCHB5yl+KAFf4nD5Lb5bJRmI1kdRGb9cPD+Wq+C+1ZZLOJ6g55O8B/JjKRiGSM/iT
         LzJ5R56rk8bmfc0EC0Xi2ih3NX6cQ8GV9J1epI17cpCPOwpTMaMdH6XhmtGAQvabWzFP
         IU6RCRtgnNwhP0mBiUD8+X12XL71yV0/F7gnv7OcyeYeaVVp+2T8IeUVfUKmOixAbo1d
         C1dNA49r3KVLrhGJCIRXkjoP7r1dbshBvAcKm7TUOJlbw8uLF4MDrWORAk7mPucM0OYr
         Q2CPt34+qVjFM2KeAt8qyxYeFkoGSLP2rlEV6Aqvv7xJRRrL2qUjuRghj5OL5/tpmX+z
         zIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2w4g0hv2dCoQnzKavIBKlnm3JmTFuYimQDrQU5XJPIM=;
        b=JBWpx4Gj2Vxm8r6yyupz1sHPwD1zw7CuUPUGvTXVxvwv4zgMOIoJpamnRgGNO1DhRC
         DArj4GXORcUqXH2KvT4ocATYUQko1Zels9k8RFfihGOzZvgtNhlphqSh8tne+QEsYdds
         1Z/EzJl02IWCDyoYQI6oCAVvXzW0Cs2rJuAxBJ+moLqaISpwDDWmP2ReherekoBw3skC
         ixbEQzzToASyPwhSagJ66NZ6cLAdwfliIw7Wizk7QkV1XAgO07TQkW9F5HfMN0pahjBl
         WgJKD6SSQm2C79qiZfYQo/TtcuWSG9fc9WPo/V4AxA9Sby+LCh6hVJp7B5FGjWoiBswh
         UGfg==
X-Gm-Message-State: APjAAAXdNm1Ia6DgBVJjsNf5N7PZm+jq3DY+5iqy3hyaUjO7b/BEEUG5
        O3tKzrBBKaHrXtXDiEWLb0o6ng==
X-Google-Smtp-Source: APXvYqxAqBuakJJaraJJM7RvKRUsvpgQpQ+E+gIVglNbM4I8elt3dENaflGj+3d4TMxrI5Ns31vtvA==
X-Received: by 2002:a05:600c:40f:: with SMTP id q15mr14433310wmb.88.1567114410706;
        Thu, 29 Aug 2019 14:33:30 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:30 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 01/11] coresight: etm4x: Fixes for ETM v4.4 architecture updates.
Date:   Thu, 29 Aug 2019 22:33:11 +0100
Message-Id: <20190829213321.4092-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
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
index a128b5063f46..52b8876de157 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -629,6 +629,7 @@ static void etm4_init_arch_data(void *info)
 	 * TRCARCHMAJ, bits[11:8] architecture major versin number
 	 */
 	drvdata->arch = BMVAL(etmidr1, 4, 11);
+	drvdata->config.arch = drvdata->arch;
 
 	/* maximum size of resources */
 	etmidr2 = readl_relaxed(drvdata->base + TRCIDR2);
@@ -780,6 +781,7 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
 static u64 etm4_get_access_type(struct etmv4_config *config)
 {
 	u64 access_type = etm4_get_ns_access_type(config);
+	u64 s_hyp = (config->arch & 0x0f) >= 0x4 ? ETM_EXLEVEL_S_HYP : 0;
 
 	/*
 	 * EXLEVEL_S, bits[11:8], don't trace anything happening
@@ -787,7 +789,8 @@ static u64 etm4_get_access_type(struct etmv4_config *config)
 	 */
 	access_type |= (ETM_EXLEVEL_S_APP	|
 			ETM_EXLEVEL_S_OS	|
-			ETM_EXLEVEL_S_HYP);
+			s_hyp			|
+			ETM_EXLEVEL_S_MON);
 
 	return access_type;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 4523f10ddd0f..60bc2fb5159b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -180,17 +180,22 @@
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
@@ -237,6 +242,7 @@
  * @vmid_mask0:	VM ID comparator mask for comparator 0-3.
  * @vmid_mask1:	VM ID comparator mask for comparator 4-7.
  * @ext_inp:	External input selection.
+ * @arch:	ETM architecture version (for arch dependent config).
  */
 struct etmv4_config {
 	u32				mode;
@@ -279,6 +285,7 @@ struct etmv4_config {
 	u32				vmid_mask0;
 	u32				vmid_mask1;
 	u32				ext_inp;
+	u8				arch;
 };
 
 /**
-- 
2.17.1

