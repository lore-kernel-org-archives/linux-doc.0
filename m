Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 594D47D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfH2Vdm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42067 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727730AbfH2Vdl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id b16so4862498wrq.9
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IUpxdBbuyh3a87gcEoHyMqzcVkq4Eq6NtvG2AC20Paw=;
        b=L+WiNHs7Ar5T2FcY+OQ8QSFVfB27JQ8Ci5pTghYtrwLrF99qLo8D5nEfdzGjsZx3OO
         fw0tTvTGi1Q/l8AQn8LzTesMJ3HYan3/ZbAHFBhdTbGbJupyzy7nC0gFADWNCodJJZ7N
         S9pnRqMnink0Z0OQlQ70bEib7+bvwudvFrQ31CEX8CAikEsFKfjwmb1hndcUPDLk2muJ
         kSXY3Z9bkQ8kICJawZQT6/A6s5UPO4OSlyHpQ1P/MWUjnu2BQgONK3E176qMNwFOMFiO
         pSU30xWzY16wRnmmTIVfewThVdDPsv0eskX6C3DKyrJsDf7U4Zn02sAWHVaWhOhWc4fc
         EwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IUpxdBbuyh3a87gcEoHyMqzcVkq4Eq6NtvG2AC20Paw=;
        b=PQKW2foXBuX9+Z2qti2hQPLswobV13rJwgDsgOWJ3ZwMIoJpTRFFazdch0QnrbHR0F
         D4HqOxhsX5fdhbL4vBp72oOe9NXl9c1/dEFgAySrWdGhbs+fHAZ/KG20QLaUCcaw50IN
         y8nvb6iqIYxM28Q6tx8eGacvIjqv93Z4gifJHxKyL97Ush9oEYqTW0F2O2e9zfXZJXsQ
         Tl1v3sW+7SDuoMvus3f/MIj1FFskF5zFE+BjTbHIRsE1IPtiI0OenSo2E33oNBpU8aaJ
         AHCwi0XdSMgm47qMcD9M5NJRpKbCezxnVFosqXtzkyExAozKhdhy7BQKEy7um3cpO3BC
         cM9A==
X-Gm-Message-State: APjAAAV3xe+Rzw9JDOp0kdbsf5+3yeS/+/Covy1OX7XKMtPfq/we0QCe
        gISBHABq0lbDNnyw9Fd7CYJS4g==
X-Google-Smtp-Source: APXvYqzgvs1l98ZXVHNo45s6lXnRm9PCGXid+lBiuCLG6tFMFspiSK/GnWYWysz8SivbpFqYDJkvLw==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr6836282wrw.95.1567114418358;
        Thu, 29 Aug 2019 14:33:38 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:37 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 08/11] coresight: etm4x: Add missing single-shot control API to sysfs
Date:   Thu, 29 Aug 2019 22:33:18 +0100
Message-Id: <20190829213321.4092-9-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An API to control single-shot comparator operation was missing from sysfs.
This adds the parameters to sysfs to allow programming of this feature.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-etm4x-sysfs.c         | 122 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm4x.c |  26 +++-
 drivers/hwtracing/coresight/coresight-etm4x.h |   3 +
 3 files changed, 150 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index a8c9eadfe56f..14be3274f8d9 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -239,6 +239,7 @@ static ssize_t reset_store(struct device *dev,
 	for (i = 0; i < drvdata->nr_resource; i++)
 		config->res_ctrl[i] = 0x0;
 
+	config->ss_idx = 0x0;
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		config->ss_ctrl[i] = 0x0;
 		config->ss_pe_cmp[i] = 0x0;
@@ -1717,6 +1718,123 @@ static ssize_t res_ctrl_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(res_ctrl);
 
+static ssize_t sshot_idx_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	val = config->ss_idx;
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+
+static ssize_t sshot_idx_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+	if (val >= drvdata->nr_ss_cmp)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	config->ss_idx = val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(sshot_idx);
+
+static ssize_t sshot_ctrl_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	spin_lock(&drvdata->spinlock);
+	val = config->ss_ctrl[config->ss_idx];
+	spin_unlock(&drvdata->spinlock);
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+
+static ssize_t sshot_ctrl_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	u8 idx;
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	idx = config->ss_idx;
+	config->ss_ctrl[idx] = val & GENMASK(24, 0);
+	/* must clear bit 31 in related status register on programming */
+	config->ss_status[idx] &= ~BIT(31);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(sshot_ctrl);
+
+static ssize_t sshot_status_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	spin_lock(&drvdata->spinlock);
+	val = config->ss_status[config->ss_idx];
+	spin_unlock(&drvdata->spinlock);
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(sshot_status);
+
+static ssize_t sshot_pe_ctrl_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	spin_lock(&drvdata->spinlock);
+	val = config->ss_pe_cmp[config->ss_idx];
+	spin_unlock(&drvdata->spinlock);
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+
+static ssize_t sshot_pe_ctrl_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	u8 idx;
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	idx = config->ss_idx;
+	config->ss_pe_cmp[idx] = val & GENMASK(7, 0);
+	/* must clear bit 31 in related status register on programming */
+	config->ss_status[idx] &= ~BIT(31);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(sshot_pe_ctrl);
+
 static ssize_t ctxid_idx_show(struct device *dev,
 			      struct device_attribute *attr,
 			      char *buf)
@@ -2173,6 +2291,10 @@ static struct attribute *coresight_etmv4_attrs[] = {
 	&dev_attr_addr_exlevel_s_ns.attr,
 	&dev_attr_addr_cmp_view.attr,
 	&dev_attr_vinst_pe_cmp_start_stop.attr,
+	&dev_attr_sshot_idx.attr,
+	&dev_attr_sshot_ctrl.attr,
+	&dev_attr_sshot_pe_ctrl.attr,
+	&dev_attr_sshot_status.attr,
 	&dev_attr_seq_idx.attr,
 	&dev_attr_seq_state.attr,
 	&dev_attr_seq_event.attr,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index d8b078d0cc7f..fb7083218410 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -149,6 +149,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 			       drvdata->base + TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
+		/* always clear status bit on restart if using single-shot */
+		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
+			config->ss_status[i] &= ~BIT(31);
 		writel_relaxed(config->ss_ctrl[i],
 			       drvdata->base + TRCSSCCRn(i));
 		writel_relaxed(config->ss_status[i],
@@ -448,6 +451,9 @@ static void etm4_disable_hw(void *info)
 {
 	u32 control;
 	struct etmv4_drvdata *drvdata = info;
+	struct etmv4_config *config = &drvdata->config;
+	struct device *etm_dev = &drvdata->csdev->dev;
+	int i;
 
 	CS_UNLOCK(drvdata->base);
 
@@ -470,6 +476,18 @@ static void etm4_disable_hw(void *info)
 	isb();
 	writel_relaxed(control, drvdata->base + TRCPRGCTLR);
 
+	/* wait for TRCSTATR.PMSTABLE to go to '1' */
+	if (coresight_timeout(drvdata->base, TRCSTATR,
+			      TRCSTATR_PMSTABLE_BIT, 1))
+		dev_err(etm_dev,
+			"timeout while waiting for PM stable Trace Status\n");
+
+	/* read the status of the single shot comparators */
+	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
+		config->ss_status[i] =
+			readl_relaxed(drvdata->base + TRCSSCSRn(i));
+	}
+
 	coresight_disclaim_device_unlocked(drvdata->base);
 
 	CS_LOCK(drvdata->base);
@@ -576,6 +594,7 @@ static void etm4_init_arch_data(void *info)
 	u32 etmidr4;
 	u32 etmidr5;
 	struct etmv4_drvdata *drvdata = info;
+	int i;
 
 	/* Make sure all registers are accessible */
 	etm4_os_unlock(drvdata);
@@ -699,9 +718,14 @@ static void etm4_init_arch_data(void *info)
 	drvdata->nr_resource = BMVAL(etmidr4, 16, 19) + 1;
 	/*
 	 * NUMSSCC, bits[23:20] the number of single-shot
-	 * comparator control for tracing
+	 * comparator control for tracing. Read any status regs as these
+	 * also contain RO capability data.
 	 */
 	drvdata->nr_ss_cmp = BMVAL(etmidr4, 20, 23);
+	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
+		drvdata->config.ss_status[i] =
+			readl_relaxed(drvdata->base + TRCSSCSRn(i));
+	}
 	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
 	drvdata->numcidc = BMVAL(etmidr4, 24, 27);
 	/* NUMVMIDC, bits[31:28] number of VMID comparators for tracing */
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 60bc2fb5159b..be8b32ea1654 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -175,6 +175,7 @@
 					 ETM_MODE_EXCL_USER)
 
 #define TRCSTATR_IDLE_BIT		0
+#define TRCSTATR_PMSTABLE_BIT		1
 #define ETM_DEFAULT_ADDR_COMP		0
 
 /* PowerDown Control Register bits */
@@ -226,6 +227,7 @@
  * @cntr_val:	Sets or returns the value for a counter.
  * @res_idx:	Resource index selector.
  * @res_ctrl:	Controls the selection of the resources in the trace unit.
+ * @ss_idx:	Single-shot index selector.
  * @ss_ctrl:	Controls the corresponding single-shot comparator resource.
  * @ss_status:	The status of the corresponding single-shot comparator.
  * @ss_pe_cmp:	Selects the PE comparator inputs for Single-shot control.
@@ -269,6 +271,7 @@ struct etmv4_config {
 	u32				cntr_val[ETMv4_MAX_CNTR];
 	u8				res_idx;
 	u32				res_ctrl[ETM_MAX_RES_SEL];
+	u8				ss_idx;
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
-- 
2.17.1

