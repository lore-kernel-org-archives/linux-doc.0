Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49416C43334
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 11:08:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbiFHLIu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 07:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237982AbiFHLIb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 07:08:31 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED77D20C6D4
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 04:08:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx308mg6BixnEtAA--.6094S4;
        Wed, 08 Jun 2022 19:08:25 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 2/2] docs/zh_CN: riscv: Update the translation of vm-layout.rst to 5.19-rc1
Date:   Wed,  8 Jun 2022 19:08:21 +0800
Message-Id: <10cd6a241a0266d1d19ee5f0b2177d7d14d17ed2.1654685338.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654685338.git.zhoubinbin@loongson.cn>
References: <cover.1654685338.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx308mg6BixnEtAA--.6094S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWw47Kry5ZFyUJFyfCrWfKrg_yoW5Kr15pr
        1DJryxGr48JryUJw1UJry5tr1UAr18Aa1UJr1rJr1UJryUGr1UJr1UJry5Jr1DGr15Ar17
        Jr1DGrWUtr1UJw7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS
        14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
        xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Y
        z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4
        kS14v26r126r1DMxkIecxEwVAFwVW8KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
        bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
        k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRTSoAUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from upstream commit 9d19f2b5256e
("Documentation: riscv: Add sv48 description to VM layout")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../translations/zh_CN/riscv/vm-layout.rst    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/translations/zh_CN/riscv/vm-layout.rst b/Documentation/translations/zh_CN/riscv/vm-layout.rst
index 585cb89317a3..91884e2dfff8 100644
--- a/Documentation/translations/zh_CN/riscv/vm-layout.rst
+++ b/Documentation/translations/zh_CN/riscv/vm-layout.rst
@@ -6,6 +6,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+        Binbin Zhou <zhoubinbin@loongson.cn>
 
 ============================
 RISC-V Linux上的虚拟内存布局
@@ -65,3 +66,39 @@ RISC-V Linux Kernel SV39
    ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+RISC-V Linux Kernel SV48
+------------------------
+
+::
+
+ ========================================================================================================================
+      开始地址       |   偏移      |     结束地址      |  大小    | 虚拟内存区域描述
+ ========================================================================================================================
+                    |            |                  |         |
+   0000000000000000 |    0       | 00007fffffffffff |  128 TB | 用户空间虚拟内存，每个内存管理器不同
+  __________________|____________|__________________|_________|___________________________________________________________
+                    |            |                  |         |
+   0000800000000000 | +128    TB | ffff7fffffffffff | ~16M TB | ... 巨大的、几乎64位宽的直到内核映射的-128TB地方
+                    |            |                  |         |     开始偏移的非经典虚拟内存地址空洞。
+                    |            |                  |         |
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | 内核空间的虚拟内存，在所有进程之间共享:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+   ffff8d7ffee00000 |  -114.5 TB | ffff8d7ffeffffff |    2 MB | fixmap
+   ffff8d7fff000000 |  -114.5 TB | ffff8d7fffffffff |   16 MB | PCI io
+   ffff8d8000000000 |  -114.5 TB | ffff8f7fffffffff |    2 TB | vmemmap
+   ffff8f8000000000 |  -112.5 TB | ffffaf7fffffffff |   32 TB | vmalloc/ioremap space
+   ffffaf8000000000 |  -80.5  TB | ffffef7fffffffff |   64 TB | 直接映射所有物理内存
+   ffffef8000000000 |  -16.5  TB | fffffffeffffffff | 16.5 TB | kasan
+  __________________|____________|__________________|_________|____________________________________________________________
+                                                              |
+                                                              | 从此处开始，与39-bit布局相同：
+  ____________________________________________________________|____________________________________________________________
+                    |            |                  |         |
+   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
+   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
+  __________________|____________|__________________|_________|____________________________________________________________
-- 
2.20.1

