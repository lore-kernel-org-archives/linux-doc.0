Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF7AC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 27 Dec 2021 01:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbhL0Ba6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Dec 2021 20:30:58 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:29289 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbhL0Ba6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Dec 2021 20:30:58 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JMg8j3DR5zbjdN;
        Mon, 27 Dec 2021 09:30:29 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 09:30:56 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 09:30:55 +0800
Subject: Re: [PATCH 1/2] docs/zh_CN: Add power/index Chinese translation
To:     Alex Shi <seakeel@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <zhengbin13@huawei.com>,
        Yeechou Tang <tangyeechou@gmail.com>
References: <20211226082923.3261-1-tangyizhou@huawei.com>
 <20211226082923.3261-2-tangyizhou@huawei.com>
 <CAJy-Amkd7YJszrgxmxXCYjHNR1ngwk+irHJvfDUnJXZ5fc_wfw@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <1bedacab-eeba-8fef-6fae-017653ea6c54@huawei.com>
Date:   Mon, 27 Dec 2021 09:30:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAJy-Amkd7YJszrgxmxXCYjHNR1ngwk+irHJvfDUnJXZ5fc_wfw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/26 16:30, Alex Shi wrote:
> On Sun, Dec 26, 2021 at 4:01 PM Tang Yizhou <tangyizhou@huawei.com> wrote:
>>
>> Translate power/index.rst into Chinese.
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> ---
>>  Documentation/translations/zh_CN/index.rst    |  4 +-
>>  .../translations/zh_CN/power/index.rst        | 55 +++++++++++++++++++
>>  2 files changed, 57 insertions(+), 2 deletions(-)
>>  create mode 100644 Documentation/translations/zh_CN/power/index.rst
>>
>> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
>> index 46e14ec9963d..7658e2fa6f98 100644
>> --- a/Documentation/translations/zh_CN/index.rst
>> +++ b/Documentation/translations/zh_CN/index.rst
>> @@ -104,13 +104,14 @@ TODOList:
>>     :maxdepth: 2
>>
>>     core-api/index
>> +   accounting/index
> 
> What's this?

It's https://www.kernel.org/doc/html/latest/accounting/index.html.

The Chinese version is not in the same order as the English version
and I move it to where it should be.

> 
> Thanks
> Alex
> 
>>     cpu-freq/index
>>     iio/index
>>     sound/index
>>     filesystems/index
>>     virt/index
>>     infiniband/index
>> -   accounting/index
>> +   power/index
>>     scheduler/index
>>
>>  TODOList:
>> @@ -129,7 +130,6 @@ TODOList:
>>  * netlabel/index
>>  * networking/index
>>  * pcmcia/index
>> -* power/index
>>  * target/index
>>  * timers/index
>>  * spi/index
>> diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documentation/translations/zh_CN/power/index.rst
>> new file mode 100644
>> index 000000000000..fd379adfda8e
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/power/index.rst
>> @@ -0,0 +1,55 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/power/index.rst
>> +
>> +:翻译:
>> +
>> +  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>> +
>> +========
>> +电源管理
>> +========
>> +
>> +.. toctree::
>> +    :maxdepth: 1
>> +
>> +TODOList:
>> +
>> +    * apm-acpi
>> +    * basic-pm-debugging
>> +    * charger-manager
>> +    * drivers-testing
>> +    * energy-model
>> +    * freezing-of-tasks
>> +    * opp
>> +    * pci
>> +    * pm_qos_interface
>> +    * power_supply_class
>> +    * runtime_pm
>> +    * s2ram
>> +    * suspend-and-cpuhotplug
>> +    * suspend-and-interrupts
>> +    * swsusp-and-swap-files
>> +    * swsusp-dmcrypt
>> +    * swsusp
>> +    * video
>> +    * tricks
>> +
>> +    * userland-swsusp
>> +
>> +    * powercap/powercap
>> +    * powercap/dtpm
>> +
>> +    * regulator/consumer
>> +    * regulator/design
>> +    * regulator/machine
>> +    * regulator/overview
>> +    * regulator/regulator
>> +
>> +.. only::  subproject and html
>> +
>> +   Indices
>> +   =======
>> +
>> +   * :ref:`genindex`
>> --
>> 2.17.1
>>
> .
> 
