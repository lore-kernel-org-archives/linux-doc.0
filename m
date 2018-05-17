Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6BA557D09D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 May 2018 17:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752100AbeEQRJd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 May 2018 13:09:33 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:53438 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751619AbeEQRJb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 May 2018 13:09:31 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id B43041E0490;
        Thu, 17 May 2018 19:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1526576969; bh=qelp+B5xckZ9buG8nSPlEq6W5zxa1aBOlwMeSjuqRbY=;
        h=From:To:Cc:Subject:Date:From;
        b=c613UOPl3uEiGjde3Hm+S3eN4T2pHkCZQr2jqE37zQYFF3ZHmcJxGpO1X3Y1NW7mt
         GdSboDs9JMA/1levoUcicTODIblMr9eVmgdqCCdpXb8KTewOETRlfS/Ctxt6W7tMKH
         cEHtnnsS7IaahG05T5oGaUzBiRvR6whrZ9KDuguuPVCTZpVpRhhDAf6AqAklgaK35H
         SHcX0DbigKQGrilCES3s6kXIAhHVmV349TNPXXcThdvHOEqWqQwmGpeocIgmC6jW3H
         UOcQ0xAw2PZ2lkCpsEBqMtO+I8uGPQcGu0DkYjQ1NktKL66LXuc7PAgb/Km2u4f7K2
         Z9oc9T9d9I5ew==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id B3E943FAF;
        Thu, 17 May 2018 10:09:28 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id DA22C3DD17;
        Thu, 17 May 2018 18:09:27 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH v2 0/7] Add MSI-X support on pcitest tool
Date:   Thu, 17 May 2018 18:09:16 +0100
Message-Id: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
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


Gustavo Pimentel (7):
  PCI: endpoint: Add MSI-X interfaces
  PCI: dwc: Add MSI-X callbacks handler
  PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
  PCI: dwc: Rework MSI callbacks handler
  PCI: dwc: Add legacy interrupt callback handler
  misc: pci_endpoint_test: Add MSI-X support
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
 drivers/pci/endpoint/pci-epc-core.c              |  62 +++++-
 include/linux/pci-epc.h                          |  13 +-
 include/linux/pci-epf.h                          |   1 +
 include/uapi/linux/pcitest.h                     |   3 +
 tools/pci/pcitest.c                              |  51 ++++-
 tools/pci/pcitest.sh                             |  15 ++
 16 files changed, 639 insertions(+), 128 deletions(-)

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
