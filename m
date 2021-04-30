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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6A6C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 11:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10FBF61458
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 11:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhD3LQg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Apr 2021 07:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhD3LQg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Apr 2021 07:16:36 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAEDC06174A
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 04:15:48 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id v191so6438692pfc.8
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/rcn47DieKi0UewJs2rcy5SaMobei9sw62TSTNz0Gwk=;
        b=kgiWOPRYSN3MSVmRzeJn7ZAXImVIXWnPGlAl4sJ4eAl+rCdxD+5m6K3ByqopIY6Cib
         l/Z+t3R/IdVVcPqXSNx2KMWEpbsnKQ+lvBmfqA0Kcro/jU+mIi8oAfh8V5BKB+fMSNzw
         nc6VxYd9GO5d9gahy06xGpEJw/W9vgxeMilY+AmimW89BdHObeUvyMGbQkcdBkx3esfm
         0OsKbh0+o3aY9tDg42pqRgv0BdSoyO4pDdhhvo1O7JnoEVMpzAXX/f/yyndq6dYHVN42
         TgjmxgWjrhL9I11xeAAfYJ+9m01t2DA/HiqHk/s/HyOAHJAMMPSe59xLEVcvPSBjbTOL
         SSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/rcn47DieKi0UewJs2rcy5SaMobei9sw62TSTNz0Gwk=;
        b=BJgF2Y3RmvC7bW/loj+GZXAnq/gcpmlL6L1nqIZR0empSqjymyFbJJXWukIGrPQhZN
         kzwheH0GtXw27dH1j2krP/5oprJRvJ832/sWaveIWM8CkFLS17BB8WewKRWAO/t6Sg9k
         mBqjxejLoicEbBwpnLtvKAzgiWZJeIhRl9eEoWM1GnwIh10enwdAapuH0OtEmK4zT2oX
         iiNJ7OGKxb0p/DwtCiHoe9SK+KoYa0xnn+dEDK74KZkm2mSfi5LzjLtdfbhnmjQs/GmJ
         2y37F/ptJRvCfz1W1IFDOOuytxsV+lEqkwp/2S7g0UNghWJZaYwLdF01z4yk0/hCoGjD
         iBtA==
X-Gm-Message-State: AOAM533NeLk8z/M9dja9Owm10/v8fl0oVYnf7u4cg/uTHhob13ycKofJ
        lKLjQpdFgLprAhvpjfRfvSc=
X-Google-Smtp-Source: ABdhPJzGcZ9HjG40TWq+hS1Jomat7nC3E6zAfNwyLomg5dK1psnfZPIQHVvN9HfiKfl7wPbP8QQUmw==
X-Received: by 2002:a62:7d07:0:b029:21b:d1bc:f6c8 with SMTP id y7-20020a627d070000b029021bd1bcf6c8mr4477739pfc.45.1619781347526;
        Fri, 30 Apr 2021 04:15:47 -0700 (PDT)
Received: from [127.0.0.1] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id mv14sm7181127pjb.57.2021.04.30.04.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 04:15:47 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] docs/zh_CN: add core-api printk-basics.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net
Cc:     alexs@kernel.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
References: <cover.1619597670.git.siyanteng@loongson.cn>
 <fe6e70d04da90e0b12e62f83f9f84142bb5b33e0.1619597670.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <535b85aa-0f65-aeca-2990-03b4b52b2472@gmail.com>
Date:   Fri, 30 Apr 2021 19:15:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fe6e70d04da90e0b12e62f83f9f84142bb5b33e0.1619597670.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/4/28 下午6:10, Yanteng Si wrote:
> This patch translates Documentation/core-api/printk-basics.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../zh_CN/core-api/printk-basics.rst          | 111 ++++++++++++++++++
>  2 files changed, 112 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/printk-basics.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 60e1566d57eb..5ecb23e3ba8c 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -23,10 +23,10 @@
>     :maxdepth: 1
>  
>     kernel-api
> +   printk-basics
>  
>  Todolist:
>     workqueue
> -   printk-basics
>     printk-formats
>     symbol-namespaces
>  
> diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
> new file mode 100644
> index 000000000000..054261c3fd44
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst
> @@ -0,0 +1,111 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/printk-basics.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_printk-basics.rst:
> +
> +
> +==================
> +使用printk记录消息
> +==================
> +
> +printk()是Linux内核中最广为人知的函数之一。它是我们打印消息的标准工具，通常也是追踪和调试
> +的最基本方法。如果你熟悉printf(3)，你就能够知道printk()是基于它的，尽管它在功能上有一些不
> +同之处:
> +
> +  - printk() 消息可以指定日志级别。
> +
> +  - 格式字符串虽然与C99基本兼容，但并不遵循完全相同的规范。它有一些扩展和一些限制（没
> +    有 ``%n`` 或浮点转换指定符）。参见:ref: `如何正确地获得printk格式指定符<printk-specifiers>` 。
> +
> +所有的printk()消息都会被打印到内核日志缓冲区，这是一个通过/dev/kmsg输出到用户空间的环
> +形缓冲区。读取它的通常方法是使用 ``dmesg`` 。
> +
> +printk()的用法通常是这样的::
> +
> +  printk(KERN_INFO "Message: %s\n", arg);
> +
> +其中 ``KERN_INFO`` 是日志级别（注意，它与格式字符串连在一起，日志级别不是一个单独的参数）。
> +可用的日志级别是：
> +
> +
> ++----------------+--------+-----------------------------------------------+
> +| 名称           | 字符串 |  别名函数                                     |
> ++================+========+===============================================+
> +| KERN_EMERG     | "0"    | pr_emerg()                                    |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_ALERT     | "1"    | pr_alert()                                    |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_CRIT      | "2"    | pr_crit()                                     |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_ERR       | "3"    | pr_err()                                      |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_WARNING   | "4"    | pr_warn()                                     |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_NOTICE    | "5"    | pr_notice()                                   |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_INFO      | "6"    | pr_info()                                     |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_DEBUG     | "7"    | pr_debug() and pr_devel()  若定义了DEBUG      |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_DEFAULT   | ""     |                                               |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_CONT      | "c"    | pr_cont()                                     |
> ++----------------+--------+-----------------------------------------------+
> +
> +
> +日志级别指定了一条消息的重要性。内核根据日志级别和当前 *console_loglevel* （一个内核变量）决
> +定是否立即显示消息（将其打印到当前控制台）。如果消息的优先级比 *console_loglevel* 高（日志级
> +别值较低），消息将被打印到控制台。
> +
> +如果省略了日志级别，则以 ``KERN_DEFAULT`` 级别打印消息。
> +
> +你可以用以下方法检查当前的 *console_loglevel* ::
> +
> +  $ cat /proc/sys/kernel/printk
> +  4        4        1        7
> +
> +结果显示了 *current*, *default*, *minimum* 和 *boot-time-default* 日志级别
> +
> +要改变当前的 console_loglevel，只需在 ``/proc/sys/kernel/printk`` 中写入所需的
> +级别。例如，要打印所有的消息到控制台上::
> +
> +  # echo 8 > /proc/sys/kernel/printk
> +
> +另一种方式，使用 ``dmesg``::
> +
> +  # dmesg -n 5
> +
> +设置 console_loglevel 打印 KERN_WARNING (4) 或更严重的消息到控制台。更多消息参
> +见 ``dmesg(1)`` 。
> +
> +作为printk()的替代方案，你可以使用 ``pr_*()`` 别名来记录日志。这个系列的宏在宏名中
> +嵌入了日志级别。例如::
> +
> +  pr_info("Info message no. %d\n", msg_num);
> +
> +打印 ``KERN_INFO`` 消息。
> +
> +除了比等效的printk()调用更简洁之外，它们还可以通过pr_fmt()宏为格式字符串使用一个通用
> +的定义。例如，在源文件的顶部（在任何  ``#include`` 指令之前）定义这样的内容。::
> +
> +  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> +
> +会在该文件中的每一条 pr_*() 消息前加上发起该消息的模块和函数名称。
> +
> +为了调试，还有两个有条件编译的宏：
> +pr_debug()和pr_devel()，除非定义了 ``DEBUG`` (或者在pr_debug()的情况下定义了
> +``CONFIG_DYNAMIC_DEBUG`` )，否则它们会被编译。
> +
> +
> +函数接口
> +========
> +
> +.. kernel-doc:: kernel/printk/printk.c
> +   :functions: printk
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_emerg pr_alert pr_crit pr_err pr_warn pr_notice pr_info
> +      pr_fmt pr_debug pr_devel pr_cont
> 
