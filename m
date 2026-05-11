Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6575A37EFE0;
	Mon, 11 May 2026 22:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537591; cv=none; b=iifA39PZ5yH/V5pPsDQz87lqzU9YQFn2DIacA0SgfnyGmKCyNQQgCuSFdHcXRxsPoFKlk5iQJpLEU/lgzJDvhoBGgDwmnaQFBsakW541DC+VGJwjj75d+zEDrmFTAI9udkJTmbL2yxhL/8p5CXzEJQIEYTRTy0ZYYB6W6LChifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537591; c=relaxed/simple;
	bh=8fJMj3Wfv9yngO3GQMAeJuLKC7maaCx6qHJ+90vYE+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwIxAUuRqc65Uw2H+jEReja58eBiLz5HUYfIAzZa2RfMaNqhLSnPKUYaCczDPM383ss5lUJo/vuiueoGEimVfIs+duPT+EbSRZlHOQVAc+6mrczUgVvgFSdZRYfCsnvE38eaj7AjnRyHnOSxm9cfhNGznOwtfT5nGsoFiclPl4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm+VJhb5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm+VJhb5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67099C2BCB0;
	Mon, 11 May 2026 22:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537591;
	bh=8fJMj3Wfv9yngO3GQMAeJuLKC7maaCx6qHJ+90vYE+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lm+VJhb5bavqVydXuPazQLWHg8GKKEUWXGfG/0KZ825tRGTbEU0LyacTZ11W4Mu5w
	 dDp8Nf7AbRuZF8dI8RClv4XVFKOn4SRs2gh+lMpX7StkAsIm6RYHMz6XzvspCruicy
	 9TmSPo3dOualt+g4cilvFXjLZN5mS+Xxszvjvid7W5VRZJMDy296wYKAI46r6+fBDL
	 lafXkknC9mSm1xJ3CMiDcOeE404egVzM8rJWZp13gy9e9xcc13/CrqsKQa/+6UjwMw
	 fzye0hSBs+O1LhDnC1btACWcgM3g77NNyjTz+iiEwp20PW25tcyW75JIjRHe6m0piX
	 exTxyHc53N8FQ==
Date: Mon, 11 May 2026 22:13:08 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: fujunjie <fujunjie1@qq.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio
 swapin
Message-ID: <agJT6D5zaUD6FpwQ@google.com>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>

On Fri, May 08, 2026 at 08:18:29PM +0000, fujunjie wrote:
> Hi,
> 
> This RFC explores anonymous large folio swapin when a contiguous swap
> range is backed consistently by zswap.
> 
> Large folio swapout to zswap is already supported by storing each base
> page in the folio as a separate zswap entry. The anonymous synchronous
> swapin path has remained order-0 once zswap has ever been enabled:
> zswap_load() rejected large folios, and alloc_swap_folio() avoided large
> folio allocation to protect against mixed backend ranges.
> 
> This RFC keeps the scope intentionally conservative. It does not try to
> read one large folio from mixed zswap and disk backends, and it does not
> change shmem swapin. Shmem still has its existing zswap fallback and is
> left for later discussion. For anonymous swapin, the backend rule is made
> explicit:
> 
> - a range fully absent from zswap can keep using the disk backend
> - a range fully present in zswap can be decompressed into a large folio
> - a mixed zswap/non-zswap range falls back to order-0 swapin
> 
> The series adds a zswap range query helper, teaches zswap_load() to
> decompress all-zswap large folios one base page at a time, accounts mTHP
> swpin for zswap-loaded large folios, retries synchronous large-folio
> insertion races with order-0 swapin, and removes the anonymous
> zswap-never-enabled restriction once mixed ranges are filtered.
> 
> I tested the series with a full bzImage build using CONFIG_ZSWAP=y,
> CONFIG_ZRAM=y, CONFIG_MEMCG=y and CONFIG_THP_SWAP=y.
> 
> The QEMU/KVM runs covered both the fully-zswap path and the mixed-backend
> fallback path. In the all-zswap run, a 512MiB anonymous mapping was faulted
> as 8192 64KiB groups, reclaimed into zswap, and faulted back. Reclaim
> reported mthp64_zswpout=8192 and zswpout=131072. Refault then reported
> mthp64_swpin=8192 and zswpin=131072, and pagemap/kpageflags showed 8192
> order-4 THP groups in the mapping.
> 
> In the mixed-backend run, the workload used a 64MiB anonymous mapping
> split into 1024 64KiB groups. After shrinker debugfs wrote back exactly
> one zswap base-page entry, refault left 1023 order-4 THP groups and one
> order-0 mixed group. The kernel stats matched that shape:
> mthp64_swpin=1023, zswpin=16383 and zswpwb=1.
> 
> CONFIG_SHRINKER_DEBUG is only a test aid for making that one zswap
> writeback deterministic; it is not required by the implementation.
> 
> Nhat Pham's active Virtual Swap Space series is adjacent work. It moves
> swap cache and zswap entry state into a virtual swap descriptor, and lists
> mixed backing THP swapin as a future use case. This RFC is independent and
> works with the current swap/zswap infrastructure, but may need rebasing if
> VSS lands first.
> 
> Feedback would be especially helpful on:
> 
> 1. whether it makes sense to support all-zswap large folio swapin first,
>    while keeping mixed zswap/disk ranges on the order-0 fallback path

I think so, yes, but based on my read of the code this RFC only affects
synchornous swapin, which is more-or-less zram+zswap. This is an
uncommon setup outside of testing.

> 2. whether a follow-up for mixed zswap/disk large folio swapin would be
>    useful after this RFC

That's a heavier lift and I think we should consider this in the
longer-term, once the virtual swap work settles down. This is
conceptually not a zswap thing, you can have parts of a folio on disk,
in zswap, in the zeromap, etc. So it needs to be handled at a higher
layer (virtual swap for example).

> 
> Thanks.
> 
> ---
> 
> fujunjie (5):
>   mm: zswap: decompress into a folio subpage
>   mm: zswap: add a zswap entry batch helper
>   mm: zswap: load fully stored large folios
>   mm: swap: fall back to order-0 after large swapin races
>   mm: swap: allow zswap-backed large folio swapin
> 
>  Documentation/admin-guide/mm/transhuge.rst |   4 +-
>  include/linux/zswap.h                      |   9 ++
>  mm/memory.c                                |  67 ++++++++-----
>  mm/swap_state.c                            |  23 +++--
>  mm/zswap.c                                 | 111 ++++++++++++++++-----
>  5 files changed, 154 insertions(+), 60 deletions(-)
> 
> 
> base-commit: 917719c412c48687d4a176965d1fa35320ec457c
> -- 
> 2.34.1
> 
> 
