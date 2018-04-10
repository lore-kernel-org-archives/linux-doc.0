Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F90D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 17:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751896AbeDJRO4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 13:14:56 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:35902 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751505AbeDJROy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 13:14:54 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 50EAB24E0B5C;
        Tue, 10 Apr 2018 10:14:54 -0700 (PDT)
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id C3A243D3C;
        Tue, 10 Apr 2018 10:14:53 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 213713D7BC;
        Tue, 10 Apr 2018 18:14:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, niklas.cassel@axis.com,
        jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [RFC 00/10] Adds pcitest tool support for MSI-X
Date:   Tue, 10 Apr 2018 18:14:39 +0100
Message-Id: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch set depends the following series:
https://lkml.org/lkml/2018/4/10/421

This series aims to add pcitest tool support for MSI-X. 

Includes new callbacks methods and handlers to trigger the MSI-X
interruptions on the EP Designware IP driver.

Provides new methods on pci_epf_test driver that allows to set/get
EP maximum number of MSI-X entries (similar to set/get MSI methods).

Reworks on MSI set/get and triggering methods on EP Designware IP driver
to be more generic and flexible.

Adds a new input parameter (msix) and replicates the whole MSI mechanism
applied to the MSI-X feature on pcitest tool. Also updates the pcitest
script with the new test set applied to this new feature.

Gustavo Pimentel (10):
  PCI: dwc: Add MSI-X callbacks handler
  PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
  PCI: endpoint: Add MSI-X interfaces
  PCI: dwc: MSI callbacks handler rework
  PCI: dwc: Add legacy interrupt callback handler
  misc: pci_endpoint_test: Add MSI-X support
  misc: pci_endpoint_test: Replace lower into upper case characters
  PCI: endpoint: functions/pci-epf-test: Add MSI-X support
  PCI: endpoint: functions/pci-epf-test: Replace lower into upper case
    characters
  tools: PCI: Add MSI-X support

 Documentation/misc-devices/pci-endpoint-test.txt |   3 +
 drivers/misc/pci_endpoint_test.c                 | 120 ++++++++++----
 drivers/pci/cadence/pcie-cadence-ep.c            |   2 +-
 drivers/pci/dwc/pci-dra7xx.c                     |   2 +-
 drivers/pci/dwc/pcie-artpec6.c                   |   2 +-
 drivers/pci/dwc/pcie-designware-ep.c             | 201 +++++++++++++++++++++--
 drivers/pci/dwc/pcie-designware-plat.c           |   9 +-
 drivers/pci/dwc/pcie-designware.h                |  40 +++--
 drivers/pci/endpoint/functions/pci-epf-test.c    | 113 +++++++++----
 drivers/pci/endpoint/pci-ep-cfs.c                |  24 +++
 drivers/pci/endpoint/pci-epc-core.c              |  60 ++++++-
 include/linux/pci-epc.h                          |  11 +-
 include/linux/pci-epf.h                          |   1 +
 include/uapi/linux/pcitest.h                     |   1 +
 tools/pci/pcitest.c                              |  18 +-
 tools/pci/pcitest.sh                             |  25 +++
 16 files changed, 528 insertions(+), 104 deletions(-)

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
