Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865637EFE4
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240121; cv=none; b=lABdCp+wEjrMl8Gg5UrW4+gGfL975qxliEQVuVNJGRqC6z95b2NKXFjb4ocS62uMre6u25pVDKancd5l59DLTta/w6uRNsqGIddUJ5Wc8aioquQpHiVtadVGsn0n91d40BnrxFUWSjaOavPJ62AgT4aCLgXfHiLKZsTQ5uOlYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240121; c=relaxed/simple;
	bh=igLtVyB2zJWW8AUbWdnXu3YjtjliRmmSDboBf/GIirc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnFg/MlhcyxqlMF3T1CzPUabrF/u1t44ijjKIaH/q/VjtHPcmFR13tc95gMlt4dkOBJJajlRXZQI8DR4j8RUfO+xCOcCAFhCDvDPdnK6OvXCGJVn/SWrss7+9Kl2H8iUn4t/e7JXT0qWexuSGS8oW0QelM27g6U7r9oALVwKH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CLcWqVcJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6U64RHXM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1y+e3Gr+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CopcsibF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CLcWqVcJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6U64RHXM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1y+e3Gr+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CopcsibF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 364BB5BE0B;
	Wed, 15 Apr 2026 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776240112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=akN5Uu+otL7jpkoKju+WPDV2S3IuEX0eNSjfjFCNvqk=;
	b=CLcWqVcJ8h9lG3TjkVCHKEYzyv9XYd/dQ0OaXz4yOxNEWSJ3ZMQTrEv1X5jIFjpe3CIuX1
	BMXBopE3IVEEEmEcEPlB+K2wDqW6LIgpYcMul+rWBS3vfP938rPqBTFo7RXwyxmfJUE5w5
	cMiqD6f5N2kuo5k2Io5ytzH1W6f/ukI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776240112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=akN5Uu+otL7jpkoKju+WPDV2S3IuEX0eNSjfjFCNvqk=;
	b=6U64RHXM9iglHLh//cFd9OAT3tpP9SDjIt4AxM58I7ObJhrZxRMyTFsIC9iJ0TQ+EGDQpu
	7KD/oV6FADbMiOBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776240108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=akN5Uu+otL7jpkoKju+WPDV2S3IuEX0eNSjfjFCNvqk=;
	b=1y+e3Gr+sGjZq97lNRz7Y0mbkFWB3vGraS5HKPjSq0lHW+ALFBIBtg/H3tl9bDxJT31vTl
	fBscObtzWrgpZFIyGMw6VD8r449R8kfE9UWMl2rCemAjtXyAGyVNsfSM+xgmT+m6rmW1NN
	3lvkIJTqJvuhTbstVpYAczEAiO0JsBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776240108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=akN5Uu+otL7jpkoKju+WPDV2S3IuEX0eNSjfjFCNvqk=;
	b=CopcsibFGDiM272ncR2T6HKKzD2nZIpxLAuNWpkuLXkP+XUkvIupOzAdLqLfaGeyQd867B
	hEZMPAZRAxigx5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 733B04B8DB;
	Wed, 15 Apr 2026 08:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9w0HGutF32lzIAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 15 Apr 2026 08:01:47 +0000
Date: Wed, 15 Apr 2026 10:01:41 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] hugetlb: pass hugetlb reservation ranges in
 base-page indices
Message-ID: <ad9F5duupm8Rn-Yw@localhost.localdomain>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-7-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-7-jane.chu@oracle.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Thu, Apr 09, 2026 at 05:41:57PM -0600, Jane Chu wrote:
> hugetlb_reserve_pages() consume indices in hugepage granularity although
> some callers naturally compute offsets in PAGE_SIZE units.
> 
> Teach the reservation helpers to accept base-page index ranges and
> convert to hugepage indices internally before operating on the
> reservation map. This keeps the internal representation unchanged while
> making the API contract more uniform for callers.
> 
> Update hugetlbfs and memfd call sites to pass base-page indices, and
> adjust the documentation to describe the new calling convention. Add
> alignment warnings in hugetlb_reserve_pages() to catch invalid ranges
> early.
> 
> No functional changes.
> 
> Signed-off-by: Jane Chu <jane.chu@oracle.com>
> ---
>  Documentation/mm/hugetlbfs_reserv.rst | 12 +++++------
>  fs/hugetlbfs/inode.c                  | 29 ++++++++++++---------------
>  mm/hugetlb.c                          | 26 ++++++++++++++++--------
>  mm/memfd.c                            |  9 +++++----
>  4 files changed, 42 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/mm/hugetlbfs_reserv.rst b/Documentation/mm/hugetlbfs_reserv.rst
> index a49115db18c7..60a52b28f0b4 100644
> --- a/Documentation/mm/hugetlbfs_reserv.rst
> +++ b/Documentation/mm/hugetlbfs_reserv.rst
> @@ -112,8 +112,8 @@ flag was specified in either the shmget() or mmap() call.  If NORESERVE
>  was specified, then this routine returns immediately as no reservations
>  are desired.
>  
> -The arguments 'from' and 'to' are huge page indices into the mapping or
> -underlying file.  For shmget(), 'from' is always 0 and 'to' corresponds to
> +The arguments 'from' and 'to' are base page indices into the mapping or
> +underlying file. For shmget(), 'from' is always 0 and 'to' corresponds to
>  the length of the segment/mapping.  For mmap(), the offset argument could
>  be used to specify the offset into the underlying file.  In such a case,
>  the 'from' and 'to' arguments have been adjusted by this offset.
> @@ -136,10 +136,10 @@ to indicate this VMA owns the reservations.
>  
>  The reservation map is consulted to determine how many huge page reservations
>  are needed for the current mapping/segment.  For private mappings, this is
> -always the value (to - from).  However, for shared mappings it is possible that
> -some reservations may already exist within the range (to - from).  See the
> -section :ref:`Reservation Map Modifications <resv_map_modifications>`
> -for details on how this is accomplished.
> +always the number of huge pages covered by the range [from, to).  However,
> +for shared mappings it is possible that some reservations may already exist
> +within the range [from, to).  See the section :ref:`Reservation Map Modifications
> +<resv_map_modifications>` for details on how this is accomplished.
>  
>  The mapping may be associated with a subpool.  If so, the subpool is consulted
>  to ensure there is sufficient space for the mapping.  It is possible that the
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index a72d46ff7980..ec05ed30b70f 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -157,10 +157,8 @@ static int hugetlbfs_file_mmap_prepare(struct vm_area_desc *desc)
>  	if (inode->i_flags & S_PRIVATE)
>  		vma_flags_set(&vma_flags, VMA_NORESERVE_BIT);
>  
> -	if (hugetlb_reserve_pages(inode,
> -			desc->pgoff >> huge_page_order(h),
> -			len >> huge_page_shift(h), desc,
> -			vma_flags) < 0)
> +	if (hugetlb_reserve_pages(inode, desc->pgoff, len >> PAGE_SHIFT, desc,
> +				  vma_flags) < 0)

Ok, this is something that I have been thinking every time  I looked
into hugetlb reserve code, but I think we should be really starting to
put some meaningful names for from and to, and pass that to
hugetlb_reserve_pages.
Because "desc->pgoff" and "len >> PAGE_SHIFT", meh, and it is not that
many places we need to touch, but we might want in clarity.
The same goes for hugetlb_unreserve_pages() of course.

> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 47ef41b6fb2e..eb4ab5bd0c9f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6532,10 +6532,11 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
>  }
[...]
> @@ -6558,6 +6560,12 @@ long hugetlb_reserve_pages(struct inode *inode,
>  		return -EINVAL;
>  	}
>  
> +	VM_WARN_ON(!IS_ALIGNED(from, 1UL << huge_page_order(h)));
> +	VM_WARN_ON(!IS_ALIGNED(to,   1UL << huge_page_order(h)));

If we want to scream if someone passes us unaligned indices, we might
want to do the same in hugetlb_unreserve_pages() ?

> diff --git a/mm/memfd.c b/mm/memfd.c
> index 56c8833c4195..59c174c7533c 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -80,14 +80,15 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t index)
>  		struct inode *inode = file_inode(memfd);
>  		struct hstate *h = hstate_file(memfd);
>  		long nr_resv;
> -		pgoff_t idx;
> +		pgoff_t next_index;
>  		int err = -ENOMEM;
>  
>  		gfp_mask = htlb_alloc_mask(h);
>  		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
> -		idx = index >> huge_page_order(h);
> +		next_index = index + pages_per_huge_page(h); 

Trailing white space.


-- 
Oscar Salvador
SUSE Labs
