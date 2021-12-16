Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FB2C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 02:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhLPCD0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Dec 2021 21:03:26 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:28321 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhLPCDZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Dec 2021 21:03:25 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JDwPP4BcpzbjQZ;
        Thu, 16 Dec 2021 10:03:05 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 10:03:24 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 10:03:23 +0800
Subject: Re: [PATCH] docs/zh_CN: Add cputopology Chinese translation
To:     Akira Yokosawa <akiyks@gmail.com>
CC:     <alexs@kernel.org>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <seakeel@gmail.com>, <siyanteng01@gmail.com>,
        <siyanteng@loongson.cn>, <tangyeechou@gmail.com>,
        <zhengbin13@huawei.com>
References: <ae8d297b-896c-a6b3-b5f4-6cb48223e814@huawei.com>
 <5a803a84-5e37-83ae-70b6-d913f703dffb@gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <487fb823-dabe-6606-2291-74fed86018d9@huawei.com>
Date:   Thu, 16 Dec 2021 10:03:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <5a803a84-5e37-83ae-70b6-d913f703dffb@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/15 19:46, Akira Yokosawa wrote:
> Hi,
> 
> On Wed, 15 Dec 2021 10:12:34 +0800, Tang Yizhou wrote:
>> On 2021/12/15 10:29, Tang Yizhou wrote:
>>> Translate admin-guide/cputopology.rst into Chinese.
>>>
>>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>>> ---
>>>  .../zh_CN/admin-guide/cputopology.rst         | 94 +++++++++++++++++++
>>>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>>>  2 files changed, 95 insertions(+), 1 deletion(-)
>>>  create mode 100644 Documentation/translations/zh_CN/admin-guide/cputopology.rst
>>>
> [...]
>>> +
>>> +    =========== ==================================================
>>> +    kernel_max: 内核配置允许的最大CPU下标值。[NR_CPUS-1]
>>> +
>>> +    offline:    由于热插拔移除或者超过内核允许的CPU上限（上文描述的kernel_max）导致未上线的CPU。[~cpu_online_mask + cpus >= NR_CPUS]
>>
>> Here is an example of poor Chinese support. If a line break is made here,
>> *make htmldocs* warns 'Malformed table'.
> 
> Just out of curiosity, but I don't think such a line break can
> be flagged as 'Malformed table'.
> 
> Can you share the version of the table "make htmldocs" complained?
> 
> I'm suspecting Sphinx might be confused by the widths of UTF-8
> encoded characters/punctuations.

Well, that's my fault. A linebreak followed by tabs or spaces can be okay.
'Malformed table' warning comes along with inconsistent number of tabs or
spaces.

However, I'm sure the number of '=' can't be handled correctly when UTF-8
chars appear. My Sphinx version is 1.8.2.

I will send the v2 patch soon.

Thanks,
Tang

> 
>         Thanks, Akira
> 
>>
>> Meanwhile, the number of '=' can be inconsistent with the number of Chinese
>> chars and there won't be any warnings. I've already checked the HTML page,
>> the rendering effect is OK.
>>
>> Tang
> 
> .
> 
