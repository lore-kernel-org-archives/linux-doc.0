Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B344E3A960C
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769021061; cv=none; b=k3p64ACSJ7NHihYzadLVgWaS3NXeqm/DTixbPVFiaEC8EOsG7SGKjR3EJ9hlXHbz+voftY8Hh33a1LMZCCf/sEt0msaDso13DsjNi/gMZJEcshFBij5dYxoNrICfj9053HiH8q7QylCKz5D8PHMKSe2ais1cUYQgdXfopl/Y1HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769021061; c=relaxed/simple;
	bh=UbCjw8ssZKqQeQxBwGSnYqxZ4IcAgLQzF86UIoiyztA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHtr2S4wAYA3k+UUcFd+i6mwgyiyBLpSa8NMSgzjJ2kQGwM84V9fC99RWxHI9fwqdSMpkbxLmq5iQ0BCmk2HT+96QqKtvMt1rpAuBJPJ0je/lWenoJSUqgVGxv3U8sgvNzT/KP3vNeAIXQr+K/YeFBudXbZyOSsoMclbQK5+SiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Yobx9b/q; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=78Gec1+B; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Yobx9b/q; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=78Gec1+B; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Yobx9b/q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="78Gec1+B";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Yobx9b/q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="78Gec1+B"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90FE4336F7;
	Wed, 21 Jan 2026 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1769021056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i6ugDYYexV6tlXTntW5lrwN365JGB8kSnp3GfE2NxRw=;
	b=Yobx9b/qU+2xsltTGpMlbWRHGjIh8/EvBhQoQOErqZTeiSG/4c2u+EnMyOhDWvjvtrc23/
	DhdaQ/aRtGjfbaFpzwHUYt3HOb3ihqB4kqORbAM7EQHrXGVHSR5yzk2upFRMHnM1G/Vm/y
	45cGyh9mn6kwGMqdYIIOXOBCC8TYQu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1769021056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i6ugDYYexV6tlXTntW5lrwN365JGB8kSnp3GfE2NxRw=;
	b=78Gec1+B22YqNlEi+i5I6v/CgZgXFbmmGN61w+o4SBoWVoXyZXRpY03i56UNDu99R7Crrv
	KxHEYpNDvI3CHzBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="Yobx9b/q";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=78Gec1+B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1769021056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i6ugDYYexV6tlXTntW5lrwN365JGB8kSnp3GfE2NxRw=;
	b=Yobx9b/qU+2xsltTGpMlbWRHGjIh8/EvBhQoQOErqZTeiSG/4c2u+EnMyOhDWvjvtrc23/
	DhdaQ/aRtGjfbaFpzwHUYt3HOb3ihqB4kqORbAM7EQHrXGVHSR5yzk2upFRMHnM1G/Vm/y
	45cGyh9mn6kwGMqdYIIOXOBCC8TYQu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1769021056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i6ugDYYexV6tlXTntW5lrwN365JGB8kSnp3GfE2NxRw=;
	b=78Gec1+B22YqNlEi+i5I6v/CgZgXFbmmGN61w+o4SBoWVoXyZXRpY03i56UNDu99R7Crrv
	KxHEYpNDvI3CHzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B9B23EA63;
	Wed, 21 Jan 2026 18:44:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kUnzDIAecWmEZQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 21 Jan 2026 18:44:16 +0000
Message-ID: <bc7b8c62-a8b3-4407-a69f-30b3fd269566@suse.cz>
Date: Wed, 21 Jan 2026 19:44:15 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 00/14] mm: Eliminate fake head pages from vmemmap
 optimization
Content-Language: en-US
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260121162253.2216580-1-kas@kernel.org>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20260121162253.2216580-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,linux.dev,infradead.org,gmail.com,google.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[19];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 90FE4336F7
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On 1/21/26 17:22, Kiryl Shutsemau wrote:
> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.

We never got the definitive answer in the previous version discussions
whether it's worth to do this now with the upcoming memdesc stuff, right?

> Background
> ==========
> 
> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> and remapping the freed virtual addresses to a single physical page.
> Previously, all tail page vmemmap entries were remapped to the first
> vmemmap page (containing the head struct page), creating "fake heads" -
> tail pages that appear to have PG_head set when accessed through the
> deduplicated vmemmap.
> 
> This required special handling in compound_head() to detect and work
> around fake heads, adding complexity and overhead to a very hot path.

So a very stupid question, why did we remap everything to the first page,
and not instead create two pages, where the first one would contain the head
and the first batch of tails, and the second one would be used for the rest
of the tails? I'd expect it wouldn't make the memory savings that much
worse, and eliminate most of the issues?

> New Approach
> ============
> 
> For architectures/configs where sizeof(struct page) is a power of 2 (the
> common case), this series changes how position of the head page is encoded
> in the tail pages.
> 
> Instead of storing a pointer to the head page, the ->compound_info
> (renamed from ->compound_head) now stores a mask.
> 
> The mask can be applied to any tail page's virtual address to compute
> the head page address. Critically, all tail pages of the same order now
> have identical compound_info values, regardless of which compound page
> they belong to.
> 
> The key insight is that all tail pages of the same order now have
> identical compound_info values, regardless of which compound page they
> belong to. This allows a single page of tail struct pages to be shared
> across all huge pages of the same order on a NUMA node.
> 
> Benefits
> ========
> 
> 1. Simplified compound_head(): No fake head detection needed, can be
>    implemented in a branchless manner.
> 
> 2. Simplified page_ref_add_unless(): RCU protection removed since there's
>    no race with fake head remapping.
> 
> 3. Cleaner architecture: The shared tail pages are truly read-only and
>    contain valid tail page metadata.
> 
> If sizeof(struct page) is not power-of-2, there are no functional changes.
> HVO is not supported in this configuration.
> 
> I had hoped to see performance improvement, but my testing thus far has
> shown either no change or only a slight improvement within the noise.
> 
> Series Organization
> ===================
> 
> Patch 1: Preparation - move MAX_FOLIO_ORDER to mmzone.h
> Patches 2-4: Refactoring - interface changes, field rename, code movement
> Patch 5: Core change - new mask-based compound_head() encoding
> Patch 6: Correctness fix - page_zonenum() must use head page
> Patch 7: Add memmap alignment check for compound_info_has_mask()
> Patch 8: Refactor vmemmap_walk for new design
> Patch 9: Eliminate fake heads with shared tail pages
> Patches 10-13: Cleanup - remove fake head infrastructure
> Patch 14: Documentation update
> 
> Changes in v4:
> ==============
>   - Fix build issues due to linux/mmzone.h <-> linux/pgtable.h
>     dependency loop by avoiding including linux/pgtable.h into
>     linux/mmzone.h
> 
>   - Rework vmemmap_remap_alloc() interface. (Muchun)
> 
>   - Use &folio->page instead of folio address for optimization
>     target. (Muchun)
> 
> Changes in v3:
> ==============
>   - Fixed error recovery path in vmemmap_remap_free() to pass correct start
>     address for TLB flush. (Muchun)
> 
>   - Wrapped the mask-based compound_info encoding within CONFIG_SPARSEMEM_VMEMMAP
>     check via compound_info_has_mask(). For other memory models, alignment
>     guarantees are harder to verify. (Muchun)
> 
>   - Updated vmemmap_dedup.rst documentation wording: changed "vmemmap_tail
>     shared for the struct hstate" to "A single, per-node page frame shared
>     among all hugepages of the same size". (Muchun)
> 
>   - Fixed build error with MAX_FOLIO_ORDER expanding to undefined PUD_ORDER
>     in certain configurations. (kernel test robot)
> 
> Changes in v2:
> ==============
> 
> - Handle boot-allocated huge pages correctly. (Frank)
> 
> - Changed from per-hstate vmemmap_tail to per-node vmemmap_tails[] array
>   in pglist_data. (Muchun)
> 
> - Added spin_lock(&hugetlb_lock) protection in vmemmap_get_tail() to fix
>   a race condition where two threads could both allocate tail pages.
>   The losing thread now properly frees its allocated page. (Usama)
> 
> - Add warning if memmap is not aligned to MAX_FOLIO_SIZE, which is
>   required for the mask approach. (Muchun)
> 
> - Make page_zonenum() use head page - correctness fix since shared
>   tail pages cannot have valid zone information. (Muchun)
> 
> - Added 'const' qualifier to head parameter in set_compound_head() and
>   prep_compound_tail(). (Usama)
> 
> - Updated commit messages.
> 
> Kiryl Shutsemau (14):
>   mm: Move MAX_FOLIO_ORDER definition to mmzone.h
>   mm: Change the interface of prep_compound_tail()
>   mm: Rename the 'compound_head' field in the 'struct page' to
>     'compound_info'
>   mm: Move set/clear_compound_head() next to compound_head()
>   mm: Rework compound_head() for power-of-2 sizeof(struct page)
>   mm: Make page_zonenum() use head page
>   mm/sparse: Check memmap alignment for compound_info_has_mask()
>   mm/hugetlb: Refactor code around vmemmap_walk
>   mm/hugetlb: Remove fake head pages
>   mm: Drop fake head checks
>   hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
>   mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
>   mm: Remove the branch from compound_head()
>   hugetlb: Update vmemmap_dedup.rst
> 
>  .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
>  Documentation/mm/vmemmap_dedup.rst            |  62 ++--
>  include/linux/mm.h                            |  31 --
>  include/linux/mm_types.h                      |  20 +-
>  include/linux/mmzone.h                        |  47 +++
>  include/linux/page-flags.h                    | 167 +++++-----
>  include/linux/page_ref.h                      |   8 +-
>  include/linux/types.h                         |   2 +-
>  kernel/vmcore_info.c                          |   2 +-
>  mm/hugetlb.c                                  |   8 +-
>  mm/hugetlb_vmemmap.c                          | 300 ++++++++----------
>  mm/internal.h                                 |  12 +-
>  mm/mm_init.c                                  |   2 +-
>  mm/page_alloc.c                               |   4 +-
>  mm/slab.h                                     |   2 +-
>  mm/sparse-vmemmap.c                           |  44 ++-
>  mm/sparse.c                                   |   5 +
>  mm/util.c                                     |  16 +-
>  18 files changed, 369 insertions(+), 365 deletions(-)
> 

