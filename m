Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2101AC47089
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 06:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5CAF613CC
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 06:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhE0Got (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 02:44:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35084 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229635AbhE0Got (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 02:44:49 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+N6P69gUhgFAA--.4318S2;
        Thu, 27 May 2021 14:43:07 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, bobwxc@email.cn, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3] docs/zh_CN: add core-api symbol-namespaces.rst translation
Date:   Thu, 27 May 2021 14:43:47 +0800
Message-Id: <20210527064347.3936694-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL+N6P69gUhgFAA--.4318S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jry3Cr1UGFWxZrWrKFyUKFg_yoWfZFyxpF
        1qyr97K3WUJry7Zw1xGrW8tr17Ca97WFsxGwn7J343Jw1DtFZ8Cw47tryjkFyxKr4vkFWk
        Ar4qyFW7Aryj9FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjHUDJUUUU
        U==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translates Documentation/core-api/symbol-namespaces.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
v3:

* update Documentation/translations/zh_CN/core-api/index.rst diff.

v2:

* Some bad translations have been modified as suggested by Xiangcheng.Thank you for your review.
https://lore.kernel.org/linux-doc/20210429052252.GA9451@bobwxc.top/T/#t

* Pick Xiangcheng Wu's review-by tag.

 .../translations/zh_CN/core-api/index.rst     |   2 -
 .../zh_CN/core-api/symbol-namespaces.rst      | 142 ++++++++++++++++++
 2 files changed, 142 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/symbol-namespaces.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index a1dd792e46f7..cda10e03460c 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -26,8 +26,6 @@
    printk-basics
    printk-formats
    workqueue
-
-Todolist:
    symbol-namespaces
 
 数据结构和低级实用程序
diff --git a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
new file mode 100644
index 000000000000..ce05c29c7697
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
@@ -0,0 +1,142 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/symbol-namespaces.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_symbol-namespaces.rst:
+
+
+=================================
+符号命名空间（Symbol Namespaces）
+=================================
+
+本文档描述了如何使用符号命名空间来构造通过EXPORT_SYMBOL()系列宏导出的内核内符号的导出面。
+
+.. 目录
+
+       === 1 简介
+       === 2 如何定义符号命名空间
+          --- 2.1 使用EXPORT_SYMBOL宏
+          --- 2.2 使用DEFAULT_SYMBOL_NAMESPACE定义
+       === 3 如何使用命名空间中导出的符号
+       === 4 加载使用命名空间符号的模块
+       === 5 自动创建MODULE_IMPORT_NS声明
+
+1. 简介
+=======
+
+符号命名空间已经被引入，作为构造内核内API的导出面的一种手段。它允许子系统维护者将
+他们导出的符号划分进独立的命名空间。这对于文档的编写非常有用（想想SUBSYSTEM_DEBUG
+命名空间），也可以限制一组符号在内核其他部分的使用。今后，使用导出到命名空间的符号
+的模块必须导入命名空间。否则，内核将根据其配置，拒绝加载该模块或警告说缺少
+导入。
+
+2. 如何定义符号命名空间
+=======================
+
+符号可以用不同的方法导出到命名空间。所有这些都在改变 EXPORT_SYMBOL 和与之类似的那些宏
+被检测到的方式，以创建 ksymtab 条目。
+
+2.1 使用EXPORT_SYMBOL宏
+=======================
+
+除了允许将内核符号导出到内核符号表的宏EXPORT_SYMBOL()和EXPORT_SYMBOL_GPL()之外，
+这些宏的变体还可以将符号导出到某个命名空间：EXPORT_SYMBOL_NS() 和 EXPORT_SYMBOL_NS_GPL()。
+它们需要一个额外的参数：命名空间（the namespace）。请注意，由于宏扩展，该参数需
+要是一个预处理器符号。例如，要把符号 ``usb_stor_suspend`` 导出到命名空间 ``USB_STORAGE``，
+请使用::
+
+       EXPORT_SYMBOL_NS(usb_stor_suspend, USB_STORAGE);
+
+相应的 ksymtab 条目结构体 ``kernel_symbol`` 将有相应的成员 ``命名空间`` 集。
+导出时未指明命名空间的符号将指向 ``NULL`` 。如果没有定义命名空间，则默认没有。
+``modpost`` 和kernel/module.c分别在构建时或模块加载时使用名称空间。
+
+2.2 使用DEFAULT_SYMBOL_NAMESPACE定义
+====================================
+
+为一个子系统的所有符号定义命名空间可能会非常冗长，并可能变得难以维护。因此，我
+们提供了一个默认定义（DEFAULT_SYMBOL_NAMESPACE），如果设置了这个定义， 它将成
+为所有没有指定命名空间的 EXPORT_SYMBOL() 和 EXPORT_SYMBOL_GPL() 宏扩展的默认
+定义。
+
+有多种方法来指定这个定义，使用哪种方法取决于子系统和维护者的喜好。第一种方法是在
+子系统的 ``Makefile`` 中定义默认命名空间。例如，如果要将usb-common中定义的所有符号导
+出到USB_COMMON命名空间，可以在drivers/usb/common/Makefile中添加这样一行::
+
+       ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON
+
+这将影响所有 EXPORT_SYMBOL() 和 EXPORT_SYMBOL_GPL() 语句。当这个定义存在时，
+用EXPORT_SYMBOL_NS()导出的符号仍然会被导出到作为命名空间参数传递的命名空间中，
+因为这个参数优先于默认的符号命名空间。
+
+定义默认命名空间的第二个选项是直接在编译单元中作为预处理声明。上面的例子就会变
+成::
+
+       #undef  DEFAULT_SYMBOL_NAMESPACE
+       #define DEFAULT_SYMBOL_NAMESPACE USB_COMMON
+
+应置于相关编译单元中任何 EXPORT_SYMBOL 宏之前
+
+3. 如何使用命名空间中导出的符号
+===============================
+
+为了使用被导出到命名空间的符号，内核模块需要明确地导入这些命名空间。
+否则内核可能会拒绝加载该模块。模块代码需要使用宏MODULE_IMPORT_NS来
+表示它所使用的命名空间的符号。例如，一个使用usb_stor_suspend符号的
+模块，需要使用如下语句导入命名空间USB_STORAGE::
+
+       MODULE_IMPORT_NS(USB_STORAGE);
+
+这将在模块中为每个导入的命名空间创建一个 ``modinfo`` 标签。这也顺带
+使得可以用modinfo检查模块已导入的命名空间::
+
+       $ modinfo drivers/usb/storage/ums-karma.ko
+       [...]
+       import_ns:      USB_STORAGE
+       [...]
+
+
+建议将 MODULE_IMPORT_NS() 语句添加到靠近其他模块元数据定义的地方，
+如 MODULE_AUTHOR() 或 MODULE_LICENSE() 。关于自动创建缺失的导入
+语句的方法，请参考第5节。
+
+4. 加载使用命名空间符号的模块
+=============================
+
+在模块加载时（比如 ``insmod`` ），内核将检查每个从模块中引用的符号是否可
+用，以及它可能被导出到的名字空间是否被模块导入。内核的默认行为是拒绝
+加载那些没有指明足以导入的模块。此错误会被记录下来，并且加载将以
+EINVAL方式失败。要允许加载不满足这个前提条件的模块，可以使用此配置选项：
+设置 MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y 将使加载不受影响，但会
+发出警告。
+
+5. 自动创建MODULE_IMPORT_NS声明
+===============================
+
+缺少命名空间的导入可以在构建时很容易被检测到。事实上，如果一个模块
+使用了一个命名空间的符号而没有导入它，modpost会发出警告。
+MODULE_IMPORT_NS()语句通常会被添加到一个明确的位置（和其他模块元
+数据一起）。为了使模块作者（和子系统维护者）的生活更加轻松，我们提
+供了一个脚本和make目标来修复丢失的导入。修复丢失的导入可以用::
+
+       $ make nsdeps
+
+对模块作者来说，以下情况可能很典型::
+
+       - 编写依赖未导入命名空间的符号的代码
+       - ``make``
+       - 注意 ``modpost`` 的警告，提醒你有一个丢失的导入。
+       - 运行 ``make nsdeps``将导入添加到正确的代码位置。
+
+对于引入命名空间的子系统维护者来说，其步骤非常相似。同样，make nsdeps最终将
+为树内模块添加缺失的命名空间导入::
+
+       - 向命名空间转移或添加符号（例如，使用EXPORT_SYMBOL_NS()）。
+       - `make e`（最好是用allmodconfig来覆盖所有的内核模块）。
+       - 注意 ``modpost`` 的警告，提醒你有一个丢失的导入。
+       - 运行 ``maknsdeps``将导入添加到正确的代码位置。
+
+你也可以为外部模块的构建运行nsdeps。典型的用法是::
+
+       $ make -C <path_to_kernel_src> M=$PWD nsdeps
-- 
2.27.0

