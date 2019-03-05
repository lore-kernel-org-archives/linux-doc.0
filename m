Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E01757D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 07:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfCEHFU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 02:05:20 -0500
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:46238 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbfCEHFU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 02:05:20 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07488;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0TM.o9Vf_1551769513;
Received: from Alexs-MacBook-Pro.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TM.o9Vf_1551769513)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 05 Mar 2019 15:05:14 +0800
Subject: Re: [PATCH 01/20] docs/zh_CN: add disclaimer file
To:     Li Yang <leoyang.li@nxp.com>
Cc:     wezhang@outlook.com, Zhang Wei-r63237 <wei.zhang@freescale.com>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Li Zefan <lizefan@huawei.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "harryxiyou@gmail.com" <harryxiyou@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190304035744.155203-1-alex.shi@linux.alibaba.com>
 <20190304035744.155203-2-alex.shi@linux.alibaba.com>
 <b2cb92de-ef4a-d628-0dd3-76d8d1b953d0@linux.alibaba.com>
 <CADRPPNSjf4P14bwUMsa10XzBUVLszx4iMsL6gk-XQ0x3vTFr+g@mail.gmail.com>
 <e342a3fa-20f6-46cd-4240-8403fa1aa736@linux.alibaba.com>
 <AM6PR04MB586370DDB6E73A43673339568F710@AM6PR04MB5863.eurprd04.prod.outlook.com>
 <CADRPPNTxDDquY=OT4MV6cQ8OHhAdbazMjngDhtRBCE9_UESg_w@mail.gmail.com>
 <c9ec2af6-82e2-4ac2-050f-d36622a25c55@linux.alibaba.com>
 <CADRPPNQijagCppwVTQ5PNz-wfRHQLZF1a3taj2Ckk-Xn6iVDKg@mail.gmail.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <5af0ce16-40f0-949f-3f2f-536f98875c64@linux.alibaba.com>
Date:   Tue, 5 Mar 2019 15:05:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNQijagCppwVTQ5PNz-wfRHQLZF1a3taj2Ckk-Xn6iVDKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2019/3/5 11:55 上午, Li Yang wrote:
> On Mon, Mar 4, 2019 at 8:51 PM Alex Shi <alex.shi@linux.alibaba.com> wrote:
>>
>>
>> On 2019/3/5 7:31 上午, Li Yang wrote:
>>> Zhang Wei <wezhang@outlook.com>
>> The only usage of 'Zhang wei' in kernel is freescale's driver maintainer. I am not sure the outlook.com address is better than Zhang Wei's freescale email address. So I'd rather leave this one to Zhang Wei himself.
> He is no longer with Freescale/NXP now, the Freescale address wouldn't
> work now.  So I think the outlook address would be better.

Thanks for reminder. I will change the freescale's address to new one in Chinese docs.
but as to MAINTAINERS: freescale driver, I guess it's better to let him change that if he still work on the driver.


Thanks
Alex

>
>> Thanks
>> Alex
>>
>> FREESCALE DMA DRIVER
>> M:      Li Yang <leoyang.li@nxp.com>
>> M:      Zhang Wei <zw@zh-kernel.org>
>> L:      linuxppc-dev@lists.ozlabs.org
>> S:      Maintained)

