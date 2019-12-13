Return-Path: <SRS0=dZE6=2D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCC6C341A6
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2FE224776
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueKn06GO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfLMOys (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Dec 2019 09:54:48 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46517 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbfLMOyr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Dec 2019 09:54:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so6898812wrl.13
        for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2019 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T27IXVbXguFSrcc6QT4764F4SifO2NNzK2+depwL7hM=;
        b=ueKn06GONepO8g4o1E2A2mhdYHMirvntek1/bhARmDQHqEGOP4VBQTS1g1zx2LDRh2
         lB4nPjfT1ncZPScRnQuC5Rn8bGgePGMbJZ8r+xhNVGtNMFEVWhxcwPCF/TZ8XFUPv1oW
         CGFMorh+7dbSGHfbCr50J+NrO3hZ15gmhdnn6L+yHb+ROmB76fq+kMezrDyH7xmZ9PlK
         AY9OeeOCrf+CBHasCV4EioNKNI2zK4reucb9KElCepEmqml+AyFpzXzLs6GyrEsLlAjN
         Z6mWat6K9hxeB8fJwZiKaXfaTYxgypYnlUrEiW0UZ39ps4NIsDh9bPPVM7gGsoxDbEgA
         xBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T27IXVbXguFSrcc6QT4764F4SifO2NNzK2+depwL7hM=;
        b=A2R/yNQPM9JGbQvlY4am3YhY2lSN5WQTs+NKI1NEUP45Ea7hPiS3wqAA96be0xrIMT
         Ddag/mjr2AaKpt5B0hTygNfZkCFsC3OHiiMJxvNcuevwXBgE1SQl5YXd5+s6G/5CuaR1
         4pmGmOd++aE289bJGsUxEpyAQsOewx3FY9EBFTgXJHU6ZjllmYflnOr3zCQMhRDzfS6E
         WCc01VrWqN9Wd6C1FLv10QwaGSRJKy36RIstkY8MAZq6rqbkDegQveo+gC+ezHoObB3t
         1napnWPqaPTXw0bCqBHO8tijD3BumukNhyptMLVT5XdQ0K1ObQzTGP81sK7BgOv166vc
         8uGA==
X-Gm-Message-State: APjAAAXYi2Rd094dgx/0WAn6NAIeV2hApoGFIgoUVb9/P2TBEnlnhjUt
        pL27gxJue5GuYEzadqScSRdwnA==
X-Google-Smtp-Source: APXvYqwQqrN7vqF5YJIxFPFxhQ5bYEDap3SXjRpSW2vV0v4XDTYqDCxWiAGRcO+TjsURrkmJm9rBpA==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr12861684wri.47.1576248884497;
        Fri, 13 Dec 2019 06:54:44 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:54:d457:4f7b:f42c])
        by smtp.gmail.com with ESMTPSA id n189sm10002979wme.33.2019.12.13.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 06:54:44 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v3 3/6] coresight: Add generic sysfs link creation functions.
Date:   Fri, 13 Dec 2019 14:54:28 +0000
Message-Id: <20191213145431.24067-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213145431.24067-1-mike.leach@linaro.org>
References: <20191213145431.24067-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To allow the connections between coresight components to be represented
in sysfs, generic methods for creating sysfs links between two coresight
devices are added.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
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

