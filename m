Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6FB637D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Aug 2019 13:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfHNNjL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Aug 2019 09:39:11 -0400
Received: from 8bytes.org ([81.169.241.247]:49366 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726821AbfHNNir (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Aug 2019 09:38:47 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 1670A527; Wed, 14 Aug 2019 15:38:43 +0200 (CEST)
From:   Joerg Roedel <joro@8bytes.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     corbet@lwn.net, tony.luck@intel.com, fenghua.yu@intel.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        x86@kernel.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Thomas.Lendacky@amd.com,
        Suravee.Suthikulpanit@amd.com, Joerg Roedel <jroedel@suse.de>
Subject: [PATCH 09/10] iommu: Disable passthrough mode when SME is active
Date:   Wed, 14 Aug 2019 15:38:40 +0200
Message-Id: <20190814133841.7095-10-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814133841.7095-1-joro@8bytes.org>
References: <20190814133841.7095-1-joro@8bytes.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Using Passthrough mode when SME is active causes certain
devices to use the SWIOTLB bounce buffer. The bounce buffer
code has an upper limit of 256kb for the size of DMA
allocations, which is too small for certain devices and
causes them to fail.

With this patch we enable IOMMU by default when SME is
active in the system, making the default configuration work
for more systems than it does now.

Users that don't want IOMMUs to be enabled still can disable
them with kernel parameters.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 96cc7cc8ab21..4bc9025a9975 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -119,6 +119,11 @@ static int __init iommu_subsys_init(void)
 			iommu_set_default_passthrough();
 		else
 			iommu_set_default_translated();
+
+		if (iommu_default_passthrough() && sme_active()) {
+			pr_info("SME detected - Disabling default IOMMU Passthrough\n");
+			iommu_set_default_translated();
+		}
 	}
 
 	pr_info("Default domain type: %s %s\n",
-- 
2.17.1

