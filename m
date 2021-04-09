Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30E5C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B5C26101E
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhDIKwT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 06:52:19 -0400
Received: from [43.250.32.171] ([43.250.32.171]:64269 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231127AbhDIKwR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 06:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=+93yHsBm3iT/q+/xFVH82n8Xv9yQ3ZisVdMQp
        XMHITQ=; b=FSUHz8KMMYxJYct5iMvh8qk/wCGfzMySRkUdSlomaLsaSZa+AXbsw
        2CgRgbAFZplY77l4zXsXuw8iu3VE7nk1nEePPpLgk4o170GxFP1AorUNDsjwfuZi
        JM4lnSEl/vgwZz7c1WqCvJpWFEr45nApB+bHGDFOYXURmmHiVYeZSQ=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3KtHBMXBgz_tTAA--.58962S2;
        Fri, 09 Apr 2021 18:51:47 +0800 (CST)
Date:   Fri, 9 Apr 2021 18:51:45 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 02/11] docs/zh_CN: add core-api irq irq-affinity.rst
 translation
Message-ID: <20210409105145.GA26339@bobwxc.top>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-3-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210409091013.2493988-3-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgC3KtHBMXBgz_tTAA--.58962S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZry7ZF43Gw4kur4Uuw13CFg_yoWrGFy5pF
        47Kas3AF4xXrnrA3W7C3WYyF1qqa4xWay7G3s7Aas7Arn5Wa9rZr45Kry5GrWxGrW8Zay7
        uF4xJFy8Aryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUylb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1U
        Jr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
        14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUUTmhUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 05:10:04PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/irq-affinity.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/irq/irq-affinity.rst       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> new file mode 100644
> index 000000000000..34aaf0d1ddc2
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> @@ -0,0 +1,74 @@
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../../core-api/irq/irq-affinity`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_irq-affinity.rst:
> +
> +
> +================
> +SMP IRQ 亲和性
> +================
> +
> +变更记录:
> +	- 作者：最初由Ingo Molnar <mingo@redhat.com>开始撰写
> +	- 后期更新维护： Max Krasnyansky <maxk@qualcomm.com>
> +
> +
> +/proc/irq/IRQ#/smp_affinity和/proc/irq/IRQ#/smp_affinity_list指定了哪些CPU能
> +够关联到一个给定的IRQ源，这两个文件包含了这些指定cpu的cpu位掩码(smp_affinity)和cpu列
> +表(smp_affinity_list)。它不允许关闭所有CPU， 同时如果IRQ控制器不支持中断请求亲和
> +(IRQ affinity)，那么所有cpu的默认值将保持不变(即关联到所有CPU).
> +
> +/proc/irq/default_smp_affinity指明了适用于所有非激活IRQ的默认亲和性掩码。一旦IRQ被
> +分配/激活，它的亲和位掩码将被设置为默认掩码。然后可以如上所述改变它。默认掩码是0xffffffff。
> +
> +下面是一个先将IRQ44(eth1)限制在CPU0-3上，然后限制在CPU4-7上的例子(这是一个8CPU的SMP box)
> +
> +::
> +
> +	[root@moon 44]# cd /proc/irq/44
> +	[root@moon 44]# cat smp_affinity
> +	ffffffff
> +
> +	[root@moon 44]# echo 0f > smp_affinity
> +	[root@moon 44]# cat smp_affinity
> +	0000000f
> +	[root@moon 44]# ping -f h
> +	PING hell (195.4.7.3): 56 data bytes
> +	...
> +	--- hell ping statistics ---
> +	6029 packets transmitted, 6027 packets received, 0% packet loss
> +	round-trip min/avg/max = 0.1/0.1/0.4 ms
> +	[root@moon 44]# cat /proc/interrupts | grep 'CPU\|44:'
> +		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
> +	44:       1068       1785       1785       1783         0          0           0         0    IO-APIC-level  eth1
> +
> +从上面一行可以看出，IRQ44只传递给前四个处理器（0-3）。
> +现在让我们把这个IRQ限制在CPU(4-7)。
> +
> +::
> +
> +	[root@moon 44]# echo f0 > smp_affinity
> +	[root@moon 44]# cat smp_affinity
> +	000000f0
> +	[root@moon 44]# ping -f h
> +	PING hell (195.4.7.3): 56 data bytes
> +	..
> +	--- hell ping statistics ---
> +	2779 packets transmitted, 2777 packets received, 0% packet loss
> +	round-trip min/avg/max = 0.1/0.5/585.4 ms
> +	[root@moon 44]# cat /proc/interrupts |  'CPU\|44:'
> +		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
> +	44:       1068       1785       1785       1783      1784       1069        1070       1069   IO-APIC-level  eth1
> +
> +这次IRQ44只传递给最后四个处理器。
> +即CPU0-3的计数器没有变化。
> +
> +下面是一个将相同的irq(44)限制在cpus 1024到1031的例子：

'：' -> '::'

This is a code block.

> +
> +	[root@moon 44]# echo 1024-1031 > smp_affinity_list
> +	[root@moon 44]# cat smp_affinity_list
> +	1024-1031
> +
> +需要注意的是，如果要用位掩码来做这件事，就需要32个为0的位掩码来追踪其相关的一个。
> -- 
> 2.27.0

