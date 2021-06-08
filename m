Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AE6C47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 675E861285
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhFHPVj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54089 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231173AbhFHPVj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 11:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623165585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dBLB4c6IVQivL3hkpAXNnbCJj11WTQNnSoK9+kBvh3Q=;
        b=THmGp8DQfuAspg7tyOXUhTM6qqqD+FSpIsCNnJkBRratxAwmqnbizMDJXW/mkusZyUTI+0
        Ito9fI/tVktpqrgBYefh6SrpUU0lxhGTRwViS8HiDaR+tijkBu/b+R43dKnAZlm+m/X5km
        BMjTkwz+FW4/KG6sje9twdIwM6qtFEk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-zAxFLMx1O6GC-ngO4Iv8ZQ-1; Tue, 08 Jun 2021 11:19:44 -0400
X-MC-Unique: zAxFLMx1O6GC-ngO4Iv8ZQ-1
Received: by mail-qv1-f72.google.com with SMTP id n3-20020a0cee630000b029020e62abfcbdso11803916qvs.16
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 08:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dBLB4c6IVQivL3hkpAXNnbCJj11WTQNnSoK9+kBvh3Q=;
        b=N6B0mMteBvZs0P9Kb1WmM7ORZmOSx+0GcQlBeVPPrXTJlvoCjZIrKfvC5D6SHTGGa4
         sN8gc9qhsVCIWUpnfst3OkXlKmI9oZlXIs8lgSB/LXkCektr6Z/iMmBzNvuDF8lhXIu5
         /RlS0i2sLTOPOmMSR/oiOqwb08RX8fX771bv7bMLo9RP9Ffu6lPK72leSW02zg0qcWnp
         VSUcWWICmdxydp2+o8UQMhsE7LULcvokXLluqVqcOdjAihNqX4xUPDSzySwM0a/LbYhr
         8hfoWD2V9fiClim2gkIMkM1OqRiNx1rFncfxBVUI0rQgAMcUCtDZ9Hz07ad0fwGWw4bs
         X/rQ==
X-Gm-Message-State: AOAM533xsBJI6xe36UT0/x2cV40EGHTzU8pv94eTAoW9kJkKhulT4mz2
        zHxNpicrwAwVhzd5JaxKXn5AFtt2XnyPdc0mdRZdRlg5lT+RPAD7YscICymu+oeYRkK9xO6UvnU
        oDa69BYABuJJ3adsaQvix
X-Received: by 2002:a37:62d6:: with SMTP id w205mr15381158qkb.194.1623165584072;
        Tue, 08 Jun 2021 08:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9tQ2FgzwPiUwvaf6IEdO0u/PAmzdBq3+c1YQavhbNJmHVlWELWivs0V26IRzx6TXY9Z2KvQ==
X-Received: by 2002:a37:62d6:: with SMTP id w205mr15381138qkb.194.1623165583888;
        Tue, 08 Jun 2021 08:19:43 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
        by smtp.gmail.com with ESMTPSA id z127sm600836qkb.98.2021.06.08.08.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:19:43 -0700 (PDT)
Date:   Tue, 8 Jun 2021 11:19:41 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        nouveau@lists.freedesktop.org, hughd@google.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, bskeggs@redhat.com, jgg@nvidia.com,
        shakeelb@google.com, jhubbard@nvidia.com, willy@infradead.org
Subject: Re: [PATCH v10 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Message-ID: <YL+KjaB4fCt/xodJ@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-7-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607075855.5084-7-apopple@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 07, 2021 at 05:58:51PM +1000, Alistair Popple wrote:
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
> v10:
> 
> Use a unique error code and only check return codes for handling.
> 
> v9:
> 
> New for v9 to allow device exclusive handling to occur in
> copy_nonpresent_pte().
> ---
>  mm/memory.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 2fb455c365c2..0982cab37ecb 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  
>  	if (likely(!non_swap_entry(entry))) {
>  		if (swap_duplicate(entry) < 0)
> -			return entry.val;
> +			return -EIO;
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
> +			if (ret == -EIO) {
> +				entry = pte_to_swp_entry(*src_pte);
>  				break;
> +			}
>  			progress += 8;
>  			continue;
>  		}
> @@ -1011,20 +1013,24 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	pte_unmap_unlock(orig_dst_pte, dst_ptl);
>  	cond_resched();
>  
> -	if (entry.val) {
> +	if (ret == -EIO) {
> +		VM_WARN_ON_ONCE(!entry.val);
>  		if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
>  			ret = -ENOMEM;
>  			goto out;
>  		}
>  		entry.val = 0;
> -	} else if (ret) {
> -		WARN_ON_ONCE(ret != -EAGAIN);
> +	} else if (ret ==  -EAGAIN) {
                          ^
                          |----------------------------- one more space here

>  		prealloc = page_copy_prealloc(src_mm, src_vma, addr);
>  		if (!prealloc)
>  			return -ENOMEM;
> -		/* We've captured and resolved the error. Reset, try again. */
> -		ret = 0;
> +	} else if (ret) {
> +		VM_WARN_ON_ONCE(1);
>  	}
> +
> +	/* We've captured and resolved the error. Reset, try again. */

Maybe better as:

      /*
       * We've resolved all error even if there is, reset error code and try
       * again if necessary.
       */

as it also covers the no-error path.  But I guess not a big deal..

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

> +	ret = 0;
> +
>  	if (addr != end)
>  		goto again;
>  out:
> -- 
> 2.20.1
> 

-- 
Peter Xu

