Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59005C636C9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F90061166
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235748AbhGSJCQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:02:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39564 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234913AbhGSJCP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Jul 2021 05:02:15 -0400
Received: from localhost.localdomain (unknown [112.20.113.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0LvSPVghpEhAA--.19840S10;
        Mon, 19 Jul 2021 17:42:50 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 8/8] docs/zh_CN: add virt acrn cpuid translation
Date:   Mon, 19 Jul 2021 17:42:55 +0800
Message-Id: <be2c50c88941c3cbbc1ec7bee2b30d6c5eedcac4.1626687013.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1626687013.git.siyanteng@loongson.cn>
References: <cover.1626687013.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0LvSPVghpEhAA--.19840S10
X-Coremail-Antispam: 1UD129KBjvJXoWxXw18Ar18Wry7Cr1rZw1UJrb_yoW5Jw4Dpr
        1DKryfG3W7A34UC34xGr1UWF15AF1xGF1UJr1xXw1rJF1DJr15tr4UtFy7KF97GFyxAFy8
        XF48JF4UKr1j9w7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIev
        Ja73UjIFyTuYvjfUeo7KDUUUU
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
index 000000000000..88a214cd5954
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
+
+
+.. _cn_virt_acrn_cpuid:
+
+==============
+ACRN CPUID位域
+==============
+
+在ACRN管理平台上运行的客户虚拟机可以使用CPUID检查其一些功能。
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
index 9c8bf5a9417c..45292a2aa7e4 100644
--- a/Documentation/translations/zh_CN/virt/acrn/index.rst
+++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
@@ -22,9 +22,4 @@ ACRN管理平台
 
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

