Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02E6C433ED
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 11:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A119D6117A
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 11:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhEPLiv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 07:38:51 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38227 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231135AbhEPLiu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 07:38:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id DFC965C0216;
        Sun, 16 May 2021 07:37:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 16 May 2021 07:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=o
        WqIGoW+DMKc6mcRiW+CBsq4ucDYn6MDTPi7K7xo0iw=; b=p7AScBMRyfUzatoDh
        pagc9YgBDnvhfTcBGecHmMOSnTZVm8KwYVF/DrnKJ3PhWNgvzCR4wVVzGwAK2wMw
        aK5nj0AdqnQlYSLOg5nxW3a4KXugxwk61CDFYJqKj/9ds99UMVGhMWx4g5WeCrrT
        T4x6ZjPqXXZKsc4yAJ9skR/4jnGu9nOdPKNbZT9Yr8xhE4YvwcIKAV8JRVLCdhgJ
        RJCvRm7xiGfYvYfZpaiWGJaZLE7wvT+AHSuOx5XYIrhhV07a+ZQZlnXz2CWQ24lN
        1qyvOPZz4qzPsDIw4een+bDsSoT6KX9WeNDCZ1sMseY85QeO4aC3XL5/vQq9UiQf
        bhQIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=oWqIGoW+DMKc6mcRiW+CBsq4ucDYn6MDTPi7K7xo0
        iw=; b=NCtmHaQ01UHnKpaYEzQ83D093q0xH/Ok6WvkPRe7GTtGHlZkvoSzZ2Etz
        28gxxPc320DCk57at8PPwWUUvuH2xTXXiBD0k94AxuQ14hxWakeKs+sF9x8IrhTw
        BeZxDCVc6LUtGKJwG4KWo6vTPhA+UFhXRaQfb+rXB3XZhK6/OhzIxMqMDMnEfe2H
        WfVUmoE8nIBr8BiSDk98L7G+hOCcv+q3g10VSgVflPVbmH5n/LfMYciAqts1Jg7H
        b5Lr4hgVMSeHI/M7Sag5Xx07V9CZIrF22Op9SXfd+58h/Dg8qELPg9d2xQoKMeG1
        /6HqacNO4khzMmZQyghNBS0FYbTnQ==
X-ME-Sender: <xms:_AOhYPoVodGCuBB9W1jW4l2A2YxWMnY0usEuxh2DViWLXJEc2fNTFA>
    <xme:_AOhYJoTw1E7Y0RyRb9yCtV9fNHo9cNGlAb1f2EpqdT2IYYx0a7wc2mO_1BEyDqle
    z7xQx-6fU0aZnwdQ4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeifedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepiedtrddukeeirddvvdejrddukeehnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:_AOhYMMMBKkAaqmbJeDKBMaZ_5ZT8si6HU5fXv21XNcQmQ_errCGYA>
    <xmx:_AOhYC4N2LyRQMfKB8TvJ3iW4kyncFCAUDe-DKNZsn3vwIjp7pKkZQ>
    <xmx:_AOhYO60gMrtKlXPP4MeBjeb2vU49aEgV92HRMl2nL_eO8AkquqZGA>
    <xmx:_QOhYLvtx9zHLW22Sc5A0Qj1BO48vWPHAIa4lFlNwWZZbb8qTWvcww>
Received: from [192.168.14.19] (unknown [60.186.227.185])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Sun, 16 May 2021 07:37:29 -0400 (EDT)
Subject: Re: [PATCH v6 1/3] docs/zh_CN: add core-api kernel-api.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org
Cc:     chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
References: <cover.1621062577.git.siyanteng@loongson.cn>
 <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a6188573-a34e-fc2e-b8db-17197fce1307@flygoat.com>
Date:   Sun, 16 May 2021 19:37:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/5/15 16:10, Yanteng Si 写道:
> This patch translates Documentation/core-api/kernel-api.rst into Chinese.

Hi Yanteng,

Thanks for your l10n works,
see my comments blow:

>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>   .../translations/zh_CN/core-api/index.rst     |   5 +-
>   .../zh_CN/core-api/kernel-api.rst             | 385 ++++++++++++++++++
>   2 files changed, 389 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index f1fa71e45c77..60e1566d57eb 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -19,9 +19,12 @@
>   来的大量 kerneldoc 信息；有朝一日，若有人有动力的话，应当把它们拆分
>   出来。
>   
> -Todolist:
> +.. toctree::
> +   :maxdepth: 1
>   
>      kernel-api
> +
> +Todolist:
>      workqueue
>      printk-basics
>      printk-formats
> diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> new file mode 100644
> index 000000000000..2b4d38ec64bf
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> @@ -0,0 +1,385 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/kernel-api.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_kernel-api.rst:
> +
> +
> +============
> +Linux内核API
> +============
> +
> +
> +列表管理函数
> +============
> +
> +check the functions in include/linux/list.h in kernel source code.
> +   :internal:
> +
> +基本的C库函数
> +=============
> +
> +在编写驱动程序时，一般不能使用C库中的普通程序。部分函数通常很有用，它
> +们在下面被列出。这些函数的行为可能会与ANSI定义的略有不同，这些偏差会
> +在文中注明。
^普通程序？

How about 下面将列出内核中常用的C标准函数?
> +
> +字符串转换
> +----------
> +
> +check the functions in lib/vsprintf.c in kernel source code.
> +   :export:
> +
> +check the functions in include/linux/kernel.h in kernel source code.
> +   :functions: kstrtol
> +
> +check the functions in include/linux/kernel.h in kernel source code.
> +   :functions: kstrtoul
> +
> +check the functions in lib/kstrtox.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/string_helpers.c in kernel source code.
> +   :export:
> +
> +字符串处理
> +----------
> +
> +check the functions in lib/string.c in kernel source code.
> +   :export:
> +
> +check the functions in include/linux/string.h in kernel source code.
> +   :internal:
> +
> +check the functions in mm/util.c in kernel source code.
> +   :functions: kstrdup kstrdup_const kstrndup kmemdup kmemdup_nul memdup_user
> +               vmemdup_user strndup_user memdup_user_nul
> +
> +基本的内核库函数
> +================
> +
> +Linux内核提供了很多基本的实用函数。
实用的基本函数

> +
> +位运算
> +------
> +
> +check the functions in include/asm-generic/bitops/instrumented-atomic.h in kernel source code.
> +   :internal:
> +
> +check the functions in include/asm-generic/bitops/instrumented-non-atomic.h in kernel source code.
> +   :internal:
> +
> +check the functions in include/asm-generic/bitops/instrumented-lock.h in kernel source code.
> +   :internal:
> +
> +位图运算
> +--------
> +
> +check the functions in lib/bitmap.c in kernel source code.
> +   :doc: bitmap introduction
> +
> +check the functions in include/linux/bitmap.h in kernel source code.
> +   :doc: declare bitmap
> +
> +check the functions in include/linux/bitmap.h in kernel source code.
> +   :doc: bitmap overview
> +
> +check the functions in include/linux/bitmap.h in kernel source code.
> +   :doc: bitmap bitops
> +
> +check the functions in lib/bitmap.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/bitmap.c in kernel source code.
> +   :internal:
> +
> +check the functions in include/linux/bitmap.h in kernel source code.
> +   :internal:
> +
> +命令行解析
> +----------
> +
> +check the functions in lib/cmdline.c in kernel source code.
> +   :export:
> +
> +排序
> +----
> +
> +check the functions in lib/sort.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/list_sort.c in kernel source code.
> +   :export:
> +
> +文本检索
> +--------
> +
> +check the functions in lib/textsearch.c in kernel source code.
> +   :doc: ts_intro
> +
> +check the functions in lib/textsearch.c in kernel source code.
> +   :export:
> +
> +check the functions in include/linux/textsearch.h in kernel source code.
> +   :functions: textsearch_find textsearch_next \
> +               textsearch_get_pattern textsearch_get_pattern_len
> +
> +Linux中的CRC和数学函数
> +======================
> +
> +
> +CRC函数
> +-------
> +
> +*译注：CRC，Cyclic Redundancy Check，循环冗余校验*
> +
> +check the functions in lib/crc4.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/crc7.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/crc8.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/crc16.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/crc32.c in kernel source code.
> +
> +check the functions in lib/crc-ccitt.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/crc-itu-t.c in kernel source code.
> +   :export:
> +
> +基数为2的对数和幂函数
> +---------------------
> +
> +check the functions in include/linux/log2.h in kernel source code.
> +   :internal:
> +
> +整数幂函数
> +----------
> +
> +check the functions in lib/math/int_pow.c in kernel source code.
> +   :export:
> +
> +check the functions in lib/math/int_sqrt.c in kernel source code.
> +   :export:
> +
> +除法函数
> +--------
> +
> +check the functions in include/asm-generic/div64.h in kernel source code.
> +   :functions: do_div
> +
> +check the functions in include/linux/math64.h in kernel source code.
> +   :internal:
> +
> +check the functions in lib/math/div64.c in kernel source code.
> +   :functions: div_s64_rem div64_u64_rem div64_u64 div64_s64 in kernel source code.
> +
> +check the functions in lib/math/gcd.c in kernel source code.
> +   :export:
> +
> +UUID/GUID
> +---------
> +
> +check the functions in lib/uuid.c in kernel source code.
> +   :export:
> +
> +内核IPC设备
> +===========
> +
> +IPC实用程序
> +-----------
> +
> +check the functions in ipc/util.c in kernel source code.
> +   :internal:
> +
> +FIFO 缓冲区
> +===========
> +
> +kfifo接口
> +---------
> +
> +check the functions in include/linux/kfifo.h in kernel source code.
> +   :internal:
> +
> +转发接口支持
> +============
> +
> +转发接口支持旨在为工具和设备提供一种有效的机制，将大量数据从内核空间
> +转发到用户空间。
> +
> +转发接口
> +--------
> +
> +check the functions in kernel/relay.c in kernel source code.
> +   :export:
> +
> +check the functions in kernel/relay.c in kernel source code.
> +   :internal:
> +
> +模块支持
> +========
> +
> +模块加载
> +--------
> +
> +check the functions in kernel/kmod.c in kernel source code.
> +   :export:
> +
> +模块接口支持
> +------------
> +
> +更多信息请参考文件kernel/module.c。
> +
> +硬件接口
> +========
> +
> +
> +check the functions in kernel/dma.c in kernel source code.
> +   :export:
> +
> +资源管理
> +--------
> +
> +check the functions in kernel/resource.c in kernel source code.
> +   :internal:
> +
> +check the functions in kernel/resource.c in kernel source code.
> +   :export:
> +
> +MTRR处理
> +--------
> +
> +check the functions in arch/x86/kernel/cpu/mtrr/mtrr.c in kernel source code.
> +   :export:
> +
> +安全框架
> +========
> +
> +check the functions in security/security.c in kernel source code.
> +   :internal:
> +
> +check the functions in security/inode.c in kernel source code.
> +   :export:
> +
> +审计接口
> +========
> +
> +check the functions in kernel/audit.c in kernel source code.
> +   :export:
> +
> +check the functions in kernel/auditsc.c in kernel source code.
> +   :internal:
> +
> +check the functions in kernel/auditfilter.c in kernel source code.
> +   :internal:
> +
> +核算框架
> +========
> +
> +check the functions in kernel/acct.c in kernel source code.
> +   :internal:
> +
> +块设备
> +======
> +
> +check the functions in block/blk-core.c in kernel source code.
> +   :export:
> +
> +check the functions in block/blk-core.c in kernel source code.
> +   :internal:
> +
> +check the functions in block/blk-map.c in kernel source code.
> +   :export:
> +
> +check the functions in block/blk-sysfs.c in kernel source code.
> +   :internal:
> +
> +check the functions in block/blk-settings.c in kernel source code.
> +   :export:
> +
> +check the functions in block/blk-exec.c in kernel source code.
> +   :export:
> +
> +check the functions in block/blk-flush.c in kernel source code.
> +   :export:
> +
> +check the functions in block/blk-lib.c in kernel source code.
> +   :export:
> +
> +check the functions in block/blk-integrity.c in kernel source code.
> +   :export:
> +
> +check the functions in kernel/trace/blktrace.c in kernel source code.
> +   :internal:
> +
> +check the functions in block/genhd.c in kernel source code.
> +   :internal:
> +
> +check the functions in block/genhd.c in kernel source code.
> +   :export:
> +
> +字符设备
> +========
> +
> +check the functions in fs/char_dev.c in kernel source code.
> +   :export:
> +
> +时钟框架
> +========
> +
> +时钟框架定义了编程接口，以支持系统时钟树的软件管理。该框架广泛用于系统级芯片（SOC）平
> +台，以支持电源管理和各种可能需要自定义时钟速率的设备。请注意，这些 “时钟”与计时或实
> +时时钟(RTC)无关，它们都有单独的框架。这些:c:type: `struct clk <clk>` 实例可用于管
> +理例如96 MHz信号，该信号用于将位移入和移出外设或总线，或以其他方式触发系统硬件中的同
> +步状态机转换。
指代不明，

可用于管理各种时钟信号，例如一个96 
MHz的时钟信号，该信号可被用于总线或外设的数据交换，或以其他方式触发系统硬件中的同步状态机转换。 

> +
> +通过明确的软件时钟门控来支持电源管理：未使用的时钟被禁用，因此系统不会因为改变不在使用
明确->显式？
> +中的晶体管的状态而浪费电源。在某些系统中，这可能是由硬件时钟门控支持的，其中时钟被门控
电路翻转？
> +而不在软件中被禁用。芯片的部分，在供电但没有时钟的情况下，可能会保留其最后的状态。这种
> +低功耗状态通常被称为*保留模式*。这种模式仍然会产生漏电流，特别是在电路几何结构较细的情
保持模式 （表达保持当前状态）
> +况下，但对于CMOS电路来说，电源主要是通过时钟状态变化来使用的。
电能主要是随着时钟翻转而被消耗的？

- Jiaxun

> +
> +电源感知驱动程序只有在其管理的设备处于活动使用状态时才会启用时钟。此外，系统睡眠状态通
> +常根据哪些时钟域处于活动状态而有所不同：“待机”状态可能允许从多个活动域中唤醒，而
> +"mem"（暂停到RAM）状态可能需要更全面地关闭来自高速PLL和振荡器的时钟，从而限制了可能
> +的唤醒事件源的数量。驱动器的暂停方法可能需要注意目标睡眠状态的系统特定时钟约束。
> +
> +一些平台支持可编程时钟发生器。这些可以被各种外部芯片使用，如其他CPU、多媒体编解码器以
> +及对接口时钟有严格要求的设备。
> +
> +check the functions in include/linux/clk.h in kernel source code.
> +   :internal:
> +
> +同步原语
> +========
> +
> +读-复制-更新（RCU）
> +-------------------
> +
> +check the functions in include/linux/rcupdate.h in kernel source code.
> +
> +check the functions in kernel/rcu/tree.c in kernel source code.
> +
> +check the functions in kernel/rcu/tree_exp.h in kernel source code.
> +
> +check the functions in kernel/rcu/update.c in kernel source code.
> +
> +check the functions in include/linux/srcu.h in kernel source code.
> +
> +check the functions in kernel/rcu/srcutree.c in kernel source code.
> +
> +check the functions in include/linux/rculist_bl.h in kernel source code.
> +
> +check the functions in include/linux/rculist.h in kernel source code.
> +
> +check the functions in include/linux/rculist_nulls.h in kernel source code.
> +
> +check the functions in include/linux/rcu_sync.h in kernel source code.
> +
> +check the functions in kernel/rcu/sync.c in kernel source code.

