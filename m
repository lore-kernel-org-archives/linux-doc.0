Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A3CC432BE
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 02:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BBE960ED3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 02:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbhGWCEq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 22:04:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56766 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233237AbhGWCEq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Jul 2021 22:04:46 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_0E1Lfpg4fAiAA--.43799S4;
        Fri, 23 Jul 2021 10:45:15 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 2/8] docs/zh_CN: add virt paravirt_ops translation
Date:   Fri, 23 Jul 2021 10:45:38 +0800
Message-Id: <603212ad57757cf820fb6170babaf0ac11266222.1627007853.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627007852.git.siyanteng@loongson.cn>
References: <cover.1627007852.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_0E1Lfpg4fAiAA--.43799S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZw45GFyxtr1kKF4DtFW8JFb_yoW5CF1rpr
        yDKryfG3W8Aa4UZa1fKay3Wr1xGF97GFn8GayfZwnavF1DJ3yayr4UtFyYyF93Wry8ZFW0
        gF4qkFZ8Ca4jv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
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

Translate Documentation/virt/paravirt_ops.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/virt/index.rst         |  3 +-
 .../translations/zh_CN/virt/paravirt_ops.rst  | 40 +++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/paravirt_ops.rst

diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
index f5c922bbd8a8..6adda3fba6e0 100644
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
index 000000000000..596b2ca58512
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/paravirt_ops.rst
@@ -0,0 +1,40 @@
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
+
+.. _cn_virt_paravirt_ops:
+
+============
+Paravirt_ops
+============
+
+Linux提供了对不同管理程序虚拟化技术的支持。历史上，为了支持不同的虚拟机管理平台
+（hypervisor，下文简称管理平台），需要不同的二进制内核，这个限制已经被pv_ops移
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
+   手写的汇编代码（.S文件）也需要准虚拟化，因为它们包括敏感指令或其中的一些代
+   码路径对性能非常关键。
-- 
2.27.0

