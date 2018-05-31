Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AA3D27D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754620AbeEaKzI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:55:08 -0400
Received: from lelnx193.ext.ti.com ([198.47.27.77]:64128 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754459AbeEaKzH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 06:55:07 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VAsvCh031380;
        Thu, 31 May 2018 05:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1527764097;
        bh=9HqE/61OfpdIuIsvy8WKSQnWJXgWjC9vtLmpTD7smQg=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=VZaqB5v9CFGtkgFgqQnjNUVGZogO35UfQ66pn9BATda4hTJulSeqcbGrVLMbsr2nc
         jqiuF/fo2Yf/Bp4g2lFg2lZFS3PasUbDpMwjSfRVCGZMSa9TNiGC8tuE+7WCPNseT7
         QUeWsU9DE6ZoUL+ikX2oxdXYsT3KqxP9H4+i2CZQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAsvoA021449;
        Thu, 31 May 2018 05:54:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Thu, 31
 May 2018 05:54:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Thu, 31 May 2018 05:54:57 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAsrNw016093;
        Thu, 31 May 2018 05:54:54 -0500
Subject: Re: [PATCH v2 4/7] PCI: dwc: Rework MSI callbacks handler
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        <bhelgaas@google.com>, <lorenzo.pieralisi@arm.com>,
        <Joao.Pinto@synopsys.com>, <jingoohan1@gmail.com>,
        <adouglas@cadence.com>, <jesper.nilsson@axis.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
 <9558d4fcd6f888599e3b70133f1f242c7a6664ee.1526576613.git.gustavo.pimentel@synopsys.com>
CC:     <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <ba3df388-9ec1-fe87-e575-0eddc5a565b7@ti.com>
Date:   Thu, 31 May 2018 16:24:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9558d4fcd6f888599e3b70133f1f242c7a6664ee.1526576613.git.gustavo.pimentel@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thursday 17 May 2018 10:39 PM, Gustavo Pimentel wrote:
> Remove duplicate defines located on pcie-designware.h file already
> available on /include/uapi/linux/pci-regs.h file.
> 
> Add pci_epc_set_msi() maximum 32 interrupts validation.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
> Change v1->v2:
>  - Nothing changed, just to follow the patch set version.
> 
>  drivers/pci/dwc/pcie-designware-ep.c | 49 ++++++++++++++++++++++++------------
>  drivers/pci/dwc/pcie-designware.h    | 11 --------
>  drivers/pci/endpoint/pci-epc-core.c  |  3 ++-
>  3 files changed, 35 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/pci/dwc/pcie-designware-ep.c b/drivers/pci/dwc/pcie-designware-ep.c
> index e5f2377..a4baa0d 100644
> --- a/drivers/pci/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/dwc/pcie-designware-ep.c
> @@ -246,29 +246,38 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no,
>  
>  static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
>  {
> -	int val;
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 val, reg;
> +
> +	if (!ep->msi_cap)

Ah, msi_cap is used here.
> +		return 0;

return -EINVAL.
>  
> -	val = dw_pcie_readw_dbi(pci, MSI_MESSAGE_CONTROL);
> -	if (!(val & MSI_CAP_MSI_EN_MASK))
> +	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	val = dw_pcie_readw_dbi(pci, reg);
> +	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
>  
> -	val = (val & MSI_CAP_MME_MASK) >> MSI_CAP_MME_SHIFT;
> +	val = (val & PCI_MSI_FLAGS_QSIZE) >> 4;
> +
>  	return val;
>  }
>  
> -static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 encode_int)
> +static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
>  {
> -	int val;
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 val, reg;
>  
> -	val = dw_pcie_readw_dbi(pci, MSI_MESSAGE_CONTROL);
> -	val &= ~MSI_CAP_MMC_MASK;
> -	val |= (encode_int << MSI_CAP_MMC_SHIFT) & MSI_CAP_MMC_MASK;
> +	if (!ep->msi_cap)
> +		return 0;

return -EINVAL.
> +
> +	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	val = dw_pcie_readw_dbi(pci, reg);
> +	val &= ~PCI_MSI_FLAGS_QMASK;
> +	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, MSI_MESSAGE_CONTROL, val);
> +	dw_pcie_writew_dbi(pci, reg, val);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	return 0;
> @@ -367,21 +376,29 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc = ep->epc;
>  	u16 msg_ctrl, msg_data;
> -	u32 msg_addr_lower, msg_addr_upper;
> +	u32 msg_addr_lower, msg_addr_upper, reg;
>  	u64 msg_addr;
>  	bool has_upper;
>  	int ret;
>  
> +	if (!ep->msi_cap)
> +		return 0;

return -EINVAL.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
