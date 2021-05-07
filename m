Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C68C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 14:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5115761075
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 14:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbhEGOvL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 10:51:11 -0400
Received: from m32-153.88.com ([43.250.32.153]:43373 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234601AbhEGOvL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 10:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=dTaFc5AVci9sPI1hNh8uc79ZMqZ1xJce4z8Yd
        UOyLSE=; b=WaxquxhV9XlAojIlUwYVKqdRhcIx60WxZFiBBnI+IIlHC8ENU+DLn
        mLJaNDTEYdI6vkazZHne3DmA7F7MN/URI/9nmtWqyXiuWfUeftjJI4lbH65e7Orp
        HHjrOAIYslQkbyMwGfdpGZTGr+u/NeFIspJR5O1LXcUN1czHmYp56o=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgC3BViRU5Vg3hYjAA--.65426S2;
        Fri, 07 May 2021 22:49:55 +0800 (CST)
Date:   Fri, 7 May 2021 22:49:52 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH v2 2/3] docs/zh_CN: add parisc debugging.rst translation
Message-ID: <20210507144952.GA31836@bobwxc.top>
References: <cover.1620284974.git.siyanteng@loongson.cn>
 <cacc2de08ff0fee5f8aedb6ee53abf1637da3189.1620284974.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cacc2de08ff0fee5f8aedb6ee53abf1637da3189.1620284974.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgC3BViRU5Vg3hYjAA--.65426S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFW3KF13Zw4fWFy8Wr4xtFb_yoW5tryUpa
        s7KryfGa1xAry2yw1fKr1xWryfCF4xGFZ7Ga4Iv3W5trn5JFZ8tw1Dt34YkFs7Wrn7AFWU
        AF4akryjkryjyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUU3rc3UU
        UUU==
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 07, 2021 at 06:07:04PM +0800, Yanteng Si wrote:
> This translates Documentation/parisc/debugging.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/parisc/debugging.rst   | 42 +++++++++++++++++++
>  .../translations/zh_CN/parisc/index.rst       |  6 ++-
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst
> 
> diff --git a/Documentation/translations/zh_CN/parisc/debugging.rst b/Documentation/translations/zh_CN/parisc/debugging.rst
> new file mode 100644
> index 000000000000..c21beb986e15
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/parisc/debugging.rst
> @@ -0,0 +1,42 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/parisc/debugging.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_parisc_debugging:
> +
> +=================
> +调试PA-RISC
> +=================
> +
> +好吧，这里有一些关于调试linux/parisc的较底层部分的信息。
> +
> +
> +1. 绝对地址
> +=====================
> +
> +很多汇编代码目前运行在实模式下，这意味着会使用绝对地址，而不是像内核其他
> +部分那样使用虚拟地址。要将绝对地址转换为虚拟地址，你可以在System.map中查
> +找，添加__PAGE_OFFSET（目前是0x10000000）。
> +
> +
> +2. HPMCs
> +========
> +
> +当实模式的代码试图访问不存在的内存时，会出现HPMC（high priority machine
> +check）而不是内核oops。若要调试HPMC，请尝试找到系统响应程序/请求程序地址。
> +系统请求程序地址应该与（某）处理器的HPA（I/O范围内的高地址）相匹配；系统响应程
> +序地址是实模式代码试图访问的地址。
> +
> +系统响应程序地址的典型值是大于__PAGE_OFFSET （0x10000000）的地址，这意味着
> +在实模式试图访问它之前，虚拟地址没有被翻译成物理地址。
> +
> +
> +3. 有趣的Q位
> +============
> +
> +某些非常关键的代码必须清除PSW中的Q位。当Q位被清除时，CPU不会更新中断处理
> +程序所读取的寄存器，以找出机器被中断的位置——所以如果你在清除Q位的指令和再
> +次设置Q位的RFI之间遇到中断，你不知道它到底发生在哪里。如果你幸运的话，IAOQ
> +会指向清除Q位的指令，如果你不幸运的话，它会指向任何地方。通常Q位的问题会
> +表现为无法解释的系统挂起或物理内存越界。
> diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
> index ef232d46b1ba..b913d664e735 100644
> --- a/Documentation/translations/zh_CN/parisc/index.rst
> +++ b/Documentation/translations/zh_CN/parisc/index.rst
> @@ -10,9 +10,13 @@
>  PA-RISC体系架构
>  ====================
>  
> -Todolist:
> +.. toctree::
> +   :maxdepth: 2
>  
>     debugging
> +
> +Todolist:
> +
>     registers
>     features
>  
> -- 
> 2.27.0

