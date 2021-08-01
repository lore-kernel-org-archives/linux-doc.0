Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603F3C4338F
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EE15610D0
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhHAMZg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 08:25:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53396 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231527AbhHAMZg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 08:25:36 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+OrkgZhQeonAA--.4804S4;
        Sun, 01 Aug 2021 20:25:18 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenweiguang82@126.com,
        siyanteng01@gmail.com
Subject: [PATCH v2 2/8] docs/zh_CN: add infiniband core_locking translation
Date:   Sun,  1 Aug 2021 20:25:32 +0800
Message-Id: <c7b4cc2c6aba739f777cef80dd527ae523c3d9e5.1627820210.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627820210.git.siyanteng@loongson.cn>
References: <cover.1627820210.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL+OrkgZhQeonAA--.4804S4
X-Coremail-Antispam: 1UD129KBjvJXoWxuFyDZFyftF1UXr4UJr1kZrb_yoW7Cw4rpF
        9rK34fG3ZrZF9FvFWDur4UJF17Ga40kayUurZ7G347Xr1kXas8trnIyFy3JFZxWryIyrWY
        qF4a9FWxCrWrAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
        IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbdOz7UU
        UUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/infiniband/core_locking.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/infiniband/core_locking.rst         | 115 ++++++++++++++++++
 .../translations/zh_CN/infiniband/index.rst   |   3 +-
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/core_locking.rst

diff --git a/Documentation/translations/zh_CN/infiniband/core_locking.rst b/Documentation/translations/zh_CN/infiniband/core_locking.rst
new file mode 100644
index 000000000000..42f08038d44b
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/core_locking.rst
@@ -0,0 +1,115 @@
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/infiniband/core_locking.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 王普宇 Puyu Wang <realpuyuwang@gmail.com>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_infiniband_core_locking:
+
+==================
+infiniband中间层锁
+==================
+
+  本指南试图明确infiniband中间层的锁假设。它描述了对位于中间层以下的低
+  级驱动程序和使用中间层的上层协议的要求。
+
+睡眠和中断环境
+==============
+
+  除了以下异常情况，ib_device结构体中所有方法的低级驱动实现都可以睡眠。
+  这些异常情况是列表中的任意的方法:
+
+    - create_ah
+    - modify_ah
+    - query_ah
+    - destroy_ah
+    - post_send
+    - post_recv
+    - poll_cq
+    - req_notify_cq
+
+    他们可能不可以睡眠，而且必须可以从任何上下文中调用。
+
+    向上层协议使用者输出的相应函数:
+
+    - rdma_create_ah
+    - rdma_modify_ah
+    - rdma_query_ah
+    - rdma_destroy_ah
+    - ib_post_send
+    - ib_post_recv
+    - ib_req_notify_cq
+
+    因此，在任何情况下都可以安全调用（它们）。
+
+  此外，该函数
+
+    - ib_dispatch_event
+
+  被底层驱动用来通过中间层调度异步事件的“A”，也可以从任何上下文中安全调
+  用。
+
+可重入性
+--------
+
+  由低级驱动程序导出的ib_device结构体中的所有方法必须是完全可重入的。
+  即使使用同一对象的多个函数调用被同时运行，低级驱动程序也需要执行所有
+  必要的同步以保持一致性。
+
+  IB中间层不执行任何函数调用的序列化。
+
+  因为低级驱动程序是可重入的，所以不要求上层协议使用者任何顺序执行。然
+  而，为了得到合理的结果，可能需要一些顺序。例如，一个使用者可以在多个
+  CPU上同时安全地调用ib_poll_cq()。然而，不同的ib_poll_cq()调用之间
+  的工作完成信息的顺序没有被定义。
+
+回调
+----
+
+  低级驱动程序不得直接从与ib_device方法调用相同的调用链中执行回调。例
+  如，低级驱动程序不允许从post_send方法直接调用使用者的完成事件处理程
+  序。相反，低级驱动程序应该推迟这个回调，例如，调度一个tasklet来执行
+  这个回调。
+
+  低层驱动负责确保同一CQ的多个完成事件处理程序不被同时调用。驱动程序必
+  须保证一个给定的CQ的事件处理程序在同一时间只有一个在运行。换句话说，
+  以下情况是不允许的::
+
+          CPU1                                    CPU2
+
+    low-level driver ->
+      consumer CQ event callback:
+        /* ... */
+        ib_req_notify_cq(cq, ...);
+                                          low-level driver ->
+        /* ... */                           consumer CQ event callback:
+                                              /* ... */
+        return from CQ event handler
+
+  完成事件和异步事件回调的运行环境没有被定义。 根据低级别的驱动程序，它可能是
+  进程上下文、softirq上下文或中断上下文。上层协议使用者可能不会在回调中睡眠。
+
+热插拔
+------
+
+  当一个低级驱动程序调用ib_register_device()时，它宣布一个设备已经
+  准备好供使用者使用，所有的初始化必须在这个调用之前完成。设备必须保
+  持可用，直到驱动对ib_unregister_device()的调用返回。
+
+  低级驱动程序必须从进程上下文调用ib_register_device()和
+  ib_unregister_device()。如果使用者在这些调用中回调到驱动程序，它
+  不能持有任何可能导致死锁的semaphores。
+
+  一旦其结构体ib_client的add方法被调用，上层协议使用者就可以开始使用
+  一个IB设备。使用者必须在从移除方法返回之前完成所有的清理工作并释放
+  与设备相关的所有资源。
+
+  使用者被允许在其添加和删除方法中睡眠。
diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index ebb1e20b7df4..cc00f31c77d0 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -22,9 +22,10 @@ infiniband
 .. toctree::
    :maxdepth: 1
 
+   core_locking
+
 TODOLIST:
 
-   core_locking
    ipoib
    opa_vnic
    sysfs
-- 
2.27.0

