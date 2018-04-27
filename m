Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8D3737E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 16:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758925AbeD0Q6A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 12:58:00 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:37142 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758759AbeD0Q55 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:57:57 -0400
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 5F00E1E05F7;
        Fri, 27 Apr 2018 18:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848275; bh=LdYEGT44ehogozOsbqPts8RMEBOb6sTg0mFSWdHpF9Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=Buc7I+LPcM1lUo0tBYGcionP3Z4iMjaC5TRjluff9xn6oNh4J2o1qCmkvPNRlIsz8
         IDfa/ojlom+nG7ZrWh7HSLVBAfJb+WpSS6pxRST5nThvOY7GXuh835vpnkfDBWAAqm
         cnHTovc0oOUUiA25GzOAjwJrCm99+w5QG4P0Y3PqqL3LybHSVe5Bl8nIhSauPMIO8H
         GcaBzRYyEz7DBIDAt47TDVRRJVZYruP/LGk6faiXtcd6krpW0nnQFEpI79HL4YNzre
         VQdzN+OT0sjsHXj6IW+piS6Q12BZ7k91h1OAOWL8AGpY2bdVOT6glkksRGMRYuAta6
         BTmFdSvhIRr7Q==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 750473007;
        Fri, 27 Apr 2018 09:57:54 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id CEFE63DC10;
        Fri, 27 Apr 2018 17:57:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 04/10] PCI: dwc: Rework MSI callbacks handler
Date:   Fri, 27 Apr 2018 17:57:41 +0100
Message-Id: <ec14ef2dc73161795a23f1c53aaef6463ab31aee.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove duplicate defines located on pcie-designware.h file already
available on /include/uapi/linux/pci-regs.h file.

Add pci_epc_set_msi() maximum 32 interrupts validation.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/dwc/pcie-designware-ep.c | 49 ++++++++++++++++++++++++------------
 drivers/pci/dwc/pcie-designware.h    | 11 --------
 drivers/pci/endpoint/pci-epc-core.c  |  3 ++-
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/dwc/pcie-designware-ep.c b/drivers/pci/dwc/pcie-designware-ep.c
index 9b0d396..1ba3a7f 100644
--- a/drivers/pci/dwc/pcie-designware-ep.c
+++ b/drivers/pci/dwc/pcie-designware-ep.c
@@ -246,29 +246,38 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no,
 
 static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
 {
-	int val;
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 val, reg;
+
+	if (!ep->msi_cap)
+		return 0;
 
-	val = dw_pcie_readw_dbi(pci, MSI_MESSAGE_CONTROL);
-	if (!(val & MSI_CAP_MSI_EN_MASK))
+	reg = ep->msi_cap + PCI_MSI_FLAGS;
+	val = dw_pcie_readw_dbi(pci, reg);
+	if (!(val & PCI_MSI_FLAGS_ENABLE))
 		return -EINVAL;
 
-	val = (val & MSI_CAP_MME_MASK) >> MSI_CAP_MME_SHIFT;
+	val = (val & PCI_MSI_FLAGS_QSIZE) >> 4;
+
 	return val;
 }
 
-static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 encode_int)
+static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
 {
-	int val;
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 val, reg;
 
-	val = dw_pcie_readw_dbi(pci, MSI_MESSAGE_CONTROL);
-	val &= ~MSI_CAP_MMC_MASK;
-	val |= (encode_int << MSI_CAP_MMC_SHIFT) & MSI_CAP_MMC_MASK;
+	if (!ep->msi_cap)
+		return 0;
+
+	reg = ep->msi_cap + PCI_MSI_FLAGS;
+	val = dw_pcie_readw_dbi(pci, reg);
+	val &= ~PCI_MSI_FLAGS_QMASK;
+	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
 	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, MSI_MESSAGE_CONTROL, val);
+	dw_pcie_writew_dbi(pci, reg, val);
 	dw_pcie_dbi_ro_wr_dis(pci);
 
 	return 0;
@@ -367,21 +376,29 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
 	u16 msg_ctrl, msg_data;
-	u32 msg_addr_lower, msg_addr_upper;
+	u32 msg_addr_lower, msg_addr_upper, reg;
 	u64 msg_addr;
 	bool has_upper;
 	int ret;
 
+	if (!ep->msi_cap)
+		return 0;
+
 	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
-	msg_ctrl = dw_pcie_readw_dbi(pci, MSI_MESSAGE_CONTROL);
+	reg = ep->msi_cap + PCI_MSI_FLAGS;
+	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
 	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
-	msg_addr_lower = dw_pcie_readl_dbi(pci, MSI_MESSAGE_ADDR_L32);
+	reg = ep->msi_cap + PCI_MSI_ADDRESS_LO;
+	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
 	if (has_upper) {
-		msg_addr_upper = dw_pcie_readl_dbi(pci, MSI_MESSAGE_ADDR_U32);
-		msg_data = dw_pcie_readw_dbi(pci, MSI_MESSAGE_DATA_64);
+		reg = ep->msi_cap + PCI_MSI_ADDRESS_HI;
+		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
+		reg = ep->msi_cap + PCI_MSI_DATA_64;
+		msg_data = dw_pcie_readw_dbi(pci, reg);
 	} else {
 		msg_addr_upper = 0;
-		msg_data = dw_pcie_readw_dbi(pci, MSI_MESSAGE_DATA_32);
+		reg = ep->msi_cap + PCI_MSI_DATA_32;
+		msg_data = dw_pcie_readw_dbi(pci, reg);
 	}
 	msg_addr = ((u64) msg_addr_upper) << 32 | msg_addr_lower;
 	ret = dw_pcie_ep_map_addr(epc, func_no, ep->msi_mem_phys, msg_addr,
diff --git a/drivers/pci/dwc/pcie-designware.h b/drivers/pci/dwc/pcie-designware.h
index b22c5bb..a0ab12f 100644
--- a/drivers/pci/dwc/pcie-designware.h
+++ b/drivers/pci/dwc/pcie-designware.h
@@ -96,17 +96,6 @@
 #define PCIE_GET_ATU_INB_UNR_REG_OFFSET(region)				\
 			((0x3 << 20) | ((region) << 9) | (0x1 << 8))
 
-#define MSI_MESSAGE_CONTROL		0x52
-#define MSI_CAP_MMC_SHIFT		1
-#define MSI_CAP_MMC_MASK		(7 << MSI_CAP_MMC_SHIFT)
-#define MSI_CAP_MME_SHIFT		4
-#define MSI_CAP_MSI_EN_MASK		0x1
-#define MSI_CAP_MME_MASK		(7 << MSI_CAP_MME_SHIFT)
-#define MSI_MESSAGE_ADDR_L32		0x54
-#define MSI_MESSAGE_ADDR_U32		0x58
-#define MSI_MESSAGE_DATA_32		0x58
-#define MSI_MESSAGE_DATA_64		0x5C
-
 #define MAX_MSI_IRQS			256
 #define MAX_MSI_IRQS_PER_CTRL		32
 #define MAX_MSI_CTRLS			(MAX_MSI_IRQS / MAX_MSI_IRQS_PER_CTRL)
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 7d77bd0..f517e26 100644
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
