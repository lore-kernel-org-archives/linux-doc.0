Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA6C07E279
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 08:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750772AbeDXI4g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 04:56:36 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:48473 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750770AbeDXI4d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 04:56:33 -0400
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Apr 2018 04:56:32 EDT
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 8AA3B1E0451;
        Tue, 24 Apr 2018 10:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524559856; bh=x6QIz2HfQQ1MEDDuNFHVHFtNEHvYurhHtuWTOuXDUnM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HqnM35q9Zy35ReViCYJRPEb149vGGIwOJsxlqwAKHtBauYZQaf2wF/ysybzBs/9jD
         7Cd9qiDbLMpwBljfA7TpMWS4gy2hWbr0vU0xKz+Evz0lR1rE2gVIWMrLqtPFgYBp/T
         nozrDJ0to7sl9JSCQhmXddCXX6+6zsCdc8T0fnN9VcSbsWJN+ANGdUFwyF1qbvJihT
         1lrcTuhGi3E0BjuBJmjy97byyt/IQ+hiYC130DPo7+UvcgqYTAEGJGnsZWJEyDGT3/
         Pgis5p9MHfIdknXnd6cqIEIP3NSZq5Bdp7Xgc/RUptVKOiF3apiYB653z0YRgqay8v
         EUMlFON19zgHQ==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 34B2937F6;
        Tue, 24 Apr 2018 01:50:55 -0700 (PDT)
Received: from [127.0.0.1] (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 8906A3E1F7;
        Tue, 24 Apr 2018 09:50:54 +0100 (WEST)
Subject: Re: [RFC 00/10] Adds pcitest tool support for MSI-X
To:     Alan Douglas <adouglas@cadence.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>
Cc:     "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <SN6PR07MB45123840F0C9487F1CD119A9D8880@SN6PR07MB4512.namprd07.prod.outlook.com>
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Message-ID: <767b50e3-8890-c241-bc97-1687bd0661c1@synopsys.com>
Date:   Tue, 24 Apr 2018 09:49:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <SN6PR07MB45123840F0C9487F1CD119A9D8880@SN6PR07MB4512.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On 24/04/2018 07:48, Alan Douglas wrote:
> Hi Gustavo,
> 
> On 10 April 2018 18:15 Gustavo Pimentel wrote:
>> This patch set depends the following series:
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.org_lkml_2018_4_10_421&d=DwIFAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=bkWxpLoW-f-E3EdiDCCa0_h0PicsViasSlvIpzZvPxs&m=R3h7a4AkN9--FFv6jtHaknKIzx6NieDdkYxyCe4obB8&s=J2A11L2_WwzMdaBheYSTwfjPDA7sx3_DyoGPAYsJ9A4&e=> This series aims to add pcitest tool support for MSI-X.
>>
>> Includes new callbacks methods and handlers to trigger the MSI-X
>> interruptions on the EP Designware IP driver.
>>
>> Provides new methods on pci_epf_test driver that allows to set/get EP
>> maximum number of MSI-X entries (similar to set/get MSI methods).
>>
>> Reworks on MSI set/get and triggering methods on EP Designware IP driver to
>> be more generic and flexible.
>>
>> Adds a new input parameter (msix) and replicates the whole MSI mechanism
>> applied to the MSI-X feature on pcitest tool. Also updates the pcitest script
>> with the new test set applied to this new feature.
>>
>> Gustavo Pimentel (10):
>>   PCI: dwc: Add MSI-X callbacks handler
>>   PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
>>   PCI: endpoint: Add MSI-X interfaces
>>   PCI: dwc: MSI callbacks handler rework
>>   PCI: dwc: Add legacy interrupt callback handler
>>   misc: pci_endpoint_test: Add MSI-X support
>>   misc: pci_endpoint_test: Replace lower into upper case characters
>>   PCI: endpoint: functions/pci-epf-test: Add MSI-X support
>>   PCI: endpoint: functions/pci-epf-test: Replace lower into upper case
>>     characters
>>   tools: PCI: Add MSI-X support
>>
>>  Documentation/misc-devices/pci-endpoint-test.txt |   3 +
>>  drivers/misc/pci_endpoint_test.c                 | 120 ++++++++++----
>>  drivers/pci/cadence/pcie-cadence-ep.c            |   2 +-
>>  drivers/pci/dwc/pci-dra7xx.c                     |   2 +-
>>  drivers/pci/dwc/pcie-artpec6.c                   |   2 +-
>>  drivers/pci/dwc/pcie-designware-ep.c             | 201
>> +++++++++++++++++++++--
>>  drivers/pci/dwc/pcie-designware-plat.c           |   9 +-
>>  drivers/pci/dwc/pcie-designware.h                |  40 +++--
>>  drivers/pci/endpoint/functions/pci-epf-test.c    | 113 +++++++++----
>>  drivers/pci/endpoint/pci-ep-cfs.c                |  24 +++
>>  drivers/pci/endpoint/pci-epc-core.c              |  60 ++++++-
>>  include/linux/pci-epc.h                          |  11 +-
>>  include/linux/pci-epf.h                          |   1 +
>>  include/uapi/linux/pcitest.h                     |   1 +
>>  tools/pci/pcitest.c                              |  18 +-
>>  tools/pci/pcitest.sh                             |  25 +++
>>  16 files changed, 528 insertions(+), 104 deletions(-)
>>
>> --
>> 2.7.4
>>
> Nice set of patches.  I have tested this with the Cadence EP driver after adding MSI-X support, and found a few changes required.
> I will send you comments.

Ok, great news!

Maybe after this patch series submission we could start a new thread about new
features that could be tested/verified using pcitest. I think this could be
helpful for everybody.

> 
> Thanks,
> Alan
> 

Thanks,
Gustavo

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
