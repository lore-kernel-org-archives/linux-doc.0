Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A2EC11F6B
	for <linux-doc@archiver.kernel.org>; Wed, 30 Jun 2021 10:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F56261992
	for <linux-doc@archiver.kernel.org>; Wed, 30 Jun 2021 10:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhF3KZP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Jun 2021 06:25:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40738 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234216AbhF3KZO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Jun 2021 06:25:14 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0PoRdxgKsUaAA--.10417S8;
        Wed, 30 Jun 2021 18:22:41 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 6/6] docs/zh_CN: add core-api gfp_mask-from-fs-io translation
Date:   Wed, 30 Jun 2021 18:23:28 +0800
Message-Id: <d04f9fed15a376fb01a4bd1ba6831c4abc137dbc.1625048200.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1625048200.git.siyanteng@loongson.cn>
References: <cover.1625048200.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0PoRdxgKsUaAA--.10417S8
X-Coremail-Antispam: 1UD129KBjvJXoWxuF17tryfJr13Kr1rGryfJFb_yoWrtF13pF
        ZrKryfG3WfJa4Yy3s2g3WUXr17JFWxWa1UKw4xK3ZYvrn8A3W3KF47tFy3WF97WFyvyFW8
        tr4xKrWUCry0ywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUbPC7UUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/gfp_mask-from-fs-io.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/gfp_mask-from-fs-io.rst    | 66 +++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |  2 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst

diff --git a/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst b/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
new file mode 100644
index 000000000000..a2b81313f7a7
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
@@ -0,0 +1,66 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/gfp_mask-from-fs-io.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_core-api_gfp_mask-from-fs-io:
+
+============================
+从FS/IO上下文中使用的GFP掩码
+============================
+
+:日期: 2018年5月
+:作者: Michal Hocko <mhocko@kernel.org>
+
+简介
+====
+
+文件系统和IO栈中的代码路径在分配内存时必须小心，以防止因直接调用FS或IO路径的内
+存回收和阻塞已经持有的资源（例如锁--最常见的是用于事务上下文的锁）而造成递归死
+锁。
+
+避免这种死锁问题的传统方法是在调用分配器时，在gfp掩码中清除__GFP_FS和__GFP_IO
+（注意后者意味着也要清除第一个）。GFP_NOFS和GFP_NOIO可以作为快捷方式使用。但事
+实证明，上述方法导致了滥用，当限制性的gfp掩码被用于“万一”时，没有更深入的考虑，
+这导致了问题，因为过度使用GFP_NOFS/GFP_NOIO会导致内存过度回收或其他内存回收的问
+题。
+
+新API
+=====
+
+从4.12开始，我们为NOFS和NOIO上下文提供了一个通用的作用域API，分别是
+``memalloc_nofs_save`` , ``memalloc_nofs_restore`` 和 ``memalloc_noio_save`` ,
+``memalloc_noio_restore`` ，允许从文件系统或I/O的角度将一个作用域标记为一个
+关键部分。从该作用域的任何分配都将从给定的掩码中删除__GFP_FS和__GFP_IO，所以
+没有内存分配可以追溯到FS/IO中。
+
+
+该API在以下内核代码中:
+
+include/linux/sched/mm.h
+
+然后，FS/IO代码在任何与回收有关的关键部分开始之前简单地调用适当的保存函数
+——例如，与回收上下文共享的锁或当事务上下文嵌套可能通过回收进行时。恢复函数
+应该在关键部分结束时被调用。所有这一切最好都伴随着解释什么是回收上下文，以
+方便维护。
+
+请注意，保存/恢复函数的正确配对允许嵌套，所以从现有的NOIO或NOFS范围分别调
+用 ``memalloc_noio_save`` 或 ``memalloc_noio_restore`` 是安全的。
+
+那么__vmalloc(GFP_NOFS)呢？
+===========================
+
+vmalloc不支持GFP_NOFS语义，因为在分配器的深处有硬编码的GFP_KERNEL分配，要修
+复这些分配是相当不容易的。这意味着用GFP_NOFS/GFP_NOIO调用 ``vmalloc`` 几乎
+总是一个错误。好消息是，NOFS/NOIO语义可以通过范围API实现。
+
+在理想的世界中，上层应该已经标记了危险的上下文，因此不需要特别的照顾， ``vmalloc``
+的调用应该没有任何问题。有时，如果上下文不是很清楚，或者有叠加的违规行为，那么
+推荐的方法是用范围API包装vmalloc，并加上注释来解释问题。
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 1d6fecd69c3b..2231fd315e3c 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -104,6 +104,7 @@ Todolist:
    mm-api
    genalloc
    boot-time-mm
+   gfp_mask-from-fs-io
 
 Todolist:
 
@@ -112,7 +113,6 @@ Todolist:
    dma-attributes
    dma-isa-lpc
    pin_user_pages
-   gfp_mask-from-fs-io
 
 内核调试的接口
 ==============
-- 
2.27.0

