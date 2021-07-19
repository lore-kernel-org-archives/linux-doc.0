Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C405BC12002
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB2461165
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235530AbhGSJCJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:02:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39504 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235691AbhGSJCJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Jul 2021 05:02:09 -0400
Received: from localhost.localdomain (unknown [112.20.113.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0LvSPVghpEhAA--.19840S8;
        Mon, 19 Jul 2021 17:42:42 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 6/8] docs/zh_CN: add virt acrn introduction translation
Date:   Mon, 19 Jul 2021 17:42:53 +0800
Message-Id: <9b8fe6e52052295ba43959cb42c0ac8044691e32.1626687013.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1626687013.git.siyanteng@loongson.cn>
References: <cover.1626687013.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0LvSPVghpEhAA--.19840S8
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1Utr48GFyDXF4xWw4xtFb_yoW5uFWUpr
        nIkryfWF1xJw1j93yUGr1UJF1UAr1rXw4UJ3Wqqr1Fqr98Ar4Utr4Utry8GF9rJrW8AFyD
        XF15XFy8Gr1jvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUjXAw3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/introduction.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/virt/acrn/index.rst    |  4 +-
 .../zh_CN/virt/acrn/introduction.rst          | 52 +++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/introduction.rst

diff --git a/Documentation/translations/zh_CN/virt/acrn/index.rst b/Documentation/translations/zh_CN/virt/acrn/index.rst
index 909e58a045a5..1daa0a187a7d 100644
--- a/Documentation/translations/zh_CN/virt/acrn/index.rst
+++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
@@ -20,8 +20,10 @@ ACRN管理平台
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
index 000000000000..6585b1b293d0
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/acrn/introduction.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/introduction.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_virt_introduction:
+
+ACRN管理平台介绍
+================
+
+ACRN管理平台是一个第一类管理平台，直接在裸机硬件上运行。它有一个特权管理虚拟机，称为服
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
+  |                         ACRN管理平台                                 |
+  +----------------------------------------------------------------------+
+  |                          硬件                                        |
+  +----------------------------------------------------------------------+
+
+ACRN用户空间为用户虚拟机分配内存，配置和初始化用户虚拟机使用的设备，加载虚拟引导程序，
+初始化虚拟CPU状态，处理来自用户虚拟机的I/O请求访问。它使用ioctls来与HSM通信。HSM通过
+与ACRN管理平台的hypercalls进行交互来实现管理服务。HSM向用户空间输出一个char设备接口
+（/dev/acrn_hsm）。
+
+ACRN管理平台是开源的，任何人都可以贡献。源码库可在
+https://github.com/projectacrn/acrn-hypervisor。
-- 
2.27.0

