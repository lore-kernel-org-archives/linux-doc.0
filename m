Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C51287DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 17:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752336AbeDJRQF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 13:16:05 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:35932 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751862AbeDJROz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 13:14:55 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 8713C24E0C7F;
        Tue, 10 Apr 2018 10:14:55 -0700 (PDT)
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id F2E4A3D57;
        Tue, 10 Apr 2018 10:14:54 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 7E15A3D7D2;
        Tue, 10 Apr 2018 18:14:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, niklas.cassel@axis.com,
        jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [RFC 07/10] misc: pci_endpoint_test: Replace lower into upper case characters
Date:   Tue, 10 Apr 2018 18:14:46 +0100
Message-Id: <48fee5fd7c31a22d1122ae3428810b6d1dba2f81.1523379766.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replaces lower into upper case characters in comments and debug printks.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/misc/pci_endpoint_test.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index a7d9354..7212a7d 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -259,7 +259,7 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test, size_t size)
 	orig_src_addr = dma_alloc_coherent(dev, size + alignment,
 					   &orig_src_phys_addr, GFP_KERNEL);
 	if (!orig_src_addr) {
-		dev_err(dev, "failed to allocate source buffer\n");
+		dev_err(dev, "Failed to allocate source buffer\n");
 		ret = false;
 		goto err;
 	}
@@ -285,7 +285,7 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test, size_t size)
 	orig_dst_addr = dma_alloc_coherent(dev, size + alignment,
 					   &orig_dst_phys_addr, GFP_KERNEL);
 	if (!orig_dst_addr) {
-		dev_err(dev, "failed to allocate destination address\n");
+		dev_err(dev, "Failed to allocate destination address\n");
 		ret = false;
 		goto err_orig_src_addr;
 	}
@@ -349,7 +349,7 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test, size_t size)
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
-		dev_err(dev, "failed to allocate address\n");
+		dev_err(dev, "Failed to allocate address\n");
 		ret = false;
 		goto err;
 	}
@@ -412,7 +412,7 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test, size_t size)
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
-		dev_err(dev, "failed to allocate destination address\n");
+		dev_err(dev, "Failed to allocate destination address\n");
 		ret = false;
 		goto err;
 	}
@@ -550,7 +550,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	case IRQ_TYPE_MSI:
 		irq = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
 		if (irq < 0)
-			dev_err(dev, "failed to get MSI interrupts\n");
+			dev_err(dev, "Failed to get MSI interrupts\n");
 		test->num_irqs = irq;
 		break;
 	case IRQ_TYPE_MSIX:
@@ -567,7 +567,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	err = devm_request_irq(dev, pdev->irq, pci_endpoint_test_irqhandler,
 			       IRQF_SHARED, DRV_MODULE_NAME, test);
 	if (err) {
-		dev_err(dev, "failed to request IRQ %d\n", pdev->irq);
+		dev_err(dev, "Failed to request IRQ %d\n", pdev->irq);
 		goto err_disable_msi;
 	}
 
@@ -585,7 +585,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 		if (pci_resource_flags(pdev, bar) & IORESOURCE_MEM) {
 			base = pci_ioremap_bar(pdev, bar);
 			if (!base) {
-				dev_err(dev, "failed to read BAR%d\n", bar);
+				dev_err(dev, "Failed to read BAR%d\n", bar);
 				WARN_ON(bar == test_reg_bar);
 			}
 			test->bar[bar] = base;
@@ -605,7 +605,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	id = ida_simple_get(&pci_endpoint_test_ida, 0, 0, GFP_KERNEL);
 	if (id < 0) {
 		err = id;
-		dev_err(dev, "unable to get id\n");
+		dev_err(dev, "Unable to get id\n");
 		goto err_iounmap;
 	}
 
@@ -621,7 +621,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 
 	err = misc_register(misc_device);
 	if (err) {
-		dev_err(dev, "failed to register device\n");
+		dev_err(dev, "Failed to register device\n");
 		goto err_kfree_name;
 	}
 
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
