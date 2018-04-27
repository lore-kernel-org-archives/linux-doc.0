Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 18B2B7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 17:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758951AbeD0RAa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 13:00:30 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:37145 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758919AbeD0Q57 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:57:59 -0400
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 2F8591E083A;
        Fri, 27 Apr 2018 18:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848276; bh=EmwSw1eIhj1ynR203fv/m2fwPYvTcG4f2kQB/Ms6Q9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=SfKRpxZItVm3hzFTh5yc1yiLO/aZvc3IH+UDuPVB9oGMe2sCzNqpxVRBp/Bh8774i
         Dlj22PWACDQY575t6xjyBi1/iwAAIlHbQ2rVFHixVK3YlaEMRa8Da6Rc+AzvpwN2R4
         TMePhTiI+FrrOckotU776bBbsiUxmP4b5CMtlr28rGXCBhACuuAQRLwqKusDaTPDF+
         EdRbK3urPWamFI12kjnp2MURe7s6SYG22YErsdeHynS4PEeP6DKL6FbIgQs/25V/3G
         zVTfxRfOSl1h4N7jykg+3AhD8qJgOeUI8N/AjOSc5SW0IMTTabc5huloB0vv6T6yMS
         VSllzCsx3J2bQ==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 63A6B302E;
        Fri, 27 Apr 2018 09:57:55 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id DCCA13DC13;
        Fri, 27 Apr 2018 17:57:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 05/10] PCI: dwc: Add legacy interrupt callback handler
Date:   Fri, 27 Apr 2018 17:57:42 +0100
Message-Id: <8d1204f6e1e0d4ceaa4df30415c025feaa72e6ee.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a legacy interrupt callback handler. Currently DesignWare IP don't
allow triggering the legacy interrupt.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/dwc/pcie-designware-ep.c   | 10 ++++++++++
 drivers/pci/dwc/pcie-designware-plat.c |  3 +--
 drivers/pci/dwc/pcie-designware.h      |  6 ++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/dwc/pcie-designware-ep.c b/drivers/pci/dwc/pcie-designware-ep.c
index 1ba3a7f..b599169 100644
--- a/drivers/pci/dwc/pcie-designware-ep.c
+++ b/drivers/pci/dwc/pcie-designware-ep.c
@@ -370,6 +370,16 @@ static const struct pci_epc_ops epc_ops = {
 	.stop			= dw_pcie_ep_stop,
 };
 
+int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct device *dev = pci->dev;
+
+	dev_err(dev, "EP cannot trigger legacy IRQs\n");
+
+	return -EINVAL;
+}
+
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num)
 {
diff --git a/drivers/pci/dwc/pcie-designware-plat.c b/drivers/pci/dwc/pcie-designware-plat.c
index 654dcb5..90a8c95 100644
--- a/drivers/pci/dwc/pcie-designware-plat.c
+++ b/drivers/pci/dwc/pcie-designware-plat.c
@@ -84,8 +84,7 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	switch (type) {
 	case PCI_EPC_IRQ_LEGACY:
-		dev_err(pci->dev, "EP cannot trigger legacy IRQs\n");
-		return -EINVAL;
+		return dw_pcie_ep_raise_legacy_irq(ep, func_no);
 	case PCI_EPC_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
 	case PCI_EPC_IRQ_MSIX:
diff --git a/drivers/pci/dwc/pcie-designware.h b/drivers/pci/dwc/pcie-designware.h
index a0ab12f..69e6e17 100644
--- a/drivers/pci/dwc/pcie-designware.h
+++ b/drivers/pci/dwc/pcie-designware.h
@@ -350,6 +350,7 @@ static inline int dw_pcie_allocate_domains(struct pcie_port *pp)
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
@@ -369,6 +370,11 @@ static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 {
 }
 
+static inline int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no)
+{
+	return 0;
+}
+
 static inline int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 					   u8 interrupt_num)
 {
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
