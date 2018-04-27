Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 77F137E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 16:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758936AbeD0Q6B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 12:58:01 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:37144 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758761AbeD0Q55 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:57:57 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 867AF1E065B;
        Fri, 27 Apr 2018 18:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848275; bh=lBkN8j2SCCTTtBdDmJy9W/M9JoLlSCCC1djP+TPUUfU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=ICsjh1BcaRDadRsKWPxdKx3G0n4PbpdzmVWXriHFI4MhchoZqZ1ObjYrUKPBKkhce
         P9dP1gn8+NAY2cEi+pVfP8XfTghLZfBeTfhwA+Ifd+XsGznYfI4kPU5iA97s+Aoibe
         PXPwFYGGzKJ/6tyvhpBGK180epiabFBdOcqgrwOk0QA41L2vKgqNBUfZrFzo5jANj9
         FgGa70R4jmAJhhfxVz67/lk4tg+WKVF1e03EqiPz7Jboa2N42JUTn3KMlIge2y90dA
         a0WHM+4yoO01QOVXyTtyteHn+Q3tkY+YBIz9CBfq6MSQRHZUsqFh7/SdfRnR3sv530
         uSfLxww1F2GUQ==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 4B6153019;
        Fri, 27 Apr 2018 09:57:54 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id A30F73DC07;
        Fri, 27 Apr 2018 17:57:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 01/10] PCI: endpoint: Add MSI-X interfaces
Date:   Fri, 27 Apr 2018 17:57:38 +0100
Message-Id: <52506677a350a3e37ba604bcbf00bba885192094.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add PCI_EPC_IRQ_MSIX type.

Add MSI-X callbacks signatures to ops structure.

Add sysfs interface for set/get MSI-X capability maximum number.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/endpoint/pci-ep-cfs.c   | 24 ++++++++++++++++
 drivers/pci/endpoint/pci-epc-core.c | 57 +++++++++++++++++++++++++++++++++++++
 include/linux/pci-epc.h             | 11 ++++++-
 include/linux/pci-epf.h             |  1 +
 4 files changed, 92 insertions(+), 1 deletion(-)

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
index af657ca..32e8961 100644
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
@@ -48,8 +53,10 @@ struct pci_epc_ops {
 			      phys_addr_t addr);
 	int	(*set_msi)(struct pci_epc *epc, u8 func_no, u8 interrupts);
 	int	(*get_msi)(struct pci_epc *epc, u8 func_no);
+	int	(*set_msix)(struct pci_epc *epc, u8 func_no, u16 interrupts);
+	int	(*get_msix)(struct pci_epc *epc, u8 func_no);
 	int	(*raise_irq)(struct pci_epc *epc, u8 func_no,
-			     enum pci_epc_irq_type type, u8 interrupt_num);
+			     enum pci_epc_irq_type type, u16 interrupt_num);
 	int	(*start)(struct pci_epc *epc);
 	void	(*stop)(struct pci_epc *epc);
 	struct module *owner;
@@ -136,6 +143,8 @@ void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no,
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
