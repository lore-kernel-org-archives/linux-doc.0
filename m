Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C479C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 14:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236766AbiDHOPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 10:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236769AbiDHOPw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 10:15:52 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D9B3504A3
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 07:13:46 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KZgDG4XthzgYRn;
        Fri,  8 Apr 2022 22:11:58 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 8 Apr 2022 22:13:44 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 8 Apr
 2022 22:13:43 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2 2/2] docs/zh_CN: Add spinlocks Chinese translation
Date:   Fri, 8 Apr 2022 22:47:42 +0800
Message-ID: <20220408144742.23225-3-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220408144742.23225-1-tangyizhou@huawei.com>
References: <20220408144742.23225-1-tangyizhou@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate locking/spinlocks.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 .../translations/zh_CN/locking/spinlocks.rst  | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/locking/spinlocks.rst

diff --git a/Documentation/translations/zh_CN/locking/spinlocks.rst b/Documentation/translations/zh_CN/locking/spinlocks.rst
new file mode 100644
index 000000000000..2017c01f0a4b
--- /dev/null
+++ b/Documentation/translations/zh_CN/locking/spinlocks.rst
@@ -0,0 +1,149 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/locking/spinlocks.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+==========
+加锁的教训
+==========
+
+教训 1：自旋锁
+==============
+
+加锁最基本的原语是自旋锁（spinlock）::
+
+  static DEFINE_SPINLOCK(xxx_lock);
+
+	unsigned long flags;
+
+	spin_lock_irqsave(&xxx_lock, flags);
+	... 这里是临界区 ..
+	spin_unlock_irqrestore(&xxx_lock, flags);
+
+上述代码总是安全的。自旋锁将在 _本地_ 禁用中断，但它本身将保证全局锁定。所以它
+将保证在该锁保护的区域内只有一个控制线程。即使在单处理器（UP）下也能很好的工作，
+所以代码 _不_ 需要担心UP还是SMP的问题：自旋锁在两种情况下都能正常工作。
+
+   注意！自旋锁对内存的潜在影响由下述文档进一步描述：
+
+     Documentation/memory-barriers.txt
+
+       (5) ACQUIRE operations.
+
+       (6) RELEASE operations.
+
+上述代码通常非常简单（对大部分情况，你通常需要并且只希望有一个自旋锁——使用多个
+自旋锁会使事情变得更复杂，甚至更慢，而且通常仅仅在你 **理解的** 序列有被拆分的
+需求时才值得这么做：如果你不确定的话，请不惜一切代价避免这样做）。
+
+这是关于自旋锁的唯一真正困难的部分：一旦你开始使用自旋锁，它们往往会扩展到你以前
+可能没有注意到的领域，因为你必须确保自旋锁正确地保护共享数据结构 **每一处** 被
+使用的地方。自旋锁是最容易被添加到完全独立于其它代码的地方（例如，没有人访问的
+内部驱动数据结构）的。
+
+   注意！仅当你在跨CPU核访问时使用 **同一把** 自旋锁，对它的使用才是安全的。
+   这意味着所有访问共享变量的代码必须对它们想使用的自旋锁达成一致。
+
+----
+
+教训 2：读-写自旋锁
+===================
+
+如果你的数据访问有一个非常自然的模式，倾向于从共享变量中读取数据，读-写自旋锁
+（rw_lock）有时是有用的。它们允许多个读者同时出现在同一个临界区，但是如果有人想
+改变变量，它必须获得一个独占的写锁。
+
+   注意！读-写自旋锁比原始自旋锁需要更多的原子内存操作。除非读者的临界区很长，
+   否则你最好只使用原始自旋锁。
+
+例程看起来和上面一样::
+
+   rwlock_t xxx_lock = __RW_LOCK_UNLOCKED(xxx_lock);
+
+	unsigned long flags;
+
+	read_lock_irqsave(&xxx_lock, flags);
+	.. 仅读取信息的临界区 ...
+	read_unlock_irqrestore(&xxx_lock, flags);
+
+	write_lock_irqsave(&xxx_lock, flags);
+	.. 读取和独占写信息 ...
+	write_unlock_irqrestore(&xxx_lock, flags);
+
+上面这种锁对于复杂的数据结构如链表可能会有用，特别是在不改变链表的情况下搜索其中
+的条目。读锁允许许多并发的读者。任何希望 **修改** 链表的代码将必须先获取写锁。
+
+   注意！RCU锁更适合遍历链表，但需要仔细注意设计细节（见Documentation/RCU/listRCU.rst）。
+
+另外，你不能把读锁“升级”为写锁，所以如果你在 _任何_ 时候需要做任何修改
+（即使你不是每次都这样做），你必须在一开始就获得写锁。
+
+   注意！我们正在努力消除大多数情况下的读-写自旋锁的使用，所以请不要在没有达成
+   共识的情况下增加一个新的（相反，请参阅Documentation/RCU/rcu.rst以获得完整
+   信息）。
+
+----
+
+教训 3：重新审视自旋锁
+======================
+
+上述的自旋锁原语绝不是唯一的。它们是最安全的，在所有情况下都能正常工作，但部分
+**因为** 它们是安全的，它们也是相当慢的。它们比原本需要的更慢，因为它们必须要
+禁用中断（在X86上只是一条指令，但却是一条昂贵的指令——而在其他体系结构上，情况
+可能更糟）。
+
+如果你有必须保护跨CPU访问的数据结构且你想使用自旋锁的场景，你有可能使用代价小的
+自旋锁版本。当且仅当你知道某自旋锁永远不会在中断处理程序中使用，你可以使用非中断
+的版本::
+
+	spin_lock(&lock);
+	...
+	spin_unlock(&lock);
+
+（当然，也可以使用相应的读-写锁版本）。这种自旋锁将同样可以保证独占访问，而且
+速度会快很多。如果你知道有关的数据只在“进程上下文”中被存取，即，不涉及中断，
+这种自旋锁就有用了。
+
+当这些版本的自旋锁涉及中断时，你不能使用的原因是会陷入死锁::
+
+	spin_lock(&lock);
+	...
+		<- 中断来临：
+			spin_lock(&lock);
+
+一个中断试图对一个已经锁定的变量上锁。如果中断发生在另一个CPU上，不会有问题；
+但如果中断发生在已经持有自旋锁的同一个CPU上，将 _会_ 有问题，因为该锁显然永远
+不会被释放（因为中断正在等待该锁，而锁的持有者被中断打断，并且无法继续执行，
+直到中断处理结束）。
+
+（这也是自旋锁的中断版本只需要禁用 _本地_ 中断的原因——在发生于其它CPU的中断中
+使用同一把自旋锁是没问题的，因为发生于其它CPU的中断不会打断已经持锁的CPU，所以
+锁的持有者可以继续执行并最终释放锁）。
+
+		Linus
+
+----
+
+参考信息
+========
+
+对于动态初始化，使用spin_lock_init()或rwlock_init()是合适的::
+
+   spinlock_t xxx_lock;
+   rwlock_t xxx_rw_lock;
+
+   static int __init xxx_init(void)
+   {
+	spin_lock_init(&xxx_lock);
+	rwlock_init(&xxx_rw_lock);
+	...
+   }
+
+   module_init(xxx_init);
+
+对于静态初始化，使用DEFINE_SPINLOCK() / DEFINE_RWLOCK()或
+__SPIN_LOCK_UNLOCKED() / __RW_LOCK_UNLOCKED()是合适的。
-- 
2.17.1

