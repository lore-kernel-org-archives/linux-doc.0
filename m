Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFB5C4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A179D611C3
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236981AbhHFCXg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:23:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34432 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236411AbhHFCXg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 22:23:36 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0APnQxhudkrAA--.60302S3;
        Fri, 06 Aug 2021 10:23:13 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com,
        chenweiguang82@126.com
Subject: [PATCH v3 1/8] docs/zh_CN: add infiniband index translation
Date:   Fri,  6 Aug 2021 10:23:20 +0800
Message-Id: <9ba560c4bdbb141502539fbc352e80110677ecee.1628213809.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1628213809.git.siyanteng@loongson.cn>
References: <cover.1628213809.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0APnQxhudkrAA--.60302S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy7tw4DJw1xJF4UWr18AFb_yoW8Cw1Up3
        WkKryfK3W8X3W2k3yfCF17JF1UG3WIkw4DGa9FqwnYqFs8Ja1Svrnxt34qgasrKr4rZay5
        Xa1Fgr4UKrW8C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
        IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
        1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU4T5dU
        UUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/infiniband/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Puyu Wang <realpuyuwang@gmail.com>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/infiniband/index.rst   | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index e0d51a167032..84d000245102 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -102,6 +102,7 @@ TODOList:
    iio/index
    sound/index
    filesystems/index
+   infiniband/index
 
 TODOList:
 
@@ -116,7 +117,6 @@ TODOList:
 * hid/index
 * i2c/index
 * isdn/index
-* infiniband/index
 * leds/index
 * netlabel/index
 * networking/index
diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
new file mode 100644
index 000000000000..ebb1e20b7df4
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/infiniband/index.rst
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
+.. _cn_infiniband_index:
+
+==========
+infiniband
+==========
+
+.. toctree::
+   :maxdepth: 1
+
+TODOLIST:
+
+   core_locking
+   ipoib
+   opa_vnic
+   sysfs
+   tag_matching
+   user_mad
+   user_verbs
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

