Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2945C6370A
	for <linux-doc@archiver.kernel.org>; Thu,  8 Dec 2022 12:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiLHM4y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiLHM4s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 07:56:48 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D00108C452
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 04:56:46 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8CxZPAN35FjqRwEAA--.9412S3;
        Thu, 08 Dec 2022 20:56:45 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+AJ35Fj+BQoAA--.32260S6;
        Thu, 08 Dec 2022 20:56:45 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 04/13] docs/zh_CN: Update the translation of highmem to 6.1-rc8
Date:   Thu,  8 Dec 2022 20:57:09 +0800
Message-Id: <8b7800e1a20393dc52ad35766f1d81cb0bba8123.1670502763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670502763.git.siyanteng@loongson.cn>
References: <cover.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+AJ35Fj+BQoAA--.32260S6
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAF45AF4DAw1DAFW5ArWxXrb_yoWrJry8pF
        929rySga13A34Yvr4Y9ryxKa45Ja17GFW2yFWUK3W7Awn5Ar9Iyw4DKF4DX3WfX34xAFW7
        ArWUuFs5JrnIk3JanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
        5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
        W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY
        1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
        0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
        U8EeHDUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit a9e9c93966af ("Documentation/mm: add
details about kmap_local_page() and preemption").

Commit 84b86f6054c4 ("Documentation/mm: rrefer
kmap_local_page() and avoid kmap()").
Commit 6b3afe2eeec2 ("Documentation/mm: avoid
invalid use of addresses from kmap_local_page()").
Commit 516ea046ec55 ("Documentation/mm: don't kmap*()
pages which can't come from HIGHMEM").

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/mm/highmem.rst         | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/mm/highmem.rst b/Documentation/translations/zh_CN/mm/highmem.rst
index f74800a6d9a7..2c0ee0cbf5c4 100644
--- a/Documentation/translations/zh_CN/mm/highmem.rst
+++ b/Documentation/translations/zh_CN/mm/highmem.rst
@@ -57,15 +57,29 @@
 
   在可行的情况下，这个函数应该比其他所有的函数优先使用。
 
-  这些映射是线程本地和CPU本地的，这意味着映射只能从这个线程中访问，并且当映射处于活动状
-  态时，该线程与CPU绑定。即使线程被抢占了（因为抢占永远不会被函数禁用），CPU也不能通过
-  CPU-hotplug从系统中拔出，直到映射被处理掉。
+  这些映射是线程本地和CPU本地的，这意味着映射只能从这个线程中访问，并且当映射处于活跃状
+  态时，线程被绑定到CPU上。尽管这个函数从来没有禁用过抢占，但在映射被处理之前，CPU不能
+  通过CPU-hotplug从系统中拔出。
 
   在本地的kmap区域中采取pagefaults是有效的，除非获取本地映射的上下文由于其他原因不允许
   这样做。
 
+  如前所述，缺页异常和抢占从未被禁用。没有必要禁用抢占，因为当上下文切换到一个不同的任务
+  时，离开的任务的映射被保存，而进入的任务的映射被恢复。
+
   kmap_local_page()总是返回一个有效的虚拟地址，并且假定kunmap_local()不会失败。
 
+  在CONFIG_HIGHMEM=n的内核中，对于低内存页，它返回直接映射的虚拟地址。只有真正的高内
+  存页面才会被临时映射。因此，用户可以为那些已知不是来自ZONE_HIGHMEM的页面调用普通的
+  page_address()。然而，使用kmap_local_page() / kunmap_local()总是安全的。
+
+  虽然它比kmap()快得多，但在高内存的情况下，它对指针的有效性有限制。与kmap()映射相反，
+  本地映射只在调用者的上下文中有效，不能传递给其他上下文。这意味着用户必须绝对保证返回
+  地址的使用只限于映射它的线程。
+
+  大多数代码可以被设计成使用线程本地映射。因此，用户在设计他们的代码时，应该尽量避免使用
+  kmap()，将页面映射到将被使用的同一线程中，并优先使用kmap_local_page()。
+
   嵌套kmap_local_page()和kmap_atomic()映射在一定程度上是允许的（最多到KMAP_TYPE_NR），
   但是它们的调用必须严格排序，因为映射的实现是基于堆栈的。关于如何管理嵌套映射的细节，
   请参见kmap_local_page() kdocs（包含在 "函数 "部分）。
-- 
2.31.1

