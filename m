Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62A2C21E8
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102233; cv=none; b=cY0Lrmw9r4SkUr8buUNrHySVUOsVnTtvzPQAud00nb81jtHaj/O3iq8hA2yhyvcqpJjQrD7AN9XuKM3tJa+xy+I6/0DMHtknnTTPTa/sUzobY4fsIhddJTEVhjLzMtIhvK30/rWuJJfYd7pELHVgN1lr+4BTvuuTcIL71jn5snE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102233; c=relaxed/simple;
	bh=OWh6Iy4XfNTies9wq3TbzgRs8JIbiD8NP3kbexXVSI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUo8OOD3O8GcngYRFkas3zb8DOHriz+d+Rf5Ou7v/LYWbGeKRd6SohdHGLZsshVzPeEMmb5WLG3iCH8P6SRD+8dN2CchNFUmTui4Bwp+RWncA6mDFXjHRXfTcHam8yBMAbQ3aB2lrSBItf9rqt4rV/JgMiCuM30auGDYpYRH42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cKwV1QYz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rQe3Mkfb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cKwV1QYz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rQe3Mkfb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cKwV1QYz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rQe3Mkfb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cKwV1QYz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rQe3Mkfb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B60BD5BD3E;
	Mon, 13 Apr 2026 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776102230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=cKwV1QYz1GSOpXcoJnqcN01IEtlRs793+honbozuKFEC8VyeP3SkJtPP6t/oQgHWclBGM0
	FUCX939RJ7zw0DgJeXe+G+xkHhqvaWcJ7pEWBC3PYuOGlO7XKwHIyofmhEImtDJUEcALkL
	Sad0YRziyKt2CAt8eSsneiA9W1NChSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776102230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=rQe3Mkfb+UKAwYCDfjjuovY8Tr3CSJ19JO19jRWk3nIYkSYZoNgvHRHHWscAB3C3xgCGxG
	aedN/zUVhwMAMDBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776102230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=cKwV1QYz1GSOpXcoJnqcN01IEtlRs793+honbozuKFEC8VyeP3SkJtPP6t/oQgHWclBGM0
	FUCX939RJ7zw0DgJeXe+G+xkHhqvaWcJ7pEWBC3PYuOGlO7XKwHIyofmhEImtDJUEcALkL
	Sad0YRziyKt2CAt8eSsneiA9W1NChSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776102230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=rQe3Mkfb+UKAwYCDfjjuovY8Tr3CSJ19JO19jRWk3nIYkSYZoNgvHRHHWscAB3C3xgCGxG
	aedN/zUVhwMAMDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEFE14AFE5;
	Mon, 13 Apr 2026 17:43:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DCwUOFUr3Wm0QAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 13 Apr 2026 17:43:49 +0000
Date: Mon, 13 Apr 2026 19:43:44 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] hugetlb: make hugetlb_fault_mutex_hash() take
 PAGE_SIZE index
Message-ID: <ad0rUB4FuNUOJ1pN@localhost.localdomain>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-4-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-4-jane.chu@oracle.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email]
X-Spam-Flag: NO

On Thu, Apr 09, 2026 at 05:41:54PM -0600, Jane Chu wrote:
> hugetlb_fault_mutex_hash() is used to serialize faults and page cache
> operations on the same hugetlb file offset. The helper currently expects
> its index argument in hugetlb page granularity, so callers have to
> open-code conversions from the PAGE_SIZE-based indices commonly used
> in the rest of MM helpers.
> 
> Change hugetlb_fault_mutex_hash() to take a PAGE_SIZE-based index
> instead, and perform the hugetlb-granularity conversion inside the helper.
> Update all callers accordingly.
> 
> This makes the helper interface consistent with filemap_get_folio(),
> and linear_page_index(), while preserving the same lock selection for
> a given hugetlb file offset.
> 
> Signed-off-by: Jane Chu <jane.chu@oracle.com>
> ---
>  fs/hugetlbfs/inode.c | 19 ++++++++++---------
>  mm/hugetlb.c         | 28 +++++++++++++++++++---------
>  mm/memfd.c           | 11 ++++++-----
>  mm/userfaultfd.c     |  7 +++----
>  4 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index cf79fb830377..e24e9bf54e14 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -575,7 +575,7 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
>  	struct address_space *mapping = &inode->i_data;
>  	const pgoff_t end = lend >> PAGE_SHIFT;
>  	struct folio_batch fbatch;
> -	pgoff_t next, index;
> +	pgoff_t next, idx;
>  	int i, freed = 0;
>  	bool truncate_op = (lend == LLONG_MAX);
>  
> @@ -586,15 +586,15 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
>  			struct folio *folio = fbatch.folios[i];
>  			u32 hash = 0;
>  
> -			index = folio->index >> huge_page_order(h);
> -			hash = hugetlb_fault_mutex_hash(mapping, index);
> +			hash = hugetlb_fault_mutex_hash(mapping, folio->index);
>  			mutex_lock(&hugetlb_fault_mutex_table[hash]);
>  
>  			/*
>  			 * Remove folio that was part of folio_batch.
>  			 */
> +			idx = folio->index >> huge_page_order(h);
>  			remove_inode_single_folio(h, inode, mapping, folio,
> -						  index, truncate_op);
> +						  idx, truncate_op);

Since this is the only place we call remove_inode_single_folio(), and that we do not
the index (at least index >> huge_page_order()) directly in this function, would it not be
better to make remove_inode_single_folio do the conversion itself? 

Also, I am thinking out loud here but we do have a few places where we
go: idx = index >> huge_page_order() to convert it into hugepage units, but the casual
reader might be a bit puzzled about that.
So, would it be worth to have implement an inline helper with an accurate name
to do that? It might help whoever reads that?


-- 
Oscar Salvador
SUSE Labs
