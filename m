Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5041BC28D13
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 12:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbiHYMxz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 08:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiHYMxy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 08:53:54 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24F0A578B1
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 05:53:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx32vScAdjy8cJAA--.38198S3;
        Thu, 25 Aug 2022 20:53:41 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        xiyou.wangcong@gmail.com, hidave.darkstar@gmail.com,
        tekkamanninja@gmail.com, leoyang.li@nxp.com, src.res@email.cn,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH v1 1/3] docs/zh_CN: Update the translation of io_ordering to 6.0-rc2
Date:   Thu, 25 Aug 2022 20:53:25 +0800
Message-Id: <c66f6d17c509c2c93f2afd30223c4bcf734f8317.1661431365.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1661431365.git.siyanteng@loongson.cn>
References: <cover.1661431365.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32vScAdjy8cJAA--.38198S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JF18Kw13Zry8CF45Ww48Zwb_yoW3Wr47pF
        Z3tFyfKa48ZFyUZr4UWFy2gr1UGrykWa1DCrykX3Z3Xr17A3yYkr4UtryfZFy3Wr9rAryD
        tF4FqFyFkryDZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
        pf9x0JUeyxiUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit d1ce350015d8 Documentation: ("Add
io_ordering.rst to driver-api manual").
Move ../zh_CN/io_ordering.txt to ../zh_CN/driver-api/io_ordering.rst.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/driver-api/index.rst   |  2 +-
 .../zh_CN/driver-api/io_ordering.rst          | 60 +++++++++++++++++
 .../translations/zh_CN/io_ordering.txt        | 67 -------------------
 3 files changed, 61 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/driver-api/io_ordering.rst
 delete mode 100644 Documentation/translations/zh_CN/io_ordering.txt

diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
index 24eb2198e5f1..ba354e1f4e6d 100644
--- a/Documentation/translations/zh_CN/driver-api/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -25,6 +25,7 @@ Linux驱动实现者的API指南
    :maxdepth: 2
 
    gpio/index
+   io_ordering
 
 Todolist:
 
@@ -97,7 +98,6 @@ Todolist:
 *   isa
 *   isapnp
 *   io-mapping
-*   io_ordering
 *   generic-counter
 *   memory-devices/index
 *   men-chameleon-bus
diff --git a/Documentation/translations/zh_CN/driver-api/io_ordering.rst b/Documentation/translations/zh_CN/driver-api/io_ordering.rst
new file mode 100644
index 000000000000..4dbfa4ce92a0
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/io_ordering.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/io_ordering.rst
+
+:翻译:
+
+ 林永听 Lin Yongting <linyongting@gmail.com>
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+===========================
+对内存映射地址的I/O写入排序
+===========================
+
+在某些平台上，所谓的内存映射I/O是弱顺序。在这些平台上，驱动开发者有责任
+保证I/O内存映射地址的写操作按程序图意的顺序达到设备。通常读取一个“安全”
+设备寄存器或桥寄存器，触发IO芯片清刷未处理的写操作到达设备后才处理读操作，
+而达到保证目的。驱动程序通常在spinlock保护的临界区退出之前使用这种技术。
+这也可以保证后面的写操作只在前面的写操作之后到达设备（这非常类似于内存
+屏障操作，mb()，不过仅适用于I/O）。
+
+假设一个设备驱动程的具体例子::
+
+                ...
+        CPU A:  spin_lock_irqsave(&dev_lock, flags)
+        CPU A:  val = readl(my_status);
+        CPU A:  ...
+        CPU A:  writel(newval, ring_ptr);
+        CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
+                ...
+        CPU B:  spin_lock_irqsave(&dev_lock, flags)
+        CPU B:  val = readl(my_status);
+        CPU B:  ...
+        CPU B:  writel(newval2, ring_ptr);
+        CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
+                ...
+
+上述例子中，设备可能会先接收到newval2的值，然后接收到newval的值，问题就
+发生了。不过很容易通过下面方法来修复::
+
+                ...
+        CPU A:  spin_lock_irqsave(&dev_lock, flags)
+        CPU A:  val = readl(my_status);
+        CPU A:  ...
+        CPU A:  writel(newval, ring_ptr);
+        CPU A:  (void)readl(safe_register); /* 配置寄存器？*/
+        CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
+                ...
+        CPU B:  spin_lock_irqsave(&dev_lock, flags)
+        CPU B:  val = readl(my_status);
+        CPU B:  ...
+        CPU B:  writel(newval2, ring_ptr);
+        CPU B:  (void)readl(safe_register); /* 配置寄存器？*/
+        CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
+
+在解决方案中，读取safe_register寄存器，触发IO芯片清刷未处理的写操作，
+再处理后面的读操作，防止引发数据不一致问题。
diff --git a/Documentation/translations/zh_CN/io_ordering.txt b/Documentation/translations/zh_CN/io_ordering.txt
deleted file mode 100644
index 7bb3086227ae..000000000000
--- a/Documentation/translations/zh_CN/io_ordering.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Chinese translated version of Documentation/driver-api/io_ordering.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
-Chinese maintainer: Lin Yongting <linyongting@gmail.com>
----------------------------------------------------------------------
-Documentation/driver-api/io_ordering.rst 的中文翻译
-
-如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
-交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者。
-
-中文版维护者： 林永听 Lin Yongting <linyongting@gmail.com>
-中文版翻译者： 林永听 Lin Yongting <linyongting@gmail.com>
-中文版校译者： 林永听 Lin Yongting <linyongting@gmail.com>
-
-
-以下为正文
----------------------------------------------------------------------
-
-在某些平台上，所谓的内存映射I/O是弱顺序。在这些平台上，驱动开发者有责任
-保证I/O内存映射地址的写操作按程序图意的顺序达到设备。通常读取一个“安全”
-设备寄存器或桥寄存器，触发IO芯片清刷未处理的写操作到达设备后才处理读操作，
-而达到保证目的。驱动程序通常在spinlock保护的临界区退出之前使用这种技术。
-这也可以保证后面的写操作只在前面的写操作之后到达设备（这非常类似于内存
-屏障操作，mb()，不过仅适用于I/O）。
-
-假设一个设备驱动程的具体例子：
-
-        ...
-CPU A:  spin_lock_irqsave(&dev_lock, flags)
-CPU A:  val = readl(my_status);
-CPU A:  ...
-CPU A:  writel(newval, ring_ptr);
-CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-CPU B:  spin_lock_irqsave(&dev_lock, flags)
-CPU B:  val = readl(my_status);
-CPU B:  ...
-CPU B:  writel(newval2, ring_ptr);
-CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-
-上述例子中，设备可能会先接收到newval2的值，然后接收到newval的值，问题就
-发生了。不过很容易通过下面方法来修复：
-
-        ...
-CPU A:  spin_lock_irqsave(&dev_lock, flags)
-CPU A:  val = readl(my_status);
-CPU A:  ...
-CPU A:  writel(newval, ring_ptr);
-CPU A:  (void)readl(safe_register); /* 配置寄存器？*/
-CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
-        ...
-CPU B:  spin_lock_irqsave(&dev_lock, flags)
-CPU B:  val = readl(my_status);
-CPU B:  ...
-CPU B:  writel(newval2, ring_ptr);
-CPU B:  (void)readl(safe_register); /* 配置寄存器？*/
-CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
-
-在解决方案中，读取safe_register寄存器，触发IO芯片清刷未处理的写操作，
-再处理后面的读操作，防止引发数据不一致问题。
-- 
2.31.1

