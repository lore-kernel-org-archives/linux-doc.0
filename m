Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2424CC43460
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 15:36:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA2F8613A0
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 15:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243744AbhDFPgU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 11:36:20 -0400
Received: from [43.250.32.171] ([43.250.32.171]:62305 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S243891AbhDFPfb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 11:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=6iURr3Zo0D0Pm1JJKWAKYjPFOE2qQH4H6xXLf
        QFCOxQ=; b=asP6mGoIZ5kPUXkRxlt2Tw3zPJcDGuPBWHONHTqQOTD2SKLy+HwKu
        UhAFSnjAOEw65JuKOUxEzihqjacvajk9B5Zy68PMVsFR9FmJiofAWVsBVXc4Sf7D
        JdSv0127An6JAi6LF3lFll2nQAej6NejT9CtwXCTmymcHyOUhOwUoo=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnWdCpf2xgQ1JPAA--.46265S2;
        Tue, 06 Apr 2021 23:35:07 +0800 (CST)
Date:   Tue, 6 Apr 2021 23:35:05 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 02/11] docs/zh_CN: add core-api irq irq-affinity.rst
 translation
Message-ID: <20210406153505.GC15259@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-3-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406130210.2725075-3-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnWdCpf2xgQ1JPAA--.46265S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1xXF4rKr1ktFWUZFyDtrb_yoWrGrW5pF
        47Kas3Ca1xXrnrAF17C3WYyr1qqFyxWay7A397Aas7Arn5WwsrZr43Kry5GrWxGFW0va47
        uFs7JFW0yryjyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUymb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_XrWl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1U
        JwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
        xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UIFAJUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 06, 2021 at 09:02:01PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/irq-affinity.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/irq/irq-affinity.rst       | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> new file mode 100644
> index 000000000000..34aaf0d1ddc2
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> @@ -0,0 +1,73 @@
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
> +/proc/irq/IRQ#/smp_affinity和/proc/irq/IRQ#/smp_affinity_list指明了给定IRQ源
> +允许哪些目标CPU使用。它是被允许的CPU的位掩码(smp_affinity)或cpu列表(smp_affinity_list)。
> +它不允许关闭所有的CPU，如果一个IRQ控制器不支持IRQ亲和性，那么所有cpu的默认值将不会发生

关闭 -> 禁止？

> +变化。
> +
> +/proc/irq/default_smp_affinity指明了适用于所有非激活IRQ的默认亲和性掩码。一旦IRQ被
> +分配/激活，它的亲和位掩码将被设置为默认掩码。然后可以如上所述改变它。默认掩码是0xffffffffff。

0xffffffff
eight f

> +
> +下面是一个先将IRQ44(eth1)限制在CPU0-3上，然后限制在CPU4-7上的例子(这是一个8CPU的SMP box)
a empty line
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
> +下面是一个将相同的irq(44)限制在cpus 1024到1031的例子：。
                                                       ^^^
                                             ： ->     ::

> +
> +	[root@moon 44]# echo 1024-1031 > smp_affinity_list
> +	[root@moon 44]# cat smp_affinity_list
> +	1024-1031
> +
> +需要注意的是，如果要用位掩码来做这件事，就需要32个为0的位掩码来追踪其相关的一个。
> -- 
> 2.27.0

