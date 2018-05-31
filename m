Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D1DF7D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754532AbeEaKvQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:51:16 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:16243 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754346AbeEaKvP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 06:51:15 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VAp6M3026261;
        Thu, 31 May 2018 05:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1527763866;
        bh=SxVBorSZqsYwUcvAq4Rt7FvBp+ArlTmS8EEy3KVynKg=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=qEGGjn7k9f1xnKvrjRSXBJe6luR58vHtI4UqFuaDyT21TOJmA0J/hMm+vz0JcwP4R
         HFHhFQe0I8Wkddef/xOeEuaPLlP4LYDu09pmubuFmofjNWJV8It+a+LE7WEDFHqEoU
         urWwwCsEdjgRPj3+uHFEW823nsWhPjcZTDspRD3s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAp670015500;
        Thu, 31 May 2018 05:51:06 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Thu, 31
 May 2018 05:51:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Thu, 31 May 2018 05:51:06 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VAp2at011065;
        Thu, 31 May 2018 05:51:02 -0500
Subject: Re: [PATCH v2 3/7] PCI: cadence: Update cdns_pcie_ep_raise_irq
 function signature
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        <bhelgaas@google.com>, <lorenzo.pieralisi@arm.com>,
        <Joao.Pinto@synopsys.com>, <jingoohan1@gmail.com>,
        <adouglas@cadence.com>, <jesper.nilsson@axis.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
 <4994f263efbf6a2cb952d3d9839fb3b1737efde9.1526576613.git.gustavo.pimentel@synopsys.com>
CC:     <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <aa86d9b7-d715-2a21-6a94-be927e55b51b@ti.com>
Date:   Thu, 31 May 2018 16:21:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <4994f263efbf6a2cb952d3d9839fb3b1737efde9.1526576613.git.gustavo.pimentel@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On Thursday 17 May 2018 10:39 PM, Gustavo Pimentel wrote:
> Change cdns_pcie_ep_raise_irq() signature, namely the interrupt_num
> variable type from u8 to u16 to accommodate 2048 maximum MSI-X
> interrupts.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Acked-by: Alan Douglas <adouglas@cadence.com>

Do you want to add MSI-X support to cadence PCIe?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
