Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 01F3E7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 17:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759018AbeD0RBA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 13:01:00 -0400
Received: from smtprelay.synopsys.com ([198.182.37.59]:37141 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758739AbeD0Q56 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:57:58 -0400
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 5D4921E05F3;
        Fri, 27 Apr 2018 18:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848275; bh=DNO3z41LcTw1POhCom4Vj3zCMaNzPtdm0UMAPDMAcZk=;
        h=From:To:Cc:Subject:Date:From;
        b=Mkq6MY+HuCANDZa8a+gTh25WzZww731Fc0HbVLLJYZVLkhIbZX6KhlG8Q7lWVCdDI
         hm+7LqewMKeJ7cFIm+qqbrMuwu0gUZueZEMZGqtYnK5o5xBqA+GqWIxm2/3MkihN0W
         +PSuvPPpwdjxkwDQuwDCnEoA1/Nl91x/fFWOlrACVBDF3H8aGT22K5omEloNH+hf5a
         c8E69joQ/vEASRgvtlNCV2PhU1f3IRvPFfwRj6tsKlyE6cv3kJZx1w3cpqvqA7rHzQ
         vJkoKHjfGt/+nu3/e5G7WFi9YMYBkQqtnI4LGViBOsT88j97HzSaos4DaSfLPr781B
         fBrDcUuRq1VVQ==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 3A98958EE;
        Fri, 27 Apr 2018 09:57:54 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 8E2F53DC03;
        Fri, 27 Apr 2018 17:57:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 00/10] Add MSI-X support on pcitest tool
Date:   Fri, 27 Apr 2018 17:57:37 +0100
Message-Id: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Depends of the following serie [1].

Add MSI-X support on pcitest tool.

Add new callbacks methods and handlers to trigger the MSI-X interrupts
on the EP DesignWare IP driver.

Allow to set/get MSI-X EP maximum capability number.

Rework on set/get and triggering MSI methods on EP DesignWare IP driver.

Add a new input parameter (msix) to pcitest tool to test MSI-X feature.

Update the pcitest.sh script to support MSI-X feature tests.

[1] -> https://lkml.org/lkml/2018/4/27/342

Gustavo Pimentel (10):
  PCI: endpoint: Add MSI-X interfaces
  PCI: dwc: Add MSI-X callbacks handler
  PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
  PCI: dwc: Rework MSI callbacks handler
  PCI: dwc: Add legacy interrupt callback handler
  misc: pci_endpoint_test: Add MSI-X support
  misc: pci_endpoint_test: Replace lower into upper case characters
  PCI: endpoint: functions/pci-epf-test: Replace lower into upper case
    characters
  tools: PCI: Add MSI-X support
  misc: pci_endpoint_test: Use pci_irq_vector function

 Documentation/misc-devices/pci-endpoint-test.txt |   3 +
 drivers/misc/pci_endpoint_test.c                 | 147 +++++++++++------
 drivers/pci/cadence/pcie-cadence-ep.c            |   2 +-
 drivers/pci/dwc/pci-dra7xx.c                     |   2 +-
 drivers/pci/dwc/pcie-artpec6.c                   |   2 +-
 drivers/pci/dwc/pcie-designware-ep.c             | 202 +++++++++++++++++++++--
 drivers/pci/dwc/pcie-designware-plat.c           |   7 +-
 drivers/pci/dwc/pcie-designware.h                |  31 ++--
 drivers/pci/endpoint/functions/pci-epf-test.c    | 104 ++++++++----
 drivers/pci/endpoint/pci-ep-cfs.c                |  24 +++
 drivers/pci/endpoint/pci-epc-core.c              |  60 ++++++-
 include/linux/pci-epc.h                          |  11 +-
 include/linux/pci-epf.h                          |   1 +
 include/uapi/linux/pcitest.h                     |   1 +
 tools/pci/pcitest.c                              |  18 +-
 tools/pci/pcitest.sh                             |  25 +++
 16 files changed, 517 insertions(+), 123 deletions(-)

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
