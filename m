Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E21DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbiGYJXy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbiGYJXx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:23:53 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00F3014092
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:23:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxQ9AgYd5iO102AA--.13164S2;
        Mon, 25 Jul 2022 17:23:45 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 6/8] Docs/zh_CN: Update the translation of pci-iov-howto to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:24:23 +0800
Message-Id: <e235ea1d60809647971b5d3e89aa44e30d212336.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658740151.git.siyanteng@loongson.cn>
References: <cover.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxQ9AgYd5iO102AA--.13164S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKrW5CF18WFW8ZFW3tF43Wrg_yoW8Jr1fpa
        sFkFn2k3WfJa13Ja1UtrWDGFy7Ga92g39rJFZxKwnYqanFy34ktF1UtFyUKw4fJr93XFWY
        qF4Fvry8C3WjkrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK
        8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjaLvtUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 4f23bd5d09af ("PCI/doc: Convert
examples to generic power management")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/PCI/pci-iov-howto.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
index fbc83dfdcead..fb023ea1374d 100644
--- a/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
+++ b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
@@ -123,14 +123,14 @@ nr_virtfn'是要启用的VF的编号。
 		...
 	}
 
-	static int dev_suspend(struct pci_dev *dev, pm_message_t state)
+	static int dev_suspend(struct device *dev)
 	{
 		...
 
 		return 0;
 	}
 
-	static int dev_resume(struct pci_dev *dev)
+	static int dev_resume(struct device *dev)
 	{
 		...
 
@@ -163,8 +163,7 @@ nr_virtfn'是要启用的VF的编号。
 		.id_table =	dev_id_table,
 		.probe =	dev_probe,
 		.remove =	dev_remove,
-		.suspend =	dev_suspend,
-		.resume =	dev_resume,
+		.driver.pm =    &dev_pm_ops
 		.shutdown =	dev_shutdown,
 		.sriov_configure = dev_sriov_configure,
 	};
-- 
2.31.1

