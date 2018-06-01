Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 853C97DF86
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 14:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751968AbeFAOZU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 10:25:20 -0400
Received: from smtprelay.synopsys.com ([198.182.37.59]:42604 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751777AbeFAOZG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 10:25:06 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 928BE1E161C;
        Fri,  1 Jun 2018 16:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1527863103; bh=1yLDc/sHv7u0c1BIwLGmxjphSKruPeA8zhkLkIpiERY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=PxEBgIXyW2OUoZ209IwunSYI8t0w4Gj8y44Z7hQ5ZofacZEWQFIeqQ7se1yXbsS5Q
         3niu14HzTA0aielrSCoRdh1wia8AUm2fU9h1e51+SModG2Nw4Vg/kPiWq7R/awylf5
         63Cb5ijSMkCnpUsSRyMUgavjPVyxhB6DSW4GSRFN3QUnMT2q20hZEAvQwzG9ZpWvPh
         z5OT3zGLjDE63NGSQhX0NXiIug7UGkNdEGRQRHS77sbrz1cTnt8jt70x09liS7gzJM
         FjDhXPc1V0MxzexYT/ctJIbBQbG9OdbAFpOKo9L+HpOsg81Np1zB0HXszM6jHhzwcp
         m7zKORoZBVfBA==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 134863C22;
        Fri,  1 Jun 2018 07:25:02 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 7AB3D3D79A;
        Fri,  1 Jun 2018 15:25:00 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v3 07/10] pci-epf-test/pci_endpoint_test: Use irq_type module parameter
Date:   Fri,  1 Jun 2018 15:24:49 +0100
Message-Id: <3717c48784d839d60629649f1b012e6951e2790c.1527862777.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527862777.git.gustavo.pimentel@synopsys.com>
References: <cover.1527862777.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1527862777.git.gustavo.pimentel@synopsys.com>
References: <cover.1527862777.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new driver parameter to allow interruption type selection.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
Change v2->v3:
 - New patch file created base on the previous patch
"misc: pci_endpoint_test: Add MSI-X support" patch file following
Kishon's suggestion.

 drivers/misc/pci_endpoint_test.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 56be808..8f2061a 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -81,6 +81,10 @@ static bool no_msi;
 module_param(no_msi, bool, 0444);
 MODULE_PARM_DESC(no_msi, "Disable MSI interrupt in pci_endpoint_test");
 
+static int irq_type = IRQ_TYPE_MSI;
+module_param(irq_type, int, 0444);
+MODULE_PARM_DESC(irq_type, "IRQ mode selection in pci_endpoint_test (0 - Legacy, 1 - MSI)");
+
 enum pci_barno {
 	BAR_0,
 	BAR_1,
@@ -107,7 +111,7 @@ struct pci_endpoint_test {
 struct pci_endpoint_test_data {
 	enum pci_barno test_reg_bar;
 	size_t alignment;
-	bool no_msi;
+	int irq_type;
 };
 
 static inline u32 pci_endpoint_test_readl(struct pci_endpoint_test *test,
@@ -290,8 +294,7 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test, size_t size)
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_SIZE,
 				 size);
 
-	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE,
-				 no_msi ? IRQ_TYPE_LEGACY : IRQ_TYPE_MSI);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
 				 COMMAND_COPY);
@@ -360,8 +363,7 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test, size_t size)
 
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_SIZE, size);
 
-	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE,
-				 no_msi ? IRQ_TYPE_LEGACY : IRQ_TYPE_MSI);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
 				 COMMAND_READ);
@@ -418,8 +420,7 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test, size_t size)
 
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_SIZE, size);
 
-	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE,
-				 no_msi ? IRQ_TYPE_LEGACY : IRQ_TYPE_MSI);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
 				 COMMAND_WRITE);
@@ -504,11 +505,14 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	test->alignment = 0;
 	test->pdev = pdev;
 
+	if (no_msi)
+		irq_type = IRQ_TYPE_LEGACY;
+
 	data = (struct pci_endpoint_test_data *)ent->driver_data;
 	if (data) {
 		test_reg_bar = data->test_reg_bar;
 		test->alignment = data->alignment;
-		no_msi = data->no_msi;
+		irq_type = data->irq_type;
 	}
 
 	init_completion(&test->irq_raised);
@@ -528,13 +532,21 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
-	if (!no_msi) {
+	switch (irq_type) {
+	case IRQ_TYPE_LEGACY:
+		irq = 0;
+		break;
+	case IRQ_TYPE_MSI:
 		irq = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
 		if (irq < 0)
 			dev_err(dev, "Failed to get MSI interrupts\n");
 		test->num_irqs = irq;
+		break;
+	default:
+		dev_err(dev, "Invalid IRQ type selected\n");
 	}
 
+
 	err = devm_request_irq(dev, pdev->irq, pci_endpoint_test_irqhandler,
 			       IRQF_SHARED, DRV_MODULE_NAME, test);
 	if (err) {
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
