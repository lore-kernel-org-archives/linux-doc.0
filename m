Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 500957D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 13:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387757AbeITS57 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 14:57:59 -0400
Received: from foss.arm.com ([217.140.101.70]:45774 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387557AbeITS57 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Sep 2018 14:57:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D5167A9;
        Thu, 20 Sep 2018 06:14:31 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.Emea.Arm.com [10.4.12.131])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36AEB3F5BD;
        Thu, 20 Sep 2018 06:14:30 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org, corbet@lwn.net
Cc:     iommu@lists.linux-foundation.org, linux-doc@vger.kernel.org,
        olof@lixom.net
Subject: [PATCH] iommu: Fix passthrough option documentation
Date:   Thu, 20 Sep 2018 14:14:26 +0100
Message-Id: <60d15534e43f7856ce2e436aff28465cd679bb1d.1537448341.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.19.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document that the default for "iommu.passthrough" is now configurable.

Fixes: 58d1131777a4 ("iommu: Add config option to set passthrough as default")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Joerg, Jon, as a pure doc fix I'll leave it to your discretion as to
whose tree is most appropriate (it shouldn't conflict with the other
IOMMU patches I'm working on)

 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 406b91759b62..8ab2984692ff 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1767,7 +1767,7 @@
 			Format: { "0" | "1" }
 			0 - Use IOMMU translation for DMA.
 			1 - Bypass the IOMMU for DMA.
-			unset - Use IOMMU translation for DMA.
+			unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
 
 	io7=		[HW] IO7 for Marvel based alpha systems
 			See comment before marvel_specify_io7 in
-- 
2.19.0.dirty

