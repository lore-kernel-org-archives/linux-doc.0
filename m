Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7CBC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jan 2022 08:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345354AbiAGIEM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jan 2022 03:04:12 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:31075 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345296AbiAGIEJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jan 2022 03:04:09 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JVbHp2T1mz1FCZV;
        Fri,  7 Jan 2022 16:00:38 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:04:07 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:04:07 +0800
Subject: Re: [PATCH 2/3] docs_zh_CN: add active_mm translation
To:     Yanteng Si <siyanteng01@gmail.com>, <corbet@lwn.net>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>, <chenhuacai@kernel.org>,
        <jiaxun.yang@flygoat.com>, <linux-doc@vger.kernel.org>
References: <cover.1641522956.git.siyanteng@loongson.cn>
 <163ebc7052e00f001c5813186899ff42b1c176ab.1641522956.git.siyanteng@loongson.cn>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <2b2c9418-29df-5087-915b-88051ac1275a@huawei.com>
Date:   Fri, 7 Jan 2022 16:04:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <163ebc7052e00f001c5813186899ff42b1c176ab.1641522956.git.siyanteng@loongson.cn>
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

On 2022/1/7 10:40, Yanteng Si wrote:> Translatr .../vm/active_mm.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/vm/active_mm.rst       | 85 +++++++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst |  2 +-
>  2 files changed, 86 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/active_mm.rst
> 
> diff --git a/Documentation/translations/zh_CN/vm/active_mm.rst b/Documentation/translations/zh_CN/vm/active_mm.rst
> new file mode 100644
> index 000000000000..33f8193e6135
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/active_mm.rst
> @@ -0,0 +1,85 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/active_mm.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +
> +=========
> +Active MM
> +=========
> +
> +这是一封linux之父回复开发者的一封邮件，所以翻译时我尽量保持邮件格式的完整。
> +
> +::
> +
> + List:       linux-kernel
> + Subject:    Re: active_mm
> + From:       Linus Torvalds <torvalds () transmeta ! com>
> + Date:       1999-07-30 21:36:24
> +
> + 因为我并不经常写解释，所以已经抄送到linux-kernel邮件列表，而当我做这些，
> + 且更多的人在阅读它们时，我觉得棒极了。
> +
> + 1999年7月30日 星期五， David Mosberger 写道：
> + >
> + > 是否有一个简短的描述，说明task_struct中的
> + >  "mm" 和 "active_mm"应该如何使用？ (如果
> + > 这个问题在邮件列表中讨论过，我表示歉意--我刚
> + > 刚度假回来，有一段时间没能关注linux-kernel了）。
> +
> + 基本上，新的设定是：
> +
> +  - 我们有“真实地址空间”和“匿名地址空间”。区别在于，匿名地址空间根本不关心用
> +    户级页表，所以当我们做上下文切换到匿名地址空间时，我们只是让以前的地址空间
> +    处于活动状态。
> +
> +    一个“匿名地址空间”的明显用途是任何不需要任何用户映射的线程--所有的内核线
> +    程基本上都属于这一类，但即使是“真正的”线程也可以暂时说在一定时间内它们不
> +    会对用户空间感兴趣，调度器不妨试着避免在切换VM状态上浪费时间。目前只有老
> +    式的bdflush sync能做到这一点。
> +
> +  - “tsk->mm” 指向 “真实地址空间”。对于一个匿名进程来说，tsk->mm将是NULL，
> +    其逻辑原因是匿名进程实际上根本就 “没有” 真正的地址空间。
> +
> +  - 然而，我们显然需要跟踪我们为这样的匿名用户“偷用”了哪个地址空间。为此，我们
> +    有 “tsk->active_mm”，它显示了当前活动的地址空间是什么。
> +
> +    规则是，对于一个有真实地址空间的进程（即tsk->mm是 non-NULL），active_mm
> +    显然必须与realone相同。

please translate: realone

> +
> +    对于一个匿名进程，tsk->mm == NULL，而tsk->active_mm是匿名进程运行时
> +    “借用”的mm。当匿名进程被调度走时，借用的地址空间被返回并清除。
> +
> + 为了支持所有这些，“struct mm_struct”现在有两个计数器：一个是 “mm_users”
> + 计数器，即有多少 “真正的地址空间用户”，另一个是 “mm_count”计数器，即 “lazy”
> + 用户（即匿名用户）的数量，如果有任何真正的用户，则加1。
> +
> + 通常情况下，至少有一个真正的用户，但也可能是真正的用户在另一个CPU上退出，而
> + 一个lazy的用户仍在活动，所以你实际上得到的情况是，你有一个地址空间 **只**
> + 被lazy的用户使用。这通常是一个短暂的生命周期状态，因为一旦这个线程被安排给一
> + 个真正的线程，这个 “僵尸” mm就会被释放，因为 “mm_count”变成了零。
> +
> + 另外，一个新的规则是，**没有人** 再把 “init_mm” 作为一个真正的MM了。
> + “init_mm”应该被认为只是一个 “没有其他上下文时的lazy上下文”，事实上，它主
> + 要是在启动时使用，当时还没有真正的VM被创建。因此，用来检查的代码
> +
> +   if (current->mm == &init_mm)
> +
> + 一般来说，应该仅执行
> +
> +   if (!current->mm)
> +
> + 反之（这更有意义--测试基本上是 “我们是否有一个用户环境”，并且通常由缺页

这里的翻译有问题。原文是current->mm == &init_mm的写法通常应当替换成!current->mm


> + 异常处理程序和类似的东西来完成）。
> +
> + 总之，我刚才在ftp.kernel.org上放了一个pre-patch-2.3.13-1，因为它稍微改
> + 变了接口以适应alpha（谁会想到呢，但alpha实际上最终有一个最难看的上下文切换

适应 -> 适配。 alpha -> alpah体系结构
实际上最终有一个最难看的上下文切换代码 -> 上下文切换代码实际上最终是最丑陋的之一。

> + 代码--不像其他架构的MM和寄存器状态是分开的，alpha的PALcode将两者连接起来，
> + 你需要同时切换两者）。
> +
> + (文档来源 http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
> index 0fda40c602ac..5fcdb75d8682 100644
> --- a/Documentation/translations/zh_CN/vm/index.rst
> +++ b/Documentation/translations/zh_CN/vm/index.rst
> @@ -21,9 +21,9 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
>  .. toctree::
>     :maxdepth: 1
>  
> +   active_mm
>  
>  TODOLIST:
> -* active_mm
>  * arch_pgtable_helpers
>  * balance
>  * damon/index
> 

Thanks,
Tang
