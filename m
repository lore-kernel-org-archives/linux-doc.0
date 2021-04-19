Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E65C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 16:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABF306135F
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 16:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhDSQUJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 12:20:09 -0400
Received: from m32-153.88.com ([43.250.32.153]:43204 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233752AbhDSQUE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Apr 2021 12:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Rh1aioyMp8lVjNhzgeRsmY0w4iki6FdV3j0Bx
        O7oN74=; b=habO3BbW7aX0raUEyUhsrLPJ5c8x60vWcZ21IA97aM97cmgCb32GR
        p7XNOuok8SpvIwpFc/wZEVNHUSqySqXbZceMOq3avj32GlO3A3c8K99r0DwhvW2E
        BSrkaVj/01RYs2sYykp8f8vETqj0LaMNUv0axlWJ+4uLz0cpZ28GAg=
Received: from bobwxc.top (unknown [112.96.102.79])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHEySFrX1gn995AA--.25048S2;
        Tue, 20 Apr 2021 00:19:20 +0800 (CST)
Date:   Tue, 20 Apr 2021 00:19:17 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 2/3] docs/zh_CN: add core-api printk-basics.rst
 translation
Message-ID: <20210419161916.GA8987@bobwxc.top>
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <00c5a51380b32c894f7851015d079c1e2a5e9220.1618836460.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00c5a51380b32c894f7851015d079c1e2a5e9220.1618836460.git.siyanteng@loongson.cn>
X-Today: normal
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCHEySFrX1gn995AA--.25048S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww1kKF48Kw4UuFWfCF18Grg_yoWxCFW3pr
        n3GryxJr4UJryUXr17JryDJr1UJr18A3WUKw1vyry8Xr1UAr4UJw4Utr18JrWUGryUA34U
        JF1UJr1jyr1jvrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg0b7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r4UM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1U
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r1l42xK82IYc2
        Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZE
        Xa7IUbahF7UUUUU==
X-Originating-IP: [112.96.102.79]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 09:10:56PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/printk-basics.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/printk-basics.rst          | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/printk-basics.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
> new file mode 100644
> index 000000000000..056ca88604b2
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst
> @@ -0,0 +1,118 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../core-api/printk-basics`

As Cerbot suggested, better to use 
:Original: Documentation/core-api/printk-basics.rst

> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_printk-basics.rst:
> +
> +
> +==================
> +使用printk记录信息
> +==================

建议仔细推敲本文所有 message 翻译
信息 or 消息
不一定要统一
消息 for one sentence, short information
信息 for a long, whole information

> +
> +printk()是Linux内核中最广为人知的函数之一。它是我们打印信息的标准工具，通常也是追踪和调试
> +的最基本方法。如果你熟悉printf(3)，你就能够知道printk()是基于它的，尽管它在功能上有一些不
> +同之处。:

remove 。

> +
> +  - printk() 信息可以指定日志级别。
> +
> +  - 格式字符串虽然与C99基本兼容，但并不遵循完全相同的规范。它有一些扩展和一些限制（没
> +    有 ``%n`` 或浮点转换指定符）。参见:ref: `如何正确地获得printk格式指定符<printk-specifiers>` 。
> +

wrong indent next paragraph

> +    所有的printk()消息都会被打印到内核日志缓冲区，这是一个通过/dev/kmsg输出到用户空间的环
> +    形缓冲区。读取它的通常方法是使用 ``dmesg`` 。
> +
> +printk()的用法通常是这样的
> +
> +::

Please make a test when "::" after texts and at the begin of a line.
Do you find the ':' ?

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
> +| KERN_DEBUG     | "7"    | pr_debug() and pr_devel() 如果定义了DEBUG     |

better
（若定义了DEBUG）

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
> +你可以用以下方法检查当前的 *console_loglevel* 。::

remove 。

> +
> +  $ cat /proc/sys/kernel/printk
> +  4        4        1        7
> +
> +结果显示了 *current*, *default*, *minimum* and *boot-time-default* 日志级别

and -> 和

> +
> +要改变当前的 console_loglevel，只需在 ``/proc/sys/kernel/printk`` 中写入所需的
> +级别。例如，要打印所有的消息到控制台上::
> +
> +  # echo 8 > /proc/sys/kernel/printk
> +
> +另一种方式，使用 ``dmesg``
> +
> +::
   ^^

> +
> +  # dmesg -n 5
> +
> +设置 console_loglevel 打印 KERN_WARNING (4) 或更严重的信息到控制台。更多信息参
> +见 ``dmesg(1)`` 。
> +
> +作为printk()的替代方案，你可以使用 ``pr_*()`` 来记录日志。这个系列的宏在宏名中嵌入

``pr_*()`` 别名来记录日志

> +了日志级别。例如
> +
> +::
   ^^

> +
> +  pr_info("Info message no. %d\n", msg_num);
> +
> +打印 ``KERN_INFO`` 信息。
> +
> +除了比等效的printk()调用更简洁之外，它们还可以通过pr_fmt()宏为格式字符串使用一个通用
> +的定义。例如，在源文件的顶部（在任何 " ``#include`` " 指令之前）定义这样的内容。::

remove " "

> +
> +  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> +
> +会在该文件中的每一条 pr_*() 消息前加上发起该消息的模块和函数名称。
> +
> +为了调试的目的，还有两个有条件编译的宏：
           ^^^^^^  
为了调试，还有

> +pr_debug()和pr_devel()，除非定义了 ``DEBUG`` (或者在pr_debug()的情况下定义了
> +``CONFIG_DYNAMIC_DEBUG`` )，否则它们会被编译。
> +
> +
> +函数接口

reference

> +========
> +
> +Todolist:
> +
> +   :functions: printk
> +
> +
> +   :functions: pr_emerg pr_alert pr_crit pr_err pr_warn pr_notice pr_info
> +      pr_fmt pr_debug pr_devel pr_cont

Simply use original text, this is a kernel-doc 

> -- 
> 2.27.0

Thanks,
Wu X.C.

