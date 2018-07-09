Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C5EF7D048
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Jul 2018 17:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933692AbeGIRnv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 13:43:51 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:56715 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933881AbeGIRm6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jul 2018 13:42:58 -0400
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id C3D2910C1B12;
        Mon,  9 Jul 2018 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1531158177; bh=adpKsON1tUx3wRLdN0pgJT9NJarcjZams7nTigxj8IA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=kZNJ77X890vtgthNULad1vZsR1kkcKczRNJpSKgJ+qEl9/ChqbFx3V2HI7msKUN4O
         sqY8OtH6BIzLAWzcv9SOFE2qC0Oxk+5BuY2SMvuhUucYhYQz6on+e7ys7tyAbIyz/M
         DCYL4Y/wJSELnh0VgR5VGmzaFizLLcn7SYIEBRidjOkn7UPsyb9iKSV0XeE6cr0vKd
         Sx7F3TUymHRsVUE6mBoCcofaBkaqMP6yury7AFqgKarOPe8GlPkPyOiN+nM7zUA9oG
         WNMBU/msOJGVjwDXsv2hPDNXRzt/Gig6jc/r0coneNiUuIRBBrZuT7GoafP9KvxDv+
         7mPQIMuIsGZXw==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 2F8F65CF4;
        Mon,  9 Jul 2018 10:42:57 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id AD6B43ED9C;
        Mon,  9 Jul 2018 18:42:55 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com,
        shawn.lin@rock-chips.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v9 06/12] PCI: dwc: Add legacy interrupt callback handler
Date:   Mon,  9 Jul 2018 18:42:44 +0100
Message-Id: <143f34045d262b638e9908e09e329850200db5d9.1531155252.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1531155252.git.gustavo.pimentel@synopsys.com>
References: <cover.1531155252.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1531155252.git.gustavo.pimentel@synopsys.com>
References: <cover.1531155252.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a legacy interrupt callback handler. Currently DesignWare IP don't
allow trigger legacy interrupts.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
---
Change v1->v2:
 - Nothing changed, just to follow the patch set version.
Change v2->v3:
 - Nothing changed, just to follow the patch set version.
Change v3->v4:
 - Rebased to Lorenzo's master branch v4.18-rc1.
Change v4->v5:
 - Nothing changed, just to follow the patch set version.
Change v5->v6:
 - Nothing changed, just to follow the patch set version.
Change v6->v7:
 - Nothing changed, just to follow the patch set version.
Change v7->v8:
 - Re-sending the patch series.

 drivers/pci/controller/dwc/pcie-designware-ep.c   | 10 ++++++++++
 drivers/pci/controller/dwc/pcie-designware-plat.c |  3 +--
 drivers/pci/controller/dwc/pcie-designware.h      |  6 ++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index afb48b5..9eec21f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
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
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 8bb2ecb..160714d 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -87,8 +87,7 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	switch (type) {
 	case PCI_EPC_IRQ_LEGACY:
-		dev_err(pci->dev, "EP cannot trigger legacy IRQs\n");
-		return -EINVAL;
+		return dw_pcie_ep_raise_legacy_irq(ep, func_no);
 	case PCI_EPC_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
 	case PCI_EPC_IRQ_MSIX:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index a0ab12f..69e6e17 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
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
