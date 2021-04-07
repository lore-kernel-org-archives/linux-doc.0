Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A99C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D992561007
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346124AbhDGHEg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:04:36 -0400
Received: from [43.250.32.171] ([43.250.32.171]:23207 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346051AbhDGHEf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=w4xKxlquTmIy+mjc7I5SPByN7GARfIwip0xtO
        UTf3GQ=; b=OZ/1nnmajYeTAfusYRKWy/7oVtpVG//Q12JwWBnqEuwMkhbPeNR9M
        DIxNMTFcdfD7YEhJA4UkRNtFWbE/DwWIBoifOxmNmj2I7gS0BHJcdRhTB+XW1s7+
        H+NMkvMngwZ4BTa2NVDysW00iJnMO6fvC4b7Vn4jxGfhSJvCcjojTM=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3qtBsWW1ggVJQAA--.48711S2;
        Wed, 07 Apr 2021 15:04:14 +0800 (CST)
Date:   Wed, 7 Apr 2021 15:04:12 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Subject: Re: [PATCH 02/11] docs/zh_CN: add core-api irq irq-affinity.rst
 translation
Message-ID: <20210407070412.GC23907@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-3-siyanteng@loongson.cn>
 <20210406153505.GC15259@bobwxc.top>
 <CAEensMxkgSauL9SFiiY1-E8dWHj9AuBGyGFf52Bc0F0cd4FAtA@mail.gmail.com>
 <20210407045907.GA20005@bobwxc.top>
 <CAEensMwoGc7DbENCyW_81HQ7-MGB3J6RMXKQCYt6gxLv0yx+Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEensMwoGc7DbENCyW_81HQ7-MGB3J6RMXKQCYt6gxLv0yx+Tg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgA3qtBsWW1ggVJQAA--.48711S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4fJF48Ww1rAry7KrW7Arb_yoW7Cw15pr
        4jg3ZYyF47Jr1DAr17Kw1YvrnFqa4xX3y7X3s7Kas7Ar1q9FsrZr45try5Gr1xGrW8Za47
        ZF47Jr4xAr15AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyGb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1U
        Jr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
        14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IUUHKZJUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 07, 2021 at 02:59:22PM +0800, yanteng si wrote:
> Wu X.C. <bobwxc@email.cn> 于2021年4月7日周三 下午12:59写道：
> >
> > On Wed, Apr 07, 2021 at 10:08:38AM +0800, yanteng si wrote:
> > > Wu X.C. <bobwxc@email.cn> 于2021年4月6日周二 下午11:35写道：
> > > >
> > > > On Tue, Apr 06, 2021 at 09:02:01PM +0800, Yanteng Si wrote:
> > > > > This patch translates Documentation/core-api/irq/irq-affinity.rst into Chinese.
> > > > >
> > > > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > > > ---
> > > > >  .../zh_CN/core-api/irq/irq-affinity.rst       | 73 +++++++++++++++++++
> > > > >  1 file changed, 73 insertions(+)
> > > > >  create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> > > > >
> > > > > diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> > > > > new file mode 100644
> > > > > index 000000000000..34aaf0d1ddc2
> > > > > --- /dev/null
> > > > > +++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> > > > > @@ -0,0 +1,73 @@
> > > > > +.. include:: ../../disclaimer-zh_CN.rst
> > > > > +
> > > > > +:Original: :doc:`../../../../core-api/irq/irq-affinity`
> > > > > +:Translator: Yanteng Si <siyanteng@loongson.cn>
> > > > > +
> > > > > +.. _cn_irq-affinity.rst:
> > > > > +
> > > > > +
> > > > > +================
> > > > > +SMP IRQ 亲和性
> > > > > +================
> > > > > +
> > > > > +变更记录:
> > > > > +     - 作者：最初由Ingo Molnar <mingo@redhat.com>开始撰写
> > > > > +     - 后期更新维护： Max Krasnyansky <maxk@qualcomm.com>
> > > > > +
> > > > > +
> > > > > +/proc/irq/IRQ#/smp_affinity和/proc/irq/IRQ#/smp_affinity_list指明了给定IRQ源
> > > > > +允许哪些目标CPU使用。它是被允许的CPU的位掩码(smp_affinity)或cpu列表(smp_affinity_list)。
> > > > > +它不允许关闭所有的CPU，如果一个IRQ控制器不支持IRQ亲和性，那么所有cpu的默认值将不会发生
> > > >
> > > > 关闭 -> 禁止？
> > > emmmmm……
> > > I looked up the English-Chinese dictionary：turn off -> 关闭，关掉电器、水龙头……
> > > maybe：不允许关闭 -> 禁止关闭？
> >
> > 我是想着是不是要跟前面的“允许”目标CPU使用对应
> > Both ok, choose the one you pefer
> >
> > Thanks!
> >
> emmmmm……
> The previous translation was a bit obscure and I did some optimization：
> 
> /proc/irq/IRQ#/smp_affinity和/proc/irq/IRQ#/smp_affinity_list指定了哪些CPU能
> 够关联到一个给定的IRQ源，这两个文件包含了这些指定cpu的cpu位掩码(smp_affinity)和cpu列
> 表(smp_affinity_list)。它不允许关闭所有CPU， 同时如果IRQ控制器不支持中断请求亲和
> (IRQ affinity)，那么所有cpu的默认值将保持不变(既关联到所有CPU)。

Look good to me.

Wu X.C.

> 
> 
> > > >
> > > > > +变化。
> > > > > +
> > > > > +/proc/irq/default_smp_affinity指明了适用于所有非激活IRQ的默认亲和性掩码。一旦IRQ被
> > > > > +分配/激活，它的亲和位掩码将被设置为默认掩码。然后可以如上所述改变它。默认掩码是0xffffffffff。
> > > >
> > > > 0xffffffff
> > > > eight f
> > > >
> > > OK!
> > > > > +
> > > > > +下面是一个先将IRQ44(eth1)限制在CPU0-3上，然后限制在CPU4-7上的例子(这是一个8CPU的SMP box)
> > > > a empty line
> > > OK!
> > > > > +::
> > > > > +
> > > > > +     [root@moon 44]# cd /proc/irq/44
> > > > > +     [root@moon 44]# cat smp_affinity
> > > > > +     ffffffff
> > > > > +
> > > > > +     [root@moon 44]# echo 0f > smp_affinity
> > > > > +     [root@moon 44]# cat smp_affinity
> > > > > +     0000000f
> > > > > +     [root@moon 44]# ping -f h
> > > > > +     PING hell (195.4.7.3): 56 data bytes
> > > > > +     ...
> > > > > +     --- hell ping statistics ---
> > > > > +     6029 packets transmitted, 6027 packets received, 0% packet loss
> > > > > +     round-trip min/avg/max = 0.1/0.1/0.4 ms
> > > > > +     [root@moon 44]# cat /proc/interrupts | grep 'CPU\|44:'
> > > > > +             CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
> > > > > +     44:       1068       1785       1785       1783         0          0           0         0    IO-APIC-level  eth1
> > > > > +
> > > > > +从上面一行可以看出，IRQ44只传递给前四个处理器（0-3）。
> > > > > +现在让我们把这个IRQ限制在CPU(4-7)。
> > > > > +
> > > > > +::
> > > > > +
> > > > > +     [root@moon 44]# echo f0 > smp_affinity
> > > > > +     [root@moon 44]# cat smp_affinity
> > > > > +     000000f0
> > > > > +     [root@moon 44]# ping -f h
> > > > > +     PING hell (195.4.7.3): 56 data bytes
> > > > > +     ..
> > > > > +     --- hell ping statistics ---
> > > > > +     2779 packets transmitted, 2777 packets received, 0% packet loss
> > > > > +     round-trip min/avg/max = 0.1/0.5/585.4 ms
> > > > > +     [root@moon 44]# cat /proc/interrupts |  'CPU\|44:'
> > > > > +             CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
> > > > > +     44:       1068       1785       1785       1783      1784       1069        1070       1069   IO-APIC-level  eth1
> > > > > +
> > > > > +这次IRQ44只传递给最后四个处理器。
> > > > > +即CPU0-3的计数器没有变化。
> > > > > +
> > > > > +下面是一个将相同的irq(44)限制在cpus 1024到1031的例子：。
> > > >                                                        ^^^
> > > >                                              ： ->     ::
> > > >
> > > OK!
> > > > > +
> > > > > +     [root@moon 44]# echo 1024-1031 > smp_affinity_list
> > > > > +     [root@moon 44]# cat smp_affinity_list
> > > > > +     1024-1031
> > > > > +
> > > > > +需要注意的是，如果要用位掩码来做这件事，就需要32个为0的位掩码来追踪其相关的一个。
> > > > > --
> > > > > 2.27.0
> > > >
> > >
> > > Thanks!
> > >
> > > Yanteng
> >

