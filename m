Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B67C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 05:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FBA1619AB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 05:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCWFC5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 01:02:57 -0400
Received: from [43.250.32.171] ([43.250.32.171]:39243 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229437AbhCWFC1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Mar 2021 01:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=V/NSmxd+9oawodVWAbt83oN25GZaiyJNe6uTf
        W3tA1A=; b=WjRzdiYcACMtKcbKIUqTaEwAkjjJ845LYrfrKbI9TqwrXcJl0H+kV
        dAQP7URgjQCImICAqXEi7N70vDU3eR36VU9v04JVrVLCWMF6QvOy4WBDUOlk+5eq
        fKUP3k6sdLIi+cVV46Cfffz92+a1RhNwfuCeAU06I1+1RTLjWAUEY4=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB36tBedllg5Yk1AA--.52795S2;
        Tue, 23 Mar 2021 13:02:24 +0800 (CST)
Date:   Tue, 23 Mar 2021 13:02:22 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Add translations in zh_CN/kernel-hacking/
Message-ID: <20210323050221.GA11893@mipc>
References: <20210322143743.GA7820@mipc>
 <3301bb31-f8de-1e3c-aaa0-b3d4411eb17c@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3301bb31-f8de-1e3c-aaa0-b3d4411eb17c@linux.alibaba.com>
X-Face: Happy
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB36tBedllg5Yk1AA--.52795S2
X-Coremail-Antispam: 1UD129KBjvAXoWfZryDZF1kCryrtF47Wr4UArb_yoW5Zr4rXo
        W2vFWYkw4kJF15tF1Yy3yDJry7Aa15Gr4fAw47Gw13Cr1DK3Z7JF18Jw1UGrWYkrs8JF13
        KF1xJry7AF1UAFy5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5v7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vE
        x4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8WwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxUThFxDUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Tue, Mar 23, 2021 at 11:26:21AM +0800, Alex Shi wrote:
> 
> 
> 在 2021/3/22 下午10:37, Wu XiangCheng 写道:
> > Add new tranalations
>
I have known the typos in commit message and subject, will correct in v2.
>
> > * Documentation/translations/zh_CN/kernel-hacking/index.rst
> > * Documentation/translations/zh_CN/kernel-hacking/hacking.rst
> > 
> > And link them to zh_CN/index.rst.
> > 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  Documentation/translations/zh_CN/index.rst    |   1 +
> >  .../zh_CN/kernel-hacking/hacking.rst          | 708 ++++++++++++++++++
> >  .../zh_CN/kernel-hacking/index.rst            |  22 +
> >  3 files changed, 731 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/kernel-hacking/hacking.rst
> >  create mode 100644 Documentation/translations/zh_CN/kernel-hacking/index.rst
> > 
> > diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> > index be6f11176200..2b95e4d0a619 100644
> > --- a/Documentation/translations/zh_CN/index.rst
> > +++ b/Documentation/translations/zh_CN/index.rst
> > @@ -18,6 +18,7 @@
> >  
> >     admin-guide/index
> >     process/index
> > +   kernel-hacking/index
> >     filesystems/index
> >     arm64/index
> >  
> > diff --git a/Documentation/translations/zh_CN/kernel-hacking/hacking.rst b/Documentation/translations/zh_CN/kernel-hacking/hacking.rst
> > new file mode 100644
> > index 000000000000..80d5d0ed75a5
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/kernel-hacking/hacking.rst
> > @@ -0,0 +1,708 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/kernel-hacking/hacking.rst
> > +
> > +:译者:
> > +
> > + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +========================
> > +内核操弄（Hacking）指北
> 
> hacking often translates as 骇客 in computer industry.
>
Yeah, generally

      黑客 -- Hacker
      骇客 -- Cracker

But you know 骇/黑 always give a bad meaning, not suitable for here.
"Hacking" is also different with "Programming".

The translation of "Hack" is an old problem, would there another better
word for it?
>
> > +========================
> > +
> > +:作者: Rusty Russell
> > +
> > +引言
> > +=====
> > +
> > +欢迎咱优雅的读者们来阅读Rusty的非常不靠谱的Linux内核操弄指南。本文描述了
> > +内核代码的常见例程和一般要求：其目标是引导有经验的C程序员入门Linux内核开发。
> > +我回避了实现细节：这是代码要做的，也忽略了很多有用的例程。
> > +
> > +在你读这篇文章之前，请理解我从来没有想过要写这篇文章，因为我的资历太低了；
> > +但我一直想读这样的文章，自己写是唯一的方法。我希望它能成长为一个最佳实践、
> > +通用起点和其他信息的汇编。
> > +
> > +参与者
> 
> Compare to '参与者', is ’玩家‘ more verbal and fit the style of this doc?
> 
OK.
> 
> > +=======
> > +
> > +在任何时候，系统中的每个CPU都可以：
> > +
> > +-  与任何进程无关，服务于硬件中断；
> > +
> > +-  与任何进程无关，服务于软件中断（softirq）或子任务（tasklet）；
> > +
> > +-  运行于内核空间中，与进程（用户上下文）相关联；
> > +
> > +-  在用户空间中运行进程。
> > +
> > +它们之间有优先级顺序。最下面的两个可以互相抢占，但上面为严格的层次结构：
> > +每个层级只能被上方的抢占。例如，当一个软中断在CPU上运行时，没有其他软中断
> > +会抢占它，但是硬件中断可以抢占它。不过，系统中的任何其他CPU都是独立执行的。
> > +
> > +我们将会看到许多方法，用户上下文可以阻止中断，从而成为真正的不可抢占。
> > +
> > +用户上下文
> > +------------
> > +
> > +用户上下文是指当您从系统调用或其他trap进入时：就像用户空间一样，您可以被更
> 
> trap often translates as 陷阱。
>
Is 陷阱 suitable for computer science?
I don't know how to translate this word.
> 
> > +重要的任务和中断抢占。您可以通过调用 :c:func:`schedule()` 进行睡眠。
> > +
> > +.. note::
> > +
> > +    在模块加载和卸载以及块设备层上的操作时，你始终处于用户上下文中。
> > +
> > +在用户上下文中，当前 ``current`` 指针（指示我们当前正在执行的任务）是有效的，
> > +且 :c:func:`in_interrupt()` （ ``include/linux/preempt.h`` ）值为非（false）。
> > +
> > +.. warning::
> > +
> > +    请注意，如果您禁用了抢占或软中断（见下文），:c:func:`in_interrupt()` 会
> > +    返回假真值。
> > +
> > +硬件中断（Hard IRQs）
> > +----------------------
> > +
> > +像定时器、网卡和键盘等都是可能在任意时刻产生中断的真实硬件。内核运行中断
> > +处理程序，为硬件提供服务。内核确保处理程序永远不会重入：如果相同的中断到达，
> > +它将被排队（或丢弃）。因为它会关闭中断，所以处理程序必须很快：通常它只是
> > +确认中断，标记一个“软件中断”以执行并退出。
> > +
> > +您可以通过 :c:func:`in_irq()` 返回真来判断您处于硬件中断状态。
> > +
> > +.. warning::
> > +
> > +    请注意，如果中断被禁用，这将返回假真值（见下文）。
> 
> false positive usually translates as 假阳性。
>
OK.
> 
> > +
> > +软件中断上下文：软中断（Softirqs）与子任务（Tasklets）
> > +-------------------------------------------------------
> > +
> > +当系统调用即将返回用户空间或硬件中断处理程序退出时，任何标记为挂起（通常通
> > +过硬件中断）的“软件中断”将运行（ ``kernel/softirq.c`` ）。
> > +
> > +此处完成了许多真正的中断处理工作。在向SMP过渡的早期，只有“bottom halves下半
> > +部”（BHs）机制，无法利用多个CPU的优势。在从那些一团糟的就电脑切换过来后不久，
> > +我们放弃了这个限制，转而使用“软中断”。
> > +
> > +``include/linux/interrupt.h`` 列出了不同的软IRQ。定时器软中断是一个非常重要
> 
> you already translate IRQ as 中断， keep using it here. :)
>
Yeah, missed it.
> 
> > +的软中断（ ``include/linux/timer.h`` ）：您可以注册它以在给定时间后为您调用
> > +函数。
> > +
> > +软中断通常是一个很难处理的问题，因为同一个软中断将同时在多个CPU上运行。因此，
> > +子任务（ ``include/linux/interrupt.h`` ）更常用：它们是动态可注册的（意味着
> > +您可以拥有任意数量），并且它们还保证任何子任务都只能在一个CPU上运行，不同的
> > +子任务也可以同时运行。
> > +
> > +.. warning::
> > +
> > +    “tasklet”这个名字是误导性的：它们与“任务”无关，可能更多与当时
> > +    阿列克谢·库兹涅佐夫享用的糟糕伏特加有关。
> > +
> > +你可以使用 :c:func:`in_softirq()` 宏（ ``include/linux/preempt.h`` ）来确认
> > +是否处于软中断（或子任务）中。
> > +
> > +.. warning::
> > +
> > +    注意，如果持有 :ref:`bottom half lock <local_bh_disable_zh>` 锁，这将返回
> > +    假真值。
> 
> ditto.
>
OK.
> 
> > +
> > +一些基本规则
> > +================
> > +
> > +缺少内存保护
> > +    如果你损坏了内存，无论是在用户上下文还是中断上下文中，整个机器都会崩溃。
> > +    你确定你不能在用户空间里做你想做的事吗？
> > +
> > +缺少浮点或MMX
> > +    FPU上下文不会被保存；即使在用户上下文中，FPU状态也可能与当前进程不一致：
> > +    您会弄乱某些用户进程的FPU状态。如果真的要这样做，就必须显式地保存/恢复
> > +    完整的FPU状态（并避免上下文切换）。这通常不是个好主意；请优先用定点算法。
> > +
> > +严格的堆栈限制
> > +    对于大多数32位体系结构，根据配置选项的不同内核堆栈大约为3K到6K；对于大
> > +    多数64位机器，内核堆栈大约为14K，并且经常与中断共享，因此你无法使用全部。
> > +    应避免深度递归和栈上的巨型本地数组（用动态分配它们来代替）。
> > +
> > +Linux内核是可移植的
> > +    就这样吧。您的代码应该是纯64位的，并且不依赖于字节序（endian）。您还应该
> > +    尽量减少CPU特定的东西，例如内联汇编（inline assembly）应该被干净地封装和
> > +    最小化以便于移植。一般来说，它应该局限于内核树中有体系结构依赖的部分。
> > +
> > +输入输出控制（ioctls）：避免编写新的系统调用
> > +==============================================
> > +
> > +系统调用（system call）通常看起来像这样::
> > +
> > +    asmlinkage long sys_mycall(int arg)
> > +    {
> > +            return 0;
> > +    }
> > +
> > +
> > +首先，在大多数情况下，您无需创建新的系统调用。创建一个字符设备并为其实现适当
> > +的输入输出控制（ioctls）。这比系统调用灵活得多，不必写进每个体系结构的
> > +``include/asm/unistd.h`` 和 ``arch/kernel/entry.S`` 文件里，而且更容易被Linus
> > +接受。
> > +
> > +如果您的程序所做的只是读取或写入一些参数，请考虑实现 :c:func:`sysfs()` 接口。
> > +
> > +在输入输出控制中，您处于进程的用户上下文。出现错误时，返回一个否定的错误参数
> 
> 返回一个“负的”的错误参数。
>
OK.
> 
> > +（errno，请参阅 ``include/uapi/asm-generic/errno-base.h`` 、
> > +``include/uapi/asm-generic/errno.h`` 和 ``include/linux/errno.h`` ），否则返
> > +回0。
> > +
> > +在睡眠之后，您应该检查是否出现了信号：Unix/Linux处理信号的方法是暂时退出系统
> > +调用，并返回 ``-ERESTARTSYS`` 错误。系统调用入口代码将切换回用户上下文，处理
> > +信号处理程序，然后系统调用将重新启动（除非用户禁用了该功能）。因此，您应该准
> > +备好处理重新启动，例如若您处理某些数据结构到一半。
> > +
> > +::
> > +
> > +    if (signal_pending(current))
> > +            return -ERESTARTSYS;
> > +
> > +
> > +如果你要做更长时间的计算：优先考虑用户空间。如果你真的想在内核中做这件事，你
> > +应该定期检查你是否需要让出CPU（请记得每个CPU都有协作多任务）。
> > +习惯用法::
> > +
> > +    cond_resched(); /* Will sleep */
> > +
> > +
> > +接口设计的小注释：UNIX系统调用的格言是“提供机制而不是策略
> > +Provide mechanism not policy”。
> > +
> > +死锁的“配方”
> > +====================
> > +
> > +您不能调用任何可能睡眠的程序，除非：
> > +
> > +- 您处于用户上下文中。
> > +
> > +- 你未拥有任何自旋锁。
> > +
> > +- 您已经启用中断（实际上，Andi Kleen说调度代码将为您启用它们，但这可能不是
> > +  您想要的）。
> > +
> > +注意，有些函数可能隐式地睡眠：常见的是用户空间访问函数（\*_user）和没有
> > +``GFP_ATOMIC`` 的内存分配函数。
> > +
> > +您应该始终打开  ``CONFIG_DEBUG_ATOMIC_SLEEP``  项来编译内核，如果您违反这些
> > +规则，它将警告您。如果你 **真的** 违反了规则，你最终会锁住你的框框。
> 
> 'lock up your box' means lock up your computer.
>
Good explanation.
> 
> > +
> > +真的会这样。
> > +
> > +
> > +常用函数/程序
> > +===============
> > +
> > +:c:func:`printk()`
> > +------------------
> > +
> > +定义于 ``include/linux/printk.h``
> > +
> > +:c:func:`printk()` 将内核消息提供给控制台、dmesg和syslog守护进程。它对于调
> > +试和报告错误很有用，并且可以在中断上下文中使用，但是使用时要小心：如果机器
> > +的控制台中充斥着printk消息则会无法使用。它使用与ANSI C printf基本兼容的格式
> > +字符串，并通过C字符串串联为其提供第一个“优先”参数::
> > +
> > +    printk(KERN_INFO "i = %u\n", i);
> > +
> > +
> > +参见 ``include/linux/kern_levels.h`` ；了解其他 ``KERN_`` 值；syslog将这些值
> > +解释为级别。特殊用法：打印IP地址使用::
> > +
> > +    __be32 ipaddress;
> > +    printk(KERN_INFO "my ip: %pI4\n", &ipaddress);
> > +
> > +
> > +:c:func:`printk()` 内部使用的1K缓冲区，不捕获溢出。请确保足够使用。
> > +
> > +.. note::
> > +
> > +    当您开始在用户程序中将printf打成printk时，就知道自己是真正的内核程序员了
> > +    :)
> > +
> > +.. note::
> > +
> > +    另一个注释：最初的unix第六版源代码在其printf函数的顶部有一个注释：“printf
> > +    不应该用于叽叽喳喳”。你也应该遵循此建议。
> > +
> > +:c:func:`copy_to_user()` / :c:func:`copy_from_user()` / :c:func:`get_user()` / :c:func:`put_user()`
> > +---------------------------------------------------------------------------------------------------
> > +
> > +定义于 ``include/linux/uaccess.h`` / ``asm/uaccess.h``
> > +
> > +**[睡眠]**
> > +
> > +:c:func:`put_user()` 和 :c:func:`get_user()` 用于从用户空间中获取和向用户空
> > +间中传出单个值（如int、char或long）。指向用户空间的指针永远不应该直接取消
> > +引用：应该使用这些程序复制数据。两者都返回 ``-EFAULT`` 或 0。
> > +
> > +:c:func:`copy_to_user()` 和 :c:func:`copy_from_user()` 更通用：它们从/向用户
> > +空间复制任意数量的数据。
> > +
> > +.. warning::
> > +
> > +    与 :c:func:`put_user()` 和 :c:func:`get_user()` 不同，它们返回未复制的
> > +    数据量（即0仍然意味着成功）。
> > +
> > +【是的，这个愚蠢的接口真心让我尴尬。火爆的口水仗大概每年都会发生。
> > +—— Rusty Russell】
> > +
> > +函数可以隐式睡眠。它不应该在用户上下文之外调用（没有意义）、调用时禁用中断或
> 
> "这些"函数可以隐式睡眠
>
OK.
> 
> > +获得自旋锁。
> > +
> > +:c:func:`kmalloc()`/:c:func:`kfree()`
> > +-------------------------------------
> > +
> > +定义于 ``include/linux/slab.h``
> > +
> > +**[可能睡眠：见下]**
> > +
> > +这些函数用于动态请求指针对齐的内存块，类似用户空间中的malloc和free，但
> > +:c:func:`kmalloc()` 需要额外的标志词。重要的值：
> > +
> > +``GFP_KERNEL``
> > +    可以睡眠和交换以释放内存。只允许在用户上下文中使用，但这是分配内存最可靠
> > +    的方法。
> > +
> > +``GFP_ATOMIC``
> > +    不会睡眠。较 ``GFP_KERNEL`` 更不可靠，但可以从中断上下文调用。你 **应该**
> > +    有一个很好的内存不足错误处理策略。
> > +
> > +``GFP_DMA``
> > +    分配低于16MB的ISA DMA。如果你不知道那是什么，那你就不需要了。非常不可靠。
> > +
> > +如果您看到一个从无效上下文警告消息调用的睡眠的函数，那么您可能在没有
> > +``GFP_ATOMIC`` 的情况下从中断上下文调用了一个睡眠的分配函数。你必须立即修复，
> > +快点！
> > +
> > +如果你要分配至少 ``PAGE_SIZE`` （ ``asm/page.h`` 或 ``asm/page_types.h`` ）
> > +字节，请考虑使用 :c:func:`__get_free_pages()` （ ``include/linux/gfp.h`` ）。
> > +它采用顺序参数（0表示页面大小，1表示双页，2表示四页……）和与上述相同的内存
> > +优先级标志字。
> > +
> > +如果分配的字节数超过一页，可以使用 :c:func:`vmalloc()` 。它将在内核映射中分
> > +配虚拟内存。此块在物理内存中不是连续的，但是MMU（内存管理单元）使它看起来像
> > +是为您准备好的连续空间（因此它只是看起来对cpu连续，对外部设备驱动程序则不然）。
> > +如果您真的需要为一些奇怪的设备提供大量物理上连续的内存，那么您就会遇到问题：
> > +Linux对此支持很差，因为正在运行的内核中的内存碎片化会使它变得很困难。最好的
> > +方法是在引导过程的早期通过 :c:func:`alloc_bootmem()` 函数分配。
> > +
> > +在创建自己的常用对象缓存之前，请考虑使用 ``include/linux/slab.h`` 中的slab
> > +缓存。
> > +
> > +:c:macro:`current`
> > +------------------
> > +
> > +定义于 ``include/asm/current.h``
> > +
> > +此全局变量（其实是宏）包含指向当前任务结构（task structure）的指针，因此仅在
> > +用户上下文中有效。例如，当进程进行系统调用时，这将指向调用进程的任务结构。
> > +在中断上下文中不为空（**not NULL**）。
> > +
> > +:c:func:`mdelay()`/:c:func:`udelay()`
> > +-------------------------------------
> > +
> > +定义于 ``include/asm/delay.h`` / ``include/linux/delay.h``
> > +
> > +:c:func:`udelay()` 和 :c:func:`ndelay()` 函数可被用于小暂停。不要对它们使用
> > +大的值，因为这样会导致溢出——帮助函数 :c:func:`mdelay()` 在这里很有用，或者
> > +考虑 :c:func:`msleep()`。
> > +
> > +:c:func:`cpu_to_be32()`/:c:func:`be32_to_cpu()`/:c:func:`cpu_to_le32()`/:c:func:`le32_to_cpu()`
> > +-----------------------------------------------------------------------------------------------
> > +
> > +定义于 ``include/asm/byteorder.h``
> > +
> > +:c:func:`cpu_to_be32()` 系列函数（其中“32”可以替换为64或16，“be”可以替换为
> > +“le”）是在内核中进行字节序转换的常用方法：它们返回转换后的值。所有的变体也
> > +提供反向转换函数：
> > +:c:func:`be32_to_cpu()` 等。
> > +
> > +这些函数有两个主要的变体：指针变体，例如 :c:func:`cpu_to_be32p()` ，它获取
> > +指向给定类型的指针，并返回转换后的值。另一个变体是“in-situ”系列，例如
> > +:c:func:`cpu_to_be32s()` ，它转换指针引用的值，并返回void。
> > +
> > +:c:func:`local_irq_save()`/:c:func:`local_irq_restore()`
> > +--------------------------------------------------------
> > +
> > +定义于 ``include/linux/irqflags.h``
> > +
> > +
> > +这些程序禁用本地CPU上的硬中断，并还原它们。它们是可重入的；在其一个
> > +``unsigned long flags`` 参数中保存以前的状态。如果您知道中断已启用，那么可
> > +直接使用 :c:func:`local_irq_disable()` 和 :c:func:`local_irq_enable()`。
> > +
> > +.. _local_bh_disable_zh:
> > +
> > +:c:func:`local_bh_disable()`/:c:func:`local_bh_enable()`
> > +--------------------------------------------------------
> > +
> > +定义于 ``include/linux/bottom_half.h``
> > +
> > +
> > +这些程序禁用本地CPU上的软中断，并还原它们。它们是可重入的；如果之前禁用了
> > +软中断，那么在调用这对函数之后仍然会禁用它们。它们阻止软中断和子任务在当前
> > +CPU上运行。
> > +
> > +:c:func:`smp_processor_id()`
> > +----------------------------
> > +
> > +定义于 ``include/linux/smp.h``
> > +
> > +:c:func:`get_cpu()` 禁用抢占（这样您就不会突然移动到另一个cpu）并返回当前
> > +处理器号，介于0和 ``NR_CPUS`` 之间。请注意，CPU编号不一定是连续的。完成后，
> > +使用 :c:func:`put_cpu()` 再次返回。
> > +
> > +如果您知道您不能被另一个任务抢占（即您处于中断上下文中，或已禁用抢占），您
> > +可以使用 :c:func:`smp_processor_id()`。
> > +
> > +``__init``/``__exit``/``__initdata``
> > +------------------------------------
> > +
> > +定义于  ``include/linux/init.h``
> > +
> > +引导之后，内核释放一个特殊的部分；用 ``__init`` 标记的函数和用 ``__initdata``
> > +标记的数据结构在引导完成后被丢弃：同样地，模块在初始化后丢弃此内存。
> > +``__exit`` 用于声明只在退出时需要的函数：如果此文件未编译为模块，则该函数将
> > +被删除。请参阅头文件以使用。请注意，使用 :c:func:`EXPORT_SYMBOL()` 或
> > +:c:func:`EXPORT_SYMBOL_GPL()` 将标记为 ``__init`` 的函数导出到模块是没有意义
> > +的——这将出问题。
> > +
> > +
> > +:c:func:`__initcall()`/:c:func:`module_init()`
> > +----------------------------------------------
> > +
> > +定义于  ``include/linux/init.h`` / ``include/linux/module.h``
> > +
> > +内核的许多部分都作为模块（内核的可动态加载部分）良好服务。使用
> > +:c:func:`module_init()` 和 :c:func:`module_exit()` 宏可以简化代码编写，无需
> > +``#ifdef`` ，即可以作为模块运行或内置在内核中。
> > +
> > +:c:func:`module_init()` 宏定义在模块插入时（如果文件编译为模块）或在引导时
> > +调用哪个函数：如果文件未编译为模块，:c:func:`module_init()` 宏将等效于
> > +:c:func:`__initcall()` ，它通过链接器的魔力确保在引导时调用该函数。
> > +
> > +该函数可以返回一个错误值，以导致模块加载失败（不幸的是，如果将模块编译到内核
> > +中，则此操作无效）。此函数在启用中断的用户上下文中调用，因此可以睡眠。
> > +
> > +:c:func:`module_exit()`
> > +-----------------------
> > +
> > +
> > +定义于  ``include/linux/module.h``
> > +
> > +这个宏定义了在模块删除时要调用的函数（如果是编译到内核中的文件，则无用武之地）。
> > +只有在模块使用计数到零时才会调用它。这个函数也可以睡眠，但不能失败：当它返回
> > +时，所有的东西都必须清理干净。
> > +
> > +注意，这个宏是可选的：如果它不存在，您的模块将不可移除（除非 ``rmmod -f`` ）。
> > +
> > +:c:func:`try_module_get()`/:c:func:`module_put()`
> > +-------------------------------------------------
> > +
> > +定义于 ``include/linux/module.h``
> > +
> > +这些函数会操作模块使用计数，以防止删除（如果另一个模块使用其导出的符号之一，
> > +则无法删除模块，参见下文）。在调用模块代码之前，您应该在该模块上调用
> > +:c:func:`try_module_get()` ：若失败，那么该模块将被删除，您应该将其视为不存在。
> > +若成功，您就可以安全地进入模块，并在完成后调用模块 :c:func:`module_put()` 。
> > +
> > +大多数可注册结构体都有所有者字段，例如在
> > +:c:type:`struct file_operations <file_operations>` 结构体中，此字段应设置为
> > +宏 ``THIS_MODULE`` 。
> > +
> > +等待队列 ``include/linux/wait.h``
> > +====================================
> > +
> > +**[睡眠]**
> > +
> > +等待队列用于等待某程序在条件为真时唤醒另一程序。必须小心使用，以确保没有竞争
> > +条件。先声明一个 :c:type:`wait_queue_head_t` ，然后对希望等待该条件的进程声明
> > +一个关于它们自己的 :c:type:`wait_queue_entry_t` ，并将其放入队列中。
> > +
> > +声明
> > +-----
> > +
> > +使用 :c:func:`DECLARE_WAIT_QUEUE_HEAD()` 宏声明一个 ``wait_queue_head_t`` ，
> > +或者在初始化代码中使用 :c:func:`init_waitqueue_head()` 程序。
> > +
> > +排队
> > +-----
> > +
> > +将自己放在等待队列中相当复杂，因为你必须在检查条件之前将自己放入队列中。有一
> > +个宏可以来执行此操作： :c:func:`wait_event_interruptible()`
> > +（ ``include/linux/wait.h`` ）第一个参数是等待队列头，第二个参数是计算的表达
> > +式；当该表达式为true时宏返回0，或者在接收到信号时返回 ``-ERESTARTSYS`` 。
> > +:c:func:`wait_event()` 版本会忽略信号。
> > +
> > +唤醒排队任务
> > +-------------
> > +
> > +调用 :c:func:`wake_up()` （ ``include/linux/wait.h`` ），它将唤醒队列中的所有
> > +进程。例外情况：如果有一个进程设置了 ``TASK_EXCLUSIVE`` ，队列的其余部分将不
> > +会被唤醒。这个基本函数的其他变体也可以在同一个头中使用。
> > +
> 
> 同一个头文件中使用
>
OK.
> 
> > +原子操作
> > +=========
> > +
> > +某些操作在所有平台上都有保证。第一类为操作 :c:type:`atomic_t`
> > +（ ``include/asm/atomic.h`` ）的函数；它包含一个有符号整数（至少32位长），
> > +您必须使用这些函数来操作或读取 :c:type:`atomic_t` 变量。
> > +:c:func:`atomic_read()` 和 :c:func:`atomic_set()` 获取并设置计数器，还有
> > +:c:func:`atomic_add()` ，:c:func:`atomic_sub()` ，:c:func:`atomic_inc()` ，
> > +:c:func:`atomic_dec()` 和 :c:func:`atomic_dec_and_test()` （如果递减为零，
> > +则返回true）。
> > +
> > +是的。它在原子变量为零时返回true（即!=0）。
> > +
> > +请注意，这些函数比普通的算术运算速度慢，因此不应过度使用。
> > +
> > +第二类原子操作是在 ``unsigned long`` （ ``include/linux/bitops.h`` ）上的
> > +原子位操作。这些操作通常采用指向位模式（bit pattern）的指针，第0位是最低有效
> > +位。:c:func:`set_bit()`，:c:func:`clear_bit()` 和 :c:func:`change_bit()` 设置、
> > +清除和更改给定位。:c:func:`test_and_set_bit()` ，:c:func:`test_and_clear_bit()`
> > +和 :c:func:`test_and_change_bit()` 执行相同的操作，但如果之前设置了位，则返回
> > +true；这些对于原子设置标志特别有用。
> > +
> > +可以使用大于 ``BITS_PER_LONG`` 位的位索引调用这些操作。但结果在大端序平台上
> > +不太正常，所以最好不要这样做。
> > +
> > +符号
> > +=====
> > +
> > +在内核内部，正常的链接规则仍然适用（即除非用static关键字将符号声明为文件范围，
> > +否则它可以在内核中的任何位置使用）。但是对于模块，会保留一个特殊可导出符号表，
> > +该表将入口点限制为内核内部。模块也可以导出符号。
> > +
> > +:c:func:`EXPORT_SYMBOL()`
> > +-------------------------
> > +
> > +定义于 ``include/linux/export.h``
> > +
> > +这是导出符号的经典方法：动态加载的模块将能够正常使用符号。
> > +
> > +:c:func:`EXPORT_SYMBOL_GPL()`
> > +-----------------------------
> > +
> > +定义于 ``include/linux/export.h``
> > +
> > +
> > +类似于 :c:func:`EXPORT_SYMBOL()`，只是 :c:func:`EXPORT_SYMBOL_GPL()` 导出的
> > +符号只能由具有由 :c:func:`MODULE_LICENSE()` 指定GPL兼容许可证的模块看到。这
> > +意味着此函数被认为是一个内部实现问题，而不是一个真正的接口。一些维护人员和
> > +开发人员在添加一些新的API或功能时可能却需要导出 EXPORT_SYMBOL_GPL()。
> > +
> > +:c:func:`EXPORT_SYMBOL_NS()`
> > +----------------------------
> > +
> > +定义于 ``include/linux/export.h``
> > +
> > +这是 ``EXPORT_SYMBOL()`` 的变体，允许指定符号命名空间。符号名称空间记录于
> > +Documentation/core-api/symbol-namespaces.rst 。
> > +
> > +:c:func:`EXPORT_SYMBOL_NS_GPL()`
> > +--------------------------------
> > +
> > +定义于 ``include/linux/export.h``
> > +
> > +这是 ``EXPORT_SYMBOL_GPL()`` 的变体，允许指定符号命名空间。符号名称空间记录于
> > +Documentation/core-api/symbol-namespaces.rst 。
> > +
> > +程序与惯例
> > +===========
> > +
> > +双向链表 ``include/linux/list.h``
> > +-----------------------------------
> > +
> > +内核头中曾经有三组链表程序，但这一组是赢家。如果你对一个单链表没有特别迫切的
> > +需求，那么这是一个不错的选择。
> > +
> > +通常 :c:func:`list_for_each_entry()` 很有用。
> > +
> > +返回值惯例
> > +------------
> > +
> > +对于在用户上下文中调用的代码，违背C语言惯例是很常见的，即返回0表示成功，返回
> > +负错误值（例如 ``-EFAULT`` ）表示失败。这在一开始可能是不直观的，但在内核中
> > +相当普遍。
> > +
> > +使用 :c:func:`ERR_PTR()` （ ``include/linux/err.h`` ）将负错误值编码到指针中，
> > +然后使用 :c:func:`IS_ERR()` 和 :c:func:`PTR_ERR()` 将其再取出：避免为错误值
> > +使用单独的指针参数。难顶，但是个很好的方式。
> > +
> 
> why icky translate as 难顶 not 讨厌？
>
Both ok, just for fun, maybe fit the article style :)

Thanks for your review!
To be honest, this article is a little hard for me.

Wu X.C.
> 
> Thanks
> Alex
> 

