Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DA1C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 302ED61042
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239262AbhHRIdM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 04:33:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35682 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238050AbhHRIdL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Aug 2021 04:33:11 -0400
Received: from localhost.localdomain (unknown [112.20.110.91])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv0OYxRxhUK4xAA--.877S3;
        Wed, 18 Aug 2021 16:32:27 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 1/6] docs/zh_CN: add core-api memory-allocation translation
Date:   Wed, 18 Aug 2021 16:32:16 +0800
Message-Id: <4bd848d988f1ec53e1a3eda9966378421bed81b5.1629274856.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1629274856.git.siyanteng@loongson.cn>
References: <cover.1629274856.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv0OYxRxhUK4xAA--.877S3
X-Coremail-Antispam: 1UD129KBjvJXoW3tFyUGryruw45GFy5tr4Utwb_yoWDtF1rpr
        929r97Ka15Ary5ZFy0kr4xXF18CayxA3WYga1xKa4UAFs5trWakrWUtFyj9as3u345AFyk
        JrWIgF4IyrWvvwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUUzuWPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/memory-allocation.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   6 +-
 .../zh_CN/core-api/memory-allocation.rst      | 138 ++++++++++++++++++
 2 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/memory-allocation.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index b4bde9396339..9367128c4cb7 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -96,9 +96,13 @@ Todolist:
 如何在内核中分配和使用内存。请注意，在
 :doc:`/vm/index` 中有更多的内存管理文档。
 
-Todolist:
+.. toctree::
+   :maxdepth: 1
 
    memory-allocation
+
+Todolist:
+
    unaligned-memory-access
    dma-api
    dma-api-howto
diff --git a/Documentation/translations/zh_CN/core-api/memory-allocation.rst b/Documentation/translations/zh_CN/core-api/memory-allocation.rst
new file mode 100644
index 000000000000..50b2f266a7f9
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/memory-allocation.rst
@@ -0,0 +1,138 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/memory-allocation.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮<alexs@kernel.org>
+
+.. _cn_core-api_memory-allocation:
+
+============
+内存分配指南
+============
+
+Linux为内存分配提供了多种API。你可以使用 `kmalloc` 或 `kmem_cache_alloc`
+系列分配小块内存，使用 `vmalloc` 及其派生产品分配大的几乎连续的区域，或者
+你可以用 alloc_pages 直接向页面分配器请求页面。也可以使用更专业的分配器，
+例如 `cma_alloc` 或 `zs_malloc` 。
+
+大多数的内存分配API使用GFP标志来表达该内存应该如何分配。GFP的缩写代表
+“(get free pages)获取空闲页”，是底层的内存分配功能。
+
+（内存）分配API的多样性与众多的GFP标志相结合，使得“我应该如何分配内存？”这个问
+题不那么容易回答，尽管很可能你应该使用
+
+::
+
+  kzalloc(<size>, GFP_KERNEL);
+
+当然，有些情况下必须使用其他分配API和不同的GFP标志。
+
+获取空闲页标志
+==============
+GFP标志控制分配器的行为。它们告诉我们哪些内存区域可以被使用，分配器应该多努力寻
+找空闲的内存，这些内存是否可以被用户空间访问等等。内存管理API为GFP标志和它们的
+组合提供了参考文件，这里我们简要介绍一下它们的推荐用法:
+
+  * 大多数时候， ``GFP_KERNEL`` 是你需要的。内核数据结构的内存，DMA可用内存，inode
+    缓存，所有这些和其他许多分配类型都可以使用 ``GFP_KERNEL`` 。注意，使用 ``GFP_KERNEL``
+    意味着 ``GFP_RECLAIM`` ，这意味着在有内存压力的情况下可能会触发直接回收；调用上
+    下文必须允许睡眠。
+
+  * 如果分配是从一个原子上下文中进行的，例如中断处理程序，使用 ``GFP_NOWAIT`` 。这个
+    标志可以防止直接回收和IO或文件系统操作。因此，在内存压力下， ``GFP_NOWAIT`` 分配
+    可能会失败。有合理退路的分配应该使用 ``GFP_NOWARN`` 。
+
+  * 如果你认为访问保留内存区是合理的，并且除非分配成功，否则内核会有压力，你可以使用 ``GFP_ATOMIC`` 。
+
+  * 从用户空间触发的不可信任的分配应该是kmem核算的对象，必须设置 ``__GFP_ACCOUNT`` 位。
+    有一个方便的用于 ``GFP_KERNEL`` 分配的 ``GFP_KERNEL_ACCOUNT`` 快捷键，其应该被核
+    算。
+
+  * 用户空间的分配应该使用 ``GFP_USER`` 、 ``GFP_HIGHUSER`` 或 ``GFP_HIGHUSER_MOVABLE``
+    中的一个标志。标志名称越长，限制性越小。
+
+    ``GFP_HIGHUSER_MOVABLE`` 不要求分配的内存将被内核直接访问，并意味着数据是可迁移的。
+
+    ``GFP_HIGHUSER`` 意味着所分配的内存是不可迁移的，但也不要求它能被内核直接访问。举个
+    例子就是一个硬件分配内存，这些数据直接映射到用户空间，但没有寻址限制。
+
+    ``GFP_USER`` 意味着分配的内存是不可迁移的，它必须被内核直接访问。
+
+你可能会注意到，在现有的代码中，有相当多的分配指定了 ``GFP_NOIO`` 或 ``GFP_NOFS`` 。
+从历史上看，它们被用来防止递归死锁，这种死锁是由直接内存回收调用到FS或IO路径以及对已
+经持有的资源进行阻塞引起的。从4.12开始，解决这个问题的首选方法是使用新的范围API，即
+:ref:`Documentation/core-api/gfp_mask-from-fs-io.rst <gfp_mask_from_fs_io>`.
+
+其他传统的GFP标志是 ``GFP_DMA`` 和 ``GFP_DMA32`` 。它们用于确保分配的内存可以被寻
+址能力有限的硬件访问。因此，除非你正在为一个有这种限制的设备编写驱动程序，否则要避免
+使用这些标志。而且，即使是有限制的硬件，也最好使用dma_alloc* APIs。
+
+GFP标志和回收行为
+-----------------
+内存分配可能会触发直接或后台回收，了解页面分配器将如何努力满足该请求或其他请求是非常
+有用的。
+
+  * ``GFP_KERNEL & ~__GFP_RECLAIM`` - 乐观分配，完全不尝试释放内存。最轻量级的模
+    式，甚至不启动后台回收。应该小心使用，因为它可能会耗尽内存，而下一个用户可能会启
+    动更积极的回收。
+
+  * ``GFP_KERNEL & ~__GFP_DIRECT_RECLAIM`` (or ``GFP_NOWAIT`` ) - 乐观分配，不
+    试图从当前上下文中释放内存，但如果该区域低于低水位，可以唤醒kswapd来回收内存。可
+    以从原子上下文中使用，或者当请求是一个性能优化，并且有另一个慢速路径的回退。
+
+  * ``(GFP_KERNEL|__GFP_HIGH) & ~__GFP_DIRECT_RECLAIM`` (aka ``GFP_ATOMIC`` ) - 非
+    睡眠分配，有一个昂贵的回退，所以它可以访问某些部分的内存储备。通常从中断/底层上下
+    文中使用，有一个昂贵的慢速路径回退。
+
+  * ``GFP_KERNEL`` - 允许后台和直接回收，并使用默认的页面分配器行为。这意味着廉价
+    的分配请求基本上是不会失败的，但不能保证这种行为，所以失败必须由调用者适当检查（例
+    如，目前允许OOM杀手失败）。
+
+  * ``GFP_KERNEL | __GFP_NORETRY`` - 覆盖默认的分配器行为，所有的分配请求都会提前
+    失败，而不是导致破坏性的回收（在这个实现中是一轮的回收）。OOM杀手不被调用。
+
+  * ``GFP_KERNEL | __GFP_RETRY_MAYFAIL`` - 覆盖 **默认** 的分配器行为，所有分配请求都非
+    常努力。如果回收不能取得任何进展，该请求将失败。OOM杀手不会被触发。
+
+  * ``GFP_KERNEL | __GFP_NOFAIL`` - 覆盖默认的分配器行为，所有分配请求将无休止地循
+    环，直到成功。这可能真的很危险，特别是对于较大的需求。
+
+选择内存分配器
+==============
+
+分配内存的最直接的方法是使用kmalloc()系列的函数。而且，为了安全起见，最好使用将内存
+设置为零的例程，如kzalloc()。如果你需要为一个数组分配内存，有kmalloc_array()和kcalloc()
+辅助程序。辅助程序struct_size()、array_size()和array3_size()可以用来安全地计算对
+象的大小而不会溢出。
+
+可以用 `kmalloc` 分配的块的最大尺寸是有限的。实际的限制取决于硬件和内核配置，但是对于
+小于页面大小的对象，使用 `kmalloc` 是一个好的做法。
+
+用 `kmalloc` 分配的块的地址至少要对齐到ARCH_KMALLOC_MINALIGN字节。对于2的幂的大小，
+对齐方式也被保证为至少是各自的大小。
+
+用kmalloc()分配的块可以用krealloc()调整大小。与kmalloc_array()类似：以krealloc_array()
+的形式提供了一个用于调整数组大小的辅助工具。
+
+对于大量的分配，你可以使用vmalloc()和vzalloc()，或者直接向页面分配器请求页面。由vmalloc
+和相关函数分配的内存在物理上是不连续的。
+
+如果你不确定分配的大小对 `kmalloc` 来说是否太大，可以使用kvmalloc()及其派生函数。它将尝
+试用kmalloc分配内存，如果分配失败，将用 `vmalloc` 重新尝试。对于哪些GFP标志可以与 `kvmalloc`
+一起使用是有限制的；请看kvmalloc_node()参考文档。注意， `kvmalloc` 可能会返回物理上不连
+续的内存。
+
+如果你需要分配许多相同的对象，你可以使用slab缓存分配器。在使用缓存之前，应该用
+kmem_cache_create()或kmem_cache_create_usercopy()来设置缓存。如果缓存的一部分可能被复
+制到用户空间，应该使用第二个函数。在缓存被创建后，kmem_cache_alloc()和它的封装可以从该缓
+存中分配内存。
+
+当分配的内存不再需要时，它必须被释放。你可以使用kvfree()来处理用 `kmalloc` 、 `vmalloc`
+和 `kvmalloc` 分配的内存。slab缓存应该用kmem_cache_free()来释放。不要忘记用
+kmem_cache_destroy()来销毁缓存。
-- 
2.27.0

