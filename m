Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FD7C25B0E
	for <linux-doc@archiver.kernel.org>; Fri, 19 Aug 2022 06:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiHSG2x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Aug 2022 02:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345381AbiHSG2u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 02:28:50 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 730B85754A
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 23:28:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxBOKaLf9iHXUEAA--.22726S3;
        Fri, 19 Aug 2022 14:28:43 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 1/4] docs/zh_CN: core-api: Add idr Chinese translation
Date:   Fri, 19 Aug 2022 14:28:37 +0800
Message-Id: <9f578ea087df7ef8665fc08541d208e7429176ec.1660881950.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1660881950.git.zhoubinbin@loongson.cn>
References: <cover.1660881950.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOKaLf9iHXUEAA--.22726S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAFWDJFWUCF4xJrWfurWkCrg_yoWrKFyfpF
        yqgryxKa18JFy7CrZ3WFyUXr18Ca1xCwsxGayxX3WFqrnYyFWFyr47tr9093srWry0yFyF
        kFZakFWj9ryjywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF1l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU86pPUUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/idr.rst into Chinese.

Last English version used:

commit 85656ec193e9 ("IDR: Note that the IDR API is deprecated").

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si<siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/core-api/idr.rst       | 80 +++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |  2 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst

diff --git a/Documentation/translations/zh_CN/core-api/idr.rst b/Documentation/translations/zh_CN/core-api/idr.rst
new file mode 100644
index 000000000000..97a16e76b81b
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/idr.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/idr.rst
+
+:翻译:
+
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
+
+:校译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 吴想成 Wu Xiangcheng <bobwxc@email.cn>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+======
+ID分配
+======
+
+:作者: Matthew Wilcox
+
+概述
+====
+
+要解决的一个常见问题是分配标识符（IDs）；它通常是标识事物的数字。比如包括文件描述
+符、进程ID、网络协议中的数据包标识符、SCSI标记和设备实例编号。IDR和IDA为这个问题
+提供了一个合理的解决方案，以避免每个人都自创。IDR提供将ID映射到指针的能力，而IDA
+仅提供ID分配，因此内存效率更高。
+
+IDR接口已经被废弃，请使用 ``XArray`` 。
+
+IDR的用法
+=========
+
+首先初始化一个IDR，对于静态分配的IDR使用DEFINE_IDR()，或者对于动态分配的IDR使用
+idr_init()。
+
+您可以调用idr_alloc()来分配一个未使用的ID。通过调用idr_find()查询与该ID相关的指针，
+并通过调用idr_remove()释放该ID。
+
+如果需要更改与一个ID相关联的指针，可以调用idr_replace()。这样做的一个常见原因是通
+过将 ``NULL`` 指针传递给分配函数来保留ID；用保留的ID初始化对象，最后将初始化的对
+象插入IDR。
+
+一些用户需要分配大于 ``INT_MAX`` 的ID。到目前为止，所有这些用户都满足 ``UINT_MAX``
+的限制，他们使用idr_alloc_u32()。如果您需要超出u32的ID，我们将与您合作以满足您的
+需求。
+
+如果需要按顺序分配ID，可以使用idr_alloc_cyclic()。处理较大数量的ID时，IDR的效率会
+降低，所以使用这个函数会有一点代价。
+
+要对IDR使用的所有指针进行操作，您可以使用基于回调的idr_for_each()或迭代器样式的
+idr_for_each_entry()。您可能需要使用idr_for_each_entry_continue()来继续迭代。如果
+迭代器不符合您的需求，您也可以使用idr_get_next()。
+
+当使用完IDR后，您可以调用idr_destroy()来释放IDR占用的内存。这并不会释放IDR指向的
+对象；如果您想这样做，请使用其中一个迭代器来执行此操作。
+
+您可以使用idr_is_empty()来查看当前是否分配了任何ID。
+
+如果在从IDR分配一个新ID时需要带锁，您可能需要传递一组限制性的GFP标志，但这可能导
+致IDR无法分配内存。为了解决该问题，您可以在获取锁之前调用idr_preload()，然后在分
+配之后调用idr_preload_end()。
+
+IDR同步的相关内容请见include/linux/idr.h文件中的“DOC: idr sync”。
+
+IDA的用法
+=========
+
+IDA的用法的相关内容请见lib/idr.c文件中的“DOC: IDA description”。
+
+函数和数据结构
+==============
+
+该API在以下内核代码中:
+
+include/linux/idr.h
+
+lib/idr.c
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 8a94ad87465d..c5ba0a48147c 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -44,12 +44,12 @@
    assoc_array
    xarray
    rbtree
+   idr
 
 Todolist:
 
 
 
-   idr
    circular-buffers
    generic-radix-tree
    packing
-- 
2.31.1

