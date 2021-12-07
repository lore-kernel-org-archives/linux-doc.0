Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B06C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 03:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbhLGD1m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 22:27:42 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:29095 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbhLGD1l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 22:27:41 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J7QYs65YVz1DK10;
        Tue,  7 Dec 2021 11:21:21 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 11:24:10 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 11:24:08 +0800
Subject: Re: [PATCH -next v2] doc/zh-CN: Update cpu-freq/core.rst to make it
 more readable
To:     <siyanteng@loongson.cn>, <alexs@kernel.org>, <seakeel@gmail.com>,
        "yanteng si" <siyanteng01@gmail.com>, <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <zhengbin13@huawei.com>,
        <tangyeechou@gmail.com>
References: <20211202130240.27942-1-tangyizhou@huawei.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <0ec7c579-1495-d102-ff5f-07ba089ca47e@huawei.com>
Date:   Tue, 7 Dec 2021 11:24:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20211202130240.27942-1-tangyizhou@huawei.com>
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

On 2021/12/2 21:02, Tang Yizhou wrote:
> These Chinese translations are easier to understand.
> 
> Also update the first memeber of struct cpufreq_freqs.
> 
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> Acked-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
> v2:
> 1. Take Yangteng's advice.
> 2. Add proofreader.
> 3. Add Acked-by and Reviewed-by tag.
> 
>  .../translations/zh_CN/cpu-freq/core.rst      | 24 ++++++++++---------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst b/Documentation/translations/zh_CN/cpu-freq/core.rst
> index 0c6fd447ced6..b3c095306ffe 100644
> --- a/Documentation/translations/zh_CN/cpu-freq/core.rst
> +++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
> @@ -7,7 +7,9 @@
>  
>   司延腾 Yanteng Si <siyanteng@loongson.cn>
>  
> -.. _cn_core.rst:
> +:校译:
> +
> + 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>  
>  ====================================
>  CPUFreq核心和CPUFreq通知器的通用说明
> @@ -29,10 +31,10 @@ CPUFreq核心和CPUFreq通知器的通用说明
>  ======================
>  
>  cpufreq核心代码位于drivers/cpufreq/cpufreq.c中。这些cpufreq代码为CPUFreq架构的驱
> -动程序（那些操作硬件切换频率的代码）以及 "通知器 "提供了一个标准化的接口。
> -这些是设备驱动程序或需要了解策略变化的其它内核部分（如 ACPI 热量管理）或所有频率更改（除
> -计时代码外），甚至需要强制确定速度限制的通知器（如 ARM 架构上的 LCD 驱动程序）。
> -此外， 内核 "常数" loops_per_jiffy会根据频率变化而更新。
> +动程序（那些执行硬件频率切换的代码）以及 "通知器" 提供了一个标准化的接口。
> +包括设备驱动程序；需要了解策略变化（如 ACPI 热量管理），或所有频率变化（如计时代码），
> +甚至需要强制限制为指定频率（如 ARM 架构上的 LCD 驱动程序）的其它内核组件。
> +此外，内核 "常数" loops_per_jiffy 会根据频率变化而更新。
>  
>  cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，以确保 cpufreq 驱
>  动程序被正确地注册到核心中，并且驱动程序在 cpufreq_put_cpu 被调用之前不会被卸载。这也保证
> @@ -41,7 +43,7 @@ cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，
>  2. CPUFreq 通知器
>  ====================
>  
> -CPUFreq通知器符合标准的内核通知器接口。
> +CPUFreq通知器遵循标准的内核通知器接口。
>  关于通知器的细节请参阅 linux/include/linux/notifier.h。
>  
>  这里有两个不同的CPUfreq通知器 - 策略通知器和转换通知器。
> @@ -69,20 +71,20 @@ CPUFreq通知器符合标准的内核通知器接口。
>  
>  第三个参数是一个包含如下值的结构体cpufreq_freqs：
>  
> -=====	====================
> -cpu	受影响cpu的编号
> +======	===============================
> +policy	指向struct cpufreq_policy的指针
>  old	旧频率
>  new	新频率
>  flags	cpufreq驱动的标志
> -=====	====================
> +======	===============================
>  
>  3. 含有Operating Performance Point (OPP)的CPUFreq表的生成
>  ==================================================================
>  关于OPP的细节请参阅 Documentation/power/opp.rst
>  
>  dev_pm_opp_init_cpufreq_table -
> -	这个功能提供了一个随时可用的转换程序，用来将OPP层关于可用频率的内部信息翻译成一种容易提供给
> -	cpufreq的格式。
> +	这个函数提供了一个随时可用的转换例程，用来将OPP层关于可用频率的内部信息翻译成一种
> +	cpufreq易于处理的格式。
>  
>  	.. Warning::
>  
> 

Hi, jon! Could you please apply this patch? Thanks.

Tang
