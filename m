Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C215382E
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738231861; cv=none; b=WOjqn0xphuMiKuIPV8ntN1OD0vSggmRVPfu3aShCH5f6nHlFtll7uH+yUOv7DaE0AkeXtr3nBdokK7MJD3BWYKBf2Ob5rBsPpzqgAb/SSeD+Bjf75GQ26Q34wHvyoMDwn2jPtavqTpy4E8EO7TmQ2U0sr4Vb2cXlfy0gjXj/6QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738231861; c=relaxed/simple;
	bh=FOxakGp1iy3t3/mmXMPjOs/H6mrmZ7TwMof5TDybJRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4Z4HtglmLw5Q/WBV4uAPFfFUb+gD5uBF5krIoHNKdbJJOCza5ABcKKiLkFQ7lJf/zxZ0OSgEnmyy8tlVxxidVCsCDrheMl4fuC2EVLpu759BW7F2tuI4Jsm7W+Wz7YBRpFMv6tqgSxH9VZwF5ikYvHyehuoB/CeBQcLxa0t1RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Ct/Np1/G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ct/Np1/G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so6846575e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738231858; x=1738836658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93vOIonXuhhlCsVZNUEtlATNESA+m5aY8gZZwzqgor4=;
        b=Ct/Np1/Ge8hBke+t0BTrozVdu+6ezMa8Ezb3wnJ5q21I8V+CGgV4PaFcKu37uifHOt
         arfIzozySXcdI6wFkhYwrZMrnKWYj4nQHUoJ/Fq6wXA2M6IK10SUPUZSJepx9uu7xjRK
         ChLjxieruCgp+57W9uo2p6qkBeKZhxpUyoRnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738231858; x=1738836658;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93vOIonXuhhlCsVZNUEtlATNESA+m5aY8gZZwzqgor4=;
        b=TYJVfByUnGx4wp/dx0PLrykjyd4GvU/I/179ft9CN3ZFhDQAcMRzSvzXCZZ36gzG6r
         XMjQdvk4OafXE0JGzsPc9yYek/l78m4epVuPQmbFKe6azkOuDBc7VnI9E3eWB7FGVUZ0
         928Bu3dzWOMcwGhNTiMuhvYy1VrUkicFb+9GocF9N9Kp/0dEd7NQkJeK680XskyQc9+e
         v0yQyfZjoBL/uvIK6c5Zi/K+tw2BimFQxdc2lMBHX1Btnjfrcb6VLfVtYqrTdB65CUTP
         jx0ZavkOrR6cJMbYQGut4tfoTvjx6mQmc+ip5PDUi1IlK0q7sdZbNHTuB7ET+TO2tI+T
         NGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4MAP3eawPTCeoQXxj0tDDGG0xtVf53xkS2Ch1mvy5nCtE3e9trAXtk0SzSg0X0Zs2aKm26dG7kUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGmka9tfbTBa68OyN79MD70bLWO10ha2SxlxN/lHB37bGvN/qF
	9ZnuqOTzKociFUcn7qrEBnSRdoJ0IiXtxXNKf0RKtaH9aH/af9AWqdFuBHAcwgY=
X-Gm-Gg: ASbGncuDqoDRFXABsH5O4vwxR7GNW7Ab0spbomftbikS+sRuAsDNnXV4ObF+QAkOigo
	TqboxGIc54dk7pZ/kqDsmxjfArVxWeDuvyaFNaP2VdUFPqCgeY0AoRzrXDG+ShhsDMbbPvOe6mf
	oeHlc+rTsch69MZBSJa4i/8aezknIDG2oyqHU66rIf9ro7LGP0IgaK2KHJ4OsVRPRWx1V3BYvNq
	o/OrGi5kWwkKKO2IYq47wfuYHk+JVnRdW8xhx6kLdhyswx0+S5MKiRxz10pWVNXTwrYTrjkD7OI
	LlrIcMoh0DEmb2V1Xec9ZQCiSog=
X-Google-Smtp-Source: AGHT+IGJbnpeQf8B7cOXmXj6f06PfyU+GyWQpPIgeE+bqBElNwC7Ri+H94bg3ZkKWdVeU5p3l70P8w==
X-Received: by 2002:a05:600c:3501:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-438e2446708mr19019575e9.11.1738231858001;
        Thu, 30 Jan 2025 02:10:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81911sm52790125e9.38.2025.01.30.02.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 02:10:57 -0800 (PST)
Date: Thu, 30 Jan 2025 11:10:55 +0100
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
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
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
 <20250129115411.2077152-9-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-9-david@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> we can return with a device-exclusive entry from page_vma_mapped_walk().
> 
> try_to_unmap_one() is not prepared for that, so teach it about these
> non-present nonswap PTEs.
> 
> Before that, could we also have triggered this case with device-private
> entries? Unlikely.

Just quick comment on this, I'm still pondering all the other aspects.

device-private memory is entirely owned by the driver, the core mm isn't
supposed to touch these beyond migrating it back to system memory in
do_swap_page. Plus using rmap when the driver asks for invalidating
mappings as needed.

So no lru, thp, migration or anything initiated by core mm should ever
happen on these device private pages. If it does, it'd be a bug.

device-exclusive is entirely different ofc since that's just normal system
memory managed by core mm/.
-Sima
> 
> Note that we could currently only run into this case with
> device-exclusive entries on THPs. For order-0 folios, we still adjust
> the mapcount on conversion to device-exclusive, making the rmap walk
> abort early (folio_mapcount() == 0 and breaking swapout). We'll fix
> that next, now that try_to_unmap_one() can handle it.
> 
> Further note that try_to_unmap() calls MMU notifiers and holds the
> folio lock, so any device-exclusive users should be properly prepared
> for this device-exclusive PTE to "vanish".
> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/rmap.c | 53 ++++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 65d9bbea16d0..12900f367a2a 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1648,9 +1648,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> +	bool anon_exclusive, ret = true;
>  	pte_t pteval;
>  	struct page *subpage;
> -	bool anon_exclusive, ret = true;
>  	struct mmu_notifier_range range;
>  	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>  	unsigned long pfn;
> @@ -1722,7 +1722,19 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		/* Unexpected PMD-mapped THP? */
>  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>  
> -		pfn = pte_pfn(ptep_get(pvmw.pte));
> +		/*
> +		 * We can end up here with selected non-swap entries that
> +		 * actually map pages similar to PROT_NONE; see
> +		 * page_vma_mapped_walk()->check_pte().
> +		 */
> +		pteval = ptep_get(pvmw.pte);
> +		if (likely(pte_present(pteval))) {
> +			pfn = pte_pfn(pteval);
> +		} else {
> +			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
> +			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
> +		}
> +
>  		subpage = folio_page(folio, pfn - folio_pfn(folio));
>  		address = pvmw.address;
>  		anon_exclusive = folio_test_anon(folio) &&
> @@ -1778,7 +1790,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				hugetlb_vma_unlock_write(vma);
>  			}
>  			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> -		} else {
> +			if (pte_dirty(pteval))
> +				folio_mark_dirty(folio);
> +		} else if (likely(pte_present(pteval))) {
>  			flush_cache_page(vma, address, pfn);
>  			/* Nuke the page table entry. */
>  			if (should_defer_flush(mm, flags)) {
> @@ -1796,6 +1810,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			} else {
>  				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>  			}
> +			if (pte_dirty(pteval))
> +				folio_mark_dirty(folio);
> +		} else {
> +			pte_clear(mm, address, pvmw.pte);
>  		}
>  
>  		/*
> @@ -1805,10 +1823,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		 */
>  		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
>  
> -		/* Set the dirty flag on the folio now the pte is gone. */
> -		if (pte_dirty(pteval))
> -			folio_mark_dirty(folio);
> -
>  		/* Update high watermark before we lower rss */
>  		update_hiwater_rss(mm);
>  
> @@ -1822,8 +1836,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				dec_mm_counter(mm, mm_counter(folio));
>  				set_pte_at(mm, address, pvmw.pte, pteval);
>  			}
> -
> -		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
> +		} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
> +			   !userfaultfd_armed(vma)) {
>  			/*
>  			 * The guest indicated that the page content is of no
>  			 * interest anymore. Simply discard the pte, vmscan
> @@ -1902,6 +1916,12 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				set_pte_at(mm, address, pvmw.pte, pteval);
>  				goto walk_abort;
>  			}
> +
> +			/*
> +			 * arch_unmap_one() is expected to be a NOP on
> +			 * architectures where we could have non-swp entries
> +			 * here, so we'll not check/care.
> +			 */
>  			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
>  				swap_free(entry);
>  				set_pte_at(mm, address, pvmw.pte, pteval);
> @@ -1926,10 +1946,17 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			swp_pte = swp_entry_to_pte(entry);
>  			if (anon_exclusive)
>  				swp_pte = pte_swp_mkexclusive(swp_pte);
> -			if (pte_soft_dirty(pteval))
> -				swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -			if (pte_uffd_wp(pteval))
> -				swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			if (likely(pte_present(pteval))) {
> +				if (pte_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			} else {
> +				if (pte_swp_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_swp_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			}
>  			set_pte_at(mm, address, pvmw.pte, swp_pte);
>  		} else {
>  			/*
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
