Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 44D0A7D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Jun 2018 16:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933215AbeFUQDr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Jun 2018 12:03:47 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:57287 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933169AbeFUQBt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jun 2018 12:01:49 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id D6C691E1614;
        Thu, 21 Jun 2018 18:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1529596907; bh=w1SFJn8eIzCg0mtUmxzE2PzOHIrAX/MxPVynWJUAh3c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=Nl7uDc5SOlwQUOdeC3Nd22iuAAGyRdrteiy1yQA7jIyJJ16GnRv5CLhUbxBcV4nRc
         XCNW9a4KjJcrHAiENIkR+Zz3elLF6brHHuUjCrUzX1CF2gBwIQZg2eUAopNLA4xiS2
         6jRIWApdzc4oUTYJWJgnYgBGyixv6AOEAMRIZ/v+hBYklCHv9xHOxKhWpzKClobzSP
         3iTnAGE9GP9qP7zgwPLCDhD+OQb/IenFFJSO3wixLUU+wTFlLjnPXlZ20TSkH0OCZI
         Fz1g1TOUg/0Thj2B7YyOi6MXvv4gak08ZImvcjb4mP9NZk5YHU7cUSib3SmSKVDgqE
         6gMeLpVE8LFHw==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 113D339B1;
        Thu, 21 Jun 2018 09:01:46 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 69A2B3D140;
        Thu, 21 Jun 2018 17:01:44 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com,
        shawn.lin@rock-chips.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v6 11/11] PCI: endpoint: Add MSI set maximum restriction.
Date:   Thu, 21 Jun 2018 17:01:36 +0100
Message-Id: <5bceea0ec98a7436ac5960635898ddfbec2cf6e1.1529595907.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1529595907.git.gustavo.pimentel@synopsys.com>
References: <cover.1529595907.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1529595907.git.gustavo.pimentel@synopsys.com>
References: <cover.1529595907.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add pci_epc_set_msi() maximum 32 interrupts validation.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
Change v4->v5:
 - New patch file.
Change v5->v6:
 - Nothing changed, just to follow the patch set version.

 drivers/pci/endpoint/pci-epc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index c72e656..094dcc3 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -201,7 +201,8 @@ int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
 	u8 encode_int;
 	unsigned long flags;
 
-	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions)
+	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions ||
+	    interrupts > 32)
 		return -EINVAL;
 
 	if (!epc->ops->set_msi)
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
