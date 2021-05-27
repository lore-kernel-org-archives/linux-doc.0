Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AD2C47089
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 04:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90BF4613D4
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 04:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhE0EcS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 00:32:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38624 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229579AbhE0EcR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 00:32:17 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx30FuIK9gQAcFAA--.4186S2;
        Thu, 27 May 2021 12:30:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/zh_CN: add core api cachetlb translation
Date:   Thu, 27 May 2021 12:31:18 +0800
Message-Id: <20210527043118.3835070-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx30FuIK9gQAcFAA--.4186S2
X-Coremail-Antispam: 1UD129KBjvAXoWfXry5WF4DWryDXw4Duw1ftFb_yoW8ur13Jo
        WYyws09w4kuF45Ka40ga98Ja48urs0yrnrZws3Kr1DZa4UGr1fA3WkJ3y3JFy29ry5KF4S
        y3WkJayjka1fJasxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY57AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r45
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
        WxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU9jjgUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/cachetlb.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/cachetlb.rst  | 319 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   7 +-
 2 files changed, 325 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/cachetlb.rst

diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
new file mode 100644
index 000000000000..9568c15f4139
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
@@ -0,0 +1,319 @@
+======================
+Linux下的缓存和TLB冲洗
+======================
+
+:作者: David S. Miller <davem@redhat.com>
+
+本文描述了由Linux虚拟内存子系统调用的缓存/TLB冲洗接口。它列举了每个接
+口，描述了它的预期目的，以及接口被调用后的预期副作用。
+
+下面描述的副作用是针对单处理器的实现，以及在单个处理器上发生的情况。SMP
+的情况是一个简单的扩展，你只需要扩展定义，使某个特定接口的副作用发生在
+系统的所有处理器上。不要被这句话吓到，以为SMP的缓存/tlb冲洗一定是很低
+效的，事实上，这是一个可以进行很多优化的领域。例如，如果可以证明一个用
+户地址空间从未在某个cpu上执行过（见mm_cpumask()），那么就不需要在该
+cpu上对这个地址空间进行冲洗。
+
+首先是“TLB”冲洗接口，因为它们是最简单的。在Linux下，“TLB”被抽象为cpu
+用来缓存从软件页表获得的虚拟->物理地址转换的东西。这意味着，如果软件页
+表发生变化，这个“TLB”缓存中就有可能出现过时（脏）的翻译。因此，当软件页表
+发生变化时，内核会在页表发生 *变化后* 调用以下一种冲洗方法：
+
+1) ``void flush_tlb_all(void)``
+
+	最严重的冲洗。在这个接口运行后，任何以前的页表修改都会对cpu可见。
+
+	这通常是在内核页表被改变时调用的，因为这种转换在本质上是“全局”的。
+
+2) ``void flush_tlb_mm(struct mm_struct *mm)``
+
+	这个接口从TLB中冲洗整个用户地址空间。在运行后，这个接口必须确保
+	以前对地址空间‘mm’的任何页表修改对cpu来说是可见的。也就是说，在
+	运行后，TLB中不会有‘mm’的页表项。
+
+	这个接口被用来处理整个地址空间的页表操作，比如在fork和exec过程
+	中发生的事情。
+
+3) ``void flush_tlb_range(struct vm_area_struct *vma,
+   unsigned long start, unsigned long end)``
+
+	这里我们要从TLB中冲洗一个特定范围的（用户）虚拟地址转换。在运行后，
+	这个接口必须确保以前对‘start’到‘end-1’范围内的地址空间‘vma->vm_mm’
+	的任何页表修改对cpu来说是可见的。也就是说，在运行后，TLB中不会有
+	‘mm’的页表项用于‘start’到‘end-1’范围内的虚拟地址。
+
+	“vma”是用于该区域的备份存储。主要是用于munmap()类型的操作。
+
+	提供这个接口是希望端口能够找到一个合适的有效方法来从 TLB 中删除多
+	个页面大小的转换， 而不是让内核为每个可能被修改的页表项调用
+	flush_tlb_page (见下文)。
+
+4) ``void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)``
+
+	这一次我们需要从TLB中删除PAGE_SIZE大小的转换。‘vma’是Linux用来跟
+	踪进程的mmap区域的支持结构体，地址空间可以通过vma->vm_mm获得。另
+	外，可以通过测试（vma->vm_flags & VM_EXEC）来查看这个区域是否是
+	可执行的（因此在split-tlb类型的设置中可能在“指令TLB”中）。
+
+	在运行后，这个接口必须确保之前对用户虚拟地址“addr”的地址空间
+	“vma->vm_mm”的页表修改对cpu来说是可见的。也就是说，在运行后，TLB
+	中不会有虚拟地址‘addr’的‘vma->vm_mm’的页表项。
+
+	这主要是在故障处理时使用。
+
+5) ``void update_mmu_cache(struct vm_area_struct *vma,
+   unsigned long address, pte_t *ptep)``
+
+   在每个页面故障结束时，这个例程被调用，以告诉体系结构特定的代码，在
+   软件页面表中，在地址空间“vma->vm_mm”的虚拟地址“地址”处，现在存在
+   一个翻译。
+
+   端口可以用它选择的任何方式使用这个信息。例如，它可以使用这个事件来
+   为软件管理的TLB配置预装TLB转换。目前sparc64端口就是这样做的。
+   
+接下来，我们有缓存冲洗接口。一般来说，当Linux将现有的虚拟->物理映射
+改变为新的值时，其顺序将是以下形式之一::
+
+	1) flush_cache_mm(mm);
+	   change_all_page_tables_of(mm);
+	   flush_tlb_mm(mm);
+
+	2) flush_cache_range(vma, start, end);
+	   change_range_of_page_tables(mm, start, end);
+	   flush_tlb_range(vma, start, end);
+
+	3) flush_cache_page(vma, addr, pfn);
+	   set_pte(pte_pointer, new_pte_val);
+	   flush_tlb_page(vma, addr);
+
+缓存级别的冲洗将永远是第一位的，因为这允许我们正确处理那些缓存严格的
+系统，当虚拟地址从缓存中冲洗时，需要对该虚拟地址进行虚拟->物理转换。
+HyperSparc cpu就是这样一个具有这种属性的cpu。
+
+下面的缓存冲洗例程只需要在特定的cpu需要的范围内处理缓存冲洗。大多数
+情况下，这些例程必须为cpu实现，这些cpu有虚拟索引的缓存，当虚拟->物
+理转换被改变或移除时，必须被冲洗。因此，例如，IA32处理器的物理索引
+的物理标记的缓存没有必要实现这些接口，因为这些缓存是完全同步的，并
+且不依赖于翻译信息。
+
+下面是这些例程，一个接一个罗列:
+
+1) ``void flush_cache_mm(struct mm_struct *mm)``
+
+	这个接口将整个用户地址空间从高速缓存中刷掉。也就是说，在运行后，
+	将没有与‘mm’相关的缓存行。
+
+	这个接口被用来处理整个地址空间的页表操作，比如在退出和执行过程
+	中发生的事情。
+
+2) ``void flush_cache_dup_mm(struct mm_struct *mm)``
+
+	这个接口将整个用户地址空间从高速缓存中冲洗掉。也就是说，在运行
+	后，将没有与‘mm’相关的缓存行。
+
+	这个接口被用来处理整个地址空间的页表操作，比如在fork过程中发生
+	的事情。
+
+	这个选项与flush_cache_mm分开，以允许对VIPT缓存进行一些优化。
+
+3) ``void flush_cache_range(struct vm_area_struct *vma,
+   unsigned long start, unsigned long end)``
+
+   在这里，我们要从缓存中冲洗一个特定范围的（用户）虚拟地址。运行
+   后，在“start”到“end-1”范围内的虚拟地址的“vma->vm_mm”的缓存中
+   将没有页表项。
+
+   “vma”是被用于该区域的备份存储。主要是用于munmap()类型的操作。
+   
+   提供这个接口是希望端口能够找到一个合适的有效方法来从缓存中删
+   除多个页面大小的区域， 而不是让内核为每个可能被修改的页表项调
+   用 flush_cache_page (见下文)。
+
+4) ``void flush_cache_page(struct vm_area_struct *vma, unsigned long addr, unsigned long pfn)``
+
+	这一次我们需要从缓存中删除一个PAGE_SIZE大小的区域。“vma”是
+	Linux用来跟踪进程的mmap区域的支持结构体，地址空间可以通过
+	vma->vm_mm获得。另外，我们可以通过测试（vma->vm_flags &
+	VM_EXEC）来查看这个区域是否是可执行的（因此在“Harvard”类
+	型的缓存布局中可能是在“指令缓存”中）。
+
+	“pfn”表示“addr”所对应的物理页框（通过PAGE_SHIFT左移这个
+	值来获得物理地址）。正是这个映射应该从缓存中删除。
+
+	在运行之后，对于虚拟地址‘addr’的‘vma->vm_mm’，在缓存中不会
+	有任何页表项，它被翻译成‘pfn’。
+
+	这主要是在故障处理过程中使用。
+
+5) ``void flush_cache_kmaps(void)``
+
+	只有在平台使用高内存的情况下才需要实现这个例程。它将在所有的
+	kmaps失效之前被调用。
+
+	运行后，内核虚拟地址范围PKMAP_ADDR(0)到PKMAP_ADDR(LAST_PKMAP)
+	的缓存中将没有页表项。
+
+	这个例程应该在asm/highmem.h中实现。
+
+6) ``void flush_cache_vmap(unsigned long start, unsigned long end)``
+   ``void flush_cache_vunmap(unsigned long start, unsigned long end)``
+
+   在这里，在这两个接口中，我们从缓存中冲洗一个特定范围的（内核）
+   虚拟地址。运行后，在“start”到“end-1”范围内的虚拟地址的内核地
+   址空间的缓存中不会有页表项。
+
+   这两个例程中的第一个是在vmap_range()安装了页表项之后调用的。
+   第二个是在vunmap_range()删除页表项之前调用的。
+
+还有一类cpu缓存问题，目前需要一套完全不同的接口来正确处理。最大
+的问题是处理器的数据缓存中的虚拟别名。
+
+.. 译者有话说：
+
+	这段内容有些晦涩，为了减轻中文阅读压力，特作此译注。
+
+	别名（alias）属于缓存一致性问题，当不同的虚拟地址映射相同的
+	物理地址，而这些虚拟地址的index不同，此时就发生了别名现象(多
+	个虚拟地址被称为别名)。通俗点来说就是指同一个物理地址的数据被
+	加载到不同的cacheline中就会出现别名现象。
+
+	常见的解决方法有两种：第一种是硬件维护一致性，设计特定的cpu电
+	路来解决问题（例如设计为PIPT的cache）；第二种是软件维护一致性，
+	就是下面介绍的sparc的解决方案——页面染色，涉及的技术细节太多，
+	译者不便展开，请读者自行查阅相关资料。
+
+您的端口是否容易在其D-cache中出现虚拟别名？嗯，如果您的D-cache
+是虚拟索引的，且cache大于PAGE_SIZE（页大小），并且不能防止同一
+物理地址的多个cache行同时存在，您就会遇到这个问题。
+
+如果你的D-cache有这个问题，首先正确定义asm/shmparam.h SHMLBA，
+它基本上应该是你的虚拟寻址D-cache的大小（或者如果大小是可变的，
+则是最大的可能大小）。这个设置将迫使SYSv IPC层只允许用户进程在
+这个值的倍数的地址上对共享内存进行映射。
+
+.. note::
+
+	这并不能解决共享mmaps的问题，请查看sparc64 port解决
+	这个问题的一个方法（特别是 SPARC_FLAG_MMAPSHARED）。
+
+接下来，你必须解决所有其他情况下的D-缓存别名问题。请记住这个事
+实，对于一个给定的页面映射到某个用户地址空间，总是至少有一个更
+多的映射，那就是内核在其线性映射中从PAGE_OFFSET开始。因此，一
+旦第一个用户将一个给定的物理页映射到它的地址空间，就意味着D-cache
+的别名问题有可能存在，因为内核已经将这个页映射到它的虚拟地址。
+
+  ``void copy_user_page(void *to, void *from, unsigned long addr, struct page *page)``
+  ``void clear_user_page(void *to, unsigned long addr, struct page *page)``
+
+  	这两个例程在用户匿名或COW页中存储数据。它允许一个端口有效地
+  	避免用户空间和内核之间的D-cache别名问题。
+
+  	例如，一个端口可以在复制过程中把“from”和“to”暂时映射到内核
+  	的虚拟地址上。这两个页面的虚拟地址的选择方式是，内核的加载/存
+  	储指令发生在虚拟地址上，而这些虚拟地址与用户的页面映射是相同
+  	的“颜色”。例如，Sparc64就使用这种技术。
+  
+  	“addr”参数告诉了用户最终要映射这个页面的虚拟地址，“page”参
+  	数给出了一个指向目标页结构体的指针。
+  
+  	如果D-cache别名不是问题，这两个例程可以简单地直接调用
+  	memcpy/memset而不做其他事情。
+
+  ``void flush_dcache_page(struct page *page)``
+
+  	任何时候，当内核写到一个页面缓存页，或者内核要从一个页面缓存
+	页中读出，并且这个页面的用户空间共享/可写映射可能存在时，
+	这个例程就会被调用。
+
+	.. note::
+
+			这个例程只需要为有可能被映射到用户进程的地址空间的
+			页面缓存调用。因此，例如，处理页面缓存中vfs符号链
+			接的VFS层代码根本不需要调用这个接口。
+
+	“内核写入页面缓存的页面”这句话的意思是，具体来说，内核执行存
+	储指令，在该页面的页面->虚拟映射处弄脏该页面的数据。在这里，通
+	过冲洗的手段处理D-cache的别名是很重要的，以确保这些内核存储对
+	该页的用户空间映射是可见的。
+
+	推论的情况也同样重要，如果有用户对这个文件有共享+可写的映射，
+	我们必须确保内核对这些页面的读取会看到用户所做的最新的存储。
+
+	如果D-cache别名不是一个问题，这个例程可以简单地定义为该架构上
+	的nop。
+
+	在page->flags (PG_arch_1)中有一个位是“架构私有”。内核保证，
+	对于分页缓存的页面，当这样的页面第一次进入分页缓存时，它将清除
+	这个位。
+
+	这使得这些接口可以更有效地被实现。如果目前没有用户进程映射这个
+	页面，它允许我们“推迟”（也许是无限期）实际的冲洗过程。请看
+	sparc64的flush_dcache_page和update_mmu_cache实现，以了解如
+	何做到这一点。
+
+	这个想法是，首先在flush_dcache_page()时，如果page->mapping->i_mmap
+	是一个空树，只需标记架构私有页标志位。之后，在update_mmu_cache()
+	中，会对这个标志位进行检查，如果设置了，就进行冲洗，并清除标志位。
+
+	.. important::
+
+				通常很重要的是，如果你推迟冲洗，实际的冲洗发生在同一个
+				CPU上，因为它将cpu存储到页面上，使其变脏。同样，请看
+				sparc64关于如何处理这个问题的例子。
+
+  ``void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
+  unsigned long user_vaddr, void *dst, void *src, int len)``
+  ``void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
+  unsigned long user_vaddr, void *dst, void *src, int len)``
+
+	当内核需要复制任意的数据进出任意的用户页时（比如ptrace()），它将使
+	用这两个例程。
+
+	任何必要的缓存冲洗或其他需要发生的一致性操作都应该在这里发生。如果
+	处理器的指令缓存没有对cpu存储进行窥探，那么你很可能需要为
+	copy_to_user_page()冲洗指令缓存。
+
+  ``void flush_anon_page(struct vm_area_struct *vma, struct page *page,
+  unsigned long vmaddr)``
+
+	当内核需要访问一个匿名页的内容时，它会调用这个函数（目前只有
+	get_user_pages()）。注意：flush_dcache_page()故意对匿名页不起作
+	用。默认的实现是nop（对于所有相干的架构应该保持这样）。对于不一致性
+	的架构，它应该冲洗vmaddr处的页面缓存。
+
+  ``void flush_kernel_dcache_page(struct page *page)``
+
+	当内核需要修改一个用kmap获得的用户页时，它会在所有修改完成后（但在
+	kunmapping之前）调用这个函数，以使底层页面达到最新状态。这里假定用
+	户没有不一致性的缓存副本（即原始页面是从类似get_user_pages()的机制
+	中获得的）。默认的实现是一个nop，在所有相干的架构上都应该如此。在不
+	一致性的架构上，这应该冲洗内核缓存中的页面（使用page_address(page)）。
+
+
+  ``void flush_icache_range(unsigned long start, unsigned long end)``
+
+	当内核存储到它将执行的地址中时（例如在加载模块时），这个函数被调用。
+
+	如果icache不对存储进行窥探，那么这个例程将需要对其进行冲洗。
+
+  ``void flush_icache_page(struct vm_area_struct *vma, struct page *page)``
+
+	flush_icache_page的所有功能都可以在flush_dcache_page和update_mmu_cache
+	中实现。在未来，我们希望能够完全删除这个接口。
+
+最后一类API是用于I/O到内核内特意设置的别名地址范围。这种别名是通过使用
+vmap/vmalloc API设置的。由于内核I/O是通过物理页进行的，I/O子系统假定用户
+映射和内核偏移映射是唯一的别名。这对vmap别名来说是不正确的，所以内核中任何
+试图对vmap区域进行I/O的东西都必须手动管理一致性。它必须在做I/O之前冲洗vmap
+范围，并在I/O返回后使其失效。
+
+  ``void flush_kernel_vmap_range(void *vaddr, int size)``
+
+	冲洗vmap区域中指定的虚拟地址范围的内核缓存。这是为了确保内核在vmap范围
+	内修改的任何数据对物理页是可见的。这个设计是为了使这个区域可以安全地执
+	行I/O。注意，这个API并没有冲洗该区域的偏移映射别名。
+
+  ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``
+
+	在vmap区域的一个给定的虚拟地址范围的缓存，这可以防止处理器在物理页的I/O
+	发生时通过投机性地读取数据而使缓存变脏。这只对读入vmap区域的数据是必要的。
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index a1dd792e46f7..b7774fb5fad1 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -78,9 +78,14 @@ Todolist:
 
 缓存管理，CPU热插拔管理等。
 
-Todolist:
+.. toctree::
+   :maxdepth: 1
 
    cachetlb
+
+Todolist:
+
+
    cpu_hotplug
    memory-hotplug
    genericirq
-- 
2.27.0

