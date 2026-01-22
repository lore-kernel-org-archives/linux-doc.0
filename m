Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4172D595D
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086107; cv=none; b=TtOXvHxmc2Ig+DP9J4qNnAZuSehQqDwPKhTR0dhbTUylzrtalf1ZjW3wkvmS8GLJibDl+5rWu13aPFaxysVxxt8rvEmETMCCYHvpRde4TdURapEelXhJYtGBj1okxP3rGyOYV0FB9jAVuywSiDkS1G/h2M2QvNzwDuWs5UP48Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086107; c=relaxed/simple;
	bh=XakBjuBXojiy+bHqbnq0M9HVpyzFj/6SSmtXTz/8WSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYaro/Z2RnON9vovDLJSLuD8UTqYUjUOUmfCEKAIyl0+kNQetQuEAx+CinOT/z5UeqqKAv/eSheA5djdoUaxtZQklAzQEzh8aL+LBCr7y45au59CgFzAsD+9SryqfQZjql+p9/RTmrghmjOQDPOA96aIhnlGupXv5cIUm739RHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwig5yiG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwig5yiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FACC116C6;
	Thu, 22 Jan 2026 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769086107;
	bh=XakBjuBXojiy+bHqbnq0M9HVpyzFj/6SSmtXTz/8WSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwig5yiGmNbF3J8rJf4aQHvL1/VhfY9YyNF1noSCKpZ/pOhmhddne9G2/Lo8nVNN/
	 oVxxYWZMVVK+E97wikNkZPIbA6pz0Hb6AHB6iTOxQF1NhgHNut4c1Woh/QC/iiwGC0
	 B1RC2M+doPnowNPdiYsr7AAYMKIf5sUctl4/w3ZDStOi38KfD+PJ6KkcFFkL3R5+pZ
	 BV5P7N7FlH08HUS/u2NhXQfBcl8f0zz6+5k3tPBKU0N9VcYGzcMZTlETk1ojAW7voO
	 KKf9ifSFoKK+kjqgbrqp0YaEbQXuqyWvHvpe62uH/N2l1rk7muuS/wIaDnbZ99UWrC
	 1HML6ZmeEHEpA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id BCC57F40068;
	Thu, 22 Jan 2026 07:48:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 22 Jan 2026 07:48:25 -0500
X-ME-Sender: <xms:mRxyaf07nYM300m4gkNaHVnaCjPgEtFG54FV7TczcMF-cpLZNeAefg>
    <xme:mRxyaZf3Uh_Lg9hXAHRx9Iel3o11mcfhTLTMfHzPtYr3TJt-HskShKWJrxy4Rf-sm
    dlAeXtq4mLb4v4tNgUG3vVSPxq9Yg-OQPTuXC_e8djrn3VwW-qyKDPJ>
X-ME-Received: <xmr:mRxyaZQbqj6i1HzbnPIkL5N9JFggpUV3BLFbIrKjAvQjxiHukFUCWlXJl78LRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeivddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeiiihihsehnvhhiughirgdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugi
    dqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhnghes
    lhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuhhs
    rghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhvughlsehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpdhr
    tghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mRxyacn9D7tHxO73dCr2PVDNBWZ_3BLr64tZA5QcxHz95v6v_ixPpw>
    <xmx:mRxyadqPxkwzYfYU1oW30JieKjzGKsLbX2h47WA5BA-eaDKycsVn_g>
    <xmx:mRxyacZFJl10uQZTwAGdk4Q2Aq7cYMSsUKEKoj_eS7XmjLUkmWSoCw>
    <xmx:mRxyaZxjpdon9XMRbJpji66w0Ew4gdcXgBVa8klsNKcQUJrk50xCtQ>
    <xmx:mRxyaRjsHZ97UOc1TLQZdQCca8gXkbDB_uuRCitETwpj-f8D15DbUN0z>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jan 2026 07:48:25 -0500 (EST)
Date: Thu, 22 Jan 2026 12:48:24 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 10/14] mm: Drop fake head checks
Message-ID: <aXIblgtZ-b9SCp7O@thinkstation>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-11-kas@kernel.org>
 <28A56ACE-55E9-48A9-9EB6-696695ABB254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28A56ACE-55E9-48A9-9EB6-696695ABB254@nvidia.com>

On Wed, Jan 21, 2026 at 01:16:23PM -0500, Zi Yan wrote:
> On 21 Jan 2026, at 11:22, Kiryl Shutsemau wrote:
> 
> > With fake head pages eliminated in the previous commit, remove the
> > supporting infrastructure:
> >
> >   - page_fixed_fake_head(): no longer needed to detect fake heads;
> >   - page_is_fake_head(): no longer needed;
> >   - page_count_writable(): no longer needed for RCU protection;
> >   - RCU read_lock in page_ref_add_unless(): no longer needed;
> >
> > This substantially simplifies compound_head() and page_ref_add_unless(),
> > removing both branches and RCU overhead from these hot paths.
> >
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > Reviewed-by: Muchun Song <muchun.song@linux.dev>
> > ---
> >  include/linux/page-flags.h | 93 ++------------------------------------
> >  include/linux/page_ref.h   |  8 +---
> >  2 files changed, 4 insertions(+), 97 deletions(-)
> >
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index e16a4bc82856..660f9154a211 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -221,102 +221,15 @@ static __always_inline bool compound_info_has_mask(void)
> >  	return is_power_of_2(sizeof(struct page));
> >  }
> >
> > -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> >  DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
> >
> > -/*
> > - * Return the real head page struct iff the @page is a fake head page, otherwise
> > - * return the @page itself. See Documentation/mm/vmemmap_dedup.rst.
> > - */
> > -static __always_inline const struct page *page_fixed_fake_head(const struct page *page)
> > -{
> > -	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
> > -		return page;
> > -
> > -	/* Fake heads only exists if compound_info_has_mask() is true */
> > -	if (!compound_info_has_mask())
> > -		return page;
> > -
> > -	/*
> > -	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
> > -	 * struct page. The alignment check aims to avoid access the fields (
> > -	 * e.g. compound_info) of the @page[1]. It can avoid touch a (possibly)
> > -	 * cold cacheline in some cases.
> > -	 */
> > -	if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
> > -	    test_bit(PG_head, &page->flags.f)) {
> > -		/*
> > -		 * We can safely access the field of the @page[1] with PG_head
> > -		 * because the @page is a compound page composed with at least
> > -		 * two contiguous pages.
> > -		 */
> > -		unsigned long info = READ_ONCE(page[1].compound_info);
> > -
> > -		/* See set_compound_head() */
> > -		if (likely(info & 1)) {
> > -			unsigned long p = (unsigned long)page;
> > -
> > -			return (const struct page *)(p & info);
> > -		}
> > -	}
> > -	return page;
> > -}
> > -
> 
> <snip>
> 
> >  static __always_inline unsigned long _compound_head(const struct page *page)
> >  {
> >  	unsigned long info = READ_ONCE(page->compound_info);
> >
> >  	/* Bit 0 encodes PageTail() */
> >  	if (!(info & 1))
> > -		return (unsigned long)page_fixed_fake_head(page);
> > +		return (unsigned long)page;
> 
> Is this right? Assuming 64B struct page and 4KB page size, thus 64 struct pages
> in a page, the 64th struct page (0-indexed) is mapped to the head page and
> has !(info & 1). But _compound_head() should return page & info here.
> Am I missing something? Thanks.

The point of removing fake heads is the we don't have head aliases
anymore. 64-th struct page will be a tail page that. No special
treatment is required.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
