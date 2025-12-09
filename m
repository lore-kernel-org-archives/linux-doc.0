Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3438C1A76BB
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261391; cv=none; b=V0gB3YLCf8eeyNXtUDPynxELKhGzSORStq0FI+tRprZuP1pH5LmjTNxPUxjJezLbNnhFMiY7XcPOaU00TI4qeotOrE9s/s2J6KGhgYv+40i6eRR9svrqHIio6BMmdiDEPXPR806/Ch/NjR+Nu6hJeJB0N6Mdv0TAu9Ec1yGpYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261391; c=relaxed/simple;
	bh=spciGeuFYlBbM+Y01ChY+8U9WrcgyB4iPUKAI170zK4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PMBiGc/carMBtB63b3a3d15L+V+0BBtYRO84FtZoMF/B/2zPEasyATlQ5cSWvNYIiECB7PaD0LT1G+jb1ZA0NTgPbUebmoMTxPm6oEI5HyTR4Ab/ahmDGA5/TxMQ5hc98N2tBLsDJ3T0gglhpCRPAKC4n8bZeZp+cmb8rFWyeyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VC4Ypqef; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VC4Ypqef"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765261386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CLk45ra1fYgW55XvsXvXAF/BHCLHprBL2qMpGLAoh8=;
	b=VC4YpqefvEcJ6O+lIz39BT2VJbG3iP8kR+GpykLM3b8sfIy5MUjYXdk8kjZtCVXWnBbRCc
	U62fruicHGgyRSiywIAPRAhaCy0D2UbJgFOjXMl/vu362KK5Egk8J8VEz74ORbWXB19jWz
	pfNkHiewwrFs+mYVNGf0wrnZxjQa1kE=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251205194351.1646318-1-kas@kernel.org>
Date: Tue, 9 Dec 2025 14:22:28 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Usama Arif <usamaarif642@gmail.com>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <4F9E5F2F-4B4D-4CE2-929D-1D12B1DB44F8@linux.dev>
References: <20251205194351.1646318-1-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 6, 2025, at 03:43, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.

Besides, the code simplification also looks good.

> 
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
> 
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
> This enables a key optimization: instead of remapping tail vmemmap
> entries to the head page (creating fake heads), we remap them to a
> shared, pre-initialized vmemmap_tail page per hstate. The head page
> gets its own dedicated vmemmap page, eliminating fake heads entirely.

A very interesting approach.

The prerequisite is that the starting address of vmemmap must be aligned to
16MB boundaries (for 1GB huge pages). Right? We should add some checks
somewhere to guarantee this (not compile time but at runtime like for KASLR).

> 
> Benefits
> ========
> 
> 1. Smaller generated code. On defconfig, I see ~15K reduction of text
>   in vmlinux:
> 
>   add/remove: 6/33 grow/shrink: 54/262 up/down: 6130/-21922 (-15792)
> 
> 2. Simplified compound_head(): No fake head detection needed. The
>   function is now branchless for power-of-2 struct page sizes.

And it is also a common approach as well for DAX to eliminate an
additional tail page.

> 
> 3. Eliminated race condition: The old scheme required synchronize_rcu()
>   to coordinate between HVO remapping and speculative PFN walkers that
>   might write to fake heads. With the head page always in writable
>   memory, this synchronization is unnecessary.
> 
> 4. Removed static key: hugetlb_optimize_vmemmap_key is no longer needed
>   since compound_head() no longer has HVO-specific branches.
> 
> 5. Cleaner architecture: The vmemmap layout is now straightforward -
>   head page has its own vmemmap, tails share a read-only template.

I have no idea about the feature of memdesc, but regarding HVO, it is
a nice improvement. I'll look into the details later.

Muchun,
Thanks.
> 
> I had hoped to see performance improvement, but my testing thus far has
> shown either no change or only a slight improvement within the noise.
> 
> Series Organization
> ===================
> 
> Patches 1-3: Preparatory refactoring
>  - Change prep_compound_tail() interface to take order
>  - Rename compound_head field to compound_info
>  - Move set/clear_compound_head() near compound_head()
> 
> Patch 4: Core encoding change
>  - Implement mask-based encoding for power-of-2 struct page
> 
> Patches 5-6: HVO restructuring
>  - Refactor vmemmap_walk to support separate head/tail pages
>  - Introduce per-hstate vmemmap_tail, eliminate fake heads
> 
> Patches 7-9: Cleanup
>  - Remove fake head checks from compound_head(), PageTail(), etc.
>  - Remove VMEMMAP_SYNCHRONIZE_RCU and synchronize_rcu() calls
>  - Remove hugetlb_optimize_vmemmap_key static key
> 
> Patch 10: Optimization
>  - Implement branchless compound_head() for power-of-2 case
> 
> Patch 11: Documentation
>  - Update vmemmap_dedup.rst to reflect new architecture
> 
> Kiryl Shutsemau (11):
>  mm: Change the interface of prep_compound_tail()
>  mm: Rename the 'compound_head' field in the 'struct page' to
>    'compound_info'
>  mm: Move set/clear_compound_head() to compound_head()
>  mm: Rework compound_head() for power-of-2 sizeof(struct page)
>  mm/hugetlb: Refactor code around vmemmap_walk
>  mm/hugetlb: Remove fake head pages
>  mm: Drop fake head checks and fix a race condition
>  hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
>  mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
>  mm: Remove the branch from compound_head()
>  hugetlb: Update vmemmap_dedup.rst
> 
> .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
> Documentation/mm/vmemmap_dedup.rst            |  62 ++---
> include/linux/hugetlb.h                       |   3 +
> include/linux/mm_types.h                      |  20 +-
> include/linux/page-flags.h                    | 163 +++++-------
> include/linux/page_ref.h                      |   8 +-
> include/linux/types.h                         |   2 +-
> kernel/vmcore_info.c                          |   2 +-
> mm/hugetlb.c                                  |   8 +-
> mm/hugetlb_vmemmap.c                          | 245 ++++++++----------
> mm/hugetlb_vmemmap.h                          |   4 +-
> mm/internal.h                                 |  11 +-
> mm/mm_init.c                                  |   2 +-
> mm/page_alloc.c                               |   4 +-
> mm/slab.h                                     |   2 +-
> mm/util.c                                     |  15 +-
> 16 files changed, 242 insertions(+), 311 deletions(-)
> 
> -- 
> 2.51.2
> 

