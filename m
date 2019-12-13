Return-Path: <SRS0=dZE6=2D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF96C34007
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 646BD24776
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GcTP7vxd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbfLMOyo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Dec 2019 09:54:44 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35577 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbfLMOyo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Dec 2019 09:54:44 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so6965582wro.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2019 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bmgktRCRd7EQ3fhXppyO1nhH6Ozd77Nfmts8qC4Te8Y=;
        b=GcTP7vxdBMUscRzzW2nP6+fJJTSfxoU9S/+UXNcwsh41VTpmPEdx+kjAookSS1Mi+V
         UEZDHvd8g44lePAZe6DRilrzvDNLxMoi5Cuc1viK67Yl4+iuiOGPKyWorAT6U1ssjnQs
         KFsZAtiu7NInmTtW29dTCtGsFiRExP9rZmL6EM+zm1OyQ/fR9fPA7MrjW09pHNv5OS5r
         qfYmlxjbhv0T45meZD7zqfczEehivA2PRvDNAOU9nbBAHc0d/6vQPH8MReJmP0a5TU/U
         rRW3waiAE9uFtrLQBGeu8jcfy+dP6AtrR9Nb362YRnoKJEaBCogppZWM3v1y3jAJcJAU
         JUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bmgktRCRd7EQ3fhXppyO1nhH6Ozd77Nfmts8qC4Te8Y=;
        b=luPBJYJwYYkyopUubIozn4iJoqRR3xXSDznwMY56TEA5kwN+UKiuuoz7MaGVCTb7mD
         S1dMUswRdSUMxja45frg8PDn7bDyl2pv7Ysq61P5vU5Ag2vLUkuOcXy2c9aJGcHH6h2t
         kPloZRg5vT6uCcW8UNwCiM6r1ZIUr6sghXpsMvl0GwiqTS0MWhq0/kqoIhnG8smPVDnk
         /QkKCRs0DBSvQ0qZvLexHWMShk7b2ASaSSwoC700Aq1HLdqrCRC4ek71p5nnUNGX5HxE
         FOKW03U6fSIwHCdbGYYpgD+Mq+LAZB+PZ72weOQxvYEPbubAguV49SYQOk6eBzW6b4nk
         9lEw==
X-Gm-Message-State: APjAAAUv2nK27PyfXTgmScZCXZUiQVnxyKkmmM+Aow0ZOAqr01tFuTLq
        HdgzvQ6bmK0sVWCL7rIKJmONww==
X-Google-Smtp-Source: APXvYqxKVaNvPIaaq9RJyM+DPmMe2h/PBwwsrFvW8ty74vUg5nEsdx0TB194Nh7m7RbaIcy+d/sh2g==
X-Received: by 2002:adf:d848:: with SMTP id k8mr12830935wrl.328.1576248882393;
        Fri, 13 Dec 2019 06:54:42 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:54:d457:4f7b:f42c])
        by smtp.gmail.com with ESMTPSA id n189sm10002979wme.33.2019.12.13.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 06:54:41 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v3 1/6] coresight: Pass coresight_device for coresight_release_platform_data
Date:   Fri, 13 Dec 2019 14:54:26 +0000
Message-Id: <20191213145431.24067-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213145431.24067-1-mike.leach@linaro.org>
References: <20191213145431.24067-1-mike.leach@linaro.org>
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
index 421d4fc95f41..1621a85748d1 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -823,7 +823,7 @@ coresight_get_platform_data(struct device *dev)
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

