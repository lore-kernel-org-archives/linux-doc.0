Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FCCB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 17:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752084AbeDJRO5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 13:14:57 -0400
Received: from smtprelay.synopsys.com ([198.182.47.9]:35901 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbeDJROz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 13:14:55 -0400
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 5527F24E0BDF;
        Tue, 10 Apr 2018 10:14:54 -0700 (PDT)
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 175923F30;
        Tue, 10 Apr 2018 10:14:53 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 424B93D7C2;
        Tue, 10 Apr 2018 18:14:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, niklas.cassel@axis.com,
        jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [RFC 02/10] PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
Date:   Tue, 10 Apr 2018 18:14:41 +0100
Message-Id: <52314006c63f8d21907dfaa03207b39e36bb8171.1523379766.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changes the cdns_pcie_ep_raise_irq function signature, namely the
interrupt_num variable type from u8 to u16 to accommodate the MSI-X maximum
interrupts of 2048.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/cadence/pcie-cadence-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/cadence/pcie-cadence-ep.c b/drivers/pci/cadence/pcie-cadence-ep.c
index 3d8283e..6d6322c 100644
--- a/drivers/pci/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/cadence/pcie-cadence-ep.c
@@ -363,7 +363,7 @@ static int cdns_pcie_ep_send_msi_irq(struct cdns_pcie_ep *ep, u8 fn,
 }
 
 static int cdns_pcie_ep_raise_irq(struct pci_epc *epc, u8 fn,
-				  enum pci_epc_irq_type type, u8 interrupt_num)
+				  enum pci_epc_irq_type type, u16 interrupt_num)
 {
 	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
 
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
