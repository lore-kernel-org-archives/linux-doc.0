Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFFEC43214
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8D53611C5
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241239AbhHFB0z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:26:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46968 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235885AbhHFB0x (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 21:26:53 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx30PFjwxhvs8rAA--.54926S4;
        Fri, 06 Aug 2021 09:26:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 2/8] docs/zh_CN: add virt paravirt_ops translation
Date:   Fri,  6 Aug 2021 09:26:40 +0800
Message-Id: <abba361233e2a58999ef5d31c20f24370d7724f2.1628212777.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1628212777.git.siyanteng@loongson.cn>
References: <cover.1628212777.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx30PFjwxhvs8rAA--.54926S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWxArykWr4kCrW3Xr15XFb_yoW5Zryfpr
        yDKryfG3W8Aa47Za1Skay3Wr1xG3Z7GFnxGayxZwnavF1Dt3yYyr4UtF90yF97WryxZFW0
        gF1vkrZ8Ca4jv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
        Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
        W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOJPE
        UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/virt/paravirt_ops.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/virt/index.rst         |  3 +-
 .../translations/zh_CN/virt/paravirt_ops.rst  | 41 +++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/paravirt_ops.rst

diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
index 9e5df5b5de15..b9b23bb88ffa 100644
--- a/Documentation/translations/zh_CN/virt/index.rst
+++ b/Documentation/translations/zh_CN/virt/index.rst
@@ -20,11 +20,12 @@ Linux虚拟化支持
 .. toctree::
    :maxdepth: 2
 
+   paravirt_ops
+
 TODOLIST:
 
    kvm/index
    uml/user_mode_linux_howto_v2
-   paravirt_ops
    guest-halt-polling
    ne_overview
    acrn/index
diff --git a/Documentation/translations/zh_CN/virt/paravirt_ops.rst b/Documentation/translations/zh_CN/virt/paravirt_ops.rst
new file mode 100644
index 000000000000..06b122bc915d
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/paravirt_ops.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/paravirt_ops.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 陈飞杨 Feiyang Chen <chenfeiyang@loongson.cn>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_virt_paravirt_ops:
+
+============
+半虚拟化操作
+============
+
+Linux提供了对不同管理程序虚拟化技术的支持。历史上，为了支持不同的虚拟机超级管理器
+（hypervisor，下文简称超级管理器），需要不同的二进制内核，这个限制已经被pv_ops移
+除了。Linux pv_ops是一个虚拟化API，它能够支持不同的管理程序。它允许每个管理程序
+优先于关键操作，并允许单一的内核二进制文件在所有支持的执行环境中运行，包括本机——没
+有任何管理程序。
+
+pv_ops提供了一组函数指针，代表了与低级关键指令和各领域高级功能相对应的操作。
+pv-ops允许在运行时进行优化，在启动时对低级关键操作进行二进制修补。
+
+pv_ops操作被分为三类:
+
+- 简单的间接调用
+   这些操作对应于高水平的函数，众所周知，间接调用的开销并不十分重要。
+
+- 间接调用，允许用二进制补丁进行优化
+   通常情况下，这些操作对应于低级别的关键指令。它们被频繁地调用，并且是对性能关
+   键。开销是非常重要的。
+
+- 一套用于手写汇编代码的宏程序
+   手写的汇编代码（.S文件）也需要半虚拟化，因为它们包括敏感指令或其中的一些代
+   码路径对性能非常关键。
-- 
2.27.0

