Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 104D77DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 09:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753262AbeDPJ3w (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 05:29:52 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:19698 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751182AbeDPJ3v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 05:29:51 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3G9TdKe012535;
        Mon, 16 Apr 2018 04:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1523870979;
        bh=M8g/+CpfkI3xVtATK6HpmUddYMYVA7rK2vHAPC58XMg=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=bZrk+2XgTWmQ1P/iFw9OL4/1HONDbGzHqpeXrkiX1C85U6jShzq0rJ4JZ5euA7Jtl
         w9Lm6JgDoOcg0ms+NeCez9xcuMXWgltl+on3sFyv4LmS/+iuRm7C+r7kf5l3aZVD9b
         t8Yhrw0qAbjsdq3JXu8WhtgEjmDMDYumJwuFamAs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3G9TdON004111;
        Mon, 16 Apr 2018 04:29:39 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Mon, 16
 Apr 2018 04:29:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend Transport;
 Mon, 16 Apr 2018 04:29:38 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3G9TZVY012553;
        Mon, 16 Apr 2018 04:29:35 -0500
Subject: Re: [RFC 01/10] PCI: dwc: Add MSI-X callbacks handler
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        <bhelgaas@google.com>, <lorenzo.pieralisi@arm.com>,
        <Joao.Pinto@synopsys.com>, <jingoohan1@gmail.com>,
        <adouglas@cadence.com>, <niklas.cassel@axis.com>,
        <jesper.nilsson@axis.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <77b7b2687e9618d3f7d1f11c3fc6ecec9a9442ef.1523379766.git.gustavo.pimentel@synopsys.com>
CC:     <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <0b7023d9-29c6-0993-07d3-b046d25b67ff@ti.com>
Date:   Mon, 16 Apr 2018 14:59:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <77b7b2687e9618d3f7d1f11c3fc6ecec9a9442ef.1523379766.git.gustavo.pimentel@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Gustavo,

On Tuesday 10 April 2018 10:44 PM, Gustavo Pimentel wrote:
> Changes the pcie_raise_irq function signature, namely the interrupt_num
> variable type from u8 to u16 to accommodate the MSI-X maximum interrupts
> of 2048.
> 
> Implements a PCIe config space capability iterator function to search and
> save the MSI and MSI-X pointers. With this method the code becomes more
> generic and flexible.
> 
> Implements MSI-X set/get functions for sysfs interface in order to change
> the EP entries number.
> 
> Implements EP MSI-X interface for triggering interruptions.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
>  drivers/pci/dwc/pci-dra7xx.c           |   2 +-
>  drivers/pci/dwc/pcie-artpec6.c         |   2 +-
>  drivers/pci/dwc/pcie-designware-ep.c   | 145 ++++++++++++++++++++++++++++++++-
>  drivers/pci/dwc/pcie-designware-plat.c |   6 +-
>  drivers/pci/dwc/pcie-designware.h      |  23 +++++-
>  5 files changed, 173 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c
> index ed8558d..5265725 100644
> --- a/drivers/pci/dwc/pci-dra7xx.c
> +++ b/drivers/pci/dwc/pci-dra7xx.c
> @@ -369,7 +369,7 @@ static void dra7xx_pcie_raise_msi_irq(struct dra7xx_pcie *dra7xx,
>  }
>  
>  static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> -				 enum pci_epc_irq_type type, u8 interrupt_num)
> +				 enum pci_epc_irq_type type, u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
> diff --git a/drivers/pci/dwc/pcie-artpec6.c b/drivers/pci/dwc/pcie-artpec6.c
> index e66cede..96dc259 100644
> --- a/drivers/pci/dwc/pcie-artpec6.c
> +++ b/drivers/pci/dwc/pcie-artpec6.c
> @@ -428,7 +428,7 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
>  }
>  
>  static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> -				  enum pci_epc_irq_type type, u8 interrupt_num)
> +				  enum pci_epc_irq_type type, u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> diff --git a/drivers/pci/dwc/pcie-designware-ep.c b/drivers/pci/dwc/pcie-designware-ep.c
> index 15b22a6..874d4c2 100644
> --- a/drivers/pci/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/dwc/pcie-designware-ep.c
> @@ -40,6 +40,44 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  	__dw_pcie_ep_reset_bar(pci, bar, 0);
>  }
>  
> +void dw_pcie_ep_find_cap_addr(struct dw_pcie_ep *ep)
> +{

This should be implemented in a generic way similar to pci_find_capability().
It'll be useful when we try to implement other capabilities as well.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
