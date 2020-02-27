Return-Path: <SRS0=WXCa=4P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CBDC11D3D
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F22EC246A1
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMPyLRAG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbgB0POd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:14:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50285 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbgB0POd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 10:14:33 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so4009440wmb.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 07:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rt0xhGGUlUAKc3IBeyv6F9CRc9Aupi/oWjn2J6IKFo4=;
        b=YMPyLRAGDb2HhIwGvLU+EBQ7vhzdxm4xWeiszH65LkvnrmQ//Xsija93Kyt2T8dO8L
         esqbHbpczx23UaI00JWYMkBdfKCMjuSZ+DUDY+tHvmwaauWJlJr0NWv4SkjvCnZtb6Ns
         m6uATIadIDOv7YhoXl2vvFxbGYZdxdQhLYp4OHS+ScSnlIllJPJgtJYWbOd+MYnNgUWe
         Ud8YkDy3fpzkYLfEPIchfrkCi5ysm4bI9xfoTGY661F5vJPHOEetNvP49VBObQvRHbVT
         diimQOZ4SIvgz6RZv1N7TZ+mqlD0S+yFcEHYtZG+yvCK7kW+NNUV8ptancc+wnXWvfNS
         Z1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rt0xhGGUlUAKc3IBeyv6F9CRc9Aupi/oWjn2J6IKFo4=;
        b=jNc4o1jzP1rx8M89Oo01Ew+2DyyfKBDNWNBZWCa2z2+JXa7TOVVot1rnvCqaQcmgZH
         rWj50lKRc/roNy71CTW1vK0kNKI4MtuC1n+32AEdt38l185b5CirKJJws/fvYhZ13+nm
         /8cLGJKNKg8w4qjI4CHko9XVKkCY+uSMMv+v1WTvp4SWHt+xeRz5vqKlmoImAE1THBvd
         d3HNMDKDVulp6pETNkGkbhMJy9GUeGIJ5v3LXUex75HOtJK6ci/BoEaGj5LNbT3M8whU
         WpyUyKohTrCiwnrojwKR1xeJY8crpXzJPqooUKvlwULvbCVoyMAqAG+C5pLpUPCdyYMA
         RiHA==
X-Gm-Message-State: APjAAAVRjJ+byq0DoDbUXRmrP6ybTOEK6jgGVzZWMixtteI2XiVNlrW1
        YxJsqhzd/hNaKr3hsrg/Dm9aNQ==
X-Google-Smtp-Source: APXvYqz6tzX6TzVBLCA2VFnY/RJSCjdAT8KtR1tom8r4KyPlkbCXtkdYWLNDSMime7iWPJIgnDfk+g==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr16187wmi.112.1582816470077;
        Thu, 27 Feb 2020 07:14:30 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6801:1801:2dc1:e60d:4b1c:70e0])
        by smtp.gmail.com with ESMTPSA id q12sm8973079wrg.71.2020.02.27.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 07:14:28 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 4/6] coresight: Expose device connections via sysfs
Date:   Thu, 27 Feb 2020 15:14:14 +0000
Message-Id: <20200227151416.14271-5-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227151416.14271-1-mike.leach@linaro.org>
References: <20200227151416.14271-1-mike.leach@linaro.org>
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
Provides a connections sysfs group in each device to hold the links.

Co-developed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
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

