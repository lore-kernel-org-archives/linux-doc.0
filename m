Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7EE3314D0
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137451; cv=none; b=rIEJSOLBR/G37r8EmJMIp0az4gcsrSuVFdXfuKcmIDad7EsKjBlvDzvlR8IrUD7bUewmm7ZyA0tshkB4ExQ/CclNXxfCtgJ5q593UWPBD6Xvvb7RkucHw9irLOfITZSaNaV9NCdskTjzj+kqM9beE+avgbqd6h/g5RNSeAsGUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137451; c=relaxed/simple;
	bh=CEYkY4jQ3BKp7MCge8xop87gVEl9XH/zl5q3vNn1suk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A47+k7iCgDWOV7pF+muIFbHwXzexWZaB7Dqs6HQrcxY+4jvRIp+/7xzw4VlxKKorYHL6h2yfG3e4PEs35OcOKp5oZHo5WZYkwG99cN09qMDVo86B2us8lfqJMJVt1X74vs4zdREmv66K5YzyPW5qG55+2yCMaQWeeUcEcDSikq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSK5LShx; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSK5LShx"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b92a58cb7eso578336eaf.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137448; x=1789742248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2Ov6MxIFeBvn1siphW3kcaZJl5WIgV8anby3r7O9WA=;
        b=CSK5LShxoxRmisQXjilnB9SOwFQ18mdB9F9ageicxiXGYntwc0YUJqKyU37mZRiaoU
         DSLJgo23TefH/8yFa83vJguEC6yqwq4OUtpofje8VNS+KxtB9+UiGOz4K6XxW/P2EGYj
         +GhFY31WLwmAmE+Uwu5ETrQiTFh2tYxx8CwVztXJc92I5DTiRYq/wEax/ozReN/wTazM
         HWr8lXVqXfQzkjywodb/gTsx8uxQJREqY9sPI+XwtnN3/cRZiB8zXw6SFcj4alg758Kx
         wfNj4CXF4b5Wu1n9zl0YGAKKhxtFxJFyWmipx23cnEZdDVkxacX9qrAj5z5WGQIYziXq
         6zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137448; x=1789742248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2Ov6MxIFeBvn1siphW3kcaZJl5WIgV8anby3r7O9WA=;
        b=b2Aqqa96fatmZ+SdpsPTqJEnvLvQCXohvkxyBnM0e390EaZCVTt+u0egIwLXkVf+2t
         dWZVcuunNP/0+hvIaLoQo0K4Xk6woFPpmEAi4TiOvHxGLovUJJLACHRoHZy6A03R1mf+
         4d4i9+u/93rnWtxQqZaBRujuk8r37o0oGdMG2OKaw3RoYVntLzHRUpmjihleK7x5dX7S
         uve2xwHjkObFI+tZ5D73U/mkZV3C9siY7vZmF0c0S7Ok/WFn9T2q8XrENR9itbjaYVS/
         BTvR2+Em2Z9Me//wWDu4plY0AHvlfBWL11qVpciT4yqnI5hBDOHsTOujZQmdIMAdWZOL
         h95g==
X-Forwarded-Encrypted: i=1; AKwUvBxkvgocuMmVJX37vBCteyg36AqFmPy0Yqy+x2Z1fTsmIAp4ILHV/t1CDqGRdLybYH9ufemh9ICvvpU=@vger.kernel.org
X-Gm-Message-State: AFuF++k87VVesYm9j73QguClLQMA0VHX4Ij6PhcFeFH6BBttfHCtb9QG
	iJN4sEIoJfkGJF2aIZqu9AKUrui2JSGKbrL/w7ZE+kcKvt+KOrWOGNQu
X-Gm-Gg: AYBFou0kQ3GQVO+EhAnmESitG9fRd1i9fyO8FHiY54A2MKGqldLNd8LOxYzqmp9DnSR
	SimAQm33/tSAzaOzmfODQOBWh7VtGBzWhb8mPjgsB5sCZs2oOMrO3iSsmtUTfbjdKs1oBH3Yw7g
	W5jhy9o4DtpK8JbBwzOdEuDRy8MosisLn9JUhd9v7sgwDIEyuvnPBb8EuqyTX1/Qf/SC1GhAYHU
	5gYs5p8pjkEaHp16Su0prBkSt1LwhIiYzj6R3M/f71rUOjcEaOrHAP2pCPalh3nf3qQ6UUmtNno
	/uFlaRG48e+D1pv7fTRP34GUdd466NkaQuhB8Pcai50kcTHoIghHJYQq4mzCEDV1zd8a/9/Ig6+
	diEf4MkEiDaQTcP2HoC92ytz+NC1tlPRveCF06vxh1EF+8lIgT65A2u/Us5pvPCdHqlfV1PE+NS
	Kl0XsNqcgIZ/3xFpEQczg1DezBvfV1qyL4seqa2N4cut93jz+FUyw1gzTcC1Ws+SgTl5PCMSW62
	7p5pBmGCJQdFLVaUMnGyFDODTlx1A==
X-Received: by 2002:a05:6820:c3ce:10b0:6ba:2d85:8f49 with SMTP id 006d021491bc7-6c0bd5873e7mr2467455eaf.65.1789137448463;
        Fri, 11 Sep 2026 07:37:28 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5c::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0990ccbdfsm2617969eaf.4.2026.09.11.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:37:28 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hongxiang Lou <louhongxiang@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Wupeng Ma <mawupeng1@huawei.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	fvdl@google.com,
	jthoughton@google.com,
	rientjes@google.com,
	vannapurve@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ackerley Tng <ackerleytng@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm: hugetlb: Fix out_put_pages subpool reserve calculation
Date: Fri, 11 Sep 2026 07:37:26 -0700
Message-ID: <20260911143726.3689114-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909-hugetlb-subpool-always-track-used-v2-2-30c5d83b572a@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 09 Sep 2026 14:49:27 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:

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

Yeah, this sounds pretty bad. 

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
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Cc: stable@vger.kernel.org

Thanks! LGTM,
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

With one nit below:

> ---
>  mm/hugetlb.c | 49 +++++++++++++++++++++++--------------------------
>  1 file changed, 23 insertions(+), 26 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index e72e22f887478..9eb9f3442574c 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6676,12 +6676,14 @@ long hugetlb_reserve_pages(struct inode *inode,
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
> @@ -6756,9 +6758,9 @@ long hugetlb_reserve_pages(struct inode *inode,
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
> @@ -6766,7 +6768,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	 * Check enough hugepages are available for the reservation.
>  	 * Hand the pages back to the subpool if there are not
>  	 */
> -	err = hugetlb_acct_memory(h, gbl_reserve);
> +	err = hugetlb_acct_memory(h, gbl_resv_get);
>  	if (err < 0)
>  		goto out_put_pages;
>  
> @@ -6785,7 +6787,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
>  
>  		if (unlikely(add < 0)) {
> -			hugetlb_acct_memory(h, -gbl_reserve);
> +			hugetlb_acct_memory(h, -gbl_resv_get);
>  			err = add;
>  			goto out_put_pages;
>  		} else if (unlikely(chg > add)) {
> @@ -6821,26 +6823,21 @@ long hugetlb_reserve_pages(struct inode *inode,
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

I'm not sure if this section warrants these two comment blocks anymore.
The logic is quite straightforward now that we don't have to worry about
managing the global / subpool reservations separately and rather just
simply do the subtraction to account the memory.

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
> 2.55.0.1007.g17ff1f9808-goog
