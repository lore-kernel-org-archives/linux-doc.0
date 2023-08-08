Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3CCC001B0
	for <linux-doc@archiver.kernel.org>; Tue,  8 Aug 2023 19:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjHHTOo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjHHTOI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Aug 2023 15:14:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCFAF3A0C
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 09:37:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A970262480
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 09:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2B5C433C7;
        Tue,  8 Aug 2023 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691486850;
        bh=ROEl+LHtlnf4o7FwwJZ50MuUwyacYxGtvdXbIPcbHh0=;
        h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
        b=bT2aoH93m7ySeW86mKRbKxL6B/GzJKlbdIfBsYOChaiesFJNlSUlBWWdJxQZhma9C
         xbPKi0XmWa/J0VRGKRshNb4ldrnU3u9VpdCm3V2qbUgbYUls5uVSe5DPUKPh0ihCf2
         gKKqBSb2R3CUZO0fEgqnFXo6UKd/Jc2VG6Gb3hJhRnpJww4XKKe013YyivyjCYnvHy
         Hx9qB06jsNB3CXIFY+IvgQKzgq+UfFKr6GuimCTJnRhOCKfitZt8b3PuqdFXPtOWHv
         il7dNBMrpxWabOBszpQ9lAYMe7W3+Lae0Tmn7xIxBCeFLSjGXHvFlRBWhM2Uzc0yx4
         ssfLxnCASH47Q==
Message-ID: <47355d72-837d-213a-b6b1-f202c753de80@kernel.org>
Date:   Tue, 8 Aug 2023 11:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        hawk@kernel.org, ilias.apalodimas@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: net: page_pool: de-duplicate the intro
 comment
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
References: <20230807210051.1014580-1-kuba@kernel.org>
From:   Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20230807210051.1014580-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 07/08/2023 23.00, Jakub Kicinski wrote:
> In commit 82e896d992fa ("docs: net: page_pool: use kdoc to avoid
> duplicating the information") I shied away from using the DOC:
> comments when moving to kdoc for documenting page_pool API,
> because I wasn't sure how familiar people are with it.
> 
> Turns out there is already a DOC: comment for the intro, which
> is the same in both places, modulo what looks like minor rewording.
> Use the version from Documentation/ but keep the contents with
> the code.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: hawk@kernel.org

Acked-by: Jesper Dangaard Brouer <hawk@kernel.org>


> CC: ilias.apalodimas@linaro.org
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org > ---
>   Documentation/networking/page_pool.rst | 18 ++----------------
>   include/net/page_pool/helpers.h        | 24 ++++++++++++------------
>   2 files changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/networking/page_pool.rst b/Documentation/networking/page_pool.rst
> index 68b82cea13e4..215ebc92752c 100644
> --- a/Documentation/networking/page_pool.rst
> +++ b/Documentation/networking/page_pool.rst
> @@ -4,22 +4,8 @@
>   Page Pool API
>   =============
>   
> -The page_pool allocator is optimized for the XDP mode that uses one frame
> -per-page, but it can fallback on the regular page allocator APIs.
> -
> -Basic use involves replacing alloc_pages() calls with the
> -page_pool_alloc_pages() call.  Drivers should use page_pool_dev_alloc_pages()
> -replacing dev_alloc_pages().
> -
> -API keeps track of in-flight pages, in order to let API user know
> -when it is safe to free a page_pool object.  Thus, API users
> -must call page_pool_put_page() to free the page, or attach
> -the page to a page_pool-aware objects like skbs marked with
> -skb_mark_for_recycle().
> -
> -API user must call page_pool_put_page() once on a page, as it
> -will either recycle the page, or in case of refcnt > 1, it will
> -release the DMA mapping and in-flight state accounting.
> +.. kernel-doc:: include/net/page_pool/helpers.h
> +   :doc: page_pool allocator
>   
>   Architecture overview
>   =====================
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 78df91804c87..94231533a369 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -8,23 +8,23 @@
>   /**
>    * DOC: page_pool allocator
>    *
> - * This page_pool allocator is optimized for the XDP mode that
> - * uses one-frame-per-page, but have fallbacks that act like the
> + * The page_pool allocator is optimized for the XDP mode that
> + * uses one frame per-page, but it can fallback on the
>    * regular page allocator APIs.
>    *
> - * Basic use involve replacing alloc_pages() calls with the
> - * page_pool_alloc_pages() call.  Drivers should likely use
> + * Basic use involves replacing alloc_pages() calls with the
> + * page_pool_alloc_pages() call.  Drivers should use
>    * page_pool_dev_alloc_pages() replacing dev_alloc_pages().
>    *
> - * API keeps track of in-flight pages, in-order to let API user know
> - * when it is safe to dealloactor page_pool object.  Thus, API users
> - * must call page_pool_put_page() where appropriate and only attach
> - * the page to a page_pool-aware objects, like skbs marked for recycling.
> + * API keeps track of in-flight pages, in order to let API user know
> + * when it is safe to free a page_pool object.  Thus, API users
> + * must call page_pool_put_page() to free the page, or attach
> + * the page to a page_pool-aware objects like skbs marked with
> + * skb_mark_for_recycle().
>    *
> - * API user must only call page_pool_put_page() once on a page, as it
> - * will either recycle the page, or in case of elevated refcnt, it
> - * will release the DMA mapping and in-flight state accounting.  We
> - * hope to lift this requirement in the future.
> + * API user must call page_pool_put_page() once on a page, as it
> + * will either recycle the page, or in case of refcnt > 1, it will
> + * release the DMA mapping and in-flight state accounting.
>    */
>   #ifndef _NET_PAGE_POOL_HELPERS_H
>   #define _NET_PAGE_POOL_HELPERS_H

Adjustments looks good to me :-)

--Jesoer
