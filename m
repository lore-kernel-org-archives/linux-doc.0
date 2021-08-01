Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82FCC432BE
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 13:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B035B60F55
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 13:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhHANcg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 09:32:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:32886 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232003AbhHANcf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 09:32:35 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX0NYogZhYe8nAA--.27721S10;
        Sun, 01 Aug 2021 21:32:22 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 8/8] docs/zh_CN: add virt acrn cpuid translation
Date:   Sun,  1 Aug 2021 21:32:32 +0800
Message-Id: <90643c240d63b4eedc498a1f5cfb6dd846912b64.1627823347.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627823347.git.siyanteng@loongson.cn>
References: <cover.1627823347.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX0NYogZhYe8nAA--.27721S10
X-Coremail-Antispam: 1UD129KBjvJXoWxXw18Ar18Wry7Cr1rZw1UJrb_yoW5GrWDpr
        1qkryfG3W7A34UC34xGr15WF15AF1xGF1UJr1xXwn5XF1DJF1Yyr4UtF9rKF97GFyxAFy8
        XF4xJFWUKr1jvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
        JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
        0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
        JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
        A2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
        x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
        43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
        7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
        v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
        vjfUOBTYUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/virt/acrn/cpuid.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/virt/acrn/cpuid.rst    | 56 +++++++++++++++++++
 .../translations/zh_CN/virt/acrn/index.rst    |  5 --
 2 files changed, 56 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/cpuid.rst

diff --git a/Documentation/translations/zh_CN/virt/acrn/cpuid.rst b/Documentation/translations/zh_CN/virt/acrn/cpuid.rst
new file mode 100644
index 000000000000..252aa10ad52e
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/acrn/cpuid.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/acrn/cpuid.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_virt_acrn_cpuid:
+
+==============
+ACRN CPUID位域
+==============
+
+在ACRN超级管理器上运行的客户虚拟机可以使用CPUID检查其一些功能。
+
+ACRN的cpuid函数是:
+
+函数: 0x40000000
+
+返回::
+
+   eax = 0x40000010
+   ebx = 0x4e524341
+   ecx = 0x4e524341
+   edx = 0x4e524341
+
+注意，ebx，ecx和edx中的这个值对应于字符串“ACRNACRNACRN”。eax中的值对应于这个叶子
+中存在的最大cpuid函数，如果将来有更多的函数加入，将被更新。
+
+函数: define ACRN_CPUID_FEATURES (0x40000001)
+
+返回::
+
+          ebx, ecx, edx
+          eax = an OR'ed group of (1 << flag)
+
+其中 ``flag`` 的定义如下:
+
+================================= =========== ================================
+标志                              值          描述
+================================= =========== ================================
+ACRN_FEATURE_PRIVILEGED_VM        0           客户虚拟机是一个有特权的虚拟机
+================================= =========== ================================
+
+函数: 0x40000010
+
+返回::
+
+          ebx, ecx, edx
+          eax = (Virtual) TSC frequency in kHz.
diff --git a/Documentation/translations/zh_CN/virt/acrn/index.rst b/Documentation/translations/zh_CN/virt/acrn/index.rst
index b53976e20a34..34605d87f103 100644
--- a/Documentation/translations/zh_CN/virt/acrn/index.rst
+++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
@@ -22,9 +22,4 @@ ACRN超级管理器
 
    introduction
    io-request
-
-TODOLIST:
-
-
-
    cpuid
-- 
2.27.0

