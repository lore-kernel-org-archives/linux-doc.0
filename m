Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACCAC43334
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 13:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242886AbiFON1u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 09:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245312AbiFON1t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 09:27:49 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 424FC1110
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 06:27:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxH+ZQ3qliIOZDAA--.6697S2;
        Wed, 15 Jun 2022 21:27:45 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 8/9] docs/zh_CN: core-api: Update the translation of workqueue.rst to 5.19-rc2
Date:   Wed, 15 Jun 2022 21:27:43 +0800
Message-Id: <b8e3d2c35a034c5a81ec30b6d3c09bf2e6caaf8c.1655258291.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655258291.git.zhoubinbin@loongson.cn>
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxH+ZQ3qliIOZDAA--.6697S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1UKFW8JrykWryftr4UCFg_yoW8try8pr
        ySkr97GF4xAryayF9agF48G343GFyxWFsFga1ftas8AF4Fv398tr45tF98Ga4fWrykZFyr
        XrZYkrWkCF4YvFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5GwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8Zw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E
        87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUbcdbUUUUUU==
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from upstream commit f9eaaa82b474
("workqueue: doc: Call out the non-reentrance conditions")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../translations/zh_CN/core-api/workqueue.rst | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/core-api/workqueue.rst b/Documentation/translations/zh_CN/core-api/workqueue.rst
index e372fa5cf101..f6567cf9d3fb 100644
--- a/Documentation/translations/zh_CN/core-api/workqueue.rst
+++ b/Documentation/translations/zh_CN/core-api/workqueue.rst
@@ -6,6 +6,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
 
 .. _cn_workqueue.rst:
 
@@ -178,10 +179,6 @@ workqueue将自动创建与属性相匹配的后备工作者池。调节并发
 
   这个标志对于未绑定的wq来说是没有意义的。
 
-请注意，标志 ``WQ_NON_REENTRANT`` 不再存在，因为现在所有的工作
-队列都是不可逆的——任何工作项都保证在任何时间内最多被整个系统的一
-个工作者执行。
-
 
 ``max_active``
 --------------
@@ -328,6 +325,22 @@ And with cmwq with ``@max_active`` >= 3, ::
 
 工作项函数在堆栈追踪中应该是微不足道的。
 
+不可重入条件
+============
+
+工作队列保证，如果在工作项排队后满足以下条件，则工作项不能重入：
+
+
+        1. 工作函数没有被改变。
+        2. 没有人将该工作项排到另一个工作队列中。
+        3. 该工作项尚未被重新启动。
+
+换言之，如果上述条件成立，则保证在任何给定时间最多由一个系统范围内的工作程序执行
+该工作项。
+
+请注意，在self函数中将工作项重新排队（到同一队列）不会破坏这些条件，因此可以安全
+地执行此操作。否则在破坏工作函数内部的条件时需要小心。
+
 
 内核内联文档参考
 ================
-- 
2.20.1

