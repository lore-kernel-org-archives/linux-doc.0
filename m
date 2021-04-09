Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1,WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187F8C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E20D0610CF
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhDIK4B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 06:56:01 -0400
Received: from m32-153.88.com ([43.250.32.153]:24762 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232087AbhDIK4A (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 06:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=5clu9rQUIEx8TjMzlhlkj/kxUtfk4TA/CIwfR
        +lMFlk=; b=OiQ5gAC/DHsd7a2CVK44oZxYP90slwqaH3TI1W954ynEJjrE9dm+C
        yS/46FKzcoy+0i6zNxGn3CAMvQDWFPp1hmkFXZnIoIoNIKzS1O5sEmlR+9jAXhS/
        0Or6AL/ZOC86De/Va1hvjqGGDRXpc+ckDYrFvr2TWzL6DyuY3H6Wzs=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAnsyOoMnBgLlllAA--.40050S2;
        Fri, 09 Apr 2021 18:55:38 +0800 (CST)
Date:   Fri, 9 Apr 2021 18:55:36 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 04/11] docs/zh_CN: add core-api irq
 irqflags-tracing.rst translation
Message-ID: <20210409105536.GB26339@bobwxc.top>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-5-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210409091013.2493988-5-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAnsyOoMnBgLlllAA--.40050S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF45XF4DuF1xuF43XrW8Zwb_yoWrGF1kpF
        WvkFyfGa1fArWUZFWxur48Aw4rJF48WFWxAws7J3Z3XFZ5XrWjyr48KFn0vr4fuFy8A3yU
        tFs3ArWF9F15AFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUylb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1U
        Jr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
        14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUUl1vUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 05:10:06PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/irqflags-tracing.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

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
> +“irq-flags tracing”（中断标志追踪）功能可以 “追踪” hardirq和softirq的状态，它让
> +感兴趣的子系统有机会了解到到内核中发生的每一个
> +hardirqs-off/hardirqs-on、softirqs-off/softirqs-on事件。
> +
> +CONFIG_TRACE_IRQFLAGS_SUPPORT是通用锁调试代码提供的CONFIG_PROVE_SPIN_LOCKING
> +和CONFIG_PROVE_RW_LOCKING所需要的。否则将只有CONFIG_PROVE_MUTEX_LOCKING和
> +CONFIG_PROVE_RWSEM_LOCKING在一个架构上被提供--这些都是不在IRQ上下文中使用的
> +锁API。（rwsems的一个异常是可以解决的）
> +
> +架构对这一点的支持当然不属于“微不足道”的范畴，因为很多低级的汇编代码都要处理irq-flags
> +的状态变化。但是一个架构可以以一种相当直接且无风险的方式启用irq-flags-tracing。
> +
> +架构如果想支持这个，需要先做一些代码组织上的改变:
> +
> +- 在他们的arch级Kconfig文件中添加并启用TRACE_IRQFLAGS_SUPPORT。
> +
> +然后还需要做一些功能上的改变来实现对irq-flags-tracing的支持:
> +
> +- 在低级入口代码中增加（构建条件）对trace_hardirqs_off()/trace_hardirqs_on()
> +  函数的调用。锁验证器会密切关注 “real”的irq-flags是否与 “virtual”的irq-flags
> +  状态相匹配，如果两者不匹配，则会发出警告（并关闭自己）。通常维护arch中
> +  irq-flags-track的大部分时间都是在这种状态下度过的：看看lockdep的警告，试着
> +  找出我们还没有搞定的汇编代码。修复并重复。一旦系统启动，并且在irq-flags跟踪功
> +  能中没有出现lockdep警告的情况下，arch支持就完成了。
> +
> +- 如果该架构有不可屏蔽的中断，那么需要通过lockdep_off()/lockdep_on()将这些中
> +  断从irq跟踪[和锁验证]机制中排除。
> +
> + 一般来说，在一个架构中，不完整的irq-flags-tracing实现是没有风险的：lockdep
> + 会检测到这一点，并将自己关闭。即锁验证器仍然可靠。应该不会因为irq-tracing的错
> + 误而崩溃。（除非通过修改不该修改的条件来更改汇编或寄存器而破坏其他代码）
> -- 
> 2.27.0

