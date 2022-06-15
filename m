Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85DACCA47B
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 09:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241545AbiFOJYp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 05:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242217AbiFOJYn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 05:24:43 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9519415FC4
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 02:24:42 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT95RpalikHZDAA--.6185S8;
        Wed, 15 Jun 2022 17:24:40 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 6/9] docs/zh_CN: core-api: Update the translation of printk-basics.rst to 5.19-rc2
Date:   Wed, 15 Jun 2022 17:24:29 +0800
Message-Id: <0f9f287b1d7d6ac49e67e763e349f9cb2057eff6.1655258291.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655258291.git.zhoubinbin@loongson.cn>
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT95RpalikHZDAA--.6185S8
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw47CrW5tr13uw1UAr4DCFg_yoWDZrXEgF
        s7JF4vkay7Jr1xGw4rXr1rAF1I9FWSkF1093Zxt3srA3s8KwsrKF1qvr97WFW7XFs09F98
        Ca9rX34Skry3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbyxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
        1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUeo7KDUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from upstream commit 7d9e2661f268
("printk: Move the printk() kerneldoc comment to its new home")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/translations/zh_CN/core-api/printk-basics.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
index d574de3167c8..59c6efb3fc41 100644
--- a/Documentation/translations/zh_CN/core-api/printk-basics.rst
+++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst
@@ -6,6 +6,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
 
 .. _cn_printk-basics.rst:
 
@@ -107,6 +108,4 @@ pr_debug()和pr_devel()，除非定义了 ``DEBUG`` (或者在pr_debug()的情
 
 该API在以下内核代码中:
 
-kernel/printk/printk.c
-
 include/linux/printk.h
-- 
2.20.1

