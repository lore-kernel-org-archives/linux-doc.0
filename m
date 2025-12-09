Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141BA2F7442
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765304432; cv=none; b=hO76tik6q/gebiFu256JDSz69Rn/KJchAdZ5pjqP3GbandjZajTYTT2WogabwtYsn/KlkXoRbKAEhmCtucaCmqspcjPE4i99DR2GMc2eTn0aXgxwE/Vv4rqzVY04Csj3w3XK/hjIRXbJyePmsQchnn+O+H+0OayUDVWyxafbwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765304432; c=relaxed/simple;
	bh=9T4CnxIWAD60IQKZYVo0Ywa0C4OOcdz0mx7j1lo7js4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYbc7IESC1Tp2ASFk3KPHnkBPN089+VsWFNax03IjJoNmrSixLoW4H9ec6DLzWJLjhQAJzDp9XjNBF7WgoxfMZOm45g66oei6Ock0WEElApMkxmO2cGwnqKkkT7KaoyuF90lAVSlmGl2pZQxRzy2MpdWpoWSUaov5SmkcUw7Dwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1hK6OmGN; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1hK6OmGN"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so712a12.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 10:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765304428; x=1765909228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evmg9WyrD2HkygF7wnhCaOCmIVrkIj1I8JvCf7Jiv9o=;
        b=1hK6OmGNPPXDCR8umvi+eXjs1LKjs/GXSIYc1XnxIIUpPUFFxTdOT3MoLyA5r9F4sI
         rri1E/PUDSvZ6nAf+gZk/IJddFRqWQ+i0JzxIo9DWnlXO2EkA5UjY4Finwg9Cq/3eicR
         mo52MKeI/JZm+7m0CpD+3+gihijJHTs8jCF7gGCW1WiD7WdGguR8P7KVcDzmwBgZ7raF
         vH36/5WKpLvOFZRqEGoRo1+Sgb8xCKzNdLBXAano+FWWnMfHAbgcd0tKXVCxL4eYxr4h
         3szLhV+vsOraPFrGiW8gcAwfNZ4yBnx39MLBJGUphkWpQFR8y4oROIJp8fx+t37iy3Z7
         WFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765304428; x=1765909228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=evmg9WyrD2HkygF7wnhCaOCmIVrkIj1I8JvCf7Jiv9o=;
        b=jDfUe6beTMDdAHtJI1KTfp7tP4bW/pgQk1ScAlM9pIvt+DU/9LhLborJoGLw+J14jk
         xiN8mZjnVqpUBgRSY4Vm0wV5bYQpuhLKbWj27VezZxYikOc/yKXHi8BV6K30JXHpLkAn
         MOG1RDlUaRMMuqMDnBpZVMWkPOHdt9qb12pjGtBK+Nf8ZzHD1hoD+XSbT8Md2aMHU38n
         4CrZ74iP3JP79cyEuBbcPsy5NS1i/DN1m991wUp343JRm1QgvDHzbXvzeL9wdM0r0rHn
         zOFPAtXGmFjDVZ5YC4x+TksTQbX1nneXwTzAAPzs4dVa1yUJofX7Ix0wRYAZs2Es31Vs
         +6og==
X-Forwarded-Encrypted: i=1; AJvYcCVM1Vv5NjFVor06v5ktn7vXR0qG1Oy67AtYCl5eqNQQ9ykXSD0/rx5dTtu063PQyeSN9rfoKsUWFFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56ooKMknFHjX1JaUCrniKRs7l5mhuw99pTeKNA6OqFxJK5mju
	MuBqU72BdCSWOkNcwL3GLlYOZXqmNjH7NBqupvmGr8DyGI5JZKWxEi2SdB7aM84GRLU4CHCVIU/
	Ur4+DythDRo5hTBzDsGMeuIojrSC+WoeVHaojcYfz
X-Gm-Gg: AY/fxX41E5MtHMSGysZJgah/GDZvu8EBJsGvkdJQX9qSAQGCyZ6u31QEJOzpDDUF07L
	zFQwTJ533d/7Sdj8D1g2fauYVj4fSSh1m0Sbi+lhM3p/dsLN47rgnrLHoOI6/FWG/ixOJJMccbJ
	3WLw9Sp7fjwjH3x2+aNhjNC8syHYdEmZXoKbUTknFVpfpGwQsT1N/p+P/G2IVkmD/0+rELFQtM4
	t/EwyoIPxpvZtFf+lDNmIq17m+7qmKLxF/5KtBydS39hJ0dzoK8MGJ4R6C9POOCzHFuFdGd
X-Google-Smtp-Source: AGHT+IGua9KoMluY3zejeC3C4N+kgaL8dARViDU9ow5MyTiyFYNRtdVfy/9pEYEg+/C25U3TBmJkhcigAjHtb0SZb7k=
X-Received: by 2002:a05:6402:1602:b0:643:6984:ceea with SMTP id
 4fb4d7f45d1cf-6496c45ea0cmr74a12.13.1765304428077; Tue, 09 Dec 2025 10:20:28
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205194351.1646318-1-kas@kernel.org>
In-Reply-To: <20251205194351.1646318-1-kas@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 9 Dec 2025 10:20:14 -0800
X-Gm-Features: AQt7F2r1NndvV55ZUE81wu9xsLiEjLpVzmQRQozJzmow2POGkCNA76ncwaR0Tis
Message-ID: <CAPTztWaWnurc=9fOBpPO25JoZu6PHU6c7AYNJbE+xdWV4gwskA@mail.gmail.com>
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap optimization
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Usama Arif <usamaarif642@gmail.com>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 11:44=E2=80=AFAM Kiryl Shutsemau <kas@kernel.org> wr=
ote:
>
> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
>
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.
>
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
>
> New Approach
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> For architectures/configs where sizeof(struct page) is a power of 2 (the
> common case), this series changes how position of the head page is encode=
d
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
> This enables a key optimization: instead of remapping tail vmemmap
> entries to the head page (creating fake heads), we remap them to a
> shared, pre-initialized vmemmap_tail page per hstate. The head page
> gets its own dedicated vmemmap page, eliminating fake heads entirely.
>
> Benefits
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> 1. Smaller generated code. On defconfig, I see ~15K reduction of text
>    in vmlinux:
>
>    add/remove: 6/33 grow/shrink: 54/262 up/down: 6130/-21922 (-15792)
>
> 2. Simplified compound_head(): No fake head detection needed. The
>    function is now branchless for power-of-2 struct page sizes.
>
> 3. Eliminated race condition: The old scheme required synchronize_rcu()
>    to coordinate between HVO remapping and speculative PFN walkers that
>    might write to fake heads. With the head page always in writable
>    memory, this synchronization is unnecessary.
>
> 4. Removed static key: hugetlb_optimize_vmemmap_key is no longer needed
>    since compound_head() no longer has HVO-specific branches.
>
> 5. Cleaner architecture: The vmemmap layout is now straightforward -
>    head page has its own vmemmap, tails share a read-only template.
>
> I had hoped to see performance improvement, but my testing thus far has
> shown either no change or only a slight improvement within the noise.
>
> Series Organization
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Patches 1-3: Preparatory refactoring
>   - Change prep_compound_tail() interface to take order
>   - Rename compound_head field to compound_info
>   - Move set/clear_compound_head() near compound_head()
>
> Patch 4: Core encoding change
>   - Implement mask-based encoding for power-of-2 struct page
>
> Patches 5-6: HVO restructuring
>   - Refactor vmemmap_walk to support separate head/tail pages
>   - Introduce per-hstate vmemmap_tail, eliminate fake heads
>
> Patches 7-9: Cleanup
>   - Remove fake head checks from compound_head(), PageTail(), etc.
>   - Remove VMEMMAP_SYNCHRONIZE_RCU and synchronize_rcu() calls
>   - Remove hugetlb_optimize_vmemmap_key static key
>
> Patch 10: Optimization
>   - Implement branchless compound_head() for power-of-2 case
>
> Patch 11: Documentation
>   - Update vmemmap_dedup.rst to reflect new architecture
>
> Kiryl Shutsemau (11):
>   mm: Change the interface of prep_compound_tail()
>   mm: Rename the 'compound_head' field in the 'struct page' to
>     'compound_info'
>   mm: Move set/clear_compound_head() to compound_head()
>   mm: Rework compound_head() for power-of-2 sizeof(struct page)
>   mm/hugetlb: Refactor code around vmemmap_walk
>   mm/hugetlb: Remove fake head pages
>   mm: Drop fake head checks and fix a race condition
>   hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
>   mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
>   mm: Remove the branch from compound_head()
>   hugetlb: Update vmemmap_dedup.rst
>
>  .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
>  Documentation/mm/vmemmap_dedup.rst            |  62 ++---
>  include/linux/hugetlb.h                       |   3 +
>  include/linux/mm_types.h                      |  20 +-
>  include/linux/page-flags.h                    | 163 +++++-------
>  include/linux/page_ref.h                      |   8 +-
>  include/linux/types.h                         |   2 +-
>  kernel/vmcore_info.c                          |   2 +-
>  mm/hugetlb.c                                  |   8 +-
>  mm/hugetlb_vmemmap.c                          | 245 ++++++++----------
>  mm/hugetlb_vmemmap.h                          |   4 +-
>  mm/internal.h                                 |  11 +-
>  mm/mm_init.c                                  |   2 +-
>  mm/page_alloc.c                               |   4 +-
>  mm/slab.h                                     |   2 +-
>  mm/util.c                                     |  15 +-
>  16 files changed, 242 insertions(+), 311 deletions(-)
>
> --
> 2.51.2
>
>

I love this in general - I've always disliked the fake head
construction (though I understand the reason behind it).

However, it seems like you didn't add support to vmemmap_populate_hvo,
as far as I can tell. That's the function that is used to do HVO early
on bootmem (memblock) allocated 'gigantic' pages. So I think that
would break with this patch.

Could you add support there too? I don't think it would be hard to.
While at it, you could also do it for vmemmap_populate_hugepages to
support devdax :-)

- Frank
