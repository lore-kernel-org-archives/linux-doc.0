Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A51EA7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 17:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752371AbeDJRQF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 13:16:05 -0400
Received: from smtprelay2.synopsys.com ([198.182.60.111]:60200 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbeDJROz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 13:14:55 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 48DE910C0ABC;
        Tue, 10 Apr 2018 10:14:55 -0700 (PDT)
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 0439A3D59;
        Tue, 10 Apr 2018 10:14:55 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 887C63D7D5;
        Tue, 10 Apr 2018 18:14:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, niklas.cassel@axis.com,
        jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [RFC 08/10] PCI: endpoint: functions/pci-epf-test: Add MSI-X support
Date:   Tue, 10 Apr 2018 18:14:47 +0100
Message-Id: <e278485e7a7b290b550f4f5bb14fa8ed7c2a71e7.1523379766.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds driver's MSI-X support.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 87 +++++++++++++++++++++------
 1 file changed, 69 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 63dca44..5997c6e 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -20,11 +20,18 @@
 
 #define COMMAND_RAISE_LEGACY_IRQ	BIT(0)
 #define COMMAND_RAISE_MSI_IRQ		BIT(1)
-#define MSI_NUMBER_SHIFT		2
+#define COMMAND_RAISE_MSIX_IRQ		BIT(2)
+#define IRQ_TYPE_SHIFT			3
+#define MSI_NUMBER_SHIFT		5
+#define IRQ_TYPE_MASK			(0x3 << IRQ_TYPE_SHIFT)
+#define IRQ_TYPE_LEGACY			0
+#define IRQ_TYPE_MSI			1
+#define IRQ_TYPE_MSIX			2
 #define MSI_NUMBER_MASK			(0x3f << MSI_NUMBER_SHIFT)
-#define COMMAND_READ			BIT(8)
-#define COMMAND_WRITE			BIT(9)
-#define COMMAND_COPY			BIT(10)
+#define MSIX_NUMBER_MASK		(0xfff << MSI_NUMBER_SHIFT)
+#define COMMAND_READ			BIT(17)
+#define COMMAND_WRITE			BIT(18)
+#define COMMAND_COPY			BIT(19)
 
 #define STATUS_READ_SUCCESS		BIT(0)
 #define STATUS_READ_FAIL		BIT(1)
@@ -244,31 +251,44 @@ static int pci_epf_test_write(struct pci_epf_test *epf_test)
 	return ret;
 }
 
-static void pci_epf_test_raise_irq(struct pci_epf_test *epf_test, u8 irq)
+static void pci_epf_test_raise_irq(struct pci_epf_test *epf_test, u8 irq_type,
+				   u16 irq)
 {
-	u8 msi_count;
 	struct pci_epf *epf = epf_test->epf;
+	struct device *dev = &epf->dev;
 	struct pci_epc *epc = epf->epc;
 	enum pci_barno test_reg_bar = epf_test->test_reg_bar;
 	struct pci_epf_test_reg *reg = epf_test->reg[test_reg_bar];
 
 	reg->status |= STATUS_IRQ_RAISED;
-	msi_count = pci_epc_get_msi(epc, epf->func_no);
-	if (irq > msi_count || msi_count <= 0)
-		pci_epc_raise_irq(epc, epf->func_no, PCI_EPC_IRQ_LEGACY, 0);
-	else
+
+	switch (irq_type) {
+	case IRQ_TYPE_LEGACY:
+		pci_epc_raise_irq(epc, epf->func_no, PCI_EPC_IRQ_LEGACY, irq);
+		break;
+	case IRQ_TYPE_MSI:
 		pci_epc_raise_irq(epc, epf->func_no, PCI_EPC_IRQ_MSI, irq);
+		break;
+	case IRQ_TYPE_MSIX:
+		pci_epc_raise_irq(epc, epf->func_no, PCI_EPC_IRQ_MSIX, irq);
+		break;
+	default:
+		dev_err(dev, "Failed to raise IRQ, unknown type\n");
+		break;
+	}
 }
 
 static void pci_epf_test_cmd_handler(struct work_struct *work)
 {
 	int ret;
-	u8 irq;
-	u8 msi_count;
+	u16 irq;
+	u8 irq_type;
+	u16 msi_count;
 	u32 command;
 	struct pci_epf_test *epf_test = container_of(work, struct pci_epf_test,
 						     cmd_handler.work);
 	struct pci_epf *epf = epf_test->epf;
+	struct device *dev = &epf->dev;
 	struct pci_epc *epc = epf->epc;
 	enum pci_barno test_reg_bar = epf_test->test_reg_bar;
 	struct pci_epf_test_reg *reg = epf_test->reg[test_reg_bar];
@@ -280,11 +300,25 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 	reg->command = 0;
 	reg->status = 0;
 
-	irq = (command & MSI_NUMBER_MASK) >> MSI_NUMBER_SHIFT;
+	irq_type = (command & IRQ_TYPE_MASK) >> IRQ_TYPE_SHIFT;
+	switch (irq_type) {
+	case IRQ_TYPE_LEGACY:
+		irq = 0;
+		break;
+	case IRQ_TYPE_MSI:
+		irq = (command & MSI_NUMBER_MASK) >> MSI_NUMBER_SHIFT;
+		break;
+	case IRQ_TYPE_MSIX:
+		irq = (command & MSIX_NUMBER_MASK) >> MSI_NUMBER_SHIFT;
+		break;
+	default:
+		dev_err(dev, "Failed to detect IRQ type\n");
+		goto reset_handler;
+	}
 
 	if (command & COMMAND_RAISE_LEGACY_IRQ) {
 		reg->status = STATUS_IRQ_RAISED;
-		pci_epc_raise_irq(epc, epf->func_no, PCI_EPC_IRQ_LEGACY, 0);
+		pci_epc_raise_irq(epc, epf->func_no, PCI_EPC_IRQ_LEGACY, irq);
 		goto reset_handler;
 	}
 
@@ -294,7 +328,7 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			reg->status |= STATUS_WRITE_FAIL;
 		else
 			reg->status |= STATUS_WRITE_SUCCESS;
-		pci_epf_test_raise_irq(epf_test, irq);
+		pci_epf_test_raise_irq(epf_test, irq_type, irq);
 		goto reset_handler;
 	}
 
@@ -304,7 +338,7 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			reg->status |= STATUS_READ_SUCCESS;
 		else
 			reg->status |= STATUS_READ_FAIL;
-		pci_epf_test_raise_irq(epf_test, irq);
+		pci_epf_test_raise_irq(epf_test, irq_type, irq);
 		goto reset_handler;
 	}
 
@@ -314,7 +348,7 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			reg->status |= STATUS_COPY_SUCCESS;
 		else
 			reg->status |= STATUS_COPY_FAIL;
-		pci_epf_test_raise_irq(epf_test, irq);
+		pci_epf_test_raise_irq(epf_test, irq_type, irq);
 		goto reset_handler;
 	}
 
@@ -327,6 +361,15 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 		goto reset_handler;
 	}
 
+	if (command & COMMAND_RAISE_MSIX_IRQ) {
+		msi_count = pci_epc_get_msix(epc, epf->func_no);
+		if (irq > msi_count || msi_count <= 0)
+			goto reset_handler;
+		reg->status = STATUS_IRQ_RAISED;
+		pci_epc_raise_irq(epc, epf->func_no, PCI_EPC_IRQ_MSIX, irq);
+		goto reset_handler;
+	}
+
 reset_handler:
 	queue_delayed_work(kpcitest_workqueue, &epf_test->cmd_handler,
 			   msecs_to_jiffies(1));
@@ -450,8 +493,16 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 		return ret;
 
 	ret = pci_epc_set_msi(epc, epf->func_no, epf->msi_interrupts);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "MSI configuration failed\n");
 		return ret;
+	}
+
+	ret = pci_epc_set_msix(epc, epf->func_no, epf->msix_interrupts);
+	if (ret) {
+		dev_err(dev, "MSI-X configuration failed\n");
+		return ret;
+	}
 
 	if (!epf_test->linkup_notifier)
 		queue_work(kpcitest_workqueue, &epf_test->cmd_handler.work);
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
