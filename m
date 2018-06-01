Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60C2B7D085
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 14:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751555AbeFAOZE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 10:25:04 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:42594 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750850AbeFAOZD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 10:25:03 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id D8FA61E05C2;
        Fri,  1 Jun 2018 16:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1527863102; bh=9UCxShg4DFlxwjj5LUgbVXBCIgWFgXp1odYPFCGvQXg=;
        h=From:To:Cc:Subject:Date:From;
        b=E16IkCqXVOT1ec50VX+0irUhv/7CIb9AtH5WT5oat5Wfu3ljiRYE+SzgQKQMDqQaT
         qgsp+5zm62lpAT7K4dFMh/i5bvj/Irr0RWLWwbF81swqEoY+UFmynJGwV9o9RABFjM
         OMuvs6HFhtrObt1XPr/8dgaDxNb4mr6Uqf3SZIy5ymr5BuGm1xMJwbQ36Y9nq2lE3L
         TXXKPcHEvY9R6eNy4y7qpMDK2rv2MJTSloYhepTbuBD4WYMg/TFlDHUW0Gbhut11qj
         m7v7Em4yE01pT48om3N0jYwZG94gU2hjnzBqp3tvuCbXo8OCQeM+S9l76cZBprE6JN
         R3HIyA4QTsETA==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id B2DB73BF7;
        Fri,  1 Jun 2018 07:25:00 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 157693D784;
        Fri,  1 Jun 2018 15:25:00 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v3 00/10] Add MSI-X support on pcitest tool
Date:   Fri,  1 Jun 2018 15:24:42 +0100
Message-Id: <cover.1527862777.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Patch series made against Lorenzo's branches and also depends of:
 - pci/dwc
 - pci/endpoint

Add MSI-X support on pcitest tool.

Add new callbacks methods and handlers to trigger the MSI-X interrupts
on the EP DesignWare IP driver.

Allow to set/get MSI-X EP maximum capability number.

Rework on set/get and triggering MSI methods on EP DesignWare IP driver.

Add a new input parameter (msix) to pcitest tool to test MSI-X feature.

Update the pcitest.sh script to support MSI-X feature tests.

Gustavo Pimentel (10):
  PCI: endpoint: Add MSI-X interfaces
  PCI: dwc: Add MSI-X callbacks handler
  PCI: Update xxx_pcie_ep_raise_irq() and pci_epc_raise_irq() signatures
  PCI: dwc: Rework MSI callbacks handler
  PCI: dwc: Add legacy interrupt callback handler
  pci-epf-test/pci_endpoint_test: Cleanup PCI_ENDPOINT_TEST memspace
  pci-epf-test/pci_endpoint_test: Use irq_type module parameter
  pci-epf-test/pci_endpoint_test: Add MSI-X support
  pci_endpoint_test: Add 2 ioctl commands
  tools: PCI: Add MSI-X support

 Documentation/misc-devices/pci-endpoint-test.txt |   6 +
 drivers/misc/pci_endpoint_test.c                 | 261 +++++++++++++++++------
 drivers/pci/cadence/pcie-cadence-ep.c            |   3 +-
 drivers/pci/dwc/pci-dra7xx.c                     |   2 +-
 drivers/pci/dwc/pcie-artpec6.c                   |   2 +-
 drivers/pci/dwc/pcie-designware-ep.c             | 205 ++++++++++++++++--
 drivers/pci/dwc/pcie-designware-plat.c           |   7 +-
 drivers/pci/dwc/pcie-designware.h                |  31 +--
 drivers/pci/endpoint/functions/pci-epf-test.c    |  81 +++++--
 drivers/pci/endpoint/pci-ep-cfs.c                |  24 +++
 drivers/pci/endpoint/pci-epc-core.c              |  68 +++++-
 include/linux/pci-epc.h                          |  15 +-
 include/linux/pci-epf.h                          |   1 +
 include/uapi/linux/pcitest.h                     |   3 +
 tools/pci/pcitest.c                              |  51 ++++-
 tools/pci/pcitest.sh                             |  15 ++
 16 files changed, 643 insertions(+), 132 deletions(-)

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
