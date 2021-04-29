Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE89C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 03:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4FD9613E8
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 03:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhD2DeB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 23:34:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50652 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231874AbhD2DeB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Apr 2021 23:34:01 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH+_kKIpgjVwPAA--.8366S4;
        Thu, 29 Apr 2021 11:33:00 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: [PATCH 2/3] docs/zh_CN: add parisc debugging.rst translation
Date:   Thu, 29 Apr 2021 11:33:34 +0800
Message-Id: <17f17ca148a9fd315340294f19cefbc80732336c.1619665430.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1619665430.git.siyanteng@loongson.cn>
References: <cover.1619665430.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH+_kKIpgjVwPAA--.8366S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW3Wry8XF17Zr4xGr13CFg_yoW5ZFyUpa
        srKryfGa1fAry2yryfKr17GryfGa4xJFZxG3WxX3W5tr1DJrW5t3s8t34YkFnxWr97AFWU
        JF43KrWUCryjyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPU
        UUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This translates Documentation/parisc/debugging.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/parisc/debugging.rst   | 41 +++++++++++++++++++
 .../translations/zh_CN/parisc/index.rst       |  6 ++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst

diff --git a/Documentation/translations/zh_CN/parisc/debugging.rst b/Documentation/translations/zh_CN/parisc/debugging.rst
new file mode 100644
index 000000000000..99af303fd3d8
--- /dev/null
+++ b/Documentation/translations/zh_CN/parisc/debugging.rst
@@ -0,0 +1,41 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/parisc/debugging.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_parisc_debugging:
+
+=================
+调试PA-RISC
+=================
+
+好吧，这里有一些关于调试linux/parisc的低级（偏硬件）部分的提示。
+
+
+1. 绝对地址
+=====================
+
+很多汇编代码目前是以实模式运行的，这意味着绝对地址被使用，而不是像内核其他
+部分那样使用虚拟地址。要将绝对地址转换为虚拟地址，你可以在System.map中查
+找，添加__PAGE_OFFSET（目前是0x10000000）。
+
+
+2. HPMCs
+========
+
+当实模式的代码试图访问不存在的内存时，你会得到一个HPMC，而不是一个内核opps。
+为了调试HPMC，尝试找到系统响应者/请求者地址。系统请求者地址应该与处理器的
+HPA（I/O范围内的高地址）相匹配；系统响应者地址是实模式代码试图访问的地址。
+
+系统响应者地址的典型值是大于__PAGE_OFFSET （0x10000000）的地址，这意味着
+在实际模式代码试图访问它之前，一个虚拟地址没有被翻译成一个物理地址。
+
+
+3. 有趣的Q位
+============
+
+某些非常关键的代码必须清除PSW中的Q位。当Q位被清除时，CPU不会更新中断处理
+程序所读取的寄存器，以找出机器被中断的位置——所以如果你在清除Q位的指令和再
+次设置Q位的RFI之间遇到中断，你不知道它到底发生在哪里。如果你幸运的话，IAOQ
+会指向清除Q位的指令，如果你不幸运的话，它会指向任何地方。通常Q位的问题会
+表现在无法解释的系统挂起或运行到物理内存的末端。
diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
index ef232d46b1ba..b913d664e735 100644
--- a/Documentation/translations/zh_CN/parisc/index.rst
+++ b/Documentation/translations/zh_CN/parisc/index.rst
@@ -10,9 +10,13 @@
 PA-RISC体系架构
 ====================
 
-Todolist:
+.. toctree::
+   :maxdepth: 2
 
    debugging
+
+Todolist:
+
    registers
    features
 
-- 
2.27.0

