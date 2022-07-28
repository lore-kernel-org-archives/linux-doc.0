Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BE8C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 05:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbiG1FIG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 01:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiG1FIF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 01:08:05 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50AA042AF6
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 22:08:04 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax+eCtGeJiWTo+AA--.40779S2;
        Thu, 28 Jul 2022 13:07:57 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH v2 7/8] Docs/zh_CN: Update the translation of pci to 5.19-rc8
Date:   Thu, 28 Jul 2022 13:08:26 +0800
Message-Id: <bccb98a1c6706ecfd4aaba8c27f1c64024e1c139.1658983157.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658983157.git.siyanteng@loongson.cn>
References: <cover.1658983157.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax+eCtGeJiWTo+AA--.40779S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4fZF4ruF4rAw45Xr4ruFg_yoW8tw45pr
        Z7G34xGa17ZF1Iqr1F9rWxZ3W8Wa9a9F17Cr4UK3W3Ar1vq3ykAw1YyF12gF1xXryIvFWv
        qFs2krWYvry7Zr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
        xVA2Y2ka0xkIwI1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
        AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
        17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMI
        IF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3
        JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
        sGvfC2KfnxnUUI43ZEXa7VUbBOJ5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit f21949c14968 ("PCI/doc:Update
obsolete pci_set_dma_mask() references")

05b0ebd06ae6 ("PCI/doc: cleanup references to
the legacy PCI DMA API")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/PCI/pci.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
index 520707787256..83c2a41d38d3 100644
--- a/Documentation/translations/zh_CN/PCI/pci.rst
+++ b/Documentation/translations/zh_CN/PCI/pci.rst
@@ -255,13 +255,13 @@ pci_set_master()将通过设置PCI_COMMAND寄存器中的总线主控位来启
 
 虽然所有的驱动程序都应该明确指出PCI总线主控的DMA功能（如32位或64位），但对于流式
 数据来说，具有超过32位总线主站功能的设备需要驱动程序通过调用带有适当参数的
-``pci_set_dma_mask()`` 来“注册”这种功能。一般来说，在系统RAM高于4G物理地址的情
+``dma_set_mask()`` 来“注册”这种功能。一般来说，在系统RAM高于4G物理地址的情
 况下，这允许更有效的DMA。
 
-所有PCI-X和PCIe兼容设备的驱动程序必须调用 ``pci_set_dma_mask()`` ，因为它们
+所有PCI-X和PCIe兼容设备的驱动程序必须调用 ``dma_set_mask()`` ，因为它们
 是64位DMA设备。
 
-同样，如果设备可以通过调用 ``pci_set_consistent_dma_mask()`` 直接寻址到
+同样，如果设备可以通过调用 ``dma_set_coherent_mask()`` 直接寻址到
 4G物理地址以上的系统RAM中的“一致性内存”，那么驱动程序也必须“注册”这种功能。同
 样，这包括所有PCI-X和PCIe兼容设备的驱动程序。许多64位“PCI”设备（在PCI-X之前）
 和一些PCI-X设备对有效载荷（“流式”）数据具有64位DMA功能，但对控制（“一致性”）数
-- 
2.31.1

