Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC402C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 10:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbiFVKTb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348453AbiFVKTO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 06:19:14 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7DC6C3B57D
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 03:19:05 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+aQ7LJiWBFUAA--.27260S6;
        Wed, 22 Jun 2022 18:19:03 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 4/9] docs/zh_CN: core-api: Update the translation of kernel-api.rst to 5.19-rc3
Date:   Wed, 22 Jun 2022 18:18:50 +0800
Message-Id: <9173878562404f4518fecc7c55032fe815f87fd9.1655863769.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655863769.git.zhoubinbin@loongson.cn>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+aQ7LJiWBFUAA--.27260S6
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw47XF43JF43Xw1xWFWDCFg_yoWfCwc_XF
        s7XF4FkF48Ar1ftr18Ja18Jr1Y9F4Skr109wnFyayDC34qgw4DG3s8ZasY9FZ8XF4Duws8
        Ga9rur9a9rnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUby8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
        1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
        pf9x0JUWMKtUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from upstream commit 640d1930bef4
("block: Add bio_for_each_folio_all()")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/translations/zh_CN/core-api/kernel-api.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
index e45fe80d1cd8..120c051f6fcb 100644
--- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -5,6 +5,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
 
 .. _cn_kernel-api.rst:
 
@@ -282,6 +283,8 @@ kernel/acct.c
 
 该API在以下内核代码中:
 
+include/linux/bio.h
+
 block/blk-core.c
 
 block/blk-core.c
-- 
2.20.1

