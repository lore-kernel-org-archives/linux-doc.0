Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B7AC433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25E15610D0
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhDIJLQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 05:11:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41000 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231599AbhDIJLP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 05:11:15 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxecnCGXBge84FAA--.9803S11;
        Fri, 09 Apr 2021 17:10:50 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 09/11] docs/zh_CN: add openrisc/todo.rst translation
Date:   Fri,  9 Apr 2021 17:10:11 +0800
Message-Id: <20210409091013.2493988-10-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210409091013.2493988-1-siyanteng@loongson.cn>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxecnCGXBge84FAA--.9803S11
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyfKryrCr43KF1DuF1Dtrb_yoW8XrWDpF
        Wqka4fKa17AasIyw1Sg347Xr1fCFWxWay5Ga92qwnxtF98tw15tr13G34aya4xCry0vFWU
        ZFs0kFyj9FyUC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0x
        vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIev
        Ja73UjIFyTuYvjfUY9NVDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/openrisc/todo.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/openrisc/todo.rst      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/openrisc/todo.rst

diff --git a/Documentation/translations/zh_CN/openrisc/todo.rst b/Documentation/translations/zh_CN/openrisc/todo.rst
new file mode 100644
index 000000000000..0e5d1c9122f8
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
+===========
+待办事项
+===========
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

