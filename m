Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90287C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CC836113D
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhDOGi2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 02:38:28 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58486 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230153AbhDOGi1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 02:38:27 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxCco+33dgfjIIAA--.15262S4;
        Thu, 15 Apr 2021 14:37:59 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v5 2/4] docs/zh_CN: add openrisc todo.rst translation
Date:   Thu, 15 Apr 2021 14:38:36 +0800
Message-Id: <20210415063838.2341827-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210415063838.2341827-1-siyanteng@loongson.cn>
References: <20210415063838.2341827-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxCco+33dgfjIIAA--.15262S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1fJF4fAF13Zry8uFW5trb_yoW8XFWrpF
        Wq93WfKa17JasIyw1Sg347Xr1fCFWxWay3Ga92qwnxKF98twn5tr13J34aqa4xAry0vFWU
        ZFs0kFyj9ryUC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUboa0PUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/openrisc/todo.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/openrisc/todo.rst      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/openrisc/todo.rst

diff --git a/Documentation/translations/zh_CN/openrisc/todo.rst b/Documentation/translations/zh_CN/openrisc/todo.rst
new file mode 100644
index 000000000000..9944ad05473b
--- /dev/null
+++ b/Documentation/translations/zh_CN/openrisc/todo.rst
@@ -0,0 +1,20 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../openrisc/todo`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_openrisc_todo.rst:
+
+========
+待办事项
+========
+
+OpenRISC Linux的移植已经完全投入使用，并且从 2.6.35 开始就一直在上游同步。
+然而，还有一些剩余的项目需要在未来几个月内完成。 下面是一个即将进行调查的已知
+不尽完美的项目列表，即我们的待办事项列表。
+
+-   实现其余的DMA API……dma_map_sg等。
+
+-   完成重命名清理工作……代码中提到了or32，这是架构的一个老名字。 我们
+    已经确定的名字是or1k，这个改变正在以缓慢积累的方式进行。 目前，or32相当
+    于or1k。
-- 
2.27.0

