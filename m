Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F130DD33
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080937; cv=none; b=XsKO4DjJ3W6tPbP6XMUxCdNli5pA+iIQcpFpLwsbr6rrq77NqtWUaHwAM7D304/KXHWlgjQw/FG9+/kY1SbPjdYngcgWNZ7BTOd+VGXbUzW6KKNkxlWzDEqZ10mHfJU2knouxcYLuoN9GnvxmF8T/GyWzrDi/8nXDyNmcFrKqOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080937; c=relaxed/simple;
	bh=jY+6Ux20wmAFYj3ZDCilg3Fqqbo+VmiY4n3Np5FgRm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ye4q8pYeOwKi21IpS5W8AtmVeGz+jxyeCnqCAyXDPilQj/5YNWdI2AFft4mRzBisOsnxnoKkz3/khGXN/EtK/ImFH/LvIVFarQNrrr2GtEeIZ2zNznlk38uPwOcurwPyqZnddwIewLXlqIUNVsCnTfp2POeoRu/KpICB9kY4Wl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leq43Xet; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leq43Xet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9D8C116C6;
	Thu, 22 Jan 2026 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769080937;
	bh=jY+6Ux20wmAFYj3ZDCilg3Fqqbo+VmiY4n3Np5FgRm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=leq43XetGnDXXtvqHTjKeItp3KNx+DDMtPw1s5gocZ8JZcOVKbh2kANQuBw0oiQP7
	 RcyrZZhqvtf5l+1ewnHEc3BVJ1sQfjzwg86hhTLmkruGXuEYyql0ggI4F/BBysV4Tb
	 IKi4LXoYMLEZ1rqkqSYRep8H60OExdD5ib9xqpDQwxPzVdI7CXfBHkBnlK1z7v/QX7
	 V13UHE/81zIHBcZ4mFq3O3APxv2Iz9HgYHE2Z+npQEb+38kFcR+wujTdmgyI3rBJiG
	 0cYRKGR1izAyO2ed8JYo3oAnFew+nA0euAHU+hGkKmuZgdK5E8fXG8FRbFecmrM6cW
	 78kKI9FwVRr4A==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id ACECAF40068;
	Thu, 22 Jan 2026 06:22:15 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 22 Jan 2026 06:22:15 -0500
X-ME-Sender: <xms:ZwhyaQgWAfOH5lPwJgyrs-1gnAF3m2Q_4HcwNASz1Wv5_4mcWd2WBA>
    <xme:ZwhyaUaw4M6u1dYaCv8I1qbUHy5fw5JTmQXxAUuhU4z093UynXs2devRrnsryUzF6
    gh0QFGT1fUJ9JpFl6-zIUKCCFRArrHh_HJOF9H9AMymNmgciToKJ_s>
X-ME-Received: <xmr:ZwhyaRf4QlVc7Un7uAwP62xF5Uw-EuYl_qXiO17SEqS_gTccYq3lwtqHl2Lgqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeitdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ZwhyaZCTB5OcS3eOXlUVRsza8Mk5ui0vmfXzK8uhni8MMHhczov2CQ>
    <xmx:ZwhyaZUfNlcv87PL6radnVQe0suIWRGxFuVaHWbDiEK67YiN8QDfYg>
    <xmx:ZwhyaWV6LLQYMDzWw7XCWfHhxPccglpvxFKKl-7xF3g8WJxYkHn9Uw>
    <xmx:ZwhyaU-lJOCqpcT1VSUvYV18KCDrf_kLwGbyfShy68v6e2_LFFAj7w>
    <xmx:ZwhyaU-3VxbqCvRnTFqbNoCpS4ywUnwbelmbJoJ0-tY8kcd-el4eCVQS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jan 2026 06:22:13 -0500 (EST)
Date: Thu, 22 Jan 2026 11:22:08 +0000
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
Subject: Re: [PATCHv4 07/14] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
Message-ID: <aXIIOf7cHe9hzk0W@thinkstation>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-8-kas@kernel.org>
 <B752281D-4A31-4E2D-945B-FD18016B722E@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B752281D-4A31-4E2D-945B-FD18016B722E@nvidia.com>

On Wed, Jan 21, 2026 at 12:58:36PM -0500, Zi Yan wrote:
> On 21 Jan 2026, at 11:22, Kiryl Shutsemau wrote:
> 
> > If page->compound_info encodes a mask, it is expected that memmap to be
> > naturally aligned to the maximum folio size.
> >
> > Add a warning if it is not.
> >
> > A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> > kernel is still likely to be functional if this strict check fails.
> >
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > ---
> >  include/linux/mmzone.h | 1 +
> >  mm/sparse.c            | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 390ce11b3765..7e4f69b9d760 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -91,6 +91,7 @@
> >  #endif
> >
> >  #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
> > +#define MAX_FOLIO_SIZE		(PAGE_SIZE << MAX_FOLIO_ORDER)
> >
> >  enum migratetype {
> >  	MIGRATE_UNMOVABLE,
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index 17c50a6415c2..5f41a3edcc24 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -600,6 +600,11 @@ void __init sparse_init(void)
> >  	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
> >  	memblocks_present();
> >
> > +	if (compound_info_has_mask()) {
> > +		WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
> > +				    MAX_FOLIO_SIZE / sizeof(struct page)));
> > +	}
> > +
> 
> 16GB is only possible in arm64 with 64KB base page. Would it be overkill
> to align vmemmap to it unconditionally? Or how likely will this cause
> false positive warning?

CMA can give you 16GiB page on x86.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
