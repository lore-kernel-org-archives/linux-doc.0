Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7EADA7D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 May 2018 17:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752062AbeEQRJc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 May 2018 13:09:32 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:53439 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751233AbeEQRJb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 May 2018 13:09:31 -0400
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id BBEC21E140A;
        Thu, 17 May 2018 19:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1526576969; bh=DCvxSqPjIknuVqoPgSPzcVeE9IPQJP5bnfmYAbblNgM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=i2csvZCqOWOHZEuzG1jcWOCOYde4EWdzpXg/tou4dOYrOJ77fUFSDpu04O6YQqXr6
         e/Ty83nB2T36H0GzAY/hEpOZOfe+80tIb2radVoPiPLj8uqg5WKKX1Ow+QZYWNXMkI
         n9p45OKqZCM1tNhjBACMmn62Ln6CCaLQqnZDgxl7kJ7WaCvL+DcLkn9ALax4PKanPm
         bEwEAXYu/Qqu1JPis+5CYYy75jWBmwZkFhU3WpyJcR6g7Y9v84DhmRqNxJFwapvoZm
         OlnLW6yCR/62+dFxir5eM1IKjVdutAXvbNd2ycpnKyZomk8HjA5Ge/RK9HMAVQ7OUL
         Y32IvUGBNbnSg==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id C08105844;
        Thu, 17 May 2018 10:09:28 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 151DA3DD20;
        Thu, 17 May 2018 18:09:28 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v2 3/7] PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
Date:   Thu, 17 May 2018 18:09:19 +0100
Message-Id: <4994f263efbf6a2cb952d3d9839fb3b1737efde9.1526576613.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change cdns_pcie_ep_raise_irq() signature, namely the interrupt_num
variable type from u8 to u16 to accommodate 2048 maximum MSI-X
interrupts.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Acked-by: Alan Douglas <adouglas@cadence.com>
---
Change v1->v2:
 - Nothing changed, just to follow the patch set version.

 drivers/pci/cadence/pcie-cadence-ep.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/cadence/pcie-cadence-ep.c b/drivers/pci/cadence/pcie-cadence-ep.c
index 3d8283e..6b713ca 100644
--- a/drivers/pci/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/cadence/pcie-cadence-ep.c
@@ -363,7 +363,8 @@ static int cdns_pcie_ep_send_msi_irq(struct cdns_pcie_ep *ep, u8 fn,
 }
 
 static int cdns_pcie_ep_raise_irq(struct pci_epc *epc, u8 fn,
-				  enum pci_epc_irq_type type, u8 interrupt_num)
+				  enum pci_epc_irq_type type,
+				  u16 interrupt_num)
 {
 	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
 
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
