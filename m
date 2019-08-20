Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 696647D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Aug 2019 14:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfHTOJd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Aug 2019 10:09:33 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4736 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729155AbfHTOJc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Aug 2019 10:09:32 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 8ED62CBA83DCFAA8EE97;
        Tue, 20 Aug 2019 22:09:29 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Tue, 20 Aug 2019
 22:09:23 +0800
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
 <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
 <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
 <ab2d3c29-982f-cb13-e2a2-e6d8da8f1438@huawei.com>
 <b2a475eb-58e6-e7c7-7b8f-b1be04cf27c0@ti.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at" <richard@nod.at>,
        wanghuiqiang <wanghuiqiang@huawei.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <c5e063e8-5025-8206-f819-6ce5228ef0fb@huawei.com>
Date:   Tue, 20 Aug 2019 15:09:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <b2a475eb-58e6-e7c7-7b8f-b1be04cf27c0@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.238]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/08/2019 05:39, Vignesh Raghavendra wrote:
> Hi,
>
> On 16/08/19 3:50 PM, John Garry wrote:
>> On 06/08/2019 17:40, Schrempf Frieder wrote:
> [...]
>>
>> Hi,
>>
>> Could someone kindly advise on the following:
>>

Hi Vignesh,

>> I am looking at ACPI support only for an mtd spi nor driver we're
>> targeting for mainline support.
>>
>
> If its a new driver, please add it under drivers/spi implementing SPI
> MEM framework.
> There are few drivers under drivers/spi that can be used as example.
> (Search for "spi_mem_ops"

Ok, fine. I note that in doing this I would still be using the spi nor 
framework indirectly through the m25p80 driver.

>> So for the host, I could use a proprietary HID in the DSDT for matching
>> in the kernel driver.
>>
>> About the child spi flash devices, is the recommendation to just use
>> PRP0001 HID and "jedec,spi-nor" compatible?
>>
>
> I am not quite familiar with ACPI systems, but child flash device should
> use "jedec,spi-nor" as compatible.

Right, so to use SPI MEM framework, it looks like I will have to use 
PRP0001 and "jedec,spi-nor" as compatible.

My reluctance in using PRP0001 and compatible "jedec,spi-nor" is how 
other OS can understand this.

All the best,
John

>
> Regards
> Vignesh
>
>> thanks,
>> John
>>
>>

