Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2927510B
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771902019; cv=pass; b=SDiPzCf4SZDNAIevxfmo8bxsQ41h2acys3LhDqTZw05SkSFqUYDx0vE3EOgiqG3QARUPukWk/rBlUW4AaopVavCgldlD/fnB43S/OwQktB05oNZNgxRwOBrcKLDgxBzrPDkbE0GH8Q5Mu5bpWL0xxWC2/6cV+3/JI0eDZNtaH1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771902019; c=relaxed/simple;
	bh=URG9p5PA0AV/5bQlXeYXvRn2vYf4zuMTvunUlPWBpFY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUM0AZGKO3lA8CnMydMZoQoKoKINEVpj69ppEgPtqBzR5Jqg90mIbJEylZVsm3C7Nfwb6xt+Tbt29gMsB/LH7O7+9rop0kTM2V4eSJkU7JANukXJZXVCmDCdYu+yHlVRBQpw99Ir/7ki4Cwt2za+BcRIZl6OnDRbHHRz8UM5G9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B3ymAhxx; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B3ymAhxx"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5673891928cso2359763e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:00:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771902017; cv=none;
        d=google.com; s=arc-20240605;
        b=XUL61USiacS+W5Wjswk3Pb8sQiTLeF7LGp2SChCOIWHYZrwP0UGtHi9AOL0UVRMNNr
         RqzNaGnEQeVAJRTC8k2zUVOs6LZ3+ZnSTEm7gzqfnZ6NnJWm+ZcDb61E1LcN4fFD5fdZ
         Op76LLWtFu+rM1iSgwtdcCtwfKW+rRyieqbKSDp/Ex4SQ3bA4t2yv4GGtC+DRIl86Dnt
         e6j9CU+MKuZX4rd5ieDEodISb6ZfTu0Ans8oVMz/RDMVOzpvIvyP7T8SXaHcKySPPFGC
         kYR9gc4zwFZZClgV5fig/DSJRz3C+FfnlUmb/ffeOfycUPOOz+Hqs6bGuCI/4Fb9dBJX
         9xHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xFe8WdiYvRsGLyynpqXx4xXBoM9FyyzukwEjWl1pbts=;
        fh=udmMo+tXcFBQimR/3XJ2Io8bHtU3CL7TorEPWszJiFw=;
        b=av662EFl4MiRAGMk49Fa7+INnYYJPPWUNwSCswy3iK3uFqJA3m74jEKQz7Apqux0UQ
         yLarLO+fUekNsjdmuq9O3IKPNrwDDoe3t/hXUBI8wCUnHJEog6uizdZWRYvl3OVjS+pP
         kaUvphy3PfGLJV9MNvQ5euIG217SAYRF54gsNe+J2bQsywgaIvD3IkIWQveZqCuWnWi1
         Vedu5R48O5Iquk1Ozt6+tMYDoahbg9H/Om9vhCqmBPxt1WYJWP1x6FfVOwMeLhFr8DUW
         w4g+fwsLK/Fff09gy8gCIJ6/Lf5YWgYFqtu1X8vmWqCSCgK3t0jvZunoOF1R9ZBaCi5Y
         UmxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771902017; x=1772506817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFe8WdiYvRsGLyynpqXx4xXBoM9FyyzukwEjWl1pbts=;
        b=B3ymAhxxWeoTfsl0KRnGRCZw0Cw7PoBJbPwy3MCpelHkkc67TCEWmEMkObdOJ7M63x
         aX2RR//RrqYDhs5WPF0G0EWfQ1CE6/aG+seMJBt31TstS8q18nx5tCnmFdQEah/GoF7P
         Ss079WND2GVySuBN8bDw9gDHvsG4NBE4TnNHOOQLGkWWYRR/7uYcWg4qgJCBNx4/UowJ
         gFnNLyjfvvBcOici+VtfIlJZQsW4j8pyEFjI3vOLDGpj2CqoWk/UuAdZblk8u+DoAL8Z
         f+bSQDDVDdQSw2aZ2YZimO2Ewz9wgcow+pdeYzKHDwLQFH/+mchjBx2p6Cbbm4VmA8lW
         GgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771902017; x=1772506817;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFe8WdiYvRsGLyynpqXx4xXBoM9FyyzukwEjWl1pbts=;
        b=nU/l2r02MxcP60aqlIivUzW98oljpjQibo5XBX8T8VeFyuNU2Ehows7USKXIEKoDB5
         nw4lpdpNP+CaEfg6AZfQHRQcmG+SATNNKfC2kB4+PfitLFY/k/5fccSefUx5ul2uxsnd
         QRDmbvE9hMPQZ5UgWuw+RNjJhHqHMx11R4cZFpka3O2IpUYGEZe9VHIdPHk9MVVXp2Uj
         VtRv4qFrTZU3GLUP8xuNbPr28fcrVoOtM35DX5kH4fWg9whaTAS/E71oA00tjEkKUHaV
         jV9ajjCG4yYoC5jik+C7P2kN2y6qu9L+xK0FXuBQduUjm/Bvd62eysWbOCfsq9RMC/iY
         GwEg==
X-Forwarded-Encrypted: i=1; AJvYcCXdNHe9CIahHevHA02HnJ6WbTfv/44K+v7kIF3nED2cEvCn6cx5es5z32fLkFE/k2HX6yTbaB70hY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YykmQ4pBUJhOzi+FisqJdf43Fb9SEHrOdJ0BHsu3mRELuJDucVw
	gJKXu1Djc25CtP2UMW/iLu1CRRck1NYg4H7GIxQ5WSuA/SqcgYntIvgta16txauOjtei3WtPzcZ
	DTMi1D5xzzYFLWV91GeXUMnWdLAWAbnnnBvuPAc33
X-Gm-Gg: ATEYQzyyFThajC3stazHT68Ih0NcTFs28Zo0eIGTAe1pxFGuAItyOxwepKp+iffwyAB
	RswTJiEW4TdPfR3/SxtMa9jt1pRwdPIi8RIYO4+royNbCtvXwQpQat+chuAb3+G88/Pbkiz9ZTh
	XjPF9vaZ6MVO3D+dpssK6KYvjFjq2pD1Ss9rD4HOTaJoR3F5TM9x6moZpNkNd9OnNvdeNZBRZD1
	S0dolSm3tnUThwLqSUo4HQSpQvLoo7lJEM84B5ekBx2Py33eRi1VxH2AsgFgguxwwMyN/lIq+vG
	OZpGEC6vpfqlPkkPb/9jq37C3Vc8lHR3Ocx6mmrSIL8GBf6EEjzaELaswm7JdEP/vw==
X-Received: by 2002:a05:6102:3048:b0:5f8:e2cb:d245 with SMTP id
 ada2fe7eead31-5feb2c23567mr4062890137.0.1771902016820; Mon, 23 Feb 2026
 19:00:16 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Feb 2026 19:00:16 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Feb 2026 19:00:16 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <0100019bd33bf5cc-3ab17b9e-cd67-4f0b-885e-55658a1207f0-000000@email.amazonses.com>
References: <0100019bd33b1f66-b835e86a-e8ae-443f-a474-02db88f7e6db-000000@email.amazonses.com>
 <20260118223110.92320-1-john@jagalactic.com> <0100019bd33bf5cc-3ab17b9e-cd67-4f0b-885e-55658a1207f0-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Feb 2026 19:00:16 -0800
X-Gm-Features: AaiRm52vebMvqU0lH0n0vOtDAX6OI7Y7um56VSKnaZ96AOmxaI9gmZymUaqHfu0
Message-ID: <CAEvNRgHmfpx0BXPzt81DenKbyvQ1QwM5rZeJWMnKUO8fB8MeqA@mail.gmail.com>
Subject: Re: [PATCH V7 02/19] dax: Factor out dax_folio_reset_order() helper
To: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, 
	Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>, John Groves <jgroves@fastmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

John Groves <john@jagalactic.com> writes:

> From: John Groves <John@Groves.net>
>
> Both fs/dax.c:dax_folio_put() and drivers/dax/fsdev.c:
> fsdev_clear_folio_state() (the latter coming in the next commit after this
> one) contain nearly identical code to reset a compound DAX folio back to
> order-0 pages. Factor this out into a shared helper function.
>
> The new dax_folio_reset_order() function:
> - Clears the folio's mapping and share count
> - Resets compound folio state via folio_reset_order()
> - Clears PageHead and compound_head for each sub-page
> - Restores the pgmap pointer for each resulting order-0 folio
> - Returns the original folio order (for callers that need to advance by
>   that many pages)
>
> This simplifies fsdev_clear_folio_state() from ~50 lines to ~15 lines while
> maintaining the same functionality in both call sites.
>
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: John Groves <john@groves.net>
> ---
>  fs/dax.c | 60 +++++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 42 insertions(+), 18 deletions(-)
>
> diff --git a/fs/dax.c b/fs/dax.c
> index 289e6254aa30..7d7bbfb32c41 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -378,6 +378,45 @@ static void dax_folio_make_shared(struct folio *folio)
>  	folio->share = 1;
>  }
>
> +/**
> + * dax_folio_reset_order - Reset a compound DAX folio to order-0 pages
> + * @folio: The folio to reset
> + *
> + * Splits a compound folio back into individual order-0 pages,
> + * clearing compound state and restoring pgmap pointers.
> + *
> + * Returns: the original folio order (0 if already order-0)
> + */
> +int dax_folio_reset_order(struct folio *folio)
> +{
> +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> +	int order = folio_order(folio);
> +	int i;
> +
> +	folio->mapping = NULL;
> +	folio->share = 0;
> +
> +	if (!order) {
> +		folio->pgmap = pgmap;
> +		return 0;
> +	}
> +
> +	folio_reset_order(folio);
> +
> +	for (i = 0; i < (1UL << order); i++) {
> +		struct page *page = folio_page(folio, i);
> +		struct folio *f = (struct folio *)page;
> +
> +		ClearPageHead(page);
> +		clear_compound_head(page);
> +		f->mapping = NULL;
> +		f->share = 0;
> +		f->pgmap = pgmap;
> +	}
> +
> +	return order;
> +}
> +

I'm implementing something similar for guest_memfd and was going to
reuse __split_folio_to_order(). Would you consider using the
__split_folio_to_order() function?

I see that dax_folio_reset_order() needs to set f->share to 0 though,
which is a union with index, and __split_folio_to_order() sets non-0
indices.

Also, __split_folio_to_order() doesn't handle f->pgmap (or f->lru).

Could these two steps be added to a separate loop after
__split_folio_to_order()?

Does dax_folio_reset_order() need to handle any of the folio flags that
__split_folio_to_order() handles?

>  static inline unsigned long dax_folio_put(struct folio *folio)
>  {
>  	unsigned long ref;
> @@ -391,28 +430,13 @@ static inline unsigned long dax_folio_put(struct folio *folio)
>  	if (ref)
>  		return ref;
>
> -	folio->mapping = NULL;
> -	order = folio_order(folio);
> -	if (!order)
> -		return 0;
> -	folio_reset_order(folio);
> +	order = dax_folio_reset_order(folio);
>
> +	/* Debug check: verify refcounts are zero for all sub-folios */
>  	for (i = 0; i < (1UL << order); i++) {
> -		struct dev_pagemap *pgmap = page_pgmap(&folio->page);
>  		struct page *page = folio_page(folio, i);
> -		struct folio *new_folio = (struct folio *)page;
>
> -		ClearPageHead(page);
> -		clear_compound_head(page);
> -
> -		new_folio->mapping = NULL;
> -		/*
> -		 * Reset pgmap which was over-written by
> -		 * prep_compound_page().
> -		 */

Actually, where's the call to prep_compound_page()? Was that in
dax_folio_init()? Is this comment still valid and does pgmap have to be
reset?

> -		new_folio->pgmap = pgmap;
> -		new_folio->share = 0;
> -		WARN_ON_ONCE(folio_ref_count(new_folio));
> +		WARN_ON_ONCE(folio_ref_count((struct folio *)page));
>  	}
>
>  	return ref;
> --
> 2.52.0
