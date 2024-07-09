Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9A19D072
	for <linux-doc@vger.kernel.org>; Tue,  9 Jul 2024 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540596; cv=none; b=Nf8L98aFYv4uEO+9AuK3qES6MbKn6OSp/5cuJtTKRD6HToudiK1H6z4rBLw/ldt9XLxcNePtuwgrQ0fA0N0Y6SjX83wfJkYEPuMo0yZ935l7rTYca5ZNVyxdUW4ve2Ih9uMtfjIMLI0oWgD/3fROMo7Xj6g/z8Xk7KCVTKlouhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540596; c=relaxed/simple;
	bh=YsGddLcuzluGh1Z2I/0xBj1FmM9qYjQTWUTyhEnA6/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqlCS1bn1BAD6KjsyTFhigsziepFQr1j6YVBqR5/oGgmDRA3oEQ2Fq++ySyY5pVDjcBwdjHhv8+uO2QbQVALRjv2At+up1cep+1BEaDE3I0Z9PDSYlSX5cqE2AyBFQ+FNpbJq2XAx4tHnC9sNKnhDxL2OURBAtDZhM907NbFnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OT0ccOUf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OT0ccOUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720540593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xk2zHQ/YE20jgxtFEdO755E5YwPG0ZQdb2j69TcOV+0=;
	b=OT0ccOUf39JqCVdRo/IeydRiancwBscvv9ei3s0fsW3U6GYu/w+4JVAZOnIf1sfafIs3Mn
	g8+1T0BG5Pq9b7DX8ZXcUQPeKa86duz50TAscXSbKK09eXdFmw0Ci2wEo5TVX8u1XZl0o2
	2L2HTTSY5M4pDit5syRFLx+Cavylykw=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-F3vgJy4EMzO7bm7ZGuLxpw-1; Tue, 09 Jul 2024 11:56:32 -0400
X-MC-Unique: F3vgJy4EMzO7bm7ZGuLxpw-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3d62ad9f453so275281b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2024 08:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540592; x=1721145392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk2zHQ/YE20jgxtFEdO755E5YwPG0ZQdb2j69TcOV+0=;
        b=WrvDlABwvcqwbRv2jLd3ORNblv9iKZ2YQipkeOT8ZNRqxSY1h1hU9Bw9XSgL5zKX0B
         STzbqA31hKnxZeq1AUetnGpS9sq7oKyc1t8D6vmLdQS5Na8Dk1zvHRAMtUOtbiIsE8Ht
         G0iiMh3zVdP3ghq9xwczmF+vI+flyy2vlPkT5rP6YuvzMqmx4kMikCTbCYizp/RrQbSm
         RxrExazMt2iMG8vQoIIWPJ4EccPL3Ud94gKIWIsM0UMZdUeXKVwFFceZBoWxK5/i/SfT
         E7GHPgMe9qpNhkse0SQM+cyIy8Ez9A6q1LMgVWXsk1KnhVQg0ctzZCwLGD0qnqCCrIwm
         0zyg==
X-Forwarded-Encrypted: i=1; AJvYcCXk985gj7elcaq6DO8eFc8nHgL9N5G0JuJtLQodJm7g6d4FX2dHEJg7jVw3rCHjCkcytuXJXbrp9ZqJm2272NkxgKZHwkwjqNjT
X-Gm-Message-State: AOJu0Yxx8tvgxM5mBhcvgr5GL7h5XUJRRXXnS2yxuXh+3OwTZS+OY/+S
	w6vV2v746eql5I/VWV/u44Lt4JDwXyhpnKZZjddqJAEfX1UytBw0pfwvh53eoHixW3rK9uj8JDi
	5uo30sGST4dghBEYcCW/ecGS1hrBAs/iVZx5Ho1iBzQTS1qZVD/8MuHR19g==
X-Received: by 2002:a05:6808:148b:b0:3d9:2e1d:2543 with SMTP id 5614622812f47-3d93c0fe45amr2848537b6e.5.1720540590682;
        Tue, 09 Jul 2024 08:56:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Ma1rQrmj4Xg5pyldsO8p97ImEEKrUWOUqeogODHc73Oz0DxK2TC+nXJTsvBMv1FTSng1jg==
X-Received: by 2002:a05:6808:148b:b0:3d9:2e1d:2543 with SMTP id 5614622812f47-3d93c0fe45amr2848435b6e.5.1720540589482;
        Tue, 09 Jul 2024 08:56:29 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9b26f7bsm11708091cf.6.2024.07.09.08.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:56:29 -0700 (PDT)
Date: Tue, 9 Jul 2024 11:56:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 11/13] huge_memory: Remove dead vmf_insert_pXd code
Message-ID: <Zo1dqTPLn_gosrSO@x1n>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
 <400a4584f6f628998a7093aee49d9f86c592754b.1719386613.git-series.apopple@nvidia.com>
 <ZogCDpfSyCcjVXWH@x1n>
 <87zfqrw69i.fsf@nvdebian.thelocal>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zfqrw69i.fsf@nvdebian.thelocal>

On Tue, Jul 09, 2024 at 02:07:31PM +1000, Alistair Popple wrote:
> 
> Peter Xu <peterx@redhat.com> writes:
> 
> > Hi, Alistair,
> >
> > On Thu, Jun 27, 2024 at 10:54:26AM +1000, Alistair Popple wrote:
> >> Now that DAX is managing page reference counts the same as normal
> >> pages there are no callers for vmf_insert_pXd functions so remove
> >> them.
> >> 
> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> ---
> >>  include/linux/huge_mm.h |   2 +-
> >>  mm/huge_memory.c        | 165 +-----------------------------------------
> >>  2 files changed, 167 deletions(-)
> >> 
> >> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >> index 9207d8e..0fb6bff 100644
> >> --- a/include/linux/huge_mm.h
> >> +++ b/include/linux/huge_mm.h
> >> @@ -37,8 +37,6 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >>  		    pmd_t *pmd, unsigned long addr, pgprot_t newprot,
> >>  		    unsigned long cp_flags);
> >>  
> >> -vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
> >> -vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
> >>  vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
> >>  vm_fault_t dax_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
> >
> > There's a plan to support huge pfnmaps in VFIO, which may still make good
> > use of these functions.  I think it's fine to remove them but it may mean
> > we'll need to add them back when supporting pfnmaps with no memmap.
> 
> I'm ok with that. If we need them back in future it shouldn't be too
> hard to add them back again. I just couldn't find any callers of them
> once DAX stopped using them and the usual policy is to remove unused
> functions.

True.  Currently the pmd/pud helpers are only used in dax.

> 
> > Is it still possible to make the old API generic to both service the new
> > dax refcount plan, but at the meantime working for pfn injections when
> > there's no page struct?
> 
> I don't think so - this new dax refcount plan relies on having a struct
> page to take references on so I don't think it makes much sense to
> combine it with something that doesn't have a struct page. It sounds
> like the situation is the analogue of vm_insert_page()
> vs. vmf_insert_pfn() - it's possible for both to exist but there's not
> really anything that can be shared between the two APIs as one has a
> page and the other is just a raw PFN.

I still think most of the codes should be shared on e.g. most of sanity
checks, pgtable injections, pgtable deposits (for pmd) and so on.

To be explicit, I wonder whether something like below diff would be
applicable on top of the patch "huge_memory: Allow mappings of PMD sized
pages" in this series, which introduced dax_insert_pfn_pmd() for dax:

$ diff origin new
1c1
< vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
---
> vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
55,58c55,60
<       folio = page_folio(page);
<       folio_get(folio);
<       folio_add_file_rmap_pmd(folio, page, vma);
<       add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
---
>         if (page) {
>                 folio = page_folio(page);
>                 folio_get(folio);
>                 folio_add_file_rmap_pmd(folio, page, vma);
>                 add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
>         }

As most of the rest look very similar to what pfn injections would need..
and in the PoC of ours we're using vmf_insert_pfn_pmd/pud().

That also reminds me on whether it'll be easier to implement the new dax
support for page struct on top of vmf_insert_pfn_pmd/pud, rather than
removing the 1st then adding the new one.  Maybe it'll reduce code churns,
and would that also make reviews easier?

It's also possible I missed something important so the old function must be
removed.

Thanks,

-- 
Peter Xu

