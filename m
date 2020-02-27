Return-Path: <SRS0=WXCa=4P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0278AC11D3D
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE5FA24688
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khdIi3v/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbgB0PO0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:14:26 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42292 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729685AbgB0PO0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 10:14:26 -0500
Received: by mail-wr1-f66.google.com with SMTP id p18so3787584wre.9
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 07:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CBZqYhjGCYlEVl1hQyBcSruJxPzTWglj+OLo8vtBQ4s=;
        b=khdIi3v/WjWtTLD5Gano2VoTVsWvfrsrViJoqnSP7ucDvWWlvJfPVTdsh6WzjW/67Y
         FMhrsAtmF//Jtd4nZiPfZ1XGAauf3b9lftjE4rrN5zpU1ZJpFpVQExVTExi0e/kkHyZK
         hIZv98mNye2Xef5K6Dxdy1zrCGjz2FhGK/okh1oUBizbUXBLqLQ8o4okxtjLIQWAGdKK
         wkgHo+zLHv8gj494YvjJLNEjolfDrv0If/EENA/lnihKJ1fuoe8c6rXfNQQhqckqsdF8
         V45rEEg+r+4nVfBktesRE7LDXBU60Od3QmY97wrun3Nk5X7xuoO/zfKM94v4bx2Y65ix
         fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CBZqYhjGCYlEVl1hQyBcSruJxPzTWglj+OLo8vtBQ4s=;
        b=E9oqZzYSaDjHJsA7gHgqRVriEb5CxlmiHCnPg1gDF3TIzeH81bm1Te7w6FkpzJFU8Z
         ViYxL1RnhCJk/2thLOzJMSONQt3D+R566aG6pYUe8b4XXPRiBLTYtufyjr1AY5tWXNUo
         4gQh8ErgFSulsn+q3e9W9oWMklSLNy4n8jtEYgq2IY1QlAlIfWRC+lUWn3D85/kF3rH5
         T682O3KJviHbtzAtVmUGBTYxTB4f5pkcAnxoeAOX9agXwbVtYT+m1OdYZV+gtq8YIbwm
         mLak1+SYCthmgjjGIQY96pqxrY1QpWvC84chrv0TYYY/rdlBSpEOaVhIhBr4gaS3m3Iq
         ML2g==
X-Gm-Message-State: APjAAAVnItvvFHU9ck66D4177vfZHOZJwoVuBHaUJzR5/FDJ8z0JCEcF
        KdQcWQj/laHLrsizhVVU9AxSyQ==
X-Google-Smtp-Source: APXvYqw7G49lXA2P4gxjfJf21ybocdc6APkNBAj0GT3OLB8Eq60JRqJWPL/PhU0SAkkIgTe2i/coYA==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr5095633wru.425.1582816464072;
        Thu, 27 Feb 2020 07:14:24 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6801:1801:2dc1:e60d:4b1c:70e0])
        by smtp.gmail.com with ESMTPSA id q12sm8973079wrg.71.2020.02.27.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 07:14:22 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 1/6] coresight: Pass coresight_device for coresight_release_platform_data
Date:   Thu, 27 Feb 2020 15:14:11 +0000
Message-Id: <20200227151416.14271-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227151416.14271-1-mike.leach@linaro.org>
References: <20200227151416.14271-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

As we prepare to expose the links between the devices in
sysfs, pass the coresight_device instance to the
coresight_release_platform_data in order to free up the connections
when the device is removed.

No functional changes as such in this patch.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-platform.c | 2 +-
 drivers/hwtracing/coresight/coresight-priv.h     | 3 ++-
 drivers/hwtracing/coresight/coresight.c          | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 43418a2126ff..4b78e1ac5285 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -822,7 +822,7 @@ coresight_get_platform_data(struct device *dev)
 error:
 	if (!IS_ERR_OR_NULL(pdata))
 		/* Cleanup the connection information */
-		coresight_release_platform_data(pdata);
+		coresight_release_platform_data(NULL, pdata);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(coresight_get_platform_data);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 890f9a5c97c6..1cad642f27aa 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -211,7 +211,8 @@ static inline void *coresight_get_uci_data(const struct amba_id *id)
 	return 0;
 }
 
-void coresight_release_platform_data(struct coresight_platform_data *pdata);
+void coresight_release_platform_data(struct coresight_device *csdev,
+				     struct coresight_platform_data *pdata);
 struct coresight_device *
 coresight_find_csdev_by_fwnode(struct fwnode_handle *r_fwnode);
 void coresight_set_assoc_ectdev_mutex(struct coresight_device *csdev,
diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index c71553c09f8e..10e756410d3c 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -1213,7 +1213,8 @@ postcore_initcall(coresight_init);
  * coresight_release_platform_data: Release references to the devices connected
  * to the output port of this device.
  */
-void coresight_release_platform_data(struct coresight_platform_data *pdata)
+void coresight_release_platform_data(struct coresight_device *csdev,
+				     struct coresight_platform_data *pdata)
 {
 	int i;
 
@@ -1316,7 +1317,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	kfree(csdev);
 err_out:
 	/* Cleanup the connection information */
-	coresight_release_platform_data(desc->pdata);
+	coresight_release_platform_data(NULL, desc->pdata);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(coresight_register);
@@ -1326,7 +1327,7 @@ void coresight_unregister(struct coresight_device *csdev)
 	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	coresight_remove_conns(csdev);
-	coresight_release_platform_data(csdev->pdata);
+	coresight_release_platform_data(csdev, csdev->pdata);
 	device_unregister(&csdev->dev);
 }
 EXPORT_SYMBOL_GPL(coresight_unregister);
-- 
2.17.1

