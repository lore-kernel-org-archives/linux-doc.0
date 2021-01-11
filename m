Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9F3C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 03:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8609224BD
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 03:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbhAKDFl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 Jan 2021 22:05:41 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:45398 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726029AbhAKDFl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Jan 2021 22:05:41 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0ULHBoWV_1610334293;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0ULHBoWV_1610334293)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 11 Jan 2021 11:04:54 +0800
Subject: Re: [PATCH v5 4/4] doc/zh_CN: add mips ingenic-tcu.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>
Cc:     Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210109030005.1655195-1-siyanteng@loongson.cn>
 <20210109030005.1655195-4-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <7d6f0cbc-938e-5af3-60c0-617f5b88fab9@linux.alibaba.com>
Date:   Mon, 11 Jan 2021 11:04:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210109030005.1655195-4-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/1/9 上午11:00, Yanteng Si 写道:
> This patch translates Documentation/mips/ingenic-tcu.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/mips/ingenic-tcu.rst   | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/mips/ingenic-tcu.rst
> 
> diff --git a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
> new file mode 100644
> index 000000000000..06bd2627a23d
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
> +君正 JZ47xx Soc定时器/计数器硬件单元
> +===============================================
> +
> +君正 JZ47xx Soc中的定时器/计数器单元(TCU)是一个多功能硬件块。它有多达
> +8个通道，可以用作计数器，计时器，或PWM。

pulse-width modulation?  脉冲宽度调制器？

> +
> +- JZ4725B, JZ4750, JZ4755 只有６个TCU通道。其它Soc都有８个通道。
> +
> +- JZ4725B引入了一个独立的通道，称为操作系统计时器(OST)。这是一个32位可
> +  编程定时器。在JZ4760B及以上型号上，它是64位的。
> +
> +- 每个TCU通道都有自己的时钟源，可以通过 TCSR 寄存器设置通道的父级时钟
> +  源（pclk、ext、rtc）、开关以及分频。
> +
> +    - 看门狗和OST硬件模块在它们的寄存器空间中也有相同形式的TCSR寄存器。
> +    - 用于关闭/开启的 TCU 寄存器也可以关闭/开启看门狗和 OST 时钟。
> +
> +- 每个TCU通道在两种模式的其中一种模式下运行：
> +
> +    - 模式 TCU1：通道无法在睡眠模式下运行，但更易于操作。
> +    - 模式 TCU2：通道可以在睡眠模式下运行，但操作比 TCU1 通道复杂一些。
> +
> +- 每个 TCU 通道的模式取决于使用的Soc：
> +
> +    - 在最老的Soc（高于JZ4740），八个通道都运行在TCU1模式。
> +    - 在 JZ4725B，通道5运行在TCU2,其它通道则运行在TCU1。
> +    - 在最新的Soc（JZ4750及之后），通道1-2运行在TCU2，其它通道则运行
> +      在TCU1。
> +
> +- 每个通道都可以生成中断。有些通道共享一条中断线，而有些没有，其在Soc型

s/Soc/SoC/

> +  号之间的变更：
> +
> +    - 在很老的Soc（JZ4740及更低），通道0和通道1有它们自己的中断线；通
> +      道2-7共享最后一条中断线。
> +    - 在 JZ4725B，通道0有它自己的中断线；通道1-5共享一条中断线；OST
> +      使用最后一条中断线。
> +    - 在比较新的Soc（JZ4750及以后），通道5有它自己的中断线；通
> +      道0-4和（如果是8通道）6-7全部共享一条中断线；OST使用最后一条中
> +      断线。
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
> +PWM          drivers/pwm/pwm-jz4740.c
> +看门狗       drivers/watchdog/jz4740_wdt.c
> +===========  =====
> +
> +因为可以从相同的寄存器控制属于不同驱动程序和框架的TCU的各种功能，所以
> +所有这些驱动程序都通过相同的控制总线通用接口访问它们的寄存器。
> +
> +有关TCU驱动程序的设备树绑定的更多信息，请参阅:
> +Documentation/devicetree/bindings/timer/ingenic,tcu.yaml.
> 
