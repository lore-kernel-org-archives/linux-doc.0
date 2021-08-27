Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0B6C4320A
	for <linux-doc@archiver.kernel.org>; Fri, 27 Aug 2021 16:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F29B360560
	for <linux-doc@archiver.kernel.org>; Fri, 27 Aug 2021 16:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhH0Q0p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Aug 2021 12:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhH0Q0n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Aug 2021 12:26:43 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA29AC0613D9
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 09:25:54 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id c10so7710685qko.11
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6UXnHWuhKzdu/oSUtPKlkCaxdX6yM9oY2hFSeSoJKFk=;
        b=MBKXEHmhUOxNCtbOpmWHL1bTGVLftX21Bc+ceHSSen0risnXXb2gF7W5nRFloJm1Mj
         LDmuW+oGvWNmNdbSmr9Cyobr4WdbmKIzdaO5fGSoOW0DaSgkigWZ0xCJHZxmnVFI+Key
         Mq7r/RuCT6tUX2SivKPGa0TiRSpYQ8oc4ipBmMJ4Rhzw4uFfPDS7uN9mRHzsjHBv27oX
         GfitSLhjYpVh7N8xsl0zmEUB9zuYyadeA1M+Tt4dCzVbAl40w+Q6gogENMI6RBkTAlU5
         xwM2imVS4i1d0tQS4T6Y+c9Giks7NFwLPOyzfEZdEsN4sq8t/24OeII55CeOMijLLvYe
         QsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UXnHWuhKzdu/oSUtPKlkCaxdX6yM9oY2hFSeSoJKFk=;
        b=VpuQY10HSPZbeVcUioHSj8N6KhnURE58beaKdNZchYMvwlIL61K+CtbqFSi7mq6AR8
         FP28Ggvdpva84mwRCrB5sABNJI6eb6jQRnRlHk2beXhDMrO2Vca0Sw8B2WkQ93lCfdm8
         AXkkfteSRqXFqF3rDCFLIougUZ3uU082Sz8eHjlsMOSd+mWYuAQZYs20BammA866holx
         0TAQbdKaQjj12+xgRk8ezEf3NkZ3r4/h2k6loYk2T36erDrhwgecmSKrJfgQN8oL8YKo
         lGe2AsZ1lZW7TRFC/z0Ilb8dkzLvMCjeuKnFwQo7lon/RyK8ZEk+e61OfqdoWrxwab7g
         7HGw==
X-Gm-Message-State: AOAM532RRzzPPoGGmASaS2Dqtxwxg9o/NHrX70eVuPMN2XP682ktOSyI
        4Zvu0UCioekmekTd866S7zLILw==
X-Google-Smtp-Source: ABdhPJzxYeFXuTHbMzxeNMezaNcAi/eCldZjs5Wu+hIW4J1zkBCfYUFDgsaQw27Tcf1kMf3qE5UBQg==
X-Received: by 2002:a37:a9d2:: with SMTP id s201mr9435593qke.132.1630081553947;
        Fri, 27 Aug 2021 09:25:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id j3sm4040399qti.4.2021.08.27.09.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 09:25:53 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mJefw-005jle-Kb; Fri, 27 Aug 2021 13:25:52 -0300
Date:   Fri, 27 Aug 2021 13:25:52 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/14] mm/gup: grab head page refcount once for group
 of subpages
Message-ID: <20210827162552.GK1200268@ziepe.ca>
References: <20210827145819.16471-1-joao.m.martins@oracle.com>
 <20210827145819.16471-9-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827145819.16471-9-joao.m.martins@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 27, 2021 at 03:58:13PM +0100, Joao Martins wrote:

>  #if defined(CONFIG_ARCH_HAS_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HUGEPAGE)
>  static int __gup_device_huge(unsigned long pfn, unsigned long addr,
>  			     unsigned long end, unsigned int flags,
>  			     struct page **pages, int *nr)
>  {
> -	int nr_start = *nr;
> +	int refs, nr_start = *nr;
>  	struct dev_pagemap *pgmap = NULL;
>  	int ret = 1;
>  
>  	do {
> -		struct page *page = pfn_to_page(pfn);
> +		struct page *head, *page = pfn_to_page(pfn);
> +		unsigned long next = addr + PAGE_SIZE;
>  
>  		pgmap = get_dev_pagemap(pfn, pgmap);
>  		if (unlikely(!pgmap)) {
> @@ -2252,16 +2265,25 @@ static int __gup_device_huge(unsigned long pfn, unsigned long addr,
>  			ret = 0;
>  			break;
>  		}
> -		SetPageReferenced(page);
> -		pages[*nr] = page;
> -		if (unlikely(!try_grab_page(page, flags))) {
> -			undo_dev_pagemap(nr, nr_start, flags, pages);
> +
> +		head = compound_head(page);
> +		/* @end is assumed to be limited at most one compound page */
> +		if (PageHead(head))
> +			next = end;
> +		refs = record_subpages(page, addr, next, pages + *nr);
> +
> +		SetPageReferenced(head);
> +		if (unlikely(!try_grab_compound_head(head, refs, flags))) {
> +			if (PageHead(head))
> +				ClearPageReferenced(head);
> +			else
> +				undo_dev_pagemap(nr, nr_start, flags, pages);
>  			ret = 0;
>  			break;

Why is this special cased for devmap?

Shouldn't everything processing pud/pmds/etc use the same basic loop
that is similar in idea to the 'for_each_compound_head' scheme in
unpin_user_pages_dirty_lock()?

Doesn't that work for all the special page type cases here?

Jason
