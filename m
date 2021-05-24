Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19EFC47080
	for <linux-doc@archiver.kernel.org>; Mon, 24 May 2021 02:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD62A61132
	for <linux-doc@archiver.kernel.org>; Mon, 24 May 2021 02:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhEXCYG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 23 May 2021 22:24:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60320 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231782AbhEXCYF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 23 May 2021 22:24:05 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0PlDatgwDIDAA--.1294S2;
        Mon, 24 May 2021 10:22:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] docs: zh_CN: update Chinese translations
Date:   Mon, 24 May 2021 10:23:08 +0800
Message-Id: <20210524022308.1216098-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0PlDatgwDIDAA--.1294S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw48CFy8KFWrAFyxuF4Durg_yoW5GF1DpF
        4akrnxKanrZrnrZFn7Kryjqry5CFZ5Wa4UG3srXrn5ZF1kZr9YyF4xKr95Wr92gFyUXa4f
        tFs7tryDX3yjyrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
        McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
        v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAF
        wVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
        v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
        c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUO_MaUU
        UUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Two new commits were added to the original document:

commit ddba35031db2ea89facc91c745e5ad55ba2e0e7f
commit 20bc8c1e972f29afcac85e524e430c11a6df5f58

translate them into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---

v2: pick Xiangcheng Wu's review-by tag.

 .../zh_CN/core-api/printk-formats.rst           | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
index 624a090e6ee5..a680c8f164c3 100644
--- a/Documentation/translations/zh_CN/core-api/printk-formats.rst
+++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
@@ -122,6 +122,17 @@ seq_printf()，而不是printk()）由用户空间进程读取，使用下面描
 ``B`` 占位符的结果是带有偏移量的符号名，在打印堆栈回溯时应该使用。占位符将考虑编译器优化
 的影响，当使用尾部调用并使用noreturn GCC属性标记时，可能会发生这种优化。
 
+如果指针在一个模块内，模块名称和可选的构建ID将被打印在符号名称之后，并在说明符的末尾添加
+一个额外的 ``b`` 。
+
+::
+
+	%pS	versatile_init+0x0/0x110 [module_name]
+	%pSb	versatile_init+0x0/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
+	%pSRb	versatile_init+0x9/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
+		(with __builtin_extract_return_addr() translation)
+	%pBb	prev_fn_of_versatile_init+0x88/0x88 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
+
 来自BPF / tracing追踪的探查指针
 ----------------------------------
 
@@ -483,9 +494,10 @@ Fwnode handles
 ::
 
 	%pt[RT]			YYYY-mm-ddTHH:MM:SS
+	%pt[RT]s		YYYY-mm-dd HH:MM:SS
 	%pt[RT]d		YYYY-mm-dd
 	%pt[RT]t		HH:MM:SS
-	%pt[RT][dt][r]
+	%pt[RT][dt][r][s]
 
 用于打印日期和时间::
 
@@ -497,6 +509,9 @@ Fwnode handles
 默认情况下，年将以1900为单位递增，月将以1为单位递增。 使用%pt[RT]r (raw)
 来抑制这种行为。
 
+%pt[RT]s（空格）将覆盖ISO 8601的分隔符，在日期和时间之间使用''（空格）而
+不是'T'（大写T）。当日期或时间被省略时，它不会有任何影响。
+
 通过引用传递。
 
 clk结构体
-- 
2.27.0

