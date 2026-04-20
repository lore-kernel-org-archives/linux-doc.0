Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE143AE6FA;
	Mon, 20 Apr 2026 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776709658; cv=none; b=d0BjXdPCfZbz6km9ZCW53J1zyef+dFeMSZXudeVf9VgNeA6o80ez9CS7MmY9QcDC3+LgmN4NJhD6vebd5xC2ZKJtkNfmH21y5Z7ed/GFnjmKMVIrNMCpuJMbk9LTG0av7E/45b/3oAid2JHemXJGrXhJW0iAWLCbJSrIDVP5BnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776709658; c=relaxed/simple;
	bh=crdJxpMqnI0FctJec9g0X+pzhKKjposYgdqmd28MBlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uetnT7Iuv8nkTc+MAqUd4NCFAwEFEnoOPaf5oIf9x7yigDPq7UL/t15XwlCTsWh5i4tUY7u+Wh0+bVBe1GN9J8nzpB01sPejc6d9IUeGwNSjAbYffCAarFw4Ix+xWtpFNWsIEJAdULMKsTceXgytD7FpD6OSlaou/Vbb+J28lSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kaWAWf0K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kaWAWf0K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tLIX+xxXAjemUdxSYuHOuwKYeKdsGBn4WrCDh+lQ6mw=; b=kaWAWf0KMUTkQbFigTk+u+H8bm
	0fdGUmtJavbSvVWGggAzL5BiyMtURI1pMB2HaC4UCMrEAAzImymyNZnmlv19BNyh69epGlwMUVzW6
	FpoTE2a65d8UGLYwYb44iCZYqDoJIfRNQGlKciMyICkLlpU8JeQNzacE9hRTR4FQoF/TaeW//XNk2
	yFiCo8KQraXB3vwIMKCMssd+Q3GV/2E79ZZfd7KpzNrY0t6A/EvLEPawi9SUHsTEvuJGcRHjJh0gZ
	L87WP+nPgztOoAN2oUCeZfpHTK1ExYTIUeAIHfiE4dyqEWdXdTeNmq68Kt62uS0gtGz5u1Spr0T1J
	kjxYX3nw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEtL1-00000008rF3-3xNc;
	Mon, 20 Apr 2026 18:27:15 +0000
Date: Mon, 20 Apr 2026 19:27:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	osalvador@suse.de, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, hughd@google.com,
	baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] hugetlb: open-code hugetlb folio lookup index
 conversion
Message-ID: <aeZwAz6PcdlqSnJ2@casper.infradead.org>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-2-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-2-jane.chu@oracle.com>

On Thu, Apr 09, 2026 at 05:41:52PM -0600, Jane Chu wrote:
> This patch removes `filemap_lock_hugetlb_folio()` and open-codes
> the index conversion at each call site, making it explicit when
> hugetlb code is translating a hugepage index into the base-page index
> expected by `filemap_lock_folio()`

I think this is too large a piece to break off in a single patch.
The first thing I did was look at hugetlbfs_read_iter() and wonder
why we're not able to use generic_file_read_iter() here?  It used
to be necessary because we used to index the page cache in units
of hsize, but now we don't, it seems to me that we could use
generic_file_read_iter() instead.

Now, what hugetlbfs_read_iter() does have is support for hwpoison
handling.  I suspect this is something we want in
generic_file_read_iter(), it's just nobody's done it yet.

So perhaps that's patch 1 -- add hwpoison support to
generic_file_read_iter().  Then patch 2 removes hugetlbfs_read_iter() in
favour of using generic_file_read_iter().  

Patch 3 is purely this:
(and you can put my Reviewed-by on it).

> @@ -652,10 +652,10 @@ static void hugetlbfs_zero_partial_page(struct hstate *h,
>  					loff_t start,
>  					loff_t end)
>  {
> -	pgoff_t idx = start >> huge_page_shift(h);
> +	pgoff_t index = start >> PAGE_SHIFT; 
>  	struct folio *folio;
>  
> -	folio = filemap_lock_hugetlb_folio(h, mapping, idx);
> +	folio = filemap_lock_folio(mapping, index);
>  	if (IS_ERR(folio))
>  		return;
>  

Now for patch 4 ...

> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index a786034ac95c..38b39eaf46cc 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5724,7 +5724,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  	 * before we get page_table_lock.
>  	 */
>  	new_folio = false;
> -	folio = filemap_lock_hugetlb_folio(h, mapping, vmf->pgoff);
> +	folio = filemap_lock_folio(mapping, vmf->pgoff << huge_page_order(h));
>  	if (IS_ERR(folio)) {
>  		size = i_size_read(mapping->host) >> huge_page_shift(h);
>  		if (vmf->pgoff >= size)

This points to a horrible problem.  Everywhere else in the VM has
vmf->pgoff in PAGE_SIZE units, and of course hugetlb works in units of
hpagesize.  So this is an entirely different piece of work where we
convert vmf->pgoff to be in units of PAGE_SIZE.  That'll be fun!

> @@ -6208,7 +6208,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
>  
>  	if (is_continue) {
>  		ret = -EFAULT;
> -		folio = filemap_lock_hugetlb_folio(h, mapping, idx);
> +		folio = filemap_lock_folio(mapping, idx << huge_page_order(h));
>  		if (IS_ERR(folio))
>  			goto out;
>  		folio_in_pagecache = true;

This is a much smaller (more contained) problem.  At least idx is local
to this function, so you can calculate it using linear_page_index()
and modify the whole function.

Finally, you can delete filemap_lock_hugetlb_folio():

> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 9c098a02a09e..c64c6e5e50f5 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -829,12 +829,6 @@ static inline unsigned int blocks_per_huge_page(struct hstate *h)
>  	return huge_page_size(h) / 512;
>  }
>  
> -static inline struct folio *filemap_lock_hugetlb_folio(struct hstate *h,
> -				struct address_space *mapping, pgoff_t idx)
> -{
> -	return filemap_lock_folio(mapping, idx << huge_page_order(h));
> -}
> -
>  #include <asm/hugetlb.h>
>  
>  #ifndef is_hugepage_only_range
> @@ -1106,12 +1100,6 @@ static inline struct hugepage_subpool *hugetlb_folio_subpool(struct folio *folio
>  	return NULL;
>  }
>  
> -static inline struct folio *filemap_lock_hugetlb_folio(struct hstate *h,
> -				struct address_space *mapping, pgoff_t idx)
> -{
> -	return NULL;
> -}
> -
>  static inline int isolate_or_dissolve_huge_folio(struct folio *folio,
>  						struct list_head *list)
>  {
