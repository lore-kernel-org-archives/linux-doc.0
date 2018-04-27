Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC5EE7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 17:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932938AbeD0Q7c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 12:59:32 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:37148 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758920AbeD0Q57 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:57:59 -0400
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 75D4C1E169E;
        Fri, 27 Apr 2018 18:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848276; bh=YprutGMUcMu1ZFXSfUam/azpHGSnHXm0khCyldNBMIM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=O2jcrYY9Abcj+k4IjmHvh3QF5KJzoy8Mk6u8ipRc0EKLggY/eKSOqkQvnf0kSsAiM
         Fn7aL+9+4UUNs2S1zr/8RYCXJ2y28iOe65C8WDdBqQJpBz62GPRL+Bv5cp/gGkjkmV
         xcAXlwBTYxr9B2Ujxggo1+gfLINEDHs7pjDs52mILWLUgMILvV5xck8aTWxeZKrZGT
         fnr9femc5H6BpXMVjO6Ca+1uPWMSMmMrnDu1R6exo/OhCk+ujHf68Kc5j1JHxt4ckh
         TGxddEC1equp73prFsrKV4xmEQnhAG6jcmU4GBiUa6NwepJNt7M9WvAOEOqujqD7rH
         CEMJKn4orBDIg==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 671E83030;
        Fri, 27 Apr 2018 09:57:55 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 027BA3DC1C;
        Fri, 27 Apr 2018 17:57:54 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 07/10] misc: pci_endpoint_test: Replace lower into upper case characters
Date:   Fri, 27 Apr 2018 17:57:44 +0100
Message-Id: <17224b32eaf73ac071975c4b6cda526472f11d15.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replace all initial lower case character into upper case in comments
and debug printks.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/misc/pci_endpoint_test.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index b003079..c9b6e26 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -250,7 +250,7 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test, size_t size)
 	orig_src_addr = dma_alloc_coherent(dev, size + alignment,
 					   &orig_src_phys_addr, GFP_KERNEL);
 	if (!orig_src_addr) {
-		dev_err(dev, "failed to allocate source buffer\n");
+		dev_err(dev, "Failed to allocate source buffer\n");
 		ret = false;
 		goto err;
 	}
@@ -276,7 +276,7 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test, size_t size)
 	orig_dst_addr = dma_alloc_coherent(dev, size + alignment,
 					   &orig_dst_phys_addr, GFP_KERNEL);
 	if (!orig_dst_addr) {
-		dev_err(dev, "failed to allocate destination address\n");
+		dev_err(dev, "Failed to allocate destination address\n");
 		ret = false;
 		goto err_orig_src_addr;
 	}
@@ -340,7 +340,7 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test, size_t size)
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
-		dev_err(dev, "failed to allocate address\n");
+		dev_err(dev, "Failed to allocate address\n");
 		ret = false;
 		goto err;
 	}
@@ -403,7 +403,7 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test, size_t size)
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
-		dev_err(dev, "failed to allocate destination address\n");
+		dev_err(dev, "Failed to allocate destination address\n");
 		ret = false;
 		goto err;
 	}
@@ -543,7 +543,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	case IRQ_TYPE_MSI:
 		irq = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
 		if (irq < 0)
-			dev_err(dev, "failed to get MSI interrupts\n");
+			dev_err(dev, "Failed to get MSI interrupts\n");
 		test->num_irqs = irq;
 		break;
 	case IRQ_TYPE_MSIX:
@@ -560,7 +560,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	err = devm_request_irq(dev, pdev->irq, pci_endpoint_test_irqhandler,
 			       IRQF_SHARED, DRV_MODULE_NAME, test);
 	if (err) {
-		dev_err(dev, "failed to request IRQ %d\n", pdev->irq);
+		dev_err(dev, "Failed to request IRQ %d\n", pdev->irq);
 		goto err_disable_msi;
 	}
 
@@ -578,7 +578,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 		if (pci_resource_flags(pdev, bar) & IORESOURCE_MEM) {
 			base = pci_ioremap_bar(pdev, bar);
 			if (!base) {
-				dev_err(dev, "failed to read BAR%d\n", bar);
+				dev_err(dev, "Failed to read BAR%d\n", bar);
 				WARN_ON(bar == test_reg_bar);
 			}
 			test->bar[bar] = base;
@@ -598,7 +598,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	id = ida_simple_get(&pci_endpoint_test_ida, 0, 0, GFP_KERNEL);
 	if (id < 0) {
 		err = id;
-		dev_err(dev, "unable to get id\n");
+		dev_err(dev, "Unable to get id\n");
 		goto err_iounmap;
 	}
 
@@ -614,7 +614,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 
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
