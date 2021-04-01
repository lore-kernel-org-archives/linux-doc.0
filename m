Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D922C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:53:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AC00610C7
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhDAExZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDAEwu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:52:50 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64FD4C0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:52:50 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x126so536263pfc.13
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UhwdD2gO8nOO5tCisCra55ciclH3EOXOGC4jrUducKI=;
        b=cBNM4UsA6wOjik1bhm4Z2DOfIvD1YHDwV5/GAueU8WyRrXIrE70n5u146i0HNY51AB
         waxilslGigDVQ3kyRU5vHkiaAHjM7EuQA/93lxlw1NkQGgSYKDBARLyrtfYzhnK/ARUK
         NgatAGR3npqIcyDxb/TfWXPZp62u8BSClcbbZbztt/ZlSyWxt4+iYm0Qzj9H5h0SXNfW
         duy8O8GA10hHYhL8tgifNx0VgZLY/ifytpdvbBABUVpzSro7eL9u6pyKG0FzyFxeVR5T
         OU5vGrFK+FKg0wMjll6JYtOk+OP4NZyqykPL89bMY45eKmBZT4bmk4AF57STkvcbpv8K
         gDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UhwdD2gO8nOO5tCisCra55ciclH3EOXOGC4jrUducKI=;
        b=nYVGimWwBDMvcQAEoCYR7DsP7R7vIH5PgexhEgLtY/DJRwqggodNo+k1tYKBUpAIOU
         6Oj46tu6VEjr7SUE+3b6AVWzEa5eKJoWrcbWgZ+VJxERxY7rsai0wqa4fF8BnrJBmH6q
         fHeQ/oUTzAfnjdzrg7jz2onDMKRFE2cAbxIQxLYHj67VAyo52Ejm4LygeigBRmIdldRp
         wShu++NPBS/QBsOMMc6eX2u3njRsaZh5aD3cbyifKzYEdJTkJEV7oExCtzm8z1rtxahS
         owpiFtoZ1l5Xz0q6CUMT4ztRjpQ/nur0y8VAYKhb2naBpQH4mDrIEsHnrB4k4vJpvUxG
         Y+Aw==
X-Gm-Message-State: AOAM531XPjIfrKyl5CHqRc1UPlftBoAO/WXkvvIC4JVS5SR1DiatKjLt
        AWp3g/D5Obh9cNsGL/uVlNvriHfVbBB9Xw==
X-Google-Smtp-Source: ABdhPJxfiWm0esUmP9wlU/ltfTMgtdfgC2ZqOGnLaAunhkGIrS3r8ycKNt/eI8crQ8PAtz2laxrRXA==
X-Received: by 2002:a63:28c2:: with SMTP id o185mr2805556pgo.40.1617252770015;
        Wed, 31 Mar 2021 21:52:50 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id o197sm3960835pfd.42.2021.03.31.21.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:52:49 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] docs/zh_CN: add iio to zh_CN index
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-8-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <7a44c484-e12d-8b62-e4d1-0811d552e6d8@gmail.com>
Date:   Thu, 1 Apr 2021 12:52:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-8-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> All the files in the iio directory have been translated into
> Chinese and it is time to add them to the zh_CN index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 16641203dc88..51c50f319487 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -23,6 +23,7 @@
>     sound/index
>     cpu-freq/index
>     mips/index
> +   iio/index
>  
>  目录和表格
>  ----------
> 
