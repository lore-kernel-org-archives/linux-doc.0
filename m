Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532342EDD69;
	Mon, 11 May 2026 22:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539090; cv=none; b=bosPl6+HIs7hmDcDOsTIkZ3UlhAlUUOB4Xq61/xCsyBP9gmbzsEB0cCVeFHgG8aK2BhDdFAJmKEJtny1wRZjEU1gT/04/rpygi7CZvl3rnv4zWZrMT6gHL9NEC1Td9zE/GwqVBOL03ImQS7HORGwxVjbDRYZ0EDxnR5ACXoM1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539090; c=relaxed/simple;
	bh=fbyMoeIIAj9uYWA4eCqwbDYRzB9l0R+amEo+V3SyBDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgLQLx8m8Uzdu/2fjoVSNQhX4uj1bQSVYAmTNf8UCnPLLtOggGZztXqgQ5t86BeATSO85xxIypDv65rfEFFZGKFh1aumtIlvy2/8umQ+tleuHDMrEHjwZl6kyotaJ9CTJKgY6pi42WYOLzvnUHeQ4ofSImiuouK8vM4G/MHKDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgNjjagG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgNjjagG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD2CC2BCB0;
	Mon, 11 May 2026 22:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778539090;
	bh=fbyMoeIIAj9uYWA4eCqwbDYRzB9l0R+amEo+V3SyBDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgNjjagG7r7F6lVZ4W2fhcv2LvSsGTOVjmvJsKWz/0o6hKQoWe+nh+XkmWLAKUJ1B
	 FiAR7VFybNvjqp9WF+vxe4Bf2t5xKk1QE0y7xhxce6Zf2HZJepoCeD+mDP8GTvhaCo
	 kFos61RCiAVZXuMMoFWjtHF1kOzpWvoIpMdzvxmCJ9uZ/OwHJmBOGebnsvBNjrdm9Q
	 PYxrzdTifYbRZmhGQV6sOA0STkEKh6toWSocSAGvyRfqG3HblVR5kxj29Qo8nd9udx
	 YH4OqdP6pYQJpk3hM9FiCN3LjCMbnFzU2U/+IMk2QiWuFAWQWob+u1hMazimAlO+A/
	 D4m9cT6WcYEkQ==
Date: Mon, 11 May 2026 22:38:07 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: fujunjie <fujunjie1@qq.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [RFC PATCH 3/5] mm: zswap: load fully stored large folios
Message-ID: <agJV-73LaAzMqDBg@google.com>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <tencent_69E7E93D1E47766E922D48B9EA9FD1140D09@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_69E7E93D1E47766E922D48B9EA9FD1140D09@qq.com>

On Fri, May 08, 2026 at 08:20:31PM +0000, fujunjie wrote:
> zswap_store() already stores every base page of a large folio as a
> separate zswap entry and tears the whole folio back down on store
> failure. The load side still rejects any large folio, which forces the
> swapin path to avoid mTHP swapin once zswap has ever been enabled.
> 
> Use zswap_entry_batch() to distinguish three cases: the whole range is
> absent from zswap and should fall through to the disk backend, the whole
> range is present and can be decompressed one base page at a time, or the
> range is mixed and must be treated as an invalid large-folio backend
> selection.
> 
> After all entries decompress successfully, mark the folio uptodate and
> dirty, account the mTHP swpin stat once for the folio, account one ZSWPIN
> event per base page, and invalidate each zswap entry because the
> swapcache folio becomes authoritative.
> 
> Signed-off-by: fujunjie <fujunjie1@qq.com>
> ---
>  Documentation/admin-guide/mm/transhuge.rst |  4 +-
>  mm/zswap.c                                 | 65 ++++++++++++++--------
>  2 files changed, 45 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index 5fbc3d89bb07..05456906aff6 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -644,8 +644,8 @@ zswpout
>  	piece without splitting.
>  
>  swpin
> -	is incremented every time a huge page is swapped in from a non-zswap
> -	swap device in one piece.
> +	is incremented every time a huge page is swapped in from swap I/O or
> +	zswap in one piece.
>  
>  swpin_fallback
>  	is incremented if swapin fails to allocate or charge a huge page
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 27c14b8edd15..863ca1e896ed 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -28,6 +28,7 @@
>  #include <crypto/acompress.h>
>  #include <crypto/scatterwalk.h>
>  #include <linux/zswap.h>
> +#include <linux/huge_mm.h>
>  #include <linux/mm_types.h>
>  #include <linux/page-flags.h>
>  #include <linux/swapops.h>
> @@ -1614,20 +1615,23 @@ bool zswap_store(struct folio *folio)
>   *  NOT marked up-to-date, so that an IO error is emitted (e.g. do_swap_page()
>   *  will SIGBUS).
>   *
> - *  -EINVAL: if the swapped out content was in zswap, but the page belongs
> - *  to a large folio, which is not supported by zswap. The folio is unlocked,
> - *  but NOT marked up-to-date, so that an IO error is emitted (e.g.
> - *  do_swap_page() will SIGBUS).
> + *  -EINVAL: if the folio spans a mix of zswap and non-zswap entries. The
> + *  folio is unlocked, but NOT marked up-to-date, so that an IO error is
> + *  emitted (e.g. do_swap_page() will SIGBUS). Large folio swapin should
> + *  reject such ranges before calling zswap_load().
>   *
> - *  -ENOENT: if the swapped out content was not in zswap. The folio remains
> + *  -ENOENT: if the swapped out content was not in zswap. For a large folio,
> + *  this means the whole folio range was not in zswap. The folio remains
>   *  locked on return.
>   */
>  int zswap_load(struct folio *folio)
>  {
>  	swp_entry_t swp = folio->swap;
>  	pgoff_t offset = swp_offset(swp);
> -	struct xarray *tree = swap_zswap_tree(swp);
>  	struct zswap_entry *entry;
> +	int nr_pages = folio_nr_pages(folio);
> +	bool is_zswap;
> +	int index;
>  
>  	VM_WARN_ON_ONCE(!folio_test_locked(folio));
>  	VM_WARN_ON_ONCE(!folio_test_swapcache(folio));
> @@ -1635,30 +1639,36 @@ int zswap_load(struct folio *folio)
>  	if (zswap_never_enabled())
>  		return -ENOENT;
>  
> -	/*
> -	 * Large folios should not be swapped in while zswap is being used, as
> -	 * they are not properly handled. Zswap does not properly load large
> -	 * folios, and a large folio may only be partially in zswap.
> -	 */
> -	if (WARN_ON_ONCE(folio_test_large(folio))) {
> +	if (zswap_entry_batch(swp, nr_pages, &is_zswap) != nr_pages) {
> +		WARN_ON_ONCE(folio_test_large(folio));

IIUC the condition can only be true for large folios, so I think just
WARN_ON_ONCE() in the if statement itself?

Taking a step back, this is doing xa_load() lookups that are repeated
again below. Maybe we should drop this check here and integrate the
check into the loop below (either all entries exist or don't)?

We might end up with a case where we decompress some parts of the folio
then return a failure, but this possibility already exists (e.g.
decompression failures).

>  		folio_unlock(folio);
>  		return -EINVAL;
>  	}
>  
> -	entry = xa_load(tree, offset);
> -	if (!entry)
> +	if (!is_zswap)
>  		return -ENOENT;
>  
> -	if (!zswap_decompress(entry, folio, 0)) {
> -		folio_unlock(folio);
> -		return -EIO;
> +	for (index = 0; index < nr_pages; index++) {
> +		swp_entry_t entry_swp = swp_entry(swp_type(swp),
> +						  offset + index);
> +		struct xarray *tree = swap_zswap_tree(entry_swp);
> +
> +		entry = xa_load(tree, offset + index);
> +		if (WARN_ON_ONCE(!entry)) {
> +			folio_unlock(folio);
> +			return -EINVAL;
> +		}
> +
> +		if (!zswap_decompress(entry, folio, index)) {
> +			folio_unlock(folio);
> +			return -EIO;
> +		}
>  	}
>  
>  	folio_mark_uptodate(folio);
>  
> -	count_vm_event(ZSWPIN);
> -	if (entry->objcg)
> -		count_objcg_events(entry->objcg, ZSWPIN, 1);
> +	count_mthp_stat(folio_order(folio), MTHP_STAT_SWPIN);

Not a problem with this patch, but I wonder why different swapin
implementations are making this call instead of putting it in a
higher-level (e.g. alloc_swap_folio()).

> +	count_vm_events(ZSWPIN, nr_pages);
>  
>  	/*
>  	 * We are reading into the swapcache, invalidate zswap entry.
> @@ -1668,8 +1678,19 @@ int zswap_load(struct folio *folio)
>  	 * compression work.
>  	 */
>  	folio_mark_dirty(folio);
> -	xa_erase(tree, offset);
> -	zswap_entry_free(entry);
> +
> +	for (index = 0; index < nr_pages; index++) {
> +		swp_entry_t entry_swp = swp_entry(swp_type(swp),
> +						  offset + index);
> +		struct xarray *tree = swap_zswap_tree(entry_swp);
> +
> +		entry = xa_erase(tree, offset + index);
> +		if (WARN_ON_ONCE(!entry))
> +			continue;
> +		if (entry->objcg)
> +			count_objcg_events(entry->objcg, ZSWPIN, 1);

Hmm I was wondering how the stat update should be handled here. It is
possible that a folio was swapped out from one memcg and is being
swapped in by a process in a different memcg. For order-0 folios, the
folio gets charged to the swapout memcg.

However, looking at alloc_swap_folio() ->
mem_cgroup_swapin_charge_folio(), it seems like we charge mTHP folios to
the swapout memcg of the first swap entry. This seems a bit arbitrary.

Focusing at the code here, seems like we'll count the swapin against the
swapout memcg, which is good in terms of keeping ZSWPIN and ZSWPOUT
balanced. However, it seems like it's possible that the folio is being
charged to a different memcg here than the swapout memcg, so we may end
up counting ZSWPIN in one memcg but charging the folio in another.

I am not sure if this is practically a problem, but something doesn't
sound right. Johannes (and other memcg folks), were these the intended
charging semantics for mTHP swapin? Is it reasonable to count ZSWPIN in
one memcg and charge the folio in another?

> +		zswap_entry_free(entry);
> +	}
>  
>  	folio_unlock(folio);
>  	return 0;
> -- 
> 2.34.1
> 
> 
