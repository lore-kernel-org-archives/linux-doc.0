Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B0FA7D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754455AbeEaKuv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:50:51 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:16226 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754346AbeEaKuu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 06:50:50 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VAnUDO026107;
        Thu, 31 May 2018 05:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1527763770;
        bh=dFR1ojyZ1UXXtcV5mMqpgctVjT8ZZO59y0jGjJD/Oxg=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=eZAI6aDQ/H+QFuSoqi6WYdGikhXLPlJRrGXNcVMKBdj6YCOZ/vKC6yNKb1QoQnJqN
         gEI++HtjOGW/SBmbHV1qkNJAwo1V1gsmX1FKygY4PHv7YR1ulwVGytL72CkjQzow72
         2K8k32szmk15epD2DVyONSRsTnrNI5jj4DAIMMJw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAnUgH013189;
        Thu, 31 May 2018 05:49:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Thu, 31
 May 2018 05:49:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Thu, 31 May 2018 05:49:29 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAnPNx009226;
        Thu, 31 May 2018 05:49:26 -0500
Subject: Re: [PATCH v2 2/7] PCI: dwc: Add MSI-X callbacks handler
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        <bhelgaas@google.com>, <lorenzo.pieralisi@arm.com>,
        <Joao.Pinto@synopsys.com>, <jingoohan1@gmail.com>,
        <adouglas@cadence.com>, <jesper.nilsson@axis.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
 <24e9cdc20d57aaea0bcb62879824c57004df46c9.1526576613.git.gustavo.pimentel@synopsys.com>
CC:     <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <758acd51-a36a-ae68-2e28-5ce184707dda@ti.com>
Date:   Thu, 31 May 2018 16:19:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <24e9cdc20d57aaea0bcb62879824c57004df46c9.1526576613.git.gustavo.pimentel@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thursday 17 May 2018 10:39 PM, Gustavo Pimentel wrote:
> Change pcie_raise_irq() signature, namely the interrupt_num variable type
> from u8 to u16 to accommodate 2048 maximum MSI-X interrupts.
> 
> Add PCIe config space capability search function.
> 
> Add sysfs set/get interface to allow the change of EP MSI-X maximum number.
> 
> Add EP MSI-X callback for triggering interruptions.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
> Change v1->v2:
>  - Nothing changed, just to follow the patch set version.
> 
>  drivers/pci/dwc/pci-dra7xx.c           |   2 +-
>  drivers/pci/dwc/pcie-artpec6.c         |   2 +-
>  drivers/pci/dwc/pcie-designware-ep.c   | 146 ++++++++++++++++++++++++++++++++-
>  drivers/pci/dwc/pcie-designware-plat.c |   4 +-
>  drivers/pci/dwc/pcie-designware.h      |  14 +++-
>  5 files changed, 163 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c
> index f688204..bdf948b 100644
> --- a/drivers/pci/dwc/pci-dra7xx.c
> +++ b/drivers/pci/dwc/pci-dra7xx.c
> @@ -370,7 +370,7 @@ static void dra7xx_pcie_raise_msi_irq(struct dra7xx_pcie *dra7xx,
>  }
>  
>  static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> -				 enum pci_epc_irq_type type, u8 interrupt_num)
> +				 enum pci_epc_irq_type type, u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
> diff --git a/drivers/pci/dwc/pcie-artpec6.c b/drivers/pci/dwc/pcie-artpec6.c
> index 321b56c..9a2474b 100644
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

I think you should change pci_epc_raise_irq (in previous patch) and the above
two changes in a separate patch. You can also include pcie-cadence-ep.c along
with that.
>  
> diff --git a/drivers/pci/dwc/pcie-designware-ep.c b/drivers/pci/dwc/pcie-designware-ep.c
> index 1eec441..e5f2377 100644
> --- a/drivers/pci/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/dwc/pcie-designware-ep.c
> @@ -40,6 +40,39 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  	__dw_pcie_ep_reset_bar(pci, bar, 0);
>  }
>  
> +u8 __dw_pcie_ep_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
> +			      u8 cap)
> +{
> +	u8 cap_id, next_cap_ptr;
> +	u16 reg;
> +
> +	reg = dw_pcie_readw_dbi(pci, cap_ptr);
> +	next_cap_ptr = (reg & 0xff00) >> 8;
> +	cap_id = (reg & 0x00ff);
> +
> +	if (!next_cap_ptr || cap_id > PCI_CAP_ID_MAX)
> +		return 0;
> +
> +	if (cap_id == cap)
> +		return cap_ptr;
> +
> +	return __dw_pcie_ep_find_next_cap(pci, next_cap_ptr, cap);
> +}
> +
> +u8 dw_pcie_ep_find_capability(struct dw_pcie *pci, u8 cap)
> +{
> +	u8 next_cap_ptr;
> +	u16 reg;
> +
> +	reg = dw_pcie_readw_dbi(pci, PCI_CAPABILITY_LIST);
> +	next_cap_ptr = (reg & 0x00ff);
> +
> +	if (!next_cap_ptr)
> +		return 0;
> +
> +	return __dw_pcie_ep_find_next_cap(pci, next_cap_ptr, cap);
> +}
> +
>  static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
>  				   struct pci_epf_header *hdr)
>  {
> @@ -241,8 +274,47 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 encode_int)
>  	return 0;
>  }
>  
> +static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
> +{
> +	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 val, reg;
> +
> +	if (!ep->msix_cap)
> +		return 0;

return -EINVAL?

or pci_epc_get_msix() will return 1.
> +
> +	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	val = dw_pcie_readw_dbi(pci, reg);
> +	if (!(val & PCI_MSIX_FLAGS_ENABLE))
> +		return -EINVAL;
> +
> +	val &= PCI_MSIX_FLAGS_QSIZE;
> +
> +	return val;
> +}
> +
> +static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
> +{
> +	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 val, reg;
> +
> +	if (!ep->msix_cap)
> +		return 0;

here too return -EINVAL.
> +
> +	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	val = dw_pcie_readw_dbi(pci, reg);
> +	val &= ~PCI_MSIX_FLAGS_QSIZE;
> +	val |= interrupts;
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, reg, val);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	return 0;
> +}
> +
>  static int dw_pcie_ep_raise_irq(struct pci_epc *epc, u8 func_no,
> -				enum pci_epc_irq_type type, u8 interrupt_num)
> +				enum pci_epc_irq_type type, u16 interrupt_num)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  
> @@ -282,6 +354,8 @@ static const struct pci_epc_ops epc_ops = {
>  	.unmap_addr		= dw_pcie_ep_unmap_addr,
>  	.set_msi		= dw_pcie_ep_set_msi,
>  	.get_msi		= dw_pcie_ep_get_msi,
> +	.set_msix		= dw_pcie_ep_set_msix,
> +	.get_msix		= dw_pcie_ep_get_msix,
>  	.raise_irq		= dw_pcie_ep_raise_irq,
>  	.start			= dw_pcie_ep_start,
>  	.stop			= dw_pcie_ep_stop,
> @@ -322,6 +396,64 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> +			     u16 interrupt_num)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct pci_epc *epc = ep->epc;
> +	u16 tbl_offset, bir;
> +	u32 bar_addr_upper, bar_addr_lower;
> +	u32 msg_addr_upper, msg_addr_lower;
> +	u32 reg, msg_data, vec_ctrl;
> +	u64 tbl_addr, msg_addr, reg_u64;
> +	void __iomem *msix_tbl;
> +	int ret;
> +
> +	reg = ep->msix_cap + PCI_MSIX_TABLE;
> +	tbl_offset = dw_pcie_readl_dbi(pci, reg);
> +	bir = (tbl_offset & PCI_MSIX_TABLE_BIR);
> +	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
> +	tbl_offset >>= 3;
> +
> +	reg = PCI_BASE_ADDRESS_0 + (4 * bir);
> +	bar_addr_lower = dw_pcie_readl_dbi(pci, reg);
> +	reg_u64 = (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
> +	if (reg_u64 == PCI_BASE_ADDRESS_MEM_TYPE_64)
> +		bar_addr_upper = dw_pcie_readl_dbi(pci, reg + 4);
> +	else
> +		bar_addr_upper = 0;

You can skip else if you can use something like below

bar_addr_upper = 0
bar_addr_lower = dw_pcie_readl_dbi(pci, reg);
reg_u64 = (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
if (reg_u64 == PCI_BASE_ADDRESS_MEM_TYPE_64)
	bar_addr_upper = dw_pcie_readl_dbi(pci, reg + 4);
> +
> +	tbl_addr = ((u64) bar_addr_upper) << 32 | bar_addr_lower;
> +	tbl_addr += (tbl_offset + ((interrupt_num - 1) * PCI_MSIX_ENTRY_SIZE));
> +	tbl_addr &= PCI_BASE_ADDRESS_MEM_MASK;
> +
> +	msix_tbl = ioremap_nocache(ep->phys_base + tbl_addr, ep->addr_size);

Why do you want to ioremap the entire address region?
> +	if (!msix_tbl)
> +		return -EINVAL;
> +
> +	msg_addr_lower = readl(msix_tbl + PCI_MSIX_ENTRY_LOWER_ADDR);
> +	msg_addr_upper = readl(msix_tbl + PCI_MSIX_ENTRY_UPPER_ADDR);
> +	msg_addr = ((u64) msg_addr_upper) << 32 | msg_addr_lower;
> +	msg_data = readl(msix_tbl + PCI_MSIX_ENTRY_DATA);
> +	vec_ctrl = readl(msix_tbl + PCI_MSIX_ENTRY_VECTOR_CTRL);
> +
> +	if (vec_ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT)
> +		return -EPERM;
> +
> +	iounmap(msix_tbl);
> +
> +	ret = dw_pcie_ep_map_addr(epc, func_no, ep->msix_mem_phys, msg_addr,
> +				  epc->mem->page_size);
> +	if (ret)
> +		return ret;
> +
> +	writel(msg_data, ep->msix_mem);
> +
> +	dw_pcie_ep_unmap_addr(epc, func_no, ep->msix_mem_phys);
> +
> +	return 0;
> +}
> +
>  void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -329,6 +461,9 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
>  	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
>  			      epc->mem->page_size);
>  
> +	pci_epc_mem_free_addr(epc, ep->msix_mem_phys, ep->msix_mem,
> +			      epc->mem->page_size);
> +
>  	pci_epc_mem_exit(epc);
>  }
>  
> @@ -410,6 +545,15 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		dev_err(dev, "Failed to reserve memory for MSI\n");
>  		return -ENOMEM;
>  	}
> +	ep->msi_cap = dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSI);

msi_cap is not used anywhere else.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
