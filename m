Return-Path: <SRS0=WXCa=4P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DC9C34022
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF818246A0
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUhrzFw2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgB0POa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:14:30 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52349 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbgB0POa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 10:14:30 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so4000378wmc.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 07:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aTDBzI1XIx/lCwvz5NfAj4LMnLcoxC6x80PetPnO3r0=;
        b=yUhrzFw2SPQAAyNL6r+o0pfXf+cP/0hDZG5rLfDyMhYX5BtxfzM1BxRO2mgF2q7/QN
         Kasf0zMc7pfGMMB/Q7nLq+4S9oav0Wp3dpRF9QjOxAuHIgvNEY1EcT7XVL/ZRSD61qKU
         gW0C/zxCsylA2t4SuSzO0gGPuUrDg2e7x/6qs9SpxZWA2QejAkogv0VFoydNNKeGV1cn
         k69/XCc5Al46kb4S4B3UIydwLGYYjmfJ1YOHKf/fzjZh6eFZaaX5bXSk8mhOskLddaya
         SXjLct5SXgpMg1wdVOLg6gAohDMJvW5qX9YcQZlsajKG2UUKkdN4tvO3z66D1iR0CBYz
         vU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aTDBzI1XIx/lCwvz5NfAj4LMnLcoxC6x80PetPnO3r0=;
        b=Kai+IKs/8tNdktaus4VETVdNwiToS0R0w7BU45PVRx8vhp6VdotRxS0KLlwHmfLMt4
         yP/i/F9JMhc8BCfCDwhC0kS1tDRWX8Rm0lkKbR3pcFc9eGHVGP5uIQfTNTXGA8Ghjn1o
         DBB6eKMpoFThNyeYzWO5eZDSckgmlrpndho92Rj1WGmjNilvR5HxmtqQGW5ht+3/aqfr
         tNwJADuX6Fw0+Yqc+dukTZ1ngxZPej22EqyCMepUNPI1lhk9B2IobgIG65PGYKDvjm1S
         KBcsYRrxWN/4Ff1SWN3kNL9aZMZwRLQ6IzlUjQAiTWB8x78+Dg+BcvahRu+cPAeb+xDs
         0sSg==
X-Gm-Message-State: APjAAAWPx+5DtVJN08p+SWc9DXtMeU3jagYZsUXVPzXWbUKabaIo/zX4
        gfjTE3MBlhEb/B69zQ7FrMb1zQrm1YU=
X-Google-Smtp-Source: APXvYqwif1iRQrupH6jmi5KHHZRUMYrZW46xuTCHun48dnOu77CziodNXre5xSQXbN61jclIulFqZg==
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr5858539wmh.85.1582816467932;
        Thu, 27 Feb 2020 07:14:27 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6801:1801:2dc1:e60d:4b1c:70e0])
        by smtp.gmail.com with ESMTPSA id q12sm8973079wrg.71.2020.02.27.07.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 07:14:26 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 3/6] coresight: Add generic sysfs link creation functions
Date:   Thu, 27 Feb 2020 15:14:13 +0000
Message-Id: <20200227151416.14271-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227151416.14271-1-mike.leach@linaro.org>
References: <20200227151416.14271-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To allow the connections between coresight components to be represented
in sysfs, generic methods for creating sysfs links between two coresight
devices are added.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/hwtracing/coresight/Makefile          |   3 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 drivers/hwtracing/coresight/coresight-sysfs.c | 124 ++++++++++++++++++
 include/linux/coresight.h                     |  20 +++
 4 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-sysfs.c

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 0e3e72f0f510..19497d1d92bf 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -2,7 +2,8 @@
 #
 # Makefile for CoreSight drivers.
 #
-obj-$(CONFIG_CORESIGHT) += coresight.o coresight-etm-perf.o coresight-platform.o
+obj-$(CONFIG_CORESIGHT) += coresight.o coresight-etm-perf.o \
+			   coresight-platform.o coresight-sysfs.o
 obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o \
 					     coresight-tmc-etf.o \
 					     coresight-tmc-etr.o
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1cad642f27aa..a4a658d46045 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -153,6 +153,10 @@ struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct list_head *coresight_build_path(struct coresight_device *csdev,
 				       struct coresight_device *sink);
 void coresight_release_path(struct list_head *path);
+int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
+void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
+int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
+void coresight_remove_conns_sysfs_group(struct coresight_device *csdev);
 
 #ifdef CONFIG_CORESIGHT_SOURCE_ETM3X
 extern int etm_readl_cp14(u32 off, unsigned int *val);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
new file mode 100644
index 000000000000..17d565941e5e
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, Linaro Limited, All rights reserved.
+ * Author: Mike Leach <mike.leach@linaro.org>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+
+#include "coresight-priv.h"
+
+/*
+ * Connections group - links attribute.
+ * Count of created links between coresight components in the group.
+ */
+static ssize_t nr_links_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct coresight_device *csdev = to_coresight_device(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", csdev->nr_links);
+}
+static DEVICE_ATTR_RO(nr_links);
+
+static struct attribute *coresight_conns_attrs[] = {
+	&dev_attr_nr_links.attr,
+	NULL,
+};
+
+static struct attribute_group coresight_conns_group = {
+	.attrs = coresight_conns_attrs,
+	.name = "connections",
+};
+
+/*
+ * Create connections group for CoreSight devices.
+ * This group will then be used to collate the sysfs links between
+ * devices.
+ */
+int coresight_create_conns_sysfs_group(struct coresight_device *csdev)
+{
+	int ret = 0;
+
+	if (!csdev)
+		return -EINVAL;
+
+	ret = sysfs_create_group(&csdev->dev.kobj, &coresight_conns_group);
+	if (ret)
+		return ret;
+
+	csdev->has_conns_grp = true;
+	return ret;
+}
+
+void coresight_remove_conns_sysfs_group(struct coresight_device *csdev)
+{
+	if (!csdev)
+		return;
+
+	if (csdev->has_conns_grp) {
+		sysfs_remove_group(&csdev->dev.kobj, &coresight_conns_group);
+		csdev->has_conns_grp = false;
+	}
+}
+
+int coresight_add_sysfs_link(struct coresight_sysfs_link *info)
+{
+	int ret = 0;
+
+	if (!info)
+		return -EINVAL;
+	if (!info->orig || !info->target ||
+	    !info->orig_name || !info->target_name)
+		return -EINVAL;
+	if (!info->orig->has_conns_grp || !info->target->has_conns_grp)
+		return -EINVAL;
+
+	/* first link orig->target */
+	ret = sysfs_add_link_to_group(&info->orig->dev.kobj,
+				      coresight_conns_group.name,
+				      &info->target->dev.kobj,
+				      info->orig_name);
+	if (ret)
+		return ret;
+
+	/* second link target->orig */
+	ret = sysfs_add_link_to_group(&info->target->dev.kobj,
+				      coresight_conns_group.name,
+				      &info->orig->dev.kobj,
+				      info->target_name);
+
+	/* error in second link - remove first - otherwise inc counts */
+	if (ret) {
+		sysfs_remove_link_from_group(&info->orig->dev.kobj,
+					     coresight_conns_group.name,
+					     info->orig_name);
+	} else {
+		info->orig->nr_links++;
+		info->target->nr_links++;
+	}
+
+	return ret;
+}
+
+void coresight_remove_sysfs_link(struct coresight_sysfs_link *info)
+{
+	if (!info)
+		return;
+	if (!info->orig || !info->target ||
+	    !info->orig_name || !info->target_name)
+		return;
+
+	sysfs_remove_link_from_group(&info->orig->dev.kobj,
+				     coresight_conns_group.name,
+				     info->orig_name);
+
+	sysfs_remove_link_from_group(&info->target->dev.kobj,
+				     coresight_conns_group.name,
+				     info->target_name);
+
+	info->orig->nr_links--;
+	info->target->nr_links--;
+}
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 193cc9dbf448..a2ec25e02ca9 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -148,6 +148,20 @@ struct coresight_connection {
 	struct coresight_device *child_dev;
 };
 
+/**
+ * struct coresight_sysfs_link - representation of a connection in sysfs.
+ * @orig:		Originating (master) coresight device for the link.
+ * @orig_name:		Name to use for the link orig->target.
+ * @target:		Target (slave) coresight device for the link.
+ * @target_name:	Name to use for the link target->orig.
+ */
+struct coresight_sysfs_link {
+	struct coresight_device *orig;
+	const char *orig_name;
+	struct coresight_device *target;
+	const char *target_name;
+};
+
 /**
  * struct coresight_device - representation of a device as used by the framework
  * @pdata:	Platform data with device connections associated to this device.
@@ -165,6 +179,9 @@ struct coresight_connection {
  * @ea:		Device attribute for sink representation under PMU directory.
  * @ect_dev:	Associated cross trigger device. Not part of the trace data
  *		path or connections.
+ * @nr_links:   number of sysfs links created to other components from this
+ *		device. These will appear in the "connections" group.
+ * @has_conns_grp: Have added a "connections" group for sysfs links.
  */
 struct coresight_device {
 	struct coresight_platform_data *pdata;
@@ -180,6 +197,9 @@ struct coresight_device {
 	struct dev_ext_attribute *ea;
 	/* cross trigger handling */
 	struct coresight_device *ect_dev;
+	/* sysfs links between components */
+	int nr_links;
+	bool has_conns_grp;
 };
 
 /*
-- 
2.17.1

