Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260E0C07E99
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 13:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 040806141C
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 13:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhGENY0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jul 2021 09:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGENY0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jul 2021 09:24:26 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2FBC061574
        for <linux-doc@vger.kernel.org>; Mon,  5 Jul 2021 06:21:48 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id h4so18276128pgp.5
        for <linux-doc@vger.kernel.org>; Mon, 05 Jul 2021 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BDCBNfSDe6FPnB1WMDf/vtGIJXpaIQo7umaLMHsVOqQ=;
        b=ltoB5EJYyx4OIIW1vyZ2DI8jJGz00ar31ZHgRWBr2TqEQSNoO/pmySh13uKUHeOtQp
         KTfgOWylthJ+FZt9auiQD41jIbiVeybtjqxZXz7pq+86xJeT3Z7pcaM83iepAh50Dh+0
         gEDYPi1FhUPfc0M5a/3y5GFRrkzeZC0zpk40O/KxKfw4UKviz5rZ1IxBdIRxfK5iuxvl
         VITacjuOLWZFeZe2A11YeCxbXxAKrSNYiciW6BeSqChgQEf+A6FtWHJElJdYMrkJg5OU
         yLGlTdzzpBp+iHV3rqjt5edurRZ5Nn4S3/TWZxSEWmHI1llWzYULrO4seSjK4RZCdY5y
         MnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BDCBNfSDe6FPnB1WMDf/vtGIJXpaIQo7umaLMHsVOqQ=;
        b=rLpI5vF+u+8Oc7c3EZwtqrxvXc7g761LPDeSFoVMa4ogzchl/ICX+bskLLp0sqh5qi
         nFQsR4bufLxcWf235n52Tgnd6kg86pUzWh9J3lmKLAFnGm9yH2+YX1Vj1o2c2fTfKYQF
         Up8dW1YRqwDakugY+lH2NKF178DYvwPJu5mcYQYKqX8QPs9dGTI6RLwFRCvqaAGjxg12
         KDw8RfmljzjSKfe0OJLWZh6D0ivCVdS/0qNsynCIHWlwYiebA7Le8hS7WvOpodvpyjwJ
         5U1uZ7AG2WiAMUjESFnKDuVkJscTW7ibcjgMcD+VMhW8QXeagxEfwI1aa2Yh3aK39LrV
         irEw==
X-Gm-Message-State: AOAM533MugpBEBxXRurusUT63E207jQnzJew2a9rP+Bm7VeoMoPlOp38
        gGG+sEbtm0dQDyBowtoNevo=
X-Google-Smtp-Source: ABdhPJxc8tdc9jp/J/N8kkp3JFWDBrkVHUCYlwfZ8IV2kmiv6F1P4k//fesrBGVWZ4RiZGwQhm2aMA==
X-Received: by 2002:a62:2901:0:b029:28e:ef3d:10d2 with SMTP id p1-20020a6229010000b029028eef3d10d2mr15014635pfp.45.1625491307734;
        Mon, 05 Jul 2021 06:21:47 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id fa22sm11210202pjb.42.2021.07.05.06.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 06:21:47 -0700 (PDT)
Subject: Re: [PATCH 3/6] docs/zh_CN: add core-api mm-api translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
References: <cover.1625048200.git.siyanteng@loongson.cn>
 <fdd47a4019bfdffa4e587824e664138621a18832.1625048200.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <527178a7-f3b3-0766-4367-5dfc2b4721e1@gmail.com>
Date:   Mon, 5 Jul 2021 21:21:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fdd47a4019bfdffa4e587824e664138621a18832.1625048200.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 6/30/21 6:23 PM, Yanteng Si wrote:
> Translate Documentation/core-api/mm-api.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../translations/zh_CN/core-api/mm-api.rst    | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 9bc1dfeab98e..e5d2f4d5413c 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -101,6 +101,7 @@ Todolist:
>  
>     memory-allocation
>     unaligned-memory-access
> +   mm-api
>  
>  Todolist:
>  
> @@ -108,7 +109,6 @@ Todolist:
>     dma-api-howto
>     dma-attributes
>     dma-isa-lpc
> -   mm-api
>     genalloc
>     pin_user_pages
>     boot-time-mm
> diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
> new file mode 100644
> index 000000000000..f36cde0c9e04
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
> @@ -0,0 +1,110 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/mm-api.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +
> +
> +.. _cn_core-api_mm-api:
> +
> +============
> +内存管理APIs
> +============
> +
> +API（Application Programming Interface，应用程序接口）
> +
> +用户空间内存访问
> +================
> +
> +该API在以下内核代码中:
> +
> +arch/x86/include/asm/uaccess.h
> +
> +arch/x86/lib/usercopy_32.c
> +
> +mm/gup.c
> +
> +.. _mm-api-gfp-flags:
> +
> +内存分配控制
> +============
> +
> +该API在以下内核代码中:
> +
> +include/linux/gfp.h
> +
> +Slab缓存
> +========
> +
> +此缓存非cpu片上缓存，请读者自行查阅资料。
> +
> +该API在以下内核代码中:
> +
> +include/linux/slab.h
> +
> +mm/slab.c
> +
> +mm/slab_common.c
> +
> +mm/util.c
> +
> +虚拟连续（内存页）映射
> +======================
> +
> +该API在以下内核代码中:
> +
> +mm/vmalloc.c
> +
> +
> +文件映射和页面缓存
> +==================
> +
> +该API在以下内核代码中:
> +
> +mm/readahead.c
> +
> +mm/filemap.c
> +
> +mm/page-writeback.c
> +
> +mm/truncate.c
> +
> +include/linux/pagemap.h
> +
> +内存池
> +======
> +
> +该API在以下内核代码中:
> +
> +mm/mempool.c
> +
> +DMA池
> +=====
> +
> +DMA(Direct Memory Access，直接存储器访问)
> +
> +该API在以下内核代码中:
> +
> +mm/dmapool.c
> +
> +更多的内存管理函数
> +==================
> +
> +该API在以下内核代码中:
> +
> +mm/memory.c
> +
> +mm/page_alloc.c
> +
> +mm/mempolicy.c
> +
> +include/linux/mm_types.h
> +
> +include/linux/mm.h
> +
> +include/linux/mmzone.h
> 
