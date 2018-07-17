Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE1777D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Jul 2018 10:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbeGQK60 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 06:58:26 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:39952 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729665AbeGQK60 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jul 2018 06:58:26 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 7453D10C179F;
        Tue, 17 Jul 2018 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1531823190; bh=H+/6VV4wawjlKIWoiiDq/mUmoWhcE10C84cqFFCbE6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=CySi5hiYsLRzumgchN4K+JY/zGyReybr4SiGbGsBtambOm5wmqzAviqHdbiVOMVSn
         u48EinFxZiu5WDv55IDSYsks19Kih2C+kaVPrH5y+ZRQft01el2BDUAxwMLQxuvJ4m
         Ax5UgPFKuM7Bq2jNwa/kXB8WD2hhssDgzq4r4yB4fVdaCR3EyS5G9H9fIf+tOtKdH3
         /dS0/D7sNj+AjoRazTZHu2/bXhKj7KQmn8mvPHqqNO37riY1Vd120B6vmO4S+bDpmk
         BRQXUkjhxzbWg97GR6UhCpFL5jGsS2ZLNOC+AOW6JX3oy/bN2VXllTFbA4dgYq09bS
         WbAR27VZzlgcA==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id E320D34E2;
        Tue, 17 Jul 2018 03:26:29 -0700 (PDT)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id 1CB313C31A;
        Tue, 17 Jul 2018 12:26:29 +0200 (CEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        joao.pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com,
        shawn.lin@rock-chips.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v13 01/12] PCI: dwc: Fix EP link notification implementation
Date:   Tue, 17 Jul 2018 12:26:16 +0200
Message-Id: <3cefa89ce2e496e7627bd3c7ade93348230adc14.1531822532.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1531822532.git.gustavo.pimentel@synopsys.com>
References: <cover.1531822532.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1531822532.git.gustavo.pimentel@synopsys.com>
References: <cover.1531822532.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move specific features settings from EP shared code
(pcie-designware-ep.c) to the driver (pcie-designware-plat.c).

Previous implementation disables the EP link notification
by default for all SoCs that uses EP DesignWare IP, which affects
directly the dra7xx and artpec6 SoCs.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
---
Change v8->v9:
 - Created patch file.
Change v9->v10:
 - Nothing changed, just to follow the patch set version.
Change v10->v11:
 - Missed Kishon acknowledge.
Change v11->v12:
 - Nothing changed, just to follow the patch set version.
Change v12->v13:
 - Re-sending the patch series.

 drivers/pci/controller/dwc/pcie-designware-ep.c   | 14 ++++++--------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  3 +++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 8650416..04092a7 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -386,15 +386,18 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		return -ENOMEM;
 	ep->outbound_addr = addr;
 
-	if (ep->ops->ep_init)
-		ep->ops->ep_init(ep);
-
 	epc = devm_pci_epc_create(dev, &epc_ops);
 	if (IS_ERR(epc)) {
 		dev_err(dev, "Failed to create epc device\n");
 		return PTR_ERR(epc);
 	}
 
+	ep->epc = epc;
+	epc_set_drvdata(epc, ep);
+
+	if (ep->ops->ep_init)
+		ep->ops->ep_init(ep);
+
 	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
 	if (ret < 0)
 		epc->max_functions = 1;
@@ -413,11 +416,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		return -ENOMEM;
 	}
 
-	epc->features = EPC_FEATURE_NO_LINKUP_NOTIFIER;
-	EPC_FEATURE_SET_BAR(epc->features, BAR_0);
-
-	ep->epc = epc;
-	epc_set_drvdata(epc, ep);
 	dw_pcie_setup(pci);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 5937fed..0ce3440 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -70,10 +70,13 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct pci_epc *epc = ep->epc;
 	enum pci_barno bar;
 
 	for (bar = BAR_0; bar <= BAR_5; bar++)
 		dw_pcie_ep_reset_bar(pci, bar);
+
+	epc->features |= EPC_FEATURE_NO_LINKUP_NOTIFIER;
 }
 
 static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
