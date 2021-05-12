Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7C7C43460
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 263D4613F3
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhELIVe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 04:21:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50690 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230190AbhELIVd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:21:33 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP+7Aj5tgJWQVAA--.17234S4;
        Wed, 12 May 2021 16:20:20 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH v4 2/3] docs/zh_CN: add parisc debugging.rst translation
Date:   Wed, 12 May 2021 16:20:58 +0800
Message-Id: <32661b39374f012442b760444ef149afcc0d22af.1620805100.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1620805100.git.siyanteng@loongson.cn>
References: <cover.1620805100.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP+7Aj5tgJWQVAA--.17234S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW3Wr4xGry7tFyUtFy3CFg_yoW5ZF4fp3
        ZrKryfGa1xA342y34Skr17GryfCayxJFZ3G3Z2y3W5tr1kJFW5t398t34YkFn7Wr97AFWU
        AF4akrWUCryjyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8BMNUUUU
        U
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/parisc/debugging.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/parisc/debugging.rst   | 42 +++++++++++++++++++
 .../translations/zh_CN/parisc/index.rst       |  6 ++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst

diff --git a/Documentation/translations/zh_CN/parisc/debugging.rst b/Documentation/translations/zh_CN/parisc/debugging.rst
new file mode 100644
index 000000000000..c21beb986e15
--- /dev/null
+++ b/Documentation/translations/zh_CN/parisc/debugging.rst
@@ -0,0 +1,42 @@
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
+好吧，这里有一些关于调试linux/parisc的较底层部分的信息。
+
+
+1. 绝对地址
+=====================
+
+很多汇编代码目前运行在实模式下，这意味着会使用绝对地址，而不是像内核其他
+部分那样使用虚拟地址。要将绝对地址转换为虚拟地址，你可以在System.map中查
+找，添加__PAGE_OFFSET（目前是0x10000000）。
+
+
+2. HPMCs
+========
+
+当实模式的代码试图访问不存在的内存时，会出现HPMC（high priority machine
+check）而不是内核oops。若要调试HPMC，请尝试找到系统响应程序/请求程序地址。
+系统请求程序地址应该与（某）处理器的HPA（I/O范围内的高地址）相匹配；系统响应程
+序地址是实模式代码试图访问的地址。
+
+系统响应程序地址的典型值是大于__PAGE_OFFSET （0x10000000）的地址，这意味着
+在实模式试图访问它之前，虚拟地址没有被翻译成物理地址。
+
+
+3. 有趣的Q位
+============
+
+某些非常关键的代码必须清除PSW中的Q位。当Q位被清除时，CPU不会更新中断处理
+程序所读取的寄存器，以找出机器被中断的位置——所以如果你在清除Q位的指令和再
+次设置Q位的RFI之间遇到中断，你不知道它到底发生在哪里。如果你幸运的话，IAOQ
+会指向清除Q位的指令，如果你不幸运的话，它会指向任何地方。通常Q位的问题会
+表现为无法解释的系统挂起或物理内存越界。
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

