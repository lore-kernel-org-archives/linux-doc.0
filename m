Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B949C2DC346;
	Fri,  9 Jan 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995353; cv=none; b=IwkIj8APr0RMPyT9kcfNkb3xiA8ZH8mZJDb000m+EMS/f/SuuMSCF8sBV8tZ3uq/q1fEmVv9t0kTX7JkWtq0JK9oJcfdj6qGKnvMijmVwSgMfQZeeB4wioaU/Kg0DDLgRBv10ZDcie0AxjdkVubelwUdSzu22p+XCfplQclDbLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995353; c=relaxed/simple;
	bh=EgwIRxCE7NBEwrjs6mW++brS6hx4N8GlMYb1C9Tr9J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpPbqe8iVLIzFzIkQFIjIeYWfTkO2o6kNNjSJ35W5w1y+da0UdNqWHm+l5xzFLaDrCw3AI8Aa82aMDGirGW9uNHInx5mH6D+g51cvjWA1OtjQ6tID2W9OE/RLCtfOY/CJJ24NkZYoBNk+Eu0M9YL25z2uwG+JCel+gLKGGwSDnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CIblYblt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CIblYblt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=orAWW0c9GM9UfFj1bpBTGics8DndOWhf3L60HJQWvmU=; b=CIblYblt2QgPrKx3QV6je9i5NO
	b5D9A+fy3pKImVmulgWOInglXBy/bZ+pIiHIz2jHFd5YFQ+fikGiN+Ebi4kSv1olSUOb49gcwx63T
	ddfzoRqj/5wVX7Hxniu1P+CkJa+3A60OThU0xO0Bkubl32FVEl9jrdMebeUKAwVZBcxEhPzJ3E2nP
	OW5vKQx1mkaWU0c+13X3ju4UD8T4pRoV7EdhMolpqFfB6CzLvz1OswWlprXwekbvUKsy8aFavslul
	yMf/csPpYE8oxci/ITWIWs5gEhVzDS0rwDv6uz9mwcIMP8VvjEQI2t36t8ON+8vUOrlR5kQHJfp05
	mmY9OKQw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veKLm-0000000HO7U-26lC;
	Fri, 09 Jan 2026 21:48:54 +0000
Date: Fri, 9 Jan 2026 21:48:54 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
Message-ID: <aWF3xg-72SV4tmLk@casper.infradead.org>
References: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
 <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
 <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>
 <glu3noshgeh7ktwwqofk7xcwkvhek2x3hrbdmyyo56gmctdx3t@adsfih557p7g>
 <2ace6fc2-6891-4d6c-98de-c027da03d516@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ace6fc2-6891-4d6c-98de-c027da03d516@kernel.org>

On Thu, Jan 08, 2026 at 12:08:35AM +0100, David Hildenbrand (Red Hat) wrote:
> > > "Then we make page->compound_head point to the dynamically allocated memdesc
> > > rather than the first page. Then we can transition to the above layout. "
> > 
> 
> Sorry for the late reply, it's been a bit crazy over here.
> 
> > I am not sure I understand how it is going to work.
> > 
> 
> I don't recall all the details that Willy shared over the last years while
> working on folios, but I will try to answer as best as I can from the top of
> my head. (there are plenty of resources on the list, on the web, in his
> presentations etc.).
> 
> > 32-byte layout indicates that flags will stay in the statically
> > allocated part, but most (all?) flags are in the head page and we would
> > need a way to redirect from tail to head in the statically allocated
> > pages.
> 
> When working with folios we will never go through the head page flags.
> That's why Willy has incrementally converted most folio code that worked on
> pages to work on folios.

A little more detail here:

 - Zone/Node/Section stay in page->flags and are replicated to
   folio->flags
 - HWPoison stays in page->flags
 - Reserved stays in page->flags
 - AnonExclusive stays in page->flags
 - Writeback/Referenced/Uptodate/Dirty/LRU/Active/Workingset/Owner1/
   Owner2/Reclaim/Swapbacked/Unevictable/Dropbehind/MLocked/Young/Idle
   all exist only in folio->flags
 - Head/Private/Private2 all go away
 - Locked & Waiters are ... complicated.  I'll elaborate if there's
   demand.
 - I haven't put any effort into analyzing the Xen flags.
 - HasHWPoisoned/LargeRmappable/PartiallyMapped all move to folio->flags

> When the program was called "2025" I considered it very ambitious :) Now I
> consider it ambitious. I think Willy already shared early versions of the
> "struct slab" split and the "struct ptdesc" split recently on the list.

ptdesc, yes.  Slab is still in progress.

> For quite some time there will be a magical config option that will switch
> between both layouts. I'd assume that things will get more complicated if we
> suddenly have a "compound_head/folio" pointer and a "compound_info" pointer
> at the same time.

What I'm hoping to get to is a point where calling compound_head() on
a page which is part of a folio is a BUG.  You should only be calling
page_folio() on a page which is part of a folio -- because there's nothing
useful to find in the head page.  So compound_head (or compound_info) can
share space with page->memdesc.  For now I've actually put page->memdesc
adjacent to page->compound_head, for no reason that I can recall.

I had thought that calling page_folio() on a page that's not part of
a folio would also be a BUG(), but now I think it's better to quietly
return NULL.  That's based on my experience working with slab and ptdesc.

