Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E24D7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 05:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751642AbeFEFVn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 01:21:43 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:13919 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751518AbeFEFVb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jun 2018 01:21:31 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w555LK9W030482;
        Tue, 5 Jun 2018 00:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1528176081;
        bh=qFYG6eRaHjUZ/C3EXfq02B/IySxbd/pQb8jj1Ua0Oc0=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=r3+QRyfTZu/twGqTXYeqlOnTmF0qJW6wLl/dXaw36XH3+7W8/7tLt/ZKLWMptd73W
         qTZr7rweShnA1Ix/VpsOllg71EDG8umoneRUy7ojN+r9zwwlLBfvwKg58G75Fpo8CY
         kQhJadg4d9CB9caPHba5ttlI4kT3gQFRCdUSp0xg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w555LKcB022040;
        Tue, 5 Jun 2018 00:21:20 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Tue, 5 Jun
 2018 00:21:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Tue, 5 Jun 2018 00:21:20 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w555LGfi006754;
        Tue, 5 Jun 2018 00:21:17 -0500
Subject: Re: [PATCH v2 3/7] PCI: cadence: Update cdns_pcie_ep_raise_irq
 function signature
To:     Alan Douglas <adouglas@cadence.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
 <4994f263efbf6a2cb952d3d9839fb3b1737efde9.1526576613.git.gustavo.pimentel@synopsys.com>
 <aa86d9b7-d715-2a21-6a94-be927e55b51b@ti.com>
 <SN6PR07MB4512F3B395D731FF14EBDB8ED8670@SN6PR07MB4512.namprd07.prod.outlook.com>
CC:     "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <e9de6853-9c55-2dc9-0de0-0faa075714db@ti.com>
Date:   Tue, 5 Jun 2018 10:51:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <SN6PR07MB4512F3B395D731FF14EBDB8ED8670@SN6PR07MB4512.namprd07.prod.outlook.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Monday 04 June 2018 08:38 PM, Alan Douglas wrote:
> On 31 May 2018 11:51, Kishon Vijay Abraham I  wrote:
>> Hi Alan,
>>
>> On Thursday 17 May 2018 10:39 PM, Gustavo Pimentel wrote:
>>> Change cdns_pcie_ep_raise_irq() signature, namely the interrupt_num
>>> variable type from u8 to u16 to accommodate 2048 maximum MSI-X
>>> interrupts.
>>>
>>> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>>> Acked-by: Alan Douglas <adouglas@cadence.com>
>>
>> Do you want to add MSI-X support to cadence PCIe?
>>
> I do want to add MSI-X support, in fact I have done some tests with a
> modified cadence driver with this set, so plan to submit a patch later.
> 

cool, glad to hear!

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
