Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684B3C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 15:34:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E75F60F70
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 15:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbhKLPg6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbhKLPg5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Nov 2021 10:36:57 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAA9C061766
        for <linux-doc@vger.kernel.org>; Fri, 12 Nov 2021 07:34:06 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id b11so6474441qvm.7
        for <linux-doc@vger.kernel.org>; Fri, 12 Nov 2021 07:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xrgHnzEuXdDQnDfAgVFJeYXWXU/wp4hergRrT9uknxk=;
        b=YS73mq9GAX47GV1Tsf0uXZhfamYp9oAAP4/sn6XnYKWBButpN58bewYuClCAhvbsx7
         2OilYsQd6++EVff4d/Uf80/g6t/mN4x4hY/UqapMnzQjyFaSTJPqPOt+0A1aKQ2VJD1o
         wdcx1pzuCLnDZfQJ5QcdYsgd61V31BgE3N1Wb68yNMYmRixtzHYfhxSSxYOfxDkwt706
         kNj5nV2Hpz2MgLGwRBolsQ8hj9VEy6/Vb6QUDIGPEM71390UqP6k/b3zPYQ8WboTiwjM
         rG/6yup165WRlvU6+1t5qSwEF/ZN8re/mxlvAbcX2CIU6genJ7KcSTrA0Sp9bxfLzz2H
         m16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xrgHnzEuXdDQnDfAgVFJeYXWXU/wp4hergRrT9uknxk=;
        b=ZFWIOBeppouHA9nSumUVB3jWc77wwl1WhBXO7bfLTDJJRSJQS+G508O3TEvHBOw9Wr
         fhKa0Z8P1QHdlO1VSARGQXgl2USnVuYObwVWBvFsiNMTNprpbJ6gMTFMaKck1iY4tIS8
         BjORaMYh8381YBvJKzbKY1KzEb0+9eogjwStD36YBjKTXPjzrBrX9dseHmR1HdPvciWd
         R94Ns/5uGw7mI8fSL3XI5+gtCtZSBSmfc5PWLpRXA4+ioIddePVHqr4aNiLfm69L293B
         3WB9CvMV7I6YUkbs3xRGqwrae3vUBlBqpGsYr3j/xBjOxwGKHTlhuO0Lv4CugqHH22+t
         V3RQ==
X-Gm-Message-State: AOAM531yEMF1EcWata4qeYrc4CDEadNFAHLZ9kHlagvB1gmlO8lE79m5
        o9q0kyDK0LKD8+a88nqjlk5xjA==
X-Google-Smtp-Source: ABdhPJzPucpGQXurj467junIVP7ueDppunByZw5QMjrA4NaqFxle4jwuOw8Xm+N1RCQgaFjgpnjv7Q==
X-Received: by 2002:a05:6214:250d:: with SMTP id gf13mr15263616qvb.39.1636731245689;
        Fri, 12 Nov 2021 07:34:05 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id m68sm2815075qkb.105.2021.11.12.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:34:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mlYZ2-0096x0-4k; Fri, 12 Nov 2021 11:34:04 -0400
Date:   Fri, 12 Nov 2021 11:34:04 -0400
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
Subject: Re: [PATCH v5 8/8] device-dax: compound devmap support
Message-ID: <20211112153404.GD876299@ziepe.ca>
References: <20211112150824.11028-1-joao.m.martins@oracle.com>
 <20211112150824.11028-9-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112150824.11028-9-joao.m.martins@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 12, 2021 at 04:08:24PM +0100, Joao Martins wrote:

> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index a65c67ab5ee0..0c2ac97d397d 100644
> +++ b/drivers/dax/device.c
> @@ -192,6 +192,42 @@ static vm_fault_t __dev_dax_pud_fault(struct dev_dax *dev_dax,
>  }
>  #endif /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
>  
> +static void set_page_mapping(struct vm_fault *vmf, pfn_t pfn,
> +			     unsigned long fault_size,
> +			     struct address_space *f_mapping)
> +{
> +	unsigned long i;
> +	pgoff_t pgoff;
> +
> +	pgoff = linear_page_index(vmf->vma, ALIGN(vmf->address, fault_size));
> +
> +	for (i = 0; i < fault_size / PAGE_SIZE; i++) {
> +		struct page *page;
> +
> +		page = pfn_to_page(pfn_t_to_pfn(pfn) + i);
> +		if (page->mapping)
> +			continue;
> +		page->mapping = f_mapping;
> +		page->index = pgoff + i;
> +	}
> +}
> +
> +static void set_compound_mapping(struct vm_fault *vmf, pfn_t pfn,
> +				 unsigned long fault_size,
> +				 struct address_space *f_mapping)
> +{
> +	struct page *head;
> +
> +	head = pfn_to_page(pfn_t_to_pfn(pfn));
> +	head = compound_head(head);
> +	if (head->mapping)
> +		return;
> +
> +	head->mapping = f_mapping;
> +	head->index = linear_page_index(vmf->vma,
> +			ALIGN(vmf->address, fault_size));
> +}

Should this stuff be setup before doing vmf_insert_pfn_XX?

In normal cases the page should be returned in the vmf and populated
to the page tables by the core code after all this is done. 

dax can't do that because of the refcount mess, but I would think the
basic ordering should be the same.

Jason
