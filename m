Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789B4C07E9C
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498DC61417
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhGIDAQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jul 2021 23:00:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45092 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230463AbhGIDAP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Jul 2021 23:00:15 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxUOIQu+dg_xgeAA--.15063S6;
        Fri, 09 Jul 2021 10:57:26 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 4/6] docs/zh_CN: add core-api genalloc translation
Date:   Fri,  9 Jul 2021 10:57:45 +0800
Message-Id: <2f42967e8ef484ca53f850be9a742c4142c9e943.1625795862.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1625795862.git.siyanteng@loongson.cn>
References: <cover.1625795862.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxUOIQu+dg_xgeAA--.15063S6
X-Coremail-Antispam: 1UD129KBjvJXoWxtrWfWF1DJFW5JF4xJF1fZwb_yoWxtw45pr
        WIkr1xK3Wrta4Yyr9Ygw1kXF18Gayxu3y3Ka1xG3srZFn3Xr45tw47tFWY9r1xZryv9FyD
        JF4IyFZYvFyvkwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl
        6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
        IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
        xan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JUm9aPUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/genalloc.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/genalloc.rst  | 109 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/genalloc.rst

diff --git a/Documentation/translations/zh_CN/core-api/genalloc.rst b/Documentation/translations/zh_CN/core-api/genalloc.rst
new file mode 100644
index 000000000000..689709ba7a2a
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/genalloc.rst
@@ -0,0 +1,109 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/genalloc.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_core-api_genalloc:
+
+genalloc/genpool子系统
+======================
+
+内核中有许多内存分配子系统，每一个都是针对特定的需求。然而，有时候，内核开发者需
+要为特定范围的特殊用途的内存实现一个新的分配器；通常这个内存位于某个设备上。该设
+备的驱动程序的作者当然可以写一个小的分配器来完成工作，但这是让内核充满几十个测试
+差劲的分配器的方法。早在2005年，Jes Sorensen从sym53c8xx_2驱动中提取了其中的一
+个分配器，并将其作为一个通用模块发布，用于创建特设的内存分配器。这段代码在2.6.13
+版本中被合并；此后它被大大地修改了。
+
+.. _posted: https://lwn.net/Articles/125842/
+
+使用这个分配器的代码应该包括<linux/genalloc.h>。这个动作从创建一个池开始，使用
+一个:
+
+该API在以下内核代码中:
+
+lib/genalloc.c
+
+对gen_pool_create()的调用将创建一个内存池。分配的粒度由min_alloc_order设置；它
+是一个log-base-2（以2为底的对数）的数字，就像页面分配器使用的数字一样，但它指的是
+字节而不是页面。因此，如果min_alloc_order被传递为3，那么所有的分配将是8字节的倍数。
+增加min_alloc_order可以减少跟踪池中内存所需的内存。nid参数指定哪一个NUMA节点应该被
+用于分配管家结构体；如果调用者不关心，它可以是-1。
+
+“管理的”接口devm_gen_pool_create()将内存池与一个特定的设备联系起来。在其他方面，
+当给定的设备被销毁时，它将自动清理内存池。
+
+一个内存池池被关闭的方法是:
+
+该API在以下内核代码中:
+
+lib/genalloc.c
+
+值得注意的是，如果在给定的内存池中仍有未完成的分配，这个函数将采取相当极端的步骤，调用
+BUG()，使整个系统崩溃。你已经被警告了。
+
+一个新创建的内存池没有内存可以分配。在这种状态下，它是相当无用的，所以首要任务之一通常
+是向内存池里添加内存。这可以通过以下方式完成:
+
+该API在以下内核代码中:
+
+include/linux/genalloc.h
+
+lib/genalloc.c
+
+对gen_pool_add()的调用将把从地址（在内核的虚拟地址空间）开始的内存的大小字节放入
+给定的池中，再次使用nid作为节点ID进行辅助内存分配。gen_pool_add_virt()变体将显式
+物理地址与内存联系起来；只有在内存池被用于DMA分配时，这才是必要的。
+
+从内存池中分配内存（并将其放回）的函数是:
+
+该API在以下内核代码中:
+
+include/linux/genalloc.h
+
+lib/genalloc.c
+
+正如人们所期望的，gen_pool_alloc()将从给定的池中分配size<字节。gen_pool_dma_alloc()
+变量分配内存用于DMA操作，返回dma所指向的空间中的相关物理地址。这只有在内存是用
+gen_pool_add_virt()添加的情况下才会起作用。请注意，这个函数偏离了genpool通常使用
+无符号长值来表示内核地址的模式；它返回一个void * 来代替。
+
+这一切看起来都比较简单；事实上，一些开发者显然认为这太简单了。毕竟，上面的接口没有提
+供对分配函数如何选择返回哪块特定内存的控制。如果需要这样的控制，下面的函数将是有意义
+的:
+
+该API在以下内核代码中:
+
+lib/genalloc.c
+
+使用gen_pool_alloc_algo()进行的分配指定了一种用于选择要分配的内存的算法；默认算法可
+以用gen_pool_set_algo()来设置。数据值被传递给算法；大多数算法会忽略它，但偶尔也会需
+要它。当然，人们可以写一个特殊用途的算法，但是已经有一套公平的算法可用了:
+
+- gen_pool_first_fit是一个简单的初配分配器；如果没有指定其他算法，这是默认算法。
+
+- gen_pool_first_fit_align强迫分配有一个特定的对齐方式（通过genpool_data_align结
+  构中的数据传递）。
+
+- gen_pool_first_fit_order_align 按照大小的顺序排列分配。例如，一个60字节的分配将
+  以64字节对齐。
+
+- gen_pool_best_fit，正如人们所期望的，是一个简单的最佳匹配分配器。
+
+- gen_pool_fixed_alloc在池中的一个特定偏移量（通过数据参数在genpool_data_fixed结
+  构中传递）进行分配。如果指定的内存不可用，则分配失败。
+
+还有一些其他的函数，主要是为了查询内存池中的可用空间或迭代内存块等目的。然而，大多数
+用户应该不需要以上描述的功能。如果幸运的话，对这个模块的广泛认识将有助于防止在未来编
+写特殊用途的内存分配器。
+
+该API在以下内核代码中:
+
+lib/genalloc.c
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index e5d2f4d5413c..1e8c5963c499 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -102,6 +102,7 @@ Todolist:
    memory-allocation
    unaligned-memory-access
    mm-api
+   genalloc
 
 Todolist:
 
@@ -109,7 +110,6 @@ Todolist:
    dma-api-howto
    dma-attributes
    dma-isa-lpc
-   genalloc
    pin_user_pages
    boot-time-mm
    gfp_mask-from-fs-io
-- 
2.27.0

