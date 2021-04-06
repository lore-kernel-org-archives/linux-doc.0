Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E68C433ED
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 15:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6682761246
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 15:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345523AbhDFPMn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 11:12:43 -0400
Received: from m32-153.88.com ([43.250.32.153]:64205 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233155AbhDFPMn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 11:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=kBgu/ltT2bKtr2/0E3wnOALLeDuLO2auoh8UR
        qCm81k=; b=RJD6+BD9WOtMN1gr/Rhf32YPJIor5hjLqcqCu6BcEFSoMERMOV78Q
        xP3ixaXSwbri06C4gHbMzjUPyjQg31uDa2Xn0W8sHE/h1sS8ebMhUb99q8wrMCqy
        Eym0i4hKL3qFreuoGLn8EZoQo7QuGaPM0sz/m3E8LdnQFxLb1WhKvo=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAnsyNVemxgGvZfAA--.26569S2;
        Tue, 06 Apr 2021 23:12:23 +0800 (CST)
Date:   Tue, 6 Apr 2021 23:12:21 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 01/11] docs/zh_CN: add core-api irq concepts.rst
 translation
Message-ID: <20210406151220.GA15259@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-2-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406130210.2725075-2-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAnsyNVemxgGvZfAA--.26569S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrur1xuw1xtF4kJFykAFb_yoW8uF1DpF
        Z7KF93J3WfZFy3uF97Kry2qr98AFW8WanFkws2qF13tryktrWDtr4jkF98X3yxGryvyFy0
        vF4rKry8Cr1Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyvb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_XrWl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1U
        JwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
        xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUjxu4UUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 06, 2021 at 09:02:00PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/concepts.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/irq/concepts.rst           | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/concepts.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/concepts.rst b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
> new file mode 100644
> index 000000000000..b8b98a196a5d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
> @@ -0,0 +1,24 @@
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../../core-api/irq/concepts`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_concepts.rst:
> +
> +
> +===============
> +什么是IRQ？
> +===============
> +
> +一个来自设备的中断请求就是一个IRQ。

Maybe this better?

IRQ（Interrupt ReQuest）指来自设备的中断请求

> +目前，它们可以通过一个引脚或通过一个数据包进入。
> +多个设备可以连接到同一个引脚，从而共享一个IRQ。
> +
> +IRQ编号是用来描述硬件中断源的内核标识符。通常它是一个到全局irq_desc数组的索引，
> +但是除了在linux/interrupt.h中实现的之外，其它细节是体系结构特征相关的。
> +
> +IRQ编号是对机器上可能的中断源的枚举。通常枚举的是系统中所有中断控制器的输入引脚
> +编号。在ISA（工业标准体系结构）的情况下所枚举的是两个i8259中断控制器的16个输入引脚。
> +
> +体系结构可以给IRQ号赋予额外的含义，在涉及到硬件手动配置的情况下，我们鼓励这样做。
> +ISA IRQ是赋予这种额外含义的一个典型例子。
> -- 
> 2.27.0

