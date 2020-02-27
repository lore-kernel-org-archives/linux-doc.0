Return-Path: <SRS0=WXCa=4P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7F1C35677
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4050524688
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGOGYjWv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbgB0PO3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:14:29 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53894 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729685AbgB0PO2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 10:14:28 -0500
Received: by mail-wm1-f68.google.com with SMTP id f15so3989231wml.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 07:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mcjy2CEkG4vUV/6rKn0LaYo72M9aNFWzBHIkohtYboo=;
        b=lGOGYjWvFOg5M7k/ms9JmHqQgpQVC7X0oYBJEB//CU9OsCJN4upV5cCx1JyNlYNmoK
         +2/VWclnq2fLHGSksfR/kk1si2RuNqpN4MSlKHY+S3YGG6Wtt7wBOHoGz4x+sV0+peNA
         68IkLY9eVo9OO72IpECg5g7C3kgB2suzsDZj3W7m8z40sLrqEnQt3Heg5dnhRznvyDYf
         ZE3v2GJcrfkvvcLLbG++nDePiS0GN3NuRMuCReW0IkYSWaY0diAP1t6bYCjOcR+HC/4n
         lHwRagy9/WbFVYPRJZ3Y7D1zMqayfIscWQ94wsZdbSog2vGFoc6CXQPt7waz1OVeVL6Q
         SmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mcjy2CEkG4vUV/6rKn0LaYo72M9aNFWzBHIkohtYboo=;
        b=sZ1I3VzW2igmVwgRpY4SG2H4vOpDiG/zpIyo8IBhWf9Um1EoL2q+NlAPDMTs941Z8m
         elKKWsD4NwNJ83IaU4Bm3EAkvZnU9qbl7JaLatw8k0tCJHYL5nKZONutXSXy3kfs2VCq
         QJQ4gUyjKYazc2tgyAo8eNW7w7NjrpuMXgM/LRWFuWfGQBWj7/cGB4ohXeSerdiU/5CA
         5sJllkS4O2WPNqSWJrADa2AjKT2H1he0j/DxBdc+SnHwDqtVc7Shfx/Q0ruFLse+NWdO
         EtA0Adaj2k04uGLbvkMATNjB9IOOGkuJjtGWp4hLA8Jp0zI8aX0nuOUSKUumTlnvZrqm
         TX6A==
X-Gm-Message-State: APjAAAWt6/Lgc9j1Ki6+D71iJS+71MmAhSoY/8l6LSaHMDJnL8CvjVpP
        pQBto34qbxSVf2/YcCbEXfTnJA==
X-Google-Smtp-Source: APXvYqwYNvy4x4HObXIRykQWd9hrfXmoR5SHd1J2lIy8mUwfXFz0d5C40E8G9rnmVv6gED5f0qfCzA==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr5846805wmg.111.1582816465696;
        Thu, 27 Feb 2020 07:14:25 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6801:1801:2dc1:e60d:4b1c:70e0])
        by smtp.gmail.com with ESMTPSA id q12sm8973079wrg.71.2020.02.27.07.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 07:14:24 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 2/6] coresight: add return value for fixup connections
Date:   Thu, 27 Feb 2020 15:14:12 +0000
Message-Id: <20200227151416.14271-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227151416.14271-1-mike.leach@linaro.org>
References: <20200227151416.14271-1-mike.leach@linaro.org>
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

