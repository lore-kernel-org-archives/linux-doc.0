Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB3BC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jun 2022 01:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiF2Bc4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiF2Bcz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 21:32:55 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A9A201BA
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:32:54 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so17735810pjl.5
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wHAEoYwCi2LZQp+Gyf9J+ELFauM1gAF+cAoC3fIxp0I=;
        b=W2iNA9LUMe3/TH1ayKzIknA/jcPph9FkdM9csdGMg983O4cIQEOqsILjZjcxX9OSXv
         C5QQHMxsQJNnMpaGMLgMUfF0+iRCdB8FtER5MmzaiPZwAEeASFFAVu7ImbgppSpCLPfo
         EhmXpq1fAOr8X7ix+a8S/+Ab916crJFsqrnCOGQbNKYXo4Ab2JFZnTbR8LJ3FzJkstBp
         W9KE6zvuGwNZSg0cRrdMlH606Lg+e/PCA5bFn+5iRls5jPZeVl9esY5gnIdbJ3El4rn0
         f4YHLT/0zEyISNkq/DAdT0xK0iYSitxCWdSgfZO7oUKzFqIG+iZbeHqJ1rK9Md6fq3lM
         yCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wHAEoYwCi2LZQp+Gyf9J+ELFauM1gAF+cAoC3fIxp0I=;
        b=Pa7pt/JtRjsH+hehUQSHLh1H764Qf5/Ru/6GjRmW/E9gPur+wDPSU8PRDg3jwNXMKe
         TWvKgyRdbJoSU6IYi5zbMu6s9NbKlqUzbZYXOaz5q3y/Cmup1LUExNUtMQ/7ZDS0G7LA
         TKnnfoSCZ/EoV6caX+Dgxnr9YWP3kXflzEGkQWOERPtFLBq4JiUP+x8w/e57kBeDRARo
         hU5eg4/dWF6pvB1x5mu52ji3yYcL02af+JDWLSePqfuEX8aR9af+1lI9g3OQFAaJ1uNJ
         oACVMRVm+SDgW0G7y4450rrDC/NZZa06NURYoSqXdZCOP0X8OnLdWMa6mafjkQC1hvSf
         q97A==
X-Gm-Message-State: AJIora/45+YK81+3kXJvRJbqFm9DAKuD4eFo3YkwUBxTV42U1UUY82gB
        BZvDsllJW6PiQnV6MzfgiTYUdQ==
X-Google-Smtp-Source: AGRyM1vT2pV8pBq3wrs52EJe8DqjD/PBKJZwf8hVMQSZ3y9IntZ0GsvxnfSewRpjyxL0aWvWPCdEIA==
X-Received: by 2002:a17:90a:aa8a:b0:1c9:bfd8:9a90 with SMTP id l10-20020a17090aaa8a00b001c9bfd89a90mr961505pjq.118.1656466373782;
        Tue, 28 Jun 2022 18:32:53 -0700 (PDT)
Received: from localhost.localdomain (bb119-74-120-80.singnet.com.sg. [119.74.120.80])
        by smtp.gmail.com with ESMTPSA id ij28-20020a170902ab5c00b0016223016d79sm9973581plb.90.2022.06.28.18.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 18:32:53 -0700 (PDT)
From:   yizhou.tang@shopee.com
To:     siyanteng@loongson.cn, alexs@kernel.org, seakeel@gmail.com,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, robin.lubin@shopee.com, huangh@sea.com,
        bobwxc@email.cn, Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH v2 2/2] docs/zh_CN: Add mutex-design Chinese translation
Date:   Wed, 29 Jun 2022 09:32:40 +0800
Message-Id: <20220629013240.65386-3-yizhou.tang@shopee.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220629013240.65386-1-yizhou.tang@shopee.com>
References: <20220629013240.65386-1-yizhou.tang@shopee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tang Yizhou <yizhou.tang@shopee.com>

Translate locking/mutex-design.rst into Chinese.

Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/locking/index.rst      |   2 +-
 .../zh_CN/locking/mutex-design.rst            | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/locking/mutex-design.rst

diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
index 76a8be9bf78b..f0b10707668d 100644
--- a/Documentation/translations/zh_CN/locking/index.rst
+++ b/Documentation/translations/zh_CN/locking/index.rst
@@ -14,6 +14,7 @@
 .. toctree::
     :maxdepth: 1
 
+    mutex-design
     spinlocks
 
 TODOList:
@@ -22,7 +23,6 @@ TODOList:
     * lockdep-design
     * lockstat
     * locktorture
-    * mutex-design
     * rt-mutex-design
     * rt-mutex
     * seqlock
diff --git a/Documentation/translations/zh_CN/locking/mutex-design.rst b/Documentation/translations/zh_CN/locking/mutex-design.rst
new file mode 100644
index 000000000000..6aad54372a6c
--- /dev/null
+++ b/Documentation/translations/zh_CN/locking/mutex-design.rst
@@ -0,0 +1,145 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/locking/mutex-design.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+================
+通用互斥锁子系统
+================
+
+:初稿:
+
+  Ingo Molnar <mingo@redhat.com>
+
+:更新:
+
+  Davidlohr Bueso <davidlohr@hp.com>
+
+什么是互斥锁？
+--------------
+
+在Linux内核中，互斥锁（mutex）指的是一个特殊的加锁原语，它在共享内存系统上
+强制保证序列化，而不仅仅是指在学术界或类似的理论教科书中出现的通用术语“相互
+排斥”。互斥锁是一种睡眠锁，它的行为类似于二进制信号量（semaphores），在
+2006年被引入时[1]，作为后者的替代品。这种新的数据结构提供了许多优点，包括更
+简单的接口，以及在当时更少的代码量（见缺陷）。
+
+[1] https://lwn.net/Articles/164802/
+
+实现
+----
+
+互斥锁由“struct mutex”表示，在include/linux/mutex.h中定义，并在
+kernel/locking/mutex.c中实现。这些锁使用一个原子变量（->owner）来跟踪
+它们生命周期内的锁状态。字段owner实际上包含的是指向当前锁所有者的
+`struct task_struct *` 指针，因此如果无人持有锁，则它的值为空（NULL）。
+由于task_struct的指针至少按L1_CACHE_BYTES对齐，低位（3）被用来存储额外
+的状态（例如，等待者列表非空）。在其最基本的形式中，它还包括一个等待队列和
+一个确保对其序列化访问的自旋锁。此外，CONFIG_MUTEX_SPIN_ON_OWNER=y的
+系统使用一个自旋MCS锁（->osq，译注：MCS是两个人名的合并缩写），在下文的
+（ii）中描述。
+
+准备获得一把自旋锁时，有三种可能经过的路径，取决于锁的状态：
+
+(i) 快速路径：试图通过调用cmpxchg()修改锁的所有者为当前任务，以此原子化地
+    获取锁。这只在无竞争的情况下有效（cmpxchg()检查值是否为0，所以3个状态
+    比特必须为0）。如果锁处在竞争状态，代码进入下一个可能的路径。
+
+(ii) 中速路径：也就是乐观自旋，当锁的所有者正在运行并且没有其它优先级更高的
+     任务（need_resched，需要重新调度）准备运行时，当前任务试图自旋来获得
+     锁。原理是，如果锁的所有者正在运行，它很可能不久就会释放锁。互斥锁自旋体
+     使用MCS锁排队，这样只有一个自旋体可以竞争互斥锁。
+
+     MCS锁（由Mellor-Crummey和Scott提出）是一个简单的自旋锁，它具有一些
+     理想的特性，比如公平，以及每个CPU在试图获得锁时在一个本地变量上自旋。
+     它避免了常见的“检测-设置”自旋锁实现导致的（CPU核间）缓存行回弹
+     （cacheline bouncing）这种昂贵的开销。一个类MCS锁是为实现睡眠锁的
+     乐观自旋而专门定制的。这种定制MCS锁的一个重要特性是，它有一个额外的属性，
+     当自旋体需要重新调度时，它们能够退出MCS自旋锁队列。这进一步有助于避免
+     以下场景：需要重新调度的MCS自旋体将继续自旋等待自旋体所有者，即将获得
+     MCS锁时却直接进入慢速路径。
+
+(iii) 慢速路径：最后的手段，如果仍然无法获得锁，该任务会被添加到等待队列中，
+      休眠直到被解锁路径唤醒。在通常情况下，它以TASK_UNINTERRUPTIBLE状态
+      阻塞。
+
+虽然从形式上看，内核互斥锁是可睡眠的锁，路径(ii)使它实际上成为混合类型。通过
+简单地不中断一个任务并忙着等待几个周期，而不是立即睡眠，这种锁已经被认为显著
+改善一些工作负载的性能。注意，这种技术也被用于读写信号量（rw-semaphores）。
+
+语义
+----
+
+互斥锁子系统检查并强制执行以下规则:
+
+    - 每次只有一个任务可以持有该互斥锁。
+    - 只有锁的所有者可以解锁该互斥锁。
+    - 不允许多次解锁。
+    - 不允许递归加锁/解锁。
+    - 互斥锁只能通过API进行初始化（见下文）。
+    - 一个任务不能在持有互斥锁的情况下退出。
+    - 持有锁的内存区域不得被释放。
+    - 被持有的锁不能被重新初始化。
+    - 互斥锁不能用于硬件或软件中断上下文，如小任务（tasklet）和定时器。
+
+当CONFIG DEBUG_MUTEXES被启用时，这些语义将被完全强制执行。此外，互斥锁
+调试代码还实现了一些其它特性，使锁的调试更容易、更快速：
+
+    - 当打印到调试输出时，总是使用互斥锁的符号名称。
+    - 加锁点跟踪，函数名符号化查找，系统持有的全部锁的列表，打印出它们。
+    - 所有者跟踪。
+    - 检测自我递归的锁并打印所有相关信息。
+    - 检测多任务环形依赖死锁，并打印所有受影响的锁和任务（并且只限于这些任务）。
+
+
+接口
+----
+静态定义互斥锁::
+
+   DEFINE_MUTEX(name);
+
+动态初始化互斥锁::
+
+   mutex_init(mutex);
+
+以不可中断方式（uninterruptible）获取互斥锁::
+
+   void mutex_lock(struct mutex *lock);
+   void mutex_lock_nested(struct mutex *lock, unsigned int subclass);
+   int  mutex_trylock(struct mutex *lock);
+
+以可中断方式（interruptible）获取互斥锁::
+
+   int mutex_lock_interruptible_nested(struct mutex *lock,
+				       unsigned int subclass);
+   int mutex_lock_interruptible(struct mutex *lock);
+
+当原子变量减为0时，以可中断方式（interruptible）获取互斥锁::
+
+   int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
+
+释放互斥锁::
+
+   void mutex_unlock(struct mutex *lock);
+
+检测是否已经获取互斥锁::
+
+   int mutex_is_locked(struct mutex *lock);
+
+缺陷
+----
+
+与它最初的设计和目的不同，'struct mutex' 是内核中最大的锁之一。例如：在
+x86-64上它是32字节，而 'struct semaphore' 是24字节，rw_semaphore是
+40字节。更大的结构体大小意味着更多的CPU缓存和内存占用。
+
+
+何时使用互斥锁
+--------------
+
+总是优先选择互斥锁而不是任何其它锁原语，除非互斥锁的严格语义不合适，和/或临界区
+阻止锁被共享。
-- 
2.34.1

