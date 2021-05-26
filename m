Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D890CC47088
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 19:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5414613DC
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 19:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbhEZTvm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 May 2021 15:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33608 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234455AbhEZTvm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 May 2021 15:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622058609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s1/6uItuxoYyE47GHbWu3zlHXfIxxg+Z3u434C7Z3XM=;
        b=an7oAYoyjJ8QtC6JdXQuL3f8TWz2oeZubWMnF3vqsQqqp0cvXVaj8J+jvNoIPdhdmibArq
        Ry9tfnq7tyArefIUepaIX8HA0lAyU7oWEq6GcJ8pJcLTvgXpgSktqD+h6MrGcPSeMqqwk9
        xPsK3mDNg3hKbMxHKMLTc7b7C37YARI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-8Y_FqY0iPOWYY2YL1t3-_g-1; Wed, 26 May 2021 15:50:08 -0400
X-MC-Unique: 8Y_FqY0iPOWYY2YL1t3-_g-1
Received: by mail-qv1-f70.google.com with SMTP id h11-20020a0ceecb0000b0290211ed54e716so2129716qvs.9
        for <linux-doc@vger.kernel.org>; Wed, 26 May 2021 12:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s1/6uItuxoYyE47GHbWu3zlHXfIxxg+Z3u434C7Z3XM=;
        b=G5k5g+4kvEw4oAb8Tn9h0uGvpQt/Xh/kM6PxN8LxtoeFcsLrjtUHzfAQtBhM039fYX
         V5Tx/yfjcX6KMGgcJ15J71ZVLWO9M6v+Vb4MAP3zVwwyhwUreaKW5VRi3rWWmx6oVg/u
         pSiz4zyoR1M3Cuy+VaAGtJNGGGaz587rFJNtWLuPkwUUoXr4EHYHBnoAOELv9hOiosms
         dRuEyjKOnwS+lQu5vykfDfZ18N+RLJsN1OI8mrT8jqkE+fPsQMk9XMvZT7uqxzoZgYul
         Su+L2uDmxmWAhhJmdRjjedqPMaZGRjVbPq/3LyKQw8YyJYP5CHEMlud0z2IvC5KVm4E4
         DT1w==
X-Gm-Message-State: AOAM533SKrdAkhxfhC8LTvE2DjppacE0tTNiaprLlvZ38TdYv7ULmI8G
        6NSIZao4bXGwCKZABxz/JTm06AlPhueHsGrX8ibPGfV/lYeu5TVFgJRmVACVC83ECWRX0PTlsKX
        KGMFAvOazQgzuV6klBBMS
X-Received: by 2002:a37:7046:: with SMTP id l67mr43118525qkc.69.1622058607641;
        Wed, 26 May 2021 12:50:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDF9KrF9YeP9fDUebqEr4gYyhgflPp+V4B+WrCnnvB/WRyfJdS1hsUee111LHB9PSeDuPW8w==
X-Received: by 2002:a37:7046:: with SMTP id l67mr43118500qkc.69.1622058607342;
        Wed, 26 May 2021 12:50:07 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id g18sm2200678qke.37.2021.05.26.12.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:50:06 -0700 (PDT)
Date:   Wed, 26 May 2021 15:50:05 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        jhubbard@nvidia.com, bsingharora@gmail.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, jglisse@redhat.com, willy@infradead.org,
        jgg@nvidia.com, hughd@google.com
Subject: Re: [PATCH v9 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Message-ID: <YK6mbf967dV0ljHn@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-7-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524132725.12697-7-apopple@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 24, 2021 at 11:27:21PM +1000, Alistair Popple wrote:
> Currently if copy_nonpresent_pte() returns a non-zero value it is
> assumed to be a swap entry which requires further processing outside the
> loop in copy_pte_range() after dropping locks. This prevents other
> values being returned to signal conditions such as failure which a
> subsequent change requires.
> 
> Instead make copy_nonpresent_pte() return an error code if further
> processing is required and read the value for the swap entry in the main
> loop under the ptl.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> v9:
> 
> New for v9 to allow device exclusive handling to occur in
> copy_nonpresent_pte().
> ---
>  mm/memory.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 2fb455c365c2..e061cfa18c11 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  
>  	if (likely(!non_swap_entry(entry))) {
>  		if (swap_duplicate(entry) < 0)
> -			return entry.val;
> +			return -EAGAIN;
>  
>  		/* make sure dst_mm is on swapoff's mmlist. */
>  		if (unlikely(list_empty(&dst_mm->mmlist))) {
> @@ -974,11 +974,13 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  			continue;
>  		}
>  		if (unlikely(!pte_present(*src_pte))) {
> -			entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> -							dst_pte, src_pte,
> -							src_vma, addr, rss);
> -			if (entry.val)
> +			ret = copy_nonpresent_pte(dst_mm, src_mm,
> +						dst_pte, src_pte,
> +						src_vma, addr, rss);
> +			if (ret == -EAGAIN) {
> +				entry = pte_to_swp_entry(*src_pte);
>  				break;
> +			}
>  			progress += 8;
>  			continue;
>  		}

Note that -EAGAIN was previously used by copy_present_page() for early cow
use.  Here later although we check entry.val first:

	if (entry.val) {
		if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
			ret = -ENOMEM;
			goto out;
		}
		entry.val = 0;
	} else if (ret) {
		WARN_ON_ONCE(ret != -EAGAIN);
		prealloc = page_copy_prealloc(src_mm, src_vma, addr);
		if (!prealloc)
			return -ENOMEM;
		/* We've captured and resolved the error. Reset, try again. */
		ret = 0;
	}

We didn't reset "ret" in entry.val case (maybe we should?). Then in the next
round of "goto again" if "ret" is unluckily untouched, it could reach the 2nd
if check, and I think it could cause an unexpected page_copy_prealloc().

-- 
Peter Xu

