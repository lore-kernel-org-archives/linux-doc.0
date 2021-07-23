Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39410C4320A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 02:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1912260ED3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 02:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhGWCEq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 22:04:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56730 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233231AbhGWCEo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Jul 2021 22:04:44 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_0E1Lfpg4fAiAA--.43799S3;
        Fri, 23 Jul 2021 10:45:13 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 1/8] docs/zh_CN: add virt index translation
Date:   Fri, 23 Jul 2021 10:45:37 +0800
Message-Id: <e0f2e665b5492c41dd51d1b54457c02d6c63ef94.1627007852.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627007852.git.siyanteng@loongson.cn>
References: <cover.1627007852.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_0E1Lfpg4fAiAA--.43799S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWkuw1ftr4kGF45CF1xXwb_yoW8Ar15pF
        yq9ryfK3W8Z342k3yfCF1UWF1UG3WxGa1UJa1SgwnYqF1DJ3WFvr4DtrZ0kF97GrWrAFW8
        XF4rKrWjgryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUP014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
        IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjeWlDUU
        UUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add virt to .../zh_CN/index and translate it into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/virt/index.rst         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 1f953d3439a5..f8f9fd1d5b09 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -97,6 +97,7 @@ TODOList:
    iio/index
    sound/index
    filesystems/index
+   virt/index
 
 TODOList:
 
@@ -122,7 +123,6 @@ TODOList:
 * spi/index
 * w1/index
 * watchdog/index
-* virt/index
 * input/index
 * hwmon/index
 * gpu/index
diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
new file mode 100644
index 000000000000..f5c922bbd8a8
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/index.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_virt_index:
+
+===============
+Linux虚拟化支持
+===============
+
+.. toctree::
+   :maxdepth: 2
+
+TODOLIST:
+
+   kvm/index
+   uml/user_mode_linux_howto_v2
+   paravirt_ops
+   guest-halt-polling
+   ne_overview
+   acrn/index
+
+.. only:: html and subproject
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

