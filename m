Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 206587D08C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754319AbeEaKaZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:30:25 -0400
Received: from lelnx194.ext.ti.com ([198.47.27.80]:55819 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754284AbeEaKaY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 06:30:24 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VAUDHA030122;
        Thu, 31 May 2018 05:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1527762613;
        bh=8PsDYqTkR2gj0jLcv+GSoOYV3vHkEfB74d3bRiDs45s=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=XbRanRrc7+iuKoG7b35pCX63d53fDHtJi8yXy2cwJBGoqzedLhp6yd+EtCmI+6olH
         ln0dAUEcqzm+I+VNoR6GeItv/KffT+FRn2B0nqfgRbfT7HdNM+gdMpBuJfMADQZnoK
         8wgjPTPe2xOAWW1aXq8VSGG6yq+/i5Ruc5/C1Qp4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAUDAb011400;
        Thu, 31 May 2018 05:30:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Thu, 31
 May 2018 05:30:12 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Thu, 31 May 2018 05:30:13 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAU8OP022687;
        Thu, 31 May 2018 05:30:09 -0500
Subject: Re: [PATCH v2 1/7] PCI: endpoint: Add MSI-X interfaces
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        <bhelgaas@google.com>, <lorenzo.pieralisi@arm.com>,
        <Joao.Pinto@synopsys.com>, <jingoohan1@gmail.com>,
        <adouglas@cadence.com>, <jesper.nilsson@axis.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
 <1c07395b28f8b33ce370bd6f15bb1e7f2a95ba45.1526576613.git.gustavo.pimentel@synopsys.com>
CC:     <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <9787b000-5f7e-a3fa-383d-4d3975fa220b@ti.com>
Date:   Thu, 31 May 2018 16:00:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1c07395b28f8b33ce370bd6f15bb1e7f2a95ba45.1526576613.git.gustavo.pimentel@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Thursday 17 May 2018 10:39 PM, Gustavo Pimentel wrote:
> Add PCI_EPC_IRQ_MSIX type.
> 
> Add MSI-X callbacks signatures to the ops structure.
> 
> Add sysfs interface for set/get MSI-X capability maximum number.
> 
> Change pci_epc_raise_irq() signature, namely the interrupt_num variable type
> from u8 to u16 to accommodate 2048 maximum MSI-X interrupts.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
> Change v1->v2:
>  - Nothing changed, just to follow the patch set version.
> 
>  drivers/pci/endpoint/pci-ep-cfs.c   | 24 +++++++++++++++
>  drivers/pci/endpoint/pci-epc-core.c | 59 ++++++++++++++++++++++++++++++++++++-
>  include/linux/pci-epc.h             | 13 ++++++--
>  include/linux/pci-epf.h             |  1 +
>  4 files changed, 94 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
> index 018ea34..d1288a0 100644
> --- a/drivers/pci/endpoint/pci-ep-cfs.c
> +++ b/drivers/pci/endpoint/pci-ep-cfs.c
> @@ -286,6 +286,28 @@ static ssize_t pci_epf_msi_interrupts_show(struct config_item *item,
>  		       to_pci_epf_group(item)->epf->msi_interrupts);
>  }
>  
> +static ssize_t pci_epf_msix_interrupts_store(struct config_item *item,
> +					     const char *page, size_t len)
> +{
> +	u16 val;
> +	int ret;
> +
> +	ret = kstrtou16(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	to_pci_epf_group(item)->epf->msix_interrupts = val;
> +
> +	return len;
> +}
> +
> +static ssize_t pci_epf_msix_interrupts_show(struct config_item *item,
> +					    char *page)
> +{
> +	return sprintf(page, "%d\n",
> +		       to_pci_epf_group(item)->epf->msix_interrupts);
> +}
> +
>  PCI_EPF_HEADER_R(vendorid)
>  PCI_EPF_HEADER_W_u16(vendorid)
>  
> @@ -327,6 +349,7 @@ CONFIGFS_ATTR(pci_epf_, subsys_vendor_id);
>  CONFIGFS_ATTR(pci_epf_, subsys_id);
>  CONFIGFS_ATTR(pci_epf_, interrupt_pin);
>  CONFIGFS_ATTR(pci_epf_, msi_interrupts);
> +CONFIGFS_ATTR(pci_epf_, msix_interrupts);
>  
>  static struct configfs_attribute *pci_epf_attrs[] = {
>  	&pci_epf_attr_vendorid,
> @@ -340,6 +363,7 @@ static struct configfs_attribute *pci_epf_attrs[] = {
>  	&pci_epf_attr_subsys_id,
>  	&pci_epf_attr_interrupt_pin,
>  	&pci_epf_attr_msi_interrupts,
> +	&pci_epf_attr_msix_interrupts,
>  	NULL,
>  };
>  
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index b0ee427..a23aa75 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -137,7 +137,7 @@ EXPORT_SYMBOL_GPL(pci_epc_start);
>   * Invoke to raise an MSI or legacy interrupt
>   */
>  int pci_epc_raise_irq(struct pci_epc *epc, u8 func_no,
> -		      enum pci_epc_irq_type type, u8 interrupt_num)
> +		      enum pci_epc_irq_type type, u16 interrupt_num)
>  {
>  	int ret;
>  	unsigned long flags;
> @@ -218,6 +218,63 @@ int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
>  EXPORT_SYMBOL_GPL(pci_epc_set_msi);
>  
>  /**
> + * pci_epc_get_msix() - get the number of MSI-X interrupt numbers allocated
> + * @epc: the EPC device to which MSI-X interrupts was requested
> + * @func_no: the endpoint function number in the EPC device
> + *
> + * Invoke to get the number of MSI-X interrupts allocated by the RC
> + */
> +int pci_epc_get_msix(struct pci_epc *epc, u8 func_no)
> +{
> +	int interrupt;
> +	unsigned long flags;
> +
> +	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions)
> +		return 0;
> +
> +	if (!epc->ops->get_msix)
> +		return 0;
> +
> +	spin_lock_irqsave(&epc->lock, flags);
> +	interrupt = epc->ops->get_msix(epc, func_no);
> +	spin_unlock_irqrestore(&epc->lock, flags);
> +
> +	if (interrupt < 0)
> +		return 0;
> +
> +	return interrupt + 1;
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_get_msix);
> +
> +/**
> + * pci_epc_set_msix() - set the number of MSI-X interrupt numbers required
> + * @epc: the EPC device on which MSI-X has to be configured
> + * @func_no: the endpoint function number in the EPC device
> + * @interrupts: number of MSI-X interrupts required by the EPF
> + *
> + * Invoke to set the required number of MSI-X interrupts.
> + */
> +int pci_epc_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
> +{
> +	int ret;
> +	unsigned long flags;
> +
> +	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions ||
> +	    interrupts < 1 || interrupts > 2048)
> +		return -EINVAL;
> +
> +	if (!epc->ops->set_msix)
> +		return 0;
> +
> +	spin_lock_irqsave(&epc->lock, flags);
> +	ret = epc->ops->set_msix(epc, func_no, interrupts - 1);
> +	spin_unlock_irqrestore(&epc->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_set_msix);
> +
> +/**
>   * pci_epc_unmap_addr() - unmap CPU address from PCI address
>   * @epc: the EPC device on which address is allocated
>   * @func_no: the endpoint function number in the EPC device
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 243eaa5..c73abc2 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -17,6 +17,7 @@ enum pci_epc_irq_type {
>  	PCI_EPC_IRQ_UNKNOWN,
>  	PCI_EPC_IRQ_LEGACY,
>  	PCI_EPC_IRQ_MSI,
> +	PCI_EPC_IRQ_MSIX,
>  };
>  
>  /**
> @@ -30,6 +31,10 @@ enum pci_epc_irq_type {
>   *	     capability register
>   * @get_msi: ops to get the number of MSI interrupts allocated by the RC from
>   *	     the MSI capability register
> + * @set_msix: ops to set the requested number of MSI-X interrupts in the
> + *	     MSI-X capability register
> + * @get_msix: ops to get the number of MSI-X interrupts allocated by the RC
> + *	     from the MSI-X capability register
>   * @raise_irq: ops to raise a legacy or MSI interrupt
>   * @start: ops to start the PCI link
>   * @stop: ops to stop the PCI link
> @@ -48,8 +53,10 @@ struct pci_epc_ops {
>  			      phys_addr_t addr);
>  	int	(*set_msi)(struct pci_epc *epc, u8 func_no, u8 interrupts);
>  	int	(*get_msi)(struct pci_epc *epc, u8 func_no);
> +	int	(*set_msix)(struct pci_epc *epc, u8 func_no, u16 interrupts);
> +	int	(*get_msix)(struct pci_epc *epc, u8 func_no);
>  	int	(*raise_irq)(struct pci_epc *epc, u8 func_no,
> -			     enum pci_epc_irq_type type, u8 interrupt_num);
> +			     enum pci_epc_irq_type type, u16 interrupt_num);
>  	int	(*start)(struct pci_epc *epc);
>  	void	(*stop)(struct pci_epc *epc);
>  	struct module *owner;
> @@ -144,8 +151,10 @@ void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no,
>  			phys_addr_t phys_addr);
>  int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts);
>  int pci_epc_get_msi(struct pci_epc *epc, u8 func_no);
> +int pci_epc_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts);
> +int pci_epc_get_msix(struct pci_epc *epc, u8 func_no);
>  int pci_epc_raise_irq(struct pci_epc *epc, u8 func_no,
> -		      enum pci_epc_irq_type type, u8 interrupt_num);
> +		      enum pci_epc_irq_type type, u16 interrupt_num);
>  int pci_epc_start(struct pci_epc *epc);
>  void pci_epc_stop(struct pci_epc *epc);
>  struct pci_epc *pci_epc_get(const char *epc_name);
> diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> index f7d6f48..9bb1f31 100644
> --- a/include/linux/pci-epf.h
> +++ b/include/linux/pci-epf.h
> @@ -119,6 +119,7 @@ struct pci_epf {
>  	struct pci_epf_header	*header;
>  	struct pci_epf_bar	bar[6];
>  	u8			msi_interrupts;
> +	u16			msix_interrupts;
>  	u8			func_no;
>  
>  	struct pci_epc		*epc;
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
