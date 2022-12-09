Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D61C10F1B
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiLIHDL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbiLIHCn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:02:43 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A141D72879
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 22:58:11 -0800 (PST)
Date:   Fri, 9 Dec 2022 14:57:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bkgrMzlsPFRRzM9bgo/Hh6SQM1suW4NADBdt3ME/t2U=;
        b=klWoXgzelKg7f55G8c6szQB4U/McHWUPLRIcTIppSgaV0Rb9DtAx5WdGrwOiI6Ppt1x8Qi
        3I/6LYmjcf5qtkvYElwCKwW+g46XITtz4XUm2lfWCSWbVqdMJD+JGQiaDYs5o0lC92RT2e
        /gJ9vQrReztjie80qkkGYcHXA0kIRZg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 02/13] docs/zh_CN: Update the translation of
 kernel-api to 6.1-rc8
Message-ID: <Y5LcbhDy1MP671k9@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <eaa8543341bb84acca37f8bdb16363a34b282da2.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaa8543341bb84acca37f8bdb16363a34b282da2.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit d28a1de5d112 ("math64: favor kernel-doc
> from header files").
> 
> Commit 03699f271de1 ("string: Rewrite and add more kern-doc
> for the str*() functions").
> Commit 31970608a6d3 ("overflow: Fix kern-doc markup for
> functions")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/core-api/kernel-api.rst         | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> index c22662679065..a4b373c48c0c 100644
> --- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> @@ -48,6 +48,8 @@ lib/string_helpers.c
>  
>  该API在以下内核代码中:
>  
> +include/linux/fortify-string.h
> +
>  lib/string.c
>  
>  include/linux/string.h
> @@ -119,6 +121,12 @@ include/linux/textsearch.h
>  Linux中的CRC和数学函数
>  ======================
>  
> +算术溢出检查
> +------------
> +
> +该API在以下内核代码中:
> +
> +include/linux/overflow.h
>  
>  CRC函数
>  -------
> @@ -166,8 +174,6 @@ include/asm-generic/div64.h
>  
>  include/linux/math64.h
>  
> -lib/math/div64.c
> -
>  lib/math/gcd.c
>  
>  UUID/GUID
> -- 
> 2.31.1
> 
