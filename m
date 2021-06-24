Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F03AC48BDF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 09:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8844A613E3
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 09:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhFXJI0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 05:08:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58822 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230175AbhFXJI0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Jun 2021 05:08:26 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LwStRgo_0WAA--.5330S10;
        Thu, 24 Jun 2021 17:06:01 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 8/8] docs/zh_CN: add infiniband user_verbs translation
Date:   Thu, 24 Jun 2021 17:06:57 +0800
Message-Id: <704cf3d1ce4f6f6bf925af0bedfc5fb3a2bf4081.1624525360.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1624525360.git.siyanteng@loongson.cn>
References: <cover.1624525360.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0LwStRgo_0WAA--.5330S10
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyDCrW7ZFW5CFyftFy8uFg_yoWrtr4kpr
        yDC34xK3W7Aa42y3yxGry7Aw48Ga48AFW5Jas7twnIqFn8J3yfArn0y34jkFZIgrW8AFZ0
        qr4YgFyvkrWIyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JUfl19UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/infiniband/user_verbs.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/infiniband/index.rst   |  3 +-
 .../zh_CN/infiniband/user_verbs.rst           | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/user_verbs.rst

diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index eaca7bba599a..f11efa7053d3 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -27,10 +27,9 @@
    sysfs
    tag_matching
    user_mad
+   user_verbs
 
-TODOLIST:
 
-   user_verbs
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/infiniband/user_verbs.rst b/Documentation/translations/zh_CN/infiniband/user_verbs.rst
new file mode 100644
index 000000000000..3f11517a6877
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/user_verbs.rst
@@ -0,0 +1,71 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/infiniband/user_verbs.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ <sign>
+
+.. _cn_infiniband_user_verbs:
+
+=================
+用户空间verbs访问
+=================
+
+  ib_uverbs模块，通过启用CONFIG_INFINIBAND_USER_VERBS构建，使用户空间
+  通过“verbs”直接访问IB硬件，如InfiniBand架构规范第11章所述。
+
+  要使用verbs，需要libibverbs库，可从https://github.com/linux-rdma/rdma-core。
+  libibverbs包含一个独立于设备的API，用于使用ib_uverbs接口。libibverbs
+  还需要为你的InfiniBand硬件提供适当的独立于设备的内核和用户空间驱动。例如，
+  要使用Mellanox HCA，你需要安装ib_mthca内核模块和libmthca用户空间驱动。
+
+用户-内核通信
+=============
+
+  用户空间通过/dev/infiniband/uverbsN字符设备与内核进行慢速路径、资源管理
+  操作的通信。快速路径操作通常是通过直接写入硬件寄存器mmap()到用户空间来完成
+  的，没有系统调用或上下文切换到内核。
+
+  命令是通过在这些设备文件上的write()s发送给内核的。ABI在
+  drivers/infiniband/include/ib_user_verbs.h中定义。需要内核响应的命令的结
+  构包含一个64位字段，用来传递一个指向输出缓冲区的指针。状态作为write()系统调
+  用的返回值被返回到用户空间。
+
+资源管理
+========
+
+  由于所有IB资源的创建和销毁都是通过文件描述符传递的命令完成的，所以内核可以跟
+  踪哪些资源被附加到一个给定的用户空间上下文。ib_uverbs模块维护着idr表，用来在
+  内核指针和不透明的用户空间句柄之间进行转换，这样内核指针就不会暴露给用户空间，
+  而用户空间也无法欺骗内核去跟踪一个假的指针。
+
+  这也允许内核在一个进程退出时进行清理，并防止一个进程触及另一个进程的资源。
+
+内存引脚
+========
+
+  直接的用户空间I/O要求与作为潜在I/O目标的内存区域保持在同一物理地址上。ib_uverbs
+  模块通过get_user_pages()和put_page()调用来管理内存区域的固定和解除固定。它还核
+  算进程的pinned_vm中被固定的内存量，并检查非特权进程是否超过其RLIMIT_MEMLOCK限制。
+
+  被多次固定的页面在每次被固定时都会被计数，所以pinned_vm的值可能会高估一个进程所
+  固定的页面数量。
+
+/dev文件
+========
+
+  要想用udev自动创建适当的字符设备文件，可以采用如下规则::
+
+    KERNEL=="uverbs*", NAME="infiniband/%k"
+
+  可以使用。 这将创建设备节点，名为::
+
+    /dev/infiniband/uverbs0
+
+  等等。由于InfiniBand的用户空间verbs对于非特权进程来说应该是安全的，因此在udev规
+  则中加入适当的MODE或GROUP可能是有用的。
-- 
2.27.0

