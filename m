Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E7AC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 03:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D71B061166
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 03:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238038AbhERDJq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 23:09:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51924 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231625AbhERDJq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 23:09:46 -0400
Received: from localhost.localdomain (unknown [112.20.109.240])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxicmaL6NgxqgYAA--.37699S3;
        Tue, 18 May 2021 11:08:14 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH 1/2] docs/zh_CN:add core-api refcount-vs-atomic.rst translation.
Date:   Tue, 18 May 2021 11:08:51 +0800
Message-Id: <41587be482017c99ac57d1650b3cdfc2e77b7a84.1621255695.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1621255695.git.siyanteng@loongson.cn>
References: <cover.1621255695.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxicmaL6NgxqgYAA--.37699S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4ruF1ruw43trW7ZFy7KFg_yoW3GFy5pr
        sIvr93Ga15W345ZryDW34jqw1xA3W8Ca98tw4xJFyrJFn7C345Jw48KFyrXryUGr97AFWU
        XF47u3yjkr4UZ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUURwZ3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/refcount-vs-atomic.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   3 +-
 .../zh_CN/core-api/refcount-vs-atomic.rst     | 154 ++++++++++++++++++
 2 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index f1fa71e45c77..8f0b3fe8723d 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -58,10 +58,11 @@ Linux如何让一切同时发生。 详情请参阅
    :maxdepth: 1
 
    irq/index
+   refcount-vs-atomic
+
 
 Todolist:
 
-   refcount-vs-atomic
    local_ops
    padata
    ../RCU/index
diff --git a/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
new file mode 100644
index 000000000000..dabe0c1dae9a
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
@@ -0,0 +1,154 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/refcount-vs-atomic.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_refcount-vs-atomic:
+
+
+=======================================
+与atomic_t相比，refcount_t的API是这样的
+=======================================
+
+.. contents:: :local:
+
+简介
+====
+
+refcount_t API的目标是为实现对象的引用计数器提供一个最小的API。虽然来自
+lib/refcount.c的独立于架构的通用实现在下面使用了原子操作，但一些 ``refcount_*()``
+和 ``atomic_*()`` 函数在内存顺序保证方面有很多不同。本文档概述了这些差异，并
+提供了相应的例子，以帮助开发者根据这些内存顺序保证的变化来验证他们的代码。
+
+本文档中使用的术语尽量遵循tools/memory-model/Documentation/explanation.txt
+中定义的正式LKMM。
+
+memory-barriers.txt和atomic_t.txt提供了更多关于内存顺序的背景，特别是
+对于原子操作。
+
+内存顺序的相关类型
+==================
+
+.. note:: 下面的部分只涵盖了与原子操作和引用计数器有关的一些内存顺序类型，并
+   通过本文档使用。如果想了解更广泛的情况，请查阅memory-barriers.txt文件。
+
+在没有任何内存顺序保证的情况下（即完全无序），atomics & refcounters只提供原
+子性和程序顺序（po）关系（在同一个CPU上）。它保证每个 ``atomic_* ()`` 和 ``refcount_*()``
+操作都是原子性的，指令在单个CPU上按程序顺序执行。这是用READ_ONCE()/WRITE_ONCE()
+和比较——交换原语实现的。
+
+强（全）内存顺序保证在同一CPU上的所有先前的加载和存储（所有po-earlier指令）在
+同一CPU上执行任何po-later指令之前完成。它还保证在同一CPU上的所有po-earlier存
+储和来自其他CPU的所有传播的存储必须在原CPU上执行任何po-later指令之前传播到所有
+其他CPU（A-累积属性）。这是用smp_mb()实现的。
+
+一个RELEASE内存顺序保证了在同一CPU上所有先前的加载和存储（所有po-earlier指令）
+在操作前完成。它还保证同一CPU上的所有po-earlier存储以及来自其他CPU的所有传播的
+存储必须在释放操作之前传播到所有其他CPU（A-累积属性）。这是用smp_store_release()
+实现的。
+
+ACQUIRE内存顺序保证了同一CPU上的所有后加载和存储（所有po-later指令）在获取操作
+之后完成。它还保证在获取操作执行后，同一CPU上的所有po-later存储必须传播到所有其
+他CPU。这是用smp_acquire__after_ctrl_dep()实现的。
+
+对Refcounters的控制依赖（取决于成功）保证了如果一个对象的引用被成功获得（引用计数
+器的增量或增加行为发生了，函数返回true），那么进一步的存储是针对这个操作的命令。对存
+储的控制依赖没有使用任何明确的屏障来实现，而是依赖于CPU不对存储进行猜测。这只是
+一个单一的CPU关系，对其他CPU不提供任何保证。
+
+
+函数的比较
+==========
+
+情况1） - 非 "读/修改/写"（RMW）操作
+------------------------------------
+
+函数变化:
+
+ * atomic_set() --> refcount_set()
+ * atomic_read() --> refcount_read()
+
+内存顺序保证变化:
+
+ * none (两者都是完全无序的)
+
+
+情况2） - 基于增量的操作，不返回任何值
+--------------------------------------
+
+函数变化:
+
+ * atomic_inc() --> refcount_inc()
+ * atomic_add() --> refcount_add()
+
+内存顺序保证变化:
+
+ * none (两者都是完全无序的)
+
+情况3） - 基于递减的RMW操作，没有返回值
+---------------------------------------
+
+函数变化:
+
+ * atomic_dec() --> refcount_dec()
+
+内存顺序保证变化:
+
+ * 完全无序的 --> RELEASE顺序
+
+
+情况4） - 基于增量的RMW操作，返回一个值
+---------------------------------------
+
+函数变化:
+
+ * atomic_inc_not_zero() --> refcount_inc_not_zero()
+ * 无原子性对应函数 --> refcount_add_not_zero()
+
+内存顺序保证变化:
+
+ * 完全有序的 --> 控制依赖于存储的成功
+
+.. note:: 我们真的在这里假设，必要的顺序是作为获得对象指针的结果而提供的。
+
+
+情况 5） - 基于Dec/Sub递减的通用RMW操作，返回一个值
+---------------------------------------------------
+
+函数变化:
+
+ * atomic_dec_and_test() --> refcount_dec_and_test()
+ * atomic_sub_and_test() --> refcount_sub_and_test()
+
+内存顺序保证变化:
+
+ * 完全有序的 --> RELEASE顺序 + 成功后ACQUIRE顺序
+
+
+情况6）其他基于递减的RMW操作，返回一个值
+----------------------------------------
+
+函数变化:
+
+ * 无原子性对应函数 --> refcount_dec_if_one()
+ * ``atomic_add_unless(&var, -1, 1)`` --> ``refcount_dec_not_one(&var)``
+
+内存顺序保证变化:
+
+ * 完全有序的 --> RELEASE顺序 + 控制依赖
+
+.. note:: atomic_add_unless()只在执行成功时提供完整的顺序。
+
+
+情况7）--基于锁的RMW
+--------------------
+
+函数变化:
+
+ * atomic_dec_and_lock() --> refcount_dec_and_lock()
+ * atomic_dec_and_mutex_lock() --> refcount_dec_and_mutex_lock()
+
+内存顺序保证变化:
+
+ * 完全有序 --> RELEASE顺序 + 控制依赖 + 持有
+   成功后spin_lock()
-- 
2.27.0

