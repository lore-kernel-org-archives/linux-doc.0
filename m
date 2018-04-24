Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF6067DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 07:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754742AbeDXHIN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 03:08:13 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:56171 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751678AbeDXHIM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 03:08:12 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3O783Uu003131;
        Tue, 24 Apr 2018 02:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524553683;
        bh=g5bUV4Paq9OPKmNiU3F4J9M//7JEOABEoAdanmUs50E=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=kzoo2apidR8fsSzKFdehbfEy2EHbNbYj8NqPtoB34+Nnn+HK88lldASthhXGSZ6XX
         vkRptldoOKF6I0A0RGj626Eh6SPy0pbcLW/UJU2ewDkSbyRPFy/PdI2yUDmdwTuFhy
         9pVjcNnfWkrovZlBON4E/cj+d4kr+8bIE4lrYnv8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3O782Yw022905;
        Tue, 24 Apr 2018 02:08:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Tue, 24
 Apr 2018 02:08:02 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Tue, 24 Apr 2018 02:08:02 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3O77wYe023329;
        Tue, 24 Apr 2018 02:07:59 -0500
Subject: Re: [RFC 01/10] PCI: dwc: Add MSI-X callbacks handler
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "adouglas@cadence.com" <adouglas@cadence.com>,
        "niklas.cassel@axis.com" <niklas.cassel@axis.com>,
        "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <77b7b2687e9618d3f7d1f11c3fc6ecec9a9442ef.1523379766.git.gustavo.pimentel@synopsys.com>
 <0b7023d9-29c6-0993-07d3-b046d25b67ff@ti.com>
 <e2fe7d5f-9f57-0e67-d321-541ff4706792@synopsys.com>
CC:     "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <0e8b8ce9-db12-1e11-3eb5-62f3fa686d59@ti.com>
Date:   Tue, 24 Apr 2018 12:37:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e2fe7d5f-9f57-0e67-d321-541ff4706792@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Monday 23 April 2018 03:06 PM, Gustavo Pimentel wrote:
> Hi Kishon,
> 
> On 16/04/2018 10:29, Kishon Vijay Abraham I wrote:
>> Hi Gustavo,
>>
>> On Tuesday 10 April 2018 10:44 PM, Gustavo Pimentel wrote:
>>> Changes the pcie_raise_irq function signature, namely the interrupt_num
>>> variable type from u8 to u16 to accommodate the MSI-X maximum interrupts
>>> of 2048.
>>>
>>> Implements a PCIe config space capability iterator function to search and
>>> save the MSI and MSI-X pointers. With this method the code becomes more
>>> generic and flexible.
>>>
>>> Implements MSI-X set/get functions for sysfs interface in order to change
>>> the EP entries number.
>>>
>>> Implements EP MSI-X interface for triggering interruptions.
>>>
>>> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>>> ---
>>>  drivers/pci/dwc/pci-dra7xx.c           |   2 +-
>>>  drivers/pci/dwc/pcie-artpec6.c         |   2 +-
>>>  drivers/pci/dwc/pcie-designware-ep.c   | 145 ++++++++++++++++++++++++++++++++-
>>>  drivers/pci/dwc/pcie-designware-plat.c |   6 +-
>>>  drivers/pci/dwc/pcie-designware.h      |  23 +++++-
>>>  5 files changed, 173 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c
>>> index ed8558d..5265725 100644
>>> --- a/drivers/pci/dwc/pci-dra7xx.c
>>> +++ b/drivers/pci/dwc/pci-dra7xx.c
>>> @@ -369,7 +369,7 @@ static void dra7xx_pcie_raise_msi_irq(struct dra7xx_pcie *dra7xx,
>>>  }
>>>  
>>>  static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>>> -				 enum pci_epc_irq_type type, u8 interrupt_num)
>>> +				 enum pci_epc_irq_type type, u16 interrupt_num)
>>>  {
>>>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>>>  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
>>> diff --git a/drivers/pci/dwc/pcie-artpec6.c b/drivers/pci/dwc/pcie-artpec6.c
>>> index e66cede..96dc259 100644
>>> --- a/drivers/pci/dwc/pcie-artpec6.c
>>> +++ b/drivers/pci/dwc/pcie-artpec6.c
>>> @@ -428,7 +428,7 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
>>>  }
>>>  
>>>  static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>>> -				  enum pci_epc_irq_type type, u8 interrupt_num)
>>> +				  enum pci_epc_irq_type type, u16 interrupt_num)
>>>  {
>>>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>>>  
>>> diff --git a/drivers/pci/dwc/pcie-designware-ep.c b/drivers/pci/dwc/pcie-designware-ep.c
>>> index 15b22a6..874d4c2 100644
>>> --- a/drivers/pci/dwc/pcie-designware-ep.c
>>> +++ b/drivers/pci/dwc/pcie-designware-ep.c
>>> @@ -40,6 +40,44 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>>>  	__dw_pcie_ep_reset_bar(pci, bar, 0);
>>>  }
>>>  
>>> +void dw_pcie_ep_find_cap_addr(struct dw_pcie_ep *ep)
>>> +{
>>
>> This should be implemented in a generic way similar to pci_find_capability().
>> It'll be useful when we try to implement other capabilities as well.
> 
> Hum, what you suggest? Something implemented on the pci-epf-core?

yeah, Initially thought it could be implemented as a helper function in
pci-epc-core so that both designware and cadence can use it.

But do we really have to find the address like this? since all designware IP's
will have a particular capability at a fixed address offset, why not follow use
existing mechanism in dw_pcie_ep_get_msi?

Or is it possible for a particular capability to have address offsets for
different vendors? How is it for cadence?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
