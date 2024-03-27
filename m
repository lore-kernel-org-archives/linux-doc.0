Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BB012FF60
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711551311; cv=none; b=RFD60hkytqjb1TP/qNlq0dHks5DjPsfPFQ/GWqVIHPjdvR+bxEKiZZNTLpXhngtQFBu9jOzc2yGqdREuThS2dRdpp+v+jDT4yYUTQFUY0V3ay+oSw8I4VaFnE3879j7IKFeiq2ZHDDxF5+5NPwmDvG0oHoCI6oyALZKMLLRGEhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711551311; c=relaxed/simple;
	bh=eVemvaShgmPXMlKYUsbUe6TWXbYolN49HBttowUbBzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6w5wmvdRr+KLe/99C3VyiL7oIM084PoU4B8XSE/JH/1tAjpa241PBae45J9FebtK74VMMSlUBOzBkmEgOC9wOguUoTfk+pIvxWgVT8mmj6bRo2Liq4zHapfpg/NGLSSEQwBywN6DYoTOAFt59ZRTC8ZbTZyYw9vCu4ILTADclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MyS1Vics; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MyS1Vics"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IduhVoEXITgu5PB2sYTzZLulUg47EQpG6mGEPr8zYW0=; b=MyS1VicsAnH2uq78dHydKSSUAL
	YuQdxOcG0MDEiqW/5QNc/gqOjY6TOfNRlzw6DFk9sLSISylwXNt8Pw5Xx0vgU2str/YqjHRr8xZa7
	khmiO4/mFJDXjp7PIz1fVEX1vp2j3K3CvmcpFn0UQZvVK8Gexp7aEWBLf1HaSV7qUyTIVllwMzPz9
	11F+JWim2uGlBUk6a4erIHajL6DBOVLWb2PnzETjzyb19IZdHa8reF6O5LTlKSaohIV5aM7V87wIL
	nbno1S1J4MmGaiFiCDexQwxnOhQAm+OxqWJnU2Opq6p5hn8BMspKVdJ1ROC8kdM9N/TgGjY8AYi35
	W2bftCCQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUg1-000000045du-1rrn;
	Wed, 27 Mar 2024 14:54:53 +0000
Date: Wed, 27 Mar 2024 14:54:53 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Hugh Dickins <hughd@google.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 2/6] mm: memory_hotplug: use more folio in
 do_migrate_range()
Message-ID: <ZgQzPVdfF4lFaqs5@casper.infradead.org>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-3-wangkefeng.wang@huawei.com>
 <01BB19DC-3807-4954-A04A-55518301B6BA@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01BB19DC-3807-4954-A04A-55518301B6BA@nvidia.com>

On Wed, Mar 27, 2024 at 10:45:42AM -0400, Zi Yan wrote:
> >  	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
> > -		struct folio *folio;
> > +		struct page *page, *head;
> 
> You could get rid of head too. It is only used to calculate next pfn,
> so pfn = folio_to_pfn(folio) + folio_nr_pages(folio) - 1 would work.
> 
> And the PageHuge(page) and PageTransHuge(page) can be simplified, since
> their pfn calculations are the same. Something like:
> 
> if (folio_test_large(folio)) {
> 	pfn = folio_to_pfn(folio) + folio_nr_pages(folio) - 1;
> 	if (folio_test_hugetlb(folio)) {
> 		isolate_hugetlb(folio, &source);
> 		continue;
> 	}
> }

How much of this is safe without a refcount on the folio?


