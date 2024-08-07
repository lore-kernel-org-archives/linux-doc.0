Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25F145FE4
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723060969; cv=none; b=CuCSGbPxQWhQmmWfVsz/1kjmUo0upTWDB5t/Xvy1aHZ+2fh8Kvakc2jO379v3NJpbwm25rF00plyHnyLIInQf9WPDnGA83Bp7m0+1THnnmbOg6KptRFgSKS2Cmt9//fwgAKSrbELYHZL7AINqHikNQ6TzgPUnkUrxvoAGZnfQaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723060969; c=relaxed/simple;
	bh=loW4ytgswoIfwflAl9gmrh62vfKV9olE17s/r6GLh+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ru3n1McPhpv0CaRw+AOO6xOw9nFWwjaoJy4h0jFOnbxiSP6HAzXiwo2VV7o2YO9406xtPKdhy+sOhtvmLL308VCAW5CP1pKUiPH39NFlcdBq1U8+0ARuocLxq3UBdjPELX5ZUzQCCsBaBn7f8Ee94ngXYV8SS9krRT+epTYSTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=OEbqjA82; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="OEbqjA82"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5d5e1c86b83so160897eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 13:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1723060966; x=1723665766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+brkYlGx1yVizPmds0/xrvR0e4BjjJDeJcomNPr/5ig=;
        b=OEbqjA823YV/vkMXce/5bu2D8FXsDQojRBGZm4A1JTRpmAru/qEGZEAaDwhNA9oaAG
         RhMtH3buxRcJ02+9ep5sEIVVhNhDdqs4RMz6+Zda7SmD8NXxbmaWo+Th0qKtzMZMg1mv
         +uAVESh2Wz1TAl2KLJiqZosFAi7uFM1I5E5lzVoYm3v1IO9HYKe7I+pIyMOeSAxEAgCG
         BfurDcfDambxAKsrwS43xZNFu45pq6CntR2WK1p3X4u6G6woJtSptgVr43JQTncs+tek
         VLzNcG3tIKJ3B0JSUL3opMJOnYav59BdVfUMv+58jNhYKzzFXSp9QvEcvjXdWq2no6ZL
         Wx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723060966; x=1723665766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+brkYlGx1yVizPmds0/xrvR0e4BjjJDeJcomNPr/5ig=;
        b=JbSDsTUkujjJ+wMiML+inLMSJl9X/MhhJ4/1f+CBO6jXCBDAE3Uf4jua3+ZP+80AFY
         CCCGV2hAwtVz+bMkNHamYwb9IYuEw08QnfJDlGsUluAuUlqyTafzuI8EdGieCahshOyd
         F9JmrPXYmVL0FmwRyesC8Dw/N87N3UX6mGCCjj2GcnQVneP0E/RdJgw9lx1r67o3Gba3
         S92vnmHCeRWNYB60RiyMWodwpxkyLY6lqRyc1pl3FZoScH+Bm+Jca9FN7xS6MfxsVw+n
         Obzmnti5joGhnjuvbI/9/mI7ggLCyV5PjvuCngz4U5nofLgps0YbI1GoL2HsDqxet+3F
         7J5A==
X-Forwarded-Encrypted: i=1; AJvYcCWZyZ18lec0eg3d4RN1My+G9ZkzncF8ocwx1fEwlgKyD2gvounr75jfMETHGtsg9SzmUPiV7Dxk/O5vfUI7Ksk+IhHO+MjJdw7u
X-Gm-Message-State: AOJu0Yw7GfBj5YQw+1vRDYHpw8kQeluLDDsluGc7YiUTJP+q9hqIdKiX
	TJq7zWaCK+kOK9Zgzfz9+aOMGWAgTzCV7q9HwtDDHawG7w2MpxtODjIbD01SAz4=
X-Google-Smtp-Source: AGHT+IHm4lElGrpdy1ljKvesf4jnIf+MFP8g8N3ZxqP6Eg0GFYz2mWkRMbwWAscXaxzdAv4QdJpU/Q==
X-Received: by 2002:a05:6870:96a5:b0:261:515:d311 with SMTP id 586e51a60fabf-26891d3db7dmr23503501fac.18.1723060966402;
        Wed, 07 Aug 2024 13:02:46 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785e350asm88774785a.39.2024.08.07.13.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 13:02:45 -0700 (PDT)
Date: Wed, 7 Aug 2024 16:02:41 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, riel@surriel.com,
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yuzhao@google.com,
	david@redhat.com, baohua@kernel.org, ryan.roberts@arm.com,
	rppt@kernel.org, willy@infradead.org, cerasuolodomenico@gmail.com,
	corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com,
	Shuang Zhai <zhais@google.com>
Subject: Re: [PATCH v2 2/4] mm: remap unused subpages to shared zeropage when
 splitting isolated thp
Message-ID: <20240807200241.GB1828817@cmpxchg.org>
References: <20240807134732.3292797-1-usamaarif642@gmail.com>
 <20240807134732.3292797-3-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807134732.3292797-3-usamaarif642@gmail.com>

On Wed, Aug 07, 2024 at 02:46:47PM +0100, Usama Arif wrote:
> @@ -177,13 +177,56 @@ void putback_movable_pages(struct list_head *l)
>  	}
>  }
>  
> +static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
> +					  struct folio *folio,
> +					  unsigned long idx)
> +{
> +	struct page *page = folio_page(folio, idx);
> +	bool contains_data;
> +	pte_t newpte;
> +	void *addr;
> +
> +	VM_BUG_ON_PAGE(PageCompound(page), page);
> +	VM_BUG_ON_PAGE(!PageAnon(page), page);
> +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> +	VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
> +
> +	if (PageMlocked(page) || (pvmw->vma->vm_flags & VM_LOCKED))
> +		return false;
> +
> +	/*
> +	 * The pmd entry mapping the old thp was flushed and the pte mapping
> +	 * this subpage has been non present. If the subpage is only zero-filled
> +	 * then map it to the shared zeropage.
> +	 */
> +	addr = kmap_local_page(page);
> +	contains_data = memchr_inv(addr, 0, PAGE_SIZE);
> +	kunmap_local(addr);
> +
> +	if (contains_data || mm_forbids_zeropage(pvmw->vma->vm_mm))
> +		return false;
> +
> +	newpte = pte_mkspecial(pfn_pte(page_to_pfn(ZERO_PAGE(pvmw->address)),
> +					pvmw->vma->vm_page_prot));

Why not use my_zero_pfn() here? On many configurations this just
returns zero_pfn and avoids the indirection through mem_map.

> @@ -904,7 +958,7 @@ static int writeout(struct address_space *mapping, struct folio *folio)
>  	 * At this point we know that the migration attempt cannot
>  	 * be successful.
>  	 */
> -	remove_migration_ptes(folio, folio, false);
> +	remove_migration_ptes(folio, folio, false, false);

bool params are not great for callsite readability.

How about a flags parameter and using names?

enum rmp_flags {
	RMP_LOCKED	= 1 << 0,
	RMP_ZEROPAGES	= 1 << 1,
}
