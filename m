Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995ADC433E0
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 11:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48675239A1
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 11:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbhAHL0T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jan 2021 06:26:19 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:60489 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725817AbhAHL0T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jan 2021 06:26:19 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id EC087580758;
        Fri,  8 Jan 2021 06:25:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 08 Jan 2021 06:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=S
        M8YMdNxd6smOgiQlWaab/WeI43bDREOgxHd7iPz9eQ=; b=0VVawrYILN7miJx8K
        1vSViLEsJAynTrabsP7qlHbcGh+vdsLUysdPXVwdRZ4XasTSvcEIGjG9Y4jeaHUj
        X33ETfCLN82L+7V+xmNjcBN6t6kEbAlIiR09ETUeZHTN85a4vmy/y60/FdlSQhrU
        6NxH85B9+IKaHaxprvUEErJrjQx3u3tDlbZ3JwlfVYe63urDpaPG++RsDAz79cFi
        wImA+EjY+p1LEonX9pLkpCQSRnphrLjenctnTpbSLD9F9Z8oG4w+7GW3ljucC/kC
        /J7Yxgb49MiYKtUxPCjOMH0do7TEka4GX4fD2lFPukg9Lxh+Xk4Gow1YpXBf3GqQ
        cD3ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=SM8YMdNxd6smOgiQlWaab/WeI43bDREOgxHd7iPz9
        eQ=; b=LVK2lQY4ucnGOZSnt9kW5MCuIkcXvOl05A/kKFzh9bE1JkLoeH3wtZFiP
        dlMv3RQGCEXY/bd+VVi81b9L6G5Y4eFoqkxJgzL+2bj7qzKRiCmOAOEaaa3pcNPg
        kn5YWQdT1YX/rO3RUCdEIWugQ19kD18qVhK2vjigFBMOR91dRlHfZKqndp2RqGxn
        WLb7ygGbh2j5Y9ySMVOA+hLGgX9VZE61743i6Ce/TyqsX8rF4eKfkQDGWn7/CPrS
        zwnSd6c9vDQaA0CkC6hXs3EsImIiS5cxMXWdmTrIgflTpqcFx1mC3UUuniNOAnIz
        HPAMvL/uejoDUPT/Tuk+Q/BY7mQdA==
X-ME-Sender: <xms:KUH4Xzk2jZEVmJcwYnc0jvKtuy0VSQGvDsdWpcStu7qPqgDpBNrc6A>
    <xme:KUH4X2zN2KpOgabh5ttlh5DRPt4vTy_7uLXp_kR91ngo3X34IHSryTsjq4aZB3lb-
    WmO_xf_Wfq6jSQ94YI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:KUH4X2h0ky-maeYu57mzzFGlxybzYBHYB48ROnGyiL3X9htEpMTqJg>
    <xmx:KUH4XzXt6P1eHCnEswaMlU9EgErx_fCsK4ZKaya1ptqP79CiaaG1IA>
    <xmx:KUH4Xw2nJRM8CKPJ-v4rYnC-hT5rfQ3Mj5ni8_qpXHyERRksRI2TDw>
    <xmx:K0H4X_b7x8s_LEOXMsvcOvl8LujEA2sAU_VxXG6n4L2ttwdt_3oSNw>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id CCEB7240064;
        Fri,  8 Jan 2021 06:25:25 -0500 (EST)
Subject: Re: [PATCH v4 4/4] doc/zh_CN: add mips ingenic-tcu.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>
References: <20210108100221.1370763-1-siyanteng@loongson.cn>
 <20210108100221.1370763-4-siyanteng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <6b6dd58a-0f59-c8c3-2a7a-8ee7c866a970@flygoat.com>
Date:   Fri, 8 Jan 2021 19:25:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108100221.1370763-4-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

在 2021/1/8 下午6:02, Yanteng Si 写道:
> This patch translates Documentation/mips/ingenic-tcu.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>   .../translations/zh_CN/mips/ingenic-tcu.rst   | 69 +++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/mips/ingenic-tcu.rst
>
> diff --git a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
> new file mode 100644
> index 000000000000..9a8c5504b61f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
> @@ -0,0 +1,69 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :ref:`Documentation/mips/ingenic-tcu.rst <ingenic-tcu>`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_ingenic-tcu:
> +
> +===============================================
> +君正 JZ47xx 系统级芯片定时器/计数器硬件单元
> +===============================================

+ Yanjie as Ingenic expert.

Hi Yanteng,

I think SoC shouldn't be translated as it is a common sense.

> +
> +君正 JZ47xx 系统级芯片中的定时器/计数器单元(TCU)是一个多功能硬件块。它
> +有多达8个通道，可以用作计数器，计时器，或PWM。
> +
> +- JZ4725B, JZ4750, JZ4755 只有６个TCU通道。其它系统级芯片都有８个通道。

Ditto.

> +
> +- JZ4725B引入了一个独立的通道，称为操作系统计时器(OST)。这是一个32位可
> +  编程定时器。在JZ4760B及以上型号上，它是64位的。
> +
> +- 每个TCU通道有自己的时钟，可以通过 TCSR 寄存器重新设置到三个不同的时
> +  钟（pclk、ext、rtc）、门控和时钟恢复。

Maybe
每个TCU通道都有自己的时钟源，可以通过 TCSR 寄存器设置通道的父级
时钟源 (pclk, ext, rtc), 开关以及分频。



> +
> +    - 看门狗和OST硬件模块在它们的寄存器空间中也有相同形式的TCSR寄存器。
> +    - 用于堵塞/连通的 TCU 寄存器也可以堵塞/连通看门狗和 OST 时钟。

阻塞->关闭
联通->开启
?

> +
> +- 每个TCU通道在两种模式的其中一种模式下运行：
> +
> +    - 模式 TCU1：通道无法在睡眠模式下运行，但更易于操作。
> +    - 模式 TCU2：通道可以在睡眠模式下运行，但操作比 TCU1 通道复杂一些。
> +
> +- 每个 TCU 通道的模式取决于使用的系统级芯片：
> +
> +    - 在最老的系统级芯片（高于JZ4740），八个通道都运行在TCU1模式。
> +    - 在 JZ4725B，通道5运行在TCU2,其它通道则运行在TCU1。
> +    - 在最新的系统级芯片（JZ4750及之后），通道1-2运行在TCU2，其它通道
> +      则运行在TCU1。
> +
> +- 每个通道可以生成中断。有些通道共享一条中断线路，而有些没有，其在系统
> +  级芯片版本之间的变更：

"版本" seems bogus to me. Although original text is "version" but probably 
"型号"
is much more fit?

I'd prefer call it "中断线" instead of “中断线路” as it is not a physical 
circuit.

> +
> +    - 在很老的系统级芯片（JZ4740及更低），通道0和通道1有它们自己的中断
> +      线路；通道2-7共享最后一条中断线路。
> +    - 在 JZ4725B，通道0有它自己的中断线路；通道1-5共享一条中断线路；OST
> +      使用最后一条中断线路。
> +    - 在比较新的系统级芯片（JZ4750及以后），通道5有它自己的中断线路；通
> +      道0-4和（如果是8通道）6-7全部共享一条中断线路；OST使用最后一条中
> +      断线路。
> +
> +实现
> +====
> +
> +TCU硬件的功能分布在多个驱动程序：
> +
> +===========  =====
> +时钟         drivers/clk/ingenic/tcu.c
> +中断         drivers/irqchip/irq-ingenic-tcu.c
> +定时器       drivers/clocksource/ingenic-timer.c
> +OST          drivers/clocksource/ingenic-ost.c
晶振？

Thanks.

- Jiaxun
> +PWM          drivers/pwm/pwm-jz4740.c
> +看门狗       drivers/watchdog/jz4740_wdt.c
> +===========  =====
> +
> +因为可以从相同的寄存器控制属于不同驱动程序和框架的TCU的各种功能，所以
> +所有这些驱动程序都通过相同的控制总线通用接口访问它们的寄存器。
> +
> +有关TCU驱动程序的设备树绑定的更多信息，请参阅:
> +Documentation/devicetree/bindings/timer/ingenic,tcu.yaml.

