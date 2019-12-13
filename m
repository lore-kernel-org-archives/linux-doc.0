Return-Path: <SRS0=dZE6=2D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5603C34009
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1687A24776
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwQKQh0K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfLMOyt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Dec 2019 09:54:49 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43156 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbfLMOyt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Dec 2019 09:54:49 -0500
Received: by mail-wr1-f67.google.com with SMTP id d16so6911696wre.10
        for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2019 06:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=//sdX0uimiNqq+PTSFIQWuZgSIzAe7ctl+sMKSFWfAA=;
        b=fwQKQh0K20OADXtxzsH48b5qBPqqKsH7Gq4GO5bggQKYWVelVgUNzD3fT7QdwFIcxa
         9ZonGyEb1ow8cqfrpL+/BrN+QWxO1G+kQKcR4mLoMV+MhQHeoob+iyOSggJowswbXYZP
         Js3ZIo1PTLrPw4at20VI/0jYGurcJPzxLlKF+rgvV9VB+lwvaQSZeXuiVz0ByRG/eRWw
         bhJpfGArXBbHvpjxLi2SAX5q6vPO/fcL5R1uFINS77U2hWpzRiN5P/3emib5h4wmPVl+
         Oq0TKc+xpfg+/EP2NYMdAuwcJMIowg2n3nOfedopDlZIRjaVIBDAdhf5qzNkQF8v+ULG
         8AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=//sdX0uimiNqq+PTSFIQWuZgSIzAe7ctl+sMKSFWfAA=;
        b=LWAF07AwTwxbesXQmZM2r9E2KKv/DcmuSnFfO4XFiRMjkmqO+Ay8iDxREvvX9kLxp/
         ZqL0YT2oduEHK8xHFBcPq5HFvsOT1mqvEf9zvSZw1QAswHqNZXdoNq42kJ1xvRF47H5t
         PlJ860OeY1rfGIRYlbt/s1Cyx4+l0Ko0s0wJcqEhcoH8pYU3Cgt0kAMYzSh/rwvs2NVE
         yShsO+w0VgV2HaF2gFU7dutVO5NmEjECuGejng2IoRQrf8XotvL+C9fa5a3OuO0QBGDX
         Od6MYOiN0y4Fczy3iWHb1qRDkTlfxY95Kir7vxPljPTj5CNmZbaZ/l4+b9SRZJj70z46
         1ZOw==
X-Gm-Message-State: APjAAAXhA5pmSsrjYkx8YKfq726ZcgvWkJ4ON/sE0HhZYijsgl4DBKYw
        bI30emqiuTQgXRXNdbSn043QQA==
X-Google-Smtp-Source: APXvYqyDh8ESWmF4+9tJP6UNIKYroQbne5r/2ngcSkt0FIW7juWbOYv2D4wA0FteCfmCq3aqOZoChA==
X-Received: by 2002:adf:f885:: with SMTP id u5mr13538678wrp.359.1576248886509;
        Fri, 13 Dec 2019 06:54:46 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:54:d457:4f7b:f42c])
        by smtp.gmail.com with ESMTPSA id n189sm10002979wme.33.2019.12.13.06.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 06:54:45 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v3 5/6] coresight: cti: Add in sysfs links to other coresight devices.
Date:   Fri, 13 Dec 2019 14:54:30 +0000
Message-Id: <20191213145431.24067-6-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213145431.24067-1-mike.leach@linaro.org>
References: <20191213145431.24067-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds in sysfs links for connections where the connected device is another
coresight device. This allows examination of the coresight topology.

Non-coresight connections remain just as a reference name.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-cti.c | 41 ++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
index 9d27dea1625f..107ef7178015 100644
--- a/drivers/hwtracing/coresight/coresight-cti.c
+++ b/drivers/hwtracing/coresight/coresight-cti.c
@@ -441,6 +441,37 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	return err;
 }
 
+static void cti_add_sysfs_link(struct cti_drvdata *drvdata,
+			       struct cti_trig_con *tc)
+{
+	struct coresight_sysfs_link link_info;
+
+	link_info.orig = drvdata->csdev;
+	link_info.orig_name = tc->con_dev_name;
+	link_info.target = tc->con_dev;
+	link_info.target_name = dev_name(&drvdata->csdev->dev);
+	coresight_add_sysfs_link(&link_info);
+}
+
+static void cti_remove_all_sysfs_links(struct cti_drvdata *drvdata)
+{
+	struct cti_trig_con *tc;
+	struct cti_device *ctidev = &drvdata->ctidev;
+	struct coresight_sysfs_link link_info;
+
+	/* origin device and target link name constant for this cti */
+	link_info.orig = drvdata->csdev;
+	link_info.target_name = dev_name(&drvdata->csdev->dev);
+
+	list_for_each_entry(tc, &ctidev->trig_cons, node) {
+		if (tc->con_dev) {
+			link_info.target = tc->con_dev;
+			link_info.orig_name = tc->con_dev_name;
+			coresight_remove_sysfs_link(&link_info);
+		}
+	}
+}
+
 /*
  * Look for a matching connection device name in the list of connections.
  * If found then swap in the csdev name, set trig con association pointer
@@ -452,6 +483,8 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
 {
 	struct cti_trig_con *trig_con;
 	const char *csdev_name;
+	struct cti_drvdata *drvdata = container_of(ctidev, struct cti_drvdata,
+						   ctidev);
 
 	list_for_each_entry(trig_con, &ctidev->trig_cons, node) {
 		if (trig_con->con_dev_name) {
@@ -462,6 +495,7 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
 				trig_con->con_dev_name =
 					kstrdup(csdev_name, GFP_KERNEL);
 				trig_con->con_dev = csdev;
+				cti_add_sysfs_link(drvdata, trig_con);
 				return true;
 			}
 		}
@@ -546,10 +580,12 @@ static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
 	struct cti_device *ctidev = &drvdata->ctidev;
 
 	list_for_each_entry(tc, &ctidev->trig_cons, node) {
-		if (tc->con_dev)
+		if (tc->con_dev) {
 			/* set tc->con_dev->ect_dev */
 			coresight_set_assoc_ectdev_mutex(tc->con_dev,
 							 drvdata->csdev);
+			cti_add_sysfs_link(drvdata, tc);
+		}
 	}
 }
 
@@ -602,6 +638,9 @@ static void cti_device_release(struct device *dev)
 	mutex_lock(&ect_mutex);
 	cti_remove_conn_xrefs(drvdata);
 
+	/* clear the dynamic sysfs associate with connections */
+	cti_remove_all_sysfs_links(drvdata);
+
 	/* remove from the list */
 	list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
 		if (ect_item == drvdata) {
-- 
2.17.1

