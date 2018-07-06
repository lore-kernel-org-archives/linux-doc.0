Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 969CC7D048
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Jul 2018 15:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933061AbeGFPxd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Jul 2018 11:53:33 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:37553 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933033AbeGFPvl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Jul 2018 11:51:41 -0400
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 315EA24E0774;
        Fri,  6 Jul 2018 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1530892301; bh=PPLbeIU3Vv9AAiHtBfUjwxrq2oa7tGA7fruxWOOT4zU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=cAXt8YN6cRtg/3AP4cIOiv5KopHdoNj//CAiO7ZMTscXNTYV9jKrcK7+wyGumwZCA
         2FbmfMUm15Z2rP6WwM9fbghaUfbFAH4NjLKyhjZkENjX+VValrfDq98Wvn1Mlvv11R
         PZ8JrjSrHGOy1JWD3+DnC0d3YHkwoq2rte75dwpypV3tWf41BVUg4WfMgpxJDFrPSZ
         OaOLkbd9niAwR6ByNqMVpIRq/Xc6uu3aaLCm9u+axjQ6qIAX/ajXa3sSM5GEHDNwC+
         iCEHjM3KjEkveZVz6mEUslmFY1kNNecjzjKjdziiOzcxp8JykFE+rz8eb2QJJQnhSR
         LLebAVik5j7CQ==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id DB40F5CDC;
        Fri,  6 Jul 2018 08:51:40 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 5E3CC3D25F;
        Fri,  6 Jul 2018 16:51:39 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com,
        shawn.lin@rock-chips.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v8 11/11] PCI: endpoint: Add MSI set maximum restriction.
Date:   Fri,  6 Jul 2018 16:51:34 +0100
Message-Id: <8a63d6323a30048495ab8a9c1d4b18478e00dc7e.1530891871.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
References: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
References: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
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
