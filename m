Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D20C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E308611CA
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhDIKMO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 06:12:14 -0400
Received: from [43.250.32.171] ([43.250.32.171]:60393 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S234234AbhDIKKb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 06:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=haVOTU1t0tTnKlS9TDN/FSY8IfsAZEK2CJ2Pd
        f0IyH0=; b=REAj+zwFtiWv2ZR2eR3StFBpyEQDiX1zsFrYrN01cOr668qGlilgO
        P1+3+E243EMpPPK2tbZ3QJXhwR6++RoQXUjKXrvnBdgxFdV5RgvgPxNCe9Ko8uSS
        w9CMV3M5fhND40MxyVCq1bVdS8H4UyAydhYAjK9ymPxOcw9YxvhkyU=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB36c_0J3BgNu9TAA--.57017S2;
        Fri, 09 Apr 2021 18:09:58 +0800 (CST)
Date:   Fri, 9 Apr 2021 18:09:55 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 01/11] docs/zh_CN: add core-api irq concepts.rst
 translation
Message-ID: <20210409100955.GA22786@bobwxc.top>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-2-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210409091013.2493988-2-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB36c_0J3BgNu9TAA--.57017S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrur1xuw1xtF4kJFykAFb_yoW8ury8pF
        WktF93J3WfZFy7CF97Gry2qr98Aay8WanFkws2vF1ftr1ktrWDtr4jkF98W3yfGryvyFy0
        vF4YkFW8Cr1Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUylb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2
        IY04v7MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4U
        Jr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
        xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
        jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
        0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
        67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUUl1vUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 05:10:03PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/concepts.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

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
> +IRQ (Interrupt ReQuest) 指来自设备的中断请求。
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

