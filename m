Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED24ACCA47A
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 07:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiFPHnr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 03:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359634AbiFPHno (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 03:43:44 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86F225C87F
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 00:43:42 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr08o36pipIVFAA--.8884S3;
        Thu, 16 Jun 2022 15:43:38 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: [PATCH v3 1/3] docs/zh_CN: Update the translation of highmem to 5.19-rc1
Date:   Thu, 16 Jun 2022 15:44:56 +0800
Message-Id: <76c418554d9b8d395f7e8331e8e3b89d1b7beff0.1655362610.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655362610.git.siyanteng@loongson.cn>
References: <cover.1655362610.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr08o36pipIVFAA--.8884S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XFW7XrWUGrW8tr48Kr13CFg_yoWxKrWDpF
        97uF93Kw4Y934jv3yDKr12kryrJ3yUGay5KayUJa4xurn5tF9xt3WjqFWUW3W3X3s7ArW3
        JrWUW395Ar1YvwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUjWv35UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit 110bf7a52307 ("Documentation/vm: rework
"Temporary Virtual Mappings" section")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/vm/highmem.rst         | 77 +++++++++++--------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/Documentation/translations/zh_CN/vm/highmem.rst b/Documentation/translations/zh_CN/vm/highmem.rst
index 018838e58c3e..200321774646 100644
--- a/Documentation/translations/zh_CN/vm/highmem.rst
+++ b/Documentation/translations/zh_CN/vm/highmem.rst
@@ -50,55 +50,55 @@
 临时虚拟映射
 ============
 
-内核包含几种创建临时映射的方法。:
+内核包含几种创建临时映射的方法。下面的列表按照使用的优先顺序显示了它们。
 
-* vmap().  这可以用来将多个物理页长期映射到一个连续的虚拟空间。它需要synchronization
-  来解除映射。
+* kmap_local_page()。这个函数是用来要求短期映射的。它可以从任何上下文（包括中断）中调用，
+  但是映射只能在获取它们的上下文中使用。
 
-* kmap().  这允许对单个页面进行短期映射。它需要synchronization，但在一定程度上被摊销。
-  当以嵌套方式使用时，它也很容易出现死锁，因此不建议在新代码中使用它。
+  在可行的情况下，这个函数应该比其他所有的函数优先使用。
 
-* kmap_atomic().  这允许对单个页面进行非常短的时间映射。由于映射被限制在发布它的CPU上，
-  它表现得很好，但发布任务因此被要求留在该CPU上直到它完成，以免其他任务取代它的映射。
-
-  kmap_atomic() 也可以由中断上下文使用，因为它不睡眠，而且调用者可能在调用kunmap_atomic()
-  之后才睡眠。
-
-  可以假设k[un]map_atomic()不会失败。
+  这些映射是线程本地和CPU本地的，这意味着映射只能从这个线程中访问，并且当映射处于活动状
+  态时，该线程与CPU绑定。即使线程被抢占了（因为抢占永远不会被函数禁用），CPU也不能通过
+  CPU-hotplug从系统中拔出，直到映射被处理掉。
 
+  在本地的kmap区域中采取pagefaults是有效的，除非获取本地映射的上下文由于其他原因不允许
+  这样做。
 
-使用kmap_atomic
-===============
+  kmap_local_page()总是返回一个有效的虚拟地址，并且假定kunmap_local()不会失败。
 
-何时何地使用 kmap_atomic() 是很直接的。当代码想要访问一个可能从高内存（见__GFP_HIGHMEM）
-分配的页面的内容时，例如在页缓存中的页面，就会使用它。该API有两个函数，它们的使用方式与
-下面类似::
+  嵌套kmap_local_page()和kmap_atomic()映射在一定程度上是允许的（最多到KMAP_TYPE_NR），
+  但是它们的调用必须严格排序，因为映射的实现是基于堆栈的。关于如何管理嵌套映射的细节，
+  请参见kmap_local_page() kdocs（包含在 "函数 "部分）。
 
-	/* 找到感兴趣的页面。 */
-	struct page *page = find_get_page(mapping, offset);
-
-	/* 获得对该页内容的访问权。 */
-	void *vaddr = kmap_atomic(page);
+* kmap_atomic().  这允许对单个页面进行非常短的时间映射。由于映射被限制在发布它的CPU上，
+  它表现得很好，但发布的任务因此被要求留在该CPU上直到它完成，以免其他任务取代它的映射。
 
-	/* 对该页的内容做一些处理。 */
-	memset(vaddr, 0, PAGE_SIZE);
+  kmap_atomic()也可以被中断上下文使用，因为它不睡眠，调用者也可能在调用kunmap_atomic()
+  后才睡眠。
 
-	/* 解除该页面的映射。 */
-	kunmap_atomic(vaddr);
+  内核中对kmap_atomic()的每次调用都会创建一个不可抢占的段，并禁用缺页异常。这可能是
+  未预期延迟的来源之一。因此用户应该选择kmap_local_page()而不是kmap_atomic()。
 
-注意，kunmap_atomic()调用的是kmap_atomic()调用的结果而不是参数。
+  假设k[un]map_atomic()不会失败。
 
-如果你需要映射两个页面，因为你想从一个页面复制到另一个页面，你需要保持kmap_atomic调用严
-格嵌套，如::
+* kmap()。这应该被用来对单个页面进行短时间的映射，对抢占或迁移没有限制。它会带来开销，
+  因为映射空间是受限制的，并且受到全局锁的保护，以实现同步。当不再需要映射时，必须用
+  kunmap()释放该页被映射的地址。
 
-	vaddr1 = kmap_atomic(page1);
-	vaddr2 = kmap_atomic(page2);
+  映射变化必须广播到所有CPU（核）上，kmap()还需要在kmap的池被回绕（TLB项用光了，需要从第
+   一项复用）时进行全局TLB无效化，当映射空间被完全利用时，它可能会阻塞，直到有一个可用的
+   槽出现。因此，kmap()只能从可抢占的上下文中调用。
 
-	memcpy(vaddr1, vaddr2, PAGE_SIZE);
+  如果一个映射必须持续相对较长的时间，上述所有的工作都是必要的，但是内核中大部分的
+  高内存映射都是短暂的，而且只在一个地方使用。这意味着在这种情况下，kmap()的成本大
+  多被浪费了。kmap()并不是为长期映射而设计的，但是它已经朝着这个方向发展了，在较新
+  的代码中强烈不鼓励使用它，前面的函数集应该是首选。
 
-	kunmap_atomic(vaddr2);
-	kunmap_atomic(vaddr1);
+  在64位系统中，调用kmap_local_page()、kmap_atomic()和kmap()没有实际作用，因为64位
+  地址空间足以永久映射所有物理内存页面。
 
+* vmap()。这可以用来将多个物理页长期映射到一个连续的虚拟空间。它需要全局同步来解除
+  映射。
 
 临时映射的成本
 ==============
@@ -126,3 +126,12 @@ i386 PAE
 
 一般的建议是，你不要在32位机器上使用超过8GiB的空间--尽管更多的空间可能对你和你的工作
 量有用，但你几乎是靠你自己--不要指望内核开发者真的会很关心事情的进展情况。
+
+函数
+====
+
+该API在以下内核代码中:
+
+include/linux/highmem.h
+
+include/linux/highmem-internal.h
-- 
2.27.0

