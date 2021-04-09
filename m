Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FBBC433ED
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95D1760240
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhDIKZq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 06:25:46 -0400
Received: from m32-153.88.com ([43.250.32.153]:21726 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231638AbhDIKZp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 06:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=2MhV4fhzSwilh+TJVP116iy/VVnLkW3GDFgkO
        iXHQJM=; b=DGOV/7uzNbN8pRS/9E76YLxlHzQinWn1AwOIqiS/Y4rHMA9sacoYi
        UqwdBo197AE3GBA5GKfiZ+k5QUGn9QiKNznAuDYmFFLcZUto+PVvEXIy+WA/CBIu
        Kqxv3BtFdcmk4iXN2snmdCV8EhcBN9neJ6OsGw5sQRlyAE+9vmdalM=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHkyOQK3BgbU1lAA--.39936S2;
        Fri, 09 Apr 2021 18:25:22 +0800 (CST)
Date:   Fri, 9 Apr 2021 18:25:20 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 06/11] docs/zh_CN: add core-api/index.rst translation
Message-ID: <20210409102519.GC22786@bobwxc.top>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-7-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210409091013.2493988-7-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHkyOQK3BgbU1lAA--.39936S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4kXrWkZrW3AFykXrWfuFg_yoW5Zw4xpr
        ykGryfKF4fXry7AF1fGr1jqr1DGa18Wa17K3yxXr1Yqr1UXF47Ar4Uta47GrW7Gr1vyFyr
        ZF45tFyUAry2yrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyGb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2
        IY04v7MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4U
        Jr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
        xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
        jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
        0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
        67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUUnNVDUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 05:10:08PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/index.rst into Chinese.
> add Documentation/translations/zh_CN/core-api/irq/* to zh_CN/core-api/index.rst.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/core-api/index.rst     | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> new file mode 100644
> index 000000000000..1d0e73b03858
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -0,0 +1,126 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../core-api/irq/index`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_core-api_index.rst:
> +
> +
> +======================
> +核心API文档
> +======================
> +
> +这是核心内核API手册的首页。 非常感谢为本手册转换(和编写!)的文档!
> +
> +核心实用程序
> +==============
> +
> +本节包含通用的和“核心中的核心”文档。 第一部分是 docbook 时期遗留下
> +来的大量 kerneldoc 信息；有朝一日，若有人有动力的话，应当把它们拆分
> +出来。
> +
> +Todolist:
> +
> +   kernel-api
> +   workqueue
> +   printk-basics
> +   printk-formats
> +   symbol-namespaces
> +
> +数据结构和低级实用程序
> +=======================================
> +
> +在整个内核中使用的函数库。
> +
> +Todolist:
> +
> +   kobject
> +   kref
> +   assoc_array
> +   xarray
> +   idr
> +   circular-buffers
> +   rbtree
> +   generic-radix-tree
> +   packing
> +   bus-virt-phys-mapping
> +   this_cpu_ops
> +   timekeeping
> +   errseq
> +
> +并发原语
> +======================
> +
> +Linux如何让一切同时发生。 详情请参阅
> +:doc:`/locking/index`
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   irq/index
> +
> +Todolist:
> +
> +   refcount-vs-atomic
> +   local_ops
> +   padata
> +   ../RCU/index
> +
> +低级硬件管理
> +=============================
> +
> +缓存管理，CPU热插拔管理等。
> +
> +Todolist:
> +
> +   cachetlb
> +   cpu_hotplug
> +   memory-hotplug
> +   genericirq
> +   protection-keys
> +
> +
> +内存管理
> +=================
> +
> +如何在内核中分配和使用内存。请注意，在
> +:doc:`/vm/index` 中有更多的内存管理文档。
> +
> +Todolist:
> +
> +   memory-allocation
> +   unaligned-memory-access
> +   dma-api
> +   dma-api-howto
> +   dma-attributes
> +   dma-isa-lpc
> +   mm-api
> +   genalloc
> +   pin_user_pages
> +   boot-time-mm
> +   gfp_mask-from-fs-io
> +
> +内核调试的接口
> +===============================
> +
> +Todolist:
> +
> +   debug-objects
> +   tracepoint
> +   debugging-via-ohci1394
> +
> +其它文档
> +===============
> +
> +不适合放在其它地方或尚未归类的文件；
> +
> +Todolist:
> +
> +   librs
> +
> +.. only:: subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> -- 
> 2.27.0

