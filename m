Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B439D306B0A
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097378; cv=none; b=pYMZDhA4a4Q/CTUA3C1N0wQ3gQnbE4ifGdTPUBtkDsBL8gO4B6slnRe4Jk21J1wx1MqmLJK8kByJ4i1qgFDP2SAqBnFa7YEwctPx2Co7cPrFvvxWLOaQd+jts5Pi/MPGDr3UarjcRrgTrOpajznA+Rsm7Q0iIuZbpHc9HckGMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097378; c=relaxed/simple;
	bh=vCYXrKTQacGvzHt1BM5j8kNZWUoC8uJ/Zxu9m/AR3LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiLpfI8zQECtrpnFCdL6V9IP+GiX7asj6h+iStuA5WJYM7qLtH9oJBgNwg+qrYuMlcWrLWHV0lYZUCEFmCnpT1agKmRXqWIfU6I8wWb+sVzahCKFSWd5ztXI+IJm9EK9F5UHWepe1X4FcIq+uMEZK8ZUQm9loXnEgPzAo+gyAxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A28NYyPd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2QuI98n4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bRSHlpkZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qNcDcJav; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A28NYyPd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2QuI98n4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bRSHlpkZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qNcDcJav"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DBD035BD3E;
	Mon, 13 Apr 2026 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776097375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJywZqPScSCeelbGKYRa8WdXsgW84f3OfB827znek/w=;
	b=A28NYyPdZr59mvSUZVD7dcI9kCxwBBuqVJgGyDSWIVuCbpojmvQRbuf3yuQIT9SmDVvxsh
	R3FRCM/SEDnCcUilk6UymEWIycCdcr3U3BOk+45+4UGYNEToHnHv7vclxDis2aOm40J+qI
	xClATTVu0T9CVu6Ttlqkf3UK917EB5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776097375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJywZqPScSCeelbGKYRa8WdXsgW84f3OfB827znek/w=;
	b=2QuI98n4tBOsbq597cJ7xOmEnecZU8M67S1CiDHlV4baDyS6xwoA9kl85GcRgDsbmthdIk
	m5YYeFy4dyzyvqCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bRSHlpkZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qNcDcJav
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776097374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJywZqPScSCeelbGKYRa8WdXsgW84f3OfB827znek/w=;
	b=bRSHlpkZ9MJwpPz7DgnKDNJg3c9pMB7TckUNA/AKDnnZUqydX6lwJfnjLD8CG9ayyEUFm7
	iPmjZvUZfl7lRhzYwdJ+2pTa1gOcyrJze9M70VK/UqrkHuCSMV1xwvoJ9gi/9w1rdsPyqz
	DjIAVJ5WN4RyVEBJvPS7B+DXyboGYyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776097374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJywZqPScSCeelbGKYRa8WdXsgW84f3OfB827znek/w=;
	b=qNcDcJav7F5nEiAdg7Iy/+nFIdLbNeO+F8B9br4AUyJq2SMYzLt61zpt6eWWNyIv9EnrDr
	hCBHWBqZjuS9FCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 209FA4AF94;
	Mon, 13 Apr 2026 16:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D8LOBV4Y3WlqcQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 13 Apr 2026 16:22:54 +0000
Date: Mon, 13 Apr 2026 18:22:44 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] hugetlb: open-code hugetlb folio lookup index
 conversion
Message-ID: <ad0YVH4EVzi62yML@localhost.localdomain>
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
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,oracle.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DBD035BD3E

On Thu, Apr 09, 2026 at 05:41:52PM -0600, Jane Chu wrote:
> This patch removes `filemap_lock_hugetlb_folio()` and open-codes
> the index conversion at each call site, making it explicit when
> hugetlb code is translating a hugepage index into the base-page index
> expected by `filemap_lock_folio()`.  As part of that cleanup,
> it also uses a base-page index directly in `hugetlbfs_zero_partial_page()`,
> where the byte offset is already page-granular. Overall, the change
> makes the indexing model more obvious at the call sites and avoids
> hiding the huge-index to base-index conversion inside a helper.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Jane Chu <jane.chu@oracle.com>

It kind of funny that most of the patch is s/index/idx noise.
Checking mm/hugetlb* and fs/hugetlb/* we do have a mix of index/idx but
I would say that idx predominates, so I am ok with going with that one.

Acked-by: Oscar Salvador <osalvador@suse.de>


> ---
>  fs/hugetlbfs/inode.c    | 20 ++++++++++----------
>  include/linux/hugetlb.h | 12 ------------
>  mm/hugetlb.c            |  4 ++--
>  3 files changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index cd6b22f6e2b1..cf79fb830377 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -242,9 +242,9 @@ static ssize_t hugetlbfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	struct hstate *h = hstate_file(file);
>  	struct address_space *mapping = file->f_mapping;
>  	struct inode *inode = mapping->host;
> -	unsigned long index = iocb->ki_pos >> huge_page_shift(h);
> +	unsigned long idx = iocb->ki_pos >> huge_page_shift(h);
>  	unsigned long offset = iocb->ki_pos & ~huge_page_mask(h);
> -	unsigned long end_index;
> +	unsigned long end_idx;
>  	loff_t isize;
>  	ssize_t retval = 0;
>  
> @@ -257,10 +257,10 @@ static ssize_t hugetlbfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		isize = i_size_read(inode);
>  		if (!isize)
>  			break;
> -		end_index = (isize - 1) >> huge_page_shift(h);
> -		if (index > end_index)
> +		end_idx = (isize - 1) >> huge_page_shift(h);
> +		if (idx > end_idx)
>  			break;
> -		if (index == end_index) {
> +		if (idx == end_idx) {
>  			nr = ((isize - 1) & ~huge_page_mask(h)) + 1;
>  			if (nr <= offset)
>  				break;
> @@ -268,7 +268,7 @@ static ssize_t hugetlbfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		nr = nr - offset;
>  
>  		/* Find the folio */
> -		folio = filemap_lock_hugetlb_folio(h, mapping, index);
> +		folio = filemap_lock_folio(mapping, idx << huge_page_order(h));
>  		if (IS_ERR(folio)) {
>  			/*
>  			 * We have a HOLE, zero out the user-buffer for the
> @@ -307,10 +307,10 @@ static ssize_t hugetlbfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  				retval = -EFAULT;
>  			break;
>  		}
> -		index += offset >> huge_page_shift(h);
> +		idx += offset >> huge_page_shift(h);
>  		offset &= ~huge_page_mask(h);
>  	}
> -	iocb->ki_pos = ((loff_t)index << huge_page_shift(h)) + offset;
> +	iocb->ki_pos = ((loff_t)idx << huge_page_shift(h)) + offset;
>  	return retval;
>  }
>  
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
> @@ -6208,7 +6208,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
>  
>  	if (is_continue) {
>  		ret = -EFAULT;
> -		folio = filemap_lock_hugetlb_folio(h, mapping, idx);
> +		folio = filemap_lock_folio(mapping, idx << huge_page_order(h));
>  		if (IS_ERR(folio))
>  			goto out;
>  		folio_in_pagecache = true;
> -- 
> 2.43.5
> 

-- 
Oscar Salvador
SUSE Labs
