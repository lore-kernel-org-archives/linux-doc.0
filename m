Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81705C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 05:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D97A61458
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 05:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhEHFcU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 01:32:20 -0400
Received: from [43.250.32.171] ([43.250.32.171]:14034 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229841AbhEHFcU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 8 May 2021 01:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=t9La0M2XJb2kTnI64idgHWHTOEexiHTqeqTIy
        9fUt+w=; b=n5JYkh0eJcu68SugRg4qq3Q6sKfiEfW3RicFa4LgwVro4P8Z5qFbk
        mR8iBG/0Y+epK5PL8YP2JkLA8umY7FfCRVn9ijTTxeSA8n4gfROriSL9j58A4B3I
        TGZmHoSew4RtqyEDbb+O9yrCMVZspe0mjPMoyL/ATJac/T9MIvtDx0=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB3PkEaIpZg0PAeAA--.13433S2;
        Sat, 08 May 2021 13:31:08 +0800 (CST)
Date:   Sat, 8 May 2021 13:31:06 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH v2 3/3] docs/zh_CN: add parisc registers.rst translation
Message-ID: <20210508053105.GA7017@bobwxc.top>
References: <cover.1620284974.git.siyanteng@loongson.cn>
 <13db946725e43f1b490142f745e03ec63a7cec3b.1620284974.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13db946725e43f1b490142f745e03ec63a7cec3b.1620284974.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB3PkEaIpZg0PAeAA--.13433S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GF13uF1fJw45ZFy8tF1fJFb_yoW3Gw43pr
        n3Kr97G3W8AryUAr47Gr18Wr18Cr1UGF4DA34fJr18Jr18Cr1UKr4UtFy8GrW7GryUAFyU
        ArWYgr10kr1UCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqvb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMx
        AIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
        W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07Un189U
        UUUU=
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 07, 2021 at 06:07:05PM +0800, Yanteng Si wrote:
> This patch translates Documentation/parisc/registers.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/parisc/index.rst       |   2 +-
>  .../translations/zh_CN/parisc/registers.rst   | 153 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/parisc/registers.rst
> 
> diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
> index b913d664e735..a47454ebe32e 100644
> --- a/Documentation/translations/zh_CN/parisc/index.rst
> +++ b/Documentation/translations/zh_CN/parisc/index.rst
> @@ -14,10 +14,10 @@ PA-RISC体系架构
>     :maxdepth: 2
>  
>     debugging
> +   registers
>  
>  Todolist:
>  
> -   registers
>     features
>  
>  .. only::  subproject and html
> diff --git a/Documentation/translations/zh_CN/parisc/registers.rst b/Documentation/translations/zh_CN/parisc/registers.rst
> new file mode 100644
> index 000000000000..ecae1b079aec
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/parisc/registers.rst
> @@ -0,0 +1,153 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/parisc/registers.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_parisc_registers:
> +
> +=========================
> +Linux/PA-RISC的寄存器用法
> +=========================
> +
> +[ 用星号表示目前尚未实现的计划用途。 ]
> +
> +ABI约定的通用寄存器
> +===================
> +
> +控制寄存器
> +----------
> +
> +============================    =================================
> +CR 0 (恢复计数器)               用于ptrace
> +CR 1-CR 7(无定义)               未使用
> +CR 8 (Protection ID)            每进程值*
> +CR 9, 12, 13 (PIDS)             未使用
> +CR10 (CCR)                      FPU延迟保存*
> +CR11                            按照ABI的规定（SAR）
> +CR14 (中断向量)                 初始化为 fault_vector
> +CR15 (EIEM)                     所有位初始化为1*
> +CR16 (间隔计时器)               读取周期数/写入开始时间间隔计时器
> +CR17-CR22                       中断参数
> +CR19                            中断指令寄存器
> +CR20                            中断空间寄存器
> +CR21                            中断偏移量寄存器
> +CR22                            中断 PSW
> +CR23 (EIRR)                     读取未决中断/写入清除位
> +CR24 (TR 0)                     内核空间页目录指针
> +CR25 (TR 1)                     用户空间页目录指针
> +CR26 (TR 2)                     不使用
> +CR27 (TR 3)                     线程描述符指针
> +CR28 (TR 4)                     不使用
> +CR29 (TR 5)                     不使用
> +CR30 (TR 6)                     当前 / 0
> +CR31 (TR 7)                     临时寄存器，在不同地方使用
> +============================    =================================
> +
> +空间寄存器（内核模式）
> +----------------------
> +
> +========                        ==============================
> +SR0                             临时空间寄存器
> +SR4-SR7                         设置为0
> +SR1                             临时空间寄存器
> +SR2                             内核不应该破坏它
> +SR3                             用于用户空间访问（当前进程）
> +========                        ==============================
> +
> +空间寄存器（用户模式）
> +----------------------
> +
> +========                        ============================
> +SR0                             临时空间寄存器
> +SR1                             临时空间寄存器
> +SR2                             保存Linux gateway page的空间
> +SR3                             在内核中保存用户地址空间的值
> +SR4-SR7                         定义了用户/内核的短地址空间
> +========                        ============================
> +
> +
> +处理器状态字
> +------------
> +
> +======================          ================================================
> +W （64位地址）                  0
> +E （小尾端）                    0
> +S （安全间隔计时器）            0
> +T （产生分支陷阱）              0
> +H （高特权级陷阱）              0
> +L （低特权级陷阱）              0
> +N （撤销下一条指令）            被C代码使用
> +X （数据存储中断禁用）          0
> +B （产生分支）                  被C代码使用
> +C （代码地址转译）              1, 在执行实模式代码时为0
> +V （除法步长校正）              被C代码使用
> +M （HPMC 掩码）                 0, 在执行HPMC操作*时为1
> +C/B （进/借 位）                被C代码使用
> +O （有序引用）                  1*
> +F （性能监视器）                0
> +R （回收计数器陷阱）            0
> +Q （收集中断状态）              1 （在rfi之前的代码中为0）
> +P （保护标识符）                1*
> +D （数据地址转译）              1, 在执行实模式代码时为0
> +I （外部中断掩码）              由cli()/sti()宏使用。
> +======================          ================================================
> +
> +“隐形”寄存器（影子寄存器）
> +---------------------------
> +
> +=============                   ===================
> +PSW W 默认值                    0
> +PSW E 默认值                    0
> +影子寄存器                      被中断处理代码使用
> +TOC启用位                       1
> +=============                   ===================
> +
> +----------------------------------------------------------
> +
> +PA-RISC架构定义了7个寄存器作为“影子寄存器”。这些寄存器在
> +RETURN FROM INTERRUPTION AND RESTORE指令中使用，通过消
> +除中断处理程序中对一般寄存器（GR）的保存和恢复的需要来减
> +少状态保存和恢复时间。影子寄存器是GRs 1, 8, 9, 16, 17,
> +24和25。
> +
> +-------------------------------------------------------------------------
> +
> +寄存器使用说明，最初由约翰-马文John Marvin提供，并由Randolph Chung提供一些补充说明。
                         ^^^^^^^^^

> +
> +对于通用寄存器:
> +
> +r1,r2,r19-r26,r28,r29 & r31可以在不保存它们的情况下被使用。当然，如果你
> +关心它们，在调用另一个程序之前，你也需要保存它们。上面的一些寄存器确实
> +有特殊的含义，你应该注意一下:
> +
> +    r1:
> +       addil指令是硬性规定将其结果放在r1中，所以如果你使用这条指令要
> +       注意这点。
> +
> +    r2:
> +       这就是返回指针。一般来说，你不想使用它，因为你需要这个指针来返
> +       回给你的调用者。然而，它与这组寄存器组合在一起，因为调用者不能
> +       依赖你返回时的值是相同的，也就是说，你可以将r2复制到另一个寄存
> +       器，并在作废r2后通过该寄存器返回，这应该不会给调用程序带来问题。
> +
> +    r19-r22:
> +       这些通常被认为是临时寄存器。
> +       请注意，在64位中它们是arg7-arg4。
> +
> +    r23-r26:
> +       这些是arg3-arg0，也就是说，如果你不再关心传入的值，你可以使用
> +       它们。
> +
> +    r28,r29:
> +       这俩是ret0和ret1。它们是你传入返回值的地方。r28是主返回值。当返回
> +       小结构体时，r29也可以用来将数据传回给调用程序。
> +
> +    r30:
> +       栈指针
> +
> +    r31:
> +       ble指令将返回指针放在这里。
> +
> +

I've specifically reminded you that there's no need to change the indentation
of the next paragraph 😂.

> +       r3-r18,r27,r30需要被保存和恢复。r3-r18只是一般用途的寄存器。
> +       r27是数据指针，用来使对全局变量的引用更容易。r30是栈指针。
> -- 
> 2.27.0

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
Wu X.C

