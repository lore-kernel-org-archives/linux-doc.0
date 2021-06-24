Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCC1C49EA6
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 09:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7408E613EA
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 09:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhFXJIS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 05:08:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58668 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230142AbhFXJIR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Jun 2021 05:08:17 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LwStRgo_0WAA--.5330S4;
        Thu, 24 Jun 2021 17:05:55 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 2/8] docs/zh_CN: add infiniband core_locking translation
Date:   Thu, 24 Jun 2021 17:06:51 +0800
Message-Id: <630622fe95877503196f875e3cd1af57dc200d6d.1624525360.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1624525360.git.siyanteng@loongson.cn>
References: <cover.1624525360.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0LwStRgo_0WAA--.5330S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw13KF4DWFWrKFyUur13CFg_yoW7CrW8pF
        9rK34fG3ZrZF9FyFWDur1UJF17Wa4IkayUurZ7X347Xrn5Xas8trsIyFy3JFZxWryIyrW5
        tF4S9FWxCrW5Aw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUjoGQDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/infiniband/core_locking.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/infiniband/core_locking.rst         | 114 ++++++++++++++++++
 .../translations/zh_CN/infiniband/index.rst   |   3 +-
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/core_locking.rst

diff --git a/Documentation/translations/zh_CN/infiniband/core_locking.rst b/Documentation/translations/zh_CN/infiniband/core_locking.rst
new file mode 100644
index 000000000000..567058246304
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/core_locking.rst
@@ -0,0 +1,114 @@
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/infiniband/core_locking.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ <sign>
+
+.. _cn_infiniband_core_locking:
+
+================
+无线带宽中间层锁
+================
+
+  本指南试图明确无线带宽中间层的锁假设。它描述了对位于中间层以下的低
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
index 2ad0b3714443..588b66e8e43f 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -21,9 +21,10 @@
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

