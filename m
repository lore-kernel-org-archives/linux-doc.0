Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7F7C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 13:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349904AbiBHNQI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349943AbiBHMqq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 07:46:46 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3BBC03FEC0
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 04:46:44 -0800 (PST)
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JtN5y28jHzccjs;
        Tue,  8 Feb 2022 20:45:42 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Feb 2022 20:46:42 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Feb 2022 20:46:41 +0800
Subject: Re: [PATCH v3] docs/zh_CN: Add energy-model Chinese translation
To:     Alex Shi <seakeel@gmail.com>, yanteng si <siyanteng01@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <zhengbin13@huawei.com>,
        Yeechou Tang <tangyeechou@gmail.com>
References: <20220208073600.10860-1-tangyizhou@huawei.com>
 <CAEensMwEUHVaZevehMpr6tAxHzDhEQhihgseCJVpJG3=fQ0+Hw@mail.gmail.com>
 <CAJy-AmnF-3ou-mNiHESyH3FLU42ejwzCNFNA7_NgzgmQKPg1cg@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <9c64e3ef-3eb5-4446-e9d1-dda896febed8@huawei.com>
Date:   Tue, 8 Feb 2022 20:46:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAJy-AmnF-3ou-mNiHESyH3FLU42ejwzCNFNA7_NgzgmQKPg1cg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/2/8 20:38, Alex Shi wrote:
> On Tue, Feb 8, 2022 at 5:45 PM yanteng si <siyanteng01@gmail.com> wrote:
>>
>> Tang Yizhou <tangyizhou@huawei.com> 于2022年2月8日周二 15:03写道：
>>>
>>> Translate power/energy-model.rst into Chinese.
>>>
>>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>> v3:
>>> Don't include English kernel doc.
>>>
>>> v2:
>>> Translate the comments in the example program.
>>>
>>>  .../translations/zh_CN/power/energy-model.rst | 190 ++++++++++++++++++
>>>  .../translations/zh_CN/power/index.rst        |   2 +-
>>>  2 files changed, 191 insertions(+), 1 deletion(-)
>>>  create mode 100644 Documentation/translations/zh_CN/power/energy-model.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/power/energy-model.rst b/Documentation/translations/zh_CN/power/energy-model.rst
>>> new file mode 100644
>>> index 000000000000..bcf29d624860
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/power/energy-model.rst

>>> +
>>> +最后一个参数“milliwatts”（毫瓦）设置成正确的值是很重要的，使用EM的内核
>>> +子系统可能会依赖这个标志来检查所有的EM设备是否使用相同的刻度。如果有不同的
>>> +刻度，这些子系统可能决定：返回警告/错误，停止工作或恐慌（panic）。
>
 
> panic 是不是翻译成 ’崩溃‘ 更好？

OK

> 
>>> +
>>> +关于实现这个回调函数的驱动程序的例子，参见第3节。或者在第2.4节阅读这个API
>>> +的更多文档。
>>> +
>>> +
>>> +“简单”EM的注册
>>> +~~~~~~~~~~~~~~~~
>>> +
>>> +“简单”EM是用框架的辅助函数cpufreq_register_em_with_opp()注册的。它实现了
>>> +一个和以下数学公式紧密相关的功率模型::
>>> +
>>> +       Power = C * V^2 * f
>>> +
>>> +使用这种方法注册的EM可能无法正确反映真实设备的物理特性，例如当静态功率
>>> +（泄漏）很重要时。
 
> leakage 是指晶体管的 ‘漏电流' 。

Haha, you major in physics and are much familiar with this word :) Thanks. 

> 
> Thanks
> Alex
> 

