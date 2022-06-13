Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E40C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 15:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbiFMPhH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 11:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235736AbiFMPgp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 11:36:45 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF55B765E
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=cTKQCLawKvMVnKikDoSzcbnMdNWBXAh39LyBC
        s1RjU0=; b=lKr1XSL/f6NbbdYkvjGIrMk9L+GtTzKDFKT+UgpGlDRmTfSB+qnUg
        EUga2TPvIFLolt2lOoea8fyO9d55oqFNWSAE3wJ+DD+fIbDNl8ExVmwQap2ViNCv
        +u6pjxm9ZsbA84u9133VqO9vpNV4pO/6oHzFu8hNwQtwoFOY5ITZag=
Received: from bobwxc.mipc (unknown [120.242.69.242])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX_xMVN6dimGoEAA--.14690S2;
        Mon, 13 Jun 2022 21:09:42 +0800 (CST)
Date:   Mon, 13 Jun 2022 21:09:41 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: Re: [PATCH v2 3/3] docs/zh_CN: Update the translation of vm index to
 5.19-rc1
Message-ID: <Yqc3FZTg2sQinLAp@bobwxc.mipc>
References: <cover.1655094814.git.siyanteng@loongson.cn>
 <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
X-CM-TRANSID: GiKnCgBX_xMVN6dimGoEAA--.14690S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KFWkZw43Gr4rAF45XrW8Zwb_yoWkWrWkpF
        ykKryfWa1xJ345C34xGw1UKF18AF4xua1UGr1IqwnY9rsrtr4vyrsFyryDKa93Wry0yFWU
        XFs5KFWj9ryjk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW5GwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUURwZ7UUUUU==
X-Originating-IP: [120.242.69.242]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 13, 2022 at 01:03:42PM +0800, Yanteng Si wrote:
> update to commit 481cc97349d6 ("mm,doc: Add new
> documentation structure")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks!

> ---
>  .../translations/zh_CN/vm/bootmem.rst         | 14 +++++++
>  Documentation/translations/zh_CN/vm/index.rst | 37 +++++++++++++++----
>  Documentation/translations/zh_CN/vm/oom.rst   | 14 +++++++
>  .../translations/zh_CN/vm/page_allocation.rst | 14 +++++++
>  .../translations/zh_CN/vm/page_cache.rst      | 14 +++++++
>  .../translations/zh_CN/vm/page_reclaim.rst    | 14 +++++++
>  .../translations/zh_CN/vm/page_tables.rst     | 14 +++++++
>  .../translations/zh_CN/vm/physical_memory.rst | 14 +++++++
>  .../translations/zh_CN/vm/process_addrs.rst   | 14 +++++++
>  Documentation/translations/zh_CN/vm/shmfs.rst | 14 +++++++
>  Documentation/translations/zh_CN/vm/slab.rst  | 14 +++++++
>  Documentation/translations/zh_CN/vm/swap.rst  | 14 +++++++
>  .../translations/zh_CN/vm/vmalloc.rst         | 14 +++++++
>  13 files changed, 198 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst
> 
> diff --git a/Documentation/translations/zh_CN/vm/bootmem.rst b/Documentation/translations/zh_CN/vm/bootmem.rst
> new file mode 100644
> index 000000000000..8f8fa82281f1
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/bootmem.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/bootmem.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +启动内存
> +========
> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
> index a1c6d529b6ff..a02929bb0d31 100644
> --- a/Documentation/translations/zh_CN/vm/index.rst
> +++ b/Documentation/translations/zh_CN/vm/index.rst
> @@ -12,11 +12,36 @@
>  Linux内存管理文档
>  =================
>  
> -这是一个关于Linux内存管理（mm）子系统内部的文档集，其中有不同层次的细节，包括注释
> -和邮件列表的回复，用于阐述数据结构和算法的基本情况。如果你正在寻找关于简单分配内存的建
> -议，请参阅(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
> -对于控制和调整指南，请参阅(Documentation/admin-guide/mm/index)。
> -TODO:待引用文档集被翻译完毕后请及时修改此处）
> +这是一份关于了解Linux的内存管理子系统的指南。如果你正在寻找关于简单分配内存的
> +建议，请参阅内存分配指南
> +(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
> +关于控制和调整的指南，请看管理指南
> +(Documentation/translations/zh_CN/admin-guide/mm/index.rst)。
> +
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   physical_memory
> +   page_tables
> +   process_addrs
> +   bootmem
> +   page_allocation
> +   vmalloc
> +   slab
> +   highmem
> +   page_reclaim
> +   swap
> +   page_cache
> +   shmfs
> +   oom
> +
> +遗留文档
> +========
> +
> +这是一个关于Linux内存管理（MM）子系统内部的旧文档的集合，其中有不同层次的细节，
> +包括注释和邮件列表的回复，用于阐述数据结构和算法的描述。它应该被很好地整合到上述
> +结构化的文档中，如果它已经完成了它的使命，可以删除。
>  
>  .. toctree::
>     :maxdepth: 1
> @@ -25,7 +50,6 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
>     balance
>     damon/index
>     free_page_reporting
> -   highmem
>     ksm
>     frontswap
>     hmm
> @@ -48,7 +72,6 @@ TODOLIST:
>  * free_page_reporting
>  * hugetlbfs_reserv
>  * page_migration
> -* slub
>  * transhuge
>  * unevictable-lru
>  * vmalloced-kernel-stacks
> diff --git a/Documentation/translations/zh_CN/vm/oom.rst b/Documentation/translations/zh_CN/vm/oom.rst
> new file mode 100644
> index 000000000000..633b02d79f24
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/oom.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/oom.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +============
> +内存不足处理
> +============
> diff --git a/Documentation/translations/zh_CN/vm/page_allocation.rst b/Documentation/translations/zh_CN/vm/page_allocation.rst
> new file mode 100644
> index 000000000000..3d5b2743d96a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_allocation.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_allocation.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +页面分配
> +========
> diff --git a/Documentation/translations/zh_CN/vm/page_cache.rst b/Documentation/translations/zh_CN/vm/page_cache.rst
> new file mode 100644
> index 000000000000..b0c9c72ccde8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_cache.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_cache.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +页面缓存
> +========
> diff --git a/Documentation/translations/zh_CN/vm/page_reclaim.rst b/Documentation/translations/zh_CN/vm/page_reclaim.rst
> new file mode 100644
> index 000000000000..83275afc07bf
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_reclaim.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_reclaim.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +页面回收
> +========
> diff --git a/Documentation/translations/zh_CN/vm/page_tables.rst b/Documentation/translations/zh_CN/vm/page_tables.rst
> new file mode 100644
> index 000000000000..b525d8f0438c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_tables.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_tables.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +====
> +页表
> +====
> diff --git a/Documentation/translations/zh_CN/vm/physical_memory.rst b/Documentation/translations/zh_CN/vm/physical_memory.rst
> new file mode 100644
> index 000000000000..129962d496ce
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/physical_memory.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/physical_memory.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +物理内存
> +========
> diff --git a/Documentation/translations/zh_CN/vm/process_addrs.rst b/Documentation/translations/zh_CN/vm/process_addrs.rst
> new file mode 100644
> index 000000000000..c1319938101b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/process_addrs.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/process_addrs.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +进程地址
> +========
> diff --git a/Documentation/translations/zh_CN/vm/shmfs.rst b/Documentation/translations/zh_CN/vm/shmfs.rst
> new file mode 100644
> index 000000000000..2987939f5e25
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/shmfs.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/shmfs.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +================
> +共享内存文件系统
> +================
> diff --git a/Documentation/translations/zh_CN/vm/slab.rst b/Documentation/translations/zh_CN/vm/slab.rst
> new file mode 100644
> index 000000000000..0af77c8612b8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/slab.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/slab.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +Slab分配
> +========
> diff --git a/Documentation/translations/zh_CN/vm/swap.rst b/Documentation/translations/zh_CN/vm/swap.rst
> new file mode 100644
> index 000000000000..1c1a3e61a80c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/swap.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/swap.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +========
> +交换内存
> +========
> diff --git a/Documentation/translations/zh_CN/vm/vmalloc.rst b/Documentation/translations/zh_CN/vm/vmalloc.rst
> new file mode 100644
> index 000000000000..d65ed70642c9
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/vmalloc.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/vmalloc.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +================
> +连续虚拟内存分配
> +================
> -- 
> 2.27.0

