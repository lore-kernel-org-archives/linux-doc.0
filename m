Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E8037DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 17:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932975AbeD0Q7d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 12:59:33 -0400
Received: from smtprelay.synopsys.com ([198.182.37.59]:37147 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758921AbeD0Q57 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:57:59 -0400
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 41BB91E1322;
        Fri, 27 Apr 2018 18:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848276; bh=qCqL8yJ+/42ULkF6DKqWMxHZskCO1V7aICgiSvbtgsQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=IAeeI+upCrNLDBTgz5ATZ5OU8pk+mTYt8zl2YyuPNnTaUQYxspWMISU2yxjGQQ77t
         Kjf0o/Otdj9Wru9QmIWNLNBH8jZBYJ47kYC6jPzO9kvVSi3LQXSznmvG3g5mNo+rOr
         tAHqPZOrM31fs7HQokmCAkJz47erNDp4UYUWeuV+stGesYinzc/Msd3WNICYI+aDIn
         28QvZ8ZIWHY88yUm8Wa1uwSB51SZbDPduBiwODoDjblawiKqaWTarGhFXSd4U7dyaT
         sY02SApDTZVdy5gzwev+Ighz+qz2hPeLZkFxv3Bb8wEylkxaXJA4oi6x+By1rSzb/9
         LcQ1KNdNEpSzw==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 7394258FD;
        Fri, 27 Apr 2018 09:57:55 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 292823DC27;
        Fri, 27 Apr 2018 17:57:54 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 10/10] misc: pci_endpoint_test: Use pci_irq_vector function
Date:   Fri, 27 Apr 2018 17:57:47 +0100
Message-Id: <d817b639ca484665a085df9a5cdefbcd7a062e31.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replace "pdev->irq + index" operation by the pci_irq_vector() call,
that converts from device vector to Linux IRQ.
(suggestion made by Alan Douglas).

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/misc/pci_endpoint_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index c9b6e26..cbdd0c6 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -220,7 +220,7 @@ static bool pci_endpoint_test_msi_irq(struct pci_endpoint_test *test,
 	if (!val)
 		return false;
 
-	if (test->last_irq - pdev->irq == msi_num - 1)
+	if (pci_irq_vector(pdev, irq_num - 1) == test->last_irq)
 		return true;
 
 	return false;
@@ -565,12 +565,12 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	}
 
 	for (i = 1; i < irq; i++) {
-		err = devm_request_irq(dev, pdev->irq + i,
+		err = devm_request_irq(dev, pci_irq_vector(pdev, i),
 				       pci_endpoint_test_irqhandler,
 				       IRQF_SHARED, DRV_MODULE_NAME, test);
 		if (err)
 			dev_err(dev, "Failed to request IRQ %d for MSI%s %d\n",
-				pdev->irq + i,
+				pci_irq_vector(pdev, i),
 				irq_type == IRQ_TYPE_MSIX ? "-X" : "", i + 1);
 	}
 
@@ -633,7 +633,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	}
 
 	for (i = 0; i < irq; i++)
-		devm_free_irq(dev, pdev->irq + i, test);
+		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i), test);
 
 err_disable_msi:
 	pci_disable_msi(pdev);
@@ -667,7 +667,7 @@ static void pci_endpoint_test_remove(struct pci_dev *pdev)
 			pci_iounmap(pdev, test->bar[bar]);
 	}
 	for (i = 0; i < test->num_irqs; i++)
-		devm_free_irq(&pdev->dev, pdev->irq + i, test);
+		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i), test);
 	pci_disable_msi(pdev);
 	pci_disable_msix(pdev);
 	pci_release_regions(pdev);
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
