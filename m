Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B4345CB0
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769081297; cv=none; b=XTAPzE6rmCxSt5VNHvAoI98O6HIXqRc0tnUol04YvLMB3JJ52l87EZChJQg/wez2BqqGKZzKcDbrA433CM5x57fCZl/QT+LxQI9cRbvJ15p+OG8het9NKNlV7Mkqv4iaqd3g563+PgqJLIIy/+VoCqZlfWWaaam4LkK6yYrD+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769081297; c=relaxed/simple;
	bh=s85LSQ98zPehLqlPlUskxnpBekc7C4QKSHYgSt9xYsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3E5Ed6E1m70Z3OODRyjHyVY61T+/yeMxIdw4hVjcOUtCIUYix1xSdcYKVKT/48qw7mp5kY3DnvPPuJhqLIqSvGfl1FTx+k6luC7uP1WOlcQjHRfs0BYImCQ1/t8+jPIJRyNkiAx477y5/JT4ClCQrIIHx+scVjEDj8xNCKnMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqJz/s0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqJz/s0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48579C116D0;
	Thu, 22 Jan 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081296;
	bh=s85LSQ98zPehLqlPlUskxnpBekc7C4QKSHYgSt9xYsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqJz/s0v6sq3IjiwE/1KDGRE5tGn717LYQ9DSw1c/gCfcHl7AQX7UIqU/3sKNwX62
	 st78LAoeoCBT/RMyxGL4Jt4J1shCkBUXFS6k4+faQZXLh0LRl8wqGtbHfixknzsOK2
	 Ju8bGpTiChCXjQlVWZO6nMck18nb8HEVN8kpoPm3XLWkbq5dkAnpaOjsHZ4KuzdUox
	 N4pTs8DJ8PQBFX3yw+HPtNqCyBCZN7dYppDSUKAuzn/uiF7zVSLKHNJyWgjERZs+9y
	 eKACb8rBYpNEXbbuv3GaGCOpWvRh9GfdWzbrq82ZtmVZ+//dmMXaqfCwDOk0dJox7z
	 tM8n1SEXjcbgg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6775EF40068;
	Thu, 22 Jan 2026 06:28:15 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 22 Jan 2026 06:28:15 -0500
X-ME-Sender: <xms:zwlyaThW56DjQo1FzLP3FyaL4liFZMOQnJjLm0G1JXM2XVQslYnucA>
    <xme:zwlyabYk1YPnsTjqQc_wAEtyYQ_cFBexo35NIgQ4rW_8-5SmcFLENg6jDfhkU2HPn
    q1d5wLbKBxF3ePq00xhLS7yDtHqbeNM-aYLUtmWtVvwk4JVy6gZHB8>
X-ME-Received: <xmr:zwlyaccrNXmxqjReNxu4sy_ER45Ds_tr7_M0-iS0_jN49imbQ8dNOuRFQxdSRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeitdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtoheprghkph
    hmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurghvihgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:zwlyaYC118H7-MgDnUXGH-gvbhXqnoGxJf7sHEIdS6hqxNGy2SFG_w>
    <xmx:zwlyacUykq35UA0FS8CyOaGXw1_29u1Paj7-oe2Tx4bT15ey7l6oJQ>
    <xmx:zwlyadXF3YL3ac-lhXq1PTg4qwlkIwjYyPJupjDFO62Mnv9zwZbR-Q>
    <xmx:zwlyaf9jqNbLLyfNgrqu5iG0xLjIYCbUzh9JTxHHD3iMK2bVLYnYwg>
    <xmx:zwlyaT8IAtQhHCfGmFYwJxJAiNEIj4T-KgMWLWLFxElfQkB-wW63s63q>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jan 2026 06:28:13 -0500 (EST)
Date: Thu, 22 Jan 2026 11:28:06 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 07/14] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
Message-ID: <aXIJY5irR0obgdQe@thinkstation>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-8-kas@kernel.org>
 <71F051F2-5F3B-40A5-9347-BA2D93F2FF3F@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71F051F2-5F3B-40A5-9347-BA2D93F2FF3F@linux.dev>

On Thu, Jan 22, 2026 at 11:10:26AM +0800, Muchun Song wrote:
> 
> 
> > On Jan 22, 2026, at 00:22, Kiryl Shutsemau <kas@kernel.org> wrote:
> > 
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
> > include/linux/mmzone.h | 1 +
> > mm/sparse.c            | 5 +++++
> > 2 files changed, 6 insertions(+)
> > 
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 390ce11b3765..7e4f69b9d760 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -91,6 +91,7 @@
> > #endif
> > 
> > #define MAX_FOLIO_NR_PAGES (1UL << MAX_FOLIO_ORDER)
> > +#define MAX_FOLIO_SIZE (PAGE_SIZE << MAX_FOLIO_ORDER)
> > 
> > enum migratetype {
> > MIGRATE_UNMOVABLE,
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index 17c50a6415c2..5f41a3edcc24 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -600,6 +600,11 @@ void __init sparse_init(void)
> > 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
> > 	memblocks_present();
> > 
> > + 	if (compound_info_has_mask()) {
> > + 		WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
> > +    			MAX_FOLIO_SIZE / sizeof(struct page)));
> 
> I still have concerns about this. If certain architectures or configurations,
> especially when KASLR is enabled, do not meet the requirements during the
> boot stage, only specific folios larger than a certain size might end up with
> incorrect struct page entries as the system runs. How can we detect issues
> arising from either updating the struct page or making incorrect logical
> judgments based on information retrieved from the struct page?
> 
> After all, when we see this warning, we don't know when or if a problem will
> occur in the future. It's like a time bomb in the system, isn't it? Therefore,
> I would like to add a warning check to the memory allocation place, for
> example: 
> 
>   WARN_ON(!IS_ALIGNED((unsigned long)&folio->page, folio_size / sizeof(struct page)));

I don't think it is needed. Any compound page usage would trigger the
problem. It should happen pretty early.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
