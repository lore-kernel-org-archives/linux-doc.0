Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B97C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 15 Dec 2021 02:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhLOCMg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Dec 2021 21:12:36 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:16809 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhLOCMg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Dec 2021 21:12:36 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JDJdy64skz91jR;
        Wed, 15 Dec 2021 10:11:50 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 10:12:35 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 10:12:34 +0800
Subject: Re: [PATCH] docs/zh_CN: Add cputopology Chinese translation
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>
References: <20211215022955.21210-1-tangyizhou@huawei.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <ae8d297b-896c-a6b3-b5f4-6cb48223e814@huawei.com>
Date:   Wed, 15 Dec 2021 10:12:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20211215022955.21210-1-tangyizhou@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/15 10:29, Tang Yizhou wrote:
> Translate admin-guide/cputopology.rst into Chinese.
> 
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  .../zh_CN/admin-guide/cputopology.rst         | 94 +++++++++++++++++++
>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>  2 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/cputopology.rst
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/cputopology.rst b/Documentation/translations/zh_CN/admin-guide/cputopology.rst
> new file mode 100644
> index 000000000000..f8d5c5025330
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/cputopology.rst
> @@ -0,0 +1,94 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/admin-guide/cputopology.rst
> +
> +:翻译:
> +
> +  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> +
> +==========================
> +如何通过sysfs将CPU拓扑导出
> +==========================
> +
> +CPU拓扑信息通过sysfs导出。显示的项（属性）和某些架构的/proc/cpuinfo输出相似。它们位于
> +/sys/devices/system/cpu/cpuX/topology/。请阅读ABI文件：
> +Documentation/ABI/stable/sysfs-devices-system-cpu。
> +
> +drivers/base/topology.c是体系结构中性的，它导出了这些属性。然而，die、cluster、book、
> +draw这些层次结构相关的文件仅在体系结构提供了下文描述的宏的条件下被创建。
> +
> +对于支持这个特性的体系结构，它必须在include/asm-XXX/topology.h中定义这些宏中的一部分::
> +
> +	#define topology_physical_package_id(cpu)
> +	#define topology_die_id(cpu)
> +	#define topology_cluster_id(cpu)
> +	#define topology_core_id(cpu)
> +	#define topology_book_id(cpu)
> +	#define topology_drawer_id(cpu)
> +	#define topology_sibling_cpumask(cpu)
> +	#define topology_core_cpumask(cpu)
> +	#define topology_cluster_cpumask(cpu)
> +	#define topology_die_cpumask(cpu)
> +	#define topology_book_cpumask(cpu)
> +	#define topology_drawer_cpumask(cpu)
> +
> +``**_id macros`` 的类型是int。
> +``**_cpumask macros`` 的类型是 ``(const) struct cpumask *`` 。后者和恰当的
> +``**_siblings`` sysfs属性对应（除了topology_sibling_cpumask()，它和thread_siblings
> +对应）。
> +
> +为了在所有体系结构上保持一致，include/linux/topology.h提供了上述所有宏的默认定义，以防
> +它们未在include/asm-XXX/topology.h中定义:
> +
> +1) topology_physical_package_id: -1
> +2) topology_die_id: -1
> +3) topology_cluster_id: -1
> +4) topology_core_id: 0
> +5) topology_book_id: -1
> +6) topology_drawer_id: -1
> +7) topology_sibling_cpumask: 仅入参CPU
> +8) topology_core_cpumask: 仅入参CPU
> +9) topology_cluster_cpumask: 仅入参CPU
> +10) topology_die_cpumask: 仅入参CPU
> +11) topology_book_cpumask:  仅入参CPU
> +12) topology_drawer_cpumask: 仅入参CPU
> +
> +此外，CPU拓扑信息由/sys/devices/system/cpu提供，包含下述文件。输出对应的内部数据源放在
> +方括号（"[]"）中。
> +
> +    =========== ==================================================
> +    kernel_max: 内核配置允许的最大CPU下标值。[NR_CPUS-1]
> +
> +    offline:    由于热插拔移除或者超过内核允许的CPU上限（上文描述的kernel_max）导致未上线的CPU。[~cpu_online_mask + cpus >= NR_CPUS]

Here is an example of poor Chinese support. If a line break is made here,
*make htmldocs* warns 'Malformed table'.

Meanwhile, the number of '=' can be inconsistent with the number of Chinese
chars and there won't be any warnings. I've already checked the HTML page,
the rendering effect is OK.

Tang

> +
> +    online:     在线的CPU，可供调度使用。[cpu_online_mask]
> +
> +    possible:   已被分配资源的CPU，如果它们CPU实际存在，可以上线。[cpu_possible_mask]
> +
> +    present:    被系统识别实际存在的CPU。[cpu_present_mask]
> +    =========== ==================================================
> +
> +上述输出的格式和cpulist_parse()兼容[参见 <linux/cpumask.h>]。下面给些例子。
> +
> +在本例中，系统中有64个CPU，但是CPU 32-63超过了kernel_max值，因为NR_CPUS配置项是32，
> +取值范围被限制为0..31。此外注意CPU2和4-31未上线，但是可以上线，因为它们同时存在于
> +present和possible::
> +
> +     kernel_max: 31
> +        offline: 2,4-31,32-63
> +         online: 0-1,3
> +       possible: 0-31
> +        present: 0-31
> +
> +在本例中，NR_CPUS配置项是128，但内核启动时设置possible_cpus=144。系统中有4个CPU，
> +CPU2被手动设置下线（也是唯一一个可以上线的CPU）::
> +
> +     kernel_max: 127
> +        offline: 2,4-127,128-143
> +         online: 0-1,3
> +       possible: 0-127
> +        present: 0-3
> +
> +阅读Documentation/core-api/cpu_hotplug.rst可了解开机参数possible_cpus=NUM，同时还
> +可以了解各种cpumask的信息。
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index 83db84282562..548e57f4b3f1 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -65,6 +65,7 @@ Todolist:
>  
>     clearing-warn-once
>     cpu-load
> +   cputopology
>     lockup-watchdogs
>     unicode
>     sysrq
> @@ -84,7 +85,6 @@ Todolist:
>     cgroup-v1/index
>     cgroup-v2
>     cifs/index
> -   cputopology
>     dell_rbu
>     device-mapper/index
>     edid
> 
