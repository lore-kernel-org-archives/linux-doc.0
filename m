Return-Path: <SRS0=dZE6=2D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191A1C3400B
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E52F24776
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8y68hJC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfLMOyt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Dec 2019 09:54:49 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45181 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbfLMOyt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Dec 2019 09:54:49 -0500
Received: by mail-wr1-f65.google.com with SMTP id j42so6904804wrj.12
        for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2019 06:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UkHXs/ICS0ww6vJx9GuPCceCRLMrxlhwu4y3PLs/7GU=;
        b=T8y68hJCeGSej97oQakOM5Z0GMI5AOsXOX4m4nwGZ1B++PO0DN5S5+lhSf0uIaiBkA
         ARah4jur0xde4KR/Ok+kVIVMluzO1c15uKpzinKJUDXLVjPUxeZFAw+3NgFUN9r0gY4l
         30MW4KfbeLK8HOP1d8xU1iMCRcELWGKBVQTPN5njBy8UIV/NLQn2PErvepmdewgb0VmF
         UvpsjK0UgN0PjvfX66RiST7xFoYPxqXR3OMU9aPz2/V9uu6xhaZ5xg2Z3RCqjK4SA9pu
         P0FKrNWCJR20Af2nj3V8yAAfD54xJI7I3+yyslrSYfz2s+KFb4+l+R03c6GDDomoyJix
         CctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UkHXs/ICS0ww6vJx9GuPCceCRLMrxlhwu4y3PLs/7GU=;
        b=HHepI04YpJ/xufjY2YJP1HlIH9UW9VVX0znM+hOdZz8v2Nq9XrB+X57N+hzxGgyG07
         S2SWaedxsvCjyR0qVBwOfoNk0ZkGgeLs/j/sbNHAJbJvnD34EsFchfkewN1t+3Eol/Sw
         GNELR4ZYlJpoOgnKolealJr2V5o+TsXEl3+g8SycwTfbt2Sv5Oil7BYHtSMLcfFHHAwr
         akR+U3aCx71nWTsXvBnLJqnhx6gjy/1ZA5cAXWbI7HbG3Kr8FF+0JU/6OiNY+Mai6xr6
         STvkvgpVbrLQTnPCweVa/SWbQFiTf4btGmBSG4QHtt9xSCwF+Ea+vO5wb+in6+62RLJT
         UOMw==
X-Gm-Message-State: APjAAAVGs+bGUGIJYQlCHXwQBZOrr/d6SujrLtSymmvh0fUCO6jvm2vl
        w7MC67/zU9HG3nUr98lKclohbA==
X-Google-Smtp-Source: APXvYqwR6kdYFoGCLfkuoq2UcNitzlfskbv96NgG2r71qTFsDd2HQluLkawhAyc+8w9MR9jiQHIBZg==
X-Received: by 2002:adf:f288:: with SMTP id k8mr14100330wro.301.1576248885423;
        Fri, 13 Dec 2019 06:54:45 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:54:d457:4f7b:f42c])
        by smtp.gmail.com with ESMTPSA id n189sm10002979wme.33.2019.12.13.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 06:54:44 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v3 4/6] coresight: Expose device connections via sysfs
Date:   Fri, 13 Dec 2019 14:54:29 +0000
Message-Id: <20191213145431.24067-5-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213145431.24067-1-mike.leach@linaro.org>
References: <20191213145431.24067-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Coresight device connections are a bit complicated and is not
exposed currently to the user. One has to look at the platform
descriptions (DT bindings or ACPI bindings) to make an understanding.
Given the new naming scheme, it will be helpful to have this information
to choose the appropriate devices for tracing. This patch exposes
the device connections via links in the sysfs directories.

e.g, for a connection devA[OutputPort_X] -> devB[InputPort_Y]
is represented as two symlinks:

  /sys/bus/coresight/.../devA/out:X -> /sys/bus/coresight/.../devB
  /sys/bus/coresight/.../devB/in:Y  -> /sys/bus/coresight/.../devA

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Revised to use the generic sysfs links functions & link structures.
Provides a connections sysfs group to hold the links.

Co-developed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h  |  5 ++
 drivers/hwtracing/coresight/coresight-sysfs.c | 80 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight.c       | 46 ++++++++---
 include/linux/coresight.h                     |  2 +
 4 files changed, 121 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index a4a658d46045..5a36f0f50899 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -157,6 +157,11 @@ int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
 void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
 int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
 void coresight_remove_conns_sysfs_group(struct coresight_device *csdev);
+int coresight_make_links(struct coresight_device *orig,
+			 struct coresight_connection *conn,
+			 struct coresight_device *target);
+void coresight_remove_links(struct coresight_device *orig,
+			    struct coresight_connection *conn);
 
 #ifdef CONFIG_CORESIGHT_SOURCE_ETM3X
 extern int etm_readl_cp14(u32 off, unsigned int *val);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 17d565941e5e..0f18332b9f19 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -122,3 +122,83 @@ void coresight_remove_sysfs_link(struct coresight_sysfs_link *info)
 	info->orig->nr_links--;
 	info->target->nr_links--;
 }
+
+/*
+ * coresight_make_links: Make a link for a connection from a @orig
+ * device to @target, represented by @conn.
+ *
+ *   e.g, for devOrig[output_X] -> devTarget[input_Y] is represented
+ *   as two symbolic links :
+ *
+ *	/sys/.../devOrig/out:X	-> /sys/.../devTarget/
+ *	/sys/.../devTarget/in:Y	-> /sys/.../devOrig/
+ *
+ * The link names are allocated for a device where it appears. i.e, the
+ * "out" link on the master and "in" link on the slave device.
+ * The link info is stored in the connection record for avoiding
+ * the reconstruction of names for removal.
+ */
+int coresight_make_links(struct coresight_device *orig,
+			 struct coresight_connection *conn,
+			 struct coresight_device *target)
+{
+	int ret = -ENOMEM;
+	char *outs = NULL, *ins = NULL;
+	struct coresight_sysfs_link *link = NULL;
+
+	do {
+		outs = devm_kasprintf(&orig->dev, GFP_KERNEL,
+				      "out:%d", conn->outport);
+		if (!outs)
+			break;
+		ins = devm_kasprintf(&target->dev, GFP_KERNEL,
+				     "in:%d", conn->child_port);
+		if (!ins)
+			break;
+		link = devm_kzalloc(&orig->dev,
+				    sizeof(struct coresight_sysfs_link),
+				    GFP_KERNEL);
+		if (!link)
+			break;
+
+		link->orig = orig;
+		link->target = target;
+		link->orig_name = outs;
+		link->target_name = ins;
+
+		ret = coresight_add_sysfs_link(link);
+		if (ret)
+			break;
+
+		conn->link = link;
+
+		/*
+		 * Install the device connection. This also indicates that
+		 * the links are operational on both ends.
+		 */
+		conn->child_dev = target;
+		return 0;
+	} while (0);
+
+	return ret;
+}
+
+/*
+ * coresight_remove_links: Remove the sysfs links for a given connection @conn,
+ * from @orig device to @target device. See coresight_make_links() for more
+ * details.
+ */
+void coresight_remove_links(struct coresight_device *orig,
+			    struct coresight_connection *conn)
+{
+	if (!orig || !conn->link)
+		return;
+
+	coresight_remove_sysfs_link(conn->link);
+
+	devm_kfree(&conn->child_dev->dev, conn->link->target_name);
+	devm_kfree(&orig->dev, conn->link->orig_name);
+	devm_kfree(&orig->dev, conn->link);
+	conn->link = NULL;
+	conn->child_dev = NULL;
+}
diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index 07f66a3968f1..4f10cfa9dc18 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -1031,7 +1031,7 @@ static void coresight_device_release(struct device *dev)
 
 static int coresight_orphan_match(struct device *dev, void *data)
 {
-	int i;
+	int i, ret = 0;
 	bool still_orphan = false;
 	struct coresight_device *csdev, *i_csdev;
 	struct coresight_connection *conn;
@@ -1056,19 +1056,23 @@ static int coresight_orphan_match(struct device *dev, void *data)
 		/* We have found at least one orphan connection */
 		if (conn->child_dev == NULL) {
 			/* Does it match this newly added device? */
-			if (conn->child_fwnode == csdev->dev.fwnode)
-				conn->child_dev = csdev;
-			else
+			if (conn->child_fwnode == csdev->dev.fwnode) {
+				ret = coresight_make_links(i_csdev,
+							   conn, csdev);
+				if (ret)
+					return ret;
+			} else {
 				/* This component still has an orphan */
 				still_orphan = true;
+			}
 		}
 	}
 
 	i_csdev->orphan = still_orphan;
 
 	/*
-	 * Returning '0' ensures that all known component on the
-	 * bus will be checked.
+	 * Returning '0' in case we didn't encounter any error,
+	 * ensures that all known component on the bus will be checked.
 	 */
 	return 0;
 }
@@ -1082,15 +1086,21 @@ static int coresight_fixup_orphan_conns(struct coresight_device *csdev)
 
 static int coresight_fixup_device_conns(struct coresight_device *csdev)
 {
-	int i;
+	int i, ret = 0;
 
 	for (i = 0; i < csdev->pdata->nr_outport; i++) {
 		struct coresight_connection *conn = &csdev->pdata->conns[i];
 
 		conn->child_dev =
 			coresight_find_csdev_by_fwnode(conn->child_fwnode);
-		if (!conn->child_dev)
+		if (conn->child_dev) {
+			ret = coresight_make_links(csdev, conn,
+						   conn->child_dev);
+			if (ret)
+				break;
+		} else {
 			csdev->orphan = true;
+		}
 	}
 
 	return 0;
@@ -1121,7 +1131,7 @@ static int coresight_remove_match(struct device *dev, void *data)
 
 		if (csdev->dev.fwnode == conn->child_fwnode) {
 			iterator->orphan = true;
-			conn->child_dev = NULL;
+			coresight_remove_links(iterator, conn);
 			/*
 			 * Drop the reference to the handle for the remote
 			 * device acquired in parsing the connections from
@@ -1215,13 +1225,23 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 				     struct coresight_platform_data *pdata)
 {
 	int i;
+	struct coresight_connection *conns = pdata->conns;
 
 	for (i = 0; i < pdata->nr_outport; i++) {
-		if (pdata->conns[i].child_fwnode) {
-			fwnode_handle_put(pdata->conns[i].child_fwnode);
+		/* If we have made the links, remove them now */
+		if (csdev && conns[i].child_dev)
+			coresight_remove_links(csdev, &conns[i]);
+		/*
+		 * Drop the refcount and clear the handle as this device
+		 * is going away
+		 */
+		if (conns[i].child_fwnode) {
+			fwnode_handle_put(conns[i].child_fwnode);
 			pdata->conns[i].child_fwnode = NULL;
 		}
 	}
+	if (csdev)
+		coresight_remove_conns_sysfs_group(csdev);
 }
 
 struct coresight_device *coresight_register(struct coresight_desc *desc)
@@ -1303,7 +1323,9 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 	mutex_lock(&coresight_mutex);
 
-	ret = coresight_fixup_device_conns(csdev);
+	ret = coresight_create_conns_sysfs_group(csdev);
+	if (!ret)
+		ret = coresight_fixup_device_conns(csdev);
 	if (!ret)
 		ret = coresight_fixup_orphan_conns(csdev);
 	if (!ret)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index a2ec25e02ca9..ccd17304d7bd 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -140,12 +140,14 @@ struct coresight_desc {
  * @chid_fwnode: remote component's fwnode handle.
  * @child_dev:	a @coresight_device representation of the component
 		connected to @outport.
+ * @link: Representation of the connection as a sysfs link.
  */
 struct coresight_connection {
 	int outport;
 	int child_port;
 	struct fwnode_handle *child_fwnode;
 	struct coresight_device *child_dev;
+	struct coresight_sysfs_link *link;
 };
 
 /**
-- 
2.17.1

