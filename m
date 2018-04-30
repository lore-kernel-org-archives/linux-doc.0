Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E6DE7E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Apr 2018 16:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754579AbeD3Qbj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Apr 2018 12:31:39 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:52232 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753334AbeD3Qbi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Apr 2018 12:31:38 -0400
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 883911E0179;
        Mon, 30 Apr 2018 18:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1525105896; bh=sJtnxZiQciv/8JZlyCl45ykKO/Qk2EkS+LPYg1ZdCCk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=h/3PvYR1u7xupfBGzA0ntdhgfSTjQyxwtVbQc/4KZacfv/yoV1B5+O9zjQifq5HdZ
         k2U1vyFOgQMtnynO8NB7imB9x6FCZ7jQu6KtVaAccdVJ0RoCJvaU8v33jydzVwUxd7
         zGXBF9wLyF78FWgepCmngFd89BhgnnY4uyy803FUfDwg9+AbG3T/ERJY1LmRBUvTh1
         3hXCg6A4ox1WlVFoNjbnEALal9E4qIki35bY5a5FPzU5npsxmbrdPJNmV/Wg7RXYEd
         pKLixSreInhudr1hIzJrSGyp8IyWSSZmsdYHM8tf3I0PKRZZxSfEomYttgjeGKw5vK
         AAUrKv75cb1lg==
Received: from pt02.synopsys.com (pt02.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 7352E3619;
        Mon, 30 Apr 2018 09:31:35 -0700 (PDT)
Received: from [127.0.0.1] (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id C4B803D146;
        Mon, 30 Apr 2018 17:31:34 +0100 (WEST)
Subject: Re: [PATCH 06/10] misc: pci_endpoint_test: Add MSI-X support
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
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
 <633ea6faef782de5ea753bffe5028aceff09115a.1524845816.git.gustavo.pimentel@synopsys.com>
 <SN6PR07MB45124A237879C78453495C50D8820@SN6PR07MB4512.namprd07.prod.outlook.com>
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Message-ID: <3485fade-56fd-0078-a330-41187445c984@synopsys.com>
Date:   Mon, 30 Apr 2018 17:30:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <SN6PR07MB45124A237879C78453495C50D8820@SN6PR07MB4512.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On 30/04/2018 16:35, Alan Douglas wrote:
> Hi Gustavo,
> 
> On April 27, 2018, 4:57 p.m. Gustavo Pimentel wrote:
>> Add MSI-X support and update driver documentation accordingly.
>>
>> Add new driver parameter to allow interruption type selection.
>>
>> Modify the Legacy/MSI/MSI-X test process, by:
>>  - Add and use a specific register located in a BAR, which defines the interrupt
>> type is been triggered.
>>  - Move the interrupt ID number from the command section to a register
>> located in a BAR.
>>
>> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>> ---
>>  Documentation/misc-devices/pci-endpoint-test.txt |   3 +
>>  drivers/misc/pci_endpoint_test.c                 | 121 +++++++++++++++--------
>>  drivers/pci/endpoint/functions/pci-epf-test.c    |  78 +++++++++++----
>>  3 files changed, 143 insertions(+), 59 deletions(-)
>>
> In testing these changes  I found that pci_epc_raise_irq() also needs to be
> updated in pci-epc-core.c, since it has interrupt_num parameter as u8

Yes, indeed. I updated it together with the pci-epc.h file.
Thanks Alan, well spotted!

Regards,
Gustavo

> 
> Thanks,
> Alan
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
