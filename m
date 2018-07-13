Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 33F347DE80
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Jul 2018 15:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbeGMQNJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Jul 2018 12:13:09 -0400
Received: from smtprelay.synopsys.com ([198.182.47.9]:57993 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730822AbeGMQME (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Jul 2018 12:12:04 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 6913E24E23E3;
        Fri, 13 Jul 2018 08:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1531497411; bh=ehkaiHzxqzj3X0frGz1XFFt9dOpOvUvrybjch26b/tI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=S+IVGMfh/SFS0doW8lFUymcZFfliIt6Ca79Ilid3Z4Qf1W242Kq59bukoo/sZhsJu
         4G6L71Ty13h9VQfH2WZ/KfQY8O7pAD0IstIIVgzz7/Tcc+qSGTD9TQo1D7xRB2yrLp
         oz0QfaUQkDS67pYPUV+WJu4Wzsetfn/jIrjQsnU8fOlOVmkJrNpRmwLt5IzdAdB4yB
         2Sdbhoh0bbRUF82BRlb+ZI+p6Csdj8nhQiO95Lu160Xl+vn6vtAh69hlxBf0BUnh80
         RCl/Ktkhq0oDr2ijfF1pfAbWh7Y7c+nFhsj+EU8F+qyWEDMeJ3s0pZ9nQTNXyTL5/0
         TNcuTK5NR8Uzg==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id 1D3D430E0;
        Fri, 13 Jul 2018 08:56:51 -0700 (PDT)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id 8F59D3E8F8;
        Fri, 13 Jul 2018 17:56:49 +0200 (CEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        joao.pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com,
        shawn.lin@rock-chips.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v10 12/12] PCI: endpoint: Add MSI set maximum restriction
Date:   Fri, 13 Jul 2018 17:56:44 +0200
Message-Id: <9dfb92025894fa5c7bc8f08ae43a58c2001319d6.1531496321.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1531496321.git.gustavo.pimentel@synopsys.com>
References: <cover.1531496321.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1531496321.git.gustavo.pimentel@synopsys.com>
References: <cover.1531496321.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add pci_epc_set_msi() maximum 32 interrupts validation.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
---
Change v4->v5:
 - New patch file.
Change v5->v6:
 - Nothing changed, just to follow the patch set version.
Change v6->v7:
 - Nothing changed, just to follow the patch set version.
Change v7->v8:
 - Re-sending the patch series.
Change v8->v9:
 - Nothing changed, just to follow the patch set version.
Change v9->v10:
 - Nothing changed, just to follow the patch set version.

 drivers/pci/endpoint/pci-epc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index c72e656..094dcc3 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -201,7 +201,8 @@ int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
 	u8 encode_int;
 	unsigned long flags;
 
-	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions)
+	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions ||
+	    interrupts > 32)
 		return -EINVAL;
 
 	if (!epc->ops->set_msi)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
