Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BFFC432BE
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF73B611C5
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhHFB1A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:27:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47094 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235225AbhHFB1A (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 21:27:00 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx30PFjwxhvs8rAA--.54926S8;
        Fri, 06 Aug 2021 09:26:40 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 6/8] docs/zh_CN: add virt acrn introduction translation
Date:   Fri,  6 Aug 2021 09:26:44 +0800
Message-Id: <667a6eb64820d2234d12a0c5dd5b642af16c0d99.1628212777.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1628212777.git.siyanteng@loongson.cn>
References: <cover.1628212777.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx30PFjwxhvs8rAA--.54926S8
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1Utr48GFyDXF4xWw4xtFb_yoW5tFW5pr
        nIkryfWF1xJr1j93yDGr15GF18Jr18Jw4UJ34jqr1rXFyDAr4Utr4Utry8KF9rGry8AFyU
        XF1UWrW8Gr1UZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
        JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
        C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
        6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
        8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
        F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
        ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
        xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
        WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
        OBTYUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/virt/acrn/introduction.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/virt/acrn/index.rst    |  4 +-
 .../zh_CN/virt/acrn/introduction.rst          | 52 +++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/introduction.rst

diff --git a/Documentation/translations/zh_CN/virt/acrn/index.rst b/Documentation/translations/zh_CN/virt/acrn/index.rst
index 6061e790ee83..b8f502033455 100644
--- a/Documentation/translations/zh_CN/virt/acrn/index.rst
+++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
@@ -20,8 +20,10 @@ ACRN超级管理器
 .. toctree::
    :maxdepth: 1
 
+   introduction
+
 TODOLIST:
 
-   introduction
+
    io-request
    cpuid
diff --git a/Documentation/translations/zh_CN/virt/acrn/introduction.rst b/Documentation/translations/zh_CN/virt/acrn/introduction.rst
new file mode 100644
index 000000000000..7182415cb087
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/acrn/introduction.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/acrn/introduction.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_virt_acrn_introduction:
+
+ACRN超级管理器介绍
+==================
+
+ACRN超级管理器是一个第一类超级管理器，直接在裸机硬件上运行。它有一个特权管理虚拟机，称为服
+务虚拟机，用于管理用户虚拟机和进行I/O仿真。
+
+ACRN用户空间是一个运行在服务虚拟机中的应用程序，它根据命令行配置为用户虚拟机仿真设备。
+ACRN管理程序服务模块（HSM）是服务虚拟机中的一个内核模块，为ACRN用户空间提供管理程序服
+务。
+
+下图展示了该架构。
+
+::
+
+                服务端VM                      用户端VM
+      +----------------------------+  |  +------------------+
+      |        +--------------+    |  |  |                  |
+      |        |ACRN用户空间  |    |  |  |                  |
+      |        +--------------+    |  |  |                  |
+      |-----------------ioctl------|  |  |                  |   ...
+      |内核空间       +----------+ |  |  |                  |
+      |               |   HSM    | |  |  | 驱动             |
+      |               +----------+ |  |  |                  |
+      +--------------------|-------+  |  +------------------+
+  +---------------------hypercall----------------------------------------+
+  |                         ACRN超级管理器                               |
+  +----------------------------------------------------------------------+
+  |                          硬件                                        |
+  +----------------------------------------------------------------------+
+
+ACRN用户空间为用户虚拟机分配内存，配置和初始化用户虚拟机使用的设备，加载虚拟引导程序，
+初始化虚拟CPU状态，处理来自用户虚拟机的I/O请求访问。它使用ioctls来与HSM通信。HSM通过
+与ACRN超级管理器的hypercalls进行交互来实现管理服务。HSM向用户空间输出一个char设备接口
+（/dev/acrn_hsm）。
+
+ACRN超级管理器是开源的，任何人都可以贡献。源码库在
+https://github.com/projectacrn/acrn-hypervisor。
-- 
2.27.0

