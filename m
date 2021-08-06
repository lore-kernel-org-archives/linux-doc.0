Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E2C4320A
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D36D611C5
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238848AbhHFB0y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:26:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46966 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238790AbhHFB0x (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 21:26:53 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx30PFjwxhvs8rAA--.54926S3;
        Fri, 06 Aug 2021 09:26:32 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 1/8] docs/zh_CN: add virt index translation
Date:   Fri,  6 Aug 2021 09:26:39 +0800
Message-Id: <b28d3a530fe0c3635e7be2462fd14a4ae18f0220.1628212777.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1628212777.git.siyanteng@loongson.cn>
References: <cover.1628212777.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx30PFjwxhvs8rAA--.54926S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWkuw1ftr4kGF45CF1xXwb_yoW8AFWxpF
        yvkryfK3W8Z347C3yfCF1UWFy8G3Z7Ga15Ga13WwnYqF1DJ3WFvr4DtrZ0kF9rKrWrAFyr
        XF4rKr4jgryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
        Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
        W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU86wZ
        UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add virt to .../zh_CN/index and translate it into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/virt/index.rst         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index e0d51a167032..c311c8741e6f 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -102,6 +102,7 @@ TODOList:
    iio/index
    sound/index
    filesystems/index
+   virt/index
 
 TODOList:
 
@@ -127,7 +128,6 @@ TODOList:
 * spi/index
 * w1/index
 * watchdog/index
-* virt/index
 * input/index
 * hwmon/index
 * gpu/index
diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
new file mode 100644
index 000000000000..9e5df5b5de15
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
+ 时奎亮 Alex Shi <alexs@kernel.org>
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

