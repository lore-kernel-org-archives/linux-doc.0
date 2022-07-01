Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D705EC43334
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jul 2022 22:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbiGAW2M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Jul 2022 18:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbiGAW2L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jul 2022 18:28:11 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26A010FE
        for <linux-doc@vger.kernel.org>; Fri,  1 Jul 2022 15:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=1unUQEbFsF0sicNmeLCosHdK8jdWRKvPQ5wV4rgSgD8=; b=0dr0IFx3+gBaHCJYbuJYUiiQNs
        Nu5wex5V9Y30W5uL79uY/5gWI91IIqajeLXk7kitvDQ14dndkMQ5UDWqZMZS9W/DTCQYrcicGsatA
        n/CAhykKc92BIsXWBMI4FslTkdjgsM8QuRx2gooiK8RwGIl1DoDmgdIAgLgT6oTPkktizHzij6Ohs
        BHRgg9De3/vX1wtBQfV7HXUKgtQG7//BSuuLzuSLgeAiTzZpvpm/pGAHeDwN8MSVP4auNTsx7q1gd
        bgGd6dQ7CQhPDnUlFhV9uFCgGlvTpE5v008dTLaRbAY3rX1MwFrIuEdP5ujENB1ABPIgWxZSjCgLu
        gHT508zQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o7P7P-007Dk5-HW; Fri, 01 Jul 2022 22:28:07 +0000
Message-ID: <972639a2-4041-ae40-dd51-79d5f35b31c9@infradead.org>
Date:   Fri, 1 Jul 2022 15:28:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] doc/checkpatch: Add description to MACRO_ARG_REUSE
Content-Language: en-US
To:     Martin Fernandez <martin.fernandez@eclypsium.com>,
        linux-doc@vger.kernel.org
Cc:     dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com
References: <20220701222040.1471655-1-martin.fernandez@eclypsium.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220701222040.1471655-1-martin.fernandez@eclypsium.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 7/1/22 15:20, Martin Fernandez wrote:
> Add a description to the MACRO_ARG_REUSE check.
> 
> I feel like this is also a good place to put a workaround although I'm
> not sure if there is a cannonical way to solve those kinds of issues.

                         canonical


The usual way in the kernel is to declare a local _x and local _y (for your
example below).  See how it is done in include/linux/minmax.h for min_not_zero().
> 
> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index b52452bc2963..43fa99f188f5 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -759,6 +759,21 @@ Indentation and Line Breaks
>  Macros, Attributes and Symbols
>  ------------------------------
>  
> +  **ARG_REUSE**
> +    Using the same argument multiple times in the macro definition
> +    would lead to unwanted side-effects.
> +
> +    For example, given a `min` macro defined like::
> +
> +     #define min(x, y)  ((x) < (y) ? (x) : (y))
> +
> +    If you call it with `min(foo(x), 0)` would expand to::
> +
> +     foo(x) < 0 ? foo(x) : 0
> +
> +    If `foo` have side-effects or it's an expensive calculation the
> +    results might not be what the user inteded.

                                          intended.

> +
>    **ARRAY_SIZE**
>      The ARRAY_SIZE(foo) macro should be preferred over
>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an

thanks.
-- 
~Randy
