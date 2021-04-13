Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7337DC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 13:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43B046128C
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 13:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243298AbhDMNeU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 09:34:20 -0400
Received: from [43.250.32.171] ([43.250.32.171]:33132 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229661AbhDMNeF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=UxQeoqkiYM2SWDuiirjvU9/n0LIL8CkKtcCW6
        vKblMs=; b=Z4ipajvtbfc12+2nLG1cW0f8YwZrKQUab8bmQ3hnUqZ6OFsokuYT6
        0+kjnCHuU49pUKpHYYjww2SiGJ3RRAdFiuHHgdIejsVlpEpeCPzUomdGBGByGp00
        ej+pIeZRS6AUybm4ZxCh3WQX2curSJ8jTBC4kd/fzfouRiTRuPx7Qk=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdCsnXVgyO9aAA--.9702S2;
        Tue, 13 Apr 2021 21:33:34 +0800 (CST)
Date:   Tue, 13 Apr 2021 21:33:31 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v3 02/11] docs/zh_CN: add core-api irq irq-affinity.rst
 translation
Message-ID: <20210413133331.GA15813@bobwxc.top>
References: <20210413131237.2253955-1-siyanteng@loongson.cn>
 <20210413131237.2253955-3-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413131237.2253955-3-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdCsnXVgyO9aAA--.9702S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFyUJrWkJFy3ArWDtF1xAFb_yoWrGFW7pF
        47K3ZakF4xXrnrA3W7C3WayF1qqa4xWay7t397Aas7Arn5Wa9rZr43Kry5GrWxGrW8Zay7
        uF4xJFy0yryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgCb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCj
        c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
        CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
        MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
        4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
        vfC2KfnxnUUI43ZEXa7IUU0tC7UUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 13, 2021 at 09:12:28PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/irq-affinity.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/core-api/irq/irq-affinity.rst       | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> new file mode 100644
> index 000000000000..34aaf0d1ddc2
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> @@ -0,0 +1,76 @@
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../../core-api/irq/irq-affinity`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_irq-affinity.rst:
> +
> +
> +==============
> +SMP IRQ 亲和性
> +==============
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
> +下面是一个将相同的irq(44)限制在cpus 1024到1031的例子
> +
> +::
> +
> +	[root@moon 44]# echo 1024-1031 > smp_affinity_list
> +	[root@moon 44]# cat smp_affinity_list
> +	1024-1031
> +
> +需要注意的是，如果要用位掩码来做这件事，就需要32个为0的位掩码来追踪其相关的一个。
> -- 
> 2.27.0

