Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31900C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 05:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiG1FHu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 01:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiG1FHt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 01:07:49 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 23C5A42AF6
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 22:07:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9KdGeJiJjo+AA--.42561S2;
        Thu, 28 Jul 2022 13:07:42 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH v2 6/8] Docs/zh_CN: Update the translation of pci-iov-howto to 5.19-rc8
Date:   Thu, 28 Jul 2022 13:08:10 +0800
Message-Id: <24c53aabc9d942f6fe38b8d3a843329edca3d18c.1658983157.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658983157.git.siyanteng@loongson.cn>
References: <cover.1658983157.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn9KdGeJiJjo+AA--.42561S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKrW5CF18WF17JF4kGF13XFb_yoW8JF17pa
        sFkFn2kF1fJ3W3Ja1UtFWDCFy7Ga92g3y7JFZxKwnYqw4qy3yktF1UtFyUKw4ftrykWFWY
        qF4F9ry0k3WUCrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
        xVA2Y2ka0xkIwI1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
        AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
        17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMI
        IF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r4j6FyU
        MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
        nIWIevJa73UjIFyTuYvjfUOpnQUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 4f23bd5d09af ("PCI/doc: Convert
examples to generic power management")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
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

