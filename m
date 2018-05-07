Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DF7A07DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 03:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751891AbeEGDJs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 May 2018 23:09:48 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7231 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751880AbeEGDJr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 6 May 2018 23:09:47 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 134AABB8ED126;
        Mon,  7 May 2018 11:09:34 +0800 (CST)
Received: from [127.0.0.1] (10.63.195.168) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.361.1; Mon, 7 May 2018
 11:09:31 +0800
Subject: Re: [PATCH] VFIO: Fix Documentation
To:     Alex Williamson <alex.williamson@redhat.com>
References: <1524218521-61496-1-git-send-email-zhangshaokun@hisilicon.com>
 <36f5940b-cac5-9a4a-86cb-7ad9766d5d62@huawei.com>
 <20180430123857.006a0697@w520.home>
CC:     <corbet@lwn.net>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   "dongbo (E)" <dongbo4@huawei.com>
Message-ID: <0f6b31a8-1be4-8817-a27c-716aa334efe8@huawei.com>
Date:   Mon, 7 May 2018 11:09:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20180430123857.006a0697@w520.home>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.63.195.168]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Alex.

On 2018/5/1 2:38, Alex Williamson wrote:
> On Fri, 20 Apr 2018 18:07:27 +0800
> "dongbo (E)" <dongbo4@huawei.com> wrote:
> 
>> From: Dong Bo <dongbo4@huawei.com>
>>
>> Signed-off-by: Dong Bo <dongbo4@huawei.com>
>> ---
> 
> Hi Dong Bo,
> 
> The patch is corrupted, please resend and also include a commit log,
> something as simple as "Update vfio_add_group_dev description to match
> the current API" would be fine.  Thanks,
> 
> Alex
> 
Sorry for the corrupted patch. I've resent one and added the commit log
you suggested. Hope it would apply. Thanks.

Best Regards,
Dong Bo

>>  Documentation/vfio.txt | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/vfio.txt b/Documentation/vfio.txt
>> index ef6a511..f1a4d3c 100644
>> --- a/Documentation/vfio.txt
>> +++ b/Documentation/vfio.txt
>> @@ -252,15 +252,14 @@ into VFIO core.  When devices are bound and unbound to the driver,
>>  the driver should call vfio_add_group_dev() and vfio_del_group_dev()
>>  respectively::
>>  -	extern int vfio_add_group_dev(struct iommu_group *iommu_group,
>> -	                              struct device *dev,
>> +	extern int vfio_add_group_dev(struct device *dev,
>>  				      const struct vfio_device_ops *ops,
>>  				      void *device_data);
>>   	extern void *vfio_del_group_dev(struct device *dev);
>>   vfio_add_group_dev() indicates to the core to begin tracking the
>> -specified iommu_group and register the specified dev as owned by
>> +iommu_group of the specified dev and register the dev as owned by
>>  a VFIO bus driver.  The driver provides an ops structure for callbacks
>>  similar to a file operations structure::
>>  -- 1.9.1
>>
>>
>> .
>>
>>
> 
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
