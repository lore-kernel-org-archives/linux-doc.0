Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C5D207D072
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Jul 2018 15:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933563AbeGFPvp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Jul 2018 11:51:45 -0400
Received: from smtprelay.synopsys.com ([198.182.47.9]:37543 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932974AbeGFPvl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Jul 2018 11:51:41 -0400
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 4B0AB24E0772;
        Fri,  6 Jul 2018 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1530892300; bh=XgkM5BeiY2OujOB0MJicDyaC16F6+mNs+PaOtOJfU38=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=i7h203dEBS4hDhVqtm5D13BWVVttirI2+vghbrUWn/6a/qBYT06ulcLFTEIOHwQFl
         6UU8skumW8dfJ/4o7HqFti7b/w+ETaMA7vR+SDeVLexlqOwMzWefHPLY0BHHHcXDKW
         zJPdL+m+xD6ShVRcz+FIXmTguWiYq92nr3SQFdu+U3cI2Rs+Y1w2ZM1xhFlCw81dY4
         sa8e14uRZYi1jlN7woCbjWMViPQ8My3lPHyB6n+Q3dX57rOtW86MbPk+5b/KX4Kghd
         6TpWrHIrbKZKo7GQjfY8Tkw/8OgBv0jHOHdFgGnYfWHIJWOKyKKb8zfP2ddSKEM7XG
         1L7A3EFk2Kgrg==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 5D28C5C8E;
        Fri,  6 Jul 2018 08:51:39 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id B3A083D23D;
        Fri,  6 Jul 2018 16:51:38 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com,
        shawn.lin@rock-chips.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v8 01/11] PCI: endpoint: Add MSI-X interfaces
Date:   Fri,  6 Jul 2018 16:51:24 +0100
Message-Id: <bd2ef235cdc28ae457bc4c866ca15a6a27642cd4.1530891871.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
References: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
References: <cover.1530891871.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add PCI_EPC_IRQ_MSIX type.

Add MSI-X callbacks signatures to the ops structure.

Add sysfs interface for set/get MSI-X capability maximum number.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
---
Change v1->v2:
 - Nothing changed, just to follow the patch set version.
Change v2->v3:
 - Moved pci_epc_raise_irq() signature changes to patch file #3.
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

 drivers/pci/endpoint/pci-ep-cfs.c   | 24 ++++++++++++++++
 drivers/pci/endpoint/pci-epc-core.c | 57 +++++++++++++++++++++++++++++++++++++
 include/linux/pci-epc.h             |  9 ++++++
 include/linux/pci-epf.h             |  1 +
 4 files changed, 91 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
index 018ea34..d1288a0 100644
--- a/drivers/pci/endpoint/pci-ep-cfs.c
+++ b/drivers/pci/endpoint/pci-ep-cfs.c
@@ -286,6 +286,28 @@ static ssize_t pci_epf_msi_interrupts_show(struct config_item *item,
 		       to_pci_epf_group(item)->epf->msi_interrupts);
 }
 
+static ssize_t pci_epf_msix_interrupts_store(struct config_item *item,
+					     const char *page, size_t len)
+{
+	u16 val;
+	int ret;
+
+	ret = kstrtou16(page, 0, &val);
+	if (ret)
+		return ret;
+
+	to_pci_epf_group(item)->epf->msix_interrupts = val;
+
+	return len;
+}
+
+static ssize_t pci_epf_msix_interrupts_show(struct config_item *item,
+					    char *page)
+{
+	return sprintf(page, "%d\n",
+		       to_pci_epf_group(item)->epf->msix_interrupts);
+}
+
 PCI_EPF_HEADER_R(vendorid)
 PCI_EPF_HEADER_W_u16(vendorid)
 
@@ -327,6 +349,7 @@ CONFIGFS_ATTR(pci_epf_, subsys_vendor_id);
 CONFIGFS_ATTR(pci_epf_, subsys_id);
 CONFIGFS_ATTR(pci_epf_, interrupt_pin);
 CONFIGFS_ATTR(pci_epf_, msi_interrupts);
+CONFIGFS_ATTR(pci_epf_, msix_interrupts);
 
 static struct configfs_attribute *pci_epf_attrs[] = {
 	&pci_epf_attr_vendorid,
@@ -340,6 +363,7 @@ static struct configfs_attribute *pci_epf_attrs[] = {
 	&pci_epf_attr_subsys_id,
 	&pci_epf_attr_interrupt_pin,
 	&pci_epf_attr_msi_interrupts,
+	&pci_epf_attr_msix_interrupts,
 	NULL,
 };
 
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index b0ee427..7d77bd0 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -218,6 +218,63 @@ int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
 EXPORT_SYMBOL_GPL(pci_epc_set_msi);
 
 /**
+ * pci_epc_get_msix() - get the number of MSI-X interrupt numbers allocated
+ * @epc: the EPC device to which MSI-X interrupts was requested
+ * @func_no: the endpoint function number in the EPC device
+ *
+ * Invoke to get the number of MSI-X interrupts allocated by the RC
+ */
+int pci_epc_get_msix(struct pci_epc *epc, u8 func_no)
+{
+	int interrupt;
+	unsigned long flags;
+
+	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions)
+		return 0;
+
+	if (!epc->ops->get_msix)
+		return 0;
+
+	spin_lock_irqsave(&epc->lock, flags);
+	interrupt = epc->ops->get_msix(epc, func_no);
+	spin_unlock_irqrestore(&epc->lock, flags);
+
+	if (interrupt < 0)
+		return 0;
+
+	return interrupt + 1;
+}
+EXPORT_SYMBOL_GPL(pci_epc_get_msix);
+
+/**
+ * pci_epc_set_msix() - set the number of MSI-X interrupt numbers required
+ * @epc: the EPC device on which MSI-X has to be configured
+ * @func_no: the endpoint function number in the EPC device
+ * @interrupts: number of MSI-X interrupts required by the EPF
+ *
+ * Invoke to set the required number of MSI-X interrupts.
+ */
+int pci_epc_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
+{
+	int ret;
+	unsigned long flags;
+
+	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions ||
+	    interrupts < 1 || interrupts > 2048)
+		return -EINVAL;
+
+	if (!epc->ops->set_msix)
+		return 0;
+
+	spin_lock_irqsave(&epc->lock, flags);
+	ret = epc->ops->set_msix(epc, func_no, interrupts - 1);
+	spin_unlock_irqrestore(&epc->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pci_epc_set_msix);
+
+/**
  * pci_epc_unmap_addr() - unmap CPU address from PCI address
  * @epc: the EPC device on which address is allocated
  * @func_no: the endpoint function number in the EPC device
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 243eaa5..89f079f 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -17,6 +17,7 @@ enum pci_epc_irq_type {
 	PCI_EPC_IRQ_UNKNOWN,
 	PCI_EPC_IRQ_LEGACY,
 	PCI_EPC_IRQ_MSI,
+	PCI_EPC_IRQ_MSIX,
 };
 
 /**
@@ -30,6 +31,10 @@ enum pci_epc_irq_type {
  *	     capability register
  * @get_msi: ops to get the number of MSI interrupts allocated by the RC from
  *	     the MSI capability register
+ * @set_msix: ops to set the requested number of MSI-X interrupts in the
+ *	     MSI-X capability register
+ * @get_msix: ops to get the number of MSI-X interrupts allocated by the RC
+ *	     from the MSI-X capability register
  * @raise_irq: ops to raise a legacy or MSI interrupt
  * @start: ops to start the PCI link
  * @stop: ops to stop the PCI link
@@ -48,6 +53,8 @@ struct pci_epc_ops {
 			      phys_addr_t addr);
 	int	(*set_msi)(struct pci_epc *epc, u8 func_no, u8 interrupts);
 	int	(*get_msi)(struct pci_epc *epc, u8 func_no);
+	int	(*set_msix)(struct pci_epc *epc, u8 func_no, u16 interrupts);
+	int	(*get_msix)(struct pci_epc *epc, u8 func_no);
 	int	(*raise_irq)(struct pci_epc *epc, u8 func_no,
 			     enum pci_epc_irq_type type, u8 interrupt_num);
 	int	(*start)(struct pci_epc *epc);
@@ -144,6 +151,8 @@ void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no,
 			phys_addr_t phys_addr);
 int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts);
 int pci_epc_get_msi(struct pci_epc *epc, u8 func_no);
+int pci_epc_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts);
+int pci_epc_get_msix(struct pci_epc *epc, u8 func_no);
 int pci_epc_raise_irq(struct pci_epc *epc, u8 func_no,
 		      enum pci_epc_irq_type type, u8 interrupt_num);
 int pci_epc_start(struct pci_epc *epc);
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 4e77649..ec02f587 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -119,6 +119,7 @@ struct pci_epf {
 	struct pci_epf_header	*header;
 	struct pci_epf_bar	bar[6];
 	u8			msi_interrupts;
+	u16			msix_interrupts;
 	u8			func_no;
 
 	struct pci_epc		*epc;
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
