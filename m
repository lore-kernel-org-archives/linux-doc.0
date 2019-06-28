Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2ABBF7D92A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Jun 2019 00:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfF1Auk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Jun 2019 20:50:40 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35523 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfF1Auk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 20:50:40 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so2212066plp.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 17:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkaaEzcIJYAZk41zsKaeC42Zrk9r0yReMvWJ9xWRCd8=;
        b=DCh5FcVG/dcwd7O+hLsa0bCr3iOzVmOX1kGfkjrQOasUTLVv1AHq9jrlsZ0O+ONnaK
         1dVqKQ0xQ53AiNJNr5TUNALMRYWa43N2OfvBPw29dtDBUuPPbp9tnar9Rt8WSDBYqTll
         zvRS43qdqf7JJFflJjH0uUaZj4Nm1JJobPA0p7OIncRENRokvF+GrGRcG/4iGLIrLmNV
         oUs1ERiEgEDGruhOavDq6WAHQ/FibP47lR2mAyCojPcrYohhah5WkxG+tqCh0TZB5t5m
         rOMDFWbSImFVm1O2Q4Jf3OQPTp3KfVCwmfz99ZRCjxrLPuR7la+IdG8vq/hDAA38hPeu
         FpzQ==
X-Gm-Message-State: APjAAAV0zCVSRWqoVFCq2O8UDBIOt9P8zm6GJ1J6wct/Gl1I2n27zxlJ
        u5LNaFgpwpfaxFY6ht8Yh94B+g==
X-Google-Smtp-Source: APXvYqwP9C+r2YU+Xoowvb1QAj83yRVxAx9ByV1g7c7Srq+OvMX1p5YaP10bzS9DeNUWccxbQo+eaw==
X-Received: by 2002:a17:902:54d:: with SMTP id 71mr7963274plf.140.1561683039698;
        Thu, 27 Jun 2019 17:50:39 -0700 (PDT)
Received: from localhost (c-76-21-109-208.hsd1.ca.comcast.net. [76.21.109.208])
        by smtp.gmail.com with ESMTPSA id j16sm339453pjz.31.2019.06.27.17.50.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 17:50:38 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-fpga@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        Moritz Fischer <mdf@kernel.org>, Alan Tull <atull@kernel.org>
Subject: [PATCH 11/15] fpga: dfl: afu: export __port_enable/disable function.
Date:   Thu, 27 Jun 2019 17:49:47 -0700
Message-Id: <20190628004951.6202-12-mdf@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190628004951.6202-1-mdf@kernel.org>
References: <20190628004951.6202-1-mdf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu Hao <hao.wu@intel.com>

As these two functions are used by other private features. e.g.
in error reporting private feature, it requires to check port status
and reset port for error clearing.

Signed-off-by: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Moritz Fischer <mdf@kernel.org>
Acked-by: Alan Tull <atull@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/fpga/dfl-afu-main.c | 25 ++++++++++++++-----------
 drivers/fpga/dfl-afu.h      |  3 +++
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/fpga/dfl-afu-main.c b/drivers/fpga/dfl-afu-main.c
index 65b3e895e364..c8bc0b5d9c16 100644
--- a/drivers/fpga/dfl-afu-main.c
+++ b/drivers/fpga/dfl-afu-main.c
@@ -24,14 +24,16 @@
 #define DRV_VERSION	"0.8"
 
 /**
- * port_enable - enable a port
+ * __port_enable - enable a port
  * @pdev: port platform device.
  *
  * Enable Port by clear the port soft reset bit, which is set by default.
  * The AFU is unable to respond to any MMIO access while in reset.
- * port_enable function should only be used after port_disable function.
+ * __port_enable function should only be used after __port_disable function.
+ *
+ * The caller needs to hold lock for protection.
  */
-static void port_enable(struct platform_device *pdev)
+void __port_enable(struct platform_device *pdev)
 {
 	struct dfl_feature_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	void __iomem *base;
@@ -54,13 +56,14 @@ static void port_enable(struct platform_device *pdev)
 #define RST_POLL_TIMEOUT 1000 /* us */
 
 /**
- * port_disable - disable a port
+ * __port_disable - disable a port
  * @pdev: port platform device.
  *
- * Disable Port by setting the port soft reset bit, it puts the port into
- * reset.
+ * Disable Port by setting the port soft reset bit, it puts the port into reset.
+ *
+ * The caller needs to hold lock for protection.
  */
-static int port_disable(struct platform_device *pdev)
+int __port_disable(struct platform_device *pdev)
 {
 	struct dfl_feature_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	void __iomem *base;
@@ -106,9 +109,9 @@ static int __port_reset(struct platform_device *pdev)
 {
 	int ret;
 
-	ret = port_disable(pdev);
+	ret = __port_disable(pdev);
 	if (!ret)
-		port_enable(pdev);
+		__port_enable(pdev);
 
 	return ret;
 }
@@ -805,9 +808,9 @@ static int port_enable_set(struct platform_device *pdev, bool enable)
 
 	mutex_lock(&pdata->lock);
 	if (enable)
-		port_enable(pdev);
+		__port_enable(pdev);
 	else
-		ret = port_disable(pdev);
+		ret = __port_disable(pdev);
 	mutex_unlock(&pdata->lock);
 
 	return ret;
diff --git a/drivers/fpga/dfl-afu.h b/drivers/fpga/dfl-afu.h
index 0c7630ae3cda..35e60c5859a4 100644
--- a/drivers/fpga/dfl-afu.h
+++ b/drivers/fpga/dfl-afu.h
@@ -79,6 +79,9 @@ struct dfl_afu {
 	struct dfl_feature_platform_data *pdata;
 };
 
+void __port_enable(struct platform_device *pdev);
+int __port_disable(struct platform_device *pdev);
+
 void afu_mmio_region_init(struct dfl_feature_platform_data *pdata);
 int afu_mmio_region_add(struct dfl_feature_platform_data *pdata,
 			u32 region_index, u64 region_size, u64 phys, u32 flags);
-- 
2.22.0

