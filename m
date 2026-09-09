Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7936215E
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 20:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987507; cv=pass; b=o25N8+GwpilqSiCcvajfz7ZNutNpzrMh5Fdmw7hvXWql/szScxX4Qrcxp6lSBfJFFT9Xs4WxQBMKuP3lyv237/wUlwFvk8yGiOxFTXbbIOw6s06lqiRnFww+caHJIBJMUdY3G4dU13A+INgz4d079kA3/m3CWAox9Z0+k3ui5Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987507; c=relaxed/simple;
	bh=GNBnlEEqI8nyGt1DXIN/Q2A1UEs04PydxXQJhFl47ns=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8Sru8DjJhTR19BROv7jq7Na7NNK+TkU+lgYAUZBDAcikqt/E3PgOjDXGTL3WGCgojFbC80UT2j9R7ufBHTNjV/kF6F9GHIjnhndnPC6Db0l/fnTcCVO8HxEILJ4S4uS81g4aATKi3FWB6xVT33XKg8s/he+eXRQZ6zlzZXiwOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pXfzXM/7; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pXfzXM/7"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so369905a12.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 13:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788987499; cv=none;
        d=google.com; s=arc-20260327;
        b=G4CHZZP46mQiwABdEigsFcPZTUVDnxSAztAgTAsvnM9xVJut5o4L2t1VI7a78+LsZA
         JvDuBAEIBLwXaNEmLeSaZ7X0Klu6JHc8EpoTc6C/rpQGlqtoltm1RZJJlNphHL5cfVYc
         1dn7hTBMfz1bXbz7IC9KbG59XjYYc06xQXtLr854f/EAEUHyFt1PNp1J46kH1+e3vLE3
         9t8mlNx68CPNV0UTXCjS6awJ3PTGxqbiMXSI/OaKiEnJpYJUyF3SePIAyU2g0Ctp+VO1
         EAAxNyHr7R3r1pW2/c0xSXJtjRBQZObo5Fv+Z4rSP2xPZFFlELz7IwWgdjbGFOY5bQl9
         0vjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Fto8QffRRzc1iPbh04C4QLWgSTkv6xI4tqguxS1zB/k=;
        fh=adjqhUSt4K2RpWzUdnPiY0SsHvCH6GMbWua/rxttHtE=;
        b=Ke6ddU3/SCicDE9ehaLVzPl0HuigaFV2grXWjk2nCwkWpN4APOIy+Emb7o7l8fKTED
         FQnYryTi+vXC/Xzu6XjAkNZ9v7hNn7AXRvCq+ENmOdfkV8ZxC0n2jLz1j6eqnmDeA5zK
         KSj9l5H23SChJzGpvZ0gA3p3r9HR/M1w3lBHlwGird0Jo4DhfOzd/X7dZ+fyhnGF9wr/
         5uD+0NWIKi7RoMbyN6/8jVJb8AYMTXTmkTilOsJKM8zappIFwvoEKK3SKxKIQEZzMS/p
         b7ODHEEcJ9e7SWcDFNAVNppptSXzSZvTmM36e9CwXK6k6ezjsMJEh9M5jSRTleRIsfVb
         bh8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788987499; x=1789592299; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fto8QffRRzc1iPbh04C4QLWgSTkv6xI4tqguxS1zB/k=;
        b=pXfzXM/7pUcdy3qiACdJMAYnalpVUTe9gTGVxItQL3fc0LKvhK4c7DkK6FzA5PT2D7
         e1kGRkFZi2CyAO16TpUDlMKJfDylNlABVmsDDu/1tZckjDPxvs3inC1WEMneYIhosjMT
         DzTqm+VyTiN6WmPzBM0d4yDPHjHgP+QM0MjjUzi255yFF1Q28DfrxPJaLZtv2EngFvgY
         diKVo2fljU8ZYLTVtAqWRO2afECrAEvKCQEVRtAM97M0A8OvIo/Z1mxoG9r/QmuOzjKp
         q7r7axbByxQBYnuonpfYdytNPrCSd30kUiLcH+MDT1MFj0hKOBTEOhCOI9yeMgTQU9Qb
         Vqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987499; x=1789592299;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fto8QffRRzc1iPbh04C4QLWgSTkv6xI4tqguxS1zB/k=;
        b=UQN6NTcPVc4lxJSaKWTlD/KYeHJFboU4EWEroEZE26/12gCtud1Usf39UWB1zRC55R
         332MHTH4YCApI4peMcd1PnUG/8C/87XCmk39f3V11ssnwK6/ddXDTyq5EZBfNgBFr4tC
         DE26eW8m9DVjoJvL2KTYSluVwbHZYINHerczzNkm67+ONjzDa9gfZO0SJOn+PF899UJ4
         8pne6qvC55XTYNbSQWwEyZPdsFj0eBzN+o93qMDfHCYJ3tYcHFioe/HvyYME/BfxdTZ9
         M7M/gN+Q+IPhEriYI7uAegRDj14/0hUTLndCFwZgpKOZNCSgIOySngX9OBUAhTIg73dO
         IM7A==
X-Gm-Message-State: AFuF++ljWs4dESNYFZxWbj3R4djMCL8KSu14FTySYvuvLAo2QhHvylCX
	zK6yRJgCPNKBsTYuxFfL/BZNeOM8aDsXCh8Q3HOiZpX+5Fh8XOVUdFoE8B4x39yQ5lF5Jh9SGHk
	idf4yLNNoDTIWLxruWWWdu1+XCTPpwGLXEkGnLkSI
X-Gm-Gg: AYBFou3J/EXxervrmyCVfodx0XCbKrMjmtlnZzJgRp32bcbwbmZJyRzMpANSpuIvfuL
	yzcLtvuY68jMiqDSHpnFWy/U5jbLkooCMWA7w2axHRfrcq0QiKbv86/SOATo21ohdsieIoIVTyS
	pDgBk6CZ7Co1L4PAKgB6ra/02JpV1teocQ6UL+b0S4GTFcuGbKXH0rkI58dBT+iInJozcEeh83B
	DdU51kCvyhfj+PDOSUePK8MXHUBXxzk/7+sLltQK7GhxZhHu178D2YDHtvP+DJTC/H0IyH1VW5j
	NLVWpATZ/UNrB9O2pzC7Ux78ly9Lj3J8/AZQL+kziZlwkW5QmYUq+KHGkPraORlbW/Pxfm3e70c
	j9kVTgHghIG6p2dM0hc0xbBHdmi4YxwVE8E1tOjnhtQ==
X-Received: by 2002:a17:90a:d406:b0:395:4de5:1054 with SMTP id
 98e67ed59e1d1-39d70b4e3bfmr4942649a91.16.1788987498156; Wed, 09 Sep 2026
 13:58:18 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 13:58:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 13:58:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260902-hugetlb-subpool-always-track-used-v1-3-de1cd14bd713@google.com>
References: <20260902-hugetlb-subpool-always-track-used-v1-0-de1cd14bd713@google.com>
 <20260902-hugetlb-subpool-always-track-used-v1-3-de1cd14bd713@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 13:58:15 -0700
X-Gm-Features: AcwNN1VHOD9F3bWg7PfgqL3VQ7dHsVNaxKBOIXno-ubvbNrtHXi_elzy4mYJuNA
Message-ID: <CAEvNRgGRxRvAj_KC+RJ=7Xuddz+FRDP5pn7ZgVaZq5y9WAB9tw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mm: hugetlb: Fix subpool usage leak on allocation failure
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

>
> [...snip...]
>
> @@ -3072,13 +3072,10 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  	return folio;
>
>  out_subpool_put:
> -	/*
> -	 * put page to subpool iff the quota of subpool's rsv_hpages is used
> -	 * during hugepage_subpool_get_pages.
> -	 */
> -	if (map_chg && !gbl_chg) {
> -		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
> -		hugetlb_acct_memory(h, -gbl_reserve);
> +	if (map_chg) {
> +		long gbl_resv_put = hugepage_subpool_put_pages(spool, 1);


Sashiko:

Does this violate the subpool rollback protocol in alloc_hugetlb_folio()?

The error path appears to unconditionally pass the full requested amount (1)
to hugepage_subpool_put_pages() instead of the absorbed amount. According
to the subsystem guidelines, error paths should return the difference
between the change and the global reserve to hugepage_subpool_put_pages(),
not the full requested amount.

Ackerley:

Nope, the subpool rollback protocol has changed since the first patch in
this series, where now the subpool always tracks used_hpages. After that
change, pages taken from the subpool should always be returned to the
subpool. The return value from hugepage_subpool_put_pages() can then be
used in hugetlb_acct_memory() to fix up global accounting, like in the
line below.

> +
> +		hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);

Sashiko:

Can this result in silent state corruption and accounting desynchronization?

If alloc_hugetlb_folio() fails (e.g., due to memory pressure) after getting
1 page from the global pool (gbl_resv_get = 1), and concurrently another
thread frees a page to the same subpool dropping used_hpages below
min_hpages, hugepage_subpool_put_pages(spool, 1) will absorb the page into
rsv_hpages and return 0 (gbl_resv_put = 0).

This causes hugetlb_acct_memory(h, 1) to be called, which attempts to
gather a surplus page from the global pool. Since the system is under
memory pressure, this can fail and return -ENOMEM.

Because the return value of hugetlb_acct_memory() is ignored,
spool->rsv_hpages remains incremented without a corresponding credit to
the global pool, which can lead to an integer underflow in resv_huge_pages
and permanent memory management desynchronization.

Ackerley:

Sashiko made the same comment on patch 2 as well. This is a common
pattern on cleanup paths, where the return value is ignored.

I think the fix here would be as described in [1], to flip the
reservation tracking to track an available page count directly, but
that's for another patch series :)

[1] https://lore.kernel.org/all/CAEvNRgGN0HSJ2iLSDD2haSKOxifa-uhkO9Hwossh0+Q_d9fzOw@mail.gmail.com/

>  	}
>
>  out_end_reservation:
>
> --
> 2.55.0.970.g62bdec98f9-goog
