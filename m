Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D1227DE80
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 11:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730922AbeGSLq7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 07:46:59 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:47790 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730316AbeGSLq7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Jul 2018 07:46:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B86F7A9;
        Thu, 19 Jul 2018 04:04:20 -0700 (PDT)
Received: from e107981-ln.cambridge.arm.com (e107981-ln.cambridge.arm.com [10.1.207.54])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DD643F246;
        Thu, 19 Jul 2018 04:04:18 -0700 (PDT)
Date:   Thu, 19 Jul 2018 12:04:13 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc:     bhelgaas@google.com, joao.pinto@synopsys.com, jingoohan1@gmail.com,
        kishon@ti.com, adouglas@cadence.com, jesper.nilsson@axis.com,
        shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 00/12] Add MSI-X support on pcitest tool
Message-ID: <20180719110412.GA9213@e107981-ln.cambridge.arm.com>
References: <cover.1531922095.git.gustavo.pimentel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1531922095.git.gustavo.pimentel@synopsys.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 19, 2018 at 10:32:10AM +0200, Gustavo Pimentel wrote:
> Patch series made against Lorenzo's master branch.
> 
> Fix EP link notification implementation.
> 
> Add MSI-X support on pcitest tool.
> 
> Add new callbacks methods and handlers to trigger the MSI-X interrupts
> on the EP DesignWare IP driver.
> 
> Allow to set/get MSI-X EP maximum capability number.
> 
> Rework on set/get and triggering MSI methods on EP DesignWare IP driver.
> 
> Add a new input parameter (msix) to pcitest tool to test MSI-X feature.
> 
> Update the pcitest.sh script to support MSI-X feature tests.
> 
> Update related documentation accordingly.
> 
> Gustavo Pimentel (12):
>   PCI: dwc: Fix EP link notification implementation
>   PCI: endpoint: Add MSI-X interfaces
>   PCI: Update xxx_pcie_ep_raise_irq() and pci_epc_raise_irq() signatures
>   PCI: dwc: Add MSI-X callbacks handler
>   PCI: dwc: Rework MSI callbacks handler
>   PCI: dwc: Add legacy interrupt callback handler
>   pci-epf-test/pci_endpoint_test: Cleanup PCI_ENDPOINT_TEST memspace
>   pci-epf-test/pci_endpoint_test: Use irq_type module parameter
>   pci-epf-test/pci_endpoint_test: Add MSI-X support
>   pci_endpoint_test: Add 2 ioctl commands
>   tools: PCI: Add MSI-X support
>   PCI: endpoint: Add MSI set maximum restriction
> 
>  .../PCI/endpoint/function/binding/pci-test.txt     |   2 +
>  Documentation/PCI/endpoint/pci-endpoint.txt        |   4 +-
>  Documentation/PCI/endpoint/pci-test-function.txt   |  29 ++-
>  Documentation/PCI/endpoint/pci-test-howto.txt      |  30 ++-
>  Documentation/ioctl/ioctl-number.txt               |   1 +
>  Documentation/misc-devices/pci-endpoint-test.txt   |   6 +
>  drivers/misc/pci_endpoint_test.c                   | 290 ++++++++++++++++-----
>  drivers/pci/controller/dwc/pci-dra7xx.c            |   2 +-
>  drivers/pci/controller/dwc/pcie-artpec6.c          |   2 +-
>  drivers/pci/controller/dwc/pcie-designware-ep.c    | 210 +++++++++++++--
>  drivers/pci/controller/dwc/pcie-designware-plat.c  |  11 +-
>  drivers/pci/controller/dwc/pcie-designware.h       |  29 ++-
>  drivers/pci/controller/pcie-cadence-ep.c           |   3 +-
>  drivers/pci/controller/pcie-rockchip-ep.c          |   2 +-
>  drivers/pci/endpoint/functions/pci-epf-test.c      |  86 ++++--
>  drivers/pci/endpoint/pci-ep-cfs.c                  |  24 ++
>  drivers/pci/endpoint/pci-epc-core.c                |  68 ++++-
>  include/linux/pci-epc.h                            |  16 +-
>  include/linux/pci-epf.h                            |   1 +
>  include/uapi/linux/pcitest.h                       |   3 +
>  tools/pci/pcitest.c                                |  51 +++-
>  tools/pci/pcitest.sh                               |  15 ++
>  22 files changed, 735 insertions(+), 150 deletions(-)

Applied to pci/dwc for v4.19, thanks for the series and the thorough
review !

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
