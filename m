Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF3C87D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 Aug 2018 19:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbeHNWEL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 Aug 2018 18:04:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:50532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727755AbeHNWEK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Aug 2018 18:04:10 -0400
Received: from localhost.localdomain (unknown [192.55.54.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F99B21730;
        Tue, 14 Aug 2018 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1534274133;
        bh=tSIThTYbZnRemqIn95vslDmNT8FfJXCfvgYARXHkF48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xM/q55Eb1k3IK9tk26je71qux81ivf9BvqTMNAv8654Dudeo/phpbHjt5qnSZ8JzE
         HJU2wk/UnVoULbop7g/4OFZ4aqAe4r+fDApc3JmPxE0AJprCyjm1cUuImZc0DbDO8g
         DsA4w+w1VQy7OkajG14KXUPiBY7481JgO8vonrp4=
From:   Alan Tull <atull@kernel.org>
To:     Moritz Fischer <mdf@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Tull <atull@kernel.org>
Subject: [PATCH 1/8] fpga: do not access region struct after fpga_region_unregister
Date:   Tue, 14 Aug 2018 14:15:19 -0500
Message-Id: <20180814191526.3247-2-atull@kernel.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180814191526.3247-1-atull@kernel.org>
References: <20180814191526.3247-1-atull@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A couple drivers were accessing the region struct after it had been
freed.  Save off the pointer to the mgr before the region struct gets
freed.

Signed-off-by: Alan Tull <atull@kernel.org>
---
 drivers/fpga/dfl-fme-region.c | 4 +++-
 drivers/fpga/of-fpga-region.c | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/dfl-fme-region.c b/drivers/fpga/dfl-fme-region.c
index 0b7e19c..51a5ac2 100644
--- a/drivers/fpga/dfl-fme-region.c
+++ b/drivers/fpga/dfl-fme-region.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/fpga/fpga-mgr.h>
 #include <linux/fpga/fpga-region.h>
 
 #include "dfl-fme-pr.h"
@@ -66,9 +67,10 @@ static int fme_region_probe(struct platform_device *pdev)
 static int fme_region_remove(struct platform_device *pdev)
 {
 	struct fpga_region *region = dev_get_drvdata(&pdev->dev);
+	struct fpga_manager *mgr = region->mgr;
 
 	fpga_region_unregister(region);
-	fpga_mgr_put(region->mgr);
+	fpga_mgr_put(mgr);
 
 	return 0;
 }
diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index 35fabb8..052a134 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -437,9 +437,10 @@ static int of_fpga_region_probe(struct platform_device *pdev)
 static int of_fpga_region_remove(struct platform_device *pdev)
 {
 	struct fpga_region *region = platform_get_drvdata(pdev);
+	struct fpga_manager *mgr = region->mgr;
 
 	fpga_region_unregister(region);
-	fpga_mgr_put(region->mgr);
+	fpga_mgr_put(mgr);
 
 	return 0;
 }
-- 
2.7.4

