Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4CE8A7D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Sep 2018 21:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbeIEBtj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Sep 2018 21:49:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:56018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbeIEBtj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Sep 2018 21:49:39 -0400
Received: from localhost.localdomain (unknown [136.62.81.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0ACB220836;
        Tue,  4 Sep 2018 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1536096163;
        bh=iyx33zltDo3rjY2T9mRTH7plLK6ugYNviVWl+bYExlM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0MVBd1x79HC0gTVYPmPdZKswf3PBTE+30/Yg6tqS8gYkz82F8FZMJzMBTIB6R7VeM
         BDa49+jvfajgjie3YwPbQc9c7LdznBv0SrhuFejMmKRdnSuUfSme04fragf1Njs+oB
         Qmn7fPpvMe5J18jhGJX4YCEt5sMPCVEcQ5FHdrLY=
From:   Alan Tull <atull@kernel.org>
To:     Moritz Fischer <mdf@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Tull <atull@kernel.org>
Subject: [PATCH v2 1/8] fpga: do not access region struct after fpga_region_unregister
Date:   Tue,  4 Sep 2018 16:22:30 -0500
Message-Id: <20180904212237.3078-2-atull@kernel.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180904212237.3078-1-atull@kernel.org>
References: <20180904212237.3078-1-atull@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A couple drivers were accessing the region struct after it had been
freed.  Save off the pointer to the mgr before the region struct gets
freed.

Signed-off-by: Alan Tull <atull@kernel.org>
---
v2: no change in v2 of patchset
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

