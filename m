Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 13BF07D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 07:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfFGHwc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 03:52:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:28863 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726668AbfFGHwc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jun 2019 03:52:32 -0400
X-IronPort-AV: E=Sophos;i="5.60,562,1549897200"; 
   d="scan'208";a="17860181"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2019 16:52:31 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CDCBC400B9C0;
        Fri,  7 Jun 2019 16:52:30 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     corbet@lwn.net
Cc:     jroedel@suse.de, hch@lst.de, m.szyprowski@samsung.com,
        linux-doc@vger.kernel.org, iommu@lists.linux-foundation.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] Documentation: DMA-API: fix a function name of max_mapping_size
Date:   Fri,  7 Jun 2019 16:47:13 +0900
Message-Id: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The exported function name is dma_max_mapping_size(), not
dma_direct_max_mapping_size() so that this patch fixes
the function name in the documentation.

Fixes: 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/DMA-API.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
index 0076150..e47c63b 100644
--- a/Documentation/DMA-API.txt
+++ b/Documentation/DMA-API.txt
@@ -198,7 +198,7 @@ call to set the mask to the value returned.
 ::
 
 	size_t
-	dma_direct_max_mapping_size(struct device *dev);
+	dma_max_mapping_size(struct device *dev);
 
 Returns the maximum size of a mapping for the device. The size parameter
 of the mapping functions like dma_map_single(), dma_map_page() and
-- 
2.7.4

