Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6B9C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jun 2022 16:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239010AbiFJQNH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Jun 2022 12:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiFJQNF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jun 2022 12:13:05 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835985FC6
        for <linux-doc@vger.kernel.org>; Fri, 10 Jun 2022 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=eyxEgvYCAP7eW/U0080cSbwzsFscUWZU7HIIf
        BIyhEg=; b=V+spkhIcqo2ik9vdZ+xdHvATvNov17kZOC398PnTDZ/ASbqJqW51W
        OznQwOrHPdx+jAFCM5F2B3zPYtITMYzYK/GUU3KVgT49xrlMxHNbv5zt++B496jn
        yqYSnwEERu8qn+j2ckv8bRPd1QrOPU5LSb/WzHgkRdukqG/TKwvDXY=
Received: from bobwxc.mipc (unknown [120.242.121.232])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHn_59baNiXBgWAA--.1595S2;
        Sat, 11 Jun 2022 00:12:46 +0800 (CST)
Date:   Sat, 11 Jun 2022 00:12:45 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: Re: [PATCH 3/3] docs/zh_CN: Update the translation of vm index to
 5.19-rc1
Message-ID: <YqNtfTmaFzRKfBFK@bobwxc.mipc>
References: <cover.1654780922.git.siyanteng@loongson.cn>
 <41ce34c3f296ae6f615f6a1a61f49186c54139d5.1654780922.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41ce34c3f296ae6f615f6a1a61f49186c54139d5.1654780922.git.siyanteng@loongson.cn>
X-CM-TRANSID: GiKnCgCHn_59baNiXBgWAA--.1595S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KFWkWw1DAw4kWrWDGr45Jrb_yoWDZr4fpF
        ykKryfWa1xJ345C34xGw1UKF18AF1xua1UCr1IqwnYvrsrJr4ktrsFyryDKa93Wry8AFWU
        XFs3KFW09r1jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42
        xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUU
        UUU==
X-Originating-IP: [120.242.121.232]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 09, 2022 at 09:27:20PM +0800, Yanteng Si wrote:
> update to commit 481cc97349d6 ("mm,doc: Add new
> documentation structure")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/vm/bootmem.rst         | 13 +++++++
>  Documentation/translations/zh_CN/vm/index.rst | 39 +++++++++++++++----
>  Documentation/translations/zh_CN/vm/oom.rst   | 13 +++++++
>  .../translations/zh_CN/vm/page_allocation.rst | 13 +++++++
>  .../translations/zh_CN/vm/page_cache.rst      | 13 +++++++
>  .../translations/zh_CN/vm/page_reclaim.rst    | 13 +++++++
>  .../translations/zh_CN/vm/page_tables.rst     | 13 +++++++
>  .../translations/zh_CN/vm/physical_memory.rst | 13 +++++++
>  .../translations/zh_CN/vm/process_addrs.rst   | 13 +++++++
>  Documentation/translations/zh_CN/vm/shmfs.rst | 13 +++++++
>  Documentation/translations/zh_CN/vm/swap.rst  | 13 +++++++
>  .../translations/zh_CN/vm/vmalloc.rst         | 13 +++++++
>  12 files changed, 175 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst
> 
> diff --git a/Documentation/translations/zh_CN/vm/bootmem.rst b/Documentation/translations/zh_CN/vm/bootmem.rst
> new file mode 100644
> index 000000000000..45652031a9cc
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/bootmem.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index a1c6d529b6ff..e9adc693184d 100644
> --- a/Documentation/translations/zh_CN/vm/index.rst
> +++ b/Documentation/translations/zh_CN/vm/index.rst
> @@ -12,11 +12,38 @@
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
> +   highmem
> +   page_reclaim
> +   swap
> +   page_cache
> +   shmfs
> +   oom
> +
> +TODOLIST:
> +* slab
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
> @@ -25,7 +52,6 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
>     balance
>     damon/index
>     free_page_reporting
> -   highmem
>     ksm
>     frontswap
>     hmm
> @@ -48,7 +74,6 @@ TODOLIST:
>  * free_page_reporting
>  * hugetlbfs_reserv
>  * page_migration
> -* slub
>  * transhuge
>  * unevictable-lru
>  * vmalloced-kernel-stacks
> diff --git a/Documentation/translations/zh_CN/vm/oom.rst b/Documentation/translations/zh_CN/vm/oom.rst
> new file mode 100644
> index 000000000000..00cc444cf86b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/oom.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..ab779498abe6
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_allocation.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..6e000699da78
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_cache.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..3939d4c4a67b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_reclaim.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..180fb79befd0
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_tables.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..5427baea5306
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/physical_memory.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..980fa32ecf07
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/process_addrs.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..5b3c85e5f992
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/shmfs.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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

Missing:

diff --git a/Documentation/vm/slab.rst b/Documentation/vm/slab.rst
new file mode 100644
index 000000000000..87d5a5bb172f
--- /dev/null
+++ b/Documentation/vm/slab.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Slab Allocation
+===============

--
Thanks,
	Wu

> diff --git a/Documentation/translations/zh_CN/vm/swap.rst b/Documentation/translations/zh_CN/vm/swap.rst
> new file mode 100644
> index 000000000000..568a4472ff11
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/swap.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..efb542878f8c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/vmalloc.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
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

