Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20491BC07A
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738233450; cv=none; b=XuMzstQmJWHqduB4qMU1mthr9Buuy55FOQGYLafaCuBdNNvQlmMh1kx9I7Nt7dHHecHCoyTgaohHcfPVv1sfYImS1zuTPuho9TpEHeAQJ8pPLxPtTESrJtzl0OGsuf2v/MIPmDl+UUE0KRqZLbgf0HyRhMpf4TK+Bili82jviWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738233450; c=relaxed/simple;
	bh=LBkaxS0eS0z0fTZwIg2rYi/HNLZ/1wJsA83n0vznLMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjfBW4o6vbn6+/T4+xBD7o/e8O5jmnLQxw6R+JFGWbb2rp0w/U6Li4Eed/Sd0t+T/lrEcV1vuC9WkEc49UhXEnJ/u6DvM8pwWhx0Y7fHvDoM2IDpEUwH7n1asujCq93B8TdXKGZKj4Y11ObGgzdY8MbENTOafubBnIG3iI/XKIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=R252UmBw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="R252UmBw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd730so4081305e9.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 02:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738233447; x=1738838247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyqvf2GtMB8eYUA6roFvIAKJ3MrPvA1f4ISzNSrvZw0=;
        b=R252UmBw1Cv0HjAsPmiYNN7YEtHbO5rJ9KeZ1ElGvufii/RNjQvmRWaie9zAfhhDWq
         zECt4xiM12A0ayjT3YzlL6N9HORhmXs5+Z8Vt1G9iV5t/DdbDOPbtuyr/z2gpP8Nu9i7
         rJyobwjz8pn31SHVcB8X4jz5p6dbORjOdt4t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233447; x=1738838247;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyqvf2GtMB8eYUA6roFvIAKJ3MrPvA1f4ISzNSrvZw0=;
        b=GTdJjlN3n4MViEEcM0feh9uheZeg4IynNX7DI1fhS2LhTVQxA2zwA1u+rKSO2Tb3Az
         xuvDdnLtfFuK7uDsbnEFXde2hVU/Ty53a3NMtdyM/46rFj3JocKLeYvfwbyEE+oliXOb
         6myN4Y4/4JCSJRLzKtWO+g+nKK6PO9U+4X1slGsRS9wCxniWLLtphWRxkH1gTk+7BokN
         mVBYkoE0kSl8yx6Q6xiZYy5C0imrSv98zXZwITO0NRwrEC7GeICQBfKAzPXCKfO3GHFX
         cOv/9aUSLTUiv36VdkvEWbXSQJizJEWLe3rqfuoDJq5yQjPstHoFwN8sIDkrJFbf137v
         pRgw==
X-Forwarded-Encrypted: i=1; AJvYcCVGGNX4wifZWfVeBtgUS7gsJb8c783uyXCllOj7a8yVdhlTlVnzr2goMaQYEmt6KPXjVXMhgSo2kZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgHvoAOme65h7cBJDbw7kQznYcqh1O11HzjYTZE4/83iHv4xh
	VDXiWHLjxIjgHdrT946lz8xCI4v0QWqqhQYgaYYKkTubc61Bminc7LF/6Nw8Qv0=
X-Gm-Gg: ASbGncshK2o2ey7JMJuzlurHt7tYzuriJLiEVSzlFEUuhCPrQVLWVrLwLvLAbIyglkx
	RiCcfRHqjM/34DZ0rraBnH7qvi8Ks78rcAG9WKcL/93nIkv/XwVOm5j2PTSXKc0wBIAuY/L9U/t
	tECDtrWI01wf6J1l6uNlnXxI2SMtmjr9XWw9f3LOuBtVVfC9GM9QEJQHvrR4R3De5f+9w+fH6MM
	bpfZUiyRCA3ddkT+PxWIVL3ObOrb7bFGyjm5KtKh/Sr2ucaDRLN3s8g+yJ/gWjEVh2VPptf+dzX
	pDR4M4kzxSAdhYewAbY7fmdGQK4=
X-Google-Smtp-Source: AGHT+IFg7SYWGB7s8CQ+QgL5BM/h37wU8TOAK/f2xIHq4oWzFN+REfQ6LxpHzU72JzdfiBY831Ddbw==
X-Received: by 2002:a05:600c:3ba7:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-438dc3fc40bmr54907245e9.22.1738233446986;
        Thu, 30 Jan 2025 02:37:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7aac93asm64284585e9.1.2025.01.30.02.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 02:37:24 -0800 (PST)
Date: Thu, 30 Jan 2025 11:37:22 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
Message-ID: <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-13-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-13-david@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 12:54:10PM +0100, David Hildenbrand wrote:
> Now that conversion to device-exclusive does no longer perform an
> rmap walk and the main page_vma_mapped_walk() users were taught to
> properly handle nonswap entries, let's treat device-exclusive entries just
> as if they would be present, similar to how we handle device-private
> entries already.

So the reason for handling device-private entries in rmap is so that
drivers can rely on try_to_migrate and related code to invalidate all the
various ptes even for device private memory. Otherwise no one should hit
this path, at least if my understanding is correct.

So I'm very much worried about opening a can of worms here because I think
this adds a genuine new case to all the various callers.

> This fixes swapout/migration of folios with device-exclusive entries.
> 
> Likely there are still some page_vma_mapped_walk() callers that are not
> fully prepared for these entries, and where we simply want to refuse
> !pte_present() entries. They have to be fixed independently; the ones in
> mm/rmap.c are prepared.

The other worry is that maybe breaking migration is a feature, at least in
parts. If thp constantly reassembles a pmd entry because hey all the
memory is contig and userspace allocated a chunk of memory to place
atomics that alternate between cpu and gpu nicely separated by 4k pages,
then we'll thrash around invalidating ptes to no end. So might be more
fallout here.
-Sima

> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 17 +----------------
>  mm/rmap.c   |  7 -------
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index db38d6ae4e74..cd689cd8a7c8 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -743,20 +743,6 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
>  
>  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
>  					   PageAnonExclusive(page)), folio);
> -
> -	/*
> -	 * No need to take a page reference as one was already
> -	 * created when the swap entry was made.
> -	 */
> -	if (folio_test_anon(folio))
> -		folio_add_anon_rmap_pte(folio, page, vma, address, RMAP_NONE);
> -	else
> -		/*
> -		 * Currently device exclusive access only supports anonymous
> -		 * memory so the entry shouldn't point to a filebacked page.
> -		 */
> -		WARN_ON_ONCE(1);
> -
>  	set_pte_at(vma->vm_mm, address, ptep, pte);
>  
>  	/*
> @@ -1628,8 +1614,7 @@ static inline int zap_nonpresent_ptes(struct mmu_gather *tlb,
>  		 */
>  		WARN_ON_ONCE(!vma_is_anonymous(vma));
>  		rss[mm_counter(folio)]--;
> -		if (is_device_private_entry(entry))
> -			folio_remove_rmap_pte(folio, page, vma);
> +		folio_remove_rmap_pte(folio, page, vma);
>  		folio_put(folio);
>  	} else if (!non_swap_entry(entry)) {
>  		/* Genuine swap entries, hence a private anon pages */
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 9e2002d97d6f..4acc9f6d743a 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2495,13 +2495,6 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	/* The pte is writable, uffd-wp does not apply. */
>  	set_pte_at(mm, addr, fw.ptep, swp_pte);
>  
> -	/*
> -	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
> -	 * does not count as a mapping (mapcount), which is wrong and must be
> -	 * fixed, otherwise RMAP walks don't behave as expected.
> -	 */
> -	folio_remove_rmap_pte(folio, page, vma);
> -
>  	folio_walk_end(&fw, vma);
>  	*foliop = folio;
>  	return page;
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
