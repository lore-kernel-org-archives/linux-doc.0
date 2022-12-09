Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB66AC10F1B
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiLIHET (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiLIHDv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:03:51 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF9F36C66
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:01:09 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:01:00 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2GmnvnlaxMAvnZ1y9YXd4RndfwA9fEvIexjdwGfBdes=;
        b=tk6PBVG9fQYMjJ8/GsJ3RXaWmu2ue1KQnoUjgXlajijhLqfi7ND+VP4X59lQBM7nF/C3ef
        GozlV3G9Uxl2DG0UKLC9qFZ8szBVWr6/q1VAsN8Nj7prTZ/QghlyXxejt1nrf7y8ymr552
        t9LBOEeh97NqziOzzYSDJ2fCEefJLrE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 03/13] docs/zh_CN: Update the translation of mm-api to
 6.1-rc8
Message-ID: <Y5LdLIjC0PSbcb9g@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <0862de27ca80e3363bb970047d1cf90d058fedf8.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0862de27ca80e3363bb970047d1cf90d058fedf8.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit def76fd549c5 ("mm/page_alloc: remove
> obsolete gfpflags_normal_context()").
> 
> Commit 7343f2b0db49 ("headers/deps: mm: align
> MANITAINERS and Docs with new gfp.h structure")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Such minor path changes can be squashed.

> ---
>  Documentation/translations/zh_CN/core-api/mm-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
> index a732b0eebf16..113359bdb7be 100644
> --- a/Documentation/translations/zh_CN/core-api/mm-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
> @@ -37,7 +37,7 @@ mm/gup.c
>  
>  该API在以下内核代码中:
>  
> -include/linux/gfp.h
> +include/linux/gfp_types.h
>  
>  Slab缓存
>  ========
> -- 
> 2.31.1
> 
> 
> 
