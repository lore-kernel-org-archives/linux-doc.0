Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C58C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbiGYJYG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbiGYJYE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:24:04 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A59DA15FE5
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:24:03 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH9IsYd5iS102AA--.13367S2;
        Mon, 25 Jul 2022 17:23:58 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 7/8] Docs/zh_CN: Update the translation of pci to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:24:35 +0800
Message-Id: <d6b56714f443f13fed9ed6618fb0788fe7d3caaa.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658740151.git.siyanteng@loongson.cn>
References: <cover.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH9IsYd5iS102AA--.13367S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4fZry3Wr1xJr1kuw47CFg_yoW8tr47pr
        Z7Ga4xGa17Z3WIqr1F93yxXw1xWa9a9F1UCr4UK3ZxAr1vq3ykAw1YyF12gFyxXryIvFWv
        qan2krWYvry7ur7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAI
        w20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUI2NtUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit f21949c14968 ("PCI/doc:Update
obsolete pci_set_dma_mask() references")

05b0ebd06ae6 ("PCI/doc: cleanup references to
the legacy PCI DMA API")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

