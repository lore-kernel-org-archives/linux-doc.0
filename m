Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E304C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 06:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237685AbhLFGWM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 01:22:12 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:28274 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236571AbhLFGWM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 01:22:12 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J6tXl2Rx7zbjMM;
        Mon,  6 Dec 2021 14:18:31 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 14:18:23 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 14:18:23 +0800
Subject: Re: [PATCH] doc/zh-CN: Update cpufreq-stats.rst to make it more
 readable
To:     <siyanteng@loongson.cn>, <alexs@kernel.org>, <seakeel@gmail.com>,
        "yanteng si" <siyanteng01@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>
References: <20211202142312.20052-1-tangyizhou@huawei.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <a6b4c46e-7436-0fd5-e4af-8187bae2cf72@huawei.com>
Date:   Mon, 6 Dec 2021 14:18:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20211202142312.20052-1-tangyizhou@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/2 22:23, Tang Yizhou wrote:
> These Chinese translations are easier to understand.
> Also add proofreader.
> 
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  .../zh_CN/cpu-freq/cpufreq-stats.rst          | 45 ++++++++++---------
>  1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> index f14423099d4b..e8fdba923cd5 100644
> --- a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> +++ b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> @@ -8,13 +8,15 @@
>  
>   司延腾 Yanteng Si <siyanteng@loongson.cn>
>  
> -.. _cn_cpufreq-stats.rst:
> +:校译:
> +
> + 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>  
>  ==========================================
>  sysfs CPUFreq Stats的一般说明
>  ==========================================
>  
> -用户信息
> +为使用者准备的信息
>  
>  
>  作者: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
> @@ -29,17 +31,16 @@ sysfs CPUFreq Stats的一般说明
>  1. 简介
>  ===============
>  
> -cpufreq-stats是一个为每个CPU提供CPU频率统计的驱动。
> -这些统计数据在/sysfs中以一堆只读接口的形式提供。这个接口（在配置好后）将出现在
> -/sysfs（<sysfs root>/devices/system/cpu/cpuX/cpufreq/stats/）中cpufreq下的一个单
> -独的目录中，提供给每个CPU。
> -各种统计数据将在此目录下形成只读文件。
> +cpufreq-stats是一种为每个CPU提供CPU频率统计的驱动。
> +这些统计数据以/sysfs中一系列只读接口的形式呈现。cpufreq-stats接口（若已配置）将为每个CPU生成
> +/sysfs（<sysfs root>/devices/system/cpu/cpuX/cpufreq/stats/）中cpufreq目录下的stats目录。
> +各项统计数据将在stats目录下形成对应的只读文件。
>  
> -此驱动是独立于任何可能运行在你所用CPU上的特定cpufreq_driver而设计的。因此，它将与所有
> -cpufreq_driver一起工作。
> +此驱动是以独立于任何可能运行在你所用CPU上的特定cpufreq_driver的方式设计的。因此，它将能和任何
> +cpufreq_driver协同工作。
>  
>  
> -2. 提供的统计数据(举例说明)
> +2. 已提供的统计数据(有例子)
>  =====================================
>  
>  cpufreq stats提供了以下统计数据（在下面详细解释）。
> @@ -48,8 +49,8 @@ cpufreq stats提供了以下统计数据（在下面详细解释）。
>  -  total_trans
>  -  trans_table
>  
> -所有的统计数据将从统计驱动被载入的时间（或统计被重置的时间）开始，到某一统计数据被读取的时间为止。
> -显然，统计驱动不会有任何关于统计驱动载入之前的频率转换信息。
> +所有统计数据来自以下时间范围：从统计驱动被加载的时间（或统计数据被重置的时间）开始，到某一统计数据被读取的时间为止。
> +显然，统计驱动不会保存它被加载之前的任何频率转换信息。
>  
>  ::
>  
> @@ -64,14 +65,14 @@ cpufreq stats提供了以下统计数据（在下面详细解释）。
>  
>  - **reset**
>  
> -只写属性，可用于重置统计计数器。这对于评估不同调节器下的系统行为非常有用，且无需重启。
> +只写属性，可用于重置统计计数器。这对于评估不同调节器的系统行为非常有用，且无需重启。
>  
>  
>  - **time_in_state**
>  
> -此项给出了这个CPU所支持的每个频率所花费的时间。cat输出的每一行都会有"<frequency>
> -<time>"对，表示这个CPU在<frequency>上花费了<time>个usertime单位的时间。这里的
> -usertime单位是10mS（类似于/proc中输出的其他时间）。
> +此文件给出了在本CPU支持的每个频率上分别花费的时间。cat输出的每一行都是一个"<frequency>
> +<time>"对，表示这个CPU在<frequency>上花费了<time>个usertime单位的时间。输出的每一行对应
> +一个CPU支持的频率。这里usertime单位是10mS（类似于/proc导出的其它时间）。
>  
>  ::
>  
> @@ -85,7 +86,7 @@ usertime单位是10mS（类似于/proc中输出的其他时间）。
>  
>  - **total_trans**
>  
> -给出了这个CPU上频率转换的总次数。cat的输出将有一个单一的计数，这就是频率转换的总数。
> +此文件给出了这个CPU频率转换的总次数。cat的输出是一个计数值，它就是频率转换的总次数。
>  
>  ::
>  
> @@ -94,10 +95,10 @@ usertime单位是10mS（类似于/proc中输出的其他时间）。
>  
>  - **trans_table**
>  
> -这将提供所有CPU频率转换的细粒度信息。这里的cat输出是一个二维矩阵，其中一个条目<i, j>（第
> +本文件提供所有CPU频率转换的细粒度信息。这里的cat输出是一个二维矩阵，其中一个条目<i, j>（第
>  i行，第j列）代表从Freq_i到Freq_j的转换次数。Freq_i行和Freq_j列遵循驱动最初提供给cpufreq
> -核的频率表的排序顺序，因此可以排序（升序或降序）或不排序。 这里的输出也包含了每行每列的实际
> -频率值，以便更好地阅读。
> +核心的频率表的排列顺序，因此可以已排序（升序或降序）或未排序。这里的输出也包含了实际
> +频率值，分别按行和按列显示，以便更好地阅读。
>  
>  如果转换表大于PAGE_SIZE，读取时将返回一个-EFBIG错误。
>  
> @@ -115,7 +116,7 @@ i行，第j列）代表从Freq_i到Freq_j的转换次数。Freq_i行和Freq_j列
>  3. 配置cpufreq-stats
>  ============================
>  
> -要在你的内核中配置cpufreq-stats::
> +按以下方式在你的内核中配置cpufreq-stats::
>  
>  	Config Main Menu
>  		Power management options (ACPI, APM)  --->
> @@ -124,7 +125,7 @@ i行，第j列）代表从Freq_i到Freq_j的转换次数。Freq_i行和Freq_j列
>  				[*]   CPU frequency translation statistics
>  
>  
> -"CPU Frequency scaling" (CONFIG_CPU_FREQ) 应该被启用以配置cpufreq-stats。
> +"CPU Frequency scaling" (CONFIG_CPU_FREQ) 应该被启用，以支持配置cpufreq-stats。
>  
>  "CPU frequency translation statistics" (CONFIG_CPU_FREQ_STAT)提供了包括
>  time_in_state、total_trans和trans_table的统计数据。
> 

cc Yangteng's another email address, siyanteng01@gmail.com
