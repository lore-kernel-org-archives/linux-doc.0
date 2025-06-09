Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7353E221289
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 20:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502405; cv=none; b=l9b9gNL3uBz11nlblZs2uCE5rVwLQ0JTJS2P5NztFYy7RlAnu12mpQzYku226+i6mAlbDQvrGCbbb14eyh9f/Pjwni7++Ax0fAg1vq2sy/QOcEeLDx6yCZM6ZkzPIy5YfO+4A4naSxY5PsdtQ0Yup0XKSoi8/YV/4+0EQbzDFTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502405; c=relaxed/simple;
	bh=xTfjhHH9vQBxwDsyrh7a17IOgjamK10rRkl/DAFNZuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2hiRFfv57EFFWLDjCTzn4cAB+SoWeuuuZDTux2W1HGxTnVj6OhAYG3JdWYdHSumdlP0Tt1zexRgR6HXdnzEhCLkRSdJ3zrnJXQhvKp6IcfP3uZyxuNZUPRP/71MdilKtJ1y9K0SklS3x2ZzzMj92eB2FcGabeQs3mCol6z0veg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R158zvrs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R158zvrs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k4HKqC9+1+hVBRYnUrACflYrVkV+3kzqIOKI4fsCD8I=; b=R158zvrszSIawKt1nS0K6eDB5l
	c8aIIe0ZVWN17Z7sbOkSCCm6L+hB9CoTRKPjIjWniXVCVLKPQJaHXaXnZW8WRJEmY6JBYYwGB3EB4
	Gl+4hNPI0qWHLtfmhfMMRaTYYrfUAQw+czSExByR2Pxgtr0QQxQ+4daZ8eLPlwd5ROpYCaPb6ZCYK
	fcGMQQWU5bmQUrm6MLwm4CEVhP9630CaUTugTf02eahHOKvsteGG0Pt2ORMfSZpNky56sbPA/SgU0
	pqmfgVc/zYT6Afao5ERGy3/Bcx8YLRBHvdcFBqOYxp0yheVZ8FIqKk0aWvkkWRbg/I/HEAAq3NB+1
	1prSsNdA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjUf-00000008e4O-1bJb;
	Mon, 09 Jun 2025 20:53:21 +0000
Date: Mon, 9 Jun 2025 21:53:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kernel-doc: Fix symbol matching for dropped suffixes
Message-ID: <aEdJwQAZrTiKWBFI@casper.infradead.org>
References: <20250606141543.1285671-1-willy@infradead.org>
 <877c1kbr4z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c1kbr4z.fsf@trenco.lwn.net>

On Mon, Jun 09, 2025 at 02:23:56PM -0600, Jonathan Corbet wrote:
> "Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
> 
> > The support for dropping "_noprof" missed dropping the suffix from
> > exported symbols.  That meant that using the :export: feature would
> > look for kernel-doc for (eg) krealloc_noprof() and not find the
> > kernel-doc for krealloc().
> >
> > Fixes: 51a7bf0238c2 (scripts/kernel-doc: drop "_noprof" on function prototypes)
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > ---
> >  scripts/lib/kdoc/kdoc_parser.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> I've applied this.  Naturally, it gifts us with a new docs build
> warning:
> 
> > Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> > Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined substitution referenced: "--------". [docutils]
> 
> I was hoping your other slab patch series address this, but it doesn't
> look that way...?

Indeed it does.

It's a pre-existing bug, that's only unmaked by this patch.  Honestly,
I'm not that great at kerneldoc and I was hoping someone like Randy
would notice and fix it ;-)
