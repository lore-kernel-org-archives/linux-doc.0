Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B88C433ED
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 08:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7973613B3
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 08:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhEDI0K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 May 2021 04:26:10 -0400
Received: from [43.250.32.171] ([43.250.32.171]:62287 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229846AbhEDI0J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 May 2021 04:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=DCy1Rag0I4zOdyOfxufaHNuOsJcmc6j65v38m
        zNSFcI=; b=m0WKqDzjZQcvX2uGMNgPx8E2I/PgARgk693jBl3m3IniuV9HlkdtE
        AboELPSpT0LACyMeoD6CUpUO7FREjDyZKOmlKdjOXNC+IiPZ0KowRexl9pzIksnX
        n9VFQlrRtc7p0Ta+3Dmo8Us6CuRdqraQ9ssG2iwxkNIxZaL/gVeR+M=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBnLkHcBJFgZEMYAA--.62318S2;
        Tue, 04 May 2021 16:25:03 +0800 (CST)
Date:   Tue, 4 May 2021 16:25:00 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Subject: Re: [PATCH 2/3] docs/zh_CN: add parisc debugging.rst translation
Message-ID: <20210504082458.GA28320@bobwxc.top>
References: <cover.1619665430.git.siyanteng@loongson.cn>
 <17f17ca148a9fd315340294f19cefbc80732336c.1619665430.git.siyanteng@loongson.cn>
 <20210429151318.GB23087@bobwxc.top>
 <CAEensMx5AQh_e4pA9vSny_LDV-D=DHvjAKnoVvHS9Lb5-BRU7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEensMx5AQh_e4pA9vSny_LDV-D=DHvjAKnoVvHS9Lb5-BRU7Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBnLkHcBJFgZEMYAA--.62318S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWrJrW8KFWDJFW3CrWruFg_yoW7Gr4fpa
        97Ka4xJa1xtry7tryfKr42grySyr4xtFZ7Was7ta48tr1DtrZxt34Dt34Y9Fn3WrykAFW7
        AF4UKry7Cr1Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42
        xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUU
        UUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 04, 2021 at 02:56:47PM +0800, yanteng si wrote:
> Wu X.C. <bobwxc@email.cn> 于2021年4月29日周四 下午11:13写道：
> >
> > On Thu, Apr 29, 2021 at 11:33:34AM +0800, Yanteng Si wrote:
> > > This translates Documentation/parisc/debugging.rst into Chinese.
> > >
> > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > ---
> > >  .../translations/zh_CN/parisc/debugging.rst   | 41 +++++++++++++++++++
> > >  .../translations/zh_CN/parisc/index.rst       |  6 ++-
> > >  2 files changed, 46 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst
> > >
> > > diff --git a/Documentation/translations/zh_CN/parisc/debugging.rst b/Documentation/translations/zh_CN/parisc/debugging.rst
> > > new file mode 100644
> > > index 000000000000..99af303fd3d8
> > > --- /dev/null
> > > +++ b/Documentation/translations/zh_CN/parisc/debugging.rst
> > > @@ -0,0 +1,41 @@
> > > +.. include:: ../disclaimer-zh_CN.rst
> > > +
> > > +:Original: Documentation/parisc/debugging.rst
> > > +:Translator: Yanteng Si <siyanteng@loongson.cn>
> > > +
> > > +.. _cn_parisc_debugging:
> > > +
> > > +=================
> > > +调试PA-RISC
> > > +=================
> > > +
> > > +好吧，这里有一些关于调试linux/parisc的低级（偏硬件）部分的提示。
> >
> > maybe
> > 较底层部分的信息。
> > depend on your choice
> OK! use 较底层部分的信息。
> >
> > > +
> > > +
> > > +1. 绝对地址
> > > +=====================
> > > +
> > > +很多汇编代码目前是以实模式运行的，这意味着绝对地址被使用，而不是像内核其他
> >
> > 很多汇编代码目前运行在实模式下，这意味着会使用绝对地址，而不是像内核其他
> ok!
> >
> > > +部分那样使用虚拟地址。要将绝对地址转换为虚拟地址，你可以在System.map中查
> > > +找，添加__PAGE_OFFSET（目前是0x10000000）。
> > > +
> > > +
> > > +2. HPMCs
> > > +========
> > > +
> >
> > high priority machine check
> OK!

这个作一个译注 或者 在下一句的HPMC后面括注

> >
> > > +当实模式的代码试图访问不存在的内存时，你会得到一个HPMC，而不是一个内核opps。
> >
> > 会出现HPMC而不是内核oops。
> How about 会打印HPMC而不是内核oops？

Will it just be 'print' ? I'm not sure.

> >
> > > +为了调试HPMC，尝试找到系统响应者/请求者地址。系统请求者地址应该与处理器的
> >
> > 要调试HPMC，请尝试……
> maybe 若要调试HPMC，请尝试……？

OK.

> >
> > （某）处理器
> use 该处理器 ？

(one of the)
or use
处理器（之一）

> >
> > s/响应者/响应程序/g
> > s/请求者/请求程序/g
> > replace all
> OK!
> >
> > > +HPA（I/O范围内的高地址）相匹配；系统响应者地址是实模式代码试图访问的地址。
> > > +
> > > +系统响应者地址的典型值是大于__PAGE_OFFSET （0x10000000）的地址，这意味着
> > > +在实际模式代码试图访问它之前，一个虚拟地址没有被翻译成一个物理地址。
> >
> > 在实模式试图访问它之前，虚拟地址没有被翻译成物理地址。
> OK!
> >
> > > +
> > > +
> > > +3. 有趣的Q位
> > > +============
> > > +
> > > +某些非常关键的代码必须清除PSW中的Q位。当Q位被清除时，CPU不会更新中断处理
> > > +程序所读取的寄存器，以找出机器被中断的位置——所以如果你在清除Q位的指令和再
> > > +次设置Q位的RFI之间遇到中断，你不知道它到底发生在哪里。如果你幸运的话，IAOQ
> > > +会指向清除Q位的指令，如果你不幸运的话，它会指向任何地方。通常Q位的问题会
> > > +表现在无法解释的系统挂起或运行到物理内存的末端。
> >
> > How about 表现为无法解释的系统挂起或物理内存越界。
> And how about 出现在无法解释的系统挂起或物理内存越界。？
> 出现 ----> 问题 :-)

表现为 + 某情景、状态

出现在 + 某处、部分、方位、某时

Thanks

Wu X.C.

> >
> > > diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
> > > index ef232d46b1ba..b913d664e735 100644
> > > --- a/Documentation/translations/zh_CN/parisc/index.rst
> > > +++ b/Documentation/translations/zh_CN/parisc/index.rst
> > > @@ -10,9 +10,13 @@
> > >  PA-RISC体系架构
> > >  ====================
> > >
> > > -Todolist:
> > > +.. toctree::
> > > +   :maxdepth: 2
> > >
> > >     debugging
> > > +
> > > +Todolist:
> > > +
> > >     registers
> > >     features
> > >
> > > --
> > > 2.27.0
> >
> > Thanks
> >
> > Wu X.C.
> >
> Thanks you review!
> 
> Thanks,
> 
> Yanteng

