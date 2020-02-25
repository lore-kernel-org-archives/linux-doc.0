Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55484C4BA0C
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A2F42072D
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fX/tz/TG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbgBYXqe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 18:46:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39968 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729090AbgBYXqe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 18:46:34 -0500
Received: by mail-wr1-f66.google.com with SMTP id t3so757205wru.7
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 15:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tDhVs6CVDINJ1HNHUEVGjWNjJ7PiR8LnUgb8ARuG2ic=;
        b=fX/tz/TG51Ku1LPGk4c/OACF8lA9JX7J7eUJ5N6Nq42/JUqhcf4V2J1c1tbTN9dBaT
         /MWYRy/rEEwG8K1u+gOGC/u1dPzSNNE307iffbGvgoUGop77zoQBFSdow3jpFCajM+aD
         1GvJ6hjk1hguSAcmr3pZPDflYCZS3lHewAv/Ooiq2H9RXYgjohd3JlcTdK8/Y7qP8/v4
         EkprqPZ/v5kP2qhkX7dzHOUGyXDBms8qKT/VlIRICO86+Mv5AddvtWmrIRXiLlfp/JwG
         x6pku3mXXSeNCAnRBSaObVq6XDTVtE4zTSMwLPuw7d8AANK3M3LnzU1OYYCdVuqTCXti
         90/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tDhVs6CVDINJ1HNHUEVGjWNjJ7PiR8LnUgb8ARuG2ic=;
        b=i51neDs+ifSYiOCt5aSPHB0sYyfyMKw+Zerh6u5sP/FHEdgeKt/NESX6ED4Rh8/Oll
         DCMODoupnN3E/If518BF4U9huqBzWbAq0J58eep1mDK70BSAno47tFrhSf+CQzjkrL9M
         IWtGxZUh67GjOP+cbwOBWrphx9GpZkIDSk78vMiimun1SnS1CdMv0EijPHQani2xSbVH
         3J43ZGpgu+Cu+uxwI4+ZUa5T07M2bu5S+OMLtnc5Wzi8BX0UwwRBBy6766UHRdnx7k95
         3YxLfEg5wrCLLCf1SpAACBxa2xCLTq+nFTaDSU6WN199x14i2JhyBBz5722nlYbhh/VW
         P8hg==
X-Gm-Message-State: APjAAAUqj0D6hR7ROW2buO1PF5X4EzMo3GSnMehIMGeo8DrVJyD7bbLe
        1Xn/94mWrqVU85edqLh8Z6jD6A==
X-Google-Smtp-Source: APXvYqw/0xPxgnl7aeDKR5mzbKyWwiPyvdFy76euk72B/l147vIAmjWTVbVfrHYLYMuc7RrLvlHxiw==
X-Received: by 2002:a05:6000:188:: with SMTP id p8mr1522247wrx.336.1582674392490;
        Tue, 25 Feb 2020 15:46:32 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:186c:5f6c:221d:5ce])
        by smtp.gmail.com with ESMTPSA id t133sm356278wmf.31.2020.02.25.15.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 15:46:32 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v10 02/15] coresight: cti: Add sysfs coresight mgmt reg access
Date:   Tue, 25 Feb 2020 23:45:58 +0000
Message-Id: <20200225234611.11067-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225234611.11067-1-mike.leach@linaro.org>
References: <20200225234611.11067-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds sysfs access to the coresight management registers.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 .../hwtracing/coresight/coresight-cti-sysfs.c | 53 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h  |  1 +
 2 files changed, 54 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index a832b8c6b866..507f8eb487fe 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -62,11 +62,64 @@ static struct attribute *coresight_cti_attrs[] = {
 	NULL,
 };
 
+/* register based attributes */
+
+/* macro to access RO registers with power check only (no enable check). */
+#define coresight_cti_reg(name, offset)			\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr, char *buf)	\
+{									\
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
+	u32 val = 0;							\
+	pm_runtime_get_sync(dev->parent);				\
+	spin_lock(&drvdata->spinlock);					\
+	if (drvdata->config.hw_powered)					\
+		val = readl_relaxed(drvdata->base + offset);		\
+	spin_unlock(&drvdata->spinlock);				\
+	pm_runtime_put_sync(dev->parent);				\
+	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);		\
+}									\
+static DEVICE_ATTR_RO(name)
+
+/* coresight management registers */
+coresight_cti_reg(devaff0, CTIDEVAFF0);
+coresight_cti_reg(devaff1, CTIDEVAFF1);
+coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS);
+coresight_cti_reg(devarch, CORESIGHT_DEVARCH);
+coresight_cti_reg(devid, CORESIGHT_DEVID);
+coresight_cti_reg(devtype, CORESIGHT_DEVTYPE);
+coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0);
+coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1);
+coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2);
+coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3);
+coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4);
+
+static struct attribute *coresight_cti_mgmt_attrs[] = {
+	&dev_attr_devaff0.attr,
+	&dev_attr_devaff1.attr,
+	&dev_attr_authstatus.attr,
+	&dev_attr_devarch.attr,
+	&dev_attr_devid.attr,
+	&dev_attr_devtype.attr,
+	&dev_attr_pidr0.attr,
+	&dev_attr_pidr1.attr,
+	&dev_attr_pidr2.attr,
+	&dev_attr_pidr3.attr,
+	&dev_attr_pidr4.attr,
+	NULL,
+};
+
 static const struct attribute_group coresight_cti_group = {
 	.attrs = coresight_cti_attrs,
 };
 
+static const struct attribute_group coresight_cti_mgmt_group = {
+	.attrs = coresight_cti_mgmt_attrs,
+	.name = "mgmt",
+};
+
 const struct attribute_group *coresight_cti_groups[] = {
 	&coresight_cti_group,
+	&coresight_cti_mgmt_group,
 	NULL,
 };
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 82e563cdc879..aba6b789c969 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -22,6 +22,7 @@
 #define CORESIGHT_CLAIMCLR	0xfa4
 #define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_LSR		0xfb4
+#define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
 #define CORESIGHT_DEVID		0xfc8
 #define CORESIGHT_DEVTYPE	0xfcc
-- 
2.17.1

