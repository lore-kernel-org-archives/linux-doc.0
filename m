Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45A7C48BDF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 07:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AE8B61209
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 07:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhFRHv7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Jun 2021 03:51:59 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3266 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbhFRHv7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 03:51:59 -0400
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G5rMm1F1mz6G9tV;
        Fri, 18 Jun 2021 15:36:36 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 09:49:48 +0200
Received: from [10.47.95.81] (10.47.95.81) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 18 Jun
 2021 08:49:47 +0100
Subject: Re: [PATCH v13 1/6] iommu: Deprecate Intel and AMD cmdline methods to
 enable strict mode
To:     Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>,
        <will@kernel.org>, <dwmw2@infradead.org>,
        <baolu.lu@linux.intel.com>, <corbet@lwn.net>
CC:     <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
        <linuxarm@huawei.com>, <thunder.leizhen@huawei.com>,
        <chenxiang66@hisilicon.com>, <linux-doc@vger.kernel.org>
References: <1623841437-211832-1-git-send-email-john.garry@huawei.com>
 <1623841437-211832-2-git-send-email-john.garry@huawei.com>
 <f95252ce-f834-103b-f96d-7e35fa59d5ec@arm.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <c8ca952e-4070-0a48-0a77-1cdf6985bb19@huawei.com>
Date:   Fri, 18 Jun 2021 08:43:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <f95252ce-f834-103b-f96d-7e35fa59d5ec@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.47.95.81]
X-ClientProxiedBy: lhreml743-chm.china.huawei.com (10.201.108.193) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/06/2021 20:01, Robin Murphy wrote:
>>               DMA.
>> -        strict [Default Off]
>> +        strict [Default Off] [Deprecated, use iommu.strict instead]
>>               With this option on every unmap_single operation will
>>               result in a hardware IOTLB flush operation as opposed
>>               to batching them for performance.
> 
> FWIW I'd be inclined to replace both whole descriptions with just 
> something like "Deprecated, equivalent to iommu.strict=1".
> 
>> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
>> index 46280e6e1535..9f3096d650aa 100644
>> --- a/drivers/iommu/amd/init.c
>> +++ b/drivers/iommu/amd/init.c
>> @@ -3098,8 +3098,10 @@ static int __init parse_amd_iommu_intr(char *str)
>>   static int __init parse_amd_iommu_options(char *str)
>>   {
>>       for (; *str; ++str) {
>> -        if (strncmp(str, "fullflush", 9) == 0)
>> +        if (strncmp(str, "fullflush", 9) == 0) {
>> +            pr_warn("amd_iommu=fullflush deprecated; use iommu.strict 
>> instead\n");
> 
> Nit: maybe we should spell out "...use <option>=1 instead" in all of 
> these messages just in case anyone takes them literally?


> (I'm not sure 
> the options parse correctly with no argument)

I don't think they do.

But I'll take both suggestions on board.

> 
> Either way,
> 
> Acked-by: Robin Murphy <robin.murphy@arm.com>

Cheers!

