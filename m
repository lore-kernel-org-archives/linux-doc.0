Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A6BC3F6B0
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 05:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiG1FFm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 01:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiG1FFl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 01:05:41 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 655E32019A
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 22:05:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+MZGeJiBDk+AA--.39258S4;
        Thu, 28 Jul 2022 13:05:31 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH v2 2/8] Docs/zh_CN: Update the translation of kasan to 5.19-rc8
Date:   Thu, 28 Jul 2022 13:05:57 +0800
Message-Id: <abbb6c5cc5a7daf0720a9cb0a8255472d4ac69b4.1658983157.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658983157.git.siyanteng@loongson.cn>
References: <cover.1658983157.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT+MZGeJiBDk+AA--.39258S4
X-Coremail-Antispam: 1UD129KBjvAXoW3Aw1kAFy5CryxKFWxJFyrJFb_yoW8JF15Co
        W5K398AFs5A3W7W34rJFWxtFZxGF1UCFs8AanFkr4jkrWDGrs5Ca1kJay7ArW8JFZ8Ar1a
        y3WFg3W3Ka429rWDn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUOw7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
        kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjfUYBMKDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit 3ff16d30f593 ("kasan: test:
improve failure message in KUNIT_EXPECT_KASAN_FAIL()")

c9d1af2b780a ("mm/kasan: move kasan.fault to mm/kasan/report.c")
2d27e5851473 ("kasan: Extend KASAN mode kernel parameter")
8479d7b5be2f ("kasan: documentation updates")
c2ec0c8f6877 ("kasan: update documentation")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/dev-tools/kasan.rst    | 117 ++++++++++++------
 1 file changed, 77 insertions(+), 40 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
index 23db9d419047..fe76cbe77ad6 100644
--- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
@@ -11,34 +11,65 @@
 概述
 ----
 
-KernelAddressSANitizer(KASAN)是一种动态内存安全错误检测工具，主要功能是
-检查内存越界访问和使用已释放内存的问题。KASAN有三种模式:
+Kernel Address SANitizer(KASAN)是一种动态内存安全错误检测工具，主要功能是
+检查内存越界访问和使用已释放内存的问题。
 
-1. 通用KASAN（与用户空间的ASan类似）
-2. 基于软件标签的KASAN（与用户空间的HWASan类似）
-3. 基于硬件标签的KASAN（基于硬件内存标签）
+KASAN有三种模式:
 
-由于通用KASAN的内存开销较大，通用KASAN主要用于调试。基于软件标签的KASAN
-可用于dogfood测试，因为它具有较低的内存开销，并允许将其用于实际工作量。
-基于硬件标签的KASAN具有较低的内存和性能开销，因此可用于生产。同时可用于
-检测现场内存问题或作为安全缓解措施。
+1. 通用KASAN
+2. 基于软件标签的KASAN
+3. 基于硬件标签的KASAN
 
-软件KASAN模式（#1和#2）使用编译时工具在每次内存访问之前插入有效性检查，
-因此需要一个支持它的编译器版本。
+用CONFIG_KASAN_GENERIC启用的通用KASAN，是用于调试的模式，类似于用户空
+间的ASan。这种模式在许多CPU架构上都被支持，但它有明显的性能和内存开销。
 
-通用KASAN在GCC和Clang受支持。GCC需要8.3.0或更高版本。任何受支持的Clang
-版本都是兼容的，但从Clang 11才开始支持检测全局变量的越界访问。
+基于软件标签的KASAN或SW_TAGS KASAN，通过CONFIG_KASAN_SW_TAGS启用，
+可以用于调试和自我测试，类似于用户空间HWASan。这种模式只支持arm64，但其
+适度的内存开销允许在内存受限的设备上用真实的工作负载进行测试。
 
-基于软件标签的KASAN模式仅在Clang中受支持。
+基于硬件标签的KASAN或HW_TAGS KASAN，用CONFIG_KASAN_HW_TAGS启用，被
+用作现场内存错误检测器或作为安全缓解的模式。这种模式只在支持MTE（内存标签
+扩展）的arm64 CPU上工作，但它的内存和性能开销很低，因此可以在生产中使用。
 
-硬件KASAN模式（#3）依赖硬件来执行检查，但仍需要支持内存标签指令的编译器
-版本。GCC 10+和Clang 11+支持此模式。
+关于每种KASAN模式的内存和性能影响的细节，请参见相应的Kconfig选项的描述。
 
-两种软件KASAN模式都适用于SLUB和SLAB内存分配器，而基于硬件标签的KASAN目前
-仅支持SLUB。
+通用模式和基于软件标签的模式通常被称为软件模式。基于软件标签的模式和基于
+硬件标签的模式被称为基于标签的模式。
 
-目前x86_64、arm、arm64、xtensa、s390、riscv架构支持通用KASAN模式，仅
-arm64架构支持基于标签的KASAN模式。
+支持
+----
+
+体系架构
+~~~~~~~~
+
+在x86_64、arm、arm64、powerpc、riscv、s390和xtensa上支持通用KASAN，
+而基于标签的KASAN模式只在arm64上支持。
+
+编译器
+~~~~~~
+
+软件KASAN模式使用编译时工具在每个内存访问之前插入有效性检查，因此需要一个
+提供支持的编译器版本。基于硬件标签的模式依靠硬件来执行这些检查，但仍然需要
+一个支持内存标签指令的编译器版本。
+
+通用KASAN需要GCC 8.3.0版本或更高版本，或者内核支持的任何Clang版本。
+
+基于软件标签的KASAN需要GCC 11+或者内核支持的任何Clang版本。
+
+基于硬件标签的KASAN需要GCC 10+或Clang 12+。
+
+内存类型
+~~~~~~~~
+
+通用KASAN支持在所有的slab、page_alloc、vmap、vmalloc、堆栈和全局内存
+中查找错误。
+
+基于软件标签的KASAN支持slab、page_alloc、vmalloc和堆栈内存。
+
+基于硬件标签的KASAN支持slab、page_alloc和不可执行的vmalloc内存。
+
+对于slab，两种软件KASAN模式都支持SLUB和SLAB分配器，而基于硬件标签的
+KASAN只支持SLUB。
 
 用法
 ----
@@ -53,7 +84,7 @@ arm64架构支持基于标签的KASAN模式。
 
 对于软件模式，还可以在 ``CONFIG_KASAN_OUTLINE`` 和 ``CONFIG_KASAN_INLINE``
 之间进行选择。outline和inline是编译器插桩类型。前者产生较小的二进制文件，
-而后者快1.1-2倍。
+而后者快2倍。
 
 要将受影响的slab对象的alloc和free堆栈跟踪包含到报告中，请启用
 ``CONFIG_STACKTRACE`` 。要包括受影响物理页面的分配和释放堆栈跟踪的话，
@@ -172,21 +203,29 @@ KASAN受通用 ``panic_on_warn`` 命令行参数的影响。启用该功能后
 默认情况下，KASAN只为第一次无效内存访问打印错误报告。使用 ``kasan_multi_shot`` ，
 KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告的 ``panic_on_warn`` 。
 
+另外，独立于 ``panic_on_warn`` , ``kasan.fault=`` 引导参数可以用来控制恐慌和报
+告行为:
+
+- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
+  (默认: ``report`` )。即使启用了 ``kasan_multi_shot`` ，也会发生内核恐慌。
+
 基于硬件标签的KASAN模式（请参阅下面有关各种模式的部分）旨在在生产中用作安全缓解
-措施。因此，它支持允许禁用KASAN或控制其功能的引导参数。
+措施。因此，它支持允许禁用KASAN或控制其功能的附加引导参数。
 
 - ``kasan=off`` 或 ``=on`` 控制KASAN是否启用 (默认: ``on`` )。
 
-- ``kasan.mode=sync`` 或 ``=async`` 控制KASAN是否配置为同步或异步执行模式(默认:
-  ``sync`` )。同步模式：当标签检查错误发生时，立即检测到错误访问。异步模式：
-  延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中（在arm64的
+- ``kasan.mode=sync`` 、 ``=async`` 或 ``=asymm`` 控制KASAN是否配置
+  为同步或异步执行模式(默认:``sync`` )。
+  同步模式：当标签检查错误发生时，立即检测到错误访问。
+  异步模式：延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中（在arm64的
   TFSR_EL1寄存器中）。内核会定期检查硬件，并且仅在这些检查期间报告标签错误。
+  非对称模式：读取时同步检测不良访问，写入时异步检测。
+
+- ``kasan.vmalloc=off`` 或 ``=on`` 禁用或启用vmalloc分配的标记（默认：``on`` ）。
 
 - ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用alloc和free堆栈跟踪收集
   (默认: ``on`` )。
 
-- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
-  (默认: ``report`` )。即使启用了 ``kasan_multi_shot`` ，也会发生内核恐慌。
 
 实施细则
 --------
@@ -244,7 +283,6 @@ KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告
 基于软件标签的KASAN使用0xFF作为匹配所有指针标签（不检查通过带有0xFF指针标签
 的指针进行的访问）。值0xFE当前保留用于标记已释放的内存区域。
 
-基于软件标签的KASAN目前仅支持对Slab和page_alloc内存进行标记。
 
 基于硬件标签的KASAN模式
 ~~~~~~~~~~~~~~~~~~~~~~~
@@ -262,8 +300,6 @@ KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告
 基于硬件标签的KASAN使用0xFF作为匹配所有指针标签（不检查通过带有0xFF指针标签的
 指针进行的访问）。值0xFE当前保留用于标记已释放的内存区域。
 
-基于硬件标签的KASAN目前仅支持对Slab和page_alloc内存进行标记。
-
 如果硬件不支持MTE（ARMv8.5之前），则不会启用基于硬件标签的KASAN。在这种情况下，
 所有KASAN引导参数都将被忽略。
 
@@ -275,6 +311,8 @@ KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告
 影子内存
 --------
 
+本节的内容只适用于软件KASAN模式。
+
 内核将内存映射到地址空间的几个不同部分。内核虚拟地址的范围很大：没有足够的真实
 内存来支持内核可以访问的每个地址的真实影子区域。因此，KASAN只为地址空间的某些
 部分映射真实的影子。
@@ -297,7 +335,7 @@ CONFIG_KASAN_VMALLOC
 ~~~~~~~~~~~~~~~~~~~~
 
 使用 ``CONFIG_KASAN_VMALLOC`` ，KASAN可以以更大的内存使用为代价覆盖vmalloc
-空间。目前，这在x86、riscv、s390和powerpc上受支持。
+空间。目前，这在arm64、x86、riscv、s390和powerpc上受支持。
 
 这通过连接到vmalloc和vmap并动态分配真实的影子内存来支持映射。
 
@@ -349,10 +387,10 @@ KASAN连接到vmap基础架构以懒清理未使用的影子内存。
 ``kasan_disable_current()``/``kasan_enable_current()`` 部分注释这部分代码。
 这也会禁用通过函数调用发生的间接访问的报告。
 
-对于基于标签的KASAN模式（包括硬件模式），要禁用访问检查，请使用
-``kasan_reset_tag()`` 或 ``page_kasan_tag_reset()`` 。请注意，通过
-``page_kasan_tag_reset()`` 临时禁用访问检查需要通过 ``page_kasan_tag``
-/ ``page_kasan_tag_set`` 保存和恢复每页KASAN标签。
+对于基于标签的KASAN模式，要禁用访问检查，请使用 ``kasan_reset_tag()`` 或
+``page_kasan_tag_reset()`` 。请注意，通过 ``page_kasan_tag_reset()``
+临时禁用访问检查需要通过 ``page_kasan_tag`` / ``page_kasan_tag_set`` 保
+存和恢复每页KASAN标签。
 
 测试
 ~~~~
@@ -381,11 +419,10 @@ KASAN连接到vmap基础架构以懒清理未使用的影子内存。
 
 当由于缺少KASAN报告而导致测试失败时::
 
-        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:629
-        Expected kasan_data->report_expected == kasan_data->report_found, but
-        kasan_data->report_expected == 1
-        kasan_data->report_found == 0
-        not ok 28 - kmalloc_double_kzfree
+        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:974
+        KASAN failure expected in "kfree_sensitive(ptr)", but none occurred
+        not ok 44 - kmalloc_double_kzfree
+
 
 最后打印所有KASAN测试的累积状态。成功::
 
-- 
2.31.1

