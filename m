Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4170D7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 11:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754845AbeEaL2A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 07:28:00 -0400
Received: from fllnx210.ext.ti.com ([198.47.19.17]:47570 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754779AbeEaL14 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 07:27:56 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VBRinw015071;
        Thu, 31 May 2018 06:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1527766064;
        bh=C7I5ScaaivpEOpdaScrsSI6L9GblkGR6V4p96C2epSc=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=nDJwU9qCDh6VLi2n+6s0GEi7KWwU9w8GTk+KPrh94raJ+L5O/MRXaqX0QYT6mcOMT
         TqHbwoDHoCNRnB3JwY1UYlF8XS9ULP9QQTqcljUeyj2BCW6V89i7o8iQ1ijNvdOkAh
         AUM6Wok7k6M5h3S+Jtcwh+t7G9CnKJTm/M0ZVCzQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VBRiFZ000739;
        Thu, 31 May 2018 06:27:44 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Thu, 31
 May 2018 06:27:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Thu, 31 May 2018 06:27:44 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VBReiR016659;
        Thu, 31 May 2018 06:27:41 -0500
Subject: Re: [PATCH v2 6/7] misc: pci_endpoint_test: Add MSI-X support
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        <bhelgaas@google.com>, <lorenzo.pieralisi@arm.com>,
        <Joao.Pinto@synopsys.com>, <jingoohan1@gmail.com>,
        <adouglas@cadence.com>, <jesper.nilsson@axis.com>
References: <cover.1526576613.git.gustavo.pimentel@synopsys.com>
 <30034b904a27c405b894a34922e59315dcae68ab.1526576613.git.gustavo.pimentel@synopsys.com>
CC:     <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <2f56cd19-f7a5-c99f-e74f-83a4dbeb0248@ti.com>
Date:   Thu, 31 May 2018 16:57:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <30034b904a27c405b894a34922e59315dcae68ab.1526576613.git.gustavo.pimentel@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thursday 17 May 2018 10:39 PM, Gustavo Pimentel wrote:
> Add MSI-X support and update driver documentation accordingly.
> 
> Add new driver parameter to allow interruption type selection.
> 
> Add 2 new IOCTL commands:
>  - Allow to reconfigure driver IRQ type in runtime.
>  - Allow to retrieve current driver IRQ type configured.
> 
> Change Legacy/MSI/MSI-X test process, by having in a BAR:
>  - Interrupt type triggered (added).
>  - Interrupt ID number (moved from the command section).
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

It's better to change the subject to pci-epf-test/pci_endpoint_test: Add MSI-X
support

IMO this patch should be split into multiple patches

*) Cleanup PCI_ENDPOINT_TEST memspace (by moving the interrupt number away from
command section)
*) Using irq_type module param
*) Adding MSI-X support
*) adding 2 ioctl commands (I'm not convinced on adding new ioctls though)

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
