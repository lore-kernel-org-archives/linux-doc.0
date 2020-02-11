Return-Path: <SRS0=kPt+=37=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F948C352A3
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E06120842
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRYM43LS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgBKK6X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Feb 2020 05:58:23 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53697 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbgBKK6X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Feb 2020 05:58:23 -0500
Received: by mail-wm1-f67.google.com with SMTP id s10so2887690wmh.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2020 02:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UkHXs/ICS0ww6vJx9GuPCceCRLMrxlhwu4y3PLs/7GU=;
        b=yRYM43LSAycuxJrfC5cTq5YBSX6AZjfvG2jgbbxjDMbCwUOMHB4zyjvPPvsgr5qe/R
         4rLz1s7yWr7gYqK9IPrpn0KZsgr3IZY/SPadjdOL3VmiHryz9qmA9FfXStAVFIBJhddo
         3Q5s8dFxnBbYx28WM2hkFlB/dgW+Zp+47cFjySbZaxX4QbmuwejaUMvHeMcjnXWWyKU6
         SK3BFjNRzPchybBOS9t+QPvziEtR5m4xux4fShfBaFsG86FpgurfX4CDCDyoZYavXruV
         A5DerIWs01s73o7oSJR7vgrMtpqKq5OeB1lKJOseoJvALxeZfA5lxC9nSHA14SOqAWBq
         7lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UkHXs/ICS0ww6vJx9GuPCceCRLMrxlhwu4y3PLs/7GU=;
        b=WfxelD4CF7t5VxWI6WlmRCq56j9mIBYr2pXlKdNu+7EuEBwhJQXWWt+tuTLS1sKOVq
         WInmKZArrZMXeYZuM8xw7VEgz6XXIhmff6J8NhcLX6TaIzl54jMAN06PfFver8V09eyC
         gZpT7zhd0YUkAqx6XNGXoN5JjXjbrS4hi/UW2d5uxrHFbce2wte6/rtQEvpvVg/6nT1E
         K2Bo6fkLqqYEAyuxtyU/HB8aBp5pFy3V8Fu6O5lNUg3jE2F+Z5ZScTN6Il4p8Hc/iwH4
         0K1zbN9W5F5A3QTlpUyzDP95oXzJ9QN0Q+YBLYSFPTq+mIc8u8rzNMSe8O4SnlfR+ww/
         039g==
X-Gm-Message-State: APjAAAVx9x/01N9QM0G3zCVPF2vXoIXcFTlL1D4Q6znMFKnmY4o5auGK
        a8euBbVgoWGW2ABirOzwATTexg==
X-Google-Smtp-Source: APXvYqyTZhv1S+MPefPL40yOfPVnW6Yb9Bx5Tq56W1naiXcztiYBO/i4hRsX14guiz8C2MfmlBAeEA==
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr5212122wma.32.1581418700024;
        Tue, 11 Feb 2020 02:58:20 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g21sm3171291wmh.17.2020.02.11.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 02:58:19 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 4/6] coresight: Expose device connections via sysfs
Date:   Tue, 11 Feb 2020 10:58:06 +0000
Message-Id: <20200211105808.27884-5-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211105808.27884-1-mike.leach@linaro.org>
References: <20200211105808.27884-1-mike.leach@linaro.org>
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

