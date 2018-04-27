Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E32877DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 16:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758940AbeD0Q6C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 12:58:02 -0400
Received: from smtprelay.synopsys.com ([198.182.37.59]:37140 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758614AbeD0Q55 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:57:57 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 5B8391E04CE;
        Fri, 27 Apr 2018 18:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848275; bh=qz4rFE9q9v/IthxzKqoDfIm4eiKYqc97PQT7ErVroD8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=l0oK2G80k6yF5rpPU25ELbFZV5b5mjqxHYYbYe7Qd1+KbxpGV2CTYCSZDi0JcXPFU
         2t7gDuCK/pnGuXJKtG4zSncqwLy0NuVOrgL2Rmt1pTDCO1Hnblf2AqJ99YDn5mHV0T
         Ro1BE13Ad/rvuGmNN44dK8Ww8HQPw/e4oVfNekCw8HosDeyXQGj3nENJw8o7WZ5sfu
         3Nry199bfFqjNC/SqGjmKFjpxtWA++Wd2ass2D0bK675QoOhJKQtY/sb86PbEhSxla
         FwdiZUFBmsD5oj36VS3Kxw9PxcVz1CuqHQ9fguzNXJyLAC1fruEG83VUmj3twdEi48
         3bt+3XoqKGazg==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 67463301E;
        Fri, 27 Apr 2018 09:57:54 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id C1D3A3DC0D;
        Fri, 27 Apr 2018 17:57:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 03/10] PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
Date:   Fri, 27 Apr 2018 17:57:40 +0100
Message-Id: <22e7cbcda9369cf88aadfa1b17c1dad00170a4ff.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change cdns_pcie_ep_raise_irq() signature, namely the interrupt_num variable type
from u8 to u16 to accommodate the 2048 maximum MSI-X interrupts.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Acked-by: Alan Douglas <adouglas@cadence.com>
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
