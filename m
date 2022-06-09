Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC32C43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 17:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239620AbiFIRJq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 13:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237194AbiFIRJp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 13:09:45 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AAB13275D
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=PAQsZebakY6K/N3VMCVXTFOrH4uD3S1wvLeV4
        HwgmzA=; b=eIWeuvILGDZOTVQ3p3EXei9BX9Myl56oL9tlQJ5y4DproY+4AHDy/
        HO2KJC/QNtIKAwhjd6waJw3KdR3WDzeFmgNWKgcXWD6+QYcoFj2EnshqE4sgxFs9
        TIprczndRAj7iRw1zvHoqVbtF+U14xYCfn7apWUgRQSB0vss39IG1U=
Received: from bobwxc.mipc (unknown [120.242.70.248])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBXgiRJKaJi35gQAA--.48817S2;
        Fri, 10 Jun 2022 01:09:31 +0800 (CST)
Date:   Fri, 10 Jun 2022 01:09:29 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: Re: [PATCH 1/3] docs/zh_CN: Update the translation of highmem to
 5.19-rc1
Message-ID: <YqIP9qqYOAS0KMEa@bobwxc.mipc>
References: <cover.1654780922.git.siyanteng@loongson.cn>
 <2fa73818cc1974444a8dc6db0d73f8609683db29.1654780922.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fa73818cc1974444a8dc6db0d73f8609683db29.1654780922.git.siyanteng@loongson.cn>
X-CM-TRANSID: LCKnCgBXgiRJKaJi35gQAA--.48817S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF4rGr17Zr47ur1rGr17Jrb_yoW3XFWDpF
        929r93Kw4a934jvryDKr129w1rArWUGF4jg3yUJas7ur95tF9Iq3WUtFWUW3WfX3s7ArWf
        ArWUW393Ar1qvwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqSb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUjDGYDUUU
        U
X-Originating-IP: [120.242.70.248]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Yanteng,

On Thu, Jun 09, 2022 at 09:27:18PM +0800, Yanteng Si wrote:
> update to commit 110bf7a52307 ("Documentation/vm: rework
> "Temporary Virtual Mappings" section")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/vm/highmem.rst         | 77 +++++++++++--------
>  1 file changed, 43 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/vm/highmem.rst b/Documentation/translations/zh_CN/vm/highmem.rst
> index 018838e58c3e..23057ccf71ad 100644
> --- a/Documentation/translations/zh_CN/vm/highmem.rst
> +++ b/Documentation/translations/zh_CN/vm/highmem.rst
> @@ -50,55 +50,55 @@
>  临时虚拟映射
>  ============
>  
> -内核包含几种创建临时映射的方法。:
> +内核包含几种创建临时映射的方法。下面的列表按照使用的优先顺序显示了它们。
>  
> -* vmap().  这可以用来将多个物理页长期映射到一个连续的虚拟空间。它需要synchronization
> -  来解除映射。
> +* kmap_local_page()。这个函数是用来要求短期映射的。它可以从任何上下文（包括中断）中调用，
> +  但是映射只能在获取它们的上下文中使用。
>  
> -* kmap().  这允许对单个页面进行短期映射。它需要synchronization，但在一定程度上被摊销。
> -  当以嵌套方式使用时，它也很容易出现死锁，因此不建议在新代码中使用它。
> +  在可行的情况下，这个函数应该比其他所有的函数更受欢迎。

How about 更受欢迎 -> 优先使用 ?

>  
> -* kmap_atomic().  这允许对单个页面进行非常短的时间映射。由于映射被限制在发布它的CPU上，
> -  它表现得很好，但发布任务因此被要求留在该CPU上直到它完成，以免其他任务取代它的映射。
> -
> -  kmap_atomic() 也可以由中断上下文使用，因为它不睡眠，而且调用者可能在调用kunmap_atomic()
> -  之后才睡眠。
> +  这些映射是线程本地和CPU本地的，这意味着映射只能从这个线程中访问，并且当映射处于活动状
> +  态时，该线程与CPU绑定。即使线程被抢占了（因为抢占永远不会被函数禁用），CPU也不能通过
> +  CPU-hotplug从系统中拔出，直到映射被处理掉。
>  
> -  可以假设k[un]map_atomic()不会失败。
> +  在本地的kmap区域中采取pagefaults是有效的，除非获取本地映射的上下文由于其他原因不允许
> +  这样做。
>  
> +  kmap_local_page()总是返回一个有效的虚拟地址，并且假定kunmap_local()不会失败。
>  
> -使用kmap_atomic
> -===============
> +  嵌套kmap_local_page()和kmap_atomic()映射在一定程度上是允许的（最多到KMAP_TYPE_NR），
> +  但是它们的调用必须严格排序，因为映射的实现是基于堆栈的。关于如何管理嵌套映射的细节，
> +  请参见kmap_local_page() kdocs（包含在 "函数 "部分）。
>  
> -何时何地使用 kmap_atomic() 是很直接的。当代码想要访问一个可能从高内存（见__GFP_HIGHMEM）
> -分配的页面的内容时，例如在页缓存中的页面，就会使用它。该API有两个函数，它们的使用方式与
> -下面类似::
> -
> -	/* 找到感兴趣的页面。 */
> -	struct page *page = find_get_page(mapping, offset);
> -
> -	/* 获得对该页内容的访问权。 */
> -	void *vaddr = kmap_atomic(page);
> +* kmap_atomic().  这允许对单个页面进行非常短的时间映射。由于映射被限制在发布它的CPU上，
> +  它表现得很好，但发布任务因此被要求留在该CPU上直到它完成，以免其他任务取代它的映射。

发布的任务

>  
> -	/* 对该页的内容做一些处理。 */
> -	memset(vaddr, 0, PAGE_SIZE);
> +  kmap_atomic()也可以被中断上下文使用，因为它不睡眠，调用者也可能在调用kunmap_atomic()
> +  后才睡眠。
>  
> -	/* 解除该页面的映射。 */
> -	kunmap_atomic(vaddr);
> +  内核中对kmap_atomic()的每次调用都会创建一个不可抢占的段，并禁用分页默认值。这可能是

分页默认值？
pagefaults
页错误 or 缺页异常？

> +  一个不需要的延迟的来源。因此用户应该选择kmap_local_page()而不是kmap_atomic()。

How about
这可能是未预期延迟的来源之一

>  
> -注意，kunmap_atomic()调用的是kmap_atomic()调用的结果而不是参数。
> +  假设k[un]map_atomic()不会失败。
>  
> -如果你需要映射两个页面，因为你想从一个页面复制到另一个页面，你需要保持kmap_atomic调用严
> -格嵌套，如::
> +* kmap()。这应该被用来对单个页面进行短时间的映射，对抢占或迁移没有限制。它有一个开销，

它会带来开销

> +  因为映射空间是受限制的，并且受到全局锁的保护，以实现同步。当不再需要映射时，必须用
> +  kunmap()释放该页被映射的地址。
>  
> -	vaddr1 = kmap_atomic(page1);
> -	vaddr2 = kmap_atomic(page2);
> +  kmap()还需要在kmap的池被回绕（TLB项用光了，需要从第一项复用）时进行全局TLB无效化，

Missing:
Mapping changes must be propagated across all the CPUs.

> +  当映射空间被完全利用时，它可能会阻塞，直到有一个可用的槽出现。因此，kmap()只能从
> +  可抢占的上下文中调用。
>  
> -	memcpy(vaddr1, vaddr2, PAGE_SIZE);
> +  如果一个映射必须持续相对较长的时间，上述所有的工作都是必要的，但是内核中大部分的
> +  高内存映射都是短暂的，而且只在一个地方使用。这意味着在这种情况下，kmap()的成本大
> +  多被浪费了。kmap()并不是为长期映射而设计的，但是它已经朝着这个方向发展了，在较新
> +  的代码中强烈不鼓励使用它，前面的函数集应该是首选。
>  
> -	kunmap_atomic(vaddr2);
> -	kunmap_atomic(vaddr1);
> +  在64位系统中，调用kmap_local_page()、kmap_atomic()和kmap()没有实际作用，因为64位
> +  地址空间足以解决所有物理内存的页面被永久映射。

足以永久映射所有物理内存页面

>  
> +* vmap()。这可以用来将多个物理页长期映射到一个连续的虚拟空间。它需要全局同步来解除
> +  映射。
>  
>  临时映射的成本
>  ==============
> @@ -126,3 +126,12 @@ i386 PAE
>  
>  一般的建议是，你不要在32位机器上使用超过8GiB的空间--尽管更多的空间可能对你和你的工作
>  量有用，但你几乎是靠你自己--不要指望内核开发者真的会很关心事情的进展情况。
> +
> +函数
> +====
> +
> +该API在以下内核代码中:
> +
> +include/linux/highmem.h
> +
> +include/linux/highmem-internal.h
> -- 
> 2.27.0

Thanks,
	Wu

