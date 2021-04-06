Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94C4C43461
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4E5A613CB
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhDFQNy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 12:13:54 -0400
Received: from [43.250.32.171] ([43.250.32.171]:4936 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S232664AbhDFQNx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 12:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=8AygV2Zq9hwc4t53Y/c5WX/qC9uP4NzMTC4/7
        cqeoro=; b=dL53AZGf+PxH86RXq7ZQljsu0dAykf0geTXRfFs3tk7Dk/jD2Q5P6
        3beOuqkxpW/7seKiuSXhOI+tU7NtgEVrZ32lBM40FTrfncg8XfGZadUlGAJMSbDK
        5HxNbtbSdtccGPwO8/3l56KrflGfGmiM3NSwEP7YgTcEDCEKjuzYdQ=
Received: from bobwxc.top (unknown [112.96.109.30])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgD3atGiiGxgJ1xPAA--.46417S2;
        Wed, 07 Apr 2021 00:13:25 +0800 (CST)
Date:   Wed, 7 Apr 2021 00:13:22 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 04/11] docs/zh_CN: add core-api irq irqflags-tracing.rst
 translation
Message-ID: <20210406161250.GD15259@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-5-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406130210.2725075-5-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgD3atGiiGxgJ1xPAA--.46417S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF45XF4DuF1xuF43XrW8Zwb_yoWrAr47pF
        WkKFyfWa13ArW8ZFWxur48Ar4rAF4kWFs7Aa97J3Z3XFWkXrWjqr18KF1YyF4fuFy8Aa4j
        kF45ArWF9F15AFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUglb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04
        v7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Y
        z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
        AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
        CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVF
        xhVjvjDU0xZFpf9x07UbyCJUUUUU=
X-Originating-IP: [112.96.109.30]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 06, 2021 at 09:02:03PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/irqflags-tracing.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/irq/irqflags-tracing.rst   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
> new file mode 100644
> index 000000000000..2a3f577ac6b5
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
> @@ -0,0 +1,45 @@
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../../core-api/irq/irqflags-tracing`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_irqflags-tracing.rst:
> +
> +
> +=======================
> +IRQ-flags状态追踪
> +=======================
> +
> +:Author: 最初由Ingo Molnar <mingo@redhat.com>开始撰写
> +
> +"irq-flags tracing" 功能可以 "追踪" hardirq和softirq的状态，它让感兴趣的子

"irq-flags tracing"（中断标志追踪） ？

> +系统有机会了解到到内核中发生的每一个
> +hardirqs-off/hardirqs-on、softirqs-off/softirqs-on事件。
> +
> +CONFIG_TRACE_IRQFLAGS_SUPPORT是通用锁调试代码提供的CONFIG_PROVE_SPIN_LOCKING
> +和CONFIG_PROVE_RW_LOCKING所需要的。否则将只有CONFIG_PROVE_MUTEX_LOCKING和
> +CONFIG_PROVE_RWSEM_LOCKING在一个架构上被提供--这些都是不在IRQ上下文中使用的
> +锁API。(rwsems的一个异常是可以解决的)
> +
> +架构对这一点的支持当然不属于 "琐碎 "的范畴，因为很多低级的汇编代码都要处理irq-flags

quotation marks
“琐碎”

> +的状态变化。但是一个架构可以以一种相当直接且无风险的方式启用irq-flags-tracing。
> +
> +架构如果想支持这个，需要先做一些代码组织上的改变:
> +
> +- 在他们的arch级Kconfig文件中添加并启用TRACE_IRQFLAGS_SUPPORT。
> +
> +然后还需要做一些功能上的改变来实现对irq-flags-tracing的支持:
> +
> +- 在低级入口代码中增加(构建条件)对trace_hardirqs_off()/trace_hardirqs_on()

brackets
（构建条件）

> +  函数的调用。锁验证器会密切关注 "真实 "的irq-flags是否与 "虚拟 "的irq-flags

“真实”  “虚拟”

> +  状态相匹配，如果两者不匹配，则会大声抱怨（并关闭自己）。通常对于arch支持

大声抱怨 -> 发出警告 ？
so as followed 抱怨

> +  irq-flags-track的大部分时间都是在这种状态下度过的：看看lockdep的抱怨，试着

Maybe this is better
通常维护arch中irq-flags-track的大部分时间...

> +  找出我们还没有涉及的汇编代码。修复并重复。一旦系统启动，并且在irq-flags跟踪功

...还没有搞定的汇编代码，修复并重复。

irq-flags-tracing  check this term's translation

> +  能中没有出现lockdep抱怨的情况下，arch支持就完成了。
> +
> +- 如果该架构有不可屏蔽的中断，那么需要通过lockdep_off()/lockdep_on()将这些中
> +  断从irq跟踪[和锁验证]机制中排除。
> +

wrong indent for next paragraph

> +  一般来说，在一个架构中，不完整的irq-flags-tracing实现是没有风险的：lockdep
> +  会检测到这一点，并将自己关闭。即锁验证器仍然可靠。应该不会因为irq-tracing的错
> +  误而崩溃。(除非通过修改不该修改的条件来更改汇编或寄存器而破坏其他代码)
> -- 
> 2.27.0

