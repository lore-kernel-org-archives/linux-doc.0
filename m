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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E264C07E99
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 13:21:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CF2D61376
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 13:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbhGENX6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jul 2021 09:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGENX6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jul 2021 09:23:58 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1E7C061574
        for <linux-doc@vger.kernel.org>; Mon,  5 Jul 2021 06:21:20 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b8-20020a17090a4888b02901725eedd346so8853144pjh.4
        for <linux-doc@vger.kernel.org>; Mon, 05 Jul 2021 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QuPziLJuxrVToUIk8HVkZ3yr8nehjx/J+K9ryYCo9zU=;
        b=E79WjJlvHKWZaYZJ2TCyp7XGRLb7maMZJ6tPqrtSp3uCHs9CpVO9wiRKe9bobI5XLI
         6ltttaTqaupe/9j417UANOnaAmd730OkxdGSlUSdpX7r8TaKyTji/gh+iG2qVP11aYKk
         b/P6mnP6fCNJAyE637aw2J2m6xxg2EcQaDB2QJJnHsm2YUdhF5DeLyMRui4fsyqEE+aJ
         A+B4ACs4BIV7/ssuAk4N16VFH1FJId4GUPfi85wFqNaFrVKVKsruKWZLgoWwe7+LhCxF
         sdIQm4HPRO2qsmLpnGLR8y0Q+gZoPuDgEQmGl6EbJY/eYvPljZS+wQNoBitt/+6BLyuy
         wd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QuPziLJuxrVToUIk8HVkZ3yr8nehjx/J+K9ryYCo9zU=;
        b=AMa+L4F4UmzOogHR+L4WGhBCncRqlftFiGg8Dlvj7jg3Rxf3HHX4fPswePkxFHArAy
         kKi0HZcESL5Kqz2P7vV2U8Ln3YfmOG0TmNK1ut6HqnwlAGaKu/ICDCSMlfHlgYzK7Nw1
         0Hv5K3898Rw2eC+f4qWqeDCU315lVxLnagMHGitGuuHh20f/ckhMNNpVZnttzpHnlVtb
         J1Dw3lg/NOqCFY5DAZ/c9nZEXfM0Okv/I1s/zBsF91382WWJRCEzK5nPlg4/XVoTiI4y
         3ICqc4zPD9UftPH4JvxCcqaZYhJqKKJ22ZRSDcKUxmGHQcgz05mHFWX/vW87HpYw1c4M
         uu7A==
X-Gm-Message-State: AOAM53129SnMO0+ld69uDlrimR8vEESJIGQOrxiL7ajuHgY9n+U5XcT1
        XapYnBgBkqZ288ySTIwOoNc=
X-Google-Smtp-Source: ABdhPJxn3dhw4hJR+kV1cBRJL2Y8AeeYz6GyDctTUFRZoJrHSVMK+XrWtS20ExRuIDKrlaYd9N29Yw==
X-Received: by 2002:a17:902:aa49:b029:10d:22fa:13d4 with SMTP id c9-20020a170902aa49b029010d22fa13d4mr12440843plr.78.1625491280077;
        Mon, 05 Jul 2021 06:21:20 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id g17sm15187276pgh.61.2021.07.05.06.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 06:21:19 -0700 (PDT)
Subject: Re: [PATCH 5/6] docs/zh_CN: add core-api boot-time-mm translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
References: <cover.1625048200.git.siyanteng@loongson.cn>
 <cf5acd0694a2f9ed15630a9d3f719861c6939708.1625048200.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <a4d0d044-7d26-d515-3748-42d0d679a6e9@gmail.com>
Date:   Mon, 5 Jul 2021 21:21:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cf5acd0694a2f9ed15630a9d3f719861c6939708.1625048200.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 6/30/21 6:23 PM, Yanteng Si wrote:
> Translate Documentation/core-api/boot-time-mm.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/boot-time-mm.rst           | 49 +++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |  2 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> new file mode 100644
> index 000000000000..12a54ca503c3
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> @@ -0,0 +1,49 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/boot-time-mm.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +:校译:
> +
> +
> +
> +.. _cn_core-api_boot-time-mm:
> +
> +================
> +启动时的内存管理
> +================
> +
> +系统初始化早期不能使用“正常”的内存管理，只是因为它还没有被设置好。但是仍
> +然需要为各种数据结构分配内存，例如为物理页分配器分配内存。
> +
> +一个叫做 ``memblock`` 的专用分配器执行启动时的内存管理。特定架构的初始化
> +必须在setup_arch()中设置它，并在mem_init()函数中移除它。
> +
> +一旦早期的内存管理可用，它就为内存分配提供了各种函数和宏。分配请求可以指向
> +第一个（也可能是唯一的）节点或NUMA系统中的某个特定节点。有一些API变体在分
> +配失败时panic，也有一些不panic的。
> +
> +Memblock还提供了各种控制其自身行为的API。
> +
> +Memblock概述
> +============
> +
> +该API在以下内核代码中:
> +
> +mm/memblock.c
> +
> +
> +函数和结构体
> +============
> +
> +下面是关于memblock数据结构、函数和宏的描述。其中一些实际上是内部（内联函数注释）
> +的，但由于它们被记录下来，漏掉它们是很愚蠢的。此外，阅读内部函数的注释可以帮助理
> +解引擎盖下真正发生的事情。
> +
> +该API在以下内核代码中:
> +
> +include/linux/memblock.h
> +mm/memblock.c
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 1e8c5963c499..1d6fecd69c3b 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -103,6 +103,7 @@ Todolist:
>     unaligned-memory-access
>     mm-api
>     genalloc
> +   boot-time-mm
>  
>  Todolist:
>  
> @@ -111,7 +112,6 @@ Todolist:
>     dma-attributes
>     dma-isa-lpc
>     pin_user_pages
> -   boot-time-mm
>     gfp_mask-from-fs-io
>  
>  内核调试的接口
> 
