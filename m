Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CFCC63703
	for <linux-doc@archiver.kernel.org>; Thu,  8 Dec 2022 12:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiLHM4x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiLHM4s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 07:56:48 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADF248C44A
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 04:56:47 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Cx6+oO35FjrhwEAA--.9588S3;
        Thu, 08 Dec 2022 20:56:46 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+AJ35Fj+BQoAA--.32260S7;
        Thu, 08 Dec 2022 20:56:46 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 05/13] docs/zh_CN: Update the translation of page_owner to 6.1-rc8
Date:   Thu,  8 Dec 2022 20:57:10 +0800
Message-Id: <759fdc58506ba182fc4e315717fa129541445327.1670502763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670502763.git.siyanteng@loongson.cn>
References: <cover.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+AJ35Fj+BQoAA--.32260S7
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF1fWr13Ww1DZryrtr4DXFb_yoW8uF17pF
        ZI934xWF1fA3W3u3y8C39Fyr18CF1fJa18KF4Ut3s7uw1vy395JrZrKa4v9ay7XrW8XFZr
        Ar4SyFyvywn2v37anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5
        JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07joT5LUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 0719fdba5483 ("Documentation/mm/page_owner.rst:
delete frequently changing experimental data").

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

