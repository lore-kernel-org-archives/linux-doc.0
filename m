Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032623161B0
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963838; cv=none; b=Y+7xQhW/+SjOskTeiNcPyE/us03+2+Hd4JtBENbAFurHh7RcB0cQ+4VbWqEDcKgby2jjG8Qvx+CMxhpUmp5Towisrkqvi9Z0mU9jUFMCs/PuOyOVQRAH/LGQYWAHhz/y1rhFwhb6jmfVtpDkXGpnu/Q535l1+LgrylfA6GHiMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963838; c=relaxed/simple;
	bh=IE3A7Bzdjrv2H3PsxZzz8Z5SPq9tyuKSoKo5G47PsRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L5hUz/Caz/g20+2WWpInuy/u/LrDQ1Vj1YlLuIUM2zFDs3/dgm5nNG4emBKJV+ZAnwo1bd+4G+I6f3siCNLeJTj9/ieZt/afp+ugoifiG+VEx+y2Te1c2f7/i5spwepS5WeuGfQ5GGvoGwjbA2Q5HkZKZuZu87d2LUk0RaBbdyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwQdtITy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwQdtITy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A41C4CEF1;
	Fri,  5 Dec 2025 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963836;
	bh=IE3A7Bzdjrv2H3PsxZzz8Z5SPq9tyuKSoKo5G47PsRw=;
	h=From:To:Cc:Subject:Date:From;
	b=VwQdtITySOIrJw3EAMp49mTzaNsUq2+g8p9+k0n8CtvnlqriXPefrlabDfU3qgBcg
	 pjAG3sU0FstGyPb99LX9JHyiE84mCoWHl6bNoP6osZSBEeAPROaXrBGLC0CwOzxOld
	 56EUzm8W7D8T6yJmOmx7M4hw45bl2r0TJqf3caNgPhAdCLzbFudHmXr+cgtG6LrLKS
	 miZr1wcUhVwezji+/u1QsBRXQaboJ7ONWm1OcmLLtSV0TW8O7nR/XE0Xe63j8/r8sG
	 OqXBgL1xFXoinpr16TDxVIXTNEDfC/j5HPoaonlziRmKKGmkkDpwUovzY6VovXikqx
	 KK6vesSRRp8ag==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9D658F40070;
	Fri,  5 Dec 2025 14:43:54 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Dec 2025 14:43:54 -0500
X-ME-Sender: <xms:-jUzaSHOwFvImqw4N7zvllybpT61Jwo3O_80sZ7auoimCZNDbtZttA>
    <xme:-jUzaXQpbIqDK4I7pCHiU7J3dUhzHIFiOi9LtY_P4dDmucOZtDrhWbqkv8s-lYHm6
    XeLUUGUEFrRR0U0z123r0olnobO5ybCKB5MTzkcnWyBzblVc4tD8lA>
X-ME-Received: <xmr:-jUzaQuVMvA9jOjO4grLbJYCCwWS8RcTT7QnG_NFcKiBvmiZSiOnDIHj4AksXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcuufhhuhht
    shgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepff
    dvhfdtgfekuddttdffgeeljeehueffvdfgjeejvdetiedtfeefgfetgfffhfffnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddvkeeg
    geegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrghmvg
    dpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegr
    khhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutg
    hhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpdhrtg
    hpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghkrges
    shhushgvrdgtiidprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtg
    hlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepiihihiesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:-jUzaUBhO73Covcu8c31Xr5Q4PA9pFaDUSbBVChHRcFA7rgDkc9FYA>
    <xmx:-jUzaddFiycSZNK-3Uq35waaAq0L5zZNv5JHjA3QT4fZRxTgig1Uxw>
    <xmx:-jUzaco4L30e0AIqTXWcvxgU-50cYbMFZ5ZMOSuaf_PPFkg7rvcfjg>
    <xmx:-jUzaR7iDmVB08dSTGOAajYjCSHLQbaUC4v-RtRFk6ZZEUXXy-9HUQ>
    <xmx:-jUzaUAvhPi0bZEpd6IPVJYlQvoDzHUKwW5-8o0RxPmfIfNSlsXupVkZ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:43:54 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@kernel.org>,
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
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap optimization
Date: Fri,  5 Dec 2025 19:43:36 +0000
Message-ID: <20251205194351.1646318-1-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes "fake head pages" from the HugeTLB vmemmap
optimization (HVO) by changing how tail pages encode their relationship
to the head page.

It simplifies compound_head() and page_ref_add_unless(). Both are in the
hot path.

Background
==========

HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
and remapping the freed virtual addresses to a single physical page.
Previously, all tail page vmemmap entries were remapped to the first
vmemmap page (containing the head struct page), creating "fake heads" -
tail pages that appear to have PG_head set when accessed through the
deduplicated vmemmap.

This required special handling in compound_head() to detect and work
around fake heads, adding complexity and overhead to a very hot path.

New Approach
============

For architectures/configs where sizeof(struct page) is a power of 2 (the
common case), this series changes how position of the head page is encoded
in the tail pages.

Instead of storing a pointer to the head page, the ->compound_info
(renamed from ->compound_head) now stores a mask.

The mask can be applied to any tail page's virtual address to compute
the head page address. Critically, all tail pages of the same order now
have identical compound_info values, regardless of which compound page
they belong to.

This enables a key optimization: instead of remapping tail vmemmap
entries to the head page (creating fake heads), we remap them to a
shared, pre-initialized vmemmap_tail page per hstate. The head page
gets its own dedicated vmemmap page, eliminating fake heads entirely.

Benefits
========

1. Smaller generated code. On defconfig, I see ~15K reduction of text
   in vmlinux:

   add/remove: 6/33 grow/shrink: 54/262 up/down: 6130/-21922 (-15792)

2. Simplified compound_head(): No fake head detection needed. The
   function is now branchless for power-of-2 struct page sizes.

3. Eliminated race condition: The old scheme required synchronize_rcu()
   to coordinate between HVO remapping and speculative PFN walkers that
   might write to fake heads. With the head page always in writable
   memory, this synchronization is unnecessary.

4. Removed static key: hugetlb_optimize_vmemmap_key is no longer needed
   since compound_head() no longer has HVO-specific branches.

5. Cleaner architecture: The vmemmap layout is now straightforward -
   head page has its own vmemmap, tails share a read-only template.

I had hoped to see performance improvement, but my testing thus far has
shown either no change or only a slight improvement within the noise.

Series Organization
===================

Patches 1-3: Preparatory refactoring
  - Change prep_compound_tail() interface to take order
  - Rename compound_head field to compound_info
  - Move set/clear_compound_head() near compound_head()

Patch 4: Core encoding change
  - Implement mask-based encoding for power-of-2 struct page

Patches 5-6: HVO restructuring
  - Refactor vmemmap_walk to support separate head/tail pages
  - Introduce per-hstate vmemmap_tail, eliminate fake heads

Patches 7-9: Cleanup
  - Remove fake head checks from compound_head(), PageTail(), etc.
  - Remove VMEMMAP_SYNCHRONIZE_RCU and synchronize_rcu() calls
  - Remove hugetlb_optimize_vmemmap_key static key

Patch 10: Optimization
  - Implement branchless compound_head() for power-of-2 case

Patch 11: Documentation
  - Update vmemmap_dedup.rst to reflect new architecture

Kiryl Shutsemau (11):
  mm: Change the interface of prep_compound_tail()
  mm: Rename the 'compound_head' field in the 'struct page' to
    'compound_info'
  mm: Move set/clear_compound_head() to compound_head()
  mm: Rework compound_head() for power-of-2 sizeof(struct page)
  mm/hugetlb: Refactor code around vmemmap_walk
  mm/hugetlb: Remove fake head pages
  mm: Drop fake head checks and fix a race condition
  hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
  mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
  mm: Remove the branch from compound_head()
  hugetlb: Update vmemmap_dedup.rst

 .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
 Documentation/mm/vmemmap_dedup.rst            |  62 ++---
 include/linux/hugetlb.h                       |   3 +
 include/linux/mm_types.h                      |  20 +-
 include/linux/page-flags.h                    | 163 +++++-------
 include/linux/page_ref.h                      |   8 +-
 include/linux/types.h                         |   2 +-
 kernel/vmcore_info.c                          |   2 +-
 mm/hugetlb.c                                  |   8 +-
 mm/hugetlb_vmemmap.c                          | 245 ++++++++----------
 mm/hugetlb_vmemmap.h                          |   4 +-
 mm/internal.h                                 |  11 +-
 mm/mm_init.c                                  |   2 +-
 mm/page_alloc.c                               |   4 +-
 mm/slab.h                                     |   2 +-
 mm/util.c                                     |  15 +-
 16 files changed, 242 insertions(+), 311 deletions(-)

-- 
2.51.2

