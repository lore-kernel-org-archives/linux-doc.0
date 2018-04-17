Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B4B87DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 10:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751345AbeDQKYV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 06:24:21 -0400
Received: from fllnx210.ext.ti.com ([198.47.19.17]:31202 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751211AbeDQKYU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 06:24:20 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3HAOBhn005157;
        Tue, 17 Apr 2018 05:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1523960651;
        bh=XlnTTNQJB+0qwDeI/vS5eaqezx1QHC64x06zFR+Y5nA=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=hh+jwlViGAMzmWV9/R2WpvDqGmtEJzJq6ndiLo15XV8+R+QPvR737JLyQ442g7zzN
         tb6alZ9KG4geyJDbH2LdY173hJF4542re+Ek121zEivDeQMPLuI9XxX+z3GlE4h0hm
         iXDqFhd2D/eOLDgkfu5xJpBEyfg6d/oAqnDvJUqk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3HAOBJB002944;
        Tue, 17 Apr 2018 05:24:11 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Tue, 17
 Apr 2018 05:24:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend Transport;
 Tue, 17 Apr 2018 05:24:10 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3HAO6kI013088;
        Tue, 17 Apr 2018 05:24:07 -0500
Subject: Re: [RFC 03/10] PCI: endpoint: Add MSI-X interfaces
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        <bhelgaas@google.com>, <lorenzo.pieralisi@arm.com>,
        <Joao.Pinto@synopsys.com>, <jingoohan1@gmail.com>,
        <adouglas@cadence.com>, <niklas.cassel@axis.com>,
        <jesper.nilsson@axis.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <c76688ee290a9ed4f0f70f5e350b906950ec05df.1523379766.git.gustavo.pimentel@synopsys.com>
CC:     <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <7fec2005-d7a8-daea-9451-7f3593afe285@ti.com>
Date:   Tue, 17 Apr 2018 15:54:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <c76688ee290a9ed4f0f70f5e350b906950ec05df.1523379766.git.gustavo.pimentel@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Tuesday 10 April 2018 10:44 PM, Gustavo Pimentel wrote:
> Implements the generic method for calling the get/set callbacks.
> 
> Adds the PCI_EPC_IRQ_MSIX type.
> 
> Adds the MSI-X callbacks signatures to the ops structure.
> 
> Adds sysfs interface for altering the number of MSI-X entries.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
>  drivers/pci/endpoint/pci-ep-cfs.c   | 24 ++++++++++++++++
>  drivers/pci/endpoint/pci-epc-core.c | 57 +++++++++++++++++++++++++++++++++++++
>  include/linux/pci-epc.h             | 11 ++++++-
>  include/linux/pci-epf.h             |  1 +
>  4 files changed, 92 insertions(+), 1 deletion(-)
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
> index b0ee427..294a383 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
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
> +	return interrupt++;

return interrupt + 1?
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
> index af657ca..32e8961 100644
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

The 1st patch in the series is already using get_msix, set_msix. This patch
should precede the 1st patch.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
