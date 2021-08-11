Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2DCC432BE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 12:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C14EF60F22
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 12:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238318AbhHKM0Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 08:26:16 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46205 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238337AbhHKMZO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 08:25:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id BD85C5C01A3;
        Wed, 11 Aug 2021 08:24:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 11 Aug 2021 08:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=L
        DVE8vQuo3/b4D1fp7wG+aU/0M79q5uZCrkMXpB/sC4=; b=aMQuC2y+loNMbpcgG
        Z4YB3HhybENR2ZjV4yORvvBsfSiAjXRhG/uRd5eH/SnY5mSdeHeSMWxON3XJ7GTx
        li3Syfg04KI81wSj6RmgBJl7BQLsO8GHQK/itqPNgzzvraj+30bRWGsalWpYhuIu
        XiQ7+ofxXe1A7xKNMmb4KyFQ7J40iWalDQfEzJJaKt2cAXZwGD9Sb6RqgMHx9MeS
        OFCHSDeFZbbKYqcSjoLvKwD3uRRXBhRJqqmVzAURNREBVEnrocjg2d0F7byZxuVc
        /BMBNJPxrLVfRJQpZAYJkmE1XUpWegGIw3OoenZPyinMrHQvcFgugq7WSfuwJAnH
        ynPkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=LDVE8vQuo3/b4D1fp7wG+aU/0M79q5uZCrkMXpB/s
        C4=; b=eLQ26k/KBDHYn5pUwoPNgyN/Sgsj5mjBiA5GXd+RATQVi4yye7blcdU2v
        9LTVpEwhStOyude5HDSNadzlXWx5ryeXvyknldBLz1vfjGImQET1APmzeclXbtgR
        M6aXHHgMIXDkxEcmkjfyPisOBAuEb/CVlgEkH4+75l9r22ln7EoPyniG8SReLG3p
        8BEF4H1yJuZbiKZZ/TK0T2Kadjw9D8AQkaKNs/QSwE52Yc8E+FV+GDLlzqgry1Ur
        AVUPrYsg5KiCqA/GigpEB6eB+5BlbTVilP63EkfOozh6blU1dTrq7ZaiNqwXGCim
        fcpllIvIW87wav4a6FxSTT6msK5zg==
X-ME-Sender: <xms:kMETYaRpZP7JxGzgynqUk4AavK2Ski52tKYNdgAp5Oy0P9E9xVHusg>
    <xme:kMETYfxu0Grn9iZi7JjnmQZ-5OX6-nIb3m-N4WvZbl8IrkEOFJ7Tmd9zMgg8jdaFu
    QG96ZE33bWlWgSwd8Y>
X-ME-Received: <xmr:kMETYX0BJo64aRn19NBVe6ACn-a3qTrSwwJVRAEWLAV3XUrV7V0r85fwRQqK8b4_9cU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedugdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:kMETYWBcpLUU_FaaS41tNWvmNDGOP9z3FkemkM8u3gn7L0UV_ru4qg>
    <xmx:kMETYThZvaY_Pl0iRqjSvmDBO42pkD3sp7XMWCa50gxPK4nbPBiAdw>
    <xmx:kMETYSrpTW0YEoqmwIUAbZtB73n4nHjIxfaUsiIUtu94tURUN490Sg>
    <xmx:ksETYTiwY3xdUnrYq5UNqNynriB3MPop761g71YouIJ1QiHxaE8zng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Aug 2021 08:24:44 -0400 (EDT)
Subject: Re: [PATCH v2 5/6] docs/zh_CN: add core-api boot-time-mm translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <cover.1625795862.git.siyanteng@loongson.cn>
 <223f4142aff4eba5ba7e4442cce77dd87591cc3a.1625795862.git.siyanteng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d67612cc-e396-25dd-bcc6-1129db8cf08d@flygoat.com>
Date:   Wed, 11 Aug 2021 20:24:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <223f4142aff4eba5ba7e4442cce77dd87591cc3a.1625795862.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2021/7/9 10:57, Yanteng Si 写道:
> Translate Documentation/core-api/boot-time-mm.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>   .../zh_CN/core-api/boot-time-mm.rst           | 49 +++++++++++++++++++
>   .../translations/zh_CN/core-api/index.rst     |  2 +-
>   2 files changed, 50 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> new file mode 100644
> index 000000000000..ba20dfed1017
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
> + 时奎亮<alexs@kernel.org>
> +
> +.. _cn_core-api_boot-time-mm:
> +
> +================
> +启动时的内存管理
> +================
> +
> +系统初始化早期不能使用“正常”的内存管理，只是因为它还没有被设置好。但是仍
> +然需要为各种数据结构分配内存，例如为物理页分配器分配内存。

系统初始化早期“正常”的内存管理由于没有设置完毕无法使用。但是内核仍然需要为各种数据结构分配内存，例如物理页分配器。 


> +
> +一个叫做 ``memblock`` 的专用分配器执行启动时的内存管理。特定架构的初始化
> +必须在setup_arch()中设置它，并在mem_init()函数中移除它。
> +
> +一旦早期的内存管理可用，它就为内存分配提供了各种函数和宏。分配请求可以指向
> +第一个（也可能是唯一的）节点或NUMA系统中的某个特定节点。有一些API变体在分
> +配失败时panic，也有一些不panic的。
^ 不会panic。
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

I think internal here means not facing memblock users, 内联函数注释 seems 
wired.

Thanks.

- Jiaxun

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
>      unaligned-memory-access
>      mm-api
>      genalloc
> +   boot-time-mm
>   
>   Todolist:
>   
> @@ -111,7 +112,6 @@ Todolist:
>      dma-attributes
>      dma-isa-lpc
>      pin_user_pages
> -   boot-time-mm
>      gfp_mask-from-fs-io
>   
>   内核调试的接口
