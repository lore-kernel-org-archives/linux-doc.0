Return-Path: <SRS0=kPt+=37=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03410C352A3
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D049820842
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLLCq1mS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgBKK6T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Feb 2020 05:58:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53211 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbgBKK6T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Feb 2020 05:58:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so2892060wmc.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2020 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CBZqYhjGCYlEVl1hQyBcSruJxPzTWglj+OLo8vtBQ4s=;
        b=RLLCq1mSrfgnKsO81lzrre53LWaEKOBe8rxJhLoMjI1859JUEAsQIDLeKYRE7qG4YW
         ETAMXpnvb7HGMNh7s3c7ZzC+AcOpYnezRABvTmn84mQor2gpFp9QAZgwdtqcGI8XKEgD
         fTloWnjpn5RtxHaBb0Zf2fefFRw3j1PmLr7g1m7tirkWslBW0PqVBPNVupY4eTnFndKK
         xuxk6hT5hCOKQ9avKC/qs+3Hh+8Lm7sZaSBEuPFy683EQ7aVI7QA4XuhRCwZc9pnyq/p
         /3PkFVRVfQwvW/C44eAAenKIQ0q66vA5eOYLZLgr8z+8emeNKUYzw9vIAUYYIyXl02h8
         wIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CBZqYhjGCYlEVl1hQyBcSruJxPzTWglj+OLo8vtBQ4s=;
        b=s25RTfjSSxlCpXVOHrBYpLYX5dr/D2CnBNG7h7DXZ0BINnFJAmpaFBnK7i5+cw/VeN
         sOXpvZrDX66JmvCtXZSc3CTxrFHbr8qkjC5AiCqmOy+++aVCMNd6tdzZEARPoeh0WoM/
         cC0j4x7UT8Ne8KLZfuTYWDRUEzW+XTyOfbMcap0utTthZMPSBpGgxRE0UmTF4lHZ+foT
         DXgvAIksPmJowm0l0UF1lDFj8fm5EGd8VLRPZEv9nWYN6RnFA/pjsRqX13pMkOr2aIfZ
         MQJs4OQJ3bm3MfO6TXw7dJi8aYpxXkkoprKJGAnpOZ419B8TrQ8Iow55ytOcRiy0Gmp1
         smiA==
X-Gm-Message-State: APjAAAVrX4Ij++uDkqbsxLK7b4MXE8A+66f8HUoNI/bsI+H6Zdf/pjpr
        N8Eh52q2K21buDy0sfyYkL8kiw==
X-Google-Smtp-Source: APXvYqwF6Z1MQGBMp/cv9I8o/B835/lRMiwSMvhMpXTc6WBkbl3mu2ydwjsUIpp5SIZ0T1en65oY6g==
X-Received: by 2002:a05:600c:2c53:: with SMTP id r19mr5008569wmg.39.1581418697095;
        Tue, 11 Feb 2020 02:58:17 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g21sm3171291wmh.17.2020.02.11.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 02:58:16 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 1/6] coresight: Pass coresight_device for coresight_release_platform_data
Date:   Tue, 11 Feb 2020 10:58:03 +0000
Message-Id: <20200211105808.27884-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211105808.27884-1-mike.leach@linaro.org>
References: <20200211105808.27884-1-mike.leach@linaro.org>
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

