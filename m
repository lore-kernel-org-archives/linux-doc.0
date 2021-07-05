Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790B7C07E99
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 12:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A166613F7
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 12:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhGEM7B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jul 2021 08:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhGEM7A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jul 2021 08:59:00 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4544C061574
        for <linux-doc@vger.kernel.org>; Mon,  5 Jul 2021 05:56:22 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b14-20020a17090a7aceb029017261c7d206so8714277pjl.5
        for <linux-doc@vger.kernel.org>; Mon, 05 Jul 2021 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c1/Lv6LdZrbaJyBJc+9L67wUt7VnJ3C+viH2C8b9NMM=;
        b=Sw6r9tq8LUUsAmJavLl86fAQEZzxc6k4a1NsiOtA4yy6sQH3MBV2et4iUp+QN6/G2l
         AoGXLHkUyoe3FyHVbSjrpDb2NxJRPiDg/S/J/oQlWSNUP3e1zbTEoTLkzWPHlPBR+erT
         kb1egy9emTaoyizlJq2mq3Aa1OZ07Aa5LZsQux4/cZ1YwyA+J/I3F9Dcjd/aZ2Kgzn5X
         EliD8Aj/bL0Kk1V8bUhE2BuFq6D5SwpSKW0YPuXJayrgceLZMJKMTsHE0qBifFEdPvhr
         9p0iXC63TSPfABx7LoJR3R//3WXmNhHlCd5NDYLynlnfbF0eAiQi+R2lWdPYJCMHlF8V
         PJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c1/Lv6LdZrbaJyBJc+9L67wUt7VnJ3C+viH2C8b9NMM=;
        b=uJeBP/XwTmSr70Q9i87YZMknSgwO4uK+6XIzkvzNPMDU3aUceMOtahjyt1Y/e9RYNh
         rxM7ZEyLEm0ZSAKnP9zJqE7dDltj6Qoo1BaDPc58n1av2dSL+ZBLKJFmTUyNKBvEyCgo
         15cmkfslPkT9/Y90h7z/Ybzg1sUhN3wq4tUhz3z2kcSSz2d4qv+qXhkoys13/KhFok9U
         NyMqmPBJDqtKGchZeUandrqwWR58lRgk++N5f3oIFuLdJqFlTb56MZxarFoYT4Y0eUWm
         zwVsogjfyhe3CFSHV9F2kdVFfXk0Vqdnq2b7qW+KtQmcej7KTgBpJS09SPFwxqa0P7sS
         8+sg==
X-Gm-Message-State: AOAM532R1Hcv92wyH9HfkXOiwgD4UcMZqvy4tWeI0msSfwb1oCz2TFkG
        tDnO3CRM8PVOvzfdEiFwDuk=
X-Google-Smtp-Source: ABdhPJx8pdON9cIj4EbV1FS9uyZQOH38GiHUhUQ9QU7AYshUrsqa3umYQ7UlTLlhy2aoDsA+qYiLxA==
X-Received: by 2002:a17:90a:1a:: with SMTP id 26mr15181558pja.187.1625489782357;
        Mon, 05 Jul 2021 05:56:22 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id a9sm2082630pfa.26.2021.07.05.05.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 05:56:21 -0700 (PDT)
Subject: Re: [PATCH 1/6] docs/zh_CN: add core-api memory-allocation
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
References: <cover.1625048200.git.siyanteng@loongson.cn>
 <568d3633b6752cb66c0aa8fd950b9219078013d3.1625048200.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <9657b5ca-d133-617a-10c1-a2b6e1ef2204@gmail.com>
Date:   Mon, 5 Jul 2021 20:56:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <568d3633b6752cb66c0aa8fd950b9219078013d3.1625048200.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/30/21 6:23 PM, Yanteng Si wrote:
> Translate Documentation/core-api/memory-allocation.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   6 +-
>  .../zh_CN/core-api/memory-allocation.rst      | 138 ++++++++++++++++++
>  2 files changed, 143 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/memory-allocation.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index b4bde9396339..9367128c4cb7 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -96,9 +96,13 @@ Todolist:
>  如何在内核中分配和使用内存。请注意，在
>  :doc:`/vm/index` 中有更多的内存管理文档。
>  
> -Todolist:
> +.. toctree::
> +   :maxdepth: 1
>  
>     memory-allocation
> +
> +Todolist:
> +
>     unaligned-memory-access
>     dma-api
>     dma-api-howto
> diff --git a/Documentation/translations/zh_CN/core-api/memory-allocation.rst b/Documentation/translations/zh_CN/core-api/memory-allocation.rst
> new file mode 100644
> index 000000000000..7d0455668004
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/memory-allocation.rst
> @@ -0,0 +1,138 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/memory-allocation.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +
> +
> +.. _cn_core-api_memory-allocation:
> +
> +============
> +内存分配指南
> +============
> +
> +Linux为内存分配提供了多种API。你可以使用 `kmalloc` 或 `kmem_cache_alloc`
> +系列分配小块内存，使用 `vmalloc` 及其派生产品分配大的几乎连续的区域，或者
> +你可以用 alloc_pages 直接向页面分配器请求页面。也可以使用更专业的分配器，
> +例如 `cma_alloc` 或 `zs_malloc` 。
> +
> +大多数的内存分配API使用GFP标志来表达该内存应该如何分配。GFP的缩写代表
> +“(get free pages)获取空闲页”，是底层的内存分配功能。
> +
> +（内存）分配API的多样性与众多的GFP标志相结合，使得“我应该如何分配内存？”这个问
> +题不那么容易回答，尽管很可能你应该使用
> +
> +::
> +
> +  kzalloc(<size>, GFP_KERNEL);
> +
> +当然，有些情况下必须使用其他分配API和不同的GFP标志。
> +
> +获取空闲页标志
> +==============
> +GFP标志控制分配器的行为。它们告诉我们哪些内存区域可以被使用，分配器应该多努力寻
> +找空闲的内存，这些内存是否可以被用户空间访问等等。内存管理API为GFP标志和它们的
> +组合提供了参考文件，这里我们简要介绍一下它们的推荐用法:
> +
> +  * 大多数时候， ``GFP_KERNEL`` 是你需要的。内核数据结构的内存，DMAable内存，inode

DMAable内存， DMA可用内存？

> +    缓存，所有这些和其他许多分配类型都可以使用 ``GFP_KERNEL`` 。注意，使用 ``GFP_KERNEL``
> +    意味着 ``GFP_RECLAIM`` ，这意味着在有内存压力的情况下可能会触发直接回收；调用上
> +    下文必须允许睡眠。
> +
> +  * 如果分配是从一个原子上下文中进行的，例如中断处理程序，使用 ``GFP_NOWAIT`` 。这个
> +    标志可以防止直接回收和IO或文件系统操作。因此，在内存压力下， ``GFP_NOWAIT`` 分配
> +    可能会失败。有合理退路的分配应该使用 ``GFP_NOWARN`` 。
> +
> +  * 如果你认为访问内存储备是合理的，除非分配成功，否则内核会有压力，你可以使用 ``GFP_ATOMIC`` 。

如果你认为访问保留内存区是合理的，并且除非分配成功。。。？

> +
> +  * 从用户空间触发的不可信任的分配应该是kmem核算的对象，必须设置 ``__GFP_ACCOUNT`` 位。
> +    有一个方便的用于 ``GFP_KERNEL`` 分配的 ``GFP_KERNEL_ACCOUNT`` 快捷键，其应该被核
> +    算。
> +
> +  * 用户空间的分配应该使用 ``GFP_USER`` 、 ``GFP_HIGHUSER`` 或 ``GFP_HIGHUSER_MOVABLE``
> +    中的一个标志。标志名称越长，限制性越小。
> +
> +    ``GFP_HIGHUSER_MOVABLE`` 不要求分配的内存将被内核直接访问，并意味着数据是可迁移的。
> +
> +    ``GFP_HIGHUSER`` 意味着所分配的内存是不可迁移的，但也不要求它能被内核直接访问。举个
> +    例子就是一个硬件分配内存，这些数据直接映射到用户空间，但没有寻址限制。
> +
> +    ``GFP_USER`` 意味着分配的内存是不可迁移的，它必须被内核直接访问。
> +
> +你可能会注意到，在现有的代码中，有相当多的分配指定了 ``GFP_NOIO`` 或 ``GFP_NOFS`` 。
> +从历史上看，它们被用来防止递归死锁，这种死锁是由直接内存回收调用到FS或IO路径以及对已
> +经持有的资源进行阻塞引起的。从4.12开始，解决这个问题的首选方法是使用新的范围API，即
> +:ref:`Documentation/core-api/gfp_mask-from-fs-io.rst <gfp_mask_from_fs_io>`.
> +
> +其他传统的GFP标志是 ``GFP_DMA`` 和 ``GFP_DMA32`` 。它们用于确保分配的内存可以被寻
> +址能力有限的硬件访问。因此，除非你正在为一个有这种限制的设备编写驱动程序，否则要避免
> +使用这些标志。而且，即使是有限制的硬件，也最好使用dma_alloc* APIs。
> +
> +GFP标志和回收行为
> +-----------------
> +内存分配可能会触发直接或后台回收，了解页面分配器将如何努力满足该请求或其他请求是非常
> +有用的。
> +
> +  * ``GFP_KERNEL & ~__GFP_RECLAIM`` - 乐观分配，完全不尝试释放内存。最轻量级的模
> +    式，甚至不启动后台回收。应该小心使用，因为它可能会耗尽内存，而下一个用户可能会启
> +    动更积极的回收。
> +
> +  * ``GFP_KERNEL & ~__GFP_DIRECT_RECLAIM`` (or ``GFP_NOWAIT`` ) - 乐观分配，不
> +    试图从当前上下文中释放内存，但如果该区域低于低水位，可以唤醒kswapd来回收内存。可
> +    以从原子上下文中使用，或者当请求是一个性能优化，并且有另一个慢速路径的回退。
> +
> +  * ``(GFP_KERNEL|__GFP_HIGH) & ~__GFP_DIRECT_RECLAIM`` (aka ``GFP_ATOMIC`` ) - 非
> +    睡眠分配，有一个昂贵的回退，所以它可以访问某些部分的内存储备。通常从中断/底层上下
> +    文中使用，有一个昂贵的慢速路径回退。
> +
> +  * ``GFP_KERNEL`` - 允许后台和直接回收，并使用默认的页面分配器行为。这意味着不昂贵

不昂贵 -> 便宜的？
> +    的分配请求基本上是不会失败的，但不能保证这种行为，所以失败必须由调用者适当检查（例
> +    如，目前允许OOM杀手失败）。
> +
> +  * ``GFP_KERNEL | __GFP_NORETRY`` - 覆盖默认的分配器行为，所有的分配请求都会提前
> +    失败，而不是导致破坏性的回收（在这个实现中是一轮的回收）。OOM杀手不被调用。
> +
> +  * ``GFP_KERNEL | __GFP_RETRY_MAYFAIL`` - 覆盖 **默认** 的分配器行为，所有分配请求都非
> +    常努力。如果回收不能取得任何进展，该请求将失败。OOM杀手不会被触发。
> +
> +  * ``GFP_KERNEL | __GFP_NOFAIL`` - 覆盖默认的分配器行为，所有分配请求将无休止地循
> +    环，直到成功。这可能真的很危险，特别是对于较大的需求。
> +
> +选择内存分配器
> +==============
> +
> +分配内存的最直接的方法是使用kmalloc()系列的函数。而且，为了安全起见，最好使用将内存
> +设置为零的例程，如kzalloc()。如果你需要为一个数组分配内存，有kmalloc_array()和kcalloc()
> +辅助程序。辅助程序struct_size()、array_size()和array3_size()可以用来安全地计算对
> +象的大小而不会溢出。
> +
> +可以用 `kmalloc` 分配的块的最大尺寸是有限的。实际的限制取决于硬件和内核配置，但是对于
> +小于页面大小的对象，使用 `kmalloc` 是一个好的做法。
> +
> +用 `kmalloc` 分配的块的地址至少要对齐到ARCH_KMALLOC_MINALIGN字节。对于大小为2的幂，
对于大小为2的幂, since the subject is the 'sizes', could we change the translation
as 对于2的幂的大小？

Thanks
Alex

> +对齐方式也被保证为至少是各自的大小。
> +
> +用kmalloc()分配的块可以用krealloc()调整大小。与kmalloc_array()类似：以krealloc_array()
> +的形式提供了一个用于调整数组大小的辅助工具。
> +
> +对于大量的分配，你可以使用vmalloc()和vzalloc()，或者直接向页面分配器请求页面。由vmalloc
> +和相关函数分配的内存在物理上是不连续的。
> +
> +如果你不确定分配的大小对 `kmalloc` 来说是否太大，可以使用kvmalloc()及其派生函数。它将尝
> +试用kmalloc分配内存，如果分配失败，将用 `vmalloc` 重新尝试。对于哪些GFP标志可以与 `kvmalloc`
> +一起使用是有限制的；请看kvmalloc_node()参考文档。注意， `kvmalloc` 可能会返回物理上不连
> +续的内存。
> +
> +如果你需要分配许多相同的对象，你可以使用slab缓存分配器。在使用缓存之前，应该用
> +kmem_cache_create()或kmem_cache_create_usercopy()来设置缓存。如果缓存的一部分可能被复
> +制到用户空间，应该使用第二个函数。在缓存被创建后，kmem_cache_alloc()和它的封装可以从该缓
> +存中分配内存。
> +
> +当分配的内存不再需要时，它必须被释放。你可以使用kvfree()来处理用 `kmalloc` 、 `vmalloc`
> +和 `kvmalloc` 分配的内存。slab缓存应该用kmem_cache_free()来释放。不要忘记用
> +kmem_cache_destroy()来销毁缓存。
> 
