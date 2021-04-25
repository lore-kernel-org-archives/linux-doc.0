Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CDAC433ED
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 14:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E071B61075
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 14:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhDYOGQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Apr 2021 10:06:16 -0400
Received: from m32-153.88.com ([43.250.32.153]:32325 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229837AbhDYOGQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Apr 2021 10:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=aheCCRv2OSqY+oaA6fuebKsksK7pKIT3ysYNH
        dWupAE=; b=j+qse780z29HDQxvhSYigmiJwb84MZHBiFx85NCATpnmsNgN0ECjr
        /kNDwpnDCl4dlqxOyVdlVBomqYzBZnQE+UDri7JcVbwkgvhkGuMne45VIVzweQ27
        lwIPjHC9jJlfA4FIFxqI2VFjkeSPk0e5ZUESYkkPu8WocSKecB+3lI=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHVlgbd4VgcYMKAA--.28671S2;
        Sun, 25 Apr 2021 22:05:18 +0800 (CST)
Date:   Sun, 25 Apr 2021 22:05:15 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com, willy@infradead.org
Subject: Re: [PATCH v2 2/3] docs/zh_CN: add core-api printk-basics.rst
 translation
Message-ID: <20210425140515.GB7007@bobwxc.top>
References: <cover.1619317151.git.siyanteng@loongson.cn>
 <ba5b6fba29916887a413cc7cf7a4234f696ee37c.1619317151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba5b6fba29916887a413cc7cf7a4234f696ee37c.1619317151.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHVlgbd4VgcYMKAA--.28671S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw43Wry5AF4ruF15WFW3KFg_yoWxZr13pr
        n3GryxJF4UJryUXr17JFyDJr1UJr18A3WDKw1vyry0qr1UAr4UJw4UJr1rJrWUGryUA34U
        JF1DJr1jyr10vrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyqb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1U
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
        1lc2xSY4AK67AK6ry5MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l
        4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
        AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
        cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
        8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
        6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUbVyIUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 25, 2021 at 11:35:40AM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/printk-basics.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

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
> -- 
> 2.27.0

