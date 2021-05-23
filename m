Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5200FC4707A
	for <linux-doc@archiver.kernel.org>; Sun, 23 May 2021 14:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1277861132
	for <linux-doc@archiver.kernel.org>; Sun, 23 May 2021 14:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhEWOcL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 23 May 2021 10:32:11 -0400
Received: from [43.250.32.171] ([43.250.32.171]:6732 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231769AbhEWOcL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 23 May 2021 10:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=S3YtrdDCu5w09cC5ET9zd9gc0DByv2Re4Z126
        ZmMc1M=; b=GEMxfIp1ePzS5zXx22C0b+bnlwlccbsmnQMBvautbKCPWWZazvTBs
        8EC2nwokkk+Q5Xa23qZsIr35OWBNZy0OKC8NrU4SWOmzASdYjNgitqKGX3zA9J1W
        C2qPa/Je0kU/xuy1QqkQbl9B8dCGUcQS09+/elLdlGw6ynnQ1OQXb8=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBnLkEFZ6pgsZQ6AA--.7044S2;
        Sun, 23 May 2021 22:30:31 +0800 (CST)
Date:   Sun, 23 May 2021 22:30:27 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        Fangrui Song <maskray@google.com>
Subject: [PATCH v3] docs/zh_CN: Add translation
 zh_CN/kernel-hacking/locking.rst
Message-ID: <20210523143010.GA3070@bobwxc.top>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBnLkEFZ6pgsZQ6AA--.7044S2
X-Coremail-Antispam: 1UD129KBjvAXoWfKF1UXr1DZry7GF1xtrWDJwb_yoW7Cw1UZo
        WavrWY9w48GFy5JFyrtw4UJF4Uurn5GFsrAFnxKr13Cr1UGF10y348JF43Cry3ArW5CF1r
        Ar1xJ3yUuF18JF1Dn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5-7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vE
        x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262
        IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx2
        6F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrw
        CF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
        rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
        CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
        67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
        0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnLS
        dPUUUUU==
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new translation
  Documentation/translations/zh_CN/kernel-hacking/locking.rst
and link it to zh_CN/kernel-hacking/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
YanTeng and I did not yet have enough capability to review this patch well,
if anyone can help us, I would be grateful :)

v3:
* resend and rebase to newest docs-next tree

v2:
<https://lore.kernel.org/linux-doc/e81dbd91c0afab466d6274ea7c27d20baea75141.1618933932.git.bobwxc@email.cn/>
* modifid some words under YanTeng Si's advices. Thanks his review!
* Translated some notes.

v1:
<https://lore.kernel.org/linux-doc/20210419130049.GA17878@bobwxc.top/T/>

 .../zh_CN/kernel-hacking/index.rst            |    5 +-
 .../zh_CN/kernel-hacking/locking.rst          | 1249 +++++++++++++++++
 2 files changed, 1250 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/kernel-hacking/locking.rst

diff --git a/Documentation/translations/zh_CN/kernel-hacking/index.rst b/Documentation/translations/zh_CN/kernel-hacking/index.rst
index df530de2278d..230439ae21de 100644
--- a/Documentation/translations/zh_CN/kernel-hacking/index.rst
+++ b/Documentation/translations/zh_CN/kernel-hacking/index.rst
@@ -16,7 +16,4 @@
    :maxdepth: 2
 
    hacking
-
-TODO
-
-- locking
+   locking
diff --git a/Documentation/translations/zh_CN/kernel-hacking/locking.rst b/Documentation/translations/zh_CN/kernel-hacking/locking.rst
new file mode 100644
index 000000000000..6550d55acb98
--- /dev/null
+++ b/Documentation/translations/zh_CN/kernel-hacking/locking.rst
@@ -0,0 +1,1249 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/kernel-hacking/locking.rst
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+.. _kernel_hacking_lock_zh:
+
+==========
+锁操作指北
+==========
+
+:Author: Rusty Russell
+
+前言
+====
+
+欢迎来到Rusty的不靠谱内核锁操作问题指南。本文档描述了Linux内核2.6版本的锁系统。
+
+随着Linux内核中超线程和抢占的广泛可用，进行内核编程的每个人都需要了解SMP
+（Symmetrical Multi-Processing，对称多处理）的并发与锁的基本原理。
+
+并发问题
+========
+
+（如果您知道什么是竞态[Race Condition]，请跳过。）
+
+在普通程序中，可以按如下方式递增计数器：
+
+::
+
+          very_important_count++;
+
+
+以下是他们预期会发生的：
+
+.. table:: 预期结果
+
+  +------------------------------------+------------------------------------+
+  | 实例 1                             | 实例 2                             |
+  +====================================+====================================+
+  | 读 very_important_count (5)        |                                    |
+  +------------------------------------+------------------------------------+
+  | 加 1 (6)                           |                                    |
+  +------------------------------------+------------------------------------+
+  | 写 very_important_count (6)        |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | 读 very_important_count (6)        |
+  +------------------------------------+------------------------------------+
+  |                                    | 加 1 (7)                           |
+  +------------------------------------+------------------------------------+
+  |                                    | 写 very_important_count (7)        |
+  +------------------------------------+------------------------------------+
+
+以下是可能会发生的：
+
+.. table:: 可能的结果
+
+  +------------------------------------+------------------------------------+
+  | 实例 1                             | 实例 2                             |
+  +====================================+====================================+
+  | 读 very_important_count (5)        |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | 读 very_important_count (5)        |
+  +------------------------------------+------------------------------------+
+  | 加 1 (6)                           |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | 加 1 (6)                           |
+  +------------------------------------+------------------------------------+
+  | 写 very_important_count (6)        |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | 写 very_important_count (6)        |
+  +------------------------------------+------------------------------------+
+
+
+竞争态势与临界区域
+------------------
+
+这种重叠会导致结果取决于多个任务的相对时间，称为竞争态势（Race Condition，
+竞态）。包含并发问题的代码段称为临界区域（Critical Region）。特别是从Linux
+开始在SMP机器上运行以来，它们成为内核设计和实现中的主要问题之一。
+
+抢占（Preemption）可以产生相同的效果，即使只有一个CPU：通过在临界区域抢占一个
+任务，就会出现一样的竞争条件。在这种情况下，抢占的线程可能会运行临界区域本身。
+
+解决方案是识别这些同步访问何时发生，并使用锁来确保任意时刻只有一个实例可以进
+入临界区域。Linux内核中有许多友好的原语可以帮助您做到这一点。也有一些不好使的
+原语，不过我会假装他们不存在。
+
+Linux内核的锁操作
+=================
+
+如果非要我给你关于锁的建议，那就是 **保持简单** 。
+
+不要轻易引入新锁。
+
+两种主要的内核锁：自旋锁和互斥锁
+--------------------------------
+
+内核锁主要有两种类型。
+
+最基本的类型是自旋锁（spinlock， ``include/asm/spinlock.h`` ），这是一个非常
+简单的单持有者锁：如果无法获得自旋锁，则继续尝试（自旋）直到可以。自旋锁非常
+小且快速，可以在任何地方使用。
+
+第二种类型是互斥锁（mutex， ``include/linux/mutex.h`` ）：它类似于自旋锁，但
+是您可以阻塞获取互斥锁。如果无法加上互斥锁，则任务将挂起，并在释放互斥锁时被
+唤醒。这意味着CPU可以在您等待时执行其他操作。在很多情况下，你无法睡眠（见
+`从中断中调用哪些函数是安全的？`_ ），此时必须改用自旋锁。
+
+这两种锁都不是递归的：请参阅 `死锁：入门与进阶`_ 。
+
+锁和单处理器内核
+----------------
+
+对于编译时未启用 ``CONFIG_SMP`` 和 ``CONFIG_PREEMPT`` 的内核，自旋锁根本不存在。
+这是一个很好的设计决策：当没有其他进程可以同时运行时，锁就没有存在意义了。
+
+如果编译内核时未启用 ``CONFIG_SMP`` ，但是启用了 ``CONFIG_PREEMPT`` ，那么自旋
+锁只会禁用抢占，这足以防止任何竞争。在大多数情况下，我们可以将抢占权视为等同于
+SMP，而不必单独担心它。
+
+您应该始终在启用 ``CONFIG_SMP`` 和 ``CONFIG_PREEMPT`` 的情况下测试锁代码，即使
+您没有SMP测试设备，因为这仍然能捕获某些类型的锁缺陷。
+
+互斥锁仍然存在，因为它们是在用户上下文之间进行同步所必需的，我们将在下面看到。
+
+仅在用户上下文中的锁操作
+------------------------
+
+如果您有一个只能从用户上下文访问的数据结构，那么可以使用一个简单的互斥锁（
+``include/linux/mutex.h`` ）来保护它。这是最简单的情形：初始化互斥锁。然后调用
+mutex_lock_interruptible()来获取互斥锁，或调用mutex_unlock()来释放它。还有一个
+应避免使用的mutex_lock()，因为当收到信号时它不会返回。
+
+示例： ``net/netfilter/nf_sockopt.c`` 允许使用nf_register_sockopt()注册新的
+setsockopt()和getsockopt() 调用。注册和取消注册仅在模块加载和卸载时（以及引导
+时，在没有并发的情况下）完成，并且注册列表仅用于未知的setsockopt()或
+getsockopt()系统调用。 ``nf_sockopt_mutex`` 非常适合用来保护此情况，尤其是因为
+setsockopt和getsockopt调用可能会睡眠。
+
+用户上下文和软中断之间的锁操作
+------------------------------
+
+如果软中断（softirq）需要与用户上下文共享数据，则会产生两个问题。首先，当前
+用户上下文可以被软中断中断；其次，临界区域可以从另一个CPU进入。此时应当使用
+spin_lock_bh()（ ``include/linux/spinlock.h`` ）。它禁用此CPU上的软中断，然后
+获取锁。spin_unlock_bh()执行相反的操作（“_bh”后缀是对“下半部[Bottom Halves]”
+的历史性引用，这是软中断的旧名称。它实际上应该被称为spin_lock_softirq()）。
+
+请注意，您也可以在此处使用 spin_lock_irq()或spin_lock_irqsave()，它们可以停止
+硬中断，请参阅 `硬中断上下文`_ 。
+
+这对UP也非常有效：自旋锁消失，这个宏会直接变成local_bh_disable()（
+``include/linux/interrupt.h`` ），保护您不受正在运行的软中断的影响。
+
+用户上下文和子任务之间的锁操作
+------------------------------
+
+这与上面的完全相同，因为子任务（Tasklet）实际上是从软中断运行的。
+
+用户上下文和计时器之间的锁操作
+------------------------------
+
+这也与上面完全相同，因为计时器实际上也是从软中断运行的。
+从锁的角度来看，子任务和计时器是相同的。
+
+子任务/计时器之间的锁操作
+-------------------------
+
+有时，一个子任务或计时器可能希望与另一个子任务或计时器共享数据。
+
+相同的子任务/计时器
+~~~~~~~~~~~~~~~~~~~
+
+由于子任务永远不会同时在两个CPU上运行，因此您不必担心您的子任务是可重入的
+（一下运行两次），即使是在SMP上。
+
+不同的子任务/计时器
+~~~~~~~~~~~~~~~~~~~
+
+如果另一个子任务/计时器希望与您的子任务或计时器共享数据，则您需要使用
+use spin_lock()和spin_unlock()调用。这里无需使用spin_lock_bh()，因为您已经在
+一个子任务中，并且不会有另一个在同一个CPU上运行。
+
+软中断之间的锁操作
+------------------
+
+软中断常常可能希望与自己或子任务/计时器共享数据。
+
+相同的软中断
+~~~~~~~~~~~~
+
+同样的软中断可以在其他CPU上运行：您可以使用逐CPU数组（参见 `逐CPU数据`_ ）来
+获得更好的性能。如果您打算使用软中断，那么您可能非常关心可伸缩性能，足以处理
+额外的复杂性。
+
+对于共享数据，您需要使用spin_lock()和spin_unlock()。
+
+不同的软中断
+~~~~~~~~~~~~
+
+对于共享数据，您需要使用spin_lock()和spin_unlock()，无论是计时器、子任务、
+相同/不同的软中断或另一个软中断：它们中的任何一个都可以在不同的CPU上运行。
+
+硬中断上下文
+============
+
+硬件中断通常与子任务或软中断通信。这常常涉及到将工作放入队列中，然后软中断会
+将其取出。
+
+硬中断和软中断/子任务之间的锁操作
+---------------------------------
+
+如果硬件中断处理程序需要与软中断共享数据，则有两个问题。首先，通过硬件中断
+可以中断软中断处理；其次，通过另一CPU上的硬件中断可以进入临界区域。此时应
+使用spin_lock_irq()。它定义为禁用该CPU上的中断，然后获取锁。spin_unlock_irq()
+执行相反的操作。
+
+中断处理程序无需使用spin_lock_irq()，因为在中断处理程序运行时软中断不能运行：
+它可以使用spin_lock()，会稍微快一点。唯一的例外是，如果不同的硬件中断处理程序
+使用相同的锁：spin_lock_irq()将阻止它中断我们。
+
+这对UP也非常有效：自旋锁消失，这个宏会直接变成local_irq_disable()（
+``include/asm/smp.h`` ），它保护您不受软中断/子任务/下半部运行的影响。
+
+spin_lock_irqsave()（ ``include/linux/spinlock.h`` ）是一个变体，它会在一个
+标志字中保存中断是打开还是关闭，此标志字将被传递给spin_unlock_irqrestore()。
+这意味着可以在硬中断处理程序（中断已经关闭时）和软中断（需要禁用中断）中使用
+相同的代码。
+
+请注意，软中断（以及其产生的子任务和计时器）是在硬件中断返回时运行的，因此
+spin_lock_irq()也会停止这些操作。从这个意义上说，spin_lock_irqsave()是最通用、
+最强大的锁操作函数。
+
+两个硬中断处理器之间的锁操作
+----------------------------
+
+在两个中断处理程序之间共享数据是很少见的，但是如果这样做，则应该使用
+spin_lock_irqsave() ：是否在中断处理程序内部禁用所有中断取决于特定体系结构。
+
+锁操作速查表
+============
+
+Pete Zaitcev给出了以下总结：
+
+-  如果您处于进程上下文（任何系统调用）中，并且希望加锁排除其他进程，请使用
+   互斥锁。您可以持有互斥锁并休眠（ ``copy_from_user*()`` 或
+   ``kmalloc(x,GFP_KERNEL)`` ）。
+
+-  否则（即数据可在中断中被访问）请使用spin_lock_irqsave()和
+   spin_unlock_irqrestore()。
+
+-  避免在超过5行代码和任何函数调用中使用自旋锁（readb()之类的访问器除外）。
+
+最低要求表
+----------
+
+下表列出了不同上下文之间的 **最低** 锁操作要求。在某些情况下，同一上下文一次
+只能在一个CPU上运行，因此该上下文无需加锁（例如，特定线程一次只能在一个CPU上
+运行，但如果它需要与另一个线程共享数据，则需要加锁）。
+
+记住上面的建议：您总是可以使用spin_lock_irqsave()，它是所有其他自旋锁原语的超集。
+
+.. table:: 锁操作要求表
+
+  ============== ============= ============= ========= ========= ========= ========= ======= ======= ============== ==============
+                 中断处理程序A 中断处理程序B 软中断A   软中断B   子任务A   子任务B   计时器A 计时器B 用户上下文A    用户上下文B
+  ============== ============= ============= ========= ========= ========= ========= ======= ======= ============== ==============
+  中断处理程序A  None
+  中断处理程序B  SLIS          None
+  软中断A        SLI           SLI           SL
+  软中断B        SLI           SLI           SL        SL
+  子任务A        SLI           SLI           SL        SL        None
+  子任务B        SLI           SLI           SL        SL        SL        None
+  计时器A        SLI           SLI           SL        SL        SL        SL        None
+  计时器B        SLI           SLI           SL        SL        SL        SL        SL      None
+  用户上下文A    SLI           SLI           SLBH      SLBH      SLBH      SLBH      SLBH    SLBH    None
+  用户上下文B    SLI           SLI           SLBH      SLBH      SLBH      SLBH      SLBH    SLBH    MLI            None
+  ============== ============= ============= ========= ========= ========= ========= ======= ======= ============== ==============
+
+.. table:: 锁操作要求表 注释
+
+  +--------+----------------------------+
+  | SLIS   | spin_lock_irqsave          |
+  +--------+----------------------------+
+  | SLI    | spin_lock_irq              |
+  +--------+----------------------------+
+  | SL     | spin_lock                  |
+  +--------+----------------------------+
+  | SLBH   | spin_lock_bh               |
+  +--------+----------------------------+
+  | MLI    | mutex_lock_interruptible   |
+  +--------+----------------------------+
+
+试锁（trylock）函数
+===================
+
+这些函数只尝试获取一次锁，并立即返回一个值说明获取锁成功或失败。如果你无需
+访问受其他线程持有的锁保护的数据，可以使用它们。如果需要访问受锁保护的数据，
+则应稍后获取锁。
+
+spin_trylock()不会自旋，但若在首次尝试时获得自旋锁则返回非零，否则返回零。此
+函数可以像spin_lock()一样在所有上下文中使用：您必须禁用可能中断您并获取自旋锁
+的上下文。
+
+mutex_trylock()不会挂起任务，但若其在首次尝试时获得互斥锁，则返回非零，否则
+返回零。尽管未休眠，但此功能在硬件或软件中断上下文中无法安全使用。
+
+常见例子
+========
+
+让我们来看一个简单的例子：一个数字到名称映射的缓存（a cache of number to name
+mappings）。缓存记录每个对象的使用频率，当缓存满了时，抛出最少使用的对象。
+
+完全在用户上下文中
+------------------
+
+对于第一个示例，我们假设所有操作都在用户上下文中（即来自系统调用），因此我们
+可以休眠。这意味着我们可以使用互斥锁来保护缓存和其中的所有对象。代码如下::
+
+    #include <linux/list.h>
+    #include <linux/slab.h>
+    #include <linux/string.h>
+    #include <linux/mutex.h>
+    #include <asm/errno.h>
+
+    struct object
+    {
+            struct list_head list;
+            int id;
+            char name[32];
+            int popularity;
+    };
+
+    /* 保护cache，cache_num以及其内部的对象 */
+    static DEFINE_MUTEX(cache_lock);
+    static LIST_HEAD(cache);
+    static unsigned int cache_num = 0;
+    #define MAX_CACHE_SIZE 10
+
+    /* 必须持有cache_lock */
+    static struct object *__cache_find(int id)
+    {
+            struct object *i;
+
+            list_for_each_entry(i, &cache, list)
+                    if (i->id == id) {
+                            i->popularity++;
+                            return i;
+                    }
+            return NULL;
+    }
+
+    /* 必须持有cache_lock */
+    static void __cache_delete(struct object *obj)
+    {
+            BUG_ON(!obj);
+            list_del(&obj->list);
+            kfree(obj);
+            cache_num--;
+    }
+
+    /* 必须持有cache_lock */
+    static void __cache_add(struct object *obj)
+    {
+            list_add(&obj->list, &cache);
+            if (++cache_num > MAX_CACHE_SIZE) {
+                    struct object *i, *outcast = NULL;
+                    list_for_each_entry(i, &cache, list) {
+                            if (!outcast || i->popularity < outcast->popularity)
+                                    outcast = i;
+                    }
+                    __cache_delete(outcast);
+            }
+    }
+
+    int cache_add(int id, const char *name)
+    {
+            struct object *obj;
+
+            if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+                    return -ENOMEM;
+
+            strscpy(obj->name, name, sizeof(obj->name));
+            obj->id = id;
+            obj->popularity = 0;
+
+            mutex_lock(&cache_lock);
+            __cache_add(obj);
+            mutex_unlock(&cache_lock);
+            return 0;
+    }
+
+    void cache_delete(int id)
+    {
+            mutex_lock(&cache_lock);
+            __cache_delete(__cache_find(id));
+            mutex_unlock(&cache_lock);
+    }
+
+    int cache_find(int id, char *name)
+    {
+            struct object *obj;
+            int ret = -ENOENT;
+
+            mutex_lock(&cache_lock);
+            obj = __cache_find(id);
+            if (obj) {
+                    ret = 0;
+                    strcpy(name, obj->name);
+            }
+            mutex_unlock(&cache_lock);
+            return ret;
+    }
+
+请注意，在添加、删除或查找缓存时，我们始终确保拥有cache_lock缓存锁：缓存基础
+结构本身和对象的内容都受到锁的保护。本例中这很容易，因为我们为用户复制数据，
+从不会让他们直接访问对象。
+
+这里有一个小（也是常见的）优化：在cache_add()中，我们在获取锁之前设置对象的
+字段。这是安全的，因为在我们将它放入缓存之前，其他人无法访问它。
+
+从中断上下文访问
+----------------
+
+现在考虑可以从中断上下文调用cache_find()的情况：可以是硬中断或软中断。
+例如从缓存中删除对象的计时器。
+
+下面以标准补丁格式显示了更改： ``-`` 是删除的行，而 ``+`` 是增加的行。
+
+::
+
+    --- cache.c.usercontext 2003-12-09 13:58:54.000000000 +1100
+    +++ cache.c.interrupt   2003-12-09 14:07:49.000000000 +1100
+    @@ -12,7 +12,7 @@
+             int popularity;
+     };
+
+    -static DEFINE_MUTEX(cache_lock);
+    +static DEFINE_SPINLOCK(cache_lock);
+     static LIST_HEAD(cache);
+     static unsigned int cache_num = 0;
+     #define MAX_CACHE_SIZE 10
+    @@ -55,6 +55,7 @@
+     int cache_add(int id, const char *name)
+     {
+             struct object *obj;
+    +        unsigned long flags;
+
+             if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+                     return -ENOMEM;
+    @@ -63,30 +64,33 @@
+             obj->id = id;
+             obj->popularity = 0;
+
+    -        mutex_lock(&cache_lock);
+    +        spin_lock_irqsave(&cache_lock, flags);
+             __cache_add(obj);
+    -        mutex_unlock(&cache_lock);
+    +        spin_unlock_irqrestore(&cache_lock, flags);
+             return 0;
+     }
+
+     void cache_delete(int id)
+     {
+    -        mutex_lock(&cache_lock);
+    +        unsigned long flags;
+    +
+    +        spin_lock_irqsave(&cache_lock, flags);
+             __cache_delete(__cache_find(id));
+    -        mutex_unlock(&cache_lock);
+    +        spin_unlock_irqrestore(&cache_lock, flags);
+     }
+
+     int cache_find(int id, char *name)
+     {
+             struct object *obj;
+             int ret = -ENOENT;
+    +        unsigned long flags;
+
+    -        mutex_lock(&cache_lock);
+    +        spin_lock_irqsave(&cache_lock, flags);
+             obj = __cache_find(id);
+             if (obj) {
+                     ret = 0;
+                     strcpy(name, obj->name);
+             }
+    -        mutex_unlock(&cache_lock);
+    +        spin_unlock_irqrestore(&cache_lock, flags);
+             return ret;
+     }
+
+请注意，若中断打开，spin_lock_irqsave()会将其关闭，否则什么也不做（如果我们
+已经在中断处理程序中），因此这些函数可以从任何上下文安全调用。
+
+不幸的是，cache_add()使用 ``GFP_KERNEL`` 标志调用kmalloc()，这只在用户上下文
+中是合法的。我假设cache_add()仍然只在用户上下文中调用，否则这应该成为
+cache_add()的参数。
+
+暴露于此文件之外的对象
+----------------------
+
+如果我们的对象包含更多的信息，那么只将信息复制进复制出可能是不够的：例如，
+代码的其他部分可能希望保留指向这些对象的指针，而不是每次都查找id。这就产生了
+两个问题。
+
+第一个问题是我们使用 ``cache_lock`` 来保护对象：这需要使它成为非静态的，以便
+代码的其余部分可以使用它。这使得加锁变得更加棘手，因为它不再是全在一处。
+
+第二个问题是生命周期问题：如果另一个结构保留一个指向对象的指针，它可能希望该
+指针保持有效。但这只能在您持有锁时保证有效，否则有人可能会调用cache_delete()，
+或更糟的是添加了另一个重新使用相同地址的对象。
+
+因为只有一把锁，你不能永远持有它：这会导致别人没法完成其他工作。
+
+此问题的解决方案是使用引用计数：每个有指向对象的指针的程序在第一次得到对象时
+都会增加引用计数，而在处理完对象时会减少引用计数。当引用计数归零时，对象就是
+未使用的且可以被删除。
+
+代码如下::
+
+    --- cache.c.interrupt   2003-12-09 14:25:43.000000000 +1100
+    +++ cache.c.refcnt  2003-12-09 14:33:05.000000000 +1100
+    @@ -7,6 +7,7 @@
+     struct object
+     {
+             struct list_head list;
+    +        unsigned int refcnt;
+             int id;
+             char name[32];
+             int popularity;
+    @@ -17,6 +18,35 @@
+     static unsigned int cache_num = 0;
+     #define MAX_CACHE_SIZE 10
+
+    +static void __object_put(struct object *obj)
+    +{
+    +        if (--obj->refcnt == 0)
+    +                kfree(obj);
+    +}
+    +
+    +static void __object_get(struct object *obj)
+    +{
+    +        obj->refcnt++;
+    +}
+    +
+    +void object_put(struct object *obj)
+    +{
+    +        unsigned long flags;
+    +
+    +        spin_lock_irqsave(&cache_lock, flags);
+    +        __object_put(obj);
+    +        spin_unlock_irqrestore(&cache_lock, flags);
+    +}
+    +
+    +void object_get(struct object *obj)
+    +{
+    +        unsigned long flags;
+    +
+    +        spin_lock_irqsave(&cache_lock, flags);
+    +        __object_get(obj);
+    +        spin_unlock_irqrestore(&cache_lock, flags);
+    +}
+    +
+     /* Must be holding cache_lock */
+     static struct object *__cache_find(int id)
+     {
+    @@ -35,6 +65,7 @@
+     {
+             BUG_ON(!obj);
+             list_del(&obj->list);
+    +        __object_put(obj);
+             cache_num--;
+     }
+
+    @@ -63,6 +94,7 @@
+             strscpy(obj->name, name, sizeof(obj->name));
+             obj->id = id;
+             obj->popularity = 0;
+    +        obj->refcnt = 1; /* The cache holds a reference */
+
+             spin_lock_irqsave(&cache_lock, flags);
+             __cache_add(obj);
+    @@ -79,18 +111,15 @@
+             spin_unlock_irqrestore(&cache_lock, flags);
+     }
+
+    -int cache_find(int id, char *name)
+    +struct object *cache_find(int id)
+     {
+             struct object *obj;
+    -        int ret = -ENOENT;
+             unsigned long flags;
+
+             spin_lock_irqsave(&cache_lock, flags);
+             obj = __cache_find(id);
+    -        if (obj) {
+    -                ret = 0;
+    -                strcpy(name, obj->name);
+    -        }
+    +        if (obj)
+    +                __object_get(obj);
+             spin_unlock_irqrestore(&cache_lock, flags);
+    -        return ret;
+    +        return obj;
+     }
+
+我们将引用计数封装进标准的“get”和“put”函数中。现在我们可以从cache_find()返回
+对象本身，这样做的好处是用户现在可以在持有对象时休眠（例如用copy_to_user()将
+name复制到userspace）。
+
+需要注意的另一点是，应为指向对象的每个指针保留一个引用：因此当首次插入缓存时，
+引用计数当是1。在某些版本中，框架不占用引用计数，但它们更复杂。
+
+对引用计数使用原子操作
+~~~~~~~~~~~~~~~~~~~~~~
+
+在实践中，:c:type:`atomic_t` 通常被用于引用计数。 ``include/asm/atomic.h`` 中
+定义了许多原子操作：这些操作可以保证在系统所有CPU中的原子可见性，因此不需要锁。
+这使它比使用自旋锁更简单，尽管对于任何非琐碎的事情，使用自旋锁更清楚。用
+atomic_inc()和atomic_dec_and_test()来代替标准的递增和递减运算符，就无需使用锁
+来保护引用计数本身了。
+
+::
+
+    --- cache.c.refcnt  2003-12-09 15:00:35.000000000 +1100
+    +++ cache.c.refcnt-atomic   2003-12-11 15:49:42.000000000 +1100
+    @@ -7,7 +7,7 @@
+     struct object
+     {
+             struct list_head list;
+    -        unsigned int refcnt;
+    +        atomic_t refcnt;
+             int id;
+             char name[32];
+             int popularity;
+    @@ -18,33 +18,15 @@
+     static unsigned int cache_num = 0;
+     #define MAX_CACHE_SIZE 10
+
+    -static void __object_put(struct object *obj)
+    -{
+    -        if (--obj->refcnt == 0)
+    -                kfree(obj);
+    -}
+    -
+    -static void __object_get(struct object *obj)
+    -{
+    -        obj->refcnt++;
+    -}
+    -
+     void object_put(struct object *obj)
+     {
+    -        unsigned long flags;
+    -
+    -        spin_lock_irqsave(&cache_lock, flags);
+    -        __object_put(obj);
+    -        spin_unlock_irqrestore(&cache_lock, flags);
+    +        if (atomic_dec_and_test(&obj->refcnt))
+    +                kfree(obj);
+     }
+
+     void object_get(struct object *obj)
+     {
+    -        unsigned long flags;
+    -
+    -        spin_lock_irqsave(&cache_lock, flags);
+    -        __object_get(obj);
+    -        spin_unlock_irqrestore(&cache_lock, flags);
+    +        atomic_inc(&obj->refcnt);
+     }
+
+     /* Must be holding cache_lock */
+    @@ -65,7 +47,7 @@
+     {
+             BUG_ON(!obj);
+             list_del(&obj->list);
+    -        __object_put(obj);
+    +        object_put(obj);
+             cache_num--;
+     }
+
+    @@ -94,7 +76,7 @@
+             strscpy(obj->name, name, sizeof(obj->name));
+             obj->id = id;
+             obj->popularity = 0;
+    -        obj->refcnt = 1; /* The cache holds a reference */
+    +        atomic_set(&obj->refcnt, 1); /* The cache holds a reference */
+
+             spin_lock_irqsave(&cache_lock, flags);
+             __cache_add(obj);
+    @@ -119,7 +101,7 @@
+             spin_lock_irqsave(&cache_lock, flags);
+             obj = __cache_find(id);
+             if (obj)
+    -                __object_get(obj);
+    +                object_get(obj);
+             spin_unlock_irqrestore(&cache_lock, flags);
+             return obj;
+     }
+
+保护对象本身
+------------
+
+在这些示例中，我们假设对象（引用计数除外）在创建后从未更改。如果我们想更改
+名称，则有三种可能：
+
+-  您可以使 ``cache_lock`` 成为非静态的，并告诉人们在更改任何对象的名称之前
+   获取该锁。
+
+-  您可以提供一个cache_obj_rename()函数来获取此锁并更改调用者的名称，并告诉
+   所有人使用该函数。
+
+-  您可以使 ``cache_lock`` 仅保护缓存本身，并使用另一个锁来保护名称。
+
+理论上来说，可以使锁的粒度精细到每一个字段、每一个对象。
+实际上，最常见的变体是：
+
+-  一个锁保护基础结构（本例中的 ``cache`` 缓存列表）和所有对象。这就是我们
+   现在所做的。
+
+-  一个锁保护基础结构（包括对象中的列表指针），一个锁保护对象中的其余部分。
+
+-  多个锁来保护基础设施（例如，每个哈希链一个锁），可能每个对象都有一个单独
+   的锁。
+
+以下是“每个对象一个锁”的实现：
+
+::
+
+    --- cache.c.refcnt-atomic   2003-12-11 15:50:54.000000000 +1100
+    +++ cache.c.perobjectlock   2003-12-11 17:15:03.000000000 +1100
+    @@ -6,11 +6,17 @@
+
+     struct object
+     {
+    +        /* These two protected by cache_lock. */
+             struct list_head list;
+    +        int popularity;
+    +
+             atomic_t refcnt;
+    +
+    +        /* Doesn't change once created. */
+             int id;
+    +
+    +        spinlock_t lock; /* Protects the name */
+             char name[32];
+    -        int popularity;
+     };
+
+     static DEFINE_SPINLOCK(cache_lock);
+    @@ -77,6 +84,7 @@
+             obj->id = id;
+             obj->popularity = 0;
+             atomic_set(&obj->refcnt, 1); /* The cache holds a reference */
+    +        spin_lock_init(&obj->lock);
+
+             spin_lock_irqsave(&cache_lock, flags);
+             __cache_add(obj);
+
+注意，我使用 ``cache_lock`` 来保护活跃度计数，而不是逐对象锁：这是因为它（像
+对象中的 :c:type:`struct list_head <list_head>` ）在逻辑上是基础结构的一部分。
+这样就不需要在寻找最不活跃的对象时获取__cache_add()中每个对象的锁。
+
+我还使id成员为不可更改，这样就无需一一获取__cache_find()中的对象锁来检查id：
+对象锁只由希望读取或写入名称字段的调用者使用。
+
+还要注意，我添加了一个描述哪些数据受哪些锁的保护的注释。这一点非常重要，因为
+它描述了代码运行时的行为，并且很难直接看出来。正如Alan Cox所说，“对数据加锁，
+而不是代码”。
+
+常见问题
+========
+
+死锁：入门与进阶
+----------------
+
+一段代码试图两次获取同一自旋锁会导致错误：它将永远自旋，等待锁被释放（自旋锁、
+读写锁[rwlocks]和互斥锁在Linux中不是递归的）。这诊断起来很简单琐碎：不是一个
+“我想了十天十夜……”的问题。
+
+对于稍微复杂一点的情况，假设您有一个由软中断和用户上下文共享的区域。如果您调用
+spin_lock()来保护它，那么当软中断持有锁时，用户上下文可能会被中断，然后软中断
+会一直旋转以试图获取同一锁。
+
+这两种情况都称为死锁，如上所示，即使只有一个CPU也会发生死锁（尽管在UP编译中不
+是这样，因为在 ``CONFIG_SMP = n`` 的内核编译中，自旋锁会消失。不过第二个示例中
+仍然会出现数据损坏）。
+
+这种完全锁定很容易诊断：在SMP计算机上发生这种情况时，看门狗计时器或开启
+``DEBUG_SPINLOCK`` 设置（ ``include/linux/spinlock.h`` ）编译会立即显示出来。
+
+更复杂的一种情况是所谓的“致命拥抱（deadly embrace）”，同时涉及两个或多个锁。
+假设您有一个哈希表：表中的每个条目都是一个自旋锁和一个哈希对象链。在软中断
+处理程序中，有时需要将对象从哈希中的一个位置更改为另一个位置：获取旧哈希链的
+自旋锁和新哈希链的自旋锁，然后从旧哈希链中删除对象，并将其插入新散列链中。
+
+这里有两个问题。首先，如果您的代码试图将对象移动到同一个链中，它将在两次尝试
+锁定对象时与自身死锁。其次，如果另一个CPU上的同一个软中断正试图反向移动另一个
+对象，则可能发生以下情况：
+
+.. table:: 结果表
+
+  +-------------------+-------------------+
+  | CPU 1             | CPU 2             |
+  +===================+===================+
+  | 获取锁A -> OK     | 获取锁B -> OK     |
+  +-------------------+-------------------+
+  | 获取锁B -> 自旋   | 获取锁A -> 自旋   |
+  +-------------------+-------------------+
+
+两个CPU将永远自旋，等待另一个放弃锁。如果这看起来像事故、闻起来像事故、感觉
+起来也像事故，那十足是个事故。
+
+防止出现死锁
+------------
+
+教科书会告诉你，如果你总是按照固定顺序加锁，那永远不会出现死锁。
+但实践会告诉您，这种方法没有扩展性：当创建一个新锁时，我对内核的理解程度尚
+无法确定它在5000级锁层次结构中的位置。
+
+最好的锁是经过封装的：它们从不暴露在头文件中，也从不被对同一文件外的复杂函数
+的调用所持有。您可以通读这段代码并看到它永远不会死锁，因为它在持有某个锁时从不
+尝试获取另一个同样的锁。使用你代码的人甚至不需要知道你在使用锁。
+
+当您提供回调或钩子时，会出现一个经典的问题：如果您在持有锁的情况下调用这些
+回调或钩子，您将面临“简单的死锁”或“致命拥抱”（谁知道回调会做什么？）。记住，
+其他程序员都是来搞你的，所以不要这样做。
+
+过分防止死锁
+~~~~~~~~~~~~
+
+死锁是个问题，但没有数据损坏那么严重。获取读锁、搜索列表、找不到所需内容、
+放弃读锁、获取写锁以及插入对象这些操作的代码是具有竞争条件的。
+
+如果你尚未清楚原因，请不要轻易改动代码。
+
+竞争计时器：内核的空闲
+----------------------
+
+计时器会出现其特有的竞争问题。试想一个对象集合（列表、散列等），其中每个对象
+都有一个计时器，该计时器将销毁它。
+
+如果要销毁整个集合（例如在删除模块时），可以执行以下操作::
+
+            /* 这段代码很糟糕：如果情况再糟一点点，
+            它将使用匈牙利符号（HUNGARIAN NOTATION）*/
+            spin_lock_bh(&list_lock);
+
+            while (list) {
+                    struct foo *next = list->next;
+                    del_timer(&list->timer);
+                    kfree(list);
+                    list = next;
+            }
+
+            spin_unlock_bh(&list_lock);
+
+
+这迟早会在SMP上崩溃，因为一个计时器可能在spin_lock_bh()之前刚刚关闭，它只会
+在我们spin_unlock_bh()之后获得锁，然后尝试释放 **已经释放了的** 元素。
+
+这可以通过检查del_timer()的结果来避免：如果它返回1，则表示计时器已被删除。
+如果为0，（在本例中）则表示它当前正在运行，因此我们可以这样做::
+
+            retry:
+                    spin_lock_bh(&list_lock);
+
+                    while (list) {
+                            struct foo *next = list->next;
+                            if (!del_timer(&list->timer)) {
+                                    /* Give timer a chance to delete this */
+                                    spin_unlock_bh(&list_lock);
+                                    goto retry;
+                            }
+                            kfree(list);
+                            list = next;
+                    }
+
+                    spin_unlock_bh(&list_lock);
+
+
+另一个常见问题是要删除会重启自己的计时器（计时器函数末尾调用了add_timer()）。
+这是一种很常见的容易引发竞争的情况，应该使用del_timer_sync()
+（ ``include/linux/timer.h`` ）来处理。它返回我们最终阻止计时器重新添加自身
+之前必须删除的次数。
+
+锁操作速度
+==========
+
+在考虑某些执行锁操作代码的速度时，主要有三个问题值得注意。首先是并发性：当某
+函数持有锁时，有多少事情要等待。其次是实际获取和释放非竞争锁所需的时间。第三
+是使用更少或更智能的锁。这里我假设锁使用得相当频繁，否则您就不太会关心效率。
+
+并发性取决于通常锁被持有的时间：您应该根据需要持有锁，不可无端获取。在cache
+示例中，我们总是在不持有锁的情况下创建对象，只有之后准备将其插入列表时才获取锁。
+
+获取时间取决于锁操作对流水线（pipeline）造成的破坏程度（流水线暂停）以及该CPU
+最后一个获取锁的可能性（即该CPU的锁缓存是否热）：在具有更多CPU的机器上，这种
+可能性下降得很快。以700MHz Intel Pentium III为例：一条指令大约需要0.7ns，一个
+原子增加大约需要58ns，一个CPU上热缓存的锁需要160ns，从另一个CPU传输缓存线需要
+额外的170到360ns（这些数据来自Paul McKenney的 `Linux Journal RCU 文章
+<http://www.linuxjournal.com/article.php?sid=6993>`_ ）。
+
+这两个目标是冲突的：缩短锁的持有时间可以通过将锁分成几个部分来完成的（例如
+最后的逐对象锁示例），但是这会增加锁获取操作的数量，且结果通常比持有一个锁慢。
+这也是提倡简单锁操作的另一个原因。
+
+第三个问题如下：有一些方法可以减少需要执行的锁操作数量。
+
+读/写锁变体
+-----------
+
+自旋锁和互斥锁都有读/写变体： ``rwlock_t`` 和 :c:type:`struct rw_semaphore
+<rw_semaphore>` 。这将操作分为两类：读和写。如果只读取数据，则可以获得读锁；
+但要写入数据，则需要写锁。读锁可由多人持有，但写锁持有者必须唯一。
+
+如果您的代码读/写器清晰分离（就像我们的缓存代码那样），并且锁由读写器持有相当
+长的时间，那么使用这些锁会有所帮助。不过它们比普通锁稍慢，因此在实践中
+``rwlock_t`` 通常不值得使用。
+
+避免加锁：读-复制-更新
+----------------------
+
+有一种特殊的读/写锁定方法称为读-复制-更新（Read Copy Update，RCU）。使用RCU，
+读取程序可以完全避免使用锁：因为我们期望缓存的读取频率比更新频率高（否则缓存
+是浪费时间），所以它适用这种优化。
+
+那我们如何摆脱读锁呢？摆脱读锁意味着写程序可能会更改读程序下面的列表。这实际
+上非常简单：如果写程序非常小心地添加元素，我们可以在添加元素时读取链表。
+例如，向名为 ``list`` 的单链表添加 ``new`` ::
+
+            new->next = list->next;
+            wmb();
+            list->next = new;
+
+
+wmb()是一个写内存屏障（write memory barrier）。它确保第一个操作（设置新元素的
+``next`` 指针）是完整的，并且在第二个操作（将新元素放入列表）之前所有CPU都可
+见。这一点很重要，因为现代编译器和现代CPU都可以对指令重新排序（除非另有说明）：
+我们希望读取程序要么根本看不到新元素，要么看到 ``next`` 指针正确指向列表其余
+部分的新元素。
+
+幸运的是，对于标准的 :c:type:`struct list_head <list_head>` 列表有一个函数可以
+做到这一点：list_add_rcu()（ ``include/linux/list.h`` ）。
+
+Fortunately, there is a function to do this for standard
+:c:type:`struct list_head <list_head>` lists:
+list_add_rcu() (``include/linux/list.h``).
+
+从列表中删除元素更简单：我们将指向旧元素的指针替换为指向其后续元素的指针，读取
+程序要么可以看到它，要么跳过它。
+
+::
+
+            list->next = old->next;
+
+list_del_rcu()（ ``include/linux/list.h`` ）函数可以做这个（普通版本会毒化旧
+对象，这是我们不希望的）。
+
+读取程序也必须小心：一些CPU可以查看 ``next`` 指针，以便尽早开始读取下一个元素
+的内容，但当 ``next`` 指针在其后更改时，无法发现到预读的内容是错误的。同样，
+list_for_each_entry_rcu()（ ``include/linux/list.h`` ）可以帮助您。当然，写入
+程序可以只使用list_for_each_entry()，因为不能同时有两个写入程序。
+
+最后一个难题是：我们什么时候才能真正销毁移除的元素？记住，读取程序可能正在列表
+中读到这个元素：如果释放这个元素并且 ``next`` 指针发生变化，读取程序就会跳进
+垃圾堆并崩溃。我们需要等到遍历列表的所有读取程序都完成了才可以删除元素。可使用
+call_rcu()注册一个回调，一旦所有预先存在的读取程序都完成，回调就会销毁该对象。
+或者，synchronize_rcu()可以用于阻止释放直到所有预先存在的读取程序完成。
+
+那么读-复制-更新如何知道读取程序何时完成？方法是：首先，读取程序总是遍历
+rcu_read_lock()/rcu_read_unlock()对中的列表：这直接禁用了抢占，以使读取程序
+在读取列表时不会休眠。
+
+然后RCU等待每个CPU至少休眠一次：由于读取程序无法休眠，这样我们就知道在删除过程
+中遍历列表的所有读取程序都已经完成，并且触发回调。真正的读-复制-更新代码比这
+更优化了一点，但基本原理相同。
+
+::
+
+    --- cache.c.perobjectlock   2003-12-11 17:15:03.000000000 +1100
+    +++ cache.c.rcupdate    2003-12-11 17:55:14.000000000 +1100
+    @@ -1,15 +1,18 @@
+     #include <linux/list.h>
+     #include <linux/slab.h>
+     #include <linux/string.h>
+    +#include <linux/rcupdate.h>
+     #include <linux/mutex.h>
+     #include <asm/errno.h>
+
+     struct object
+     {
+    -        /* These two protected by cache_lock. */
+    +        /* This is protected by RCU */
+             struct list_head list;
+             int popularity;
+
+    +        struct rcu_head rcu;
+    +
+             atomic_t refcnt;
+
+             /* Doesn't change once created. */
+    @@ -40,7 +43,7 @@
+     {
+             struct object *i;
+
+    -        list_for_each_entry(i, &cache, list) {
+    +        list_for_each_entry_rcu(i, &cache, list) {
+                     if (i->id == id) {
+                             i->popularity++;
+                             return i;
+    @@ -49,19 +52,25 @@
+             return NULL;
+     }
+
+    +/* Final discard done once we know no readers are looking. */
+    +static void cache_delete_rcu(void *arg)
+    +{
+    +        object_put(arg);
+    +}
+    +
+     /* Must be holding cache_lock */
+     static void __cache_delete(struct object *obj)
+     {
+             BUG_ON(!obj);
+    -        list_del(&obj->list);
+    -        object_put(obj);
+    +        list_del_rcu(&obj->list);
+             cache_num--;
+    +        call_rcu(&obj->rcu, cache_delete_rcu);
+     }
+
+     /* Must be holding cache_lock */
+     static void __cache_add(struct object *obj)
+     {
+    -        list_add(&obj->list, &cache);
+    +        list_add_rcu(&obj->list, &cache);
+             if (++cache_num > MAX_CACHE_SIZE) {
+                     struct object *i, *outcast = NULL;
+                     list_for_each_entry(i, &cache, list) {
+    @@ -104,12 +114,11 @@
+     struct object *cache_find(int id)
+     {
+             struct object *obj;
+    -        unsigned long flags;
+
+    -        spin_lock_irqsave(&cache_lock, flags);
+    +        rcu_read_lock();
+             obj = __cache_find(id);
+             if (obj)
+                     object_get(obj);
+    -        spin_unlock_irqrestore(&cache_lock, flags);
+    +        rcu_read_unlock();
+             return obj;
+     }
+
+请注意，读取程序将更改__cache_find()中的活跃成员，现在它不持有锁。一种解决方案
+是让其成为 ``atomic_t`` ，但对于这种用法，我们并不真正关心竞争：近似的结果就
+足够了，所以我没有更改它。
+
+结果是cache_find（不需要与任何其他函数同步，因此在SMP上的速度几乎与在UP上的速
+度一样快。
+
+还有一个可以进一步优化的点：还记得我们原来的缓存代码吗，没有引用计数，调用者
+在使用对象时直接持有锁？这仍然是可能的：如果您持有锁，没有人可以删除对象，这样
+您就不需要获取并放置引用计数。
+
+现在，由于RCU中的“读取锁”只是禁用了抢占，所以在调用cache_find()和object_put()
+之间始终禁用了抢占的调用者不需要实际获取和放置引用计数：我们可以通过使其成为
+非静态来暴露__cache_find()，这样的调用者可以直接调用。
+
+这样的好处是引用计数不会被写入：对象不会以任何方式更改，这在SMP机器上由于缓存
+而快得多。
+
+逐CPU数据
+---------
+
+另一种被广泛使用的避免锁的技术是为每个CPU复制信息。例如，如果您想保持一个常见
+条件的计数，可以使用自旋锁和单个计数器。又好又简单。
+
+如果速度太慢（通常不会，但是如果你有一台非常大的机器可以测试就会发现这种情况），
+你可以为每个CPU使用一个计数器，那么它们都不需要独占锁。请参见DEFINE_PER_CPU()，
+get_cpu_var()和put_cpu_var()（ ``include/linux/percpu.h`` ）。
+
+对于简单的逐CPU计数器， ``local_t`` 类型、cpu_local_inc()和相关函数特别有用，
+它们在某些体系结构（ ``包括/asm/local.h`` ）上比简单代码更有效。
+
+请注意，如果不引入更多锁，就没有简单、可靠的方法来获取此类计数器的精确值。
+不过对于某些用途来说，这并不是问题。
+
+主要由中断处理程序使用的数据
+----------------------------
+
+如果总是从同一个中断处理程序中访问数据，则根本不需要锁：内核已经保证中断处理
+程序不会在多个CPU上同时运行。
+
+Manfred Spraul指出您仍然可以这样做，即使数据偶尔在用户上下文或软中断/子任务中
+访问。中断处理程序不使用锁，所有其他访问都是这样进行的::
+
+        spin_lock(&lock);
+        disable_irq(irq);
+        ...
+        enable_irq(irq);
+        spin_unlock(&lock);
+
+disable_irq()会阻止中断处理程序运行（如果它当前正在其他CPU上运行，则等待它
+完成）。自旋锁会阻止任何其他访问同时发生。当然，这比单个spin_lock_irq()调用
+要慢，所以只有在这种访问很少发生时才有意义。
+
+从中断中调用哪些函数是安全的？
+==============================
+
+
+内核休眠中的许多函数（即call schedule()）都是直接或间接的：在持有自旋锁或禁用
+抢占的情况下，永远不能调用它们。这也意味着您需要处于用户上下文中：从中断调用
+它们是不允许的。
+
+一些休眠的函数
+--------------
+
+下面列出了最常见的一些，但是您通常必须阅读代码才能确定其他调用是否安全。如果
+其他调用它的程序都可以休眠，你可能也可以休眠。特别是，注册和注销函数通常期望
+从用户上下文调用，并且可以休眠。
+
+-  访问用户空间：
+
+   -  copy_from_user()
+
+   -  copy_to_user()
+
+   -  get_user()
+
+   -  put_user()
+
+-  :c:func:`kmalloc(GP_KERNEL) <kmalloc>`
+
+-  mutex_lock_interruptible() 和 mutex_lock()
+
+   mutex_trylock()不休眠；但是，不能在中断上下文中使用它，因为它的实现对此不
+   安全。mutex_unlock()也不会休眠；它也不能在中断上下文中使用，因为互斥锁必须
+   由获取它的同一个任务释放。
+
+一些不休眠的函数
+----------------
+
+有些函数可以从任何上下文调用，或者持有几乎任何锁。
+
+-  printk()
+
+-  kfree()
+
+-  add_timer() 和 del_timer()
+
+互斥锁API参考
+===================
+
+.. kernel-doc:: include/linux/mutex.h
+   :internal:
+
+.. kernel-doc:: kernel/locking/mutex.c
+   :export:
+
+快速用户空间互斥锁（Futex）API参考
+==================================
+
+*译注：Futex，Fast Userspace Mutex*
+
+.. kernel-doc:: kernel/futex.c
+   :internal:
+
+进一步阅读资料
+===============
+
+-  Documentation/locking/spinlocks.rst ：Linus Torvalds的自旋锁教程。
+
+-  《现代体系结构上的UNIX系统——内核程序员的SMP和Caching技术》
+
+   *Unix Systems for Modern Architectures: Symmetric Multiprocessing and
+   Caching for Kernel Programmers*
+
+   Curt Schimmel对内核级锁的上佳介绍（不是为Linux编写的，但是几乎所有的东西
+   都适用）。这本书是昂贵的，但花点钱去搞懂SMP锁定绝对不亏。
+
+   【英文原版 ISBN 0201633388】
+   【中译本 ISBN 7-155-10876-5 人民邮电出版社】
+
+致谢
+======
+
+感谢Telsa Gwynne帮助DocBooking、整理和添加格式。
+
+感谢Martin Pool，Philipp Rumpf，Stephen Rothwell，Paul Mackerras，
+Ruedi Aschwanden，Alan Cox，Manfred Spraul，Tim Waugh，Pete Zaitcev，
+JamesMorris，Robert Love，Paul McKenney，John Ashby的校对、更正、评论。
+
+感谢反对团体没有影响此文档。
+
+术语表
+======
+
+抢占 preemption
+  在2.5版本之前，或者当 ``CONFIG_PREEMPT`` 未设置时，内核里用户上下文中的进程
+  不会相互抢占（即在放弃CPU之前，除了中断之外，您一直拥有该CPU）。2.5.4版本中
+  增加的 ``CONFIG_PREEMPT`` 改变了此机制：在用户上下文中，更高优先级的任务可
+  以“切入”：自旋锁被更改为禁用抢占，即使是在UP上。
+
+下半部 bh
+  *[Bottom Half]* 由于历史原因，带有“_bh”的函数现在通常指任何软件中断，例如
+  spin_lock_bh()会阻止当前CPU上的任何软件中断。下半部已被弃用，最终将被子任务
+  取代。任何时候只有一个下半部会在运行。
+
+硬（件）中断 Hardware Interrupt / Hardware IRQ
+  硬件中断请求。in_irq()在硬件中断处理程序中返回true。
+
+中断上下文 Interrupt Context
+  非用户上下文：处理硬件中断或软件中断。由返回true的in_interrupt()宏指示。
+
+对称多处理器 SMP
+  *[Symmetric Multi-Processor]* 为多CPU机器编译的内核（ ``CONFIG_SMP=y`` ）。
+
+软（件）中断 Software Interrupt / softirq
+  软件中断处理程序。in_irq()返回false；in_softirq()返回true。
+  子任务和软中断都属于“软件中断”的范畴。
+
+  严格来说，软中断是最多32个枚举软件中断之一，可以同时在多个CPU上运行。
+  有时也用来指子任务（即所有软件中断）。
+
+子任务 tasklet
+  一种可动态注册的软件中断，保证一次只能在一个CPU上运行。
+
+计时器 timer
+  一种可动态注册的软件中断，在给定时间（或接近给定时间）运行。
+  运行时，它就像一个子任务（实际上，它们是从 ``TIMER_SOFTIRQ`` 调用的）。
+
+单处理器 UP
+  *[Uni-Processor]* 非SMP（ ``CONFIG_SMP=n`` ）。
+
+用户上下文 User Context
+  代表特定进程（即系统调用或陷阱[trap]）或内核线程执行的内核。您可以用
+  ``current`` 宏来判断哪个进程）。不要与用户空间混淆。可被软件或硬件中断中断。
+
+用户空间 Userspace
+  在内核外执行自己代码的进程。
-- 
2.20.1

