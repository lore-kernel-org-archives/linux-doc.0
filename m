Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ECEC43460
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 15:13:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EAFA60725
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 15:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbhD2POR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 11:14:17 -0400
Received: from [43.250.32.171] ([43.250.32.171]:36694 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S232556AbhD2POQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Apr 2021 11:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=WROi8u42aP5Ckz5ovVaGJyhamQbs0KVpTVn78
        jzOQXU=; b=f7ZEEv0SK2MU7bwnaYoJ4Q3hnKyJRAsXEZ7x3wU/hx3nWksZcXvqj
        8FbSKfomIFHddgvzp2h3Vju7EofOtVeFWtWq3InK/vNDLnsBWYbuUQT0aEead1jR
        XysSzC4WKoW0pZ9iGgVfkTugV0+7yxlBBmcFCBA3Hoqt733y6rPaUU=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAHz0EOzYpg2wgRAA--.44620S2;
        Thu, 29 Apr 2021 23:13:20 +0800 (CST)
Date:   Thu, 29 Apr 2021 23:13:18 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH 2/3] docs/zh_CN: add parisc debugging.rst translation
Message-ID: <20210429151318.GB23087@bobwxc.top>
References: <cover.1619665430.git.siyanteng@loongson.cn>
 <17f17ca148a9fd315340294f19cefbc80732336c.1619665430.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17f17ca148a9fd315340294f19cefbc80732336c.1619665430.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAHz0EOzYpg2wgRAA--.44620S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFW3Cr15ZryUWw45CFyDWrg_yoWrXFWxpa
        97KryfGa1xAry2y34fKr1Ig34fC3WxGFZ7G3WIy3W5trn5GrW5t34Dt34YkFs3Wrn7AFWU
        AF45KryUC34jkw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUU
        UUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 29, 2021 at 11:33:34AM +0800, Yanteng Si wrote:
> This translates Documentation/parisc/debugging.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/parisc/debugging.rst   | 41 +++++++++++++++++++
>  .../translations/zh_CN/parisc/index.rst       |  6 ++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst
> 
> diff --git a/Documentation/translations/zh_CN/parisc/debugging.rst b/Documentation/translations/zh_CN/parisc/debugging.rst
> new file mode 100644
> index 000000000000..99af303fd3d8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/parisc/debugging.rst
> @@ -0,0 +1,41 @@
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
> +好吧，这里有一些关于调试linux/parisc的低级（偏硬件）部分的提示。

maybe
较底层部分的信息。
depend on your choice

> +
> +
> +1. 绝对地址
> +=====================
> +
> +很多汇编代码目前是以实模式运行的，这意味着绝对地址被使用，而不是像内核其他

很多汇编代码目前运行在实模式下，这意味着会使用绝对地址，而不是像内核其他

> +部分那样使用虚拟地址。要将绝对地址转换为虚拟地址，你可以在System.map中查
> +找，添加__PAGE_OFFSET（目前是0x10000000）。
> +
> +
> +2. HPMCs
> +========
> +

high priority machine check

> +当实模式的代码试图访问不存在的内存时，你会得到一个HPMC，而不是一个内核opps。

会出现HPMC而不是内核oops。

> +为了调试HPMC，尝试找到系统响应者/请求者地址。系统请求者地址应该与处理器的

要调试HPMC，请尝试……

（某）处理器

s/响应者/响应程序/g
s/请求者/请求程序/g
replace all

> +HPA（I/O范围内的高地址）相匹配；系统响应者地址是实模式代码试图访问的地址。
> +
> +系统响应者地址的典型值是大于__PAGE_OFFSET （0x10000000）的地址，这意味着
> +在实际模式代码试图访问它之前，一个虚拟地址没有被翻译成一个物理地址。

在实模式试图访问它之前，虚拟地址没有被翻译成物理地址。

> +
> +
> +3. 有趣的Q位
> +============
> +
> +某些非常关键的代码必须清除PSW中的Q位。当Q位被清除时，CPU不会更新中断处理
> +程序所读取的寄存器，以找出机器被中断的位置——所以如果你在清除Q位的指令和再
> +次设置Q位的RFI之间遇到中断，你不知道它到底发生在哪里。如果你幸运的话，IAOQ
> +会指向清除Q位的指令，如果你不幸运的话，它会指向任何地方。通常Q位的问题会
> +表现在无法解释的系统挂起或运行到物理内存的末端。

How about 表现为无法解释的系统挂起或物理内存越界。

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

Thanks

Wu X.C.

