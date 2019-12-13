Return-Path: <SRS0=dZE6=2D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D81C34008
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BEBF24776
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnNIGn1B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbfLMOyp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Dec 2019 09:54:45 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41130 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbfLMOyp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Dec 2019 09:54:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id c9so6942816wrw.8
        for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2019 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mcjy2CEkG4vUV/6rKn0LaYo72M9aNFWzBHIkohtYboo=;
        b=wnNIGn1B5TtcrOvFBT+lw2uwRDQK0/kBwC/5nDBJDferrWsJrMexG4vPKcIyEOkbED
         KIT/I6Q3b8DxJsoVSedBdLevSlpPbgmBv/BraYXxl2sXvOYGQ3l8HlbIQgJUVWKh+r/5
         VL2nJk5lbA0QnGXR/Hh9iJE6Cbc9gxfq4OoSwrk5iyP0GW0NjWFaP3Rpm7FO+mt9QYsM
         p97KuMnfFojGVq1+nJzFIOOwq7R5lsx3jYHGpCEiNBeJf+pUN0KYZycftw3WiEn+rafc
         ZFOsT1XvG7K/RBdg8PksrVfF+OM4S+OuWNYbwkDv2oJc0f7goinDR2xOec/9Raezpkpd
         WNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mcjy2CEkG4vUV/6rKn0LaYo72M9aNFWzBHIkohtYboo=;
        b=iwdr6+zaiKTiIsQaG6ZOKJX1NS+fExbP9sNgSX6YjyXPoUdLsXl0ge4uXvzhqh5wJI
         KKltqyiyV4kIP6qmuDMwRD67e3qWD/53TvX51WzOZj4cgNDuUcyZuKuiEEV5eeKWBpBb
         PA+jckvXGHxZedxlS70Iq3O+ABN/vAGWdZwAVed1Q42rI2h2iaCpk9X9xCrs0OV/IWF0
         dsFA9pnZ6JaQp49GFQsprtJ69ZmHazp2qMpQoRec5J7/mb40veUfMJJGUsd3WWy5OcI/
         jZkg05OaSNXDWDYxzCmQfD06cE4CFW8YKTEClBIvTv0YE/VNAAKRsqLYE43XzD1os+1K
         USDg==
X-Gm-Message-State: APjAAAV7UesBzPwUcgcFe60co4LOkrkl10X8T0QURwY1dPlLBfP+e+8m
        +Mdz7vbrBNE63+meYk49wqUU1A==
X-Google-Smtp-Source: APXvYqyAJsTZzlkoo9vrJp2WXJLSdtMLg5J0zEt0TZ7uXB00KGdQ57L5DY0i5i+81w+Q+rotzTA12Q==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr14036255wrt.100.1576248883413;
        Fri, 13 Dec 2019 06:54:43 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:54:d457:4f7b:f42c])
        by smtp.gmail.com with ESMTPSA id n189sm10002979wme.33.2019.12.13.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 06:54:42 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v3 2/6] coresight: add return value for fixup connections
Date:   Fri, 13 Dec 2019 14:54:27 +0000
Message-Id: <20191213145431.24067-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213145431.24067-1-mike.leach@linaro.org>
References: <20191213145431.24067-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Handle failures in fixing up connections for a newly registered
device. This will be useful to handle cases where we fail to expose
the links via sysfs for the connections.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index 10e756410d3c..07f66a3968f1 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -1073,18 +1073,14 @@ static int coresight_orphan_match(struct device *dev, void *data)
 	return 0;
 }
 
-static void coresight_fixup_orphan_conns(struct coresight_device *csdev)
+static int coresight_fixup_orphan_conns(struct coresight_device *csdev)
 {
-	/*
-	 * No need to check for a return value as orphan connection(s)
-	 * are hooked-up with each newly added component.
-	 */
-	bus_for_each_dev(&coresight_bustype, NULL,
+	return bus_for_each_dev(&coresight_bustype, NULL,
 			 csdev, coresight_orphan_match);
 }
 
 
-static void coresight_fixup_device_conns(struct coresight_device *csdev)
+static int coresight_fixup_device_conns(struct coresight_device *csdev)
 {
 	int i;
 
@@ -1096,6 +1092,8 @@ static void coresight_fixup_device_conns(struct coresight_device *csdev)
 		if (!conn->child_dev)
 			csdev->orphan = true;
 	}
+
+	return 0;
 }
 
 static int coresight_remove_match(struct device *dev, void *data)
@@ -1305,11 +1303,17 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 	mutex_lock(&coresight_mutex);
 
-	coresight_fixup_device_conns(csdev);
-	coresight_fixup_orphan_conns(csdev);
-	cti_add_assoc_to_csdev(csdev);
+	ret = coresight_fixup_device_conns(csdev);
+	if (!ret)
+		ret = coresight_fixup_orphan_conns(csdev);
+	if (!ret)
+		cti_add_assoc_to_csdev(csdev);
 
 	mutex_unlock(&coresight_mutex);
+	if (ret) {
+		coresight_unregister(csdev);
+		return ERR_PTR(ret);
+	}
 
 	return csdev;
 
-- 
2.17.1

