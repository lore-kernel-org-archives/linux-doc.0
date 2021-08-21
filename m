Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC372C4338F
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 08:18:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87701611EF
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 08:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbhHUISy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 Aug 2021 04:18:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47154 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232077AbhHUISy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 21 Aug 2021 04:18:54 -0400
Received: from localhost.localdomain (unknown [112.20.110.91])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr0K9tiBhnUwzAA--.64497S2;
        Sat, 21 Aug 2021 16:18:07 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/zh_CN: Modify the translator tag and fix the wrong word
Date:   Sat, 21 Aug 2021 16:18:00 +0800
Message-Id: <20210821081800.2205103-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr0K9tiBhnUwzAA--.64497S2
X-Coremail-Antispam: 1UD129KBjvAXoWfAFWUAr18Zw18Zr4UtF4kCrg_yoW5ArW3Co
        W3Kw45CrZrWFn8XF4DGw45Ar4UGr4fCFZayr4vkwnF934xtrn7K3W8tw1Yqw43CrW5Ka4f
        J348ua1rJFW7J3WUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY67AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
        MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUjNJ55UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a wrong word;

Fix old Original tag;

Remove unnecessary blank lines;

Modify the translator tag to be consistent with the current.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/core-api/cachetlb.rst    | 2 +-
 Documentation/translations/zh_CN/core-api/index.rst       | 8 +++++---
 .../translations/zh_CN/core-api/irq/concepts.rst          | 8 +++++---
 Documentation/translations/zh_CN/core-api/irq/index.rst   | 7 +++++--
 .../translations/zh_CN/core-api/irq/irq-affinity.rst      | 8 +++++---
 .../translations/zh_CN/core-api/irq/irq-domain.rst        | 8 +++++---
 .../translations/zh_CN/core-api/irq/irqflags-tracing.rst  | 8 +++++---
 Documentation/translations/zh_CN/core-api/kernel-api.rst  | 6 ++++--
 Documentation/translations/zh_CN/core-api/kobject.rst     | 5 ++++-
 Documentation/translations/zh_CN/core-api/local_ops.rst   | 6 ++++--
 Documentation/translations/zh_CN/core-api/padata.rst      | 5 ++++-
 .../translations/zh_CN/core-api/printk-basics.rst         | 6 ++++--
 .../translations/zh_CN/core-api/printk-formats.rst        | 6 ++++--
 .../translations/zh_CN/core-api/refcount-vs-atomic.rst    | 6 ++++--
 .../translations/zh_CN/core-api/symbol-namespaces.rst     | 6 ++++--
 Documentation/translations/zh_CN/core-api/workqueue.rst   | 6 ++++--
 Documentation/translations/zh_CN/cpu-freq/core.rst        | 8 +++++---
 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 8 +++++---
 .../translations/zh_CN/cpu-freq/cpufreq-stats.rst         | 8 +++++---
 Documentation/translations/zh_CN/cpu-freq/index.rst       | 8 +++++---
 Documentation/translations/zh_CN/filesystems/debugfs.rst  | 2 +-
 Documentation/translations/zh_CN/iio/ep93xx_adc.rst       | 8 +++++---
 Documentation/translations/zh_CN/iio/iio_configfs.rst     | 8 +++++---
 Documentation/translations/zh_CN/iio/index.rst            | 8 +++++---
 Documentation/translations/zh_CN/mips/booting.rst         | 7 +++++--
 Documentation/translations/zh_CN/mips/features.rst        | 7 +++++--
 Documentation/translations/zh_CN/mips/index.rst           | 7 +++++--
 Documentation/translations/zh_CN/mips/ingenic-tcu.rst     | 7 +++++--
 Documentation/translations/zh_CN/openrisc/index.rst       | 8 +++++---
 .../translations/zh_CN/openrisc/openrisc_port.rst         | 7 +++++--
 Documentation/translations/zh_CN/openrisc/todo.rst        | 7 +++++--
 Documentation/translations/zh_CN/parisc/debugging.rst     | 5 ++++-
 Documentation/translations/zh_CN/parisc/index.rst         | 5 ++++-
 Documentation/translations/zh_CN/parisc/registers.rst     | 5 ++++-
 .../translations/zh_CN/riscv/boot-image-header.rst        | 8 +++++---
 Documentation/translations/zh_CN/riscv/index.rst          | 8 +++++---
 .../translations/zh_CN/riscv/patch-acceptance.rst         | 8 +++++---
 Documentation/translations/zh_CN/riscv/pmu.rst            | 8 +++++---
 38 files changed, 170 insertions(+), 86 deletions(-)

diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
index 55827b8a7c53..6fee45fe5e80 100644
--- a/Documentation/translations/zh_CN/core-api/cachetlb.rst
+++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
@@ -80,7 +80,7 @@ cpu上对这个地址空间进行刷新。
 5) ``void update_mmu_cache(struct vm_area_struct *vma,
    unsigned long address, pte_t *ptep)``
 
-	在每个页面故障结束时，这个程序被调用，以告诉体系结构特定的代码，在
+	在每个缺页异常结束时，这个程序被调用，以告诉体系结构特定的代码，在
 	软件页表中，在地址空间“vma->vm_mm”的虚拟地址“地址”处，现在存在
 	一个翻译。
 
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index d5e947d8b6f1..72f0a36daa1c 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../core-api/irq/index`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/core-api/index.rst
 
-.. _cn_core-api_index.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_core-api_index.rst:
 
 ===========
 核心API文档
diff --git a/Documentation/translations/zh_CN/core-api/irq/concepts.rst b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
index 41455bf0f783..9957f0453353 100644
--- a/Documentation/translations/zh_CN/core-api/irq/concepts.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
@@ -1,10 +1,12 @@
 .. include:: ../../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../../core-api/irq/concepts`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/core-api/irq/concepts.rst
 
-.. _cn_concepts.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_concepts.rst:
 
 ===========
 什么是IRQ？
diff --git a/Documentation/translations/zh_CN/core-api/irq/index.rst b/Documentation/translations/zh_CN/core-api/irq/index.rst
index 910ccabf041f..ba6acc4b48e5 100644
--- a/Documentation/translations/zh_CN/core-api/irq/index.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/index.rst
@@ -1,7 +1,10 @@
 .. include:: ../../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../../core-api/irq/index`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/core-api/irq/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_irq_index.rst:
 
diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
index 82a4428f22fd..7addd5f27a88 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
@@ -1,10 +1,12 @@
 .. include:: ../../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../../core-api/irq/irq-affinity`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/core-api/irq/irq-affinity
 
-.. _cn_irq-affinity.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_irq-affinity.rst:
 
 ==============
 SMP IRQ 亲和性
diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
index 3c82dd307a46..7d077742f758 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
@@ -1,10 +1,12 @@
 .. include:: ../../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../../core-api/irq/irq-domain`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/core-api/irq/irq-domain.rst
 
-.. _cn_irq-domain.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_irq-domain.rst:
 
 =======================
 irq_domain 中断号映射库
diff --git a/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
index c889bd0f65d9..9af50b4b8c2d 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
@@ -1,10 +1,12 @@
 .. include:: ../../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../../core-api/irq/irqflags-tracing`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/core-api/irq/irqflags-tracing.rst
 
-.. _cn_irqflags-tracing.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_irqflags-tracing.rst:
 
 =================
 IRQ-flags状态追踪
diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
index d6f815ec265b..ab7d81889340 100644
--- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/kernel-api.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_kernel-api.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_kernel-api.rst:
 
 ============
 Linux内核API
diff --git a/Documentation/translations/zh_CN/core-api/kobject.rst b/Documentation/translations/zh_CN/core-api/kobject.rst
index f0e6a4aeb372..b7c37794cc7f 100644
--- a/Documentation/translations/zh_CN/core-api/kobject.rst
+++ b/Documentation/translations/zh_CN/core-api/kobject.rst
@@ -1,7 +1,10 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/kobject.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_core_api_kobject.rst:
 
diff --git a/Documentation/translations/zh_CN/core-api/local_ops.rst b/Documentation/translations/zh_CN/core-api/local_ops.rst
index ee67379b6869..41e4525038e8 100644
--- a/Documentation/translations/zh_CN/core-api/local_ops.rst
+++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/local_ops.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_local_ops:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_local_ops:
 
 ========================
 本地原子操作的语义和行为
diff --git a/Documentation/translations/zh_CN/core-api/padata.rst b/Documentation/translations/zh_CN/core-api/padata.rst
index c627f8f131f9..781d30675afd 100644
--- a/Documentation/translations/zh_CN/core-api/padata.rst
+++ b/Documentation/translations/zh_CN/core-api/padata.rst
@@ -3,7 +3,10 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/padata.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_core_api_padata.rst:
 
diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
index 2b20f6303a82..d574de3167c8 100644
--- a/Documentation/translations/zh_CN/core-api/printk-basics.rst
+++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst
@@ -2,10 +2,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/printk-basics.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_printk-basics.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_printk-basics.rst:
 
 ==================
 使用printk记录消息
diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
index a680c8f164c3..ce39c788cf5a 100644
--- a/Documentation/translations/zh_CN/core-api/printk-formats.rst
+++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/printk-formats.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_printk-formats.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_printk-formats.rst:
 
 ==============================
 如何获得正确的printk格式占位符
diff --git a/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
index ea834e38d2f6..e2467fd26fc0 100644
--- a/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
+++ b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/refcount-vs-atomic.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_refcount-vs-atomic:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_refcount-vs-atomic:
 
 =======================================
 与atomic_t相比，refcount_t的API是这样的
diff --git a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
index ce05c29c7697..6abf7ed534ca 100644
--- a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/symbol-namespaces.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_symbol-namespaces.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_symbol-namespaces.rst:
 
 =================================
 符号命名空间（Symbol Namespaces）
diff --git a/Documentation/translations/zh_CN/core-api/workqueue.rst b/Documentation/translations/zh_CN/core-api/workqueue.rst
index 0b8f730db6c0..e372fa5cf101 100644
--- a/Documentation/translations/zh_CN/core-api/workqueue.rst
+++ b/Documentation/translations/zh_CN/core-api/workqueue.rst
@@ -2,10 +2,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/core-api/workqueue.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_workqueue.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_workqueue.rst:
 
 =========================
 并发管理的工作队列 (cmwq)
diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst b/Documentation/translations/zh_CN/cpu-freq/core.rst
index 19fb9c029cfe..0c6fd447ced6 100644
--- a/Documentation/translations/zh_CN/cpu-freq/core.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
@@ -1,11 +1,13 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../cpu-freq/core`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/cpu-freq/core.rst
 
-.. _cn_core.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_core.rst:
 
 ====================================
 CPUFreq核心和CPUFreq通知器的通用说明
diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
index 5ae9cfa2ec55..b9846173dd71 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -2,11 +2,13 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../cpu-freq/cpu-drivers`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/cpu-freq/cpu-drivers.rst
 
-.. _cn_cpu-drivers.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_cpu-drivers.rst:
 
 =======================================
 如何实现一个新的CPUFreq处理器驱动程序？
diff --git a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
index c90d1d8353ed..f14423099d4b 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
@@ -2,11 +2,13 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../cpu-freq/cpufreq-stats`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/cpu-freq/cpufreq-stats.rst
 
-.. _cn_cpufreq-stats.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_cpufreq-stats.rst:
 
 ==========================================
 sysfs CPUFreq Stats的一般说明
diff --git a/Documentation/translations/zh_CN/cpu-freq/index.rst b/Documentation/translations/zh_CN/cpu-freq/index.rst
index 65074e211940..c6e50963cd33 100644
--- a/Documentation/translations/zh_CN/cpu-freq/index.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/index.rst
@@ -2,11 +2,13 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../cpu-freq/index`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/cpu-freq/index.rst
 
-.. _cn_index.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_index.rst:
 
 =======================================================
 Linux CPUFreq - Linux(TM)内核中的CPU频率和电压升降代码
diff --git a/Documentation/translations/zh_CN/filesystems/debugfs.rst b/Documentation/translations/zh_CN/filesystems/debugfs.rst
index 822c4d42fdf9..4981a82dd651 100644
--- a/Documentation/translations/zh_CN/filesystems/debugfs.rst
+++ b/Documentation/translations/zh_CN/filesystems/debugfs.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../filesystems/debugfs`
+:Original: Documentation/filesystems/debugfs.rst
 
 =======
 Debugfs
diff --git a/Documentation/translations/zh_CN/iio/ep93xx_adc.rst b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
index 7e91d2197867..64f3f3508353 100644
--- a/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
+++ b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../iio/ep93xx_adc`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/iio/ep93xx_adc.rst
 
-.. _cn_iio_ep93xx_adc:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_iio_ep93xx_adc:
 
 ==================================
 思睿逻辑 EP93xx 模拟数字转换器驱动
diff --git a/Documentation/translations/zh_CN/iio/iio_configfs.rst b/Documentation/translations/zh_CN/iio/iio_configfs.rst
index 274488e8dce4..d5460e951804 100644
--- a/Documentation/translations/zh_CN/iio/iio_configfs.rst
+++ b/Documentation/translations/zh_CN/iio/iio_configfs.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../iio/iio_configfs`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/iio/iio_configfs.rst
 
-.. _cn_iio_configfs:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_iio_configfs:
 
 =====================
 工业 IIO configfs支持
diff --git a/Documentation/translations/zh_CN/iio/index.rst b/Documentation/translations/zh_CN/iio/index.rst
index 7087076a10f6..32d69047b16a 100644
--- a/Documentation/translations/zh_CN/iio/index.rst
+++ b/Documentation/translations/zh_CN/iio/index.rst
@@ -2,11 +2,13 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../iio/index`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/iio/index.rst
 
-.. _cn_iio_index:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_iio_index:
 
 ========
 工业 I/O
diff --git a/Documentation/translations/zh_CN/mips/booting.rst b/Documentation/translations/zh_CN/mips/booting.rst
index 96453e1b962e..e0bbd3f20862 100644
--- a/Documentation/translations/zh_CN/mips/booting.rst
+++ b/Documentation/translations/zh_CN/mips/booting.rst
@@ -2,8 +2,11 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../mips/booting`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/mips/booting.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_booting:
 
diff --git a/Documentation/translations/zh_CN/mips/features.rst b/Documentation/translations/zh_CN/mips/features.rst
index 93d93d06b1b3..b61dab06ceaf 100644
--- a/Documentation/translations/zh_CN/mips/features.rst
+++ b/Documentation/translations/zh_CN/mips/features.rst
@@ -2,8 +2,11 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../mips/features`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/mips/features.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_features:
 
diff --git a/Documentation/translations/zh_CN/mips/index.rst b/Documentation/translations/zh_CN/mips/index.rst
index b85033f9d67c..192c6adbb72e 100644
--- a/Documentation/translations/zh_CN/mips/index.rst
+++ b/Documentation/translations/zh_CN/mips/index.rst
@@ -2,8 +2,11 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../mips/index`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/mips/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 ===========================
 MIPS特性文档
diff --git a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
index f04ba407384a..ddbe149c517b 100644
--- a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
+++ b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
@@ -2,8 +2,11 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../mips/ingenic-tcu`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/mips/ingenic-tcu.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_ingenic-tcu:
 
diff --git a/Documentation/translations/zh_CN/openrisc/index.rst b/Documentation/translations/zh_CN/openrisc/index.rst
index d722642796c8..9ad6cc600884 100644
--- a/Documentation/translations/zh_CN/openrisc/index.rst
+++ b/Documentation/translations/zh_CN/openrisc/index.rst
@@ -2,11 +2,13 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../openrisc/index`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/openrisc/index.rst
 
-.. _cn_openrisc_index:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_openrisc_index:
 
 =================
 OpenRISC 体系架构
diff --git a/Documentation/translations/zh_CN/openrisc/openrisc_port.rst b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
index e87d0eec281d..b8a67670492d 100644
--- a/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
+++ b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
@@ -1,7 +1,10 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../openrisc/openrisc_port`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/openrisc/openrisc_port.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_openrisc_port:
 
diff --git a/Documentation/translations/zh_CN/openrisc/todo.rst b/Documentation/translations/zh_CN/openrisc/todo.rst
index 9944ad05473b..63c38717edb1 100644
--- a/Documentation/translations/zh_CN/openrisc/todo.rst
+++ b/Documentation/translations/zh_CN/openrisc/todo.rst
@@ -1,7 +1,10 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../openrisc/todo`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/openrisc/todo.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_openrisc_todo.rst:
 
diff --git a/Documentation/translations/zh_CN/parisc/debugging.rst b/Documentation/translations/zh_CN/parisc/debugging.rst
index c21beb986e15..68b73eb57105 100644
--- a/Documentation/translations/zh_CN/parisc/debugging.rst
+++ b/Documentation/translations/zh_CN/parisc/debugging.rst
@@ -1,7 +1,10 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/parisc/debugging.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_parisc_debugging:
 
diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
index a47454ebe32e..0cc553fc8272 100644
--- a/Documentation/translations/zh_CN/parisc/index.rst
+++ b/Documentation/translations/zh_CN/parisc/index.rst
@@ -2,7 +2,10 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/parisc/index.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_parisc_index:
 
diff --git a/Documentation/translations/zh_CN/parisc/registers.rst b/Documentation/translations/zh_CN/parisc/registers.rst
index 71e2404cd103..d2ab1874a602 100644
--- a/Documentation/translations/zh_CN/parisc/registers.rst
+++ b/Documentation/translations/zh_CN/parisc/registers.rst
@@ -1,7 +1,10 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/parisc/registers.rst
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_parisc_registers:
 
diff --git a/Documentation/translations/zh_CN/riscv/boot-image-header.rst b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
index 241bf9c1bcbe..0234c28a7114 100644
--- a/Documentation/translations/zh_CN/riscv/boot-image-header.rst
+++ b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../riscv/boot-image-header`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/riscv/boot-image-header.rst
 
-.. _cn_boot-image-header.rst:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_boot-image-header.rst:
 
 ==========================
 RISC-V Linux启动镜像文件头
diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documentation/translations/zh_CN/riscv/index.rst
index db13b1101490..bbf5d7b3777a 100644
--- a/Documentation/translations/zh_CN/riscv/index.rst
+++ b/Documentation/translations/zh_CN/riscv/index.rst
@@ -2,11 +2,13 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../riscv/index`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/riscv/index.rst
 
-.. _cn_riscv_index:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_riscv_index:
 
 ===============
 RISC-V 体系结构
diff --git a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
index 9fd1c8216763..d180d24717bf 100644
--- a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
+++ b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
@@ -2,11 +2,13 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../riscv/patch-acceptance`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/riscv/patch-acceptance.rst
 
-.. _cn_riscv_patch-acceptance:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_riscv_patch-acceptance:
 
 arch/riscv 开发者维护指南
 =========================
diff --git a/Documentation/translations/zh_CN/riscv/pmu.rst b/Documentation/translations/zh_CN/riscv/pmu.rst
index 22dcf3a9ca6e..7ec801026c4d 100644
--- a/Documentation/translations/zh_CN/riscv/pmu.rst
+++ b/Documentation/translations/zh_CN/riscv/pmu.rst
@@ -1,10 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../riscv/pmu`
-:Translator: Yanteng Si <siyanteng@loongson.cn>
+:Original: Documentation/riscv/pmu.rst
 
-.. _cn_riscv_pmu:
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _cn_riscv_pmu:
 
 ========================
 RISC-V平台上对PMUs的支持
-- 
2.27.0

