Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5679832B112;
	Mon, 17 Aug 2026 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966335; cv=none; b=YX364URB0mzEg5vj/QL4z3OsgMA26h1eTZkL1gyn4qwPJox7d56pijQMvZBN3MORMWs2wqck3gJJJRkYxjyTTzxyeSJIAu3YHwTLg2NPuWGrToYM1nzG/G6xsVh4Au5wHtY/jslJ6PyWarz0B0KJstWNm5L9vNIrI/n/xCokDp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966335; c=relaxed/simple;
	bh=RugezvkQHbPQPlngZxuPGan2NoeuV3ACeJ9bFlaRpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XP3a9pXLRXccGHDtcIFc1eEPBQuGMs5Y5gUJUxe21iyNuNIDe0+vTBfXuLLfRUH9qL36P14CM1igFhiZ25VcJnPGigeNAzMwXVtA7bx3siumKko0FHs1qi+chlFtuhA0QQTy7eeiK1VH84XCnF6Jam9fzzutNLjq55t/KiwRh8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3uQIP1q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3uQIP1q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD9E1F000E9;
	Mon, 17 Aug 2026 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786966334;
	bh=DTlJJQcM8pU6vk1pmcyVf5zZFnfSwwWA2cJ9LuzJSqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z3uQIP1qLZMwu/5dFRFnYba/NlMZ4a6dgptRC0hlYZpRaQS5dCs7Cgp82k21wbr2Z
	 CEsiJpWD53fPeFzvSF8Xzk0qgI46xkC3PwQQCt6VVwTKueGIYktkR0WtZDW1LRP48M
	 1J6HJpN3kld5RYwmvd+2e/zcixbQyE2batnnwXy/GqxgH4fdQexVZZkgM37fuBhaOf
	 arp2oRbzY5hw9PNFx0d8uB2EN4477ABeg+Ky5VM6BQJb8CRbuxXBhxLAHa5q4W74MW
	 ccbbyagzfYc9MDUDg8t/Pe5ku4/wtJnv7Ps5Or2JPykvCwEL72uNs3ucmmHFyky4pP
	 5wLXW9T97m2ug==
Date: Mon, 17 Aug 2026 12:31:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 2/7] mm/khugepaged: extract reference check into
 folio_pte_referenced() helper
Message-ID: <aoLw_x_iVTPgm6wy@lucifer>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
 <a23dd413-1462-4b7a-9ce1-136e1d806ed8@kernel.org>
 <b4b24576-507b-4617-b1b3-f03ef31934bd@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4b24576-507b-4617-b1b3-f03ef31934bd@linux.dev>

On Wed, Aug 12, 2026 at 06:19:01PM -0600, Nico Pache (Red Hat) wrote:
>
>
> On 8/11/26 9:47 AM, David Hildenbrand (Arm) wrote:
> > On 8/11/26 14:48, Nico Pache (Red Hat) wrote:
> >> This change deduplicates the "is this PTE/folio referenced enough to be
> >> considered for a collapse" condition that was repeated in both
> >> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
> >> a single inline helper function.
> >>
> >> Also move the comment and use it as the function header. While we are at
> >> it, updated the comment to clarify that a young pte is a recently accessed
> >> one.
> >>
> >> Acked-by: Usama Arif <usama.arif@linux.dev>
> >> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> >> ---
> >>  mm/khugepaged.c | 32 ++++++++++++++++++--------------
> >>  1 file changed, 18 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >> index 1e26ea97381a..8babd4c97db6 100644
> >> --- a/mm/khugepaged.c
> >> +++ b/mm/khugepaged.c
> >> @@ -672,6 +672,22 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
> >>  	}
> >>  }
> >>
> >> +/*
> >> + * folio_pte_referenced() - Check if a folio or its PTE mapping was recently used
> >> + *
> >> + * Return: true if recent access was observed through either the folio state
> >> + * or the current PTE mapping.
> >> + */
> >
> > No need for doc for such a trivial internal helper :)
>
> Ok sounds good I can send a fixup to remove it. Lorenzo has often asked for
> these when I've introduced functions, so I've got in the habit of including them.

Yeah here it's probably not so necessary as what it does is somewhat inferred,
more so useful for shared functions and those which have more complicated/less
clear logic :)

>
> >
> >> +static inline bool folio_pte_referenced(struct folio *folio,
> >> +		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
> >> +{
> >> +	/* The folio was referenced previously ... */
> >> +	if (folio_test_young(folio) || folio_test_referenced(folio))
> >> +		return true;
> >> +	/* ... or the PTE mapping was recently used */
> >> +	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
> >> +}
> >> +
> >
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
> Thank you :)
>
> >
>

--
Cheers, Lorenzo
