Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BD9C4320A
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B4FE610CC
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhHAMZh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 08:25:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53414 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231546AbhHAMZg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 08:25:36 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+OrkgZhQeonAA--.4804S7;
        Sun, 01 Aug 2021 20:25:22 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenweiguang82@126.com,
        siyanteng01@gmail.com
Subject: [PATCH v2 5/8] docs/zh_CN: add infiniband sysfs translation
Date:   Sun,  1 Aug 2021 20:25:35 +0800
Message-Id: <e00e8cb6affb5c281b8f8810ccd05aca81653c60.1627820210.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627820210.git.siyanteng@loongson.cn>
References: <cover.1627820210.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL+OrkgZhQeonAA--.4804S7
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1kJFW3ZryfAFWfCr48Zwb_yoW8Wr4UpF
        1DK34fK3ZrX3Wakw4fCFW7GF47J3Z7Cw4DJa92qwnYqFn8JwsY9rn8t34jkFyxtrW8uayr
        Xr4F9r90grW0kw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
        6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
        C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
        6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
        8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
        F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
        ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
        xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
        WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
        OBTYUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/infiniband/sysfs.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/infiniband/index.rst   |  2 +-
 .../translations/zh_CN/infiniband/sysfs.rst   | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/sysfs.rst

diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index a933e3c6981d..1d208d50b0c2 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -25,10 +25,10 @@ infiniband
    core_locking
    ipoib
    opa_vnic
+   sysfs
 
 TODOLIST:
 
-   sysfs
    tag_matching
    user_mad
    user_verbs
diff --git a/Documentation/translations/zh_CN/infiniband/sysfs.rst b/Documentation/translations/zh_CN/infiniband/sysfs.rst
new file mode 100644
index 000000000000..e9a48b0b2ba6
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/sysfs.rst
@@ -0,0 +1,21 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/infiniband/sysfs.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 王普宇 Puyu Wang <realpuyuwang@gmail.com>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_infiniband_sysfs:
+
+=========
+Sysfs文件
+=========
+
+sysfs接口已移至
+Documentation/ABI/stable/sysfs-class-infiniband.
-- 
2.27.0

