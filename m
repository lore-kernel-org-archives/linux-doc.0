Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D313C9EE8
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985521; cv=pass; b=I9Id8LEfGzycfIhk08A9WLGRiOPVckGcx+t4rIPZ2DNH8+CGtUeGxCkGi4tRv7DX8RFwNBU8C3tNSIuXrJuYBfpjuwJXlvk/PXPWrtI0+9q5e/b9mcC7hTOGUBIcRDif/bWTLhGdIX7yGG5LnV8o/NG7cc/mcTaYFExa7+9bNQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985521; c=relaxed/simple;
	bh=QoW7AnyixuM599yTqpXsOt8aI1xn2JRyg2Xq5kcrCwI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9Eq3jPs+EV0aod8aFP9/zvsGG5wcqr8RrHX7I9/6b7BWvNpXqen6m7P8zZ6ex75lznwRW6u9cGXSKBpUmATGrdibB5/k1M1gz5Z7u5t6yE0Kwg2gfjhtsFGgODTYRd1AWSNgat9/byWQNZ0XC1uzu+Skv2+atMow5kQXfRRaMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qURk5P93; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qURk5P93"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso53905736d6.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 13:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985510; cv=none;
        d=google.com; s=arc-20260327;
        b=pKWPaoOGra/f/xrpRZ3hsW1B1Wfct9XcHnOHwdRmMlaNaj/+uaYL6R49OrYX3CO/x8
         3an3mQOVs95N8C/aYtlv3ndvOsfTyFMr2fIxr2HRYfTYPz/Dh0/AYVpnrxVxejxROUFD
         qFpfAf19n5Ezhu/xrdlg0X8WuCNtIhtf/u/sItAwv7zzrDnsxTVTpHPnnPa/GHNK1i8L
         tBYodtXMQdQgcUViT72Y0o51jLgmJfm4UTdlG0pGbKA7hIN4RNqd0x5gvm7bdQgFIHZ9
         V9JoJapK2K34V85lbYTPy7HSsknkmHWew2IiyLyvFvT7JbC64wvPWdlXcdkjWTz0AAQg
         630A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=sAJgjokaArCH/jUJWMU61BMeLKssOx+oevwPJuJSlB4=;
        fh=adjqhUSt4K2RpWzUdnPiY0SsHvCH6GMbWua/rxttHtE=;
        b=bKa63MT+3Q8sUVvxZm8LNrlXZ4N1qwbPc6Nd8TiV0J5qiL5grg0557jllPpqZT3ddN
         dt62T7CyI5idNZeSg7MVpDrB63StZxPywo8QbDEQUG3vIwdMmaMqE7Biagd82t/WLG9b
         XoveSUhsIgh4UUh+zn6POnD7Xcx8W0X5qFWEDYiRrBmTZfzUMgChpFWeH0TSEn7/924h
         A0gvPyOkotTBwTlV+P04hQBPp2hNVOKPmiYoOvkh0HVMQy+wH/dLWS4ITZ5GtDiUkSi2
         IfMoufOgJV/08HofyS3wVgDZu03wV/guQRdYTrKa7Tb/AUD1bGTbpTpfSq7ri8ANLapj
         dvGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788985510; x=1789590310; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAJgjokaArCH/jUJWMU61BMeLKssOx+oevwPJuJSlB4=;
        b=qURk5P93NaTtt5trLDbmc1BUPFr6x0gCMMduokoE3cnwaIvRpYlj1jHU2jfkX04ZZV
         IjmUKbODrxIHTMwc2xqWpO+XpkI221Fe/HEVbMyG6yV4a4xCB4ehvS5Ql3vvSOGIcx/i
         WW3MAsBkFyCvPBDTJxnuGl43uWah6KrhZHLD87lv80j5xL/cR46XqWvERDWjyuG9Chf5
         NabDWspzgakCSj8oBmZuuGRXtbRy9z7N/j9vzPhViK6Smilf25fEUMzDGF3vkviviEyT
         oXUKtSNK98SLRWm+OmhfzoszLZrlmo5+rBWLZTkedbvCpZNWpqLgWCjsR0jflmW1JHm/
         ciAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985510; x=1789590310;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAJgjokaArCH/jUJWMU61BMeLKssOx+oevwPJuJSlB4=;
        b=LZYpZN5vcx+KxdJjJ0kH65wilEtVuWrGIIY/9fagqum0xcldl3IXJB5UfddcGlqOpj
         uBweP1gYeDFVgzEsUSYgQjmUUxNRnEo3Y2DY9g1cwmrd26FlRYEeLzQ89g7xFf6KF1P8
         KONA17ks5xfdADVcHaOa6aq/KuxjEMR1jp/xNkPVQMu68gjv99v8jTgqGMw1CxhCErSZ
         Nvt8gqfhYY3GNF1YImtTsw8u/LZD8BHU9V90tAtkG4JjCw5N03w6tx2KJXu23qL92ZSZ
         +OHENxi1zGkW6DB9CePosyXC4cGcM+ItEBmju6w/HFwkUgZo1a6LhL4UixzkbNQLnCQZ
         peSQ==
X-Gm-Message-State: AFuF++mCNX2D3eVtT+bRhQG8RHB5aziXohSWv8ab5YtwyffZVUwnhbOx
	Zuro1fQkB5h7hTXiw18+5ltNzV0dIRHI1fqOXznaYnxhErKhqZA4uRN+6+NJ8adWaOt7HLvP0f3
	LctzMztgoOyDk6m7wMD5FxUtOxna3kLIAu0kIAERS
X-Gm-Gg: AYBFou1N6rYPNEQvx06XSspnREZRAEvhdKVmzjDNRvqG4HhPTOQwcb7ly8Mw/HV6pXs
	Vly2y8vtN7xi9y1gIjYuGiXRTAPcJdR3oXhKznBN66HMY4mc92tKYz2h4lCCz47S3DEvFis8R78
	V6uBt4ls5zGM6DybVbpkdkbu8ZghHK69ZWWIQrjH/gzYwQyiEk7L9nPpgftgAggfONPqc2e6P/4
	xtzCHKeoh/8i/PONVoNxGUD17zDAZ921gMIdBf7ut0ig18eRrsYp5+L7Aj3Paqb1D/E1Ua/h3Dh
	fLnVZJsg2BowNE8xnIC9S5jcVdUfcfsBx3xcLSMvO40XjJc4sCTTkyI521O+d9WB84JT7AEws0c
	l9LqEXw1hqjRlUhDCZPX9wreHJrWNXce+d1CXgciv
X-Received: by 2002:a05:6214:2028:b0:910:70e1:e73e with SMTP id
 6a1803df08f44-91070e1e8eemr54547936d6.36.1788985508825; Wed, 09 Sep 2026
 13:25:08 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 13:25:08 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 13:25:07 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260902-hugetlb-subpool-always-track-used-v1-2-de1cd14bd713@google.com>
References: <20260902-hugetlb-subpool-always-track-used-v1-0-de1cd14bd713@google.com>
 <20260902-hugetlb-subpool-always-track-used-v1-2-de1cd14bd713@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 13:25:07 -0700
X-Gm-Features: AcwNN1WKF_ytLnZvmqYqok7fCFO9k5UkC6wmjaHMYmOMsaT-t0wpYlqa0Qxgl0M
Message-ID: <CAEvNRgGGW+D2GWwjUj5A_L69aeUaaWFn4vx6FE7Q5gkd278+nA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm: hugetlb: Fix out_put_pages subpool reserve calculation
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

Copying Sashiko's comments here for discussion :)

> From: Ackerley Tng <ackerleytng@google.com>
>
> When reserving pages for a mapping fails during global accounting, the
> error path rolls back the adjustments made to the subpool.
>
> Currently, this rollback was performed in two separate steps:
>
> 1. Returning only the portion of reservations originally satisfied from the
>    subpool
> 2. Separately adjusting the subpool used pages counter for the portion that
>    was requested from the global pool.
>
> In (1.), because the used pages counter had not yet been decremented for
> the global portion, the subpool observed an inflated used pages count. If
> the mount was configured with both a minimum size and a maximum size, this
> inflated count prevented the subpool from recognizing that usage fell below
> the minimum size guarantee.
>
> As a result, the subpool failed to restore its reserved pages counter and
> instead returned that a global reservation should be dropped. The
> mount-time reservation is permanently destroyed, leaving global reservation
> counts depleted and causing an underflow when the filesystem is eventually
> unmounted.
>
> Additionally, if concurrent threads modified subpool usage during the
> reservation attempt, calculating the rollback amount using stale local
> variables could cause global reservation counts to diverge.
>
> Now that used pages are always tracked within the subpool, return the
> entire requested page count to the subpool in a single call. Global
> reservations are then adjusted using the difference between the
> reservations originally requested and those returned, fixing the issues
> described above.
>
> Fixes: 1d3f9bb4c8af ("mm/hugetlb: restore failed global reservations to subpool")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  mm/hugetlb.c | 49 +++++++++++++++++++++++--------------------------
>  1 file changed, 23 insertions(+), 26 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 66b6601abb069..d84ef044d1346 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6674,12 +6674,14 @@ long hugetlb_reserve_pages(struct inode *inode,
>  		struct vm_area_struct *vma,
>  		vma_flags_t vma_flags)
>  {
> -	long chg = -1, add = -1, spool_resv, gbl_resv;
> +	long chg = -1, add = -1;
>  	struct hstate *h = hstate_inode(inode);
>  	struct hugepage_subpool *spool = subpool_inode(inode);
>  	struct resv_map *resv_map;
>  	struct hugetlb_cgroup *h_cg = NULL;
> -	long gbl_reserve, regions_needed = 0;
> +	long regions_needed = 0;
> +	long gbl_resv_get;
> +	long gbl_resv_put;
>  	int err;
>
>  	/* This should never happen */
> @@ -6754,9 +6756,9 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	 * the subpool has a minimum size, there may be some global
>  	 * reservations already in place (gbl_reserve).
>  	 */
> -	gbl_reserve = hugepage_subpool_get_pages(spool, chg);
> -	if (gbl_reserve < 0) {
> -		err = gbl_reserve;
> +	gbl_resv_get = hugepage_subpool_get_pages(spool, chg);
> +	if (gbl_resv_get < 0) {
> +		err = gbl_resv_get;
>  		goto out_uncharge_cgroup;
>  	}
>
> @@ -6764,7 +6766,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	 * Check enough hugepages are available for the reservation.
>  	 * Hand the pages back to the subpool if there are not
>  	 */
> -	err = hugetlb_acct_memory(h, gbl_reserve);
> +	err = hugetlb_acct_memory(h, gbl_resv_get);

[GLOBAL ACCOUNTING]

>  	if (err < 0)
>  		goto out_put_pages;
>
> @@ -6783,7 +6785,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
>
>  		if (unlikely(add < 0)) {
> -			hugetlb_acct_memory(h, -gbl_reserve);
> +			hugetlb_acct_memory(h, -gbl_resv_get);

Sashiko:

Does this error path complicate the rollback logic? By explicitly freeing the
previously held global reservations here, it guarantees that out_put_pages
will need to re-allocate them from scratch if the subpool absorbs them. Does
this increase the likelihood of the subsequent hugetlb_acct_memory() allocation
failing?

Ackerley:

Yes, it does. Restoring gbl_resv_get here is the correct thing to do, to
undo the [GLOBAL ACCOUNTING] (see above). It does look weird that
hugetlb_acct_memory() is called twice, but the hugetlb_acct_memory() in
out_put_pages is actually purely meant to follow up after
hugetlb_subpool_put_pages().

Everything is mathematically correct. Sashiko is also right that this
could result in allocation within out_put_pages.

I'll add another patch to clean this up, see next revision!

>  			err = add;
>  			goto out_put_pages;
>  		} else if (unlikely(chg > add)) {
> @@ -6819,26 +6821,21 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	}
>  	return chg;
>
> -out_put_pages:
> -	spool_resv = chg - gbl_reserve;
> -	if (spool_resv) {
> -		/* put sub pool's reservation back, chg - gbl_reserve */
> -		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
> -		/*
> -		 * subpool's reserved pages can not be put back due to race,
> -		 * return to hstate.
> -		 */
> -		hugetlb_acct_memory(h, -gbl_resv);
> -	}
> -	/* Restore used_hpages for pages that failed global reservation */
> -	if (gbl_reserve && spool) {
> -		unsigned long flags;
> + out_put_pages:
> +	/*
> +	 * Return all that was requested from the subpool, let subpool
> +	 * tell us the new number of reservations that need to be
> +	 * returned to the global pool.
> +	 */
> +	gbl_resv_put = hugepage_subpool_put_pages(spool, chg);
> +	/*
> +	 * There may be a difference between the number of
> +	 * reservations to consume and the number to restore now if
> +	 * there are multiple threads interacting with the subpool -
> +	 * restore the difference.
> +	 */
> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);

Sashiko:

Does ignoring the return value of hugetlb_acct_memory() here lead to accounting
divergence? If gbl_resv_get > gbl_resv_put, this attempts to allocate global
pages. If this allocation fails (e.g. out of memory), the failure is silently
ignored.

Could this lead to the global resv_huge_pages counter diverging from the
subpool's rsv_hpages counter? If a concurrent operation drops the subpool's
used_hpages below min_hpages, hugepage_subpool_put_pages() would absorb the
returned pages into rsv_hpages to satisfy the minimum size constraint. If the
re-allocation then fails and the subpool is later unmounted, could this
divergence cause resv_huge_pages to underflow, inflating available_huge_pages
and potentially enabling a system-wide OOM denial of service?

Ackerley:

Yes I agree that ignoring the return value of hugepage_acct_memory()
could result in issues, but this isn't unique to this code path. The
return value of hugepage_acct_memory() is ignored in similar cleanup
paths.

>
> -		spin_lock_irqsave(&spool->lock, flags);
> -		if (spool->max_hpages != -1)
> -			spool->used_hpages -= gbl_reserve;
> -		unlock_or_release_subpool(spool, flags);
> -	}
>  out_uncharge_cgroup:
>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>  					    chg * pages_per_huge_page(h), h_cg);
>
> --
> 2.55.0.970.g62bdec98f9-goog
