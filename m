Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7815AC433B4
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52F0E613D8
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244209AbhDFQjt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 12:39:49 -0400
Received: from m32-153.88.com ([43.250.32.153]:12690 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239377AbhDFQjt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 12:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=jJXUU9JpIeAF/Sce26LTsNw1xAzWpzwBvWui5
        3z9y+4=; b=gwbWnG/lv1X+4VVimGs6sTpiDURbA6/1n7H3UhfmV1kvd5MVxPxEr
        sRXf5mJ1q5U10pvC8Kg5SNpsY3JOjpuqSmTJMEDAdK3FfvMvfyDH4lIc2Jyen61b
        yOs8kT30U4iCZQGs4QcKGVjb9VBMaF6Or0pwGflgfExhGXnjP9uCNE=
Received: from bobwxc.top (unknown [112.96.109.30])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX4iLCjmxgFxRgAA--.27011S2;
        Wed, 07 Apr 2021 00:39:33 +0800 (CST)
Date:   Wed, 7 Apr 2021 00:39:30 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 06/11] docs/zh_CN: add core-api/index.rst translation
Message-ID: <20210406163930.GA17278@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-7-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406130210.2725075-7-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBX4iLCjmxgFxRgAA--.27011S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFW3GryDGrWxJFW8tFWfGrg_yoWrGF45pr
        97GryfKF47Xry7AF1xGr1jqr1DG3W8WanrG3yxXr1qqr1DWFW7Ar4Uta43GrW7Kr1UAFy8
        ZF4rtFyqy342yrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgGb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04
        v7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Y
        z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
        AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
        CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
        WIevJa73UjIFyTuYvjxUUPEfUUUUU
X-Originating-IP: [112.96.109.30]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 06, 2021 at 09:02:05PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/index.rst into Chinese.
> add Documentation/translations/zh_CN/core-api/irq/* to zh_CN/core-api/index.rst.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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
> +这是核心内核API手册的开端。 非常感谢为本手册转换(和编写!)的文档!

手册的首页

> +
> +核心公用程序

实用程序

规范用词:	实用程序
英语名:		utility program，utility
台湾名:		公用程式，公用常式
见载:		海峡两岸信息科学技术名词
学科:		信息科学技术
公布年度:	2008

> +==============
> +
> +本节有通用文件和 "核心中的核心" 文件。 第一部分是 docbook 时期遗留下

本节包含通用的和“核心中的核心”文档。

> +来的大量 kerneldoc 信息；有朝一日，当有人找到精力去做的时候，真的
> +应该把它拆分出来。

若有人之后有动力的话，应当把它们拆分出来。

> +
> +Todolist:
> +
> +   kernel-api
> +   workqueue
> +   printk-basics
> +   printk-formats
> +   symbol-namespaces
> +
> +数据结构和低级公用程序

实用程序

> +=======================================
> +
> +在整个内核中使用的函数库。

missing 'functionality'

功能在整个内核中被使用的函数库。

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

I'm not sure if the path suitable for tanslation dir?

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

so as above

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
> +其它一切文档

maybe remove 一切 ?

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

