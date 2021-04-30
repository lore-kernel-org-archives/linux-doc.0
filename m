Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58680C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 11:13:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A2316145A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 11:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhD3LOe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Apr 2021 07:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhD3LOd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Apr 2021 07:14:33 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07310C06174A
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 04:13:44 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 10so5688862pfl.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8CrPCIMYlxJna1CqiqNciDvBJrHz3VTjw9AJc2sL4rY=;
        b=LkEROt1kx/7oObHV9RcHq1ndRLsbKIYPcNSc3bGeIcgo1yQu0MvNqUWjjcm6EgXFiK
         BvsQ/+p+NCg3bQ/HHmL0v6pZf5D4Q1Pc9ELONnhwKpDTfyyAcfx0wAxpCV3PL3JJOGAA
         qUoZa122i1xif5rosD6T/aaIne7ZcAQYmgw3BONv+ZeWApLkQ5F9pDd67TLSZIvosR+d
         A+vdQcHted9DwGJH5Zs3oNa/w7wZDRjE2UdmFm4rzOYL4ba5sR0k2VbDffO9YqIDUDxV
         Mf1aUdUKI5uMMq+BAgkIVmrRd9wNJIiyn4AN/A6fH++k3PpwgnMh+MF2LvQKZMM542cb
         SuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8CrPCIMYlxJna1CqiqNciDvBJrHz3VTjw9AJc2sL4rY=;
        b=YLuUc/zqASBwblA1L8CYD/hxXdqCqzEdpAHO6UeMfkccqURz9/FxJYXI7rcLn4bka4
         Lk6v519oTEa+Hgpp7clUQ+ahToYtIytU7PmirzL6CGj9ApcE0c4b7avffAAv8+omkmNP
         zUvRik7EXHnCxWis2J89bFNh/i8sHlgn1iukyZdWioEbjB/4ZDMuK5RlmSed2b3dv7OX
         7aCGJFs6Gq1wJZbLyYvAMjmSSyUyU6kC0XhGvMz0oBobWkUz6HeQRmprGg2K+pkLrznz
         PyJGFAlccctgC7oQR7UgPH0hZ54vuQ7IZlQE2Wb08orIvLeUH/ZZhVRh81m6le4xZ/Xp
         LJ3Q==
X-Gm-Message-State: AOAM530HfjsDcSrn8e3380Kf3QMCpMHd7dcCz8tcND6u5/wq23iRDaF5
        QjChOeampIq+uub+iGpMNQM=
X-Google-Smtp-Source: ABdhPJxiqeLcBY/WZnG1sL1GcmSWAKRfZ0i+CFgTgal7XlqDUZJS+qhVbVbGnAXL5uCdM89f6Yv7Pg==
X-Received: by 2002:a63:1960:: with SMTP id 32mr2994439pgz.253.1619781223509;
        Fri, 30 Apr 2021 04:13:43 -0700 (PDT)
Received: from [127.0.0.1] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id q8sm1838539pfk.137.2021.04.30.04.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 04:13:42 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] docs/zh_CN: add core-api kernel-api.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net
Cc:     alexs@kernel.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
References: <cover.1619597670.git.siyanteng@loongson.cn>
 <9d8444730cb21baf924440afd3c48926364dc464.1619597670.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <012b925a-32a6-dcb0-d494-023de066e6b1@gmail.com>
Date:   Fri, 30 Apr 2021 19:13:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9d8444730cb21baf924440afd3c48926364dc464.1619597670.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/4/28 下午6:10, Yanteng Si wrote:
> This patch translates Documentation/core-api/kernel-api.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   5 +-
>  .../zh_CN/core-api/kernel-api.rst             | 385 ++++++++++++++++++
>  2 files changed, 389 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index f1fa71e45c77..60e1566d57eb 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -19,9 +19,12 @@
>  来的大量 kerneldoc 信息；有朝一日，若有人有动力的话，应当把它们拆分
>  出来。
>  
> -Todolist:
> +.. toctree::
> +   :maxdepth: 1
>  
>     kernel-api
> +
> +Todolist:
>     workqueue
>     printk-basics
>     printk-formats
> diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> new file mode 100644
> index 000000000000..8e291a7e509f
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
> +.. kernel-doc:: include/linux/list.h
> +   :internal:
> +
> +基本的C库函数
> +=============
> +
> +在编写驱动程序时，一般不能使用C库中的普通程序。部分函数通常很有用，它
> +们在下面被列出。这些函数的行为可能会与ANSI定义的略有不同，这些偏差会
> +在文中注明。
> +
> +字符串转换
> +----------
> +
> +.. kernel-doc:: lib/vsprintf.c
> +   :export:
> +
> +.. kernel-doc:: include/linux/kernel.h
> +   :functions: kstrtol
> +
> +.. kernel-doc:: include/linux/kernel.h
> +   :functions: kstrtoul
> +
> +.. kernel-doc:: lib/kstrtox.c
> +   :export:
> +
> +.. kernel-doc:: lib/string_helpers.c
> +   :export:
> +
> +字符串处理
> +----------
> +
> +.. kernel-doc:: lib/string.c
> +   :export:
> +
> +.. kernel-doc:: include/linux/string.h
> +   :internal:
> +
> +.. kernel-doc:: mm/util.c
> +   :functions: kstrdup kstrdup_const kstrndup kmemdup kmemdup_nul memdup_user
> +               vmemdup_user strndup_user memdup_user_nul
> +
> +基本的内核库函数
> +================
> +
> +Linux内核提供了很多基本的实用函数。
> +
> +位运算
> +------
> +
> +.. kernel-doc:: include/asm-generic/bitops/instrumented-atomic.h
> +   :internal:
> +
> +.. kernel-doc:: include/asm-generic/bitops/instrumented-non-atomic.h
> +   :internal:
> +
> +.. kernel-doc:: include/asm-generic/bitops/instrumented-lock.h
> +   :internal:
> +
> +位图运算
> +--------
> +
> +.. kernel-doc:: lib/bitmap.c
> +   :doc: bitmap introduction
> +
> +.. kernel-doc:: include/linux/bitmap.h
> +   :doc: declare bitmap
> +
> +.. kernel-doc:: include/linux/bitmap.h
> +   :doc: bitmap overview
> +
> +.. kernel-doc:: include/linux/bitmap.h
> +   :doc: bitmap bitops
> +
> +.. kernel-doc:: lib/bitmap.c
> +   :export:
> +
> +.. kernel-doc:: lib/bitmap.c
> +   :internal:
> +
> +.. kernel-doc:: include/linux/bitmap.h
> +   :internal:
> +
> +命令行解析
> +----------
> +
> +.. kernel-doc:: lib/cmdline.c
> +   :export:
> +
> +排序
> +----
> +
> +.. kernel-doc:: lib/sort.c
> +   :export:
> +
> +.. kernel-doc:: lib/list_sort.c
> +   :export:
> +
> +文本检索
> +--------
> +
> +.. kernel-doc:: lib/textsearch.c
> +   :doc: ts_intro
> +
> +.. kernel-doc:: lib/textsearch.c
> +   :export:
> +
> +.. kernel-doc:: include/linux/textsearch.h
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
> +.. kernel-doc:: lib/crc4.c
> +   :export:
> +
> +.. kernel-doc:: lib/crc7.c
> +   :export:
> +
> +.. kernel-doc:: lib/crc8.c
> +   :export:
> +
> +.. kernel-doc:: lib/crc16.c
> +   :export:
> +
> +.. kernel-doc:: lib/crc32.c
> +
> +.. kernel-doc:: lib/crc-ccitt.c
> +   :export:
> +
> +.. kernel-doc:: lib/crc-itu-t.c
> +   :export:
> +
> +基数为2的对数和幂函数
> +---------------------
> +
> +.. kernel-doc:: include/linux/log2.h
> +   :internal:
> +
> +整数幂函数
> +----------
> +
> +.. kernel-doc:: lib/math/int_pow.c
> +   :export:
> +
> +.. kernel-doc:: lib/math/int_sqrt.c
> +   :export:
> +
> +除法函数
> +--------
> +
> +.. kernel-doc:: include/asm-generic/div64.h
> +   :functions: do_div
> +
> +.. kernel-doc:: include/linux/math64.h
> +   :internal:
> +
> +.. kernel-doc:: lib/math/div64.c
> +   :functions: div_s64_rem div64_u64_rem div64_u64 div64_s64
> +
> +.. kernel-doc:: lib/math/gcd.c
> +   :export:
> +
> +UUID/GUID
> +---------
> +
> +.. kernel-doc:: lib/uuid.c
> +   :export:
> +
> +内核IPC设备
> +===========
> +
> +IPC实用程序
> +-----------
> +
> +.. kernel-doc:: ipc/util.c
> +   :internal:
> +
> +FIFO 缓冲区
> +===========
> +
> +kfifo接口
> +---------
> +
> +.. kernel-doc:: include/linux/kfifo.h
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
> +.. kernel-doc:: kernel/relay.c
> +   :export:
> +
> +.. kernel-doc:: kernel/relay.c
> +   :internal:
> +
> +模块支持
> +========
> +
> +模块加载
> +--------
> +
> +.. kernel-doc:: kernel/kmod.c
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
> +.. kernel-doc:: kernel/dma.c
> +   :export:
> +
> +资源管理
> +--------
> +
> +.. kernel-doc:: kernel/resource.c
> +   :internal:
> +
> +.. kernel-doc:: kernel/resource.c
> +   :export:
> +
> +MTRR处理
> +--------
> +
> +.. kernel-doc:: arch/x86/kernel/cpu/mtrr/mtrr.c
> +   :export:
> +
> +安全框架
> +========
> +
> +.. kernel-doc:: security/security.c
> +   :internal:
> +
> +.. kernel-doc:: security/inode.c
> +   :export:
> +
> +审计接口
> +========
> +
> +.. kernel-doc:: kernel/audit.c
> +   :export:
> +
> +.. kernel-doc:: kernel/auditsc.c
> +   :internal:
> +
> +.. kernel-doc:: kernel/auditfilter.c
> +   :internal:
> +
> +核算框架
> +========
> +
> +.. kernel-doc:: kernel/acct.c
> +   :internal:
> +
> +块设备
> +======
> +
> +.. kernel-doc:: block/blk-core.c
> +   :export:
> +
> +.. kernel-doc:: block/blk-core.c
> +   :internal:
> +
> +.. kernel-doc:: block/blk-map.c
> +   :export:
> +
> +.. kernel-doc:: block/blk-sysfs.c
> +   :internal:
> +
> +.. kernel-doc:: block/blk-settings.c
> +   :export:
> +
> +.. kernel-doc:: block/blk-exec.c
> +   :export:
> +
> +.. kernel-doc:: block/blk-flush.c
> +   :export:
> +
> +.. kernel-doc:: block/blk-lib.c
> +   :export:
> +
> +.. kernel-doc:: block/blk-integrity.c
> +   :export:
> +
> +.. kernel-doc:: kernel/trace/blktrace.c
> +   :internal:
> +
> +.. kernel-doc:: block/genhd.c
> +   :internal:
> +
> +.. kernel-doc:: block/genhd.c
> +   :export:
> +
> +字符设备
> +========
> +
> +.. kernel-doc:: fs/char_dev.c
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
> +
> +通过明确的软件时钟门控来支持电源管理：未使用的时钟被禁用，因此系统不会因为改变不在使用
> +中的晶体管的状态而浪费电源。在某些系统中，这可能是由硬件时钟门控支持的，其中时钟被门控
> +而不在软件中被禁用。芯片的部分，在供电但没有时钟的情况下，可能会保留其最后的状态。这种
> +低功耗状态通常被称为*保留模式*。这种模式仍然会产生漏电流，特别是在电路几何结构较细的情
> +况下，但对于CMOS电路来说，电源主要是通过时钟状态变化来使用的。
> +
> +电源感知驱动程序只有在其管理的设备处于活动使用状态时才会启用时钟。此外，系统睡眠状态通
> +常根据哪些时钟域处于活动状态而有所不同：“待机”状态可能允许从多个活动域中唤醒，而
> +"mem"（暂停到RAM）状态可能需要更全面地关闭来自高速PLL和振荡器的时钟，从而限制了可能
> +的唤醒事件源的数量。驱动器的暂停方法可能需要注意目标睡眠状态的系统特定时钟约束。
> +
> +一些平台支持可编程时钟发生器。这些可以被各种外部芯片使用，如其他CPU、多媒体编解码器以
> +及对接口时钟有严格要求的设备。
> +
> +.. kernel-doc:: include/linux/clk.h
> +   :internal:
> +
> +同步原语
> +========
> +
> +读-复制-更新（RCU）
> +-------------------
> +
> +.. kernel-doc:: include/linux/rcupdate.h
> +
> +.. kernel-doc:: kernel/rcu/tree.c
> +
> +.. kernel-doc:: kernel/rcu/tree_exp.h
> +
> +.. kernel-doc:: kernel/rcu/update.c
> +
> +.. kernel-doc:: include/linux/srcu.h
> +
> +.. kernel-doc:: kernel/rcu/srcutree.c
> +
> +.. kernel-doc:: include/linux/rculist_bl.h
> +
> +.. kernel-doc:: include/linux/rculist.h
> +
> +.. kernel-doc:: include/linux/rculist_nulls.h
> +
> +.. kernel-doc:: include/linux/rcu_sync.h
> +
> +.. kernel-doc:: kernel/rcu/sync.c
> 
