Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE9EC25B04
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiLJDYh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:24:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiLJDYf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:24:35 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB23C26127
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:24:34 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8AxhfDx+5NjG5gEAA--.10658S3;
        Sat, 10 Dec 2022 11:24:33 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+Lt+5NjY_IpAA--.37197S7;
        Sat, 10 Dec 2022 11:24:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 05/13] docs/zh_CN: Update the translation of page_owner to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:24:50 +0800
Message-Id: <f7a7b03a09a184c080f804d9bb89d0cc55750900.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+Lt+5NjY_IpAA--.37197S7
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF1fWr4UZFW7ZFykWryfWFg_yoW8uw1xpF
        ZI934xWF1fAF13u3y8C39Fyr18CF4fJa18KF4Ut3s7uw1vy395ArZrKa4vgay7XrWkXFZr
        Ar4SyFyvywn2v37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        baxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E
        87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I
        3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
        WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8I
        cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
        AFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
        pf9x07jxSdgUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 0719fdba5483 ("Documentation/mm/page_owner.rst:
delete frequently changing experimental data").

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/mm/page_owner.rst        | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/Documentation/translations/zh_CN/mm/page_owner.rst b/Documentation/translations/zh_CN/mm/page_owner.rst
index 21a6a0837d42..dba511fafef2 100644
--- a/Documentation/translations/zh_CN/mm/page_owner.rst
+++ b/Documentation/translations/zh_CN/mm/page_owner.rst
@@ -34,20 +34,9 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
 一样进行。这两个不可能的分支应该不会影响到分配的性能，特别是在静态键跳转标签修补
 功能可用的情况下。以下是由于这个功能而导致的内核代码大小的变化。
 
-- 没有page owner::
-
-   text    data     bss     dec     hex filename
-   48392   2333     644   51369    c8a9 mm/page_alloc.o
-
-- 有page owner::
-
-   text    data     bss     dec     hex filename
-   48800   2445     644   51889    cab1 mm/page_alloc.o
-   6662     108      29    6799    1a8f mm/page_owner.o
-   1025       8       8    1041     411 mm/page_ext.o
-
-虽然总共增加了8KB的代码，但page_alloc.o增加了520字节，其中不到一半是在hotpath
-中。构建带有page owner的内核，并在需要时打开它，将是调试内核内存问题的最佳选择。
+尽管启用page owner会使内核的大小增加几千字节，但这些代码大部分都在页面分配器和
+热路径之外。构建带有page owner的内核，并在需要时打开它，将是调试内核内存问题的
+最佳选择。
 
 有一个问题是由实现细节引起的。页所有者将信息存储到struct page扩展的内存中。这
 个内存的初始化时间比稀疏内存系统中的页面分配器启动的时间要晚一些，所以，在初始化
-- 
2.31.1

